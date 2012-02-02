<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.HoSoDuTuyenModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChungChiBangCapKhacDAO"%><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp"/>
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
	
	<!--[if lt IE 7]>
	 <style type="text/css">
	 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
	 </style>
	<![endif]-->
	<title>Hồ Sơ Dự Tuyển</title>
	<script language="JavaScript" type="text/javascript">
	</script>
	
	<c:set var="listViTriDuTuyen" value='<%=ChiTietKHTNSDAO.getAllCTKHTNS() %>'></c:set>
	<c:if test="${not empty param.maThanhVien}">
		<c:set var="ThongTinChiTiet" value='<%=HoSoDuTuyenDAO.getThongTinNhanSuByMaThanhVien(request.getParameter("maThanhVien").toString()) %>'></c:set>
	</c:if>
	<c:set var="listChungChiBangCapKhac" value='<%=ChungChiBangCapKhacDAO.getDanhSachChungChiBangCapKhac() %>'></c:set>
	<c:set var = "maVaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "TRUONG_PHONG" value = '<%= Constant.TRUONG_PHONG %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var="row" value="1"></c:set>
	<c:set var="row2" value="1"></c:set>
	<c:set var="listNamTotNghiep" value='<%=NamHocDAO.getAllNamHocByNow() %>'></c:set>
	<script language="javascript">
		function submitForm(ac){	
			var re = /^([\w.-])+\@(([\w.]){3,6})+[A-Za-z]{2,4}$/;
			var rong = /\s/g;	

			var Ho = document.getElementById("Ho").value;
			var val_2 = Ho.replace(rong,"");

			var Ten = document.getElementById("Ten").value;
			var val_6 = Ten.replace(rong,"");

			var NgaySinh = document.getElementById("NgaySinh").value;

			var Email = document.getElementById("Email").value;
			var val_10 = Email.replace(rong,"");
			
			var CMND = document.getElementById("CMND").value;
			var val_12 = CMND.replace(rong,"");

			var NgayCap = document.getElementById("txtNgayCap").value;
			
			var NoiCap = document.getElementById("txtNoiCap").value;
			var val_14 = NoiCap.replace(rong,"");
			
			if(val_2 == ""){
				alert("Bạn phải nhập đầy đủ họ tên !!!" );
				
			} else if(!isNaN(val_2)){
				alert("Họ tên không thể là số !!!" );
			
			} else if(val_6 == ""){
				alert("Bạn phải nhập đầy đủ họ tên !!!" );
				
			} else if(!isNaN(val_6)){
				alert("Họ tên không thể là số !!!" );
				
			} else if(NgaySinh == ""){
				alert("Bạn phải chọn ngày sinh !!!" );

			} else if(NgayCap == ""){
				alert("Bạn phải nhập ngày Cấp CMND !!!" );

			} else if(Email == ""){
				alert("Bạn phải nhập Email !!!" );

			} else if(re.test(Email) == false){
				alert("Email không hợp lệ !!! Ví dụ : thanhtc.hv@gmail.com");

			} else if(val_12 == ""){
				alert("Bạn phải nhập số Chứng Minh Nhân Dân !!!" );
				
			} else if(isNaN(CMND)){
				alert("Chứng minh nhân dân phải nhập số !!!" );

			} else if(val_14 == ""){
				alert("Bạn phải nhập nơi cấp CMND !!!" );
				
			} else{
				if(ac=="C"){
					if(confirm("Bạn có chắc chắn muốn Nhập Thông Tin Thành Viên ?")){
						document.getElementById("action").value = "newThongTin";
						document.forms['ThongTinChiTiet'].submit();
					}
				}else if(ac=="U"){
					if(confirm("Bạn có chắc chắn muốn Cập Nhật Thông Tin Thành Viên ?")){
						document.getElementById("action").value = "updateThongTin";
						document.forms['ThongTinChiTiet'].submit();
					}
				}
			}
			
		}
		
		function ThemBangCap(){
			var i = parseInt(document.getElementById("row").value);
			var table = document.getElementById("BangCap");
			table.insertRow(i).style.backgroundColor = "transparent";
			table.rows[i].insertCell(0).innerHTML = "<input type='radio' style='background-color: transparent;' value='"+i+"' name='BangCapChinh' id='BangCapChinh' />";
			table.rows[i].insertCell(1).innerHTML = "<select style='background-color: transparent;' name='LoaiBang"+i+"' id='LoaiBang"+i+"'><option value='Trung Cấp'>Trung Cấp</option><option value='Cao Đẳng'>Cao Đẳng</option><option value='Đại Học - Chính Qui'>Đại Học - Chính Qui</option><option value='Đại Học - Tại Chức'>Đại Học - Tại Chức</option><option value='Cử Nhân'>Cử Nhân</option><option value='Tiến Sĩ'>Tiến Sĩ</option><option value='Thạc Sĩ'>Thạc Sĩ</option><option value='Giáo Sư'>Giáo Sư</option></select>";
			table.rows[i].insertCell(2).innerHTML = "<input type='text' style='width: 150px;background-color: transparent' name='TruongCap"+i+"' id='TruongCap"+i+"'/>";
			table.rows[i].insertCell(3).innerHTML = "<input type='text' style='width: 80px;background-color: transparent' name='ChuyenNganh"+i+"' id='ChuyenNganh"+i+"'/>";
			table.rows[i].insertCell(4).innerHTML = "<input type='text' onchange='checkNamTotNghiep(this)' style='text-align:center;width: 50px;background-color: transparent;' name='Nam"+i+"' id='Nam"+i+"' />";
			table.rows[i].insertCell(5).innerHTML = "<select style='background-color: transparent;' name='LoaiTotNghiep"+i+"' id='LoaiTotNghiep"+i+"'><option value='Xuất Sắc'>Xuất Sắc</option><option value='Giỏi'>Giỏi</option><option value='Khá'>Khá</option><option value='Trung Bình-Khá'>Trung Bình-Khá</option><option value='Trung Bình'>Trung Bình</option></select>";
			document.getElementById('row').value = i+1;
		}
		
		function xoaBangCap(id){
			document.getElementById("action").value = "xoaBangCap";
			document.getElementById("MaBangCap").value = id;
			document.forms['ThongTinChiTiet'].submit();
		}
		
		function ThemBangCapKhac(){
			var i = parseInt(document.getElementById("row2").value);
			var table = document.getElementById("BangCapKhac");
			table.insertRow(i).style.backgroundColor = "transparent";
			table.rows[i].insertCell(0).innerHTML = i;
			table.rows[i].insertCell(1).innerHTML = "";
			table.rows[i].insertCell(2).innerHTML = "<select name='maCCBCK"+i+"' id='maCCBCK"+i+"'><c:forEach var='ccbck' items='${listChungChiBangCapKhac}'><option value='${ccbck.id}'>${ccbck.ten}</option></c:forEach></select>";
			table.rows[i].insertCell(3).innerHTML = "<input type='text' onchange='checkNamTotNghiep(this)' style='text-align:center;width: 50px;background-color: transparent;' name='NamTotNghiep"+i+"' id='NamTotNghiep"+i+"' />";
			table.rows[i].insertCell(4).innerHTML = "<select style='background-color: transparent;' name='XepLoai"+i+"' id='XepLoai"+i+"'><option value='Xuất Sắc'>Xuất Sắc</option><option value='Giỏi'>Giỏi</option><option value='Khá'>Khá</option><option value='Trung Bình-Khá'>Trung Bình-Khá</option><option value='Trung Bình'>Trung Bình</option></select>";
			document.getElementById('row2').value = i+1;
		}
		
		function xoaBangCapKhac(id){
			document.getElementById("action").value = "xoaBangCapKhac";
			document.getElementById("MaBangCap").value = id;
			document.forms['ThongTinChiTiet'].submit();
		}
		
		function checkNamTotNghiep(id){
			var nam = parseInt(id.value);
			var date = new Date();
			var namMax = date.getFullYear();
			if(nam < 1960 || nam > namMax){
				alert("Năm tốt nghiệp phải từ 1960 - "+namMax);
				id.value = "";
			}
		}
</script>
	
</head>
<body>
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->

	<table style="background-color: transparent;">
		<tr  style="background-color: transparent;">
			<c:choose>
			<c:when test="${param.Them eq 'yes'}">
				<td><h2 style="margin: 20px;">NHẬP THÔNG TIN NHÂN SỰ</h2></td>
			</c:when>
			<c:when test="${not empty param.maThanhVien}">
				<td><h2 style="margin: 20px;">CHI TIẾT THÔNG TIN ${fn:toUpperCase(ThongTinChiTiet.user1) }</h2></td>
			</c:when>
		</c:choose>
			<c:if test="${not empty requestScope.error and requestScope.error ne 'null'}">
				<font color="red">${requestScope.error }</font>
			</c:if>
		</tr>
	</table>
	<form name="ThongTinChiTiet" action="<%=request.getContextPath() %>/hoSoDuTuyenController" method="post" >
	<table class="ThongTinChiTiet" style="margin-bottom: 20px;">
			<tr style="background-color: transparent;">
				<td style="width: 120px;background-color: transparent;text-align: right;padding: 5px;">Họ </td>
				<td style="width: 230px;text-align: left;"><input style="background-color: transparent;" type="text" id="Ho" name="Ho" value="${ThongTinChiTiet.ho }" /><c:if test="${empty param.maThanhVien}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="width: 120px;background-color: transparent;text-align: right;padding: 5px;">Số nhà </td>
				<td style="width: 230px;text-align: left;"><input style="background-color: transparent;"  type="text" id="SoNha" name="SoNha" value="${ThongTinChiTiet.so_nha }" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tên lót </td>
				<td style="text-align: left;"><input style="background-color: transparent;"  type="text" id="TenLot" name="TenLot" value="${ThongTinChiTiet.ten_lot }" /></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tên đường </td>
				<td style="text-align: left;"><input style="background-color: transparent;"  type="text" id="TenDuong" name="TenDuong" value="${ThongTinChiTiet.duong }"/></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tên </td>
				<td style="text-align: left;"><input style="background-color: transparent;"  type="text" id="Ten" name="Ten" value="${ThongTinChiTiet.ten }"/><c:if test="${empty param.maThanhVien}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Phường/ xã </td>
				<td style="text-align: left;"><input style="background-color: transparent;"  type="text" id="PhuongXa" name="PhuongXa" value="${ThongTinChiTiet.phuong_xa }" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Ngày sinh </td>
				<td style="text-align: left;"><input style="background-color: transparent;"  type="text" readonly="readonly" id="NgaySinh" name="NgaySinh" value="${ThongTinChiTiet.ngay_sinh }" /><c:if test="${empty param.maThanhVien}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Quận/ huyện </td>
				<td style="text-align: left;"><input style="background-color: transparent;"  type="text" id="QuanHuyen" name="QuanHuyen" value="${ThongTinChiTiet.quan_huyen }" /></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">CMND </td> 
				<td style="text-align: left;"><input style="background-color: transparent;"  type="text" id="CMND" name="CMND" value="${ThongTinChiTiet.cmnd }" /><c:if test="${empty param.maThanhVien}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tỉnh/ thành phố </td>
				<td style="text-align: left;"><input style="background-color: transparent;"  type="text" id="TinhTP" name="TinhTP" value="${ThongTinChiTiet.tinh_thanhpho }" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Ngày Cấp </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="txtNgayCap" name="txtNgayCap" value="${ThongTinChiTiet.ngay_cap }"/><c:if test="${empty param.maThanhVien}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Điện thoại nhà </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="DTNha" name="DTNha" value="${ThongTinChiTiet.dien_thoai_nha }" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Nơi Cấp </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="txtNoiCap" name="txtNoiCap" value="${ThongTinChiTiet.noi_cap }"/><c:if test="${empty param.maThanhVien}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
							
				<td style="background-color: transparent;text-align: right;padding: 5px;">Điện thoại di động </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="DTDD" name="DTDD" value="${ThongTinChiTiet.dien_thoai_dd }"/></td>
				
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Giới tính </td>
				<td style="text-align: left;">
					<select name="GioiTinh" ${lockbtn } >
						<option value="0">Nữ</option>
						<option value="1" <c:if test="${ThongTinChiTiet.gioi_tinh eq 'Nam' }">selected</c:if>>Nam</option>
						
					</select>
				</td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Email </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="Email" name="Email" value="${ThongTinChiTiet.email }"/><c:if test="${empty param.maThanhVien}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
			</tr>
			<tr style="background-color: transparent;">				
				<td style="background-color: transparent;text-align: right;padding: 5px;">Vai Trò</td>
				<td style="background-color: transparent;text-align: left;">
					<c:set var="listVT" value='<%=VaiTroDAO.showAllVaiTro() %>'></c:set>
					<select id="VaiTro" name="VaiTro">
						<c:forEach var="VT" items="${listVT}">
							<option 
							<c:if test="${ThongTinChiTiet.ma_vai_tro eq VT.maVaiTro }">selected</c:if>
							<c:if test="${maVaiTro eq TRUONG_PHONG }">disabled</c:if>
							value="${VT.maVaiTro }">${VT.tenVaiTro }</option>
						</c:forEach>
					</select>
				</td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Bộ Phận</td>
				<td style="background-color: transparent;text-align: left;">
					<c:set var="listBP" value='<%=KhoaDAO.showAllKhoa() %>'></c:set>
					<select id="BoPhan" name="BoPhan">
						<c:forEach var="BP" items="${listBP}">
							<option 
							<c:if test="${ThongTinChiTiet.ma_bo_phan eq BP.maKhoa }">selected</c:if>
							<c:if test="${maVaiTro eq TRUONG_PHONG }">disabled</c:if>
							 value="${BP.maKhoa }">${BP.tenKhoa }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Ngày Thử Việc  </td>
				<td style="text-align: left"><input style="background-color: transparent;"  type="text" name="NgayThuViec" id="NgayThuViec" value="${ThongTinChiTiet.ngayThuViec }" /></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Ngày Vào Làm  </td>
				<td style="text-align: left"><input style="background-color: transparent;"  type="text" id="NgayVaoLam" name="NgayVaoLam" value="${ThongTinChiTiet.ngayVaoLam }" /></td>
			</tr>
			<tr style="background-color: transparent;" >
				<td valign="top" style="font-weight: bold;">Bằng Cấp</td>
				<td colspan="3">
					<table border="1" style="width: 610px" id="BangCap">
						<tr style="background-color: transparent;">
							<td style="width: 50px;">
								<a href = "javascript: ThemBangCap()">
									<img src="<%=request.getContextPath()%>/images/icon_action/add.png" alt="Thêm" border = "0"/>
								</a>
							</td>
							<td style="width: 150px;text-align: center;font-weight: bold;">Loại Bằng</td>
							<td style="width: 150px;text-align: center;font-weight: bold;">Trường Cấp</td>
							<td style="width: 100px;text-align: center;font-weight: bold;">Chuyên Ngành</td>
							<td style="width: 50px;text-align: center;font-weight: bold;">Năm tốt nghiệp</td>
							<td style="width: 110px;text-align: center;font-weight: bold;">Loại tốt nghiệp</td>
						</tr>
						<c:set var="listNamTotNghiep" value='<%=NamHocDAO.getAllNamHocByNow() %>'></c:set>
						<c:forEach var="BangCap" items="${ThongTinChiTiet.listBangCap}">
							<tr style="background-color: transparent;">
								<td style="width: 50px;">
									<input type="radio" style="background-color: transparent;" <c:if test="${BangCap.bangCapChinh eq 1 }">checked</c:if> value="${row }" name="BangCapChinh" id="BangCapChinh" />
									<input type="hidden" name="maBangCap${row }" value="${BangCap.id }" />
								</td>
								<td style="width: 150px;text-align: center;font-weight: bold;">${BangCap.loaiBang }</td>
								<td style="width: 150px;text-align: center;font-weight: bold;">
									<a href="javascript: xoaBangCap(${BangCap.id })" style="text-decoration: none;color: red;">
										<c:if test="${BangCap.truongCap eq ''}">
											tmp
										</c:if>
										${BangCap.truongCap }
									</a>
								</td>
								<td style="width: 100px;text-align: center;font-weight: bold;">${BangCap.chuyenNganh }</td>
								<td style="width: 50px;text-align: center;font-weight: bold;">${BangCap.namTotNghiep }</td>
								<td style="width: 110px;text-align: center;font-weight: bold;">${BangCap.loaiTotNghiep }</td>
								
							</tr>
							<c:set var="row" value="${row+1}"></c:set>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr style="background-color: transparent;" >
				<td valign="top" style="font-weight: bold;">Chứng Chỉ/Bằng Cấp Khác</td>
				<td colspan="3">
					<table border="1" style="width: 610px" id="BangCapKhac">
						<tr style="background-color: transparent;">
							<td style="width: 50px;">
								<a href = "javascript: ThemBangCapKhac()">
									<img src="<%=request.getContextPath()%>/images/icon_action/add.png" alt="Thêm" border = "0"/>
								</a>
							</td>
							<td style="width: 110px;text-align: center;font-weight: bold;">Loại</td>
							<td style="width: 250px;text-align: center;font-weight: bold;">Tên</td>
							<td style="width: 100px;text-align: center;font-weight: bold;">Năm tốt nghiệp</td>
							<td style="width: 100px;text-align: center;font-weight: bold;">Loại tốt nghiệp</td>
						</tr>
						<c:forEach var="BangCapKhac" items="${ThongTinChiTiet.listBangCapKhac}">
							<tr style="background-color: transparent;">
								<td style="width: 50px;">${row2 }</td>
								<td style="width: 110px;font-weight: bold;">
									<c:choose>
										<c:when test="${BangCapKhac.loai eq 1}">
											Anh Văn
										</c:when>
										<c:when test="${BangCapKhac.loai eq 2}">
											Tin Học
										</c:when>
										<c:when test="${BangCapKhac.loai eq 3}">
											Khác
										</c:when>
									</c:choose>
									<input type="hidden" name="maBangCap${row }" value="${BangCapKhac.id }" />
								</td>
								<td style="width: 250px;text-align: left;padding-left: 5px;,font-weight: bold;">
									<a href="javascript: xoaBangCapKhac(${BangCapKhac.id })" style="text-decoration: none;color: red;">
										${BangCapKhac.ten }
									</a>
									
								</td>
								<td style="width: 100px;text-align: center;font-weight: bold;">${BangCapKhac.ngayTotNghiep }</td>
								<td style="width: 100px;text-align: center;font-weight: bold;">${BangCapKhac.xepLoai }</td>
							</tr>
							<c:set var="row2" value="${row2+1}"></c:set>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
		
		<c:choose>
			<c:when test="${param.Them eq 'yes'}">
				<a href = "javascript: submitForm('C');">
					<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Thêm" border = "0" style="margin: 20px;"/>
				</a>
			</c:when>
			<c:when test="${not empty param.maThanhVien}">
				<a href = "javascript: submitForm('U')">
					<img src="<%=request.getContextPath()%>/images/buttom/capnhat2.png" alt="Thêm" border = "0" style="margin: 20px;"/>
				</a>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		
		<input type="hidden" id="row" name="row" value="${row}" />
		<input type="hidden" id="row2" name="row2" value="${row2}" />
		<input type="hidden" id="maThanhVien" name="maThanhVien" value="${ThongTinChiTiet.id}" />
		<input type="hidden" id="action" name="action" />
		<input type="hidden" id="MaBangCap" name="MaBangCap" />
	</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
<script type="text/javascript">
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [1940.01, 1991.12],
	electric          : false,
	inputField        : "NgaySinh",
	button            : "NgaySinh",
	ifFormat          : "%d-%m-%Y"
  });
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [1940.01, 2020.12],
	electric          : false,
	inputField        : "NgayThuViec",
	button            : "NgayThuViec",
	ifFormat          : "%d-%m-%Y"
  });
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [1940.01, 2020.12],
	electric          : false,
	inputField        : "NgayVaoLam",
	button            : "NgayVaoLam",
	ifFormat          : "%d-%m-%Y"
  });
   Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [1940.01, 2020.12],
	electric          : false,
	inputField        : "txtNgayCap",
	button            : "txtNgayCap",
	ifFormat          : "%d-%m-%Y"
  });
//]]>
 </script>
</body>
</html>