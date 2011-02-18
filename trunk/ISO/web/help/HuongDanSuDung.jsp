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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link href="<%=request.getContextPath()%>/icon.css" rel="stylesheet" type="text/css" />
<title>Hướng dẫn sử dụng</title>
</head>
<body>
<div class = "div_pagebody">
<div align="center">	
	
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_home.jsp" />
	<!-- E HEAD CONTENT -->
	
   <table width="700px" style="background-color: transparent;">
	<a href = "<%=request.getContextPath()%>/home.jsp">
		<img src = "<%=request.getContextPath()%>/images/icon_action/back.png" border = "0"  />
	</a> <br/>
	<iframe
		name='docuter'
		src='http://www.docuter.com/embed.asp?documentid=20708555884c5542082f9e91280655880&user-manual&startPage=1&height=600&width=800&saveButton=Yes&printButton=Yes&rotationButton=Yes&fullscreenButton=Yes&saveDocumentLocation=http://connect.docuter.com/documents/20708555884c5542082f9e91280655880.doc' 
		border='0' 
		height='600' 
		width='800' 
		scrolling='no' 
		align='center' 
		frameborder='0' 
		marginwidth='1' 
		marginheight='1'>
	</iframe>	
   </table>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
		<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>