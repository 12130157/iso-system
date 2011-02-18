<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<fmt:bundle basename="i18n">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="main-wrap">
		<!-- S HEAD CONTENT -->
			<jsp:include page="block/header.jsp" />
		<!-- E HEAD CONTENT -->

		<div class="space"></div>

		<!-- S BODY CONTENT -->
		<div id="body">
			<div id="center-column">
				<!-- Dynamic content place here -->

				<!-- Dynamic content place here -->
			</div>
		</div>
		<!-- E BODY CONTENT -->

		<div class="space"></div>

		<!-- S FOOT CONTENT -->
			<jsp:include page="block/footer.jsp" />
		<!-- E FOOT CONTENT -->
	</div>
</body>
</html>
</fmt:bundle>