<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="30,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"  
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM02-QT7.5.1/3 & 8.4                     Ngày hiệu lực: 15/9/2009"
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,580,500,20"	      
       fontSize="14">       
</pd4ml:footer>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Print Thoi Khoa Bieu</title> 

</head>
<div align="center">
<div class = "div_body">
<c:set var="TKB" value="${sessionScope.ThoiKhoaBieu}"></c:set>
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">	
	<tr>
		<td>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 15px;">
					<td><p style="font-weight: bold">TRƯỜNG TCN KTCN HÙNG VƯƠNG<br/>Khoa ${TKB.tenKhoa}</p></td>
					<td><p style="font-weight: bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
													 Độc lập - Tự do - Hạnh phúc</p></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 18px">THỜI KHÓA BIỂU HỌC KỲ ${TKB.hocKi }  - NĂM HỌC ${TKB.nam1}-${TKB.nam2}</p><br /></th>
				</tr>
				<tr align="right" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td colspan="2">
						Lớp : ${TKB.kiHieuLop} - Chuyên ngành : ${TKB.tenChuyenNganh}<br/>
						Tuần lễ thứ ${TKB.tuanBatDau} đến tuần lễ thứ ${TKB.tuanKetThuc}<br/>
						Từ ngày ${TKB.ngayBatDau} đến ngày ${TKB.ngayKetThuc}
					</td>
				</tr>
				</table>
				<table width = "900" border = "1" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td width="9%"><strong>BUỔI</strong></td>
					<td width="13%"><strong>HAI</strong></td>
					<td width="13%"><strong>BA</strong></td>
					<td width="13%"><strong>TƯ</strong></td>
					<td width="13%"><strong>NĂM</strong></td>
					<td width="13%"><strong>SÁU</strong></td>
					<td width="13%"><strong>BẢY</strong></td>
					<td width="13%"><strong>CN</strong></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;  font-size: 16px;" valign="top">
					<td><strong>Sáng <br /> 7:30 - 11:30</strong></td>
					<c:forEach var = "Thu" begin = "1" end="7">
						<td><p>
						<c:forEach var = "MonHocTKB" items="${TKB.monHocTKBModelList}">
						<br/>
								<c:set var = "check" value = "0"></c:set>
								<c:forEach var = "String1" items="${sf:splitString2(MonHocTKB.chuoiThuTrongTuan)}">
									<c:set var = "String2" value = "${sf:splitString3(String1)}"></c:set>
									<c:if test="${String2[0] eq 'Sáng'}">
										<c:if test="${String2[1] eq Thu}">
											<c:set var = "check" value = "${check + 1}"></c:set>
											<c:if test = "${check eq 1}">
												<font style = "font-weight: bold;">${MonHocTKB.tenMonHoc}</font><br/>
												${MonHocTKB.tenGiaoVien}<br/>
											</c:if>	
											<c:choose>
												<c:when test="${String2[2] eq 'LT'}">
													${sf:changeString(MonHocTKB.ngayBatDauLT)}-${sf:changeString(MonHocTKB.ngayKetThucLT)}<br/>
													Phòng ${MonHocTKB.chuoiPhongLT}<br/>
													
												</c:when>
												<c:otherwise>
													${sf:changeString(MonHocTKB.ngayBatDauTH)}-${sf:changeString(MonHocTKB.ngayKetThucTH)}<br/>
													Phòng ${MonHocTKB.chuoiPhongTH}<br/>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:if>
								</c:forEach>
								<c:if test = "${check ge 1}">
									${MonHocTKB.ghiChu}
									<br/>
								</c:if>
						</c:forEach>
						</p>	
						</td>
					</c:forEach>	
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;" valign="top">
					<td><strong>Chiều <br /> 13:00 - 17:15</strong></td>
					<c:forEach var = "Thu" begin = "1" end="7">
					<td><p>
						<c:forEach var = "MonHocTKB" items="${TKB.monHocTKBModelList}">
						<br/>
								<c:set var = "check" value = "0"/>
								<c:forEach var = "String1" items="${sf:splitString2(MonHocTKB.chuoiThuTrongTuan)}">
									<c:set var = "String2" value = "${sf:splitString3(String1)}"></c:set>
									<c:if test="${String2[0] eq 'Chiều'}">
										<c:if test="${String2[1] eq Thu}">
											<c:set var = "check" value = "${check + 1}"/>
											<c:if test = "${check eq 1}">
												<font style = "font-weight: bold;">${MonHocTKB.tenMonHoc}</font><br/>
												${MonHocTKB.tenGiaoVien}<br/>
											</c:if>
											<c:choose>
												<c:when test="${String2[2] eq 'LT'}">
													${sf:changeString(MonHocTKB.ngayBatDauLT)}-${sf:changeString(MonHocTKB.ngayKetThucLT)}<br/>
													Phòng ${MonHocTKB.chuoiPhongLT}<br/>
													
												</c:when>
												<c:otherwise>
													${sf:changeString(MonHocTKB.ngayBatDauTH)}-${sf:changeString(MonHocTKB.ngayKetThucTH)}<br/>
													Phòng ${MonHocTKB.chuoiPhongLT}<br/>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:if>
								</c:forEach>
								<c:if test = "${check ge 1}">
									${MonHocTKB.ghiChu}
									<br/>
								</c:if>
						</c:forEach>
						</p>	
						</td>
					</c:forEach>
				</tr>
			</table>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr style="background-color: transparent; font-size: 16px;">
					<td>Phòng học lý thuyết </td>
				</tr>
			</table>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td><p style="font-weight: bold">Ban Giám hiệu </td>
					<td><p style="font-weight: bold">Trưởng khoa CNTT</td>
				</tr>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td><p style="font-weight: bold">${TKB.tenNguoiDuyet}</td>
					<td><p style="font-weight: bold">${TKB.tenNguoiTao}</td>
				</tr>
			</table>
		</td>
	</tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>