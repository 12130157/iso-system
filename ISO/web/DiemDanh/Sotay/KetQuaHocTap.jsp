<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<title>Kết Quả Học Tập</title>
</head>
<div align="center">
	<!-- S HEAD CONTENT -->
		
	<!-- E HEAD CONTENT -->
	<br/><br/>
<body>
		<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Kết quả học tập</div></td></tr>
		</table><br/><br/>
			
			<table border="1">
					<tr>
					
						<td rowspan="3">
							Số TT
						</td>
						<td rowspan="3">
							Họ và tên học sinh
						</td>
						<td colspan="5">
							Kiểm tra định kỳ
						</td>
						<td rowspan="2" colspan="2">
							Kiểm tra kết thúc 
							môn học/module
						</td>
						<td rowspan="3">
							Điểm tổn kết
						</td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							Hệ Số 2 
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							Lần 1 
						</td>
						<td>
							Lần 2
						</td>
					</tr>
					
						
			</table>
			
			
</body>
</html>