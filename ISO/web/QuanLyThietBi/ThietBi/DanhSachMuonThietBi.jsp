<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<title>Hệ Thống Quản Lý Thiết Bị</title>	

</head>
<body onload=" selectTuan();selectNam();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<!-- phan trang begin -->
			<%String ten=""; %>
			<%int indexPage=1; %>
			<c:if test="${ not empty param.ten }">
				<% ten=request.getParameter("ten"); %>
			</c:if>
			<c:if test="${ not empty param.index}">
				<% indexPage=Integer.parseInt(request.getParameter("index")); %>
			</c:if>
	<!-- phan trang end -->
	
	<% int c = 1; %>
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formDanhSachMuon" id = "formDanhSachMuon" method="post">
		<div>
		<input type="hidden" id="actionType" value="tinhtrang" name = "actionType"/>
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh sách thiết bị đã mượn</div>
				</td>
			</tr>
		</table>
		
			<table border="1">	
				<tr>
						<td colspan=7>Tên thiết bị <input type="text" name="txtTimTenNhaCungCap" id="txtTimTenNhaCungCap"/> 
								<a href = "javascript: click_btnTimTen()">
									<img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" border = "0" />
								</a>
						</td>
				</tr>			
				<tr>
					<td style='background-color: #186fb2;color:white'>STT</td>
					<td style='background-color: #186fb2;color:white'>Mã thiết bị</td>
					<td style='background-color: #186fb2;color:white'>Tên thiết bị</td>
					<td style='background-color: #186fb2;color:white'>Người Mượn</td>
					<td style='background-color: #186fb2;color:white'>Thời gian mượn</td>
					<td style='background-color: #186fb2;color:white'>Thời gian trả</td>
				</tr>	
				
				<%  
					ArrayList<PhieuMuonThietBiModel> phieuMuonList;
					if(request.getSession().getAttribute("phieuMuonModelList") != null)
						phieuMuonList = (ArrayList<PhieuMuonThietBiModel>)request.getSession().getAttribute("phieuMuonModelList");
					else
						phieuMuonList = PhieuMuonThietBiDAO.showDanhSachMuon();
				%>
				<c:set var="listPhieuMuon" value="<%= phieuMuonList %>" scope = "session"></c:set>
				
				<c:forEach var="PhieuMuon" items="${listPhieuMuon}">
					<tr>
						<td><%=c %></td>
						<td>${PhieuMuon.maThietBi }</td>	
						<td>${PhieuMuon.tenThietBi }</td>
						<td>${PhieuMuon.hoThanhVien } ${PhieuMuon.tenLot } ${PhieuMuon.tenThanhVien }</td>
						<td>${PhieuMuon.thoiGianMuon }</td>	
						<td>${PhieuMuon.thoiGianTra }</td>	
						<td>
						<a href = "<%= Constant.PATH_RES.getString("qltb.ChiTietPhieuMuonPath") %>?maPhieuMuon=${PhieuMuon.maPhieuMuon}">
							Chi Tiết
						</a>
					</td>					
					</tr>
					<%c++; %>
				
				</c:forEach>
				
				<tr>
					<td colspan="8" style="text-align:right">	
						Trang 
						<c:forEach var="numPage" items="${showNumPage}">
							${numPage} 
						</c:forEach>											
					</td>
				</tr>			
			</table>
			
			<br/>
			
		</div>
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>