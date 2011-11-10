<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThangTheoDoiModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.model.SoLenLopModel"%><html>
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
<script type="text/javascript">
<%
SoLenLopModel soLenLop = (SoLenLopModel)request.getSession().getAttribute("SoLenLop");
ArrayList<ThangTheoDoiModel> thangTheoDoiList = (ArrayList<ThangTheoDoiModel>)request.getSession().getAttribute("ThangTheoDoiList");
ThangTheoDoiModel thangTheoDoi = new ThangTheoDoiModel();
for(int i=0;i<thangTheoDoiList.size();i++) {
	if(thangTheoDoiList.get(i).getThang().equals(request.getParameter("Thang"))) {
		thangTheoDoi = thangTheoDoiList.get(i);
		break;
	}
}
int count = 0;
%>
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
		<c:set var = "ThangTheoDoi" value = "<%=thangTheoDoi %>" scope="session"/>
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
							<option value = "TT-${MonHocTKB.maMonHocTKB }">Bảng ghi tóm tắt nội dung ${MonHocTKB.tenMonHoc }</option>
						</c:forEach>
						<c:forEach var = "ThangTheoDoi" items = "${ThangTheoDoiList}">
							<option value = "TD-${ThangTheoDoi.thang }"
								<c:if test = "${param.Thang eq ThangTheoDoi.thang}"></c:if>>Theo dõi ngày học tập tháng ${ThangTheoDoi.thang }</option>
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
			<tr style="background-color: transparent;">
				<td colspan="3" align="center"><font style="font-weight: bold; font-size: 15px" >THEO DÕI NGÀY HỌC TẬP</font><br />
				Tháng <%=thangTheoDoi.getThang() %> năm <%=thangTheoDoi.getNam() %>
				</td>
			</tr>
		</table>	
		<br/>
		<br/>
		
		<table width = "800" style="background-color: transparent;" border="1">
			<tr style="background-color: transparent; font-size: 9px" align="center">
				<td rowspan="2"><strong>STT</strong></td>
				<td rowspan="2"><strong>Họ và tên học viên</strong></td>
				<td colspan="31"><strong>NGÀY</strong></td>
				<td rowspan="2"><strong>Số giờ nghỉ có phép</strong></td>
				<td rowspan="2"><strong>Số giờ nghỉ không phép</strong></td>
				<td rowspan="2" ><strong>Ghi chú</strong></td>
			</tr>
			<tr  style="background-color: transparent;" align="center">
				<c:forEach var = "Ngay" begin = "1" end = "31">
					<td style="font-size: 7px;">${Ngay}</td>
				</c:forEach>
			</tr>
			<c:forEach var = "ThanhVienDiemDanh" items = "<%=thangTheoDoi.getThanhVienDiemDanhModelList() %>">
				<%
					int size = thangTheoDoi.getThanhVienDiemDanhModelList().get(count).getChiTietDiemDanhList().size();
					count++; 
				%>
				<c:set var = "dem" value = "0"/>
				<c:set var = "SoNgayNghi" value = "0"/>
				<tr style="background-color: transparent; font-size: 9px" align="center">
					<td><%=count %></td>
					<td>${ThanhVienDiemDanh.tenThanhVien}</td>
					<c:forEach var = "Ngay" begin = "1" end = "31">
						<c:set var = "check" value = "0"/>
						<c:set var = "TinhTrangDiHoc" value = "x"/>
						<td>
							<c:forEach var = "Count" begin = "${dem}" end = "<%=size %>">
								<c:if test = "${Ngay eq ThanhVienDiemDanh.chiTietDiemDanhList[Count].ngay}">
									<c:choose>
										<c:when test = "${ThanhVienDiemDanh.chiTietDiemDanhList[Count + 1].ngay eq ThanhVienDiemDanh.chiTietDiemDanhList[Count].ngay 
											and not empty ThanhVienDiemDanh.chiTietDiemDanhList[Count + 1].ngay}">
											<c:choose>
												<c:when test="${ChiTietDiemDanh[Count].tinhTrangDiHoc eq 4 and TinhTrangDiHoc eq 'x'}">
													<c:set var = "TinhTrangDiHoc" value = "x"/>
												</c:when>
												<c:otherwise>
													<c:set var = "TinhTrangDiHoc" value = "k"/>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											${TinhTrangDiHoc }&nbsp;
											<c:if test = "${TinhTrangDiHoc eq 'k'}"><c:set var = "SoNgayNghi" value = "${SoNgayNghi + 1}"/></c:if>
										</c:otherwise>
									</c:choose>
									<!--<c:choose>
										<c:when test = "${ChiTietDiemDanh[Count].tinhTrangDiHoc eq 4}">x&nbsp;</c:when>
										<c:otherwise>k&nbsp;</c:otherwise>
									</c:choose>
									--><c:set var = "dem" value = "${Count + 1}"/>
									<c:set var = "check" value = "1"/>
								</c:if>
							</c:forEach>
							<c:if test = "${check eq '0'}">&nbsp;&nbsp;&nbsp;</c:if>
						</td>
					</c:forEach>
					<td></td>
					<td>${SoNgayNghi }</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
		<table width = "800" style="background-color: transparent;">
			<tr>
				<td colspan="2">
					<a href = "<%=Constant.PATH_RES.getString("iso.InTheoDoiHocTapPath")%>">								 
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