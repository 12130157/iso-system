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
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.TinhTrangThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%><html xmlns="http://www.w3.org/1999/xhtml">


<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
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

<title>Hệ Thống Quản Lý Thiết Bị - Chi Tiết Thiết Bị</title>
<
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var = "listThietBi" value = "<%= ThietBiDAO.getAllThietBi() %>"></c:set>
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formThietBi" id = "formThietBi">
	
	<!-- chua co test -->
		<input type = "hidden" name = "actionType" value="QLTB_updateTB" />
	<!-- chua co test -->
	
		<table style="background-color: transparent;">
				<c:set var="ChiTietThietBi" value = '<%= ThietBiDAO.XemChiTietThietBiByMaThietBi(request.getParameter("maThietBi")) %>' scope="session"></c:set>
					<input type = "hidden" name = "id" value="<%=request.getParameter("maThietBi") %>" />
			<tr style="background-color: transparent;">
				<td colspan="4">
					<div class = "div_thanhvientieude">Bạn Đang Xem Thông Tin Chi Tiết Của ${ChiTietThietBi.tenThietBi} </div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="3"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_taikhoang.png" border = "0" /> Thiết bị</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Tên loại thiết bị : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" readonly="readonly" value = "${ChiTietThietBi.tenLoaiThietBi}" name = "txtKiHieu" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Kí hiệu : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" readonly="readonly" value = "${ChiTietThietBi.kiHieu}" name = "txtKiHieu" style="background-color: transparent;" /></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Số máy : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.soMay}" name = "txtSoMay" style="background-color: transparent;" /></div></td>
			</tr>			
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Thuộc bộ phận : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" readonly="readonly" value = "${ChiTietThietBi.tenBoPhan}" name = "txtKiHieu" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Phòng ban : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" readonly="readonly" value = "${ChiTietThietBi.tenPhongBan}" name = "txtKiHieu" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Người Tạo : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" readonly="readonly" value = "${ChiTietThietBi.tenNguoiTao}" name = "txtKiHieu" style="background-color: transparent;" /></div></td>
			</tr>		
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Tên nhà cung cấp : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" readonly="readonly" value = "${ChiTietThietBi.tenNhaCungCap}" name = "txtKiHieu" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Tình trạng : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" readonly="readonly" value = "${ChiTietThietBi.tenTinhTrang}" name = "txtKiHieu" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Hiện trạng : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" readonly="readonly" value = "Rảnh" name = "txtKiHieu" style="background-color: transparent;" /></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Ngày sản xuất : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.ngaySanXuat}" name = "txtNgaySanXuat" style="background-color: transparent;" /></div></td>
				<td>hinh</td>
			</tr>
			<tr>
				<td><div class = "div_textright">Ngày mua : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.ngayMua}" name = "txtNgayMua" style="background-color: transparent;" /></div></td>
				<td>hinh</td>
			</tr>
			<tr>
				<td><div class = "div_textright">Ngày bảo hành : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.ngayBaoHanh}" name = "txtNgayBaoHanh" style="background-color: transparent;" /></div></td>
				<td>hinh</td>
			</tr>
			<tr>
				<td><div class = "div_textright">Ngày bắt đầu sử dụng : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.ngayBatDauSuDung}" name = "txtNgayBatDauSuDung" style="background-color: transparent;" /></div></td>
				<td>hinh</td>
			</tr>
			<tr>
				<td><div class = "div_textright">Mã đơn vị tính : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.tenDonViTinh}" name = "txtTanSuatToiDa" style="background-color: transparent;" /></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Tần suất tối đa : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.tanSuatToiDa}" name = "txtTanSuatToiDa" style="background-color: transparent;" /></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Tần suất sử dụng : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.tanSuatSuDung}" name = "txtTanSuatSuDung" style="background-color: transparent;" /></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Phụ kiện : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.phuKien}" name = "txtPhuKien" style="background-color: transparent;" /></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Giá mua : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.giaMua}" name = "txtGiaMua" style="background-color: transparent;" /></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Nguyên tắc sử dụng : </div></td>
				<td colspan="2"><div class = "div_textleft"><textarea rows="10" cols="25" name="teaNguyenTacSuDung">${ChiTietThietBi.nguyenTacSuDung}</textarea></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Đặc tính kỹ thuật : </div></td>
				<td colspan="2"><div class = "div_textleft"><textarea rows="2" cols="10" name="teaDacTinhKyThuat">${ChiTietThietBi.dacTinhKyThuat}</textarea></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Số lần sử dụng : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.soLanSuDung}" name = "txtSoLanSuDung" style="background-color: transparent;" /></div></td>
			</tr>
			<tr>
				<td><div class = "div_textright">Số lần bảo trì : </div></td>
				<td colspan="2"><div class = "div_textleft"><input type = "text" value = "${ChiTietThietBi.soLanBaoTri}" name = "txtSoLanBaoTri" style="background-color: transparent;" /></div></td>
			</tr><tr></tr><tr></tr>
			<tr>
				<td colspan="3"><a href = "javascript: submit()">	
						<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
						<input type = "hidden" name="nhanbiet" value="capnhat" />
					</a>
				</td>
		</table>
		
	</form>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>