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
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.DiChuyenThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<script src="<%=request.getContextPath()%>/QuanLyThietBi/js/MuonThietBi_Script.js" type="text/javascript"></script>
<script type="text/javascript" language="JavaScript">	
	function xyLyComboboxKhoa()
	{
		document.getElementById('actionType').value = 'timTenThanhVienByKhoa';
		document.forms['formThayDoiThietBi'].submit();
	}
	function xulySearchThietBi()
	{
		document.getElementById('actionType').value = 'timThietBiDaMuon';
		document.forms['formThayDoiThietBi'].submit();
	}
	function submitForm(){		
		document.forms["formThayDoiThietBi"].submit();
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
	<% int rows = 1; 
				ArrayList<ThanhVienModel> thanhVienList;
				if(request.getSession().getAttribute("thanhVienModelList") != null)
					thanhVienList = (ArrayList<ThanhVienModel>)request.getSession().getAttribute("thanhVienModelList");
				else
					thanhVienList = PhieuMuonThietBiDAO.timAllThanhVienByMaKhoa();
	%>
	
	<% int c = 1; 
				ArrayList<ThietBiModel> daMuonList;
				if(request.getAttribute("thietBiDaMuon") != null)
					daMuonList = (ArrayList<ThietBiModel>)request.getAttribute("thietBiDaMuon");
				else
					daMuonList = PhieuMuonThietBiDAO.showAllThietBi();
	%>
	
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formThayDoiThietBi" id = "formThayDoiThietBi" method="post">
		
	<div>			
		<c:set var="listKhoa" value="<%= ThietBiDAO.showAllKhoa() %>"></c:set>
		<c:set var="listThanhVien" value="<%= thanhVienList %>" scope = "session"></c:set>
		<input type="hidden" id="actionType" value="xuLy" name = "actionType"/>
			
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Thay Đổi Thiết Bị</div>
				</td>
			</tr>
		</table>
		
		<table style="background-color: transparent;" border=1>	
			<tr style="background-color: transparent;">							
				<td><div class="div_txright">Khoa :</div></td>
				<td>
			 		<div class="div_txleft">
 
						<select id="cboKhoa" name="cboKhoa" onchange="xyLyComboboxKhoa();">	
							<option 
								<c:if test="${param.maKhoa eq -1}"> selected</c:if>
									value = "-1" >Chọn</option>											
								<c:forEach var="tt" items="${listKhoa}">
									<option 
										<c:if test="${param.maKhoa eq tt.maKhoa}">selected</c:if>
										value="${tt.maKhoa}">${tt.tenKhoa}
									</option> 
								</c:forEach>
						</select>
						</div>
					</td>
					
				<td>
			 		<div class="div_txright">Người mượn :</div>
			 	</td>
			 	<td>				
					<select name="cboNguoiMuon" id="cboNguoiMuon" onchange="xulySearchThietBi();">
						<option	value = "-1" >All</option>					
						<c:forEach var="ThanhVien" items="${listThanhVien}">
							<option value="">${ThanhVien.hoThanhVien } ${ThanhVien.tenLot } ${ThanhVien.tenThanhVien }</option>			
								<%rows++; %>				
						</c:forEach>
					</select>
					<b class="error">(*)</b>
				</td>	
				<font id='alertNguoiMuon' color='red'></font>			
			</tr>	
			
			<tr style="background-color: transparent;">
				<td colspan="2">
					Tên Thiết Bị chưa mượn
				</td>
				<td></td>
				<td colspan="2">
					Tên Thiết Bị đã mượn
				</td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td colspan="2">				
					<select multiple="multiple" size="8" style="width: 180px;" name="cboB" id="cboB">
							<option value="">chưa mượn</option>							
					</select>
				</td>
				
				</td>
				<td>
					<!--  <input type="submit" value="Thêm một"/>-->	
					<img src="<%=request.getContextPath()%>/images/icon_action/addone.png" height='24' width='65' onclick="huyChucNang()" style="cursor:pointer"/><br><br>
				
					<!--  <input type="submit" value="Thêm hết"/>-->				
					 <img src="<%=request.getContextPath()%>/images/icon_action/addall.png" height='24' width='65' onclick="huyAllChucNang()" style="cursor:pointer"/><br><br>
					 
					 <!-- <input type='button' onclick="themChucNang()"  value="Xóa một" />-->
					<img src="<%=request.getContextPath()%>/images/icon_action/delone.png"  height='24' width='65' onclick="themChucNang()" style="cursor:pointer"/><br><br>
					
					<!--  <input type="submit" value="Xóa hết"/>	-->			 	
					<img src="<%=request.getContextPath()%>/images/icon_action/delall.png" height='24' width='65' onclick="themAllChucNang()" style="cursor:pointer"/>									
				</td>
				<td colspan="2">				
					<c:set var="listMuon" value="<%= daMuonList %>" scope = "session"></c:set>			
					<select multiple="multiple" size="8" style="width: 180px;" name="selB" id="selB">
						<c:forEach var="listDaMuon" items="${listMuon}">
							<option value="">${listDaMuon.tenThietBi }</option>
							<%c++; %>		
						</c:forEach>					
					</select>
				</td>			
			</tr>	
			
		</table>		
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</form>	
</body>
</html>
