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
					Loại 	
						<select id="cboLoaiThietBi" name="cboLoaiThietBi">
							<option 
								<c:if test="${param.maLoaiThietBi eq ''}"> selected</c:if>
									value = "" >Chọn</option>	
												
							<c:forEach var="loaiThietBi" items="${listLoaiThietBi}">
								<option 
									<c:if test="${param.loaiThietBi eq loaiThietBi.maLoaiThietBi}">selected</c:if>
										value="${loaiThietBi.maLoaiThietBi}">${loaiThietBi.tenLoaiThietBi}
								</option>
							</c:forEach>
						</select>	
				</td>
				<td>
					Phòng 	
					<select id="cboPhong" name="cboPhong">
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
			</tr>
			<tr>				
				<td>Tình trạng 
						<select id="cboTinhTrang" name="cboTinhTrang">
							<option 
								<c:if test="${param.tinhTrang eq ''}"> selected</c:if>
									value = "" >All</option>	
												
								<c:forEach var="tt" items="${listTinhTrang}">
									<option 
										<c:if test="${param.tinhTrang eq tt.maTinhTrang}">selected</c:if>
										value="${tt.maTinhTrang}">${tt.tenTinhTrang}
									</option> 
								</c:forEach>
						</select>
				</td>
				<td>Tên thiết bị 
						<input type = "text" id = "txtTenThietBi" name = "txtTenThietBi" value = "<%=tenThietBi %>"/>
				</td>
				<td><a href = "javascript: search();"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a></td>
			</tr>
		</table>		
		
		<table border="1">
			<tr>
				<th style='background-color: #186fb2;color:white'>&nbsp;&nbsp;&nbsp;</th>
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
				<tr>
					<td>
						<c:if test = "${ThietBi.tinhTrangDuocXoa eq 1}">X</c:if>
						<input type = "hidden" id = "txtTinhTrangDuocXoa<%=c %>" value = "${ThietBi.tinhTrangDuocXoa }"/>
					</td>
					<td>
						<input type="checkbox" name="chk<%=c %>" id="chk<%=c %>" onclick="checkRow();" value="${ThietBi.maThietBi}"/>
					</td>
					<td><%=c %></td>
					<td>
						<a href = "<%= Constant.PATH_RES.getString("qltb.XemThietBiPath") %>?maThietBi=${ThietBi.maThietBi}">${ThietBi.tenLoaiThietBi }</a>
					</td>
					<td>${ThietBi.kiHieu }</td>
					<td>${ThietBi.tenThietBi }</td>
					<td>${ThietBi.tenPhongBan }</td>
					<td>${ThietBi.tenTinhTrang }</td>					
				</tr>
				<%c++; %>
				
			</c:forEach>
			<input type = "hidden" id = "txtListMaThietBiCanXoa" name="txtListMaThietBiCanXoa"/>
			<script language="JavaScript" type="text/javascript">
				
			
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
				
				function xoaThietBi()
				{
					var listThietBiCanXoa = "";
					var check = false, check1 = true;
					<%
						for(int i=1;i<c;i++)
						{
							out.print("if(document.getElementById('chk" + i + "').checked == true) {");
							out.print("check = true;");
							out.print("if(document.getElementById('txtTinhTrangDuocXoa" + i + "').value == '2')");
							out.print("check1 = false;");
							out.print("else {");
							out.print("listThietBiCanXoa += '-' + document.getElementById('chk" + i + "').value;}}");
						}
					%>
					if(check == false)
					{
						alert("Bạn chưa chọn checkbox nào!!!!");
					}
					else if(check == true)
					{
						if(check1 == true) 
						{
							if(confirm("Bạn có chắc muốn xoá không???"))
							{
								document.getElementById('actionType').value = 'XoaThietBi';
								document.getElementById('txtListThietBi').value = listThietBiCanXoa;
								document.forms["formThietBi"].submit();
							}
						}
						else
						{
							alert("Hãy chọn đúng thiết bị được phép xóa!!!");
						}
					}
				}
				function baoHuThietBi()
				{
					var str = "";
					for(var i=1;i<<%=c%>;i++)
					{
						if(document.getElementById('chk' + i).checked == true)
							str += '-' + document.getElementById('chk' + i).value;
					}
					if(str != "")
					{
						var value = window.showModalDialog("BaoHuThietBi.jsp?listMaThietBi="+str,"","dialogHeight: 650px; dialogWidth: 750px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;");
						if(value != null)
						{
							document.getElementById('txtListThietBi').value = value;
							document.getElementById('actionType').value = 'BaoHuThietBi';
							document.forms["formThietBi"].submit();
						}
					}
					else
						alert("Hãy chọn thiết bị!!!");
				}
			</script>
			<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRow) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>
		<c:if test = "${TotalPage gt 1}">		
		 	<tr style="background-color: transparent;">
				<td colspan="7">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachThietBi")%>?page=${CurrentPage - 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachThietBi")%>?page=${PageCount}&msg=${PhanLoai}">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachThietBi")%>?page=${CurrentPage + 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr> 	
		</c:if>		
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