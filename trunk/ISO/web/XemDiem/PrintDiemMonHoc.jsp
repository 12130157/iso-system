<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.SoDiemMonHocDAO"%><pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="0,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />

<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/mask_ngang.gif" 
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>

<pd4ml:footer 
       titleTemplate="     BM02-QT7.5.1/3 & 8.4                          Ngày hiệu lực: 15/9/2009"                 
       pageNumberTemplate="Trang $[page]/$[total]     "
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20" 
       watermarkOpacity="50"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif" 
	   watermarkBounds="0,580,500,20"	      
       fontSize="12">       
</pd4ml:footer>

<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Print Điểm Môn Học</title> 
</head>
<body onload="pageLoad()">
<div align="center">
<div class = "div_body">
<c:set var = "BaiKiemTraList" value = "sessionScope.BaiKiemTraList"/>
<c:set var = "SoDiemMonHoc" value = "sessionScope.SoDiemMonHoc"/>
<c:set var = "SoDiemMonHocSimple" value = '<%=SoDiemMonHocDAO.getSoDiemMonHocByMaMonHocTKBSimple(request.getParameter("maMonHocTKB")) %>' />
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">	
	<tr>
		<td>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 15px;">
					<td><p style="font-weight: bold">TRƯỜNG TCN KTCN HÙNG VƯƠNG<br/>Khoa: </p></td>
					<td><p style="font-weight: bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
													 Độc lập - Tự do - Hạnh phúc</p></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 18px">BẢNG ĐIỂM MÔN HỌC</p><br /></th>
				</tr>
				<tr align="right" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td colspan="2">
						Lớp : ${SoDiemMonHocSimple.kiHieuLop } - Chuyên ngành : ${SoDiemMonHocSimple.tenChuyenNganh } - Năm học: ${SoDiemMonHocSimple.namHoc }<br/>
						Môn học : ${SoDiemMonHocSimple.tenMonHoc }  - Mã môn: <br/>
						Giáo viên: ${SoDiemMonHocSimple.tenGiaoVien }
					</td>
				</tr>
			</table>
			<table width = "900" border = "1" align="center" style="background-color: transparent; background-position: top;">
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">STT</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Mã Sinh Viên</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Tên sinh viên</div></th>
					<c:set var = "BaiKiemTraList" value = "<%=baiKiemTraList %>" scope="session"/>
					<c:forEach var = "BaiKiemTra" items = "${BaiKiemTraList}">
						<%count++; count1++; %>
						<c:set var = "count" value = "<%=count %>"/>
						<c:if test = "${(BaiKiemTra.maTenBaiKiemTra ne BaiKiemTraList[count].maTenBaiKiemTra and not empty BaiKiemTraList[count]) or empty  BaiKiemTraList[count]}">
							<th bgcolor = "#186fb2" colspan="<%=count1 %>"><div class = "div_textWhite">${BaiKiemTra.tenBaiKiemTra}</div></th>
							<%count1 = 0;%>
						</c:if>
					</c:forEach>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">TB môn</div></th>		
				</tr>
				<tr style="background-color: transparent;">
				<%count = 0; count1 = 0;%>
					<c:forEach var = "BaiKiemTra" items = "${BaiKiemTraList}">
						<%count++; count1++;%>
						<c:set var = "count" value = "<%=count %>"/>
						<td>Lần <%=count1 %></td>
						<c:if test = "${(BaiKiemTra.maTenBaiKiemTra ne BaiKiemTraList[count].maTenBaiKiemTra and not empty BaiKiemTraList[count]) or empty  BaiKiemTraList[count]}">
							 <%count1 = 0; %>
						</c:if>
					</c:forEach>			
				</tr>
				<%int c = 1, iterator = 0;%>
				<c:set var = "MaTenBaiKiemTra" value = "-1"/>
				<c:forEach var = "SinhVien" items="${SoDiemMonHoc.dangKyMonHocList}">
					<c:set var = "ListDiem" value = "${SinhVien.chiTietDiemList}"/>
					<c:set var = "i" value = "0"/>
					<tr style="background-color: transparent;">
						<td style="background-color: transparent;">
							<%= c %>
							<input type="hidden" name = "txtDangKiMonHoc<%=c%>" value = "${SinhVien.maDangKyMonHoc}"/>
						</td>
						<td style="background-color: transparent;"><div class = "div_txleft">${SinhVien.tenDangNhap}</div></td>
						<td style="background-color: transparent;"><div class = "div_txleft">${SinhVien.tenHocVien}</div></td>
						<c:forEach var = "BaiKiemTra" items="${BaiKiemTraList}">
							
							<td style="background-color: transparent;">
								
								<input type="text"  name= "txtDiem<%=c%>_<%=iterator %>" id = "txtDiem<%=c%>_<%=iterator %>" onblur = "kiemTraSo(<%=c + "," + iterator %>)" onfocus="getSoDiem(<%=c + "," + iterator %>)"
									<c:if test="${ListDiem[i].diem ne '-1.0'}">
										value = "${ListDiem[i].diem}"	
									</c:if>
								size="5"/>	
								<c:set var = "i" value = "${i + 1}"/>
								<c:set var = "MaTenBaiKiemTra" value = "${BaiKiemTra.maTenBaiKiemTra}"/>
								<input type = "hidden" id = "txtMaTenBaiKiemTra<%=c %>" value = "${MaTenBaiKiemTra }"/>	
								 		
							</td>
							
							<%iterator++; %>
							
						</c:forEach>
						<td style="background-color: transparent;">
							<input type="text" readonly="readonly" id = "txtTrungBinhMon<%=c %>" name = "txtTrungBinhMon<%=c %>" value = "${SinhVien.diemTrungBinh}" size="5"/>
						</td>
					</tr>
					<%c++; iterator = 0; %>
				</c:forEach>
			</table>			
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr style="background-color: transparent; font-size: 16px;">
					<td></td>
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
					<td><p style="font-weight: bold"></td>
					<td><p style="font-weight: bold"></td>
				</tr>
			</table>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</td>
	</tr>	
</table>
</div>
</div>
</body>
</html>
</pd4ml:transform>