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
	function submitFormSave(){
		document.forms["Intro"].submit();
	}
	
	function submitFormSearch(){
		document.getElementById("chonNam").value = document.getElementById("cboNam").value;
		document.getElementById("chonTuan").value = document.getElementById("cboTuan").value;
		document.getElementById("tinhTrang").value = document.getElementById("cboTinhTrang").value;
		document.forms["FileForm"].submit();
	}

	function selectTuan() {
		var choseTuan = document.getElementById("cboTuan").value;
		var choseNam;
		
		if(document.getElementById("cboNam").disabled == true){
			document.getElementById("cboNam").disabled = false;
		}
		
		if(choseTuan == ""){
			document.getElementById("cboNam").disabled = true;
			document.getElementById("chonTuan").value = "";
			document.getElementById("chonNam").value = "";
		}
		else{
			
			document.getElementById("chonTuan").value = choseTuan;
			choseNam = document.getElementById("cboNam").value;
			document.getElementById("chonNam").value = choseNam;
		}
	}

	function selectNam() {
		var choseNam = document.getElementById("cboNam").value;
		document.getElementById("chonNam").value = choseNam;
	}

	function selectTinhTrang() {
		var choseTinhTrang = document.getElementById("cboTinhTrang").value;
		document.getElementById("tinhTrang").value = choseTinhTrang;
	}
</script>
	
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "admin" value = '<%=Constant.ADMIN%>'></c:set>
	<c:set var = "phongDaoTao" value = '<%=Constant.PHONG_DAO_TAO%>'> </c:set>
	<c:set var = "hieuTruong" value = '<%=Constant.HIEU_TRUONG%>'></c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>

</head>
<body onload=" selectTuan();selectNam();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	<!--phan loai công tác theo tuần bằng combobox-->
	<form name="FileForm" action="<%=request.getContextPath()%>/introController?phanloai=yes" method="post">
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
						<option value = "0" <c:if test = "${param.tuan eq 0}">selected</c:if>>-- None --</option>
						<c:forEach var="iterater" begin="1" end="54" step="1">
							<option value="${iterater}" <c:if test = "${iterater eq param.tuan}">selected</c:if>>Tuần ${iterater}</option>
						</c:forEach>
						<option value = "0">-- None --</option>
						<c:forEach var="iterater" begin="61" end="72" step="1">
							<option value="${iterater}" <c:if test = "${iterater eq param.tuan}">selected</c:if>>Tháng ${iterater - 60}</option>
						</c:forEach>
						<option value = "0">-- None --</option>
						<c:forEach var="iterater" begin="81" end="84" step="1">
							<option value="${iterater}" <c:if test = "${iterater eq param.tuan}">selected</c:if>>Quý ${iterater - 80}</option>
						</c:forEach>
					</select>
				</th>	
				<th style="background-color: #99bff9">
					Năm	
					<select name = "cboNam" id="cboNam" onchange="selectNam();">
						<c:forEach var="namHoc" items="<%= NamHocDAO.getAllNamHoc() %>">
							<option value="${namHoc.maNamHoc}" <c:if test = "${namHoc.maNamHoc eq param.maNam}">selected</c:if>>${namHoc.namBatDau} - ${namHoc.namKetThuc}</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9">
					Tình trạng
					<select name = "cboTinhTrang" id="cboTinhTrang" onchange="selectTinhTrang();">
						<option value="">  ---  All  ---  </option>
						<option value="0" <c:if test = "${param.tinhTrang eq 0}">selected</c:if>> Chưa thực hiện </option>
						<option value="1" <c:if test = "${param.tinhTrang eq 1}">selected</c:if>>   Hoàn thành   </option>
						<option value="2" <c:if test = "${param.tinhTrang eq 2}">selected</c:if>>      Trễ       </option>
						<option value="3" <c:if test = "${param.tinhTrang eq 3}">selected</c:if>>Không hoàn thành</option>
					</select>
				</th>
				<th style="background-color: #99bff9">
					<input type = "hidden" value = "" name="chonTuan" id="chonTuan"/>
					<input type = "hidden" value = "" name="chonNam" id="chonNam"/>
					<input type = "hidden" value = "" name="tinhTrang" id="tinhTrang"/>
					<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</th>
			</tr>
		</table>
	</form>
	<!--hiển thị công tác-->
	<form action="<%=request.getContextPath()%>/introController?duyet=yes" method="post" name="Intro">
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Từ ngày</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Đến ngày</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Công tác</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1"><input type = "checkbox" name = "allCongTac" id="allCongTac" onclick="checkAllCongTac();"/></div></th>
			</tr>
			
			<%
			String maThanhVien = "", tinhTrang = "", maNam = "", tuan = "";
			tinhTrang = request.getParameter("tinhTrang");
			tuan = request.getParameter("tuan");
			maNam = request.getParameter("maNam");
			maThanhVien =  (String)session.getAttribute("maThanhVien"); %>
			
			
			<!--show nội dung công tác-->
			<c:set 	var = "ListCongTac" value = '<%=IntroDAO.getCongTac(tinhTrang, (String) session.getAttribute("maThanhVien"), maNam, tuan) %>'></c:set>
			
			<% int count = 0; %>
			<c:forEach var="objCongTac" items = "${ListCongTac}">
				<c:set var="iterator" value="<%=count%>"></c:set>
				<tr style="background-color: transparent;">
					<th width="120" <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.tuNgay}</th>
					<th width="120" <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.denNgay}</th>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>><div class = "div_txtintable">${objCongTac.noiDungCongTac}</div></td>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>><div class = "div_txtintable"><input type="checkbox" name="chkRow${iterator}" id="chkRow${iterator}" <c:if test="${objCongTac.tinhTrang eq 1}">disabled="disabled" checked="checked"</c:if><c:if test="${objCongTac.tinhTrang eq 3}">disabled="disabled"</c:if> /></div></td>
				</tr>
				<input type = "hidden" value = "" name="chonTuanShow" id="chonTuanShow"/>
				<input type = "hidden" value = "" name="chonNamShow" id="chonNamShow"/>
				<input type = "hidden" value = "${objCongTac.maNguoiThucHien}" name="maNguoiThucHien${iterator}" id="maNguoiThucHien${iterator}"/>
				<input type = "hidden" value = "${objCongTac.maBoPhan}" name="maBoPhanThucHien${iterator}" id="maBoPhanThucHien${iterator}"/>
				<input type = "hidden" value = "${objCongTac.maNoiDungChiTietKHDT}" name="maNoiDungChiTietKHDT${iterator}" id="maNoiDungChiTietKHDT${iterator}"/>
				<input type = "hidden" value = "${objCongTac.tuNgay}" name="tuNgay${iterator}" id="tuNgay${iterator}"/>
				<input type = "hidden" value = "${objCongTac.denNgay}" name="denNgay${iterator}" id="denNgay${iterator}"/>
				<input type = "hidden" value = "${objCongTac.noiDungCongTac}" name="noidung${iterator}" id="noidung${iterator}"/>
				<input type = "hidden" value = "${count}" name="soDong" id="soDong"/>
				<% count++; %>
			</c:forEach>
			
<script language="JavaScript" type="text/javascript">
	//Javascript validation functions
	function checkAllCongTac() {
		if(document.Intro.allCongTac.checked == true){					
			<%
				for (Integer i = 0; i < Constant.NUM_ROWS; i++) {
					out.print("if(document.Intro.chkRow" + i.toString() +".checked == false){");
					out.print("document.Intro.chkRow" + i.toString() +".checked = true;}");
				}
			%>
		}
		else{
			<%
				for (Integer i = 0; i < Constant.NUM_ROWS; i++) {
					out.print("if(document.Intro.chkRow" + i.toString() +".disabled == false){");
					out.print("document.Intro.chkRow" + i.toString() +".checked = false;\n}");
				}
			%>
		}
	}	
	
	
	function confirmDuyet() {
		var line = '\n';
		var msgFinish = "";
		var choseTuan = document.getElementById("cboTuan").value;
		var choseNam = document.getElementById("cboNam").value;
		
		document.getElementById("chonTuanShow").value = choseTuan;
		document.getElementById("chonNamShow").value = choseNam;
		
		<% for(Integer i=0;i<count;i++)
		{
			out.print("if(document.Intro.chkRow" + i.toString() + ".checked == true && document.Intro.chkRow" + i.toString() +".disabled == false)");
			out.print("msgFinish += document.getElementById('noidung" + i + "').value + line;");
		}
		%>
		if(msgFinish != '' && msgFinish != null){
			msgFinish = 'Bạn hoàn thành công tác \n ' + msgFinish;
			if(confirm(msgFinish))
				submitFormSave();}
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