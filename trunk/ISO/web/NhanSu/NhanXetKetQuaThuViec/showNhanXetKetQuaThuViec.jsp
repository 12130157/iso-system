<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>


<%@page import="vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NhanXetKetQuaThuViecDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<title>Bảng Tự Nhận Xét Kết Qủa Thử Việc</title>
<script type="text/javascript" language="javascript">
	
	function checkMaVaiTro(){
		var nguoiDuTuyen = <%=Constant.NGUOI_DU_TUYEN %>;
		var vaiTro = <%=session.getAttribute("maVaiTro") %>;
		if(nguoiDuTuyen == vaiTro){
			submit();	
		}
	}
	
	function submit(){
		document.getElementById("action").value = "create";
		document.forms["listNhanXetKetQuaThuViec"].submit();
		
	}
	
	function submitFormSearch(){
		document.getElementById("action").value = 'search';
		document.forms["listNhanXetKetQuaThuViec"].submit();
	}
</script>
</script>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "TruongKhoa" value = '<%=Constant.MA_VAI_TRO_TK %>'></c:set>
	<c:set var = "NGUOI_DU_TUYEN" value = '<%= Constant.NGUOI_DU_TUYEN %>'></c:set>
	<c:choose>
		<c:when test="${not empty param.msg}">
			<c:set var="listNhanXetKetQuaThuViec" value='<%=NhanXetKetQuaThuViecDAO.getAllNhanXet(session.getAttribute("maBoPhan").toString(),session.getAttribute("maVaiTro").toString(),request.getParameter("msg").toString()) %>'></c:set>	
		</c:when>
		<c:otherwise>
			<c:set var="listNhanXetKetQuaThuViec" value='<%=NhanXetKetQuaThuViecDAO.getAllNhanXet(session.getAttribute("maBoPhan").toString(),session.getAttribute("maVaiTro").toString(),"") %>'></c:set>
		</c:otherwise>
	</c:choose>
</head>
<body onload="checkMaVaiTro()">
<div class = "div_pagebody">	
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	<form name="listNhanXetKetQuaThuViec" action="<%=request.getContextPath() %>/nhanXetKetQuaThuViecController" method="post">
		
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>Bảng Tự Nhận Xét Kết Qủa Thử Việc</strong></div><br /><br /></td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">	
				<td colspan = "6">	
					<div class = "div_tinhtrang">Tình trạng :	
						<select name = "selectTinhTrang">	
							<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if> >All</option>
							<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Pending</option>
							<option value = "2" <c:if test = "${param.msg eq '2'}">selected</c:if>>Approve</option>
							<option value = "3" <c:if test = "${param.msg eq '3'}">selected</c:if>>Reject</option>
						</select>
						<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
					</div>
				</td>				
			</tr>
		</table>
		<table border="1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = '#186fb2'><div class = "div_txtintable1">Tên bảng tự nhận xét kết quả</div></th>
				<th bgcolor = '#186fb2'><div class = "div_txtintable1">Người lập</div></th>
				<th bgcolor = '#186fb2'><div class = "div_txtintable1">Ngày lập</div></th>
				<th bgcolor = '#186fb2'><div class = "div_txtintable1">Approve</div>
					<input type = "checkbox" name = "checkApprove" /></th>
				<th bgcolor = '#186fb2'><div class = "div_txtintable1">Reject</div>
					<input type = "checkbox" name = "checkReject"/></th>
				<th bgcolor = '#186fb2'><div class = "div_txtintable1">Lý do Reject</div></th>
			</tr>
			<c:forEach var="model" items="${listNhanXetKetQuaThuViec}">
				<tr>
					<td>
						<a href="<%=request.getContextPath() %>/NhanSu/NhanXetKetQuaThuViec/NhanXetKetQuaThuViec.jsp?id=${model.id}">
							Tự Nhận Xét Kết Quả Thử Việc<br/>${model.ten_nguoi_nhan_xet }
						</a>
					</td>
					<td>${model.ten_nguoi_nhan_xet }</td>
					<td>${model.ngay_nhan_xet_mdy }</td>
					<td>
					<input type="radio"
						<c:if test="${model.tinh_trang eq '2'}">
							checked
						</c:if>
					 name="txtTinhTrang${model.id}" disabled="disabled"/>
				</td>
				<td>
					<input type="radio"
						<c:if test="${model.tinh_trang eq '3'}">
							checked
						</c:if>
				 	name="txtTinhTrang${model.id}" disabled="disabled"/>
				 </td>
					<td><textarea rows="3" cols="15" readonly="readonly">${model.ly_do_reject }</textarea></td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" id="action" name="action" />
</form>	
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>