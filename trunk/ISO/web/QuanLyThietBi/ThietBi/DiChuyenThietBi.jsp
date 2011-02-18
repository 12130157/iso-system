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
<%@page import="vn.edu.hungvuongaptech.dao.DiChuyenThietBiDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
	function xyLySearchPhongBanA(){
		document.getElementById('actionType').value = 'PhongBanA';
		document.forms['formDiChuyenThietBi'].submit();
	}
	function xyLySearchPhongBanB()
	{
		document.getElementById('actionType').value = 'PhongBanB';
		document.forms['formDiChuyenThietBi'].submit();
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
	<% int c = 1; 
				ArrayList<ThietBiModel> thietBiList;
				if(request.getAttribute("thietBiList1") != null)
					thietBiList = (ArrayList<ThietBiModel>)request.getAttribute("thietBiList1");
				else
					thietBiList = DiChuyenThietBiDAO.showAllThietBi();
	%>
	<% int rows = 1; 
				ArrayList<ThietBiModel> diChuyenList;
				if(request.getAttribute("thietBiList2") != null)
					diChuyenList = (ArrayList<ThietBiModel>)request.getAttribute("thietBiList2");
				else
					diChuyenList = DiChuyenThietBiDAO.showAllThietBi();
	%>

	<c:set var="listPhongBan_1" value="<%= PhongBanDAO.showAllPhongBan() %>"></c:set>
	<c:set var="listPhongBan" value="<%= PhongBanDAO.showAllPhongBan() %>"></c:set>
	<c:set var = "thietBiList1" value="<%=thietBiList %>" scope="session"/>
	<c:set var = "thietBiList2" value="<%=diChuyenList %>" scope="session"/>
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formDiChuyenThietBi" id = "formDiChuyenThietBi" method="post">
		<div>
		<input type="hidden" id="actionType" value="" name = "actionType"/>			
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Di Chuyển Thiết Bị</div>
				</td>
			</tr>
		</table>
		
		<table style="background-color: transparent;">	
			<tr style="background-color: transparent;">	
					<td>Phòng ban
						<select id="cboPhongBanA" name="cboPhongBanA"  onchange="xyLySearchPhongBanA();">	
							<option 
								<c:if test="${param.PhongBanA eq -1}"> selected</c:if>
									value = "-1" >Chọn</option>											
								<c:forEach var="tt" items="${listPhongBan_1}">
									<option 
										<c:if test="${param.PhongBanA eq tt.maPhongBan}">selected</c:if>
										value="${tt.maPhongBan}">${tt.kiHieu}
									</option> 
								</c:forEach>
						</select>
					</td>
						
					<td>Phòng ban						
						<select id="cboPhongBanB" name="cboPhongBanB" onchange="xyLySearchPhongBanB();">
							<option 
								<c:if test="${param.PhongBanB eq -1}"> selected</c:if>
									value = "-1" >Chọn</option>												
							<c:forEach var="pb" items="${listPhongBan}">
								<option 
									<c:if test="${param.PhongBanB eq pb.maPhongBan}">selected</c:if>
									value="${pb.maPhongBan}">${pb.kiHieu}
								</option>
							</c:forEach>
					</select>
					</td>
			</tr>			
		</table>		
		
		<table style="background-color: transparent;">					
			<c:set var="listThietBi" value="<%= thietBiList %>" scope = "session"></c:set>
			<tr style="background-color: transparent;">
				<td align="left">
					<select multiple="multiple" size="5" name="cboA" id="cboA" style="width: 150px;">
						<c:if test="${param.PhongBanA eq -1}">							
								<option>Chưa chọn</option>
						</c:if>									
												
						<c:forEach var="ThietBi" items="${listThietBi}">
							<option value="">${ThietBi.tenThietBi }</option>			
								<%c++; %>				
						</c:forEach>
					</select>
				</td>
				
			<td colspan="4">
					<!--  <input type="submit" value="Thêm một"/>-->	
					<img src="<%=request.getContextPath()%>/images/icon_action/addone.png" height='24' width='65' onclick="huyChucNang()" style="cursor:pointer"/><br><br>
				
					<!--  <input type="submit" value="Thêm hết"/>-->				
					 <img src="<%=request.getContextPath()%>/images/icon_action/addall.png" height='24' width='65' onclick="huyAllChucNang()" style="cursor:pointer"/><br><br>
					 
					 <!-- <input type='button' onclick="themChucNang()"  value="Xóa một" />-->
					<img src="<%=request.getContextPath()%>/images/icon_action/delone.png"  height='24' width='65' onclick="themChucNang()" style="cursor:pointer"/><br><br>
					
					<!--  <input type="submit" value="Xóa hết"/>	-->			 	
					<img src="<%=request.getContextPath()%>/images/icon_action/delall.png" height='24' width='65' onclick="themAllChucNang()" style="cursor:pointer"/>
									
				</td>
				
			
				<td align="right">				
					<select multiple="multiple" size="5" name="cboB" id="cboB" style="width: 150px;">
						<c:if test="${param.PhongBanB eq -1}">							
								<option>Chưa chọn</option>
						</c:if>
						
					<c:set var="listCob" value="<%= diChuyenList %>" scope = "session"></c:set>
					
						<c:forEach var="listB" items="${listCob}">
							<option value="">${listB.tenThietBi }</option>			
								<%rows++; %>				
						</c:forEach>
					</select>
				</td>
			</tr>	
		</table>	
		</div>
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>