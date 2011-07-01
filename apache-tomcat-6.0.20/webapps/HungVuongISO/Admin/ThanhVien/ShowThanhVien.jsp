<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>

<%@page import="vn.edu.hungvuongaptech.util.StringUtil"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><fmt:bundle basename="i18n">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Thành Viên</title>

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
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>	
	<!-- phan trang begin -->
	<%
		ArrayList listThanhVien = new ArrayList();
		double currentPage = 0;
		double totalRows = 0;
		double numRows = 0;
		int a = 0;
		if (request.getParameter("page") != null) { // Phan Trang
			 totalRows = ThanhVienDAO.countThanhVien();
			 numRows = Integer.parseInt(Constant.NUM_ROWS_ADMIN);
			 currentPage = Double.parseDouble(request.getParameter("page").toString());
			 double paramB =  totalRows - (numRows * (currentPage-1));
			 a = (int) paramB;
			 listThanhVien = ThanhVienDAO.getThanhVien(a);
		} else { // Khong Phan Trang
			listThanhVien = (ArrayList) request.getAttribute("listThanhVien");
		}
	%>
	<!-- phan trang end -->		
	<c:set var="listBoPhan" value="<%= KhoaDAO.showAllKhoa() %>"></c:set>
	
	<form action="<%=request.getContextPath()%>/ThanhVienController" method="post" name="SearchForm" id="SearchForm">
	
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan="3">
					<div class = "div_thanhvientieude">Danh Sách Thành Viên</div>
				</td>
			</tr>
			<tr style="background-color: transparent;"><td colspan="3">
				<c:if test="${param.msg eq 'msg'}">
					<br /><br /><b class="msg">Bạn vừa tạo mới thành công một thành viên !!!</b><br /><br />
				</c:if>
				<c:if test="${param.msg eq 'msg_1'}">
					<br /><br /><b class="msg">Bạn vừa cập nhật thành công một thành viên !!!</b><br /><br />
				</c:if>
			</td></tr>
			<tr style="background-color: transparent;">
				<td>
					Tên bộ phận :
					<select name="cboBoPhan">
							<option 
								<c:if test="${param.maKhoa eq -1}"> selected</c:if>
								value = "-1" >All</option>	
											
							<c:forEach var="khoa" items="${listBoPhan}">
								<option 
									<c:if test="${param.maKhoa eq khoa.maKhoa}">selected</c:if>
									value="${khoa.maKhoa}">${khoa.tenKhoa}
								</option> 
							</c:forEach>
					</select>
				</td>
				<td>					
					<input type = 'text' id = 'txtTim' name = 'txtTim' size = "35" style="background-color: transparent;" value="${requestScope.ten}"/>
					<input type="hidden" name="actionType" value="Admin_TimThanhVienByMaVaiTro" />
				</td>
				<td>
					<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
					<input type = "hidden" name = "totalRows" value="<%=a %>"/>
				</td>
			</tr>
		</table>
	</form>	
	<form action = "" name = "tableList" id = "tableList" >
		<table width = "800" border = "1">
			<tr width = "800">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên Đăng Nhập</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Họ và tên</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Vai trò</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Bộ phận</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Email</div></th>			
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tình trạng<br />
				</div></th>
			</tr>
			<% int row = 0; %>
			<c:forEach var="thanhVien" items="<%= listThanhVien %>">
				<tr>	
					<td><%= row + 1 %></td>	
					<td><div class = "div_textleft">${thanhVien.tenDangNhap}</div></td>
					<td><div class = "div_textleft"> 
						<a href = "<%= Constant.PATH_RES.getString("Admin.ChiTietThanhVienPath") %>?maThanhVien=${thanhVien.maThanhVien}">
							${thanhVien.hoThanhVien} ${thanhVien.tenLot} ${thanhVien.tenThanhVien}
						</a>
					</div></td>
					<td>${thanhVien.tenVaiTro}</td>
					<td>${thanhVien.tenBoPhan}</td>
					<td>${thanhVien.email}</td>			
					<td>
						<input type = 'checkbox' name = 'check<%=row%>' id = 'check<%=row%>' disabled="disabled"
							<c:if test="${thanhVien.tinhTrang eq 1}"> checked="checked" </c:if>
						/>
					</td>						
				</tr>
				<% row++; %>
			</c:forEach>
			<input type = "hidden" name = "rowCount" value = "<%=row%>" />
			<tr>
				<td colspan="2">
					<a href = "<%=request.getContextPath()%>/Admin/ThanhVien/ThemMoiThanhVien.jsp"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
				</td>
				<td colspan="4">
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
						<a href="<%=Constant.PATH_RES.getString("Admin.XemThanhVienPath")%>?page=${CurrentPage - 1}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
				
					 <c:forEach var = "PageCount" begin = "1" end = "<%= totalPages %>"> 
						 <a href="<%=Constant.PATH_RES.getString("Admin.XemThanhVienPath")%>?page=${PageCount}">${PageCount}</a> - 
					</c:forEach>
					
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("Admin.XemThanhVienPath")%>?page=${CurrentPage + 1}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>
					
					<!-- phan trang end -->
				</td>
			</tr>
		</table>
	
	</form>
	
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>