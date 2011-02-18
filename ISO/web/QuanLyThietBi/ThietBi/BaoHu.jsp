<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%><html xmlns="http://www.w3.org/1999/xhtml">
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
	<br/>

	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formThietBiHu" id = "formThietBiHu" method="post">
		<div>
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách Các Thiết Bị Hư</div>
				</td>
			</tr>
		</table>
			<table border="1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2">
								<div class = "div_textWhite">
									<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"></input>
								</div>
				</th>
				<th style='background-color: #186fb2;color:white'>STT</th>
				<th style='background-color: #186fb2;color:white'>Tên thiết bị</th>
				<th style='background-color: #186fb2;color:white'>Giáo viên quản lý</th>
				<th style='background-color: #186fb2;color:white'>Ngày bắt đầu sử dụng</th>
				<th style='background-color: #186fb2;color:white'>Thời gian bảo hành</th>				
				<th style='background-color: #186fb2;color:white'>Số lần bảo trì</th>
				<th style='background-color: #186fb2;color:white'>Ngày Mua</th>				
			</tr>
			
			<% int c = 1; 
				ArrayList<ThietBiModel> thietBiList;
				if(request.getSession().getAttribute("thietBiModelList") != null)
					thietBiList = (ArrayList<ThietBiModel>)request.getSession().getAttribute("thietBiModelList");
				else
					thietBiList = ThietBiDAO.showThietBiHu();
			%>
				
				<c:set var="listThietBiHu" value="<%= thietBiList %>" scope = "session"></c:set>
					
			
			<c:forEach var="ThietBiHu" items="${listThietBiHu}">
				<tr style="background-color: transparent;">
					<td><input type="checkbox" name="chk<%=c %>" id="chk<%=c %>" onclick="checkRow();"/></td>
					<td><%=c %></td>
					<td>${ThietBiHu.tenThietBi }</td>
					<td>${ThietBiHu.hoThanhVien} ${ThietBiHu.tenLot} ${ThietBiHu.tenThanhVien}</td>
					<td>${ThietBiHu.ngayBatDauSuDung }</td>
					<td>${ThietBiHu.ngayBaoHanh }</td>
					<td>${ThietBiHu.soLanBaoTri }</td>
					<td>${ThietBiHu.ngayMua }</td>
				</tr>
				<%c++; %>
				
			</c:forEach>				
			
			<!-- Lay duong cac properties cua  link  -->
					<% String proLink=""; %>
					<c:if test="${not empty param.tenNCC}"><% proLink="&tenNCC="+request.getParameter("tenNCC"); %> </c:if>
					<c:if test="${not empty param.index}"><% proLink=proLink+"&index="+request.getParameter("index"); %> </c:if>
					
					<input type='hidden' value="<%=proLink%>" name="txtProLink" id="txtProLink"/>
			<!-- End -->
			
			</table>
			<br></br>
			<a><img src="<%=request.getContextPath()%>/images/buttom/thanhly.png" alt="Thanh lý" border = "0" /></a>
		</div>
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>