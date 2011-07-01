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
<style>
	.table1 td{
		text-align: left;
	}
</style>
	

</head>
<body onload=" selectTuan();selectNam();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<form>
		<div>
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Cập Nhật Thiết Bị</div>
				</td>
			</tr>
		</table>				
				
				<table class="table1" width="600px">
					<tr><td style="text-align:right">Tên thiết bị</td><td><input type="text" name="txtTenThietBi" id="txtTenThietBi"/></td></tr>
					<tr><td style="text-align:right">Khoa</td><td><select><option>--Chọn--</option></select></td></tr> 
					<tr><td style="text-align:right">Phòng</td><td><select><option>--Chọn--</option></select></td></tr> 
					<tr><td style="text-align:right">Nhà cung cấp</td><td><select><option>--Chọn--</option></select></td></tr> 
					<tr><td style="text-align:right">Ngày sản xuất</td><td><input type = "text" id="txtCalendar1" size = 8 name="txtCalendar1" style="background-color: transparent;"/></td></tr> 
					<tr><td style="text-align:right">Ngày mua</td><td><input type = "text" id="txtCalendar2" size = 8 name="txtCalendar2" style="background-color: transparent;"/></td></tr> 
					<tr><td style="text-align:right">Ngày bảo hành</td><td><input type = "text" id="txtCalendar3" size = 8 name="txtCalendar3" style="background-color: transparent;"/></td></tr> 
					<tr><td style="text-align:right">Đơn vị tính</td><td><select><option>--Chọn--</option></select></td></tr> 
					<tr><td style="text-align:right">Tần suất tối đa</td><td><input type="text" /></td></tr> 
					<tr><td style="text-align:right">Đơn vị tần suất</td><td><select><option>--Chọn--</option></select></td></tr> 
					<tr><td style="text-align:right">Giá mua</td><td><input type="text" /></td></tr> 
					<tr><td style="text-align:right">Phụ kiện</td><td><textarea rows="5" cols="20"></textarea></td></tr> 
					<tr><td style="text-align:right">Nguyên tắc sử dụng</td><td><textarea rows="5" cols="20"></textarea></td></tr> 
					<tr><td style="text-align:right">Đặc tính kĩ thuật</td><td><textarea rows="5" cols="20"></textarea></td></tr> 
					<tr><td style="text-align:right">Số lượng</td><td><input type="text"/></td></tr>
				</table>
				<br/>
				<br/>
				<p style="font-weight:bold">Khai báo các phụ kiện cần sửa chữa,thay thế</p>
				
				<table border="1">
					<tr style="color:white;background-color: #186fb2"><th></th><th>Tên linh kiện</th><th>Nhà cung cấp</th><th>Dung lượng</th><th>Ghi chú</th></tr>
					<tr><td><input type="checkbox" /></td><td><input type="text"/></td><td><select><option>--Chọn--</option></select></td><td><input type="text"/></td><td><textarea rows="3" cols="10"></textarea></td></tr>
					<tr><td colspan="5"><input type="button" value="Thêm dòng"/> <input type="button" value="Xóa dòng"/></td></tr>
			
				</table>
							<br/><input type="button" value="Cập nhật"/>
		</div>
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>