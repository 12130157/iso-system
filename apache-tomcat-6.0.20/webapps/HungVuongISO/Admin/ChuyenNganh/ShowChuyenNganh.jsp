<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.ChuyenNganhDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ChuyenNganhModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><fmt:bundle basename="i18n">
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
<title>Chuyên Ngành</title>
<script type="text/javascript" language="JavaScript">
function submit(){
	     	
	var tenCN = document.ActionChuyenNganh.txtTenChuyenNganh.value;
	var rong = /\s/g;
	var value = tenCN.replace(rong,"");
	
	var kiHieu = document.ActionChuyenNganh.txtKiHieu.value;
	var value_1 = kiHieu.replace(rong,"");
	
	if(value == ""){
		 alert("Bạn phải nhập tên Chuyên Ngành !!!" );
	     return;
	}
	
	if(value_1 == ""){
		 alert("Bạn phải nhập Kí Hiệu !!!" );
	     return;
	}
	document.forms["ActionChuyenNganh"].submit();
}

</script>
</head>

<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<c:set var="ChuyenNganh" value='<%= ChuyenNganhDAO.showAllChuyenNganh()%>' scope="session"></c:set>
	<form action="<%=request.getContextPath()%>/AdminController" id = "ActionChuyenNganh" name = "ActionChuyenNganh" method="post">
	<input type="hidden" name="actionType" value="chuyenNganh" />
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="4"><div class = "div_thanhvientieude">Danh Sách Chuyên Ngành</div></td></tr>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<c:if test="${param.msg eq 'msgInsert'}">
						<b class="msg">Thêm mới thành công !!!</b>
					</c:if>
					<c:if test="${param.msg eq 'msgUpdate'}">
						<b class="msg">Cập nhật thành công !!!</b>
					</c:if>
				</td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Chuyên Ngành</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Khoa</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Ký hiệu</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>	
			</tr>
			<%int c = 1; %>
			<c:set var="tenKhoaList" value='<%= KhoaDAO.showAllKhoa()%>' scope="session"></c:set>
			<c:forEach var="chuyenNganh" items="${ChuyenNganh}" > 
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<c:choose>
						<c:when test="${chuyenNganh.maChuyenNganh eq param.MaChuyenNganh}">
							<td><div class = "div_textleft"><input type="text" name="txtTenChuyenNganh" value="${chuyenNganh.tenChuyenNganh}" style="background-color: transparent;"/></div></td>
							<td>
								<div class = "div_textleft">
									<select name="cboTenKhoa">
										<c:forEach var="tenKhoa" items="${tenKhoaList}">
											<option value="${tenKhoa.maKhoa }">
												${tenKhoa.tenKhoa }
											</option>
										</c:forEach>
									</select> 
								</div>
							</td>
							<td><input type="text" name="txtKiHieu" value="${chuyenNganh.kiHieu}" style="background-color: transparent;"/></div></td>
						</c:when>
						<c:otherwise>
							<td><div class = "div_textleft">${chuyenNganh.tenChuyenNganh}</div></td>
							<td><div class = "div_textleft">${chuyenNganh.khoa}</div></td>
							<td>${chuyenNganh.kiHieu}</td>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${chuyenNganh.maChuyenNganh eq param.MaChuyenNganh }">
						<td>
							<a href="javascript: submit()">Cập Nhật</a>
							<input type = "hidden" name = "maChuyenNganh" value = "${param.MaChuyenNganh}"  style="background-color: transparent;" />
						</td>
					</c:if>
					<c:if test="${chuyenNganh.maChuyenNganh ne param.MaChuyenNganh }">
						<td><a href ="<%= Constant.PATH_RES.getString("Admin.XemChuyenNganhPath")%>?MaChuyenNganh=${chuyenNganh.maChuyenNganh}">sửa</a></td>
					</c:if> 
				</tr>
				<% c++; %>
			</c:forEach>
			<c:if test="${param.Themmoi eq 'themmoi'}">
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<td><input type = "text" name = "txtTenChuyenNganh" style="background-color: transparent;"/></td>
					<td>
						<div class = "div_textleft">
							<select name="cboTenKhoa">
								<c:forEach var="tenKhoa" items="${tenKhoaList}">
									<option value="${tenKhoa.maKhoa }">
										${tenKhoa.tenKhoa }
									</option>
								</c:forEach>
							</select> 
						</div>
					</td>
					<td><input type = "text" name = "txtKiHieu" style="background-color: transparent;"/></td>
					<td>Tạo mới</td>
				</tr>							
			</c:if>
			
			<c:choose>
				<c:when test="${param.Themmoi eq 'themmoi'}">
					<tr style="background-color: transparent;">
						<td colspan="5">
							<a href="javascript: submit()"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
							<input type = "hidden" name = "maChuyenNganh" value = "" style="background-color: transparent;" />
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr style="background-color: transparent;">
						<td colspan="5">
							<a href="<%= Constant.PATH_RES.getString("Admin.XemChuyenNganhPath") %>?Themmoi=themmoi"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
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