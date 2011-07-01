<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.NhaCungCapDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TaiKhoanDAO"%><html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/QuanLyThietBi/css/NhaCungCap_Style.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/QuanLyThietBi/js/NhaCungCap_Script.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Hệ Thống Quản Lý Thiết Bị</title>
<body onload=" selectTuan();selectNam();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->

	<form action="">
		<table><tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Thống Kê Tần Suất Thiết Bị</div></td></tr></table>
		<table>
			<tr style="background-color: transparent;">
				<td></td>
				<td></td>
				<td>
					<input type="text" name="txtTimKiemTheoTenThietBi" value="Tìm Kiếm Theo Tên Thiết Bị" size = "25" style="background-color: transparent;"/>
				</td>
				<td>				
					<a href = ""><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm"/></a>
				</td>
			</tr>			
			<tr style="background-color: transparent;" >				
				<td>Nhà cung cấp :</td>
				<td>
					<select>
						<option>All</option>
					</select>
				</td>
				<td>Tên Phòng Ban :</td>
				<td>
					<select>
						<option>All</option>
					</select>
				</td>
			</tr>
			<tr style="background-color: transparent;" >
				<td>Loại thiết bị :</td>
				<td>
					<select>
						<option>All</option>
					</select>
				</td>
				<td>Tình trạng thiết bị :</td>
				<td>
					<select>
						<option>All</option>
					</select>
				</td>
			</tr>
			
			</table>
			<table border="1">			
			<tr style="background-color: transparent;">				
				<td style='background-color: #186fb2;color:white'>STT</td>				
				<td style='background-color: #186fb2;color:white'>Tên Thiết Bị</td>
				<td style='background-color: #186fb2;color:white'>Loại</td>		
				<td style='background-color: #186fb2;color:white'>Tình Trạng</td>
				<td style='background-color: #186fb2;color:white'>Nhà Cung Cấp</td>										
				<td style='background-color: #186fb2;color:white'>Tần Suất Tối Đa</td>
				<td style='background-color: #186fb2;color:white'>Tần Suất Sử Dụng</td>				
				<td style='background-color: #186fb2;color:white'>Đơn Vị Tần Suất</td>
				<td style='background-color: #186fb2;color:white'>Số lần bảo trì</td>
				<td style='background-color: #186fb2;color:white'>Số máy</td>			
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="10">dữ liệu</td>
			</tr>
			
		</table>
	</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>