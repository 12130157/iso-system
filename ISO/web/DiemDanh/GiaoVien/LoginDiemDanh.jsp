<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<script type="text/javascript" language="JavaScript">
	function chose(){
		document.ActionDD.txtID.focus();
	}
	function submitlogin(){
			document.forms["ActionDD"].submit();
	}
</script>


<title>Hệ Thống Quản Lý (Điểm Danh)</title>
</head>
<body onload="chose();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_diemdanh.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/><br/>

	<form action="<%=request.getContextPath()%>/DiemDanhController" id = "ActionDD" name = "ActionDD" method="post">
		<input type = "hidden" name="actionType" id="actionType" value="GiaoVienLogin" />
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td>
					<c:if test="${param.err eq 'KhongLaGiaoVien'}">
						<b class="error">Bạn Không Phải Giáo Viên</b><br />
					</c:if>
					<c:if test="${param.err eq 'GiaoVienKhongCoTiet'}">
						<b class="error">Hôm Nay Bạn Không Có Tiết</b><br />
					</c:if>
					<c:if test="${param.err eq 'khongdukitu'}">
						<b class="error">Ban Phai Nhap Du 18 Ky Tu</b><br />
					</c:if>
				</td>
			</tr>
		</table>	
		<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Hệ Thống Điểm Danh Hùng Vương ISO</div></td></tr>
			<tr style="background-color: transparent;">
				<td> 
					<input type="radio" value="DiemDanh" name="DDSinhVien" id="DDSinhVien" checked="checked"/> Điểm Danh
					<input type="radio" value="DiemDanhOnline" name="DDSinhVien" id="DDSinhVien"/>  Điểm Danh Online
				 </td>
			</tr>
			<tr style="background-color: transparent;">
				<td>Mã thẻ : <input type = "password" name="txtID" id="txtID" /> 
					<a href = "javascript: submitlogin()">
						<img src = "<%=request.getContextPath()%>/images/buttom/diemdanh.png" border = "0"/>
					</a>
				</td>
			</tr>
		</table>
	</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</div>
</body>
</html>