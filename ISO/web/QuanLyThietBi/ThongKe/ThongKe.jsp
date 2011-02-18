<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.NhaCungCapDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TaiKhoanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TanSuatDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThongKeDAO"%><html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/QuanLyThietBi/css/NhaCungCap_Style.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/QuanLyThietBi/js/ChiTietThietBi_Script.js" type="text/javascript"></script>
<script type="text/javascript" language="JavaScript">	
	function xulySearchNCC()
	{
		document.getElementById('actionType').value = 'searchNhaCungCap';
		document.forms['frmThongKe'].submit();
	}
	function xulySearchLoaiTB()
	{
		document.getElementById('actionType').value = 'searchLoaiTB';
		document.forms['frmThongKe'].submit();
	}
	function xulySearchPhongBan()
	{
		document.getElementById('actionType').value = 'searchPhongBan';
		document.forms['frmThongKe'].submit();
	}
	function timTinhTrang()
	{
		document.getElementById('actionType').value = 'searchTT';
		document.forms['frmThongKe'].submit();
	}
	function click_btnTimTen()
	{
		document.getElementById('actionType').value = 'timTenThietBi';
		document.forms['frmThongKe'].submit();
	}
</script>
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Hệ Thống Quản Lý Thiết Bị</title>

<body onload=" selectTuan();selectNam();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
<c:set var="listNhaCungCap" value="<%= NhaCungCapDAO.showAllNhaCungCap() %>"></c:set>
<c:set var="listPhongBan" value="<%= PhongBanDAO.showAllPhongBan() %>"></c:set>
<c:set var="listLoaiThietBi" value="<%= LoaiThietBiDAO.getAllLoaiThietBi() %>"></c:set>
<c:set var="listTinhTrang" value="<%= ThietBiDAO.showAllTinhTrangTB() %>"></c:set>

	<form name="frmThongKe" id="frmThongKe" method="post" action="<%=request.getContextPath()%>/ThietBiController" >	
	<input type="hidden" id="actionType" value="tinhtrang" name = "actionType"/>
		<table><tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Thống Kê Tần Suất Thiết Bị</div></td></tr></table>
		<table border='1' style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan="2" align="right">
					Tên thiết bị :<input type="text" name="txtTimKiemTheoTenThietBi" id="txtTimKiemTheoTenThietBi" size = "25" style="background-color: transparent;"/>
				</td>
				<td colspan="2">				
					<a href = "javascript: click_btnTimTen()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm"/></a>
				</td>
			</tr>			
			<tr style="background-color: transparent;" >				
				<td>Nhà cung cấp :</td>
				<td>
					<select id="cboNhaCungCap" name="cboNhaCungCap" onchange="xulySearchNCC()">
						<option 
								<c:if test="${param.maNhaCungCap eq -1}"> selected</c:if>
								value = "-1" >All</option>	
											
							<c:forEach var="tt" items="${listNhaCungCap}">
								<option 
									<c:if test="${param.maNhaCungCap eq tt.maNhaCungCap}">selected</c:if>
									value="${tt.maNhaCungCap}">${tt.ten}
								</option> 
							</c:forEach>
					</select>
				</td>
				<td>Tên Phòng Ban :</td>
				<td>
					<select id="cboPhongBan" name="cboPhongBan" onchange="xulySearchPhongBan();">
						<option 
								<c:if test="${param.maPhongBan eq -1}"> selected</c:if>
								value = "-1" >All</option>	
											
							<c:forEach var="pb" items="${listPhongBan}">
								<option 
									<c:if test="${param.maPhongBan eq pb.maPhongBan}">selected</c:if>
									value="${pb.maPhongBan}">${pb.kiHieu}
								</option> 
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr style="background-color: transparent;" >
				<td>Loại thiết bị :</td>
				<td>
					<select id="cboLoaiThietBi" name="cboLoaiThietBi" onchange="xulySearchLoaiTB();">
						<option 
								<c:if test="${param.maLoaiThietBi eq -1}"> selected</c:if>
								value = "-1" >----------All----------</option>	
											
							<c:forEach var="pb" items="${listLoaiThietBi}">
								<option 
									<c:if test="${param.maLoaiThietBi eq pb.maLoaiThietBi}">selected</c:if>
									value="${pb.maLoaiThietBi}">${pb.tenLoaiThietBi}
								</option> 
							</c:forEach>
					</select>
				</td>
				<td>Tình trạng thiết bị :</td>
				<td>
					<select id="cboTT" name="cboTT" onchange="timTinhTrang();">
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
			</tr>
			
			</table>
			<table border="1">			
			<tr style="background-color: transparent;">				
				<td style='background-color: #186fb2;color:white'>STT</td>				
				<td style='background-color: #186fb2;color:white'>Tên Thiết Bị</td>
				<td style='background-color: #186fb2;color:white'>Loại</td>		
				<td style='background-color: #186fb2;color:white'>Tình Trạng</td>
				<td style='background-color: #186fb2;color:white'>Nhà Cung Cấp</td>										
				<td style='background-color: #186fb2;color:white'>Tần Suất Tối Đa</td>
				<td style='background-color: #186fb2;color:white'>Tần Suất Sử Dụng</td>				
				<td style='background-color: #186fb2;color:white'>Đơn Vị Tần Suất</td>
				<td style='background-color: #186fb2;color:white'>Số lần bảo trì</td>
				<td style='background-color: #186fb2;color:white'>Số máy</td>
				<td style='background-color: #186fb2;color:white'>Tên phòng ban</td>			
			</tr>
			<% int c = 1; 
				ArrayList<ThietBiModel> thietBiList;
				if(request.getSession().getAttribute("thietBiModelList") != null)
					thietBiList = (ArrayList<ThietBiModel>)request.getSession().getAttribute("thietBiModelList");
				else
					thietBiList = ThongKeDAO.showAllTanSuatThietBi();
			%>
				
				<c:set var="listThietBi" value="<%= thietBiList %>" scope = "session"></c:set>
					
			
			<c:forEach var="TanSuatThietBi" items="${listThietBi}">
				<tr style="background-color: transparent;">
					<td><%=c %></td>
					<td>${TanSuatThietBi.tenThietBi }</td>
					<td>${TanSuatThietBi.tenLoaiThietBi }</td>
					<td>${TanSuatThietBi.tenTinhTrang }</td>
					<td>${TanSuatThietBi.tenNhaCungCap }</td>
					<td>${TanSuatThietBi.tanSuatToiDa }</td>
					<td>${TanSuatThietBi.tanSuatSuDung }</td>	
					<td>${TanSuatThietBi.tenDonViTanSuat }</td>	
					<td>${TanSuatThietBi.soLanBaoTri}</td>	
					<td>${TanSuatThietBi.soMay }</td>
					<td>${TanSuatThietBi.tenPhongBan }</td>						
				</tr>
				<%c++; %>
				
			</c:forEach>
		
		</table><br></br>
	</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
