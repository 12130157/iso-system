<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.QuyetDinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MoChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.HeDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%>
<%@page import="vn.edu.hungvuongaptech.model.HeDaoTaoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel"%>

<%@page import="vn.edu.hungvuongaptech.dao.ReportDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
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
<title>Báo cáo KHDT</title>

<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
<c:set var = "truongKhoa" value = "<%=Constant.TRUONG_KHOA %>"></c:set>

<script language="JavaScript" type="text/javascript">
	//Javascript validation functions		
	function submitFormSave(){
		document.forms["Report"].submit();
	}
	
	function submitFormSearch(){
		document.getElementById("chonNam").value = document.getElementById("cboNam").value;
		document.getElementById("chonKhoa").value = document.getElementById("cboKhoa").value;
		document.getElementById("chonTuan").value = document.getElementById("cboTuan").value;
		selectTinhTrang();
		document.forms["FileForm"].submit();
	}

	function selectTuan() {
		var choseTuan = document.getElementById("cboTuan").value;
		document.getElementById("cboNam").disabled = false;

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

	function selectKhoa() {
		var choseKhoa = document.getElementById("cboKhoa").value;
		document.getElementById("chonKhoa").value = choseKhoa;
	}

	function selectTinhTrang() {
		var choseTinhTrang = document.getElementById("cboTinhTrang").value;
		document.getElementById("tinhTrang").value = choseTinhTrang;
	}
</script>

</head>
<body onload="selectTuan();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form name="FileForm" action="<%=request.getContextPath()%>/reportController?phanloai=yes" method="post">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>BÁO CÁO KHDT</strong></div><br /></td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9" align="right">
					Công tác : 
				</td>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboTuan" id="cboTuan" style="width: 200px" onchange="selectTuan();">
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
				<th style="background-color: #99bff9" align="right">
					Năm	: 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboNam" id="cboNam" style="width: 200px" onchange="selectNam();">
						<c:forEach var="namHoc" items="<%= NamHocDAO.getAllNamHoc() %>">
							<option value="${namHoc.maNamHoc}" <c:if test = "${namHoc.maNamHoc eq param.maNam}">selected</c:if>>${namHoc.namBatDau} - ${namHoc.namKetThuc}</option>
						</c:forEach>
					</select>
				</th>
				<th rowspan="2" style="background-color: #99bff9">
					<input type = "hidden" value = "" name="chonKhoa" id="chonKhoa"/>
					<input type = "hidden" value = "" name="chonTuan" id="chonTuan"/>
					<input type = "hidden" value = "" name="chonNam" id="chonNam"/>
					<input type = "hidden" value = "" name="tinhTrang" id="tinhTrang"/>
					<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</th>
			</tr>
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9" align="right">
					Khoa : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboKhoa" id="cboKhoa" style="width: 200px" onchange="selectKhoa();" <c:if test = "${vaiTro eq truongKhoa}">disabled="disabled"</c:if>>
						<option value = "">  ---  All  ---  </option>
						<c:forEach var="khoa" items="<%= KhoaDAO.showAllKhoa() %>">
							<option value="${khoa.maKhoa}" <c:if test = "${khoa.maKhoa eq param.khoa}">selected</c:if>>${khoa.tenKhoa}</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="right">
					Tình trạng : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboTinhTrang" id="cboTinhTrang" style="width: 200px" onchange="selectTinhTrang();">
						<option value="">  ---  All  ---  </option>
						<option value="0" <c:if test = "${param.tinhTrang eq 0}">selected</c:if>> Chưa thực hiện </option>
						<option value="1" <c:if test = "${param.tinhTrang eq 1}">selected</c:if>>   Hoàn thành   </option>
						<option value="2" <c:if test = "${param.tinhTrang eq 2}">selected</c:if>>      Trễ       </option>
						<option value="3" <c:if test = "${param.tinhTrang eq 3}">selected</c:if>>Không hoàn thành</option>
					</select>
				</th>
			</tr>
		</table>
	</form>
	<br/>
	<form action="<%=request.getContextPath()%>/reportController?them=yes" method="post" name="Report">
		<table style="background-color: transparent;" border="1">
			<tr align="center" style="background-color: transparent;">
				<th style="background-color: #778899; color: white;" width="80">
					Ngày <br/>bắt đầu
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Ngày <br/>kết thúc
				</th>
				<th style="background-color: #778899; color: white;" width="180">
					Công việc
				</th>
				<th style="background-color: #778899; color: white;" >
					Bộ phận <br/>thực hiện
				</th>
				<th style="background-color: #778899; color: white;" >
					Người <br/>thực hiện
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Tình trạng
				</th>
			</tr>
			
			<%
			String maThanhVien = "", tinhTrang = "", maNam = "", tuan = "", khoa = "";
			tinhTrang = request.getParameter("tinhTrang");
			tuan = request.getParameter("tuan");
			maNam = request.getParameter("maNam");
			khoa = request.getParameter("khoa");
			maThanhVien =  (String)session.getAttribute("maThanhVien"); %>
			
			<!--show nội dung công tác-->
			<c:set 	var = "ListCongTac" value = '<%=ReportDAO.getCongTacReport(maThanhVien, tinhTrang, khoa, maNam, tuan) %>'></c:set>
			
			<% int count = 0; %>
			<c:set var="iterator" value="<%=count%>"></c:set>
			<c:forEach var="objCongTac" items = "${ListCongTac}">
				<tr style="background-color: transparent;">
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.tuNgay}</td>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.denNgay}</td>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.noiDungCongTac}</td>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.tenBoPhan}</td>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>${objCongTac.tenThanhVien}</td>
					<td <c:if test="${iterator % 2 eq 0}">style="background-color: #E6E6FA;"</c:if><c:if test="${iterator % 2 ne 0}">style="background-color: white;"</c:if>>
						<c:if test="${objCongTac.tinhTrang eq null or objCongTac.tinhTrang eq '0'}"><p style="color: maroon;">Chưa thực hiện</p></c:if>
						<c:if test="${objCongTac.tinhTrang eq '1'}"> Hoàn thành </c:if>
						<c:if test="${objCongTac.tinhTrang eq '2'}"><p style="color: red;">Trễ hạn</p></c:if>
						<c:if test="${objCongTac.tinhTrang eq '3'}"><p style="color: yellow;">Không hoàn thành</p></c:if>
					</td>
				</tr>
			<c:set var="iterator" value="${iterator+1}"></c:set>
			</c:forEach>
		</table>
	</form>
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</div>
</body>
</html>