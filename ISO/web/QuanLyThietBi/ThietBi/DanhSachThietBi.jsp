<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.PhongBanModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.LoaiThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.TinhTrangThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%>
<%@page import="vn.edu.hungvuongaptech.dao.TinhTrangThietBiDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<script type="text/javascript" language="JavaScript">	
	function search()
	{
		document.getElementById('actionType').value = 'searchThietBi';
		document.forms['formThietBi'].submit();
	}
	function submit()
	{
		document.getElementById("formThietBi").submit();
	}
</script>
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Hệ Thống Quản Lý Thiết Bị</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>	
	<c:set var="listPhong" value="<%= PhongBanDAO.getAllPhongBan() %>"></c:set>
	<c:set var="listLoaiThietBi" value="<%= LoaiThietBiDAO.getAllLoaiThietBi() %>"></c:set>
	<c:set var="listTinhTrang" value="<%= TinhTrangThietBiDAO.getAllTinhTrangThietBi()%>" />
	
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formThietBi" id = "formThietBi" method="post">
		<div>
		<input type="hidden" id="actionType" value="tinhtrang" name = "actionType"/>		
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách Các Thiết Bị</div>
				</td>
			</tr>
		</table>
		<c:choose>
			<c:when test = "${param.BaoHuThietBi eq 'ok'}">
				<font class="msg">Báo hư thiết bị thành công</font>
			</c:when>
			<c:when test = "${param.BaoHuThietBi eq 'fail'}">
				<font class="error">Báo hư thiết bị thất bại</font>
			</c:when>
			<c:when test = "${param.XoaThietBi eq 'ok'}">
				<font class="msg">Xóa thiết bị thành công</font>
			</c:when>
			<c:when test = "${param.XoaThietBi eq 'fail'}">
				<font class="error">Xóa thiết bị thất bại</font>
			</c:when>
		</c:choose>
	
		<% 
			String loaiThietBi = "", phongBan = "", tinhTrang = "", currentPage = "1", tenThietBi = ""; 
			if(request.getParameter("loaiThietBi") != null)
				loaiThietBi = request.getParameter("loaiThietBi");
			
			if(request.getParameter("phongBan") != null)
				phongBan = request.getParameter("phongBan");
			
			if(request.getParameter("tinhTrang") != null)
				tinhTrang = request.getParameter("tinhTrang");
			
			if(request.getParameter("page") != null)
				currentPage = request.getParameter("page");
			
			if(request.getAttribute("tenThietBi") != null)
			tenThietBi = (String) request.getAttribute("tenThietBi");
			
			int c = 1, totalRow = 0;
			totalRow = ThietBiDAO.getCountThietBi(loaiThietBi, phongBan, tinhTrang, tenThietBi);
			ArrayList<ThietBiModel> thietBiList = ThietBiDAO.getAllThietBiByDieuKien(loaiThietBi, phongBan, tinhTrang, totalRow, currentPage, "", "2");
		%>
		<c:set var="CurrentPage" value="<%=currentPage %>"></c:set>
		<table border='1' style="background-color: transparent;">
			<tr>
				<td>
					Phòng 
					<select>
						<option>Chọn</option>
						<option>G2.1</option>
					</select>	
				</td>
				<td>
					Khoa/TT
					<select>
						<option>Chọn</option>
						<option>Công Nghệ Thông Tin</option>
					</select> 
				</td>
				<td>
					Loại Thiết Bị
					<select>
						<option>Chọn</option>
						<option>PC</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Tình Trạng
					<select>
						<option>Chọn</option>
						<option>Tốt</option>
					</select>
				</td>
				<td colspan="2">
					Vào lúc
					<select>
						<option>Chọn</option>
						<c:forEach var="n" begin="0" end="23" step="1">
							<option>${n}</option>
						</c:forEach>
					</select>
					:
					<select>
						<option>Chọn</option>
						<c:forEach var="n" begin="0" end="59" step="1">
							<option>${n}</option>
						</c:forEach>
					</select>
					đến
					<select>
						<option>Chọn</option>
						<c:forEach var="n" begin="0" end="23" step="1">
							<option>${n}</option>
						</c:forEach>
					</select>
					:
					<select>
						<option>Chọn</option>
						<c:forEach var="n" begin="0" end="59" step="1">
							<option>${n}</option>
						</c:forEach>
					</select> 
				</td>		
			</tr>
			<tr>				
				<td>Hiện Trạng
					<select>
						<option>Chọn</option>
						<option>Tốt</option>
					</select>
				</td>
				<td colspan="2">
					Từ ngày 
					<input type="text" />
					đến
					<input type="text" />
					<input type="button" value="Tìm Kiếm" />
				</td>
			</tr>
		</table>		
		
		<table border="1">
			<tr>
				<th bgcolor = "#186fb2">
					<div class = "div_textWhite">
						<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"></input>
					</div>
				</th>
				<th style='background-color: #186fb2;color:white'>STT</th>
				<th style='background-color: #186fb2;color:white'>Loại thiết bị</th>
				<th style='background-color: #186fb2;color:white'>Kí Hiệu</th>
				<th style='background-color: #186fb2;color:white'>Tên thiết bị</th>
				<th style='background-color: #186fb2;color:white'>Tên phòng ban</th>
				<th style='background-color: #186fb2;color:white'>Tình trạng</th>								
			</tr>	
		</table>
		<table>
			<tr>
				<td>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/ThemThietBi.jsp"><img src="<%=request.getContextPath()%>/images/buttom/themthietbi.png" alt="thêm thiết bị" border = "0" /></a>
					<a href = "javascript: xoaThietBi()">
						<img src="<%=request.getContextPath()%>/images/buttom/xoa.png" alt="Xóa Thiết bị" border = "0" />
					</a>
					<a href = "javascript:baoHuThietBi();" alt="Báo Hư" border = "0" /><img src="<%=request.getContextPath()%>/images/buttom/baohu.png" alt="Báo hư" border = "0" /></a>	
					<input type = "hidden" name="xuly" id = "xuly" />									
				</td>
				<!--<td>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/MuonThietBi.jsp"><img src="<%=request.getContextPath()%>/images/buttom/muon.png" alt="Mượn Thiết Bị" border = "0" /></a>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/BaoThietBiDenHan.jsp"><img src="<%=request.getContextPath()%>/images/buttom/tra.png" alt="Trả Thiết Bị" border = "0" /></a>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/ThayDoiThietBi.jsp"><img src="<%=request.getContextPath()%>/images/buttom/thaydoithietbi.png" alt="Thay Đổi Thiết Bị" border = "0" /></a>			
				</td>	
			--></tr>
		</table>
		</div>
		<input type = "hidden" name = "txtListThietBi" id = "txtListThietBi"/>
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>