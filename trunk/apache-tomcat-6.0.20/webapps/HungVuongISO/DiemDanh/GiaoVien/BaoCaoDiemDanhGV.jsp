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
	<br/><br/>
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Báo Cáo Tiến Độ Giảng Dạy Giáo Viên</div></td></tr>
	</table><br/><br/>
	<form action="<%=request.getContextPath()%>/DiemDanhController" id = "ActionDD" name = "ActionDD" method="post">
		<font size="4" style="text-align: left;" color="#0000FF">Thông Tin Tìm Kiếm</font><br /><br />
		<table style="background-image: url('../../images/background_diemdanh.png')">
			<tr style="background-color: transparent;"></tr>
			<tr style="background-color: transparent;">
				<th align="left">Khoa :<select><option>Khoa trung tam</option></select></th>
				<th align="left">Năm học :<select><option>2010 - 2011</option></select></th>
				<th align="left">Thời gian :<select><option>Tháng 10</option></select></th>
				<td rowspan="2"><input type="button" value="tiềm kiếm" name="" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<th align="left">Môn học :<select><option>JAVA</option></select></th>
				<th align="left">Giáo viên :<select><option>Võ Đức Thiện</option></select></th>
				<th align="left">Tình trạng :<select><option>Đã dạy</option></select></th>
			</tr>
			<tr style="background-color: transparent;"></tr>
		</table>
		<br /><br /><font size="4" style="text-align: left;" color="#0000FF">Kết Quả Tìm Kiếm</font><br /><br />
		<table border="1" width="800px" style="background-image: url('../../images/background_diemdanh.png');background-repeat: repeat-y">
			<tr style="background-color: transparent;">
			<th style="background-color: #0000FF"><div class="div_textWhite">STT</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Giáo viên</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Môn học</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Ngày dạy</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Hình Thức dạy</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Phòng</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Bắt đầu</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Kết thúc</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Thời gian dạy</div></th>
			</tr>
			<tr style="background-color: transparent;">
			<td>1</td>
			<td>Võ Đức Thiện</td>
			<td>JAVA</td>
			<td>01/10/2010</td>
			<td>Lý Thuyết</td>
			<td>F2.4</td>
			<td>7h30</td>
			<td>11h00</td>
			<td>3h30</td>
			</tr>
		</table>
		<br /><br /><input type="button" value="In kết quả" />
	</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</div>
</body>
</html>