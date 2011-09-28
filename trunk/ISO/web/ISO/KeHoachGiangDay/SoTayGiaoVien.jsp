<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.DeCuongMonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TuanLeModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungDCMHModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NoiDungDCMHDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>

<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThoiKhoaBieuController"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.util.DateUtil"%>


<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHGDModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SoTayGiaoVienDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
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
<title>SỔ TAY GIÁO VIÊN</title>

	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "HieuTruong" value = "<%= Constant.HIEU_TRUONG %>"></c:set>
	<c:set var = "TruongKhoa" value = "<%= Constant.TRUONG_KHOA %>"></c:set>
	<c:set var = "PhoKhoa" value = "<%= Constant.PHO_KHOA %>"></c:set>
	<c:set var = "GiaoVien" value = "<%=Constant.GIAO_VIEN %>"></c:set>
	<c:set var = "Admin" value = "<%=Constant.ADMIN %>"></c:set>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "NEW" value = "<%= Constant.TINHTRANG_NEW %>"></c:set>
	<c:set var = "SEND" value = "<%= Constant.TINHTRANG_SEND %>"></c:set>
	<c:set var = "REJECT" value = "<%= Constant.TINHTRANG_REJECT %>"></c:set>
	<c:set var = "APPROVE" value = "<%= Constant.TINHTRANG_APPROVE %>"></c:set>
	<c:set var = "TK_APPROVE" value = '<%=Constant.TINHTRANG_TK_APPROVE%>'> </c:set>
	<c:set var = "TK_REJECT" value = '<%=Constant.TINHTRANG_TK_REJECT%>'> </c:set>
	<c:set var = "TK_SEND" value = '<%=Constant.TINHTRANG_TK_SEND%>'> </c:set>
	<c:set var = "HT_APPROVE" value = '<%=Constant.TINHTRANG_HT_APPROVE%>'> </c:set>
	<c:set var = "coHieuLT" value = '<%=Constant.COHIEULT %>'></c:set>
	<c:set var = "coHieuTH" value = '<%=Constant.COHIEUTH %>'></c:set>
	<c:set var = "coHieuTHop" value = '<%=Constant.COHIEUTHOP %>'></c:set>
	<c:set var = "coHieuKT" value = '<%=Constant.COHIEUKT %>'></c:set>

	<c:set var = "maKhoa" value = '<%=(String) request.getSession().getAttribute("maBoPhan") %>'></c:set>	
	<c:set var = "boPhanHC" value = '<%=Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "boPhanKDCL" value = '<%=Constant.BO_PHAN_PKID %>'></c:set>
	<c:set var = "boPhanPDT" value = '<%=Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var = "boPhanBGH" value = '<%=Constant.BO_PHAN_BGH %>'></c:set>
	<c:if test="${not empty param.id}">
		<c:set var="SoTayGiaoVien" value='<%=SoTayGiaoVienDAO.getSoTayGiaoVienById(request.getParameter("id")) %>'></c:set>
	</c:if>
</head>

<body>
	<div align="center";>
		<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
		<!-- E HEAD CONTENT -->
				
		<form action="" id="SoTayGiaoVien" name="SoTayGiaoVien" method="post">
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td colspan="2">
						<strong>SỔ TAY GIÁO VIÊN</strong>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left">Môn Học/Modul : </td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left">Lớp : </td>
					<td style="text-align: left">Khóa : </td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="2" style="text-align: left">Giáo Viên : </td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="2" style="text-align: left">Niên Khóa : </td>
				</tr>
			</table>
			<table style="background-color: transparent;">
				<tr>
					<td>
						I/ Thông Tin Lớp Học
						
					</td>
				</tr>
			</table>
			<c:forEach var="listThang" items="${SoTayGiaoVien.listThang}">
				<table style="background-color: transparent;" id="${listThang }">
					<tr style="background-color: transparent;">
						<td colspan="31">Tháng ${listThang }</td>
					</tr>
					<tr style="background-color: transparent;">
						<c:forEach begin="1" end="31" step="1" var="i">
							<td>${i }</td>
						</c:forEach>
					</tr>
					
					<c:forEach var="listHocSinh" items="${SoTayGiaoVien.listHocSinh}">
						<tr style="background-color: transparent;">
							<td>${listHocSinh.hoThanhVien} ${listHocSinh.tenLot } ${listHocSinh.tenThanhVien }</td>						
							<c:forEach begin="1" end="31" step="1" var="i">
								<c:set var="NgayHoc" value="${i}-${listThang }"></c:set>
								<c:set var="count" value="1"></c:set>
								<td>
									<c:forEach var="listDiemDanh" items="${SoTayGiaoVien.listDiemDanh}">
										<c:if test="${listDiemDanh.maThanhVienDiemDanh eq listHocSinh.maThanhVien and listDiemDanh.ngayHoc eq NgayHoc}">
											<c:if test="${listDiemDanh.tinhTrang eq '1' or listDiemDanh.tinhTrang eq '2' or listDiemDanh.tinhTrang eq '3'}">
												<c:if test="${count eq 1}">
												K
												</c:if>
												<c:set var="count" value="${count+1}"></c:set>
											</c:if>
										</c:if>
									</c:forEach>
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
			</c:forEach>
			
		</form>
		
		
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
		<!-- E FOOT CONTENT -->
	</div>
</body>
</html>