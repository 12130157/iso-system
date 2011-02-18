<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%><fmt:bundle basename="i18n">
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
<title>Lớp Học</title>

<script type="text/javascript" language="JavaScript">
function submit(){

	var kiHieu = document.ActionLopHoc.txtKiHieu.value;
	var rong = /\s/g;
	var value = kiHieu.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập Kí Hiệu !!!" );
	     return;
	}
	document.forms["ActionLopHoc"].submit();
}

</script>

</head>

<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<c:set var="lopHoc" value = '<%= LopHocDAO.showLop() %>' scope="session"></c:set>
	<c:set var="thanhVienList" value='<%= ThanhVienDAO.timAllThanhVienLaHocSinh() %>'></c:set>
	<form action="<%=request.getContextPath()%>/AdminController" id = "ActionLopHoc" name = "ActionLopHoc" method="post">
	<input type = "hidden" name = "actionType" value="lopHoc" />
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Danh Sách Lớp Học</div></td></tr>
			<c:if test="${param.msg eq 'msgUpdate'}">
				<tr style="background-color: transparent;"><td><b class = "msg"> Cập nhật thành công</b></td></tr>
			</c:if>
		</table>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Mã Lớp</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên chuyên ngành</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">kí hiệu</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Lớp trưởng</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên quyết định</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>
			</tr>
			<% int c = 1; %>
			<c:forEach var="lop"  items="${lopHoc}" >
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<c:if test="${param.maLop eq lop.maLopHoc}">
						<td>${lop.tenChuyenNganh}</td>
						<td><input type = "text" name = "txtKiHieu" value="${lop.kiHieu}" style="background-color: transparent;" /></td>
						<td>
							<select name="cboLopTruong">
								<c:if test="${thanhVien.maThanhVien ne  lop.maLopTruong}">
									<option value="">Chưa có</option>
								</c:if>
								<c:forEach var="thanhVien" items="${thanhVienList}" >
									<option
										<c:if test="${thanhVien.maThanhVien eq lop.maLopTruong }">selected</c:if>
											value="${thanhVien.maThanhVien}" >
											${thanhVien.hoThanhVien} ${thanhVien.tenLot} ${thanhVien.tenThanhVien}
									</option>
								</c:forEach>
							</select>	
						</td>
						<td>${lop.tenQuyetDinh}</td>
						<td>
							<a href = "javascript: submit()">Cập Nhật</a>
							<input type = "hidden" name = "maLopHoc" value="${lop.maLopHoc}" />
						</td>
					</c:if>
					<c:if test="${param.maLop ne lop.maLopHoc}">
						<td>${lop.tenChuyenNganh}</td>
						<td>${lop.kiHieu}</td>
						<td>
							<c:if test="${lop.hoTenLopTruong eq null}">không có</c:if>
							<c:if test="${lop.hoTenLopTruong ne null}">${lop.hoTenLopTruong}</c:if>
						</td>
						<td>${lop.tenQuyetDinh}</td>
						<td>
							<a href = "<%= Constant.PATH_RES.getString("Admin.XemLopPath") %>?maLop=${lop.maLopHoc}">Sửa</a>
						</td>						
					</c:if>
				</tr>
			<% c++; %>
			</c:forEach>
		</table>
</form>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>