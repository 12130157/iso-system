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
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SuDungDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<title>Lịch sử dụng phòng</title>

<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
<c:set var = "truongKhoa" value = "<%=Constant.TRUONG_KHOA %>"></c:set>

<script language="JavaScript" type="text/javascript">
	//Javascript validation functions		
	
	function submitFormSearch(){
		document.forms["FileForm"].submit();
	}

	function selectTuan() {
		if(document.getElementById("cboTuan").value == ""){
			document.getElementById("cboNam").disabled = true;
		}
		else{
			document.getElementById("cboNam").disabled = false;
			document.getElementById("cboNam").value;
		}
	}
</script>

</head>
<body onload="selectTuan();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form name="FileForm" action="<%=request.getContextPath()%>/lichSuDungPhongController" method="post">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>Lịch sử dụng phòng</strong></div><br /></td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9" align="right">
					Khoa : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboKhoa" id="cboKhoa" style="width: 200px">
						<option value = "">  ---  All  ---  </option>
						<c:forEach var="khoa" items="<%= KhoaDAO.showAllKhoa() %>">
							<option value="${khoa.maKhoa}" <c:if test = "${khoa.maKhoa eq param.maKhoa}">selected</c:if>>${khoa.tenKhoa}</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="right">
					Môn học : 
				</td>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboMonHoc" id="cboMonHoc" style="width: 200px">
						<option value = "" >   ---  All  ---   </option>	
						<c:forEach var = "MonHoc" items="<%=MonHocDAO.getMonHoc() %>">
							<option value = "${MonHoc.maMonHoc}" <c:if test = "${param.maMonHoc eq MonHoc.maMonHoc}">selected</c:if>>${MonHoc.tenMonHoc}</option>
						</c:forEach>
					</select>
				</th>	
				<th style="background-color: #99bff9" align="right">
					Phòng : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboPhong" id="cboPhong">
						<option value = "" >   ---  All  ---   </option>	
						<c:forEach var = "Phong" items="<%=PhongBanDAO.getAllPhongBan() %>">
							<option value = "${Phong.maPhongBan}" <c:if test = "${param.maPhong eq Phong.maPhongBan}">selected</c:if>>${Phong.kiHieu}</option>
						</c:forEach>
					</select>
				</th>	
			</tr>
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9" align="right">
					Tuần : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboTuan" id="cboTuan" style="width: 200px" onchange="selectTuan();">
						<option value="">  ---  Tuần hiện tại  ---  </option>
						<c:forEach var = "iterator" begin="81" end="82" step="1">
							<option value = "${iterator}" <c:if test = "${not empty param.tuan and iterator eq param.tuan}">selected</c:if>>Học kì ${iterator - 80}</option>
						</c:forEach>
						<c:forEach var = "iterator" begin="61" end="72" step="1">
							<option value = "${iterator}" <c:if test = "${not empty param.tuan and iterator eq param.tuan}">selected</c:if>>Tháng ${iterator - 60}</option>
						</c:forEach>
						<c:forEach var="iterator" begin="1" end="54" step="1">
							<option value="${iterator}" <c:if test = "${not empty param.tuan and iterator eq param.tuan}">selected</c:if>>Tuần ${iterator}</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="right">
					Năm	: 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboNam" id="cboNam" style="width: 200px">
						<c:forEach var="namHoc" items="<%= NamHocDAO.getAllNamHoc() %>">
							<option value="${namHoc.maNamHoc}" <c:if test = "${namHoc.maNamHoc eq param.maNam}">selected</c:if>>${namHoc.namBatDau} - ${namHoc.namKetThuc}</option>
						</c:forEach>
					</select>
				</th>
				<th colspan="2" style="background-color: #99bff9">
					<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</th>
			</tr>
		</table>
	</form>
	<br/>
	
		<table style="background-color: transparent;" border="1">
			<tr align="center" style="background-color: transparent;">
				<th style="background-color: #778899; color: white;" width="80">
					Thứ
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Ngày
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Buổi
				</th>
				<th style="background-color: #778899; color: white;" >
					Lớp
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Môn học
				</th>
				<th style="background-color: #778899; color: white;" width="150">
					Giáo viên
				</th>
				<th style="background-color: #778899; color: white;" >
					Phòng
				</th>				
			</tr>
			
			<%
			String maPhong = "", maNam = "", tuan = "", maKhoa = "", maMonHoc = "";
			if(request.getParameter("maPhong") != null)
				maPhong = request.getParameter("maPhong");
			if(request.getParameter("tuan") != null)
				tuan = request.getParameter("tuan");
			if(request.getParameter("maNam") != null)
				maNam = request.getParameter("maNam");
			if(request.getParameter("maKhoa") != null)
				maKhoa = request.getParameter("maKhoa");
			if(request.getParameter("maMonHoc") != null)
				maMonHoc = request.getParameter("maMonHoc");
			%>
			<c:set 	var = "ListSuDung" value = '<%=ChiTietTKBDAO.getLichSuDungPhongByDieuKien(maPhong,maNam,tuan,maKhoa, maMonHoc) %>' scope="session"></c:set>
		
			<c:forEach var="obj" items = "${ListSuDung}">
				<tr style="background-color: transparent;">
					<c:choose>
						<c:when test = "${obj.thuTrongTuan eq 1}">
							<td>Hai</td>
						</c:when>	
						<c:when test = "${obj.thuTrongTuan eq 2}">
							<td>Ba</td>
						</c:when>	
						<c:when test = "${obj.thuTrongTuan eq 3}">
							<td>Tư</td>
						</c:when>	
						<c:when test = "${obj.thuTrongTuan eq 4}">
							<td>Năm</td>
						</c:when>	
						<c:when test = "${obj.thuTrongTuan eq 5}">
							<td>Sáu</td>
						</c:when>	
						<c:when test = "${obj.thuTrongTuan eq 6}">
							<td>Bảy</td>
						</c:when>	
						<c:otherwise>
							<td>Chủ nhật</td>
						</c:otherwise>
					</c:choose>
					<td>${obj.ngayHoc}</td>
					<td>${obj.buoi}</td>
					<td>${obj.kiHieuLop}</td>
					<td>${obj.tenMonHoc}</td>
					<td>${obj.tenGiaoVien}</td>
					<td>${obj.phong}</td>
				</tr>
			</c:forEach>
		</table>
		<table>	
			<tr>
				<td colspan="7">	
					<a href = "<%=Constant.PATH_RES.getString("iso.InLichSuDungPhongPath") %>">								 
						<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
					</a>
				</td>
			</tr>
		</table>
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</div>
</body>
</html>