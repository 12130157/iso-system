<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>


<%@page import="vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<title>Danh Sách Hồ Sơ Dự Tuyển</title>
<script language="javascript" type="text/javascript">
	function submit(){
		document.forms['HoSoDuTuyen'].submit();
	}
	
	function duyetSubmit(id){
		var soLuong = parseInt(document.getElementById("soLuong"+id).value);
		var soLuongDaTuyen = parseInt(document.getElementById("soLuongDaTuyen"+id).value);
		var tenVaiTro = document.getElementById("tenVaiTro"+id).value;
		var tenBoPhan = document.getElementById("tenBoPhan"+id).value;
		
		if(soLuongDaTuyen>=soLuong){
			if(confirm("Vị trí "+tenVaiTro+" thuộc bộ phận "+tenBoPhan+" đã tuyển đủ chỉ tiêu .\nBạn có chắc chắn muốn tuyển thêm không ?")){
				document.getElementById("id").value = id;
				document.getElementById("action").value = 'approve';
				submit();
			}
		}else{
			if(confirm("Bạn có chắc chắn muốn xét tuyển Người này ?")){
				document.getElementById("id").value = id;
				document.getElementById("action").value = 'approve';
				submit();
			}		
		}
	}
	
	function submitFormSearch(){
		document.getElementById("action").value = 'search';
		submit();
	}
</script>
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
	<c:choose>
		<c:when test="${requestScope.listHSDT ne null}">
			<c:set var="listHSDT" value="${requestScope.listHSDT}"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="listHSDT" value='<%=HoSoDuTuyenDAO.getAllHoSo() %>'></c:set>
		</c:otherwise>
	</c:choose>
	
		<form name="HoSoDuTuyen" action="<%=request.getContextPath() %>/hoSoDuTuyenController" method="post">	
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td><div class = "div_tieude"><strong>Hồ Sơ Dự Tuyển</strong></div><br /><br /></td>
				</tr>
			</table>
			<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">	
					<td colspan = "6">	
						<div class = "div_tinhtrang">Tình trạng :	
							<select name = "selectTinhTrang">	
								<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if>>Tất Cả</option>
								<c:if test="${MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN}">
									<option value = "0" <c:if test = "${param.msg eq '0'}">selected</c:if>>Mới</option>
								</c:if>	
								<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Đạt</option>
								<option value = "2" <c:if test = "${param.msg eq '2'}">selected</c:if>>Loại</option>
								<option value = "3" <c:if test = "${param.msg eq '3'}">selected</c:if>>Đề Nghị Khoán Thử Việc</option>
								<option value = "4" <c:if test = "${param.msg eq '4'}">selected</c:if>>Đang Thử Việc</option>
								<option value = "5" <c:if test = "${param.msg eq '5'}">selected</c:if>>Đề Nghị Ký Hợp Đồng</option>
								<option value = "6" <c:if test = "${param.msg eq '6'}">selected</c:if>>Đang Ký Hợp Đồng Lần Đầu</option>
								<option value = "7" <c:if test = "${param.msg eq '7'}">selected</c:if>>Nhân Viên Chính Thức</option>
							</select>
							<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
						</div>
					</td>				
				</tr>
			</table>
			<table border="1" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = '#186fb2' style="width:50px;"><div class = "div_txtintable1">Stt</div></th>
					<th bgcolor = '#186fb2' style="width:150px;"><div class = "div_txtintable1">Họ & Tên</div></th>
					<th bgcolor = '#186fb2' style="width:50px;"><div class = "div_txtintable1">Giới Tính</div></th>
					<th bgcolor = '#186fb2' style="width:100px;"><div class = "div_txtintable1">Email</div></th>
					<th bgcolor = '#186fb2' style="width:100px;"><div class = "div_txtintable1">Điện Thoại</div></th>
					<th bgcolor = '#186fb2' style="width:100px;"><div class = "div_txtintable1">Vị Trí Dự Tuyển</div></th>
					<th bgcolor = '#186fb2' style="width:100px;"><div class = "div_txtintable1">Bộ Phận</div></th>
					<th bgcolor = '#186fb2' style="width:100px;"><div class = "div_txtintable1">Tình Trạng</div></th>
				</tr>
				<c:set var="n" value="1"></c:set>
				<c:forEach var="model" items="${listHSDT}">
					<tr>
						<td rowspan="2">
							${n }
								<input type="hidden" id="soLuong${model.id}" name="soLuong${model.id}" value="${model.so_luong }" />
								<input type="hidden" id="soLuongDaTuyen${model.id}" name="soLuongDaTuyen${model.id}" value="${model.so_luong_da_tuyen }" />
								<input type="hidden" id="tenVaiTro${model.id}" name="tenVaiTro${model.id}" value="${model.ten_vai_tro }" />
								<input type="hidden" id="tenBoPhan${model.id}" name="tenBoPhan${model.id}" value="${model.ten_bo_phan }" />
						</td>
						<td>
							<a href="<%=request.getContextPath() %>/NhanSu/HoSoDuTuyen/HoSoDuTuyen.jsp?id=${model.id }">
								${model.ho_ten }
							</a>
						</td>
						<td>${model.gioi_tinh }</td>
						<td>${model.email }</td>
						<td>${model.dien_thoai_dd }</td>
						<td>${model.ten_vai_tro }</td>
						<td>${model.ten_bo_phan }</td>
						<td style="text-align: center;width: 120px;" rowspan="2">
							<c:choose>
								<c:when test="${model.tinh_trang eq '0' and MaBoPhan eq BO_PHAN_ADMIN or model.tinh_trang eq '0' and MaBoPhan eq BO_PHAN_BGH or model.tinh_trang eq '0' and MaBoPhan eq BO_PHAN_PHC or model.tinh_trang eq '0' and MaBoPhan eq BO_PHAN_PDT}">
									<a href="javascript: duyetSubmit(${model.id })">
										<img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Duyệt" border = "0" style="margin: 20px;"/>
									</a>
								</c:when>
								<c:when test="${model.tinh_trang eq '0'}">
									<font color="red" style="font-style: italic;font-weight: bold;">***New***</font>
								</c:when>
								<c:when test="${model.tinh_trang eq '1'}">
									Pass
								</c:when>
								<c:when test="${model.tinh_trang eq '2'}">
									Fail
								</c:when>
								<c:when test="${model.tinh_trang eq '3'}">
									Đang Đề Nghị Khoán Thử Việc
								</c:when>
								<c:when test="${model.tinh_trang eq '4'}">
									Đang Thử Việc
								</c:when>
								<c:when test="${model.tinh_trang eq '5'}">
									Đề Nghị Ký Hợp Đồng
								</c:when>
								<c:when test="${model.tinh_trang eq '6'}">
									Đang Ký Hợp Đồng Lần Đầu
								</c:when>
								<c:when test="${model.tinh_trang eq '7'}">
									Nhân Viên Chính Thức
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<textarea name="txtGhiChu${model.id }" <c:if test="${model.tinh_trang ne '0' }">disabled</c:if> id="txtGhiChu" rows="1" cols="70"></textarea>
						</td>
					</tr>
					
					<c:set var="n" value="${n+1}"></c:set>
				</c:forEach>
		</table>
		<input type="hidden" id="id" name="id" />
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