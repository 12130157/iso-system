<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThangTheoDoiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThangTheoDoiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.SoLenLopModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SoLenLopDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><html>
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

<title>Insert title here</title>
<%
	String maGiaoVien = "";
	if(request.getSession().getAttribute("maVaiTro").equals(Constant.GIAO_VIEN))
		maGiaoVien = (String) request.getSession().getAttribute("maThanhVien");
	SoLenLopModel soLenLop = SoLenLopDAO.getBangTomTatNoiDungByMaTKB(request.getParameter("maTKB"), maGiaoVien); 
	ArrayList<ThangTheoDoiModel> thangTheoDoiList = ThangTheoDoiDAO.getThangTheoDoiByMaTKB(request.getParameter("maTKB"));
%>
<script type="text/javascript">
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
		<table width = "800" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td align="center" colspan="2"><strong>ỦY BAN NHÂN DÂN QUẬN 5<BR/>TRƯỜNG TCNKTCN HÙNG VƯƠNG</strong></td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><font size="8"><strong>SỔ LÊN LỚP</strong></font><br /><br /></td>
			</tr>
		</table>
		<table width = "800" style="background-color: transparent;" border="1">
			<tr style="background-color: transparent;">
				<td>Lớp : ${SoLenLop.kiHieuLop }</td>
				<td>Trình độ : ${SoLenLop.tenTrinhDo }</td>
				<td>Nghề : ${SoLenLop.tenNghe }</td>
				<td>Khóa : ${SoLenLop.khoa }</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="4">
					<select onchange="selectSoLenLop(this.value);">
						<option value = "">		---	Chọn ---	</option>
						<c:forEach var = "MonHocTKB" items = "${SoLenLop.monHocTKBList}">
							<option value = "TT-${MonHocTKB.maMonHocTKB }">Bảng ghi tóm tắt nội dung ${MonHocTKB.tenMonHoc }</option>
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
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
		<!-- E FOOT CONTENT -->
	</div>
	</div>
</body>
</html>