<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.QuyetDinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MoChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.HeDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%>
<%@page import="vn.edu.hungvuongaptech.model.HeDaoTaoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel"%>

<%@page import="vn.edu.hungvuongaptech.dao.ReportDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SuDungDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
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
<title>Lịch sử dụng phòng</title>

<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
<c:set var = "truongKhoa" value = "<%=Constant.TRUONG_KHOA %>"></c:set>

<script language="JavaScript" type="text/javascript">
	//Javascript validation functions		
	
	function search(){
		document.getElementById('FileForm').submit();
	}
</script>

</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form name="FileForm" action="<%=request.getContextPath()%>/phanCongGiaoVienController" method="post" id = "FileForm">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>BẢNG PHÂN CÔNG GIÁO VIÊN GIẢNG DẠY</strong></div><br /></td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9" align="right">
					Khoa : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboKhoa" id="cboKhoa">
						<option value = "">  ---  Chọn khoa  ---  </option>
						<c:forEach var="khoa" items="<%= KhoaDAO.showAllKhoa() %>">
							<option value="${khoa.maKhoa}" <c:if test = "${khoa.maKhoa eq param.khoa}">selected</c:if>>${khoa.tenKhoa}</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="right">
					Năm học : 
				</th>
				<c:set var = "ListNamHoc" value="<%=NamHocDAO.getAllNamHoc() %>"/>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboNamHoc" id="cboNamHoc">
						<option value = "">  ---  Chọn năm học  ---  </option>
						<c:forEach var = "NamHoc" items="${ListNamHoc}">
							<option value = "${NamHoc.namBatDau}" <c:if test = "${param.namBatDau eq NamHoc.namBatDau}">selected</c:if>>${NamHoc.namBatDau}-${NamHoc.namKetThuc}</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="right">
					Học kì : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name = "cboHocKi" id="cboHocKi">
						<option value = "">  ---  Chọn học kỳ  ---  </option>
						<option value = "1" <c:if test = "${param.hocKi eq 1}">selected</c:if>>1</option>
						<option value = "2" <c:if test = "${param.hocKi eq 2}">selected</c:if>>2</option>
						
					</select>
				</th>
				<th style="background-color: #99bff9">
					<a href = "javascript: search()" id = "btnSearch"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</th>	
			</tr>
		</table>
	</form>
	<br/>
	
		<table style="background-color: transparent;" border="1">
			<tr align="center" style="background-color: transparent;">
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					STT
				</th>
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					Họ và tên GV
				</th>
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					Lớp
				</th>
				<th style="background-color: #778899; color: white;" rowspan="2">
					Môn học
				</th>
				<th style="background-color: #778899; color: white;" width="80" colspan="2">
					Số giờ giảng dạy
				</th>
				<th style="background-color: #778899; color: white;" width="150" rowspan="2">
					Các nhiệm vụ khác
				</th>
				<th style="background-color: #778899; color: white;" rowspan="2" >
					Ghi chú
				</th>				
			</tr>
			<tr align="center" style="background-color: transparent;">
				<td style="background-color: #778899; color: white;">Lý thuyết</td>
				<td style="background-color: #778899; color: white;">Thực hành</td>
			</tr>
			<%
			String khoa = "", hocKi = "", namBatDau = "";
			if(request.getParameter("khoa") != null)
				khoa = request.getParameter("khoa");
			if(request.getParameter("namBatDau") != null)
				namBatDau = request.getParameter("namBatDau");
			if(request.getParameter("hocKi") != null)
				hocKi = request.getParameter("hocKi");
			int count = -1, soThuTu = 1;
			ArrayList<LopHocModel> listPhanCongTheoLopHoc = ThoiKhoaBieuDAO.getPhanCongGiaoVien(khoa, namBatDau, hocKi);
			%>
			<c:set 	var = "ListPhanCongTheoLopHoc" value = '<%=listPhanCongTheoLopHoc %>' scope="session"></c:set>
		
			<c:forEach var="PhanCongList" items = "${ListPhanCongTheoLopHoc}">
				<%soThuTu = 1; count++;%>
				
				<c:forEach var = "SoThuTu" begin="1" end="<%=listPhanCongTheoLopHoc.get(count).getPhanCongGiaoVienList().size() %>">
					<tr style="background-color: transparent;">
						<td>${SoThuTu}</td>		
						<td>${PhanCongList.phanCongGiaoVienList[SoThuTu-1].tenGiaoVien}</td>
						<c:if test = "${SoThuTu eq 1}">				
							<td rowspan="<%=listPhanCongTheoLopHoc.get(count).getPhanCongGiaoVienList().size() %>">${PhanCongList.kiHieu}</td>
						</c:if>	
						<td>${PhanCongList.phanCongGiaoVienList[SoThuTu-1].tenMonHoc}</td>
						<td>${PhanCongList.phanCongGiaoVienList[SoThuTu-1].lyThuyet}</td>
						<td>${PhanCongList.phanCongGiaoVienList[SoThuTu-1].thucHanh}</td>
						<td></td>
						<td></td>
					</tr>
					<%soThuTu++; %>
				</c:forEach>
			</c:forEach>
		</table>
		<table>	
			<tr>
				<td colspan="7">	
					<a href = "<%=Constant.PATH_RES.getString("iso.InPhanCongGiaoVienPath") %>">								 
						<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
					</a>
				</td>
			</tr>
		</table>
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</div>
</body>
</html>