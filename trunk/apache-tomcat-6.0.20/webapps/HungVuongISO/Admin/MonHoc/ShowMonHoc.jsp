<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HocPhanDAO"%><fmt:bundle basename="i18n">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp"></meta>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Môn Học</title>
</head>

<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<c:set var="MonHoc" value = '<%= MonHocDAO.showAllMonHoc()%>' scope="session"></c:set>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Danh Sách Môn Học</div></td></tr>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<c:if test="${param.err eq 'insertThatBai'}">
						<b class="error">Môn học này đã có rồi !!!</b>
					</c:if>
					<c:if test="${param.msg eq 'insertThanhCong'}">
						<b class="msg">Thêm mới thành công !!!</b>
					</c:if>
					<c:if test="${param.err eq 'updateThatBai'}">
						<b class="error">Môn học này đã có rồi !!!</b>
					</c:if>
					<c:if test="${param.msg eq 'updateThanhCong'}">
						<b class="msg">Cập nhật thành công !!!</b>
					</c:if>
				</td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên môn học</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Lý thuyết</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Thực hành</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Kiểm tra</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tính chất</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Chuyên ngành</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Học phần</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>			
			</tr>
			
			<% int c = 1; %>
			<c:set var="chuyenNganhList" value='<%= ChuyenNganhDAO.getAllChuyenNganh() %>'></c:set>
			<c:set var="hocPhanList" value='<%= HocPhanDAO.showAllHocPhan() %>'></c:set>
			<c:forEach var="monHoc"  items="${MonHoc}" >
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<td><div class = "div_textleft"> ${monHoc.tenMonHoc}</div></td>
					<td> ${monHoc.lyThuyet}</td>
					<td> ${monHoc.thucHanh}</td>
					<td> ${monHoc.kiemTra}</td>
					<td> ${monHoc.tinhChat}</td>
					<td> ${monHoc.tenChuyenNganh}</td>
					<td> ${monHoc.tenHocPhan }</td>
					<td><a href ="<%= Constant.PATH_RES.getString("Admin.XemChiTietMonHocPath") %>?maMH=${monHoc.maMonHoc}">chi tiết</a></td>
				<tr>
				<%c++; %>
			</c:forEach>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<a href="<%= Constant.PATH_RES.getString("Admin.XemChiTietMonHocPath") %>?themMoi=themMoi">
						<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
					</a>
				</td>
			</tr>
					
		</table>

		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>