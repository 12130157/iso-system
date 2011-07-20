<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>

<html xmlns="http://www.w3.org/1999/xhtml">
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
<title>CHấm Dứt Hợp Đồng Làm Việc</title>
</head>
<body>
<div class = "div_pagebody">	
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	<font>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "admin" value = '<%= Constant.ADMIN %>'></c:set>
	<c:set var = "PHONG_DAO_TAO" value = '<%= Constant.PHONG_DAO_TAO %>'> </c:set>
	<c:set var = "Hieu_Truong" value = '<%= Constant.HIEU_TRUONG %>'></c:set>
	
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_PDT" value = '<%= Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	
	<c:set var = "NEW" value = '<%= Constant.TINHTRANG_NEW %>'></c:set>
	<c:set var = "SEND" value = '<%= Constant.TINHTRANG_SEND %>'> </c:set>
	<c:set var = "APPROVE" value = '<%= Constant.TINHTRANG_APPROVE %>'> </c:set>
	<c:set var = "REJECT" value = '<%= Constant.TINHTRANG_REJECT %>'> </c:set>
	<c:set var = "BOSUNG" value = '<%= Constant.TINHTRANG_BO_SUNG %>'></c:set>
	<c:choose>			
		<c:when test = "${empty param.msg}">
			<c:set var = "PhanLoai" value = "All" ></c:set>
		</c:when>
		<c:otherwise>
			<c:set var = "PhanLoai" value = "${param.msg}" ></c:set>		
		</c:otherwise>
	</c:choose>
	<form name="" action="" method="post">	
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>CHấm Dứt Hợp Đồng Làm Việc</strong></div><br /><br /></td>
			</tr>
		</table>		
			<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">	
					<td colspan = "6">	
						<div class = "div_tinhtrang">Tình trạng :	
							<select name = "selectTinhTrang">	
								<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if> >All</option>
							<c:if test="${MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_ADMIN}">
								<option value = "0" <c:if test = "${param.msg eq '0'}">selected</c:if> >New</option>
							</c:if>	
								<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Pending</option>
								<option value = "2" <c:if test = "${param.msg eq '2'}">selected</c:if>>Approve</option>
								<option value = "3" <c:if test = "${param.msg eq '3'}">selected</c:if>>Reject</option>
							</select>
							<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
						</div>
					</td>				
				</tr>
			</table>
		</form>
		<form name = "" action = "" method = "post">
			<table border="1" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = '#186fb2'><div class = "">Tên đề nghị</div></th>
					<th bgcolor = '#186fb2'><div class = "">Người lập</div></th>
					<th bgcolor = '#186fb2'><div class = "">Ngày lập</div></th>
					<th bgcolor = '#186fb2'><div class = "">Approve</div>
	<!-- Trường hợp 'All', 'Approve', 'Reject' thì diasble checkbox Approve -->
					<input type = "checkbox" name = "checkApprove" 
							<c:if test = "${PhanLoai ne SEND or (MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN)}">disabled</c:if> 
							onclick="checkApproveAll();"/></th>
					<th bgcolor = '#186fb2'><div class = "">Reject</div>
	<!-- Trường hợp 'All', 'Approve', 'Reject' thì diasble checkbox Approve -->
					<input type = "checkbox" name = "checkReject"
							<c:if test = "${PhanLoai ne SEND or (MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN)}">disabled</c:if>
							 onclick="checkRejectAll();"/></th>
					<th bgcolor = '#186fb2'><div class = "">Lý do Reject</div></th>
				</tr>
				
				<tr style="background-color: transparent;">
					<td colspan="6"></td>
				</tr> 				
				<tr style="background-color: transparent;">
					<td colspan="6">					
						<a href="../ChamDutHopDongLamViec/ChamDutHopDongLamViec.jsp">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
						</a>					
						<a href = "javascript: confirmDuyet()">
							<img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="lưu" border = "0"/>
						</a>						
					</td>
				</tr>
		</table>
	</form>		
</font>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>