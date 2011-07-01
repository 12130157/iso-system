<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.PhongBanModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><fmt:bundle basename="i18n">
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
<script type="text/javascript">
function submit(){
	var rong = /\s/g;

	var kiHieu = document.ActionPhongBan.txtKiHieu.value;
	var value = kiHieu.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập kí hiệu phòng !!!" );
	     return;
	}
	
	
	var chucNang = document.ActionPhongBan.txtChucNang.value;
	var value_2 = chucNang.replace(rong,"");
	if(value_2 == ""){
		alert("Bạn phải nhập chức năng phòng !!!" );
	    return;
	}
	
	var sucChua = document.ActionPhongBan.txtSucChua.value;
	var value_3 = sucChua.replace(rong,"");
	if(value_3 == ""  ){
		alert("Bạn phải nhập sức chứa phòng !!!" );
	    return;
	}
	
	if(isNaN(value_3)){
		alert("Bạn phải nhập sức chứa phòng là số !!!" );
	    return;
	}
	document.forms["ActionPhongBan"].submit();
}
function submitNew(){
	var rong = /\s/g;
	
	var kiHieuMoi = document.ActionPhongBan.txtKiHieuMoi.value;
	var value = kiHieuMoi.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập kí hiệu phòng !!!" );
	     return;
	}
	
	var viTriMoi = document.ActionPhongBan.txtViTriMoi.value;
	var value_1 = viTriMoi.replace(rong,"");
	if(value_1 == ""){
		alert("Bạn phải nhập vị trí phòng !!!" );
	    return;
	}
	
	var chucNangMoi = document.ActionPhongBan.txtChucNangMoi.value;
	var value_2 = chucNangMoi.replace(rong,"");
	if(value_2 == ""){
		alert("Bạn phải nhập chức năng phòng !!!" );
	    return;
	}
	
	var sucChuaMoi = document.ActionPhongBan.txtSucChuaMoi.value;
	var value_3 = sucChuaMoi.replace(rong,"");
	if(value_3 == ""  ){
		alert("Bạn phải nhập sức chứa phòng !!!" );
	    return;
	}
	document.forms["ActionPhongBan"].submit();
}
</script>
</head>
<title>Phòng Ban</title>


<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<c:set var="PhongBan" value = '<%= PhongBanDAO.showAllPhongBan() %>' scope="session"></c:set>
<form action="<%=request.getContextPath()%>/AdminController" id = "ActionPhongBan" name = "ActionPhongBan" method="post">
	<input type = "hidden" name = "actionType" value="phongBan" />

		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_thanhvientieude">Danh Sách Phòng Ban</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<c:if test="${param.msg eq 'updateThanhCong'}"><b class="msg">Cập nhật thành công !!!</b></c:if>
					<c:if test="${param.msg eq 'insertThanhCong'}"><b class="msg">Thêm mới thành công !!!</b></c:if>
					<c:if test="${param.err eq 'updateThatBai'}"><b class="error">Cập nhật thất bại !!!</b></c:if>
					<c:if test="${param.err eq 'insertThatBai'}"><b class="error">Thêm mới thất bại !!!</b></c:if>
				</td>
			</tr>
		</table>
		
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Kí hiệu</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Vị trí</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Chức năng</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Sức chứa</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>	
			</tr>
			<% int c = 1; %>
			<c:forEach var="phongBan"  items="${PhongBan}" >
				<tr style="background-color: transparent;">
					<c:if test="${param.maPB ne phongBan.maPhongBan}"><!-- show phong ban -->
						<td><%=c %></td>
						<td>${phongBan.kiHieu }</td>
						<td>${phongBan.viTri }</td>
						<td>${phongBan.chucNang }</td>
						<td>${phongBan.sucChua }</td>
					</c:if>
					<c:if test="${param.maPB eq phongBan.maPhongBan}"><!-- tinh trang cap nhat -->
						<td><%=c %></td>
						<td><input type = "text" name="txtKiHieu" value="${phongBan.kiHieu }" style="background-color: transparent;" /></td>
						<td><input type = "text" name="txtViTri" value="${phongBan.viTri }" style="background-color: transparent;" /></td>
						<td><input type = "text" name="txtChucNang" value="${phongBan.chucNang }" style="background-color: transparent;" /></td>
						<td><input type = "text" name="txtSucChua" value="${phongBan.sucChua }" style="background-color: transparent;" /></td>
					</c:if>
					<c:if test="${param.maPB eq phongBan.maPhongBan}">
						<td><a href="javascript: submit()">Cập Nhật</a></td>
						<input type = "hidden" name = "idPhong" value="${phongBan.maPhongBan}" />
					</c:if>
					<c:if test="${param.maPB ne phongBan.maPhongBan}">
						<td><a href ="<%= Constant.PATH_RES.getString("Admin.XemPhongBanPath")%>?maPB=${phongBan.maPhongBan}">sửa</a></td>
					</c:if>
				</tr>	
					
				<% c++; %>
				
			</c:forEach>
			<c:if test="${param.themMoi eq 'themmoi'}">	
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<td><input type = "text" name="txtKiHieuMoi" style="background-color: transparent;" /></td>
					<td><input type = "text" name="txtViTriMoi" style="background-color: transparent;" /></td>
					<td><input type = "text" name="txtChucNangMoi" style="background-color: transparent;" /></td>
					<td><input type = "text" name="txtSucChuaMoi" style="background-color: transparent;" /></td>
					<td>tạo mới</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="6">
						<a href ="javascript: submitNew()">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
					</td>
				</tr>
			</c:if>
			<c:if test="${param.themMoi ne 'themmoi'}">
				<tr style="background-color: transparent;">
					<td colspan="6">
						<a href ="<%= Constant.PATH_RES.getString("Admin.XemPhongBanPath")%>?themMoi=themmoi">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
					</td>
				</tr>
			</c:if>		
		</table>
</form>

		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>