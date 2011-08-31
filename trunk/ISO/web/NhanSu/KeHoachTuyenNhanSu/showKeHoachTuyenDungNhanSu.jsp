<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>


<%@page import="vn.edu.hungvuongaptech.dao.KeHoachTuyenNhanSuDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<script>
	function submitFormSearch(){
		document.getElementById("action").value = "search";
		document.forms["dsKeHoachTNS"].submit();
	}
</script>
<title>Xem Kế Hoạch Tuyển Nhân Sự</title>
</head>
<body>
<div class = "div_pagebody">	
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	<font>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "Hieu_Truong" value = '<%= Constant.HIEU_TRUONG %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>

	<c:choose>
		<c:when test="${not empty param.msg}">
			<c:set var="listKeHoach" value='<%=KeHoachTuyenNhanSuDAO.getAllKeHoach(session.getAttribute("maBoPhan").toString(),session.getAttribute("maThanhVien").toString(),request.getParameter("msg")) %>' ></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="listKeHoach" value='<%=KeHoachTuyenNhanSuDAO.getAllKeHoach(session.getAttribute("maBoPhan").toString(),session.getAttribute("maThanhVien").toString(),"") %>' ></c:set>
		</c:otherwise>
	</c:choose>
	
		<form name="dsKeHoachTNS" action="<%=request.getContextPath() %>/keHoachTuyenNhanSuController" method="post">	
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td><div class = "div_tieude"><strong>Kế Hoạch Tuyển Nhân Sự</strong></div><br /><br /></td>
				</tr>
			</table>
			<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">	
					<td colspan = "6">	
						<div class = "div_tinhtrang">Tình trạng :	
							<select name = "selectTinhTrang">	
								<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if>>All</option>
								<c:if test="${MaBoPhan eq BO_PHAN_PHC}">
									<option value = "0" <c:if test = "${param.msg eq '0'}">selected</c:if>>New</option>
								</c:if>	
								<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Approve</option>
							</select>
							<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
						</div>
					</td>				
				</tr>
			</table>
			<table border="1" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Tên kế hoạch</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Người lập</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Ngày lập</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Approve</div>
					<input type = "checkbox" name = "checkApprove" disabled /></th>
				</tr>					
				
				<c:forEach var="model" items="${listKeHoach}">
					<tr style="background-color: transparent;">
						<td height="30px">
							<a href="<%=request.getContextPath() %>/NhanSu/KeHoachTuyenNhanSu/KeHoachTuyenNhanSu.jsp?id=${model.id}">
								KẾ HOẠCH TUYỂN NHÂN SỰ ${model.nam}
								<c:if test="${model.bo_sung ne '0'}"> 
									<br/>(Bổ Sung Lần ${model.bo_sung })
								</c:if>
							</a>
								<c:if test="${model.tinh_trang eq '0'}">
									<br/><font color="red" style="font-style: italic;">***Chưa Gửi***</font>
								</c:if>
							
						</td>
						<td>${model.ten_nguoi_lap_ke_hoach }</td>
						<td>${model.ngay_lap_ke_hoach_dmy }</td>
						<th><input type="radio" 
							<c:if test="${model.tinh_trang eq '1'}">
								checked
							</c:if>
						disabled="disabled" /></th>
					</tr>
				</c:forEach>				

		</table>
		<c:if test="${MaBoPhan eq BO_PHAN_PHC}">
			<a href="../KeHoachTuyenNhanSu/KeHoachTuyenNhanSu.jsp?Them=yes">
				<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
			</a>
		</c:if>
		<input type="hidden" name="action" id="action" />
	</form>		
</font>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>