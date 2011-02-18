<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
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

<title>Tuần</title>

<script type="text/javascript" >
	function xyLyCombobox() {
		document.FormNamHoc.submit();
	}
	function submit(){
	document.FormTuanHoc.submit();
	}
	
</script>
</head>
<body>

<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan="3">
					<div class = "div_thanhvientieude">Show Tuần Trong Năm</div>
				</td>
			</tr>
	</table>
	<c:set var="listNam" value = '<%= NamHocDAO.getAllNamHoc() %>' scope="session"></c:set>
	<form action="<%=request.getContextPath()%>/TuanLeController" name="FormNamHoc" method="post" id="FormNamHoc">
	<input type = "hidden" name = "actionType" value="namHoc" />
	<select onchange="xyLyCombobox();" name="cboNamHoc">
		<c:forEach var="nam" items="${listNam}">
			<option value="${nam.maNamHoc}" <c:if test="${param.maNamHoc eq nam.maNamHoc}"> selected </c:if> >
				${nam.namBatDau} - ${nam.namKetThuc}
			</option> 
				
		</c:forEach>
	</select>	
	</form>
	
	<form action="<%=request.getContextPath()%>/TuanLeController" name="TaoNamMoi" method="post" id="TaoNamMoi">
		<input type = "hidden" name = "actionType" value="themmoi" />
		<a href="<%= Constant.PATH_RES.getString("Admin.TuanTrongNamPath")%>?msg=themmoi">
			<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
		</a>

		<c:if test="${param.msg eq 'themmoi'}">
			<c:set var="namCuoi" value = '<%= NamHocDAO.getMaxNamHoc() %>' scope="session"></c:set>
			<input type="hidden" value ="${namCuoi}" size = "15" />
			<c:set var="namCuoi" value = "${namCuoi+1}"></c:set>
			<input type="hidden" value ="${namCuoi}" size = "15" />	
				
			
		</c:if>
	</form>
	
	<form action="<%=request.getContextPath()%>/TuanLeController" name="FormTuanHoc" method="post" id="FormTuanHoc">
	<input type = "hidden" name = "actionType" value="tuanHoc" />
	<c:set var="listTuan" value = '<%= TuanLeDAO.getTuanLeByMaNam(request.getParameter("maNamHoc")) %>' scope="session"></c:set>
	<table border="1" style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td>STT</td>
			<td>Ngày Bắt Đầu</td>
			<td>Ngày Kết Thúc</td>
			
		</tr>
	
		<% int stt=1; %>
		<c:forEach items="${listTuan}" var="tuan">
			<tr style="background-color: transparent;">
				<td><%=stt%></td>
				<td>
							
							<input type = "text" id="txtTuNgay<%=stt%>" name = "txtTuNgay<%=stt%>" value = "${tuan.tuNgay}" readonly="readonly" style="background-color: transparent;"/>
							<img name="imgTuNgay<%=stt%>" id="imgTuNgay<%=stt%>" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
							
				<td>
							
							<input type = "text" id="txtDenNgay<%=stt%>" name = "txtDenNgay<%=stt%>" value = "${tuan.denNgay}" readonly="readonly" style="background-color: transparent;"/>
							<img name="imgDenNgay<%=stt%>" id="imgDenNgay<%=stt%>" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
							
				</td>
				<input type = "hidden" value = "${tuan.maTuanLe}" name = "id<%=stt%>" id =  "id<%=stt%>" />
			</tr>
			<% stt++; %>
			
		</c:forEach>
		<tr>
			<td colspan ="3" align = "center">
					<a href = "javascript: submit()" >cap nhat</a></img>
			</td>
		</tr>
		
	</table>
	
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
	
	<script type="text/javascript">
//<![CDATA[  
  <%
  	 
  	for(int i=1; i< stt ; i++) {
  		String output = "";
  		output += "Zapatec.Calendar.setup({";
  		output += "firstDay          : 1,";
  		output += "weekNumbers       : false,";
  		output += "range             : [2000.01, 2030.12],";
  		output += "electric          : false,";
  		output += "inputField        : 'txtTuNgay" + i + "',";
  		output += "button            : 'imgTuNgay" + i + "',";
  		output += "ifFormat          : '%d-%m-%Y'";
  		output += "});";  		
  		out.println(output); 
  	}
  	for(int i=1; i< stt ; i++) {
  		String output = "";
  		output += "Zapatec.Calendar.setup({";
  		output += "firstDay          : 1,";
  		output += "weekNumbers       : false,";
  		output += "range             : [2000.01, 2030.12],";
  		output += "electric          : false,";
  		output += "inputField        : 'txtDenNgay" + i + "',";
  		output += "button            : 'imgDenNgay" + i + "',";
  		output += "ifFormat          : '%d-%m-%Y'";
  		output += "});";  		
  		out.println(output); 
  	}

  %>
//]]>
	</script>
	
</div>
</body>
</html>