<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/interface.js"></script>
<script type="text/javascript" language="JavaScript">
	
</script> 
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title> Xem Điểm Học Kỳ</title>
<script type="text/javascript" language="JavaScript">

</script>
</head>
<body onload="pageLoad();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_XemDiem.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form action="<%=request.getContextPath()%>/XemDiemController" name = "ShowDiemHocKy" method="post">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="5"><div class = "div_thanhvientieude">Bảng Điểm Học Kỳ</div></td></tr>
			
			<tr style="background-color: transparent;">
				
				<th style="background-color: #99bff9" align="right">Khoa</th>
			
				<th style="background-color: #99bff9" align="left">
					<select name="cboKhoa" id="cboKhoa">
				
					</select>
				</th>
				
				<th style="background-color: #99bff9" align="left">Năm học</th>
				
				<th style="background-color: #99bff9" align="left">
					<select name="cboNamHoc" id="cboNamHoc">
				
					</select>
				</th>
				
				<th style="background-color: #99bff9" rowspan="2">
					<a href = "">
						<img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm"/>
					</a>
				</th>
			</tr>
			
			<tr>
				<th style="background-color: #99bff9" align="left">Học kỳ</th>
				
				<th style="background-color: #99bff9" align="left">
					<select name = "cboHocKy" id = "cboHocKy">
					
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Học kỳ
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboHocKy" id="cboHocKy">
						<option value = "">Không có</option>
					</select>
				</th>
			</tr>
		</table>
		
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Tên sinh viên</div></th>
				<th bgcolor = "#186fb2" colspan="10"><div class = "div_textWhite">Môn học</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Điểm TB</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Điểm RL</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Điểm TBC</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Học lực</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Hạnh kiểm</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Số ngày nghỉ</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Ghi chú</div></th>
			</tr>
			
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Môn 1</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Môn 2</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Môn 3</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Môn 4</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Môn 5</div></th>
			</tr>
		</table>
	</form>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>

</body>
</html>