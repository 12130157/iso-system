<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.model.SysRoleAppModel"%>
<%@page import="java.util.ArrayList"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<!--[if IE 6]>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/generalForIE6.css" />
<![endif]-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link href="<%=request.getContextPath()%>/icon.css" rel="stylesheet" type="text/css" />
<title>Hệ Thống Quản Lý Trường Hùng Vương</title>
</head>
<body>
<div class = "div_pagebody">
<div align="center">	
	
	<!-- S HEAD CONTENT -->
			<jsp:include page="block/header_home.jsp" />
	<!-- E HEAD CONTENT -->
	
	<c:if test='${not empty sessionScope.roleAppList}'>
		<c:set var="num" value='<%= ((ArrayList<SysRoleAppModel>) session.getAttribute("roleAppList")).size()%>'></c:set>
	</c:if>	
   <table width="700px" style="background-color: transparent;">
	<c:forEach var="iterator" begin="1" end="${num}" step="3" >
		<tr style="background-color: transparent;">
			<td>	
				<c:set var="AppObj1" value="${sessionScope.roleAppList[iterator-1]}"></c:set>
				<c:if test="${AppObj1 ne null}">
				<div class = "icon">
					<a class="linkHome" href = "${AppObj1.appLink}" style="background-color: transparent;"><img src="${AppObj1.appImage}" alt="${AppObj1.appName}"  border = "0px"/><br/>${AppObj1.appName}</a>					
				</div>
				</c:if>
			</td>
			<td>				
				<c:set var="AppObj2" value="${sessionScope.roleAppList[iterator]}"></c:set>
				<c:if test="${AppObj2 ne null}">
				<div class = "icon">
					<a class="linkHome" href = "${AppObj2.appLink}" style="background-color: transparent;"><img src="${AppObj2.appImage}" alt="${AppObj2.appName}" border="0px"/><br/>${AppObj2.appName}</a>					
				</div>
				</c:if>
			</td>
			<td>					
				<c:set var="AppObj3" value="${sessionScope.roleAppList[iterator+1]}"></c:set>
				<c:if test="${AppObj3 ne null}">
				<div class = "icon">
					<a class="linkHome" href = "${AppObj3.appLink}" style="background-color: transparent;"><img src="${AppObj3.appImage}" alt="${AppObj3.appName}" border="0px"/><br/>${AppObj3.appName}</a>					
				</div>
				</c:if>
			</td>	
		</tr>
	</c:forEach>
   </table>
	<!-- S FOOT CONTENT -->
			<jsp:include page="block/footer.jsp" />
		<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>