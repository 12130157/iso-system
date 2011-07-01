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
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<script type="text/javascript" language="JavaScript">
	function submitFormSearch(){
			document.forms["SearchForm"].submit();
	}
	function submitFormUpdate(){
		<% if(request.getParameter("thongBaoCapNhatTinhTrang") != null){out.print("submitFormSearch();");} %>
	}
	function pageload(){
		<% if(request.getParameter("maVaiTro") == null){out.print("submitFormSearch();");} %>
	}
</script>
</head>
<body onload="">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>	
	
	<!-- phan trang begin -->
	<%
		ArrayList listThietBi = new ArrayList();
		double currentPage = 0;
		double totalRows = 0;
		double numRows = 0;
		int a = 0;
		if (request.getParameter("page") != null) { // Phan Trang
			 totalRows = ThietBiDAO.countThietBi();
			 numRows = Integer.parseInt(Constant.NUM_ROWS_THIETBI);
			 currentPage = Double.parseDouble(request.getParameter("page").toString());
			 double paramB =  totalRows - (numRows * (currentPage-1));
			 a = (int) paramB;
			 listThietBi = ThietBiDAO.getThietBi(a);
		} else { // Khong Phan Trang
			listThietBi = (ArrayList) request.getAttribute("listThietBi");
		}
	%>
	<!-- phan trang end -->
	<c:set var="listTinhTrang" value="<%= ThietBiDAO.showAllTinhTrangTB() %>"></c:set>
	<c:set var="listPhong" value="<%= PhongBanDAO.getAllPhongBan() %>"></c:set>
	<c:set var="listLoaiThietBi" value="<%= LoaiThietBiDAO.getAllLoaiThietBi() %>"></c:set>
	<form>
		<div>
		<input type="hidden" id="actionType" />
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách Các Thiết Bị</div>
				</td>
			</tr>
		</table>
		
		<table border='1' style="background-color: transparent;">
			<tr>
				<td style='background-color: #186fb2;color:white'>Chế độ theo dõi</td>
				<td style='background-color: #186fb2;color:white'>Chế độ mượn</td>
			</tr>
			<tr>
				<td><input type="radio" id="rdoCheDoTheoDoi" name="rdoCheDoTheoDoi"/></td>
				<td><input type="radio" id="rdoCheDoMuonTra" name="rdoCheDoMuonTra"/></td>
			</tr>
			<tr>
				
				<td>Tình trạng 
					<select id="cboTinhTrang" name="cboTinhTrang">
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
				<td>Hiện trạng 	<select id="cboHienTrang" name="cboHienTrang">
									<option>Rảnh</option> 
									<option>Bận</option>
								</select></td>
			</tr>
			<tr>
				<td>
					Phòng 	<select id="cboPhong" name="cboPhong">
								<option 
								<c:if test="${param.maPhongBan eq -1}"> selected</c:if>
								value = "-1" >All</option>	
											
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
									value = "-1" >All</option>	
												
									<c:forEach var="loaiThietBi" items="${listLoaiThietBi}">
										<option 
											<c:if test="${param.maLoai eq loaiThietBi.maLoai}">selected</c:if>
											value="${loaiThietBi.maLoai}">${loaiThietBi.tenLoai}
										</option>
									</c:forEach>
							</select>
							
					<input type="button" value="Tìm kiếm" />
				</td>
				<td>
					Kí hiệu <select id="selKiHieu" name="selKihieu"><option>--Chọn--</option></select>
					<input type="button" value="Tìm kiếm" />	
				</td>
	
			</tr>
		
	
			<tr>
				<td>
					<input type="button" value="Thêm" onclick="location.href='ThemThietBi.jsp'"/>
					<input type="button" value="Xóa"/>
					<input type="button" value="Thay đổi tình trạng"/>
				</td>
				<td>
					<input type="button" value="Mượn" onclick="location.href='MuonThietBi.jsp'"/>
					<input type="button" value="Báo hư"/>
					<input type="button" value="Thay đổi thiết bị"/>
				</td>
				
			</tr>
	
		</table>
		<table border="1">
			<tr>
				<td  colspan="9" style="text-align:right">
					Số dòng <select id="" name=""><option>-5--</option></select> Trang 1 2 3 4 ...	
				</td>
			</tr>	

			<tr>
				<th style='background-color: #186fb2;color:white'>Check</th>
				<th style='background-color: #186fb2;color:white'>STT</th>
				<th style='background-color: #186fb2;color:white'>Tên thiết bị</th>
				<th style='background-color: #186fb2;color:white'>Tình trạng</th>
				<th style='background-color: #186fb2;color:white'>Hiện trạng</th>
				<th style='background-color: #186fb2;color:white'>Tần suất sử dụng</th>				
				<th style='background-color: #186fb2;color:white'>Tần suất tối đa</th>
				<th style='background-color: #186fb2;color:white' colspan="2"></th>
				
			</tr>
	
			<% int c = 0; %>
			<c:set var="listThietBi" value="<%= ThietBiDAO.showAllThietBi() %>"></c:set>
			<c:forEach var="ThietBi" items="${listThietBi}">
				<tr>
					<td><input type="checkbox" name="chk<%=c %>" id="chk<%=c %>"/></td>
					<td><%=c+1 %></td>
					<td>${ThietBi.tenThietBi }</td>
					<td>${ThietBi.tenTinhTrang }</td>
					<td>Rãnh</td>
					<td>${ThietBi.tanSuatSuDung }</td>
					<td>${ThietBi.tanSuatToiDa }</td>
					
					<td>
						<a href = "<%= Constant.PATH_RES.getString("qltb.ChiTietThietBiPath") %>?maThietBi=${ThietBi.maThietBi}">
							Edit
						</a>
					</td>
				</tr>
				<%c++; %>
			</c:forEach>
			<input type = "hidden" name = "rowCount" value = "<%=c%>" />
			<tr>
				<td  colspan="9" style="text-align:right">
					<!-- phan trang begin -->
					<%
						int totalPages = 0;
						if (request.getParameter("page") != null) { // Phan Trang
							double tmp = (totalRows/numRows) + 0.4;
							long totalPages0 = Math.round(tmp);
							totalPages = (int) totalPages0;
						} else {
							totalPages = 0;
						}
					 %>
					 
					<c:set var="CurrentPage" value="<%=currentPage %>"></c:set>
					<c:set var="TotalPage" value="<%=totalPages %>"></c:set>
					
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("QLTB.XemThietBiPath")%>?page=${CurrentPage - 1}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
				
					 <c:forEach var = "PageCount" begin = "1" end = "<%= totalPages %>"> 
						 <a href="<%=Constant.PATH_RES.getString("QLTB.XemThietBiPath")%>?page=${PageCount}">${PageCount}</a> - 
					</c:forEach>
					
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("QLTB.XemThietBiPath")%>?page=${CurrentPage + 1}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>
					
					<!-- phan trang end -->
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