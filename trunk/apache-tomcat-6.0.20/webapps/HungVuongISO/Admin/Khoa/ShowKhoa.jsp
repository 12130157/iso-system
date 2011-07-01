<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%><fmt:bundle basename="i18n">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<head>
<title>Khoa</title>
<script type="text/javascript" language="JavaScript">

function checkValue(){
	var tenKhoa = document.ActionKhoa.txtTenKhoa.value;
	var rong = /\s/g;
	var value = tenKhoa.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập tên Khoa !!!" );
	     return;
	}

	document.forms["ActionKhoa"].submit();
}
function submit(){
	var tenKhoa = document.ActionKhoa.txtTenKhoa.value;
	var rong = /\s/g;
	var value = tenKhoa.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập tên Khoa !!!" );
	     return;
	}

	document.forms["ActionKhoa"].submit();
}

</script>
</head>
<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<c:set var="Khoa" value = '<%= KhoaDAO.showAllKhoa()%>' scope="session"></c:set>
		<form action="<%=request.getContextPath()%>/AdminController" id = "ActionKhoa" name = "ActionKhoa" method="post">
		<input type = "hidden" name = "actionType" value="Khoa_TT" />
			<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="4"><div class = "div_thanhvientieude">Danh Sách Khoa Trung Tâm</div></td></tr>
			</table>
			<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td colspan="4">
						<c:if test="${param.msg eq 'msgUpdate'}">
							<b class="msg">Cập nhật thành công !</b>
						</c:if>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="4">
						<c:if test="${param.msg eq 'msgInsert'}">
							<b class="msg">Thêm mới thành công !</b>
						</c:if>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Mã khoa</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên Khoa</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Trưởng Khoa</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>	
				</tr>
				<c:set var="truongKhoaList" value='<%= ThanhVienDAO.timThanhVienByMaVaiTro(Constant.TRUONG_KHOA) %>'></c:set>
				<% int c = 1; %>
				<c:forEach var="khoa"  items="${Khoa}" >
					
					<tr style="background-color: transparent;">
					<td><%=c %></td>
					<c:choose>
						<c:when test="${khoa.maKhoa eq param.maKhoa}">
							
							<td><div class = "div_textleft"><input type="text" name="txtTenKhoa" value="${khoa.tenKhoa}" style="background-color: transparent;"/></div></td>
							<td><div class = "div_textleft">
								<select name="cboTruongKhoa">
								<c:forEach var="truongKhoa" items="${truongKhoaList}" >
									<option value="${truongKhoa.maThanhVien}"  >
										${truongKhoa.hoThanhVien} ${truongKhoa.tenLot} ${truongKhoa.tenThanhVien}
									</option>
								</c:forEach>
								</select>
							</div></td>
						</c:when>
						<c:otherwise>
							
							<td><div class = "div_textleft">${khoa.tenKhoa}</div></td>
							<td><div class = "div_textleft">${khoa.tenTruongKhoa}</div></td>
						</c:otherwise>
					</c:choose>
					<c:if test="${khoa.maKhoa eq param.maKhoa }">
							<td>
								<a href="javascript: submit()">Cập Nhật</a>
								<input type = "hidden" name = "maKhoaTT" value = "${param.maKhoa}" style="background-color: transparent;" />
							</td>
						</c:if>
						<c:if test="${khoa.maKhoa ne param.maKhoa }">
							<td><a href ="<%= Constant.PATH_RES.getString("Admin.XemKhoaPath")%>?maKhoa=${khoa.maKhoa}">Sửa</a></td>
						</c:if>
					</tr>
					<%c++; %>
				</c:forEach>			
					<c:if test="${param.msg eq 'themmoi'}">
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<td><div class = "div_textleft">
							<input type = "text" name = "txtTenKhoa" style="background-color: transparent;" />
						</div>
					</td>
					<td>
						<div class = "div_textleft">
							<select name="cboTruongKhoa">
								<c:forEach var="truongKhoa" items="${truongKhoaList}" >
									<option value="${truongKhoa.maThanhVien}"  >
										${truongKhoa.hoThanhVien} ${truongKhoa.tenLot} ${truongKhoa.tenThanhVien}
									</option>
								</c:forEach>
							</select>
						</div>
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
							<a href="<%= Constant.PATH_RES.getString("Admin.XemKhoaPath") %>?msg=themmoi"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
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