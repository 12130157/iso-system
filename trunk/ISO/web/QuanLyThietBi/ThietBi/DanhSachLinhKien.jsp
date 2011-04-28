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
<%@page import="vn.edu.hungvuongaptech.dao.TinhTrangThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiLinhKienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThietBiDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
		document.getElementById('actionType').value = 'searchLinhKien';
		document.forms['formLinhKien'].submit();
	}
	function submit()
	{
		document.getElementById("formLinhKien").submit();
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
	<c:set var="listLoaiLinhKien" value="<%= LoaiLinhKienDAO.getAllLoaiLinhKien() %>"></c:set>
	<c:set var="listTinhTrang" value="<%= TinhTrangThietBiDAO.getAllTinhTrangThietBi()%>" />
	
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formLinhKien" id = "formLinhKien" method="post">
		<div>
		<input type="hidden" id="actionType" value="tinhtrang" name = "actionType"/>		
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách linh kiện</div>
				</td>
			</tr>
		</table>
			
	
		<% 
			String loaiLinhKien = "", phongBan = "", tinhTrang = "", currentPage = "1"; 
			if(request.getParameter("loaiLinhKien") != null)
				loaiThietBi = request.getParameter("loaiLinhKien");
			
			if(request.getParameter("phongBan") != null)
				phongBan = request.getParameter("phongBan");
			
			if(request.getParameter("tinhTrang") != null)
				tinhTrang = request.getParameter("tinhTrang");
			
			if(request.getParameter("page") != null)
				currentPage = request.getParameter("page");
			
			int c = 1, totalRow = 0;
			totalRow = ChiTietThietBiDAO.getCountChiTietThietBi(loaiLinhKien, phongBan, tinhTrang, "");
			ArrayList<ThietBiModel> chiTietThietBiList = ChiTietThietBiDAO.getAllChiTietThietBiByDieuKien(loaiLinhKien, phongBan, tinhTrang, totalRow, currentPage, "");
		%>
		<c:set var="CurrentPage" value="<%=currentPage %>"></c:set>
		<table border='1' style="background-color: transparent;">
			<tr>
				<td>
					Loại 	
						<select id="cboLoaiLinhKien" name="cboLoaiLinhKien">
							<option 
								<c:if test="${param.maLoaiLinhKien eq ''}"> selected</c:if>
									value = "" >Chọn</option>	
												
							<c:forEach var="loaiLinhKien" items="${listLoaiLinhKien}">
								<option 
									<c:if test="${param.loaiLinhKien eq loaiLinhKien.maLoaiLinhKien}">selected</c:if>
										value="${loaiLinhKien.maLoaiThietBi}">${loaiLinhKien.tenLoaiThietBi}
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
				<td><a href = "javascript: search();"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a></td>
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
				<th style='background-color: #186fb2;color:white'>Loại linh kiện</th>
				<th style='background-color: #186fb2;color:white'>Kí Hiệu</th>
				<th style='background-color: #186fb2;color:white'>Tên linh kiện</th>
				<th style='background-color: #186fb2;color:white'>Tên phòng ban</th>
				<th style='background-color: #186fb2;color:white'>Tình trạng</th>								
			</tr>
					
			<c:set var="listThietBi" value="<%= thietBiList %>" scope = "session"></c:set>
					
			
			<c:forEach var="ThietBi" items="${listThietBi}">
				<tr>
					<td><input type="checkbox" name="chk<%=c %>" id="chk<%=c %>" onclick="checkRow();" value="${ThietBi.maThietBi}"/></td>
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
				
				function deleteRow()
				{
					var listThietBiCanXoa = "";
					var check = false;
					<%
						for(int i=1;i<c;i++)
						{
							out.print("if(document.getElementById('chk" + i + "').checked == true) {");
							out.print("check = true;");
							out.print("listThietBiCanXoa += '-' + document.getElementById('chk" + i + "').value; }");
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
							document.getElementById('actionType').value = 'BaoHuThietBi';
							document.getElementById('txtListThietBiCanXoa').value = listThietBiCanXoa;
							document.forms["formThietBi"].submit();
						}
					}
				}
				
			</script>
			<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRow) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>
		<c:if test = "${TotalPage gt 1}">		
		 	<tr style="background-color: transparent;">
				<td colspan="7">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachLinhKienPath")%>?page=${CurrentPage - 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachLinhKienPath")%>?page=${PageCount}&msg=${PhanLoai}">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("qltb.DanhSachLinhKienPath")%>?page=${CurrentPage + 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr> 	
		</c:if>		
		</table>
		<table>
			<tr>
				<td>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/ThemChiTietThietBi.jsp"><img src="<%=request.getContextPath()%>/images/buttom/themlinhkien.png" alt="thêm linh kiện" border = "0" /></a>
					<a href = "javascript: deleteRow()">
						<img src="<%=request.getContextPath()%>/images/buttom/xoa.png" alt="Xóa Dòng" border = "0" />
					</a>
					<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/BaoHu.jsp"><img src="<%=request.getContextPath()%>/images/buttom/baohu.png" alt="Báo Hư" border = "0" /></a>	
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
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>