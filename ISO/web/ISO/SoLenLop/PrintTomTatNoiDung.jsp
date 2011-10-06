<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%><pd4ml:transform
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
<title>Tom tat noi dung</title> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>
<%
	MonHocTKBModel monHocTKB = (MonHocTKBModel) request.getSession().getAttribute("BangTomTatNoiDung");
	int count = 0;
%>
</head>
<div align="center">
<div class = "div_body">
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td style="width: 200px"></td>
			<td align="center">Mẫu số 3<br />Ban hành kèm theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 18px;">
			<td><div class="div_div_textleft" style="size: 12px;"><strong>BẢNG GHI TÓM TẮT NỘI DUNG</strong></div><br /><br /></td>
			<td>HỌ VÀ TÊN GIÁO VIÊN <%=monHocTKB.getTenGiaoVien() %><br/>MÔN HỌC/MÔ ĐUN <%=monHocTKB.getTenMonHoc() %></td>
		</tr>
	</table>
	<table border = "1" width = "650" align="center" style="background-color: transparent; background-position: center;">
			<tr style="background-color: transparent;" align="center">
				<td rowspan="2"><strong>NGÀY LÊN LỚP</strong></td>
				<td colspan="4"><strong>SỐ GIỜ</strong></td>
				<td rowspan="2"><strong>TÓM TẮT NỘI DUNG BÀI DẠY, KIỂM TRA</strong></td>
				<td rowspan="2"><strong>SỐ HỌC SINH/SINH VIÊN VẮNG MẶT</strong></td>
				<td rowspan="2"><strong>CHỮ KÝ GIÁO VIÊN</strong></td>
			</tr>
			<tr  style="background-color: transparent;" align="center">
				<td><strong>Lý thuyêt</strong></td>
				<td><strong>Thực hành</strong></td>
				<td><strong>Tích hợp</strong></td>
				<td><strong>Kiểm tra</strong></td>
			</tr>
			<c:forEach var = "ChiTietTKB" items = "<%=monHocTKB.getChiTietTKBModelList() %>">
				<tr style="background-color: transparent;" align="center">
					<td>${ChiTietTKB.ngayHoc }</td>
					<c:choose>
						<c:when test = "${ChiTietTKB.coHieu eq 0}"><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td><td>0</td><td>0</td></c:when>
						<c:when test = "${ChiTietTKB.coHieu eq 1}"><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td><td>0</td></c:when>
						<c:when test = "${ChiTietTKB.coHieu eq 5}"><td>0</td><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td></c:when>
						<c:otherwise><td>0</td><td>0</td><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td></c:otherwise>
					</c:choose>
					<td>${ChiTietTKB.noiDungBaiDay }</td>
					<td>${ChiTietTKB.soSVVangMat }</td>
					<td><p></p></td>
				</tr>
				<%count++; %>
			</c:forEach>
		</table>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>