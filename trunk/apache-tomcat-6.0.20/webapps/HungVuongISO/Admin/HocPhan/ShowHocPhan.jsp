<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.HocPhanDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.HocPhanModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><fmt:bundle basename="i18n">
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
<title>Học Phần</title>

<script type="text/javascript" language="JavaScript">
function submit(){

	var tenHP = document.ActionHocPhan.txtTenHocPhan.value;
	var rong = /\s/g;
	var value = tenHP.replace(rong,"");
	
	var ghiChu = document.ActionHocPhan.txtGhichu.value;
	var value_1 = ghiChu.replace(rong,"");
	
	if(value == ""){
		 alert("Bạn phải nhập Tên Học Phần !!!" );
	     return;
	}
	if(value_1 == ""){
		 alert("Bạn phải nhập ghi chú !!!" );
	     return;
	}
	document.forms["ActionHocPhan"].submit();
}

</script>

</head>

<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<c:set var="HocPhan" value = '<%= HocPhanDAO.showAllHocPhan() %>' scope="session"></c:set>
	<form action="<%=request.getContextPath()%>/AdminController" id = "ActionHocPhan" name = "ActionHocPhan" method="post">
	<input type = "hidden" name = "actionType" value="HocPhan" /> 
		<table  style="background-color: transparent;">
			<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Danh Sách Học Phần</div></td></tr>
			<tr style="background-color: transparent;">
				<td colspan="4">
					<c:if test="${param.msg eq 'msgInsert'}">
						<b class="msg">thêm mới thành công !</b>
					</c:if>
					<c:if test="${param.msg eq 'msgUpdate'}">
						<b class="msg">cập nhật thành công !</b>
					</c:if>
				</td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Hoc phần</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Ghi chú</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>	
			</tr>
			<%int c = 1; %>
			<c:forEach var="hocPhan"  items="${HocPhan}" >
				<tr style="background-color: transparent;">
					<td><%=c %></td>				
					<c:choose>
						<c:when test="${hocPhan.maHocPhan eq param.maHocPhan }">
							<td><div class = "div_textleft"><input type="text" name="txtTenHocPhan" value="${hocPhan.tenHocPhan}" style="background-color: transparent;"/></div></td>
							<td><div class = "div_textleft"><input type="text" name="txtGhichu" value="${hocPhan.ghiChu}" style="background-color: transparent;"/></div></td>
						</c:when>
						<c:otherwise>
							<td><div class = "div_textleft">${hocPhan.tenHocPhan}</div></td>
							<td><div class = "div_textleft">${hocPhan.ghiChu}</div></td>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${hocPhan.maHocPhan eq param.maHocPhan }">
						<td>
							<a href="javascript: submit()">Cập Nhật</a>
							<input type = "hidden" name = "maHocPhan" value = "<%=c-1 %>" />
						</td>
					</c:if>
					<c:if test="${hocPhan.maHocPhan ne param.maHocPhan }">
						<td><a href = "<%= Constant.PATH_RES.getString("Admin.XemHocPhanPath")%>?maHocPhan=${hocPhan.maHocPhan }">Sửa</a></td> </tr>
					</c:if>		
				<%c++; %>
			</c:forEach>	
			<c:if test="${param.themmoi eq 'themmoi'}">
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<td><input type="text" name="txtTenHocPhan" style="background-color: transparent;" /></td>
					<td><input type="text" name="txtGhichu" style="background-color: transparent;" /></td>
					<td>Tạo mới</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="4">
						<a href="javascript: submit()">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
						</a>
						<input type = "hidden" name = "maHocPhan" value = "" />
					</td>
				</tr>
			</c:if>
			<c:if test="${param.themmoi ne 'themmoi'}">
				<tr style="background-color: transparent;">
					<td colspan="4">
						<a href="<%= Constant.PATH_RES.getString("Admin.XemHocPhanPath") %>?themmoi=themmoi">
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