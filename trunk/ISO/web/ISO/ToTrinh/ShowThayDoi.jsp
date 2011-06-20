<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBThayDoiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocTKBThayDoiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietTKBThayDoiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBThayDoiDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
<%
	String maThanhVien = (String) request.getSession().getAttribute("maThanhVien");
%>
</script>
</head>
<body>
	<p align="center"><strong><font size="5">Thay đổi</font></strong></p><br /><br />
	<c:set var = "MonHocTKBThayDoiList" value = "<%=MonHocTKBThayDoiDAO.getThayDoiMonHocTKBByMaNguoiTaoAndTinhTrangNew(maThanhVien) %>"/>
	<c:set var = "ChiTietTKBThayDoiList" value = "<%=ChiTietTKBThayDoiDAO.getChiTietTKBThayDoiByMaNguoiTaoAndTinhTrangNew(maThanhVien) %>" />
	<table>
		<c:forEach var = "MonHocTKBThayDoi" items = "${MonHocTKBThayDoiList}">
				<tr style="background-color: transparent;">
					<td>Môn học ${MonHocTKBThayDoi.tenMonHoc } do giáo viên ${MonHocTKBThayDoi.tenGiaoVien } phân công lại cho giáo viên ${MonHocTKBThayDoi.tenGiaoVienThayDoi }</td>
				</tr>
		</c:forEach>
		<c:forEach var = "ChiTietTKBThayDoi" items = "${ChiTietTKBThayDoiList}">
			<tr style="background-color: transparent;">
				<td>Thay đổi buổi học ngày ${ChiTietTKBThayDoi.ngayHoc } buổi ${ChiTietTKBThayDoi.buoi } của môn ${ChiTietTKBThayDoi.tenMonHoc } thành ngày ${ChiTietTKBThayDoi.ngayHocThayDoi } buổi ${ChiTietTKBThayDoi.buoiThayDoi }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>