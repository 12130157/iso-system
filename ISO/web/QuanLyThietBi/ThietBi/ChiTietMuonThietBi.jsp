<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->

<c:set var="ChiTietPhieuMuon" value = '<%= PhieuMuonThietBiDAO.XemChiTietPhieuMuonByMaPhieuMuon(request.getParameter("maPhieuMuon")) %>' scope="session"></c:set>
	
	<% int c = 1; %>
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formDanhSachMuon" id = "formDanhSachMuon" method="post">
		<div>
		<input type="hidden" id="actionType" value="tinhtrang" name = "actionType"/>
		
		<table>
			<input type = "hidden" name = "id" value="<%=request.getParameter("maPhieuMuon") %>" />
			<tr style="background-color: transparent;">
				<td colspan="5">
					<div class = "div_thanhvientieude">Bạn Đang Xem Thông Tin Chi Tiết Của ${ChiTietPhieuMuon.tenThietBi} </div>
				</td>
			</tr>				
			<table border="1">	
				<tr>
					
					<td style='background-color: #186fb2;color:white'>Mã Thiết Bị</td>
					<td style='background-color: #186fb2;color:white'>Tên Thiết Bị</td>					
					<td style='background-color: #186fb2;color:white'>Số Lượng</td>
					<td style='background-color: #186fb2;color:white'>Tình Trạng</td>				
					<td style='background-color: #186fb2;color:white'>Ghi Chú</td>
				</tr>
				<tr>
					<td>${ChiTietPhieuMuon.maThietBi}</td>
					<td>${ChiTietPhieuMuon.tenThietBi}</td>
					<td>${ChiTietPhieuMuon.soLuong}</td>
					<td>${ChiTietPhieuMuon.tinhTrang}</td>
					<td>${ChiTietPhieuMuon.ghiChu}</td>					
				</tr>
			</table>
			
			<br/>
			
		</div>
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>