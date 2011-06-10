<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%><pd4ml:transform
	screenWidth="700"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="30,20,0,20,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Times New Roman" monospace="Courier New" />
<pd4ml:header 
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM04-QT7.3/1               Ngày hiệu lực: 20/8/2010"
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask1.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,820,600,20"	      
       fontSize="12">       
 </pd4ml:footer>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Đề Cương Môn Học</title> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="DeCuongMonHoc" value="${sessionScope.DeCuongMonHoc}"></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center; font-size: 12px;">
			<td><p style="font-weight: bold">Trường TCNKTCN Hùng Vương<br/>
			Khoa ${DeCuongMonHoc.tenKhoa}
			</p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<th colspan = "2"><br /> <p style="font-weight: bold">ĐỀ CƯƠNG CHI TIẾT CHƯƠNG TRÌNH MÔN HỌC</p><br /></th>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p>-Tên môn học:<font style="font-weight: bold;">${DeCuongMonHoc.tenMonHoc}</font></p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p>-Thời gian môn học:${DeCuongMonHoc.lyThuyet + DeCuongMonHoc.thucHanh + DeCuongMonHoc.kiemTra}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lý thuyết:${DeCuongMonHoc.lyThuyet}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thực hành:${DeCuongMonHoc.thucHanh}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kiểm tra:${DeCuongMonHoc.kiemTra}</p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p>-Vị trí môn học:${DeCuongMonHoc.viTriMonHoc}</p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p>Tính chất môn học:${DeCuongMonHoc.tinhChatMonHoc}</p> 
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 13px;">
			<td colspan = "2"><div class = "div_textleft">
				<p style="font-weight: bold">I./ MỤC TIÊU ĐÀO TẠO MÔN HỌC :</p></div>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p style="font-weight: bold">1/Kiến thức chuyên môn:</p> <p> ${sf:appendPTag(DeCuongMonHoc.mucTieu1)} </p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p style="font-weight: bold">2/Kỹ năng nghề:</p> <p> ${sf:appendPTag(DeCuongMonHoc.mucTieu2)} </p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p style="font-weight: bold">3/Thái độ lao động:</p> <p> ${sf:appendPTag(DeCuongMonHoc.mucTieu3)} </p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p style="font-weight: bold">4/Các kỹ năng cần thiết khác: </p> <p> ${sf:appendPTag(DeCuongMonHoc.mucTieu4)} </p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 13px;">
			<td colspan = "2"><div class = "div_textleft">
				<p style="font-weight: bold">II./ TỔNG QUÁT VỀ CHƯƠNG TRÌNH :</p></div>
			</td>
		</tr>
		<tr style="background-color: transparent; font-size: 13px;">
			<td colspan = "2"><div class = "div_textleft">
				<p style="font-weight: bold">1/Điều kiện thực hiện môn học</p></div>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<u>Máy móc, trang thiết bị, công cụ :</u> ${sf:appendPTag(DeCuongMonHoc.dieuKien1)}
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<u>Nguyên vật liệu thực hành :</u>${sf:appendPTag(DeCuongMonHoc.dieuKien2)}
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<u>Phương tiện giảng dạy :</u>${sf:appendPTag(DeCuongMonHoc.dieuKien3)}
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<u>Phiếu hướng dẫn thực hiện (môn thực hành) :</u>${sf:appendPTag(DeCuongMonHoc.dieuKien4)}
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<p style="font-weight: bold">2/Phương pháp và nội dung đánh giá :</p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<u>Lý thuyết :</u>${sf:appendPTag(DeCuongMonHoc.phuongPhap1)}
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<u>Thực hành :</u>${sf:appendPTag(DeCuongMonHoc.phuongPhap2)}
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 13px;">
				<td colspan = "2">
					<u>Nội dung :</u>${sf:appendPTag(DeCuongMonHoc.phuongPhap3)}
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 13px;">
			<td colspan = "2"><div class = "div_textleft">
				<p style="font-weight: bold">III./ PHÂN PHỐI CHƯƠNG TRÌNH MÔN HỌC:</p></div>
			</td>
		</tr>
	</table>
	<c:set var="ThoiGianMonHoc" value="${DeCuongMonHoc.lyThuyet + DeCuongMonHoc.thucHanh + DeCuongMonHoc.kiemTra}"></c:set>
			<c:set var="ThucHanh" value="0"></c:set>
			<c:set var="LyThuyet" value="0"></c:set>
			<c:set var="KiemTra" value="0"></c:set>
			<c:set var="TichHop" value="0"></c:set>
			<c:set var = "TiLe" value="0"/>
			<%int count = 1; %>	
				<c:if test="${DeCuongMonHoc.kieuBienSoan eq 1}">
					<c:set var = "TiLe" value="${sf:convertToInt(ThoiGianMonHoc/DeCuongMonHoc.lyThuyet)}"/>
				</c:if>
	<table border = "1" width = "650" align="center" style="background-color: transparent; background-position: center;" > 
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 13px">
					<td rowspan = "2">TT</td>
					<td rowspan = "2">Nội dung<br />(chương trình, bài học)</td>
					<td colspan = "7">Số tiết</td>
				</tr>
				<tr style="background-color: transparent; font-size: 13px" align="center">
					<td>Lý thuyết</td>
					<td>thực hành</td>
					<td>Tích hợp</td>
					<td>Bài tập</td>
					<td>Kiểm tra</td>
					<td>Cộng</td>
				</tr>
			
			
			<c:forEach var = "NoiDungDCMH" items="${DeCuongMonHoc.noiDungDCMHModelsList}">
				<c:if test="${NoiDungDCMH.soThuTu eq '1'}">
					<c:set var="tenChuong" value="${NoiDungDCMH.tenChuong}"></c:set>
				</c:if>
				<c:choose>
					<c:when test="${NoiDungDCMH.coHieu eq '0'}">
						<c:set var = "LyThuyet" value = "${LyThuyet + NoiDungDCMH.soTiet}"></c:set>
					</c:when>
					<c:when test="${NoiDungDCMH.coHieu eq '1'}">
						<c:set var = "ThucHanh" value = "${ThucHanh + NoiDungDCMH.soTiet}"></c:set>
					</c:when>
					<c:when test="${NoiDungDCMH.coHieu eq '4'}">
						<c:set var = "KiemTra" value = "${KiemTra + NoiDungDCMH.soTiet}"></c:set>
					</c:when>
					<c:when test="${NoiDungDCMH.coHieu eq '5'}">
						<c:set var = "TichHop" value = "${KiemTra + NoiDungDCMH.soTiet}"></c:set>
					</c:when>
				</c:choose>	
					<c:if test="${DeCuongMonHoc.kieuBienSoan eq '0' or DeCuongMonHoc.kieuBienSoan eq '2' or (DeCuongMonHoc.kieuBienSoan eq '1' and TiLe eq NoiDungDCMH.soThuTu)}">
						<tr style="background-color: transparent; font-size: 12px" align="center">
							<td><%=count %></td>
							<td style="text-align: left">${sf:appendBrTag(tenChuong)}</td>	
						<c:choose>		
							<c:when test="${LyThuyet gt '0'}">	
								<td>${LyThuyet}</td>
							</c:when>
							<c:otherwise>
								<td>-</td>
							</c:otherwise>	
						</c:choose>
						<c:choose>		
							<c:when test="${ThucHanh gt '0'}">	
								<td>${ThucHanh}</td>
							</c:when>
							<c:otherwise>
								<td>-</td>
							</c:otherwise>
						</c:choose>
						<c:choose>		
							<c:when test="${TichHop gt '0'}">	
								<td>${TichHop}</td>
							</c:when>
							<c:otherwise>
								<td>-</td>
							</c:otherwise>
						</c:choose>
							<td>-</td>
						<c:choose>		
							<c:when test="${KiemTra gt '0'}">	
								<td>${KiemTra}</td>
							</c:when>
							<c:otherwise>
								<td>-</td>
							</c:otherwise>
						</c:choose>
						<td>${LyThuyet + ThucHanh + TichHop + KiemTra}</td>
						<%count++; %>
					</tr>
				</c:if>
				<c:if test="${DeCuongMonHoc.kieuBienSoan eq '0' or DeCuongMonHoc.kieuBienSoan eq '2' or (DeCuongMonHoc.kieuBienSoan eq '1' and TiLe eq NoiDungDCMH.soThuTu)}">
					<c:set var="ThucHanh" value="0"></c:set>
					<c:set var="LyThuyet" value="0"></c:set>
					<c:set var="KiemTra" value="0"></c:set>
					<c:set var="TichHop" value="0"></c:set>
				</c:if>	
			</c:forEach>
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 13px;">
					<td>&nbsp;</td>
					<td widtd="160">TỔNG CỘNG</td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHoc.kieuBienSoan ne '2'}">
								${DeCuongMonHoc.lyThuyet}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHoc.kieuBienSoan ne '2'}">
							${DeCuongMonHoc.thucHanh}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHoc.kieuBienSoan eq '2'}">
								${DeCuongMonHoc.lyThuyet + DeCuongMonHoc.thucHanh}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose>	
					</td>
					<td>&nbsp;</td>
					<td>${DeCuongMonHoc.kiemTra}</td>
					<td>${DeCuongMonHoc.lyThuyet + DeCuongMonHoc.thucHanh + DeCuongMonHoc.kiemTra}</td>
				</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 13px;">
			<c:set var="sig" value="-"></c:set>
			<td></td>
			<td></td>
			<td>Quận 5, ngày ${sf:getElement(DeCuongMonHoc.ngayTao,0,sig)} tháng ${sf:getElement(DeCuongMonHoc.ngayTao,1,sig)} năm ${sf:getElement(DeCuongMonHoc.ngayTao,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 13px;">
			<td><p style="font-weight: bold; font-size: 13px">Hiệu Trưởng </p></td>
			<td><p style="font-weight: bold; font-size: 13px">Trưởng Khoa </p></td>
			<td><p style="font-weight: bold; font-size: 13px">Giáo viên biên soạn</p></td>
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
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 13px;">
			<td></td>
			<td><p style="font-weight: bold">${DeCuongMonHoc.tenNguoiDuyet}</p></td>
			<td><p style="font-weight: bold">${DeCuongMonHoc.tenNguoiTao}</p></td>
		</tr>
	</table>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>