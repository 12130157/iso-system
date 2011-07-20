<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/nhansu.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<c:set var="boPhan" value='<%=session.getAttribute("maBoPhan").toString() %>'></c:set>
<c:set var="vaiTro" value='<%=session.getAttribute("maVaiTro").toString() %>'></c:set>
<title>Chi Tiết Nhân Sự</title>
<c:if test="${not empty param.maThanhVien}">
	<c:set var="ChiTietThanhVien" value = '<%= ThanhVienDAO.XemChiTietThanhVienByMaThanhVien(request.getParameter("maThanhVien")) %>' scope="session"></c:set>
</c:if>
</head>
<body>
	<div align="center">
	<div class = "div_pagebody">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
		<table width="790px">
			<tr style="background-color: transparent;"><td style="text-align: center;font-size: 16px;font-weight: bold;font-style: italic;"><br/>Bạn Đang Xem Thông Tin Chi Tiết Của ${ChiTietThanhVien.hoThanhVien} ${ChiTietThanhVien.tenLot} ${ChiTietThanhVien.tenThanhVien}<br/></td></tr>
		</table>
		<table width="790px" border="1">
			<tr style="background-color: #696565;font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;">Chi Tiết</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px" style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Họ và Tên</td>
				<td style="text-align: left;padding-left: 10px;">${ChiTietThanhVien.hoThanhVien} ${ChiTietThanhVien.tenLot} ${ChiTietThanhVien.tenThanhVien}</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px" style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Địa Chỉ</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.soNha}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							Số nhà ${ChiTietThanhVien.soNha}, đường ${ChiTietThanhVien.duong}, P.${ChiTietThanhVien.phuongXa}, Q.${ChiTietThanhVien.quanHuyen}, ${ChiTietThanhVien.thanhPho}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Ngày Sinh</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.ngaySinh}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.ngaySinh}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Email</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.email}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.email}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">CMND</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.chungMinhNhanDan}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.chungMinhNhanDan}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Vai Trò</td>
				<td style="text-align: left;padding-left: 10px;">${ChiTietThanhVien.tenVaiTro}</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Bộ Phận</td>
				<td style="text-align: left;padding-left: 10px;">${ChiTietThanhVien.tenKhoa}</td>
			</tr>
			<tr style="background-color: #696565;font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;">Ngân Hàng</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Số Tài Khoản</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.soTaiKhoan}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.soTaiKhoan}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Ngân Hàng</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.nganHang}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.nganHang}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: #696565;font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;font-weight: bold;">Bằng Cấp</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Loại Bằng</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.loaiBang}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.loaiBang}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Trường Cấp</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.truongCap}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.truongCap}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Loại Tốt Nghiệp</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.loaiTotNghiep}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.loaiTotNghiep}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<c:if test="${not empty param.maThanhVien}">
			<br/>
			<a href = "<%=request.getContextPath() %>/NhanSu/TimKiemNhanSu/PrintChiTietNhanSu.jsp">								 
				<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
			<br/>
		</c:if>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
	</div>
	</div>
</body>
</html>