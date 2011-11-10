<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.model.SoLenLopModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThangTheoDoiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<title>So len lop</title>
<%
	SoLenLopModel soLenLop = (SoLenLopModel)request.getSession().getAttribute("SoLenLop");
	MonHocTKBModel monHocTKB = new MonHocTKBModel();
	for(int i=0;i<soLenLop.getMonHocTKBList().size();i++) {
		if(soLenLop.getMonHocTKBList().get(i).getMaMonHocTKB().equals(request.getParameter("MaMonHocTKB"))) {
			monHocTKB =  soLenLop.getMonHocTKBList().get(i);
			break;
		}
	}
	ArrayList<ThangTheoDoiModel> thangTheoDoiList = (ArrayList<ThangTheoDoiModel>)request.getSession().getAttribute("ThangTheoDoiList");
	int count = 1;
%>
<script type="text/javascript">
	function nhapNoiDungBaiDay(x)
	{
		//var value = window.showModalDialog("NhapNoiDungBaiDay.jsp",valueArea,"dialogHeight: 450px; dialogWidth: 450px; dialogTop: 120px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		var value = window.showModalDialog("NhapNoiDungBaiDay.jsp?maCT=" + document.getElementById('txtMaChiTietTKB' + x).value,document.getElementById('txtNoiDungBaiDay' + x).value,"dialogHeight: 450px; dialogWidth: 450px; dialogTop: 120px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value!=false && value != null)
			document.getElementById('txtNoiDungBaiDay' + x).value = value;	
	}
	function selectSoLenLop(value)
	{
		if(value != "") {
			var choice = value.split("-");
			if(choice[0] == "TT") 
				location.href = "TomTatNoiDung.jsp?MaMonHocTKB=" + choice[1];
			else
				location.href = "TheoDoiHocTap.jsp?Thang=" + choice[1];
		}
		else
			alert("Hãy chọn Bảng tóm tắt nội dung/Theo dõi học tập !!!");
	}
</script>
</head>
<body>
	<div class = "div_pagebody">
	<div align="center">
		<!-- S HEAD CONTENT -->
				<jsp:include page="../../block/header.jsp" />
		<!-- E HEAD CONTENT -->
		<c:set var = "SoLenLop" value = "<%=soLenLop %>" scope="session"/>
		<c:set var = "ThangTheoDoiList" value = "<%=thangTheoDoiList %>" scope = "session"/>
		<c:set var = "BangTomTatNoiDung" value = "<%=monHocTKB %>" scope = "session"/>
		<c:set var = "MaThanhVien" value = '<%=request.getSession().getAttribute("maThanhVien") %>'/>
		<c:set var = "MaBoPhan" value = '<%=request.getSession().getAttribute("maBoPhan") %>'/>
		<c:set var = "ADMIN" value = "<%=Constant.BO_PHAN_ADMIN %>"/>
		<c:set var = "NgayHienTai" value="<%=SysParamsDAO.getNgayGioHeThong().getNgayHeThong() %>"/>
		<table width = "800" style="background-color: transparent;" border="1">
			<tr style="background-color: transparent;">
				<td>Lớp : ${SoLenLop.kiHieuLop }</td>
				<td>Trình độ : ${SoLenLop.tenTrinhDo }</td>
				<td>Nghề : ${SoLenLop.tenNghe }</td>
				<td>Khóa : ${SoLenLop.khoa }</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="4">
					<select onchange="selectSoLenLop(this.value)">
						<option value = "">		---	Chọn ---	</option>
						<c:forEach var = "MonHocTKB" items = "${SoLenLop.monHocTKBList}">
							<option value = "TT-${MonHocTKB.maMonHocTKB }"
								<c:if test = "${param.MaMonHocTKB eq MonHocTKB.maMonHocTKB}">selected</c:if>>Bảng ghi tóm tắt nội dung ${MonHocTKB.tenMonHoc }</option>
						</c:forEach>
						<c:forEach var = "ThangTheoDoi" items = "${ThangTheoDoiList}">
							<option value = "TD-${ThangTheoDoi.thang }">Theo dõi ngày học tập tháng ${ThangTheoDoi.thang }</option>
						</c:forEach>
					</select>
					<a href="<%=Constant.PATH_RES.getString("iso.InSoLenLopPath") %>">
						<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Phân công giáo viên" border="0"/>
					</a>
				</td>
			</tr>
		</table>
		<table width = "800" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td style="width: 200px"></td>
				<td align="center">Mẫu số 3<br />Ban hành kèm theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>
			</tr>
		</table>
		<table width = "800" style="background-color: transparent;">
			<tr style="background-color: transparent;" align="left">
				<td><font style="size: 12px;"><strong>BẢNG GHI TÓM TẮT NỘI DUNG</strong></font><br /><br /></td>
				<td>HỌ VÀ TÊN GIÁO VIÊN : <%=monHocTKB.getTenGiaoVien() %><br/>MÔN HỌC/MÔ ĐUN : <%=monHocTKB.getTenMonHoc() %></td>
			</tr>
		</table>
		<br/>
		<br/>
		
		<table width = "800" style="background-color: transparent;" border="1">
			<tr style="background-color: transparent;" align="center">
				<td rowspan="2"><strong>NGÀY LÊN LỚP</strong></td>
				<td colspan="4"><strong>SỐ GIỜ</strong></td>
				<td rowspan="2"><strong>TÓM TẮT NỘI DUNG BÀI DẠY, KIỂM TRA</strong></td>
				<td rowspan="2"><strong>SỐ HỌC SINH/SINH VIÊN VẮNG MẶT</strong></td>
				<td rowspan="2"><strong>CHỮ KÝ GIÁO VIÊN</strong></td>
			</tr>
			<tr  style="background-color: transparent;" align="center">
				<td><strong>Lý thuyêt</strong></td>
				<td><strong>Thực hành</strong></td>
				<td><strong>Tích hợp</strong></td>
				<td><strong>Kiểm tra</strong></td>
			</tr>
			<c:forEach var = "ChiTietTKB" items = "<%=monHocTKB.getChiTietTKBModelList() %>">
				<tr style="background-color: transparent;" align="center">
					<td>${ChiTietTKB.ngayHoc }</td>
					<c:choose>
						<c:when test = "${ChiTietTKB.coHieu eq 0}"><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td><td>0</td><td>0</td></c:when>
						<c:when test = "${ChiTietTKB.coHieu eq 1}"><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td><td>0</td></c:when>
						<c:when test = "${ChiTietTKB.coHieu eq 5}"><td>0</td><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td></c:when>
						<c:otherwise><td>0</td><td>0</td><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td></c:otherwise>
					</c:choose>
					<td>
						<c:set var = "SoSanhNgay" value = "${sf:compareDate(NgayHienTai, ChiTietTKB.ngayHoc)}"></c:set>
						<textarea id = "txtNoiDungBaiDay<%=count %>" readonly="readonly"
							<c:if test = "${(MaThanhVien eq BangTomTatNoiDung.maGiaoVien or MaBoPhan eq ADMIN) and SoSanhNgay eq true}">onclick = "nhapNoiDungBaiDay(<%=count %>)"</c:if>
								>${ChiTietTKB.noiDungBaiDay }</textarea>
						<input type = "hidden" value = "${ChiTietTKB.maChiTietTKB }" id = "txtMaChiTietTKB<%=count %>"/>	
					</td>
					<td><c:choose>
						<c:when test="${SoSanhNgay eq true}">
							${ChiTietTKB.soSVVangMat }
						</c:when>
						<c:otherwise>
							<p></p>
						</c:otherwise>
					</c:choose></td>
					<td></td>
				</tr>
				<%count++; %>
			</c:forEach>
		</table>
		<table width = "800" style="background-color: transparent;">
			<tr>
				<td colspan="2">
					<a href = "<%=Constant.PATH_RES.getString("iso.InTomTatNoiDungPath") %>">								 
						<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
					</a>
				</td>
			</tr>
		</table>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
		<!-- E FOOT CONTENT -->
	</div>
	</div>
</body>
</html>