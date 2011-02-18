<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<title>Hệ Thống Quản Lý ISO</title>

<script language="JavaScript" type="text/javascript">
	//Javascript validation functions		

	function submitForm(action){
		document.getElementById('actionType').value = action;
		document.forms["FileForm"].submit();
	}

	function selectTuan() {
		if(document.getElementById('cboTuan').value != ""){
			document.getElementById("cboNam").disabled = false;
		}
		else{
			document.getElementById("cboNam").disabled = true;
		}
	}
</script>
	
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
</head>
<body onload=" selectTuan();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	
	
	<!--phan loai công tác theo tuần bằng combobox-->
	<form name="FileForm" action="<%=request.getContextPath()%>/introController" method="post">
		<input type = "hidden" name = "actionType" id = "actionType"/>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>Nội dung công tác</strong></div><br /><br /></td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9">
					Công tác : 
					<select name = "cboTuan" id="cboTuan" onchange="selectTuan();">
						<option value = "" >Tuần hiện tại</option>	
						<option value = "0" <c:if test = "${param.tuan eq 0}">selected</c:if>>--------------</option>
						<c:forEach var="iterater" begin="1" end="54" step="1">
							<option value="${iterater}" <c:if test = "${iterater eq param.tuan}">selected</c:if>>Tuần ${iterater}</option>
						</c:forEach>
						<option value = "0" <c:if test = "${param.tuan eq 0}">selected</c:if>>--------------</option>
						<c:forEach var="iterater" begin="61" end="72" step="1">
							<option value="${iterater}" <c:if test = "${iterater eq param.tuan}">selected</c:if>>Tháng ${iterater - 60}</option>
						</c:forEach>
						<option value = "0" <c:if test = "${param.tuan eq 0}">selected</c:if>>--------------</option>
						<c:forEach var="iterater" begin="81" end="84" step="1">
							<option value="${iterater}" <c:if test = "${iterater eq param.tuan}">selected</c:if>>Quý ${iterater - 80}</option>
						</c:forEach>
					</select>
				</th>	
				<th style="background-color: #99bff9">
					Năm	
					<select name = "cboNam" id="cboNam">
						<c:forEach var="namHoc" items="<%= NamHocDAO.getAllNamHoc() %>">
							<option value="${namHoc.maNamHoc}" <c:if test = "${namHoc.maNamHoc eq param.maNam}">selected</c:if>>${namHoc.namBatDau} - ${namHoc.namKetThuc}</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9">
					Tình trạng
					<select name = "cboTinhTrang" id="cboTinhTrang">
						<option value="">  ---  All  ---  </option>
						<option value="0" <c:if test = "${param.tinhTrang eq 0}">selected</c:if>> Chưa thực hiện </option>
						<option value="1" <c:if test = "${param.tinhTrang eq 1}">selected</c:if>>   Hoàn thành   </option>
						<option value="2" <c:if test = "${param.tinhTrang eq 2}">selected</c:if>>      Trễ       </option>
						<option value="3" <c:if test = "${param.tinhTrang eq 3}">selected</c:if>>Không hoàn thành</option>
					</select>
				</th>
				<th style="background-color: #99bff9">
					<a href = "javascript: submitForm('phanloai')"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</th>
			</tr>
		</table>
	<!--hiển thị công tác-->
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Từ ngày</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Đến ngày</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Công tác</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1"><input type = "checkbox" name = "allCongTac" id="allCongTac" onclick="checkAllCongTac();"/></div></th>
			</tr>
			
			<%
			String maThanhVien = "", tinhTrang = "", maNam = "", tuan = "", check = "0";
			if(request.getParameter("tinhTrang") != null)
				tinhTrang = request.getParameter("tinhTrang");
			if(request.getParameter("tuan") != null)
				tuan = request.getParameter("tuan");
			if(request.getParameter("maNam") != null)
				maNam = request.getParameter("maNam");
			
			maThanhVien =  (String)session.getAttribute("maThanhVien"); %>
			
			<c:if test="${MaBoPhan eq BO_PHAN_PHC}">
				<%check = "1"; %>
			</c:if>
			<!--show nội dung công tác-->
			<c:set 	var = "ListCongTac" value = '<%=IntroDAO.getCongTac(tinhTrang, maThanhVien, maNam, tuan, check) %>'></c:set>
			
			<% int count = 0; %>
			<c:forEach var="objCongTac" items = "${ListCongTac}">
				<c:set var="iterator" value="<%=count%>"></c:set>
				<tr style="background-color: transparent;">
					<th width="120" <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.tuNgay}</th>
					<th width="120" <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.denNgay}</th>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>><div class = "div_txtintable">${objCongTac.noiDungCongTac}</div></td>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>><div class = "div_txtintable"><input type="checkbox" name="chkRow${iterator}" id="chkRow${iterator}" <c:if test="${objCongTac.tinhTrang eq 1}">disabled="disabled" checked="checked"</c:if><c:if test="${objCongTac.tinhTrang eq 3}">disabled="disabled"</c:if> /></div></td>
				</tr>
				
				<input type = "hidden" value = "${objCongTac.maNguoiThucHien}" name="maNguoiThucHien${iterator}" id="maNguoiThucHien${iterator}"/>
				<input type = "hidden" value = "${objCongTac.maBoPhan}" name="maBoPhanThucHien${iterator}" id="maBoPhanThucHien${iterator}"/>
				<input type = "hidden" value = "${objCongTac.maNoiDungChiTietKHDT}" name="maNoiDungChiTietKHDT${iterator}" id="maNoiDungChiTietKHDT${iterator}"/>
				<input type = "hidden" value = "${objCongTac.tuNgay}" name="tuNgay${iterator}" id="tuNgay${iterator}"/>
				<input type = "hidden" value = "${objCongTac.denNgay}" name="denNgay${iterator}" id="denNgay${iterator}"/>
				<input type = "hidden" value = "${objCongTac.noiDungCongTac}" name="noidung${iterator}" id="noidung${iterator}"/>
				<input type = "hidden" value = "${count}" name="soDong" id="soDong"/>
				<% count++; %>
			</c:forEach>
			<c:set var = "Row" value = "<%=count %>" scope = "session"/>
<script language="JavaScript" type="text/javascript">
	//Javascript validation functions
	function checkAllCongTac() {
		if(document.Intro.allCongTac.checked == true){					
			<%
				for (Integer i = 0; i < count; i++) {
					out.print("if(document.Intro.chkRow" + i.toString() +".checked == false){");
					out.print("document.Intro.chkRow" + i.toString() +".checked = true;}");
				}
			%>
		}
		else{
			<%
				for (Integer i = 0; i < count; i++) {
					out.print("if(document.Intro.chkRow" + i.toString() +".disabled == false){");
					out.print("document.Intro.chkRow" + i.toString() +".checked = false;\n}");
				}
			%>
		}
	}	
	
	
	function confirmDuyet() {
		var line = '\n';
		var msgFinish = "";
		<% for(Integer i=0;i<count;i++)
		{
			out.print("if(document.FileForm.chkRow" + i.toString() + ".checked == true && document.FileForm.chkRow" + i.toString() +".disabled == false)");
			out.print("msgFinish += document.getElementById('noidung" + i + "').value + line;");
		}
		%>
		if(msgFinish != '' && msgFinish != null){
			msgFinish = 'Bạn hoàn thành công tác \n ' + msgFinish;
			if(confirm(msgFinish))
				submitForm('duyet');}
		else
			alert("Không có công việc nào được chọn!");
	}
</script>	
			<tr style="background-color: transparent;">
				<td colspan="4">
					<a href = "javascript: confirmDuyet();"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="lưu" border = "0"/></a>
				</td>
			</tr>
		</table>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>