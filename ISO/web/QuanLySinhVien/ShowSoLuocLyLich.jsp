<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>


<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<script>
function check()
{
var hoTenKhaiSinh = document.getElementById("HoTenKhaiSinh");
var sex = document.getElementById("Sex");
//var tenThuongGoi = document.getElementById("TenThuongGoi");
var ngaySinh = document.getElementById("NgaySinh");
//var noiSinh = document.getElementById("NoiSinh");
var queQuan = document.getElementById("QueQuan");
var noiDangKyThuongTru = document.getElementById("NoiDangKyThuongTru");
//var danToc = document.getElementById("DanToc");
//var tonGiao = document.getElementById("TonGiao");
var trinhDoHocVan = document.getElementById("TrinhDoHocVan");
//var ngayThamGiaDang = document.getElementById("NgayThamGiaDang");
//var ngayChinhThuc = document.getElementById("NgayChinhThuc");
//var ngayKetNapDoan = document.getElementById("NgayKetNapDoan");
//var hoTenBo = document.getElementById("HoTenBo");
//var ngheNghiepBo = document.getElementById("NgheNghiepBo");
//var hoTenMe = document.getElementById("HoTenMe");
//var ngheNghiepMe = document.getElementById("NgheNghiepMe");
//var hoTenVoChong = document.getElementById("HoTenVoChong");
//var ngheNghiepVoChong = document.getElementById("NgheNghiepVoChong");
//var doiTuongThuocDienChinhSach = document.getElementById("DoiTuongThuocDienChinhSach");
//var ngheNghiepLamTruocKhiVaoHoc = document.getElementById("NgheNghiepLamTruocKhiVaoHoc");
var diaChiLienLac = document.getElementById("DiaChiLienLac");
var dienThoai = document.getElementById("DienThoai");
//var nguyenVong = document.getElementById("NguyenVong");
alert(sex.options[sex.selectedIndex].text);
}
</script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Sơ lược lý lịch</title>

<style type="text/css">
.bg{background-color:transparent;}

</style>

<style type="text/css">
.a{width:150px; height: 40px;}
.b{width:40px; height: 40px;}

</style>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_QuanLySinhVien.jsp" />
	<!-- E HEAD CONTENT -->	
	
<form name="formSoLuocLyLich" action="<%=request.getContextPath()%>/SinhVienController" method="post" onsubmit="return check();" >
	<table bgcolor="transparent" cellspacing="5" cellpadding="3" class="bg" style="width: 750px">
		<tr class="bg">
			<td colspan="4"><font size="4" style="font-weight: bold; font-family: tahoma">SƠ LƯỢC LÝ LỊCH</font></td>
			
		</tr>
		<tr class="bg">
			<td style="width:380px; text-align: left">Họ và tên khai sinh<i style="color: red"> (*)</i></td>
			<td style="width:300px; text-align: left"><input name="HoTenKhaiSinh" id="HoTenKhaiSinh" type="text" /></td>
			<td style="text-align: right">Giới tính<i style="color: red"> (*)</i></td>
			<td>
				<select name="Sex" id="Sex" style="width:100px">				
					<option value="0">Nam</option>
					<option value="1">Nữ</option>
				</select>
			</td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left">Tên thường gọi</td>
			<td style="width:180px; text-align: left"><input name="TenThuongGoi" id="TenThuongGoi" type="text" /></td>
			<td style="width:180px; text-align: right"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left">Ngày sinh<i style="color: red"> (*)</i></td>
			<td style="width:180px; text-align: left"><input name="NgaySinh" id="NgaySinh" type="text" style="width:130px" readonly="readonly" />
				<img id="imgNgaySinh" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
			</td>
			<td style="width:180px; text-align: right"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		
		<script type="text/javascript">
			  <%
			  	for(int i=1; i<= 1 ; i++) {
			  		String output = "";
			  		output += "Zapatec.Calendar.setup({";
			  		output += "firstDay          : 1,";
			  		output += "weekNumbers       : false,";
			  		output += "range             : [2000.01, 2030.12],";
			  		output += "electric          : false,";
			  		output += "inputField        : 'NgaySinh',";
			  		output += "button            : 'imgNgaySinh',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
		</script>
		
		<tr class="bg">
			<td style="width:180px; text-align: left">Nơi sinh</td>
			<td style="width:180px; text-align: left"><input name="NoiSinh" id="NoiSinh" type="text" /></td>
			<td style="width:180px; text-align: right"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left">Quê quán<i style="color: red"> (*)</i></td>
			<td style="width:180px; text-align: left"><input name="QueQuan" id="QueQuan" type="text" /></td>
			<td style="width:180px; text-align: left"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left; vertical-align: top">Nơi đăng ký thường trú</td>
			<td style="width:180px; text-align: left">
				<textarea name="NoiDangKyThuongTru" rows="6" cols="25" style="width:200px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD">
					
				</textarea>
			</td>
			<td style="width:180px; text-align: left"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left">Dân tộc</td>
			<td style="width:180px; text-align: left"><input name="DanToc" id="DanToc" type="text" /></td>
			<td style="width:180px; text-align: right">Tôn giáo</td>
			<td style="width:180px; text-align: left"><input name="TonGiao" id="TonGian" type="text" size="15" /></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left">Trình độ học vấn trước khi vào học</td>
			<td style="width:180px; text-align: left"><input name="TrinhDoHocVan" id="TrinhDoHocVan" type="text" /></td>
			<td style="width:180px; text-align: left"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left">Ngày tham gia vào Đảng CSVN</td>
			<td style="width:180px; text-align: left"><input name="NgayThamGiaDang" id="NgayThamGiaDang" type="text" style="width:130px" readonly="readonly"  />
				<img id="imgNgayThamGiaDang" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
			</td>
			<td style="width:180px; text-align: right">Ngày chính thức</td>
			<td style="width:180px; text-align: left"><input name="NgayChinhThuc" id="NgayChinhThuc" type="text" size="15" style="width:90px" readonly="readonly"   />
				<img id="imgNgayChinhThuc" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
			</td>
		</tr>
		
		<script type="text/javascript">
			  <%
			  	for(int i=1; i<= 1 ; i++) {
			  		String output = "";
			  		output += "Zapatec.Calendar.setup({";
			  		output += "firstDay          : 1,";
			  		output += "weekNumbers       : false,";
			  		output += "range             : [2000.01, 2030.12],";
			  		output += "electric          : false,";
			  		output += "inputField        : 'NgayThamGiaDang',";
			  		output += "button            : 'imgNgayThamGiaDang',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
		</script>
		
		<script type="text/javascript">
			  <%
			  	for(int i=1; i<= 1 ; i++) {
			  		String output = "";
			  		output += "Zapatec.Calendar.setup({";
			  		output += "firstDay          : 1,";
			  		output += "weekNumbers       : false,";
			  		output += "range             : [2000.01, 2030.12],";
			  		output += "electric          : false,";
			  		output += "inputField        : 'NgayChinhThuc',";
			  		output += "button            : 'imgNgayChinhThuc',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
		</script>
		
		<tr class="bg">
			<td style="width:180px; text-align: left">Ngày kết nạp vào Đoàn TNCS Hồ Chí Minh</td>
			<td style="width:180px; text-align: left"><input name="NgayKetNapDoan" id="NgayKetNapDoan" type="text" style="width:130px" readonly="readonly"  />
				<img id="imgNgayKetNapDoan" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
			</td>
			<td style="width:180px; text-align: left"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		
		<script type="text/javascript">
			  <%
			  	for(int i=1; i<= 1 ; i++) {
			  		String output = "";
			  		output += "Zapatec.Calendar.setup({";
			  		output += "firstDay          : 1,";
			  		output += "weekNumbers       : false,";
			  		output += "range             : [2000.01, 2030.12],";
			  		output += "electric          : false,";
			  		output += "inputField        : 'NgayKetNapDoan',";
			  		output += "button            : 'imgNgayKetNapDoan',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
		</script>
		
		<tr class="bg">
			<td style="width:180px; text-align: left">Họ và tên bố</td>
			<td style="width:180px; text-align: left"><input name="HoTenBo" id="HoTenBo" type="text" /></td>
			<td style="width:180px; text-align: right">Nghề nghiệp</td>
			<td style="width:180px; text-align: left"><input name="NgheNghiepBo" id="NgheNghiepBo" type="text" size="15"  /></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left">Họ và tên mẹ</td>
			<td style="width:180px; text-align: left"><input name="HoTenMe" id="HoTenMe" type="text" /></td>
			<td style="width:180px; text-align: right">Nghề nghiệp</td>
			<td style="width:180px; text-align: left"><input name="NgheNghiepMe" id="NgheNghiepMe" type="text" size="15"  /></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left">Họ và tên vợ (chồng)</td>
			<td style="width:180px; text-align: left"><input name="HoTenVoChong" id="HoTenVoChong" type="text" /></td>
			<td style="width:180px; text-align: right">Nghề nghiệp</td>
			<td style="width:180px; text-align: left"><input name="NgheNghiepVoChong" id="NgheNghiepVoChong" type="text"  size="15" /></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left; vertical-align: top">Đối tượng thuộc diện chính sách</td>
			<td style="width:180px; text-align: left">
				<textarea name="DoiTuongThuocDienChinhSach" rows="6" cols="25" style="width:200px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD">
					
				</textarea>
			</td>
			<td style="width:180px; text-align: left"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left; vertical-align: top">Nghề nghiệp làm trước khi vào học</td>
			<td style="width:180px; text-align: left">
				<textarea name="NgheNghiepLamTruocKhiVaoHoc" rows="6" cols="25" style="width:200px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD">
					
				</textarea>
			</td>
			<td style="width:180px; text-align: left"></td>
			<td style="width:180px; text-align: left"></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left; vertical-align: top">Địa chỉ liên lạc</td>
			<td style="width:180px; text-align: left">
				<textarea name="DiaChiLienLac" rows="6" cols="25" style="width:200px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD">
					
				</textarea>
			</td>
			<td style="width:180px; text-align: right; vertical-align:top">Điện thoại</td>
			<td style="width:180px; text-align: left; vertical-align:top"><input name="DienThoai" id="DienThoai" type="text" size="15"  /></td>
		</tr>
		<tr class="bg">
			<td style="width:180px; text-align: left; vertical-align: top">Nguyện vọng làm việc sau khi kết thúc khóa học</td>
			<td colspan="3" style="width:400px; text-align: left">
				<textarea name="NguyenVong" rows="8" cols="50" style="width:400px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD">
					
				</textarea>
			</td>
			
		</tr>
		
		<tr class="bg">
			<td colspan="4"><input type="submit" name="submit" value="Lưu hồ sơ" /></td>
			
		</tr>
	</table>
	
	
	<!-- NĂM THỨ 1 - NIÊN KHÓA 2010 - 2012 -->
<center><div class="bg" style="font-size: 17px; margin-top: 50px; font-weight: bold">II. KẾT QUẢ HỌC TẬP TỪNG NĂM</div></center>
<table border="1" cellspacing="1" cellpadding="1" class="bg" style="width: 800px;">
	<tr class="bg">		
		<th colspan="8">NĂM THỨ NHẤT - NIÊN KHÓA 2010-2012</th><th colspan="8">NĂM THỨ NHẤT - NIÊN KHÓA 2010-2012</th></th>
	</tr>
	<tr class="bg">
		<td rowspan="3">Môn học/Mô-đun</td>
		<td colspan="7">Kết quả học tập Môn học/Mô-đun</td>
		<td rowspan="3">Môn học/Mô-đun</td>
		<td colspan="7">Kết quả học tập Môn học/Mô-đun</td>
		
	</tr>
	<tr class="bg">
		<td rowspan="2" colspan="4" style="width: 300px">Kiểm tra định kỳ</td>
		<td colspan="2">Kiểm tra hết MH/MĐ</td>	
		<td rowspan="2">Tổng kết</td>	
		<td rowspan="2" colspan="4" style="width: 300px">Kiểm tra định kỳ</td>
		<td colspan="2">Kiểm tra hết MH/MĐ</td>	
		<td rowspan="2">Tổng kết</td>	
	</tr>
	<tr class="bg">
		<td>Lần 1</td>
		<td>Lần 2</td>
		<td>Lần 1</td>
		<td>Lần 2</td>
	</tr>
	<tr class="bg">
		<td class="a">Anh văn 1</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Anh văn 2</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Tin học đại cương</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Giáo dục quốc phòng</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Vẽ kĩ thuật 1</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Vẽ kĩ thuật 2</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Dung sai - kỹ thuật đo</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">CAD</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Nguội cơ bản</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Cơ kỹ thuật</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Kỹ thuật Tiện 1</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Vật liệu học</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Chi tiết máy</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Điện kỹ thuật</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Kỹ thuật Hàn</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Kỹ thuật Phay 1</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td colspan="8" class="a" style="text-align: left">Xếp loại học tập: </td>		
		<td colspan="8" style="text-align: left" >Xếp loại học tập: </td>		
	</tr>
	<tr class="bg">
		<td colspan="8" class="a" style="text-align: left">Xếp loại rèn luyện: </td>		
		<td colspan="8" style="text-align: left">Xếp loại rèn luyện: </td>
	</tr>
	<tr class="bg">
		<td colspan="8" rowspan="2" class="a" style="text-align: left">Khen thưởng kỹ luật: </td>		
		<td colspan="8" rowspan="2" class="a" style="text-align: left">Khen thưởng kỹ luật: </td>
	</tr>
		
	
</table>

<!-- NĂM THỨ 2 - NIÊN KHÓA 2010 - 2012 -->

<table style="margin-top: 50px; width: 800px" border="1" cellspacing="1" cellpadding="1" class="bg">
	<tr class="bg">		
		<th colspan="8">NĂM THỨ HAI - NIÊN KHÓA 2010-2012</th><th colspan="8">NĂM THỨ HAI - NIÊN KHÓA 2010-2012</th></th>
	</tr>
	<tr class="bg">
		<td rowspan="3">Môn học/Mô-đun</td>
		<td colspan="7">Kết quả học tập Môn học/Mô-đun</td>
		<td rowspan="3">Môn học/Mô-đun</td>
		<td colspan="7">Kết quả học tập Môn học/Mô-đun</td>
		
	</tr>
	<tr class="bg">
		<td rowspan="2" colspan="4" style="width: 300px">Kiểm tra định kỳ</td>
		<td colspan="2">Kiểm tra hết MH/MĐ</td>	
		<td rowspan="2">Tổng kết</td>	
		<td rowspan="2" colspan="4" style="width: 300px">Kiểm tra định kỳ</td>
		<td colspan="2">Kiểm tra hết MH/MĐ</td>	
		<td rowspan="2">Tổng kết</td>	
	</tr>
	<tr class="bg">
		<td>Lần 1</td>
		<td>Lần 2</td>
		<td>Lần 1</td>
		<td>Lần 2</td>
	</tr>
	<tr class="bg">
		<td class="a">Anh văn kỹ thuật</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Chính trị</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Pháp luật</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Đồ gá</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Giáo dục thể chất</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Kỹ thuật Phay 2</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Công nghệ chế tạo máy</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">CAD/CAM-CNC</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Nguyên lý máy</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a">Thực tập xí nghiệp</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Máy cắt</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Máy cắt - Thủy lực</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Kỹ thuật bảo trì thiết bị</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a">Kỹ thuật Tiện 2</td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td class="a"></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
		<td ></td>
	</tr>
	<tr class="bg">
		<td colspan="8" class="a" style="text-align: left">Xếp loại học tập: </td>		
		<td colspan="8"  style="text-align: left">Xếp loại học tập: </td>		
	</tr>
	<tr class="bg">
		<td colspan="8" class="a" style="text-align: left">Xếp loại rèn luyện: </td>		
		<td colspan="8" style="text-align: left">Xếp loại rèn luyện: </td>
	</tr>
	<tr class="bg">
		<td colspan="8" rowspan="2" class="a" style="text-align: left">Khen thưởng kỹ luật: </td>		
		<td colspan="8" rowspan="2" class="a" style="text-align: left">Khen thưởng kỹ luật: </td>
	</tr>
		
	
</table>

<!-- KẾT QUẢ TỐT NGHIÊP -->
<center><div class="bg" style="font-size: 17px; margin-top: 50px; font-weight: bold">III. KẾT QUẢ TỐT NGHIỆP</div></center>
<table border="1" cellspacing="1" cellpadding="1" class="bg" style="width: 800px">
	<tr class="bg">
		<td rowspan="3" width="50px">Số TT</td>
		<th colspan="3">THI TỐT NGHIỆP</th>
		<td rowspan="4" width="100px" height="100px" style="vertical-align: top">Nhận xét tóm tắt quá trình học tập, rèn luyện:<br /> 
			<textarea class="bg"  rows="6" cols="25" style="width:200px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD">
			
			
			</textarea>
		</td>
	</tr>
	<tr class="bg">
		<td rowspan="2">Nội dung thi</td>
		<td colspan="2" width="60px" height="60px">Kết quả thi</td>
		
	</tr>
	<tr class="bg">
		<td width="60px" height="60px">Lần 1</td>
		<td width="60px" height="60px">Lần 2</td>
	</tr>
	<tr class="bg">
		<td style="height: 35px;"></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr class="bg">
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td rowspan="3" width="100px" height="100px" style="vertical-align: top">
		Quyết định công nhận tốt nghiệp: <br />
			<textarea class="bg"  rows="6" cols="25" style="width:200px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD">
			
			
			</textarea>
		Cấp ngày  .......   tháng   .......   năm  ........
		</td>
	</tr>
	<tr class="bg">
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr class="bg">
	<tr class="bg">
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr class="bg">
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td rowspan="3" width="100px" height="100px" style="vertical-align: top">
		Bằng tốt nghiệp số:   .................<br />
		Xếp loại tốt nghiệp:  .................<br />
		Ngày cấp:   ........../............/.............
		</td>
	</tr>
	<tr class="bg">
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr class="bg">
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr class="bg">
		<td style="height: 35px;"></td>
		<td></td>
		<td></td>
		<td></td>
		<td rowspan="4" width="100px" height="100px" style="vertical-align: top">
		<center>Người tổng hợp<br />(Ký, ghi rõ họ tên)</center>
		</td>
	</tr>
	<tr class="bg">
		<td colspan="4" style="text-align: left">Điểm trung bình chung:  .................................
		
		</td>
		
	</tr>
	<tr class="bg">
		<td colspan="4" style="text-align: left">Điểm xếp loại tốt nghiệp:  .................................
		
		</td>
		
	</tr>
	<tr class="bg">
		<td colspan="4" style="text-align: left">Điểm xếp loại rèn luyện:  .................................
		
		</td>
		
	</tr>
</table>
</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>