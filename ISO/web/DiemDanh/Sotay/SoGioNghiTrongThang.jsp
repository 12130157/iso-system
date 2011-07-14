<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DiemDanhDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel" %>
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
<title>Số giờ nghỉ trong tháng</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
		
	<!-- E HEAD CONTENT -->
	<br/><br/>
	<form action="<%=request.getContextPath()%>/reportController?them=yes" method="post" name="Report">
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Số giờ nghỉ trong tháng</div></td></tr>
		</table><br/><br/>
			
			<table border="1">
				<tr>
					<td rowspan="2" align="center">
						Số TT
					</td>
					<td rowspan="2" >
						Họ và tên học sinh
					</td>
					<td colspan="31" align="center">
						Ngày Học
					</td>
					<td rowspan="2" align="center">
						Tổng Cộng
					</td>
					<td rowspan="2" align="center">
						Ghi Chú
					</td>
				</tr>
				<tr>
					
					
					<c:forEach var="iterater" begin="1" end="31" step="1">
						<td>
							${iterater }	
						</td>
					</c:forEach>
					
					
				</tr>
				<tr>
					<td>
						1
					</td>
					<td>
						Huỳnh Tuấn Đạt
					</td>
					<c:forEach var="iterater" begin="1" end="31" step="1">
						<td>
							&nbsp;	
						</td>
					</c:forEach>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			</form>
</body>
</html>