<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
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
<title>Vai Trò</title>

<script type="text/javascript" language="JavaScript">
function checkValue(){
	var tenVT = document.ActionVaiTro.txtTenVaiTro.value;
	var rong = /\s/g;
	var value = tenVT.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập Tên Vai Trò !!!" );
	     return;
	}
	document.forms["ActionVaiTro"].submit();
}
function submit(){
	var tenVT = document.ActionVaiTro.txtTenVaiTroMoi.value;
	var rong = /\s/g;
	var value = tenVT.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập Tên Vai Trò !!!" );
	     return;
	}
	document.forms["ActionVaiTro"].submit();
}

</script>

</head>

<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<c:set var="VaiTro" value = '<%= VaiTroDAO.showAllVaiTro() %>' scope="session"></c:set>
	<form action="<%=request.getContextPath()%>/AdminController" id = "ActionVaiTro" name = "ActionVaiTro" method="post">
	<input type = "hidden" name = "actionType" value="vaitro" />
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="4"><div class = "div_thanhvientieude">Danh Sách Vai Trò</div></td></tr>
			<tr style="background-color: transparent;">
				<td colspan="4">
					<c:if test="${param.err eq 'insertTB'}">
						<b class="error">Vai trò này đã có rồi !!!</b>
					</c:if>
					<c:if test="${param.msg eq 'insertTC'}">
						<b class="msg">Thêm mới thành công !!!</b>
					</c:if>
					<c:if test="${param.err eq 'updateTB'}">
						<b class="error">Vai trò này đã có rồi !!!</b>
					</c:if>
					<c:if test="${param.msg eq 'updateTC'}">
						<b class="msg">Cập nhật thành công !!!</b>
					</c:if>
				</td>
			</tr>
			</table>
			<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Vai Trò</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Ngày Cập Nhật Cuối</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>	
			</tr>
			<% int c = 1; %>
			<c:forEach var="vt"  items="${VaiTro}" >
				<tr style="background-color: transparent;">
					<td><%=c %></td>
				
						<c:if test="${vt.maVaiTro eq param.maVT}">
							<td><div class = "div_textleft">
								<input type = "text" name = "txtTenVaiTroMoi" value = "${vt.tenVaiTro}" style="background-color: transparent;"/>
							</div></td>
							<td><input type = "hidden" name = "txtNgayCapNhatCuoiMoi"/></td>
						</c:if>
						<c:if test="${vt.maVaiTro ne param.maVT}">
							<td><div class = "div_textleft">${vt.tenVaiTro}</div></td>
							<td>${vt.ngayCapNhatCuoi}</td>
						</c:if>

						<c:if test="${vt.maVaiTro eq param.maVT}">
							<td>
								<a href="javascript: submit()">Cập Nhật</a>
								<input type = "hidden" name = "maVaiTro" value = "${param.maVT}" />
							</td>
						</c:if>
						<c:if test="${vt.maVaiTro ne param.maVT}">
							<td><a href ="<%= Constant.PATH_RES.getString("Admin.XemVaiTroPath") %>?maVT=${vt.maVaiTro}">sửa</a></td>
						</c:if>
				 </tr>			
				<% c++; %>
			</c:forEach>
			<c:if test="${param.msg eq 'themmoi'}">
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<td><div class = "div_textleft">
						<input type = "text" name = "txtTenVaiTro" style="background-color: transparent;" />
					</div></td>
					<td>
						<input type = "hidden" value="" name = "txtNgayCapNhatCuoi"/>
					</td>
					<td>Tạo mới</td>
				</tr>
			</c:if>
			<c:choose>
				<c:when test="${param.msg eq 'themmoi'}">
					<tr style="background-color: transparent;">
						<td colspan="4">
							<a href="javascript: checkValue()"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr style="background-color: transparent;">
						<td colspan="4">
							<a href="<%= Constant.PATH_RES.getString("Admin.XemVaiTroPath") %>?msg=themmoi"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>			
		</table>
</form>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>