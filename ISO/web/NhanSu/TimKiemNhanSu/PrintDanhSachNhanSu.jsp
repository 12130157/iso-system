<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><pd4ml:transform
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
       titleTemplate="     BM05-QT7.3/1               Ngày hiệu lực: 15/9/2009"
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
<%@page import="java.io.PrintWriter"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Danh Sách Nhân Sự</title> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="listNS" value="${sessionScope.listNS}"></c:set>
<table width="700" height="600" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');background-position: center;">
	<tr align="center" style="background-color: transparent; font-size: 25px;">
		<td>
			<p style="font-weight: bold">DANH SÁCH NHÂN SỰ</p>
		</td>
	</tr>
	<tr><td>
	<table width = "650" border="1" align="center" style="background-color: transparent; background-position: top;margin-bottom: 300px;">
		<tr>
			<th style="width: 20px;font-weight: bold;font-size: 16px;">Stt</th>
			<th style="width: 150px;font-weight: bold;font-size: 16px;">Họ tên</th>
			<th style="width: 100px;font-weight: bold;font-size: 16px;">Ngày sinh</th>
			<th style="width: 200px;font-weight: bold;font-size: 16px;">Email</th>
			<th style="width: 100px;font-weight: bold;font-size: 16px;">Bộ phận</th>
			<th style="width: 80px;font-weight: bold;font-size: 16px;">Vai trò</th>
		</tr>
		<c:set var="n" value="1" />
		<c:forEach items="${listNS}" var="model">
			<tr style="background-color: transparent;">
				<td style="text-align:center;width: 20px;height:50px;">${n }</td>
				<td style="text-align: left;padding-left: 5px;width: 150px">${model.sHoTen }</td>
				<td style="text-align:center;width: 100px;">${model.sNgaySinh }</td>
				<td style="text-align: left;padding-left: 5px;width: 200px;">${model.sEmail }</td>
				<td style="text-align:center;width: 100px;">${model.sBoPhan }</td>
				<td style="text-align:center;width: 80px;">${model.sVaiTro }</td>
			</tr>
			<c:set var="n" value="${n+1}" />
		</c:forEach>
	</table>
	</td></tr>
</table>
</div>
</div>
</html>
</pd4ml:transform>