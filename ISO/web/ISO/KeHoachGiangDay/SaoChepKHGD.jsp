<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
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
<title>Sao Chép Kế Hoạch Giảng Dạy</title>
	<c:set var="coHieuLT" value='<%=Constant.COHIEULT %>'></c:set>
	<c:set var="coHieuTH" value='<%=Constant.COHIEUTH %>'></c:set>
	<c:set var="coHieuTHop" value='<%=Constant.COHIEUTHOP %>'></c:set>
	<c:set var="coHieuKT" value='<%=Constant.COHIEUKT %>'></c:set>
<c:if test="${not empty param.maKHGD}">
	<c:set var="listThoiKhoaBieu" value='<%=ThoiKhoaBieuDAO.getThoiKhoaBieuByMaGVAndMaMHCoDieuKien(session.getAttribute("maThanhVien").toString(),request.getParameter("maMonHoc").toString()) %>'></c:set>
	<c:set var="listChiTietKHGD" value='<%=ChiTietKHGDDAO.getChiTietKHGDByMaKHGD(request.getParameter("maKHGD").toString()) %>'></c:set>
</c:if>
<script language="javascript">
	function saoChep(){
		
	}
	
	function submitForm(ac){
		if(ac=="C"){
			var tkb = document.getElementById("ThoiKhoaBieu").value;
			if(tkb=='error'){
				alert("Bạn chưa chọn thời khóa biểu");
			}else{
				document.getElementById("action").value = "saochep";
				document.forms["SaoChep"].submit();
			}
		}
		else if(ac=="U"){
			document.getElementById("action").value = "capNhatCTKHGD";
			document.forms["SaoChep"].submit();
		}
		
	}
	
	function huyBo(){
		window.close();
		window.returnValue = ${param.maKHGD};
	}
</script>
</head>
<body >
	<div align="center">
		<form name="SaoChep" id="SaoChep" action="<%=request.getContextPath() %>/keHoachGiangDayController" method="post">
			<c:if test="${not empty requestScope.msg}">
				<font color="red">${requestScope.msg }</font>
			</c:if>
			<table style="background-color: transparent;width: 700px;" border="1">
				
				<tr style="background-color: transparent;">
					<td style="width: 560px;text-align: center;">Tên Chương</td>
					<td style="width: 60px;text-align: center;">Lý Thuyết</td>
					<td style="width: 60px;text-align: center;">Thực Hành</td>
					<td style="width: 60px;text-align: center;">Tích Hợp</td>
					<td style="width: 60px;text-align: center;">Kiểm Tra</td>
				</tr>
				<c:set var="n" value="1"></c:set>
				<c:forEach var="ChiTietKHGD" items="${listChiTietKHGD}">
					<tr style="background-color: transparent;">
						<td style="text-align: left;padding-left: 5px;">${ChiTietKHGD.tenChuongTextBox }</td>
						<td><input type="radio" name="CoHieu${n }" value="0" <c:if test="${ChiTietKHGD.coHieu eq coHieuLT }">checked</c:if> /></td>
						<td><input type="radio" name="CoHieu${n }" value="1" <c:if test="${ChiTietKHGD.coHieu eq coHieuTH }">checked</c:if> /></td>
						<td><input type="radio" name="CoHieu${n }" value="5" <c:if test="${ChiTietKHGD.coHieu eq coHieuTHop }">checked</c:if> /></td>
						<td><input type="radio" name="CoHieu${n }" value="4" <c:if test="${ChiTietKHGD.coHieu eq coHieuKT }">checked</c:if> /></td>
					</tr>
					<input type="hidden" name="maCTKHGD${n }" value="${ChiTietKHGD.maChiTietKHGD }" />
					<c:set var="n" value="${n+1}"></c:set>
				</c:forEach>
			</table>
			<input type="hidden" name="max" value="${n }" />
			<a href="javascript: submitForm('U')">
				<input type="button" value="Cập Nhật"/>
			</a>
			
			<br/><hr/><br/>
			<table style="background-color: transparent;width: 700px;">
				<tr style="background-color: transparent;">
					<td style="width: 200px;text-align: right;padding-right: 10px;">Thời Khóa Biểu</td>
					<td style="text-align: left;">
						<select id="ThoiKhoaBieu" name="ThoiKhoaBieu">
							<option value="error">Chọn</option>
							<c:forEach var="TKB" items="${listThoiKhoaBieu}">
								<option value="${TKB.maThoiKhoaBieu }">${TKB.tenThoiKhoaBieu }</option>
							</c:forEach>										
						</select>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="2">
						<a href="javascript: submitForm('C')" style="text-decoration: none;">
							<input type="button" value="Sao Chép" onclick=""/>
						</a>
						<a href="javascript: huyBo()" style="text-decoration: none;">
							<input type="button" value="Quay Lại Trang Kế Hoạch Giảng Dạy" />	
						</a>
						
					</td>
				</tr>
			</table>
			<input type="hidden" name="maKHGD" value="${param.maKHGD }"/>
			<input type="hidden" name="maMonHoc" value="${param.maMonHoc }"/>
			<input type="hidden" name="action" id="action" />
		</form>
	</div>
</body>
</html>