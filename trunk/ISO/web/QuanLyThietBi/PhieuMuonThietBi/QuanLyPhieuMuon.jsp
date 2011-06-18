<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuBaoTriThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.util.DateUtil"%><html>
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
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
<title>Quản lý phiếu mượn</title>
<script type="text/javascript">
	var duongDan = "";
	function pageLoad()
	{
		//duongDan = 'QuanLyThietBi/PhieuMuonThietBi/';
	}
	function themPhieuMuon()
	{
		var value = window.showModalDialog(duongDan + "ThemPhieuMuon.jsp",'',"dialogHeight: 450px; dialogWidth: 450px; dialogTop: 120px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value!=false && value != null)
			location.href = "<%=Constant.PATH_RES.getString("qltb.QuanLyPhieuMuonPath")%>";
			window.location.reload();		
	}
	function search()
	{
		document.getElementById('actionType').value = "TimPhieuMuon";
		document.getElementById('formPhieuMuon').submit();
	}
</script>
</head>
<body onload="pageLoad();">
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
<form action="<%=request.getContextPath()%>/phieuMuonController" name  = "formPhieuMuon" id = "formPhieuMuon" method="post">
		
		<input type="hidden" id="actionType" name = "actionType"/>	
		<input type="hidden" id="txtPage" name = "txtPage"/>		
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách Các phiếu mượn</div>
				</td>
			</tr>
		</table>
			
	
		<% 
			String ten = "", ngay = "", currentPage = "1", khoa = ""; 
			if(request.getAttribute("hoTenTimKiem") != null)
				ten = (String) request.getAttribute("hoTenTimKiem");
			
			if(request.getParameter("ngay") != null)
				ngay = request.getParameter("ngay");
			else
				ngay = DateUtil.setDate(SysParamsDAO.getNgayGioHeThong().getNgayHeThong());
			if(request.getParameter("khoa") != null)
				khoa = request.getParameter("khoa");
			
			if(request.getParameter("page") != null)
				currentPage = request.getParameter("page");
			
			int c = 1, totalRow = 0;
			totalRow = PhieuMuonThietBiDAO.getCountPhieuMuonThietBi(ten, ngay, khoa);
			ArrayList<PhieuMuonThietBiModel> listPhieuMuon = PhieuMuonThietBiDAO.getAllPhieuMuonThietBiByDieuKien(ten, ngay, khoa, totalRow, currentPage);
		%>
		<c:set var="CurrentPage" value="<%=currentPage %>"></c:set>
		<c:set var='ListKhoa' value='<%=KhoaDAO.showAllKhoa()%>'></c:set>
		<table border='1' style="background-color: transparent;">
			<tr>
				<td colspan="2">
					Khoa 	
						<select id="cboKhoa" name="cboKhoa">
							<option value = "">Chọn</option>	
												
							<c:forEach var="Khoa" items="${ListKhoa}">
								<option value = "${Khoa.maKhoa}" 
									<c:if test = "${param.khoa eq Khoa.maKhoa}">selected</c:if>>${Khoa.tenKhoa}</option>
							</c:forEach>
						</select>	
				</td>
				<td rowspan="2"><a href = "javascript: search();"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a></td>
			</tr>
			<tr>
				<td>
					Ngày
					<input type="text" name = "txtNgay" id = "txtNgay" value = "<%=ngay %>"/>
				</td>
				<td>Họ tên
						<input type="text" name="txtHoTen" id = "txtHoTen" value = "<%=ten %>"/>
				</td>
			</tr>
			
		</table>	
		<table border="1">
			<tr>
				<th style='background-color: #186fb2;color:white'>STT</th>
				<th style='background-color: #186fb2;color:white'>Họ Tên</th>
				<th style='background-color: #186fb2;color:white'>Khoa</th>	
				<th style='background-color: #186fb2;color:white'>Ngày mượn</th>							
			</tr>
					
			<c:set var="listPhieuMuon" value="<%= listPhieuMuon %>" scope = "session"></c:set>
					
			
			<c:forEach var="PhieuMuon" items="${listPhieuMuon}">
				<tr>
					<td><%=c %></td>
					<td><a href = "<%= Constant.PATH_RES.getString("qltb.MuonThietBiPath") %>?maPhieuMuon=${PhieuMuon.maPhieuMuon}">${PhieuMuon.tenNguoiMuon }</a></td>
					<td>${PhieuMuon.khoa }</td>		
					<td>${PhieuMuon.ngayMuon }</td>			
				</tr>
				<%c++; %>
				
			</c:forEach>
			<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRow) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		<c:if test = "${TotalPage gt 1}">	
			<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test = "${CurrentPage gt 1}">
						<a href="javacript: timTheoTrang(${CurrentPage - 1 })" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="javacript: timTheoTrang(${PageCount })">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="javacript: timTheoTrang(${CurrentPage - 1 })" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr>
		</c:if>	
		</table>
		<p align="center"><a href = "javascript: themPhieuMuon();"><img src="<%=request.getContextPath()%>/images/buttom/themphieumuon.png" alt="thêm phiếu mượn" border = "0" /></a></p>	
<script>
	//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtNgay",
	button            : "Calendar",
	ifFormat          : "%m-%d-%Y"
  });
//]]>
	function timTheoTrang(page)
	{
		document.getElementById('cboKhoa').value = <%="'" + khoa + "'"%>;
		document.getElementById('txtTen').value = <%="'" + ten + "'"%>;
		document.getElementById('txtNgay').value = <%="'" + ngay + "'"%>;
		document.getElementById('txtPage').value = page;
		document.getElementById('actionType').value = "TimPhieuMuonTheoTrang";
		document.getElementById('formPhieuMuon').submit();
	}
  </script>
  <!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</form>
</div>
</div>			
</body>
</html>