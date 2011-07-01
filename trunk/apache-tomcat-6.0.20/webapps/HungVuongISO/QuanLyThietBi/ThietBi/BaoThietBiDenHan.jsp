<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Hệ Thống Quản Lý Thiết Bị</title>

	

</head>
<body onload=" selectTuan();selectNam();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/>
	<form>
		<div>
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách Các Phiếu Trả</div>
				</td>
			</tr>
		</table>
		
			<table border="1" style="background-color: :transparent;">
				
				<tr>
					<td colspan="7" style="text-align:right">
						Phiếu đến hạn <input type="checkbox"/> Trang 1 2 3 4 ...
					</td>
				</tr>

				<tr>
					<th style='background-color: #186fb2;color:white'>Check</th>
					<th style='background-color: #186fb2;color:white'>STT</th>
					<th style='background-color: #186fb2;color:white'>Số phiếu</th>
					<th style='background-color: #186fb2;color:white'>Người mượn</th>
					<th style='background-color: #186fb2;color:white'>Ngày mượn (dd/mm/yyyy)</th>
					<th style='background-color: #186fb2;color:white'>Ngày đến hạn (dd/mm/yyyy)</th>
					<th>Chi tiết</th>
				</tr>
				<tr>
					<td><input type="checkbox"/></td>
					<td>1</td>
					<td>1</td>
					<td>Tâm kute</td>
					<td>2/9/1989</td>
					<td>3/9/1989</td>
					<td><a href="">Xem</a></td>
				</tr>
				<tr>
					<td colspan="7">
						<input type="button" value="Trả"/>
					
						<input type="button" value="Gởi mail nhắc nhở"/>
					</td>
				</tr>
				<tr>
					<td colspan="7" style="text-align:right">
						Trang 1 2 3 4 ...
					</td>
				</tr>
			</table>	
		</div>
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>