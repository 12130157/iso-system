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
<title>Đăng Ký Thành Công</title>
<script language="javascript">
	function download(filename){
		document.getElementById("txtFileName").value = filename;
		document.forms["downHoSo"].submit();
	}
</script>

</head>
<body>
<div align="center">	
	<form name="downHoSo" action="<%=request.getContextPath() %>/downloadController" method="post">
		<div style="width: 600px;text-align: left;padding-top: 200px;">
			Chúc mừng bạn đã đăng ký dự tuyển thành công. <br/>Hãy click vào <a href="javascript: download('bieumaudangkydutuyen.PNG')">đây</a> để down biều mẫu để làm Hồ Sơ Dự Tuyển !!!<br/>
			Click vào <a href="<%=request.getContextPath() %>/Login.jsp">đây</a> để về trang đăng nhập !!!!
		</div>
	   <input type="hidden" name="txtFileName" id="txtFileName">
   </form>
</div>

</body>
</html>