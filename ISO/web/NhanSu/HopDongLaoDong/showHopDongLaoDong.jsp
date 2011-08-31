<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>


<%@page import="vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO"%>

<%@page import="vn.edu.hungvuongaptech.dao.HopDongLaoDongDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp"/>
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
<title>Xem Hợp Đồng Lao Động Lần Đầu</title>
<c:choose>
		<c:when test="${not empty param.msg}">
			<c:set var="listHopDong" value='<%=HopDongLaoDongDAO.getAllHopDongLaoDong(session.getAttribute("maBoPhan").toString(),session.getAttribute("maThanhVien").toString(),request.getParameter("msg").toString()) %>'></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="listHopDong" value='<%=HopDongLaoDongDAO.getAllHopDongLaoDong(session.getAttribute("maBoPhan").toString(),session.getAttribute("maThanhVien").toString(),"") %>'></c:set>
		</c:otherwise>
</c:choose>
<script language="javascript">
	function submitFormSearch(){
		document.getElementById("action").value = 'search';
		document.forms["dsHopDongLanDau"].submit();
	}
</script>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
</head>
<body>
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	<font>
	
	<form name="dsHopDongLanDau" action="<%=request.getContextPath() %>/hopDongLanDauController" method="post" >	
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>DANH SÁCH HỢP ĐỒNG</strong></div><br /><br /></td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">	
					<td colspan = "6">	
						<div class = "div_tinhtrang">Tình trạng :	
							<select name = "selectTinhTrang">	
								<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if>>All</option>
								<c:if test="${MaBoPhan eq BO_PHAN_ADMIN}">
									<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Sending</option>
								</c:if>
								<option value = "2" <c:if test = "${param.msg eq '3'}">selected</c:if>>Pending</option>
								<option value = "3" <c:if test = "${param.msg eq '3'}">selected</c:if>>Approve</option>
								<option value = "4" <c:if test = "${param.msg eq '4'}">selected</c:if>>Reject</option>
							</select>
							<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
						</div>
					</td>				
				</tr>
		</table>
		<table border="1" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Tên Hợp Đồng</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Người lập</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Ngày lập</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Approve</div>
					<input type = "checkbox"  disabled/></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Reject</div>
					<input type = "checkbox" disabled /></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Lý do Reject</div></th>
				</tr>
				<c:forEach var="model" items="${listHopDong}">
					<tr style="background-color: transparent;">
					<td>
						<a href="<%=request.getContextPath() %>/NhanSu/HopDongLaoDong/HopDongLaoDong.jsp?id=${model.id}&&nguoidutuyen=${model.nguoi_du_tuyen}&&vitridutuyen=${model.vi_tri_du_tuyen}">
							Hợp Đồng Lao Động<c:if test="${model.so_lan eq '0'}"> Lần Đầu </c:if><br/>${fn:toUpperCase(model.ten_nguoi_du_tuyen) }
						</a>
						<br/><c:if test="${model.tinh_trang eq '0'}"><font color="red" style="font-weight: bold;font-style: italic;">***Chưa Gửi***</font></c:if>
						</td>
					<td>${model.nguoi_lap}</td>
					<td>${model.ngay_lap_mdy }</td>
					<th bgcolor="#009fb2"><div class = ""></div>
					<input type = "radio" <c:if test="${model.tinh_trang eq '3' }">checked</c:if> disabled/></th>
					<th bgcolor="#FF0000"><div class = ""></div>
					<input type = "radio" <c:if test="${model.tinh_trang eq '4'}">checked</c:if> disabled /></th>
					<td><textarea rows="3" cols="15" readonly="readonly"><c:if test="${model.tinh_trang eq '4'}">${model.ly_do_reject }</c:if></textarea></td>
				</tr>
				</c:forEach>
		</table>
		<input type="hidden" id="action" name="action"/>
	</form>		
</font>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>