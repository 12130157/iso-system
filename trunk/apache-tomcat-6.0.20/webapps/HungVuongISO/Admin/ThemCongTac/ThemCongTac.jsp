<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.CongTacDAO"%><fmt:bundle basename="i18n">
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
<title>Thêm Công Tác</title>

<script type="text/javascript" language="JavaScript">
function mouse(){
	document.ActionThemCongTac.txtNoiDung.focus();
}
function submit(){
	var tenCT = document.ActionThemCongTac.txtNoiDung.value;
	var rong = /\s/g;
	var value = tenCT.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập Nội Dung Công Tác!!!" );
	     return;
	}
	document.forms["ActionThemCongTac"].submit();
}

</script>

</head>

<body onload="mouse();" >
<div align="center">
	<!-- S HEAD CONTENT -->
		<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<!-- them nut tro ve trang KHDT -->
	<c:set var="listCongTac" value="<%= CongTacDAO.getCongTac() %>"></c:set>
	<form action="<%=request.getContextPath()%>/AdminController" id = "ActionThemCongTac" name = "ActionThemCongTac" method="post">
		<input type = "hidden" name = "actionType" value="congTac" />
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Danh Sách Thêm Công Tác</div></td></tr>
			<tr style="background-color: transparent;">
				<td colspan="4">
					<c:if test="${param.err eq 'msgInsertTB'}">
						<b class="error">Công tác này đã có rồi !!!</b>
					</c:if>
					<c:if test="${param.msg eq 'msgInsertTC'}">Ba
						<b class="msg">Thêm mới thành công !!!</b>
					</c:if>
					<c:if test="${param.err eq 'msgInsertTB'}">
						<b class="error">Công tác này đã có rồi !!!</b>
					</c:if>
					<c:if test="${param.msg eq 'msgUpdateTC'}">
						<b class="msg">Cập nhật thành công !!!</b>
					</c:if>
				</td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Nội Dung</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Ghi chú</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>	
			</tr>
			<% int c = 1; %>
			<c:forEach var="congTac"  items="${listCongTac}" >
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<c:choose>
						<c:when test="${congTac.maCongTac eq param.maCongTac }">
							<td><div class = "div_textleft"><textarea name="txtNoiDung" cols="45" style="background-color: transparent;">${congTac.noiDung}</textarea></div></td>
							<td><div class = "div_textleft"><textarea name="txtGhiChu" cols="45" style="background-color: transparent;"><c:if test="${congTac.ghiChu eq null}"><p></c:if>${congTac.ghiChu}</textarea></div></td>
							<td>
								<a href="javascript: submit()">Cập Nhật</a>
								<input type = "hidden" name = "maCongTac" value = "${param.maCongTac}" />
							</td>
						</c:when>
						<c:otherwise>
							<td><div class = "div_textleft">${congTac.noiDung}</div></td>
							<td><div class = "div_textleft">${congTac.ghiChu}</div></td>
							<td><a href = "<%= Constant.PATH_RES.getString("Admin.XemThemCongTacPath") %>?maCongTac=${congTac.maCongTac}">sửa</a></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<%c++; %>
			</c:forEach>
			<c:if test="${param.themmoi eq 'themmoi'}">
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<td><textarea name="txtNoiDung" cols="45" style="background-color: transparent;"></textarea></td>
					<td><textarea name="txtGhiChu" cols="45" style="background-color: transparent;"></textarea></td>
					<td>Tạo mới</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="4">
						<a href="javascript: submit()">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
						</a>
						<input type = "hidden" name = "maCongTac" value = "" />
					</td>
				</tr>
			</c:if>
			<c:if test="${param.themmoi ne 'themmoi'}">
				<tr style="background-color: transparent;">
					<td colspan="4">
						<a href="<%= Constant.PATH_RES.getString("Admin.XemThemCongTacPath") %>?themmoi=themmoi">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
						</a>
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