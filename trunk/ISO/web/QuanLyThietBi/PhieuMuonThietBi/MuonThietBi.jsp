<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietPhieuMuonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TinhTrangThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TinhTrangThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%><html>
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
<title>Mượn thiết bị</title>
<script type="text/javascript">
var duongDan = "QuanLyThietBi/PhieuMuonThietBi/";
function timKiemChiTietPhieuMuon()
{
	document.getElementById('txtHiddenTinhTrangXemPhieuMuon').value = document.getElementById('cboTinhTrang').value;
	document.getElementById('actionType').value = "Search";
	document.getElementById('formMuonThietBi').submit();
}
function timKiemThietBi()
{
	document.getElementById('txtHiddenLoaiThietBi').value = document.getElementById('cboLoaiThietBi').value;
	document.getElementById('txtHiddenPhongBan').value = document.getElementById('cboPhongBan').value;
	document.getElementById('txtHiddenTinhTrangChonThietBi').value = document.getElementById('cboTinhTrang').value;
	document.getElementById('txtHiddenTenThietBi').value = document.getElementById('txtTenThietBi').value;
	document.getElementById('actionType').value = "Search";
	document.getElementById('formMuonThietBi').submit();
}
function chonCheDoXem()
{
	document.getElementById('actionType').value = "Search";
	if(document.getElementById('RdChonThietBi').checked == true)
		document.getElementById('txtChoice').value = "1";
	else
		document.getElementById('txtChoice').value = "2";
	document.getElementById('formMuonThietBi').submit();
}
/*function kiemTraThietBiMuon(str)
{
	var xmlhttp;    
	if (str=="")
	  {
	  document.getElementById("txtHint").innerHTML="";
	  return;
	  }
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","getcustomer.asp?q="+str,true);
	xmlhttp.send();
}*/
</script>
</head>
<body>
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<%
		String maPhieuMuon = request.getParameter("maPhieuMuon");
		PhieuMuonThietBiModel phieuMuonSimple = PhieuMuonThietBiDAO.getPhieuMuonByID(maPhieuMuon); 
		int c = 1;
	%>
	<c:set var = "PhieuMuonSimple" value = "<%=phieuMuonSimple %>"/>
	<c:set var = "NgayHienTai" value="<%=SysParamsDAO.getNgayGioHeThong().getNgayHeThong() %>"/>
	<c:set var = "SoSanhNgay" value = "${sf:compareDate(NgayHienTai, PhieuMuonSimple.ngayMuon)}"></c:set>
		<c:choose>
			<c:when test="${not empty param.choice}">
				<c:set var = "Choice" value = "${param.choice}"/>
			</c:when>
			<c:otherwise>
				<c:set var = "Choice" value = "2"/>
			</c:otherwise>
		</c:choose>
	<form id = "formMuonThietBi" action="<%=request.getContextPath()%>/phieuMuonController" method="post">	
		<table>
			<tr style="background-color: transparent;">
				<td colspan="2">
					<div class = "div_thanhvientieude">Mượn thiết bị</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2">
					<br/>
					<br/>
					Người mượn : <input type="text" id = "txtNguoiMuon" value = "${PhieuMuonSimple.tenNguoiMuon }"/>
					Ngày mượn : <input type="text" name="txtNgayMuon" id = "txtNgayMuon" value = "${PhieuMuonSimple.ngayMuon }"/>
					<br/>
					<br/>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<input type = "radio" id = "RdChonThietBi" name = "RdChon" 
						value = "ChonThietBi" onclick="chonCheDoXem();"
							<c:if test = "${Choice eq 1}">checked</c:if>>Chọn thiết bị</input>
				</td>
				<td>
					<input type = "radio" id = "RdXemPhieuMuon" name="RdChon" 
						value = "XemPhieuMuon" onclick="chonCheDoXem();"
							<c:if test = "${Choice eq 2}">checked</c:if>>Xem phiếu mượn</input>
				</td>
			</tr>
		</table>
		<br/>
		<br/>
		<%
			String tenThietBi = "";
			if(request.getAttribute("tenThietBi") != null)
			tenThietBi = (String) request.getAttribute("tenThietBi");
		%>
		<input type = "hidden" name="txtHiddenLoaiThietBi" id = "txtHiddenLoaiThietBi" value = "${param.loaiThietBi }"/>
		<input type = "hidden" name="txtHiddenTenThietBi" id = "txtHiddenTenThietBi" value = "<%=tenThietBi %>"/>
		<input type = "hidden" name="txtHiddenPhongBan" id = "txtHiddenPhongBan" value = "${param.phongBan }"/>
		<input type = "hidden" name="txtHiddenTinhTrangChonThietBi" id = "txtHiddenTinhTrangChonThietBi" value = "${param.tinhTrangThietBi }"/>
		<input type = "hidden" name="txtHiddenTinhTrangXemPhieuMuon" id = "txtHiddenTinhTrangXemPhieuMuon" value = "${param.tinhTrangXemPhieuMuon }"/>
		<input type = "hidden" name = "txtMaPhieuMuon" id = "txtMaPhieuMuon" value = "${param.maPhieuMuon }"/>
		
		<input type = "hidden" name = "txtChoice" id = "txtChoice" value = "${Choice}"/>
		<input type="hidden" id="actionType" name = "actionType"/>	
		<c:choose>
			<c:when test = "${param.MuonThietBi eq 'ok'}">
				<font class="msg">Mượn thiết bị thành công</font>
			</c:when>
			<c:when test = "${param.MuonThietBi eq 'fail'}">
				<font class="error">Mượn thiết bị thất bại</font>
			</c:when>
			<c:when test = "${param.XoaThietBiMuon eq 'ok'}">
				<font class="msg">Xóa thiết bị mượn thành công</font>
			</c:when>
			<c:when test = "${param.XoaThietBiMuon eq 'fail'}">
				<font class="error">Xóa thiết bị mượn thất bại</font>
			</c:when>
			<c:when test = "${param.TraThietBi eq 'ok'}">
				<font class="msg">Trả thiết bị thành công</font>
			</c:when>
			<c:when test = "${param.TraThietBi eq 'fail'}">
				<font class="error">Trả thiết bị thất bại</font>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test = "${Choice eq 1}">
			<c:set var="listPhong" value="<%= PhongBanDAO.getAllPhongBan() %>"></c:set>
			<c:set var="listLoaiThietBi" value="<%= LoaiThietBiDAO.getAllLoaiThietBi() %>"></c:set>
			<c:set var="listTinhTrang" value="<%= TinhTrangThietBiDAO.getAllTinhTrangThietBi()%>" />
				<% 
			String loaiThietBi = "", phongBan = "", tinhTrang = "", currentPage = "1"; 
			if(request.getParameter("loaiThietBi") != null)
				loaiThietBi = request.getParameter("loaiThietBi");
			
			if(request.getParameter("phongBan") != null)
				phongBan = request.getParameter("phongBan");
			
			if(request.getParameter("tinhTrangThietBi") != null)
				tinhTrang = request.getParameter("tinhTrangThietBi");
			
			if(request.getParameter("page") != null)
				currentPage = request.getParameter("page");
			
			
			
			c = 1;
			int totalRow = 0;
			totalRow = ThietBiDAO.getCountThietBi(loaiThietBi, phongBan, tinhTrang, tenThietBi);
			ArrayList<ThietBiModel> thietBiList = ThietBiDAO.getAllThietBiByDieuKien(loaiThietBi, phongBan, tinhTrang, totalRow, currentPage, tenThietBi, "1");
		%>
		<c:set var="CurrentPage" value="<%=currentPage %>"></c:set>
		
		<table border='1' style="background-color: transparent;">
			<tr align="left">
				<td  align="left">
					Loại 	
						<select id="cboLoaiThietBi" name="cboLoaiThietBi">
							<option 
								<c:if test="${param.loaiThietBi eq ''}"> selected</c:if>
									value = "" >Chọn</option>	
												
							<c:forEach var="loaiThietBi" items="${listLoaiThietBi}">
								<option 
									<c:if test="${param.loaiThietBi eq loaiThietBi.maLoaiThietBi}">selected</c:if>
										value="${loaiThietBi.maLoaiThietBi}">${loaiThietBi.tenLoaiThietBi}
								</option>
							</c:forEach>
						</select>	
				</td>
				
				<td  align="left">
					Phòng 	
					<select id="cboPhongBan" name="cboPhongBan">
						<option 
								<c:if test="${param.phongBan eq ''}"> selected</c:if>
								value = "" >Chọn</option>	
											
						<c:forEach var="phong" items="${listPhong}">
							<option 
									<c:if test="${param.phongBan eq phong.maPhongBan}">selected</c:if>
									value="${phong.maPhongBan}">${phong.kiHieu}
							</option> 
						</c:forEach>
					</select> 
				</td>
				<td rowspan="2"><a href = "javascript: timKiemThietBi();"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a></td>	
			</tr>
			<tr>			
				<td align="left">Tên thiết bị
					<input type = "text" id = "txtTenThietBi" name = "txtTenThietBi" value = "<%=tenThietBi %>"/>
				</td>
				<td  align="left">Tình trạng 
						<select id="cboTinhTrang" name="cboTinhTrang">
							<option 
								<c:if test="${param.tinhTrangThietBi eq ''}"> selected</c:if>
									value = "" >All</option>	
												
								<c:forEach var="tt" items="${listTinhTrang}">
									<option 
										<c:if test="${param.tinhTrangThietBi eq tt.maTinhTrang}">selected</c:if>
										value="${tt.maTinhTrang}">${tt.tenTinhTrang}
									</option> 
								</c:forEach>
						</select>
				</td>
				
			</tr>
		</table>		
		<br/>
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
				<th style='background-color: #186fb2;color:white'>Kiểm tra</th>								
			</tr>
					
			<c:set var="listThietBi" value="<%= thietBiList %>" scope = "session"></c:set>
					
			
			<c:forEach var="ThietBi" items="${listThietBi}">
				<tr background="">
					<td>
						<input type="checkbox" name="chk<%=c %>" id="chk<%=c %>" onclick="checkRow(); " 
							value = "${ThietBi.maThietBi }" <c:if test = "${ThietBi.maTinhTrang ne '0'}">disabled</c:if>/>
					</td>
					<td><%=c %></td>
					<td>${ThietBi.tenLoaiThietBi }</td>
					<td>${ThietBi.kiHieu }</td>
					<td>${ThietBi.tenThietBi }</td>
					<td>${ThietBi.tenPhongBan }</td>
					<td id = "tdKiemTra${ThietBi.maThietBi }"></td>					
				</tr>
				<%c++; %>
				
			</c:forEach>
			
				<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRow) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		<c:if test = "${TotalPage gt 1}">					
		 	<tr style="background-color: transparent;">
				<td colspan="7">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachThietBi")%>?page=${CurrentPage - 1}&phongBan=<%=phongBan %>&loaiThietBi=<%=loaiThietBi%>&tinhTrang=<%=tinhTrang%>>" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachThietBi")%>?page=${PageCount}&phongBan=<%=phongBan %>&loaiThietBi=<%=loaiThietBi%>&tinhTrang=<%=tinhTrang%>">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachThietBi")%>?page=${CurrentPage + 1}&phongBan=<%=phongBan %>&loaiThietBi=<%=loaiThietBi%>&tinhTrang=<%=tinhTrang%>" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr>
		</c:if>	
		</table>
		<input type = "hidden" id = "txtThoiGianMuon" name = "txtThoiGianMuon"/>
		<input type = "hidden" id = "txtThoiGianTra" name = "txtThoiGianTra"/>
		<c:if test = "${SoSanhNgay ne true}">
			<p align="center">
				<a href = "javascript: muonThietBi();">
					<img src="<%=request.getContextPath()%>/images/buttom/muon.png" alt="Mượn thiết bị" border = "0" />
			</a></p>
		</c:if>
			<script type="text/javascript">
				function muonThietBi()
				{
					var str = "";
					var check = true;
					for(var i=1;i<<%=c%>;i++)
					{
						if(document.getElementById('chk' + i).checked == true)
							str += "-" + document.getElementById('chk' + i).value;
					}
					if(str != "")
					{
						var ngayMuon = document.getElementById('txtNgayMuon').value;
						var value = window.showModalDialog(duongDan + "NhapThoiGian.jsp",ngayMuon,"dialogHeight: 450px; dialogWidth: 450px; dialogTop: 120px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
						if(value != null)
						{
							var mang = value.split('</>');
							if(mang[0] != "")
							{
								
								var arr = value.split('-');
								for(var i=1;i<value.length;i++)
								{
									if(document.getElementById('tdKiemTra' + value[i]) != null)
									{
										document.getElementById('tdKiemTra' + value[i]).innerHTML = "<font color = 'red'>x</font>";
										check = false;
									}
								}
							}
							if(check)
							{
								document.getElementById('txtThoiGianMuon').value = mang[1];
								document.getElementById('txtThoiGianTra').value = mang[2];
								document.getElementById('txtListXuLy').value = str;	
								document.getElementById('actionType').value = "MuonThietBi";
								document.getElementById('formMuonThietBi').submit();
							}
						}
					}
					else
						alert("Bạn chưa chọn thiết bị nào!!!");
				}
				function checkRow()
				{
				}
			</script>
			</c:when>
			<c:otherwise>
				<p align="center">
					<select id = "cboTinhTrang" name = "cboTinhTrang" onchange="timKiemChiTietPhieuMuon();">
						<option value = "">---  All  ---</option>
						<option value = "1" <c:if test = "${tinhTrangXemPhieuMuon eq 1}">selected</c:if>>---  Đang mượn  ---</option>
						<option value = "2" <c:if test = "${tinhTrangXemPhieuMuon eq 2}">selected</c:if>>---  Đã trả  ---</option>
					</select>
				</p>
				<br/>
				<table border="1">
					<tr style="background-color: transparent;">
						<th bgcolor = "#186fb2">
								<div class = "div_textWhite">
									<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"></input>
								</div>
						</th>
						<td>STT</td>
						<td>Tên thiết bị</td>
						<td>Thời gian mượn</td>
						<td>Thời gian trả</td>
						<td>Tình trạng</td>
						<td>Ghi chú</td>
					</tr>
		<% 
			String tinhTrang = "", currentPage = "1", nguoiMuon = ""; 
			
			nguoiMuon = request.getParameter("NguoiMuon");
			if(request.getParameter("tinhTrangXemPhieuMuon") != null)
				tinhTrang = request.getParameter("tinhTrangXemPhieuMuon");
			
			if(request.getParameter("page") != null)
				currentPage = request.getParameter("page");
			
			c = 1;
			int totalRow = 0;
			totalRow = ChiTietPhieuMuonDAO.getCountChiTietPhieuMuon(tinhTrang, maPhieuMuon);
			PhieuMuonThietBiModel phieuMuon = ChiTietPhieuMuonDAO.getChiTietPhieuMuonByDieuKien(tinhTrang, maPhieuMuon, totalRow, currentPage);
		%>
			<c:set var = "PhieuMuon" value = "<%=phieuMuon %>"/>
					<c:forEach var = "ChiTietPhieuMuon" items="${PhieuMuon.chiTietPhieuMuonList}">
						<tr style="background-color: transparent;">
							<td>
								<input type="checkbox" name="chk<%=c %>" id="chk<%=c %>"
									<c:if test = "${ChiTietPhieuMuon.tinhTrang eq 2}">disabled</c:if> value = "${ChiTietPhieuMuon.maCTPM }"/>
							</td>
							<td><%=c %></td>
							<td>${ChiTietPhieuMuon.tenThietBi}</td>
						<c:choose>
							<c:when test = "${ChiTietPhieuMuon.tinhTrang eq '1'}">
								<td>
								<select name = "cboGioMuon${ChiTietPhieuMuon.maCTPM }">
									<c:forEach var = "GioMuon" begin = "7" end = "20">
										<option value = "${GioMuon }" 
											<c:if test = "${GioMuon eq ChiTietPhieuMuon.gioMuon }">selected</c:if>>${GioMuon }</option>
									</c:forEach>
								</select>
								Giờ
								<select name = "cboPhutMuon${ChiTietPhieuMuon.maCTPM }">
									<c:forEach var = "PhutMuon" begin = "0" end = "55" step = "5">
										<option value = "${PhutMuon }" 
											<c:if test = "${PhutMuon eq ChiTietPhieuMuon.phutMuon }">selected</c:if>>${PhutMuon }</option>
									</c:forEach>
								</select>
								Phút
							</td>
							<td>
								<select name = "cboGioTra${ChiTietPhieuMuon.maCTPM }">
									<c:forEach var = "GioTra" begin = "7" end = "20">
										<option value = "${GioTra }" 
											<c:if test = "${GioTra eq ChiTietPhieuMuon.gioTra }">selected</c:if>>${GioTra }</option>
									</c:forEach>
								</select>
								Giờ
								<select name = "cboPhutTra${ChiTietPhieuMuon.maCTPM }">
									<c:forEach var = "PhutTra" begin = "0" end = "55" step = "5">
										<option value = "${PhutTra }" 
											<c:if test = "${PhutTra eq ChiTietPhieuMuon.phutTra }">selected</c:if>>${PhutTra }</option>
									</c:forEach>
								</select>
								Phút
							</td>
							</c:when>
							<c:otherwise>
								<td>${ChiTietPhieuMuon.ngayMuon } ${ChiTietPhieuMuon.gioMuon }:${ChiTietPhieuMuon.phutMuon }</td>
								<td>${ChiTietPhieuMuon.ngayTra } ${ChiTietPhieuMuon.gioTra }:${ChiTietPhieuMuon.phutTra }</td>
							</c:otherwise>
						</c:choose>	
							
							<td>
								<c:choose>
									<c:when test="${ChiTietPhieuMuon.tinhTrang eq '1'}">
										Chưa xác thực
									</c:when>
									<c:when test="${ChiTietPhieuMuon.tinhTrang eq '2'}">
										Đang mượn
									</c:when>
									<c:otherwise>
										Đã trả
									</c:otherwise>
								</c:choose>	
							</td>
							<td><textarea name = "txtGhiChu-${ChiTietPhieuMuon.maCTPM }" id = "txtGhiChu-${ChiTietPhieuMuon.maCTPM }"
								<c:if test = "${ChiTietPhieuMuon.tinhTrang eq 2}">disabled</c:if>>${ChiTietPhieuMuon.ghiChu }</textarea></td>
						</tr>
						<%c++; %>
					</c:forEach>	
				<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRow) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>
		<c:if test = "${TotalPage gt 1}">			
		 	<tr style="background-color: transparent;">
				<td colspan="7">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("qltb.MuonThietBiPath")%>?page=${CurrentPage - 1}&tinhTrang=<%=tinhTrang %>" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.MuonThietBiPath")%>?page=${PageCount}&tinhTrang=<%=tinhTrang %>">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.MuonThietBiPath")%>?page=${CurrentPage + 1}&tinhTrang=<%=tinhTrang %>" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr>
		</c:if>	
		</table>
		<br/>
		Ghi chú
		<textarea id = "txtGhiChu" name = "txtGhiChu" cols="20">${PhieuMuon.ghiChu }</textarea>
		<br/>
		<br/>
		<c:if test = "${SoSanhNgay ne true}">
			<p align="center">
				<a href = "javascript: capNhatPhieuMuon();">
					<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập nhật phiếu mượn" border = "0" />
				</a>
				<a href = "javascript: xuLy('XoaThietBi');">
					<img src="<%=request.getContextPath()%>/images/buttom/xoa.png" alt="Xóa Dòng" border = "0" />
				</a>
				<a href = "javascript: xuLy('TraThietBi')"><img src="<%=request.getContextPath()%>/images/buttom/trathietbi.png" alt="Trả thiết bị" border = "0" /></a>	
			</p>
		</c:if>	
			</c:otherwise>
		</c:choose>
		
		<input type = "hidden" id = "txtListXuLy" name = "txtListXuLy"/>
		<input type = "hidden" name="xuly" id = "xuly" />
		<script type="text/javascript">
				function capNhatPhieuMuon()
				{
					var str = "";
					for(var i=1;i<<%=c%>;i++)
					{
						if(document.getElementById('chk' + i).disabled == false)
							str += "-" + document.getElementById('chk' + i).value;
					}
					document.getElementById('txtListXuLy').value = str;	
					document.getElementById('actionType').value = "CapNhatPhieuMuon";
					document.getElementById('formMuonThietBi').submit();
				}
				function xuLy(x)
				{
					var str = "";
					for(var i=1;i<<%=c%>;i++)
					{
						if(document.getElementById('chk' + i).checked == true)
							str += "-" + document.getElementById('chk' + i).value;
						
					}
					if(str != "")
					{
						document.getElementById('txtListXuLy').value = str;	
						document.getElementById('actionType').value = x;
						document.getElementById('formMuonThietBi').submit();
						
					}
					else
						alert("Bạn chưa chọn thiết bị nào!!!");
				}
				
			</script>	
			<input type = "hidden" id = "txtPage" name = "txtPage" value = "1"/>
	</form>
<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>			
</body>
</html>