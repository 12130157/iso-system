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
	
	<h1 align="center" style="color: red"> Bạn không được quyền vào trang này. </h1>
	
	<a href = "<%=request.getContextPath()%>/home.jsp">
		<img src = "<%=request.getContextPath()%>/images/icon_action/back.png" border = "0"  />
	</a> <br/>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="block/footer.jsp" />
		<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>