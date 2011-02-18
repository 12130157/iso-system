<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
	<script src="<%=request.getContextPath()%>/js/jslightbox/prototype.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jslightbox/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jslightbox/lightbox.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/lightbox.css" type="text/css" media="screen" />
<title>Intro</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_home.jsp" />
	<!-- E HEAD CONTENT -->
	
	<a href="<%=request.getContextPath()%>/images/imageslightbox/intro.png" rel="lightbox[roadtrip]">
		<img src="<%=request.getContextPath()%>/images/imageslightbox/intro.png" style="width:600px" border = "0" />
	</a><br />
	<a href="<%=request.getContextPath()%>/images/imageslightbox/flow.jpg" rel="lightbox[roadtrip]">
		<img src="<%=request.getContextPath()%>/images/imageslightbox/flow.jpg" style="width:600px" border = "0"  />
	</a><br />
	<a href = "<%=request.getContextPath()%>/ISO/Intro.jsp">
	<img src = "<%=request.getContextPath()%>/images/icon_action/back.png" border = "0"  />
	</a>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>