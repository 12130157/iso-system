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
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%><html xmlns="http://www.w3.org/1999/xhtml">
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
		document.getElementById('actionType').value = 'searchPhongAndLoai';
		document.forms['formThietBi'].submit();
	}
	function xyLyComboboxTinhTrang(){
		document.getElementById('actionType').value = 'searchTinhTrang';
		document.forms['formThietBi'].submit();
	}
	function xulyComboboxKiHieu(){
		document.getElementById('actionType').value = 'searchKiHieu';
		document.forms['formThietBi'].submit();
	}
</script>
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Hệ Thống Quản Lý Thiết Bị</title>
</head>
<body onload="selectTuan();selectNam();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>	
	
	<c:set var="listTinhTrang" value="<%= ThietBiDAO.showAllTinhTrangTB() %>"></c:set>
	<c:set var="listPhong" value="<%= PhongBanDAO.getAllPhongBan() %>"></c:set>
	<c:set var="listLoaiThietBi" value="<%= LoaiThietBiDAO.getAllLoaiThietBi() %>"></c:set>
	<c:set var="listKiHieuThietBi" value="<%= ThietBiDAO.getKiHieuThietBi() %>"></c:set>
	
	<c:if test="${ not empty param.errUpdate}">
			<c:if test="${param.errUpdate eq 'false'}">
					<font color='blue' style='font-weight:bold'>Cập nhật thành công</font>
					<br/>
					<br/>
			</c:if>
			<c:if test="${param.errUpdate eq 'true'}">
					<font color='red' style='font-weight:bold'>Cập nhật thất bại</font>
					<br/>
					<br/>
			</c:if>
	</c:if>
	
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formThietBi" id = "formThietBi" method="post">
		<div>
		<input type="hidden" id="actionType" value="tinhtrang" name = "actionType"/>		
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách Các Thiết Bị</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test="${not empty param.xoa}">
						<b class="msg">Xoá thiết bị thành công !!!</b>
					</c:if>
				</td>
			</tr>
		</table>
		
		
		<table border='1' style="background-color: transparent;">
			<tr>
				<td style='background-color: #186fb2;color:white'>Chế độ theo dõi</td>
				<td style='background-color: #186fb2;color:white' colspan="2">Chế độ mượn</td>
			</tr>
			<tr>
				<td><input type="radio" id="rdoCheDoTheoDoi" name="rdoCheDoTheoDoi"/></td>
				<td><input type="radio" id="rdoCheDoMuonTra" name="rdoCheDoMuonTra"/></td>
			</tr>
			<tr>
				
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
				
				<td>Hiện trạng 	<select id="cboHienTrang" name="cboHienTrang" disabled="disabled">
									<option>Rảnh</option> 
									<option>Bận</option>
								</select></td>
			</tr>
			<tr>
				<td>
					Phòng 	<select id="cboPhong" name="cboPhong">
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
					Loại 	<select id="cboLoaiThietBi" name="cboLoaiThietBi">
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
							
					<a href = "javascript: search();"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</td>
				<td>
					Kí hiệu <select id="cboKiHieu" name="cboKihieu" onchange="xulyComboboxKiHieu();">
								<option
									<c:if test="${param.maThietBi eq -1}"> selected</c:if>
									value = "-1" >All</option>	
												
									<c:forEach var="kHThietBi" items="${listKiHieuThietBi}">
										<option 
											<c:if test="${param.maThietBi eq kHThietBi.maThietBi}">selected</c:if>
											value="${kHThietBi.maThietBi}">${kHThietBi.kiHieu}
										</option>
									</c:forEach>							
						</select>
				</td>
				</tr>
			<tr>
				<td>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/ThemThietBi.jsp"><img src="<%=request.getContextPath()%>/images/buttom/themthietbi.png" alt="thêm thiết bị" border = "0" /></a>
					<a href = "javascript: deleteRow()">
						<img src="<%=request.getContextPath()%>/images/buttom/xoa.png" alt="Xóa Dòng" border = "0" />
					</a>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/BaoHu.jsp"><img src="<%=request.getContextPath()%>/images/buttom/baohu.png" alt="Báo Hư" border = "0" /></a>	
					<input type = "hidden" name="xuly" id = "xuly" />									
				</td>
				<td>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/MuonThietBi.jsp"><img src="<%=request.getContextPath()%>/images/buttom/muon.png" alt="Mượn Thiết Bị" border = "0" /></a>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/BaoThietBiDenHan.jsp"><img src="<%=request.getContextPath()%>/images/buttom/tra.png" alt="Trả Thiết Bị" border = "0" /></a>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/ThayDoiThietBi.jsp"><img src="<%=request.getContextPath()%>/images/buttom/thaydoithietbi.png" alt="Thay Đổi Thiết Bị" border = "0" /></a>			
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
				<th style='background-color: #186fb2;color:white'></th>
				
			</tr>
	
			<% int c = 1; 
				ArrayList<ThietBiModel> thietBiList;
				if(request.getSession().getAttribute("thietBiModelList") != null)
					thietBiList = (ArrayList<ThietBiModel>)request.getSession().getAttribute("thietBiModelList");
				else
					thietBiList = ThietBiDAO.showAllThietBi();
			%>
				
				<c:set var="listThietBi" value="<%= thietBiList %>" scope = "session"></c:set>
					
			
			<c:forEach var="ThietBi" items="${listThietBi}">
				<tr>
					<td><input type="checkbox" name="chk<%=c %>" id="chk<%=c %>" onclick="checkRow();"/></td>
					<td><%=c %></td>
					<td>${ThietBi.tenLoaiThietBi }</td>
					<td>${ThietBi.kiHieu }</td>
					<td>${ThietBi.tenThietBi }</td>
					<td>${ThietBi.tenPhongBan }</td>
					<td>${ThietBi.tenTinhTrang }</td>					
					
					<td>
						<a href = "<%= Constant.PATH_RES.getString("qltb.ChiTietThietBiPath") %>?maThietBi=${ThietBi.maThietBi}">
							Edit
						</a>
					</td>
				</tr>
				<%c++; %>
				
			</c:forEach>
			
			<script language="JavaScript" type="text/javascript">
				function submit()
				{
					document.getElementById("formThietBi").submit();
				}
			
				function checkAll()
				{		
					if (document.getElementById("chkAll").checked == true) {
						<%
							for(int i = 1; i< c; i++) {
								out.print("document.getElementById('chk" + i + "').checked = true;\n");
							}
						%>	
					}else {
						<%
							for(int i = 1; i< c; i++) {
								out.print("document.getElementById('chk" + i + "').checked = false;\n");
							}
						%>
					}
				}
				
				function checkRow(){
					if(document.getElementById('chkAll').checked == true)
						document.getElementById('chkAll').checked = false;
				}
				
				function deleteRow()
				{
					var check = false;
					<%
						for(int i=1;i<c;i++)
						{
							out.print("if(document.getElementById('chk" + i + "').checked == true)");
							out.print("check = true;");
						}
					%>
					if(check == false)
					{
						alert("Bạn chưa chọn checkbox nào!!!!");
					}
					else if(check == true)
					{
						if(confirm("Bạn có chắc muốn xoá không???"))
						{
							document.getElementById('xuly').value = 'xoa';
							document.forms["formThietBi"].submit();
						}
					}
				}
				
			</script>		
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