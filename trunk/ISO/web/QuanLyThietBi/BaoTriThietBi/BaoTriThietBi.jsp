<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietPhieuMuonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietBaoTriDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietBaoTriModel"%><html>
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
<title>Bảo trì thiết bị</title>
<script type="text/javascript">
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
					Ngày bảo trì : <input type="text" id = "txtNgayMuon" value = "${PhieuMuonSimple.ngayMuon }"/>
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
							<c:if test = "${Choice eq 2}">checked</c:if>>Xem thiết bị bảo trì</input>
				</td>
			</tr>
		</table>
		
		<input type = "hidden" name="txtHiddenLoaiThietBi" id = "txtHiddenLoaiThietBi" value = "${param.loaiThietBi }"/>
		<input type = "hidden" name="txtHiddenPhongBan" id = "txtHiddenPhongBan" value = "${param.phongBan }"/>
		<input type = "hidden" name="txtHiddenTinhTrangChonThietBi" id = "txtHiddenTinhTrangChonThietBi" value = "${param.tinhTrangThietBi }"/>
		<input type = "hidden" name="txtHiddenTinhTrangXemPhieuMuon" id = "txtHiddenTinhTrangXemPhieuMuon" value = "${param.tinhTrangXemPhieuMuon }"/>
		<input type = "hidden" name = "txtMaPhieuMuon" id = "txtMaPhieuMuon" value = "${param.maPhieuMuon }"/>
		
		<input type = "hidden" name = "txtChoice" id = "txtChoice" value = "${Choice}"/>
		<input type="hidden" id="actionType" name = "actionType"/>	
		<c:choose>
			<c:when test = "${Choice eq 1}">
				<% 
			String loaiThietBi = "", phongBan = "", tinhTrang = "", currentPage = "1"; 
			if(request.getParameter("loaiThietBi") != null)
				loaiThietBi = request.getParameter("loaiThietBi");
			
			if(request.getParameter("phongBan") != null)
				phongBan = request.getParameter("phongBan");
			
			if(request.getParameter("tinhTrang") != null)
				tinhTrang = request.getParameter("tinhTrang");
			
			if(request.getParameter("page") != null)
				currentPage = request.getParameter("page");
			
			c = 1;
			int totalRow = 0;
			totalRow = ThietBiDAO.getCountThietBi(loaiThietBi, phongBan, tinhTrang);
			ArrayList<ThietBiModel> thietBiList = ThietBiDAO.getAllThietBiByDieuKien(loaiThietBi, phongBan, tinhTrang, totalRow, currentPage);
		%>
		<c:set var="CurrentPage" value="<%=currentPage %>"></c:set>
		
		<table border='1' style="background-color: transparent;">
			<tr>
				<td>
					Loại 	
						<select id="cboLoaiThietBi" name="cboLoaiThietBi">
							<option 
								<c:if test="${param.maLoaiThietBi eq -1}"> selected</c:if>
									value = "-1" >Chọn</option>	
												
							<c:forEach var="loaiThietBi" items="${listLoaiThietBi}">
								<option 
									<c:if test="${param.maLoaiThietBi eq loaiThietBi.maLoaiThietBi}">selected</c:if>
										value="${loaiThietBi.maLoaiThietBi}">${loaiThietBi.tenLoaiThietBi}
								</option>
							</c:forEach>
						</select>	
				</td>
				<td>
					Phòng 	
					<select id="cboPhong" name="cboPhong">
						<option 
								<c:if test="${param.maPhongBan eq -1}"> selected</c:if>
								value = "-1" >Chọn</option>	
											
						<c:forEach var="phong" items="${listPhong}">
							<option 
									<c:if test="${param.maPhongBan eq phong.maPhongBan}">selected</c:if>
									value="${phong.maPhongBan}">${phong.kiHieu}
							</option> 
						</c:forEach>
					</select> 
				</td>			
				<td>Tình trạng 
						<select id="cboTinhTrang" name="cboTinhTrang"  onchange="xyLyComboboxTinhTrang();">
							<option 
								<c:if test="${param.maTinhTrang eq -1}"> selected</c:if>
									value = "-1" >All</option>	
												
								<c:forEach var="tt" items="${listTinhTrang}">
									<option 
										<c:if test="${param.maTinhTrang eq tt.maTinhTrang}">selected</c:if>
										value="${tt.maTinhTrang}">${tt.tenTinhTrang}
									</option> 
								</c:forEach>
						</select>
				</td>
				<td><a href = "javascript: timKiemThietBi();"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a></td>
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
					<td>${ThietBi.tenTinhTrang }</td>					
				</tr>
				<%c++; %>
				
			</c:forEach>
			
				<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRow) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
				${TotalPage}		
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
		</table>
		<p align="center">
			<a href = "javascript: xuLy('MuonThietBi')">
				<img src="<%=request.getContextPath()%>/images/buttom/muon.png" alt="Mượn thiết bị" border = "0" />
		</a></p>
			<input type="hidden" id = "txtListThietBiMuon" name = "txtListThietBiMuon" value = ""/>
			<script type="text/javascript">
				function muonThietBi()
				{
					var str = "";
					for(var i=1;i<<%=c%>;i++)
					{
						if(document.getElementById('chk' + i).checked == true)
							str += "-" + document.getElementById('chk' + i).value;
					}
					if(str != "")
					{
						document.getElementById('txtListThietBiMuon').value = str;	
						document.getElementById('actionType').value = "MuonThietBi";
						document.getElementById('formMuonThietBi').submit();
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
				<table border="1">
					<tr style="background-color: transparent;">
						<th bgcolor = "#186fb2">
								<div class = "div_textWhite">
									<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"></input>
								</div>
						</th>
						<td>STT</td>
						<td>Tên thiết bị</td>
						<td>Thời gian bắt đầu bảo trì</td>
						<td>Thời gian kết thúc bảo trì</td>
						<td>Tình trạng</td>
						<td>Ghi chú</td>
					</tr>
		<% 
			String tinhTrang = "", currentPage = "1", nguoiMuon = ""; 
			
			nguoiMuon = request.getParameter("NguoiMuon");
			if(request.getParameter("tinhTrang") != null)
				tinhTrang = request.getParameter("tinhTrang");
			
			if(request.getParameter("page") != null)
				currentPage = request.getParameter("page");
			
			c = 1;
			int totalRow = 0;
			totalRow = ChiTietBaoTriDAO.getCountChiTietBaoTri(tinhTrang);
			ArrayList<ChiTietBaoTriModel> chiTietBaoTriList = ChiTietBaoTriDAO.getChiTietBaoTriByDieuKien(tinhTrang, totalRow, currentPage);
		%>
			<c:set var = "ListBaoTri" value = "<%=chiTietBaoTriList %>"/>
					<c:forEach var = "ChiTietBaoTri" items="${chiTietBaoTriList}">
						<tr style="background-color: transparent;">
							<td>
								<input type="checkbox" name="chk<%=c %>" id="chk<%=c %>" onclick="checkRow(); " value = "${ChiTietPhieuMuon.maCTPM }"/>
							</td>
							<td><%=c %></td>
							<td>${ChiTietBaoTri.tenThietBi}</td>
							<td>${ChiTietBaoTri.thoiGianBatDauBaoTri}</td>
							<td>${ChiTietBaoTri.thoiGianKetThucBaoTri}</td>
							<td>
								<c:choose>
									<c:when test="${ChiTietBaoTri.tinhTrang eq '1'}">
										Đang bảo trì
									</c:when>
									<c:otherwise>
										Đã trả
									</c:otherwise>
								</c:choose>	
							</td>
							<td></td>
						</tr>
						<%c++; %>
					</c:forEach>	
				<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRow) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		 	<tr style="background-color: transparent;">
				<td colspan="7">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("qltb.BaoTriThietBiPath")%>?page=${CurrentPage - 1}&tinhTrang=<%=tinhTrang %>" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.BaoTriThietBiPath")%>?page=${PageCount}&tinhTrang=<%=tinhTrang %>">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.BaoTriThietBiPath")%>?page=${CurrentPage + 1}&tinhTrang=<%=tinhTrang %>" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr>
		</table>
		<input type = "hidden" id = "txtListXuLy" name = "txtListXuLy"/>	
			<p align="center">
				<a href = "javascript: xuLy('XoaThietBi');">
					<img src="<%=request.getContextPath()%>/images/buttom/xoa.png" alt="Xóa Dòng" border = "0" />
				</a>
				<a href = "javascript: xuLy('TraThietBi')"><img src="<%=request.getContextPath()%>/images/buttom/trathietbi.png" alt="Trả thiết bị" border = "0" /></a>	
				<input type = "hidden" name="xuly" id = "xuly" />
			</p>
			</c:otherwise>
		</c:choose>
		<script type="text/javascript">
				function xuLy(x)
				{
					var str = "";
					for(var i=0;i<<%=c%>;i++)
					{
						if(document.getElementById('chk' + i).checked == true)
							str += "-" + document.getElementById('chk' + i).value;
					}
					if(str != "")
					{
						document.getElementById('txtListXuLy').value = str;	
						document.getElementById('actionType').value = x;
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