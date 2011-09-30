<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.util.IntegerArray"%><fmt:bundle basename="i18n">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<style>
.widthLabel{width: 160px; text-align: left; vertical-align: top; word-spacing: 3px;}
.widthContent{width: 200px; text-align: left; padding-left: 15px; vertical-align: top; word-spacing: 3px;}
</style>
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

<script type="text/javascript" language="JavaScript">
	function submit(){
		with (document.formSinhVien){				
			var re=/^[\w.-]+@[\w.-]+\.[A-Za-z]{2,4}$/;
			var rong = /\s/g;
			
			var tenDangNhap = txtTenDangNhap.value;
			var value = tenDangNhap.replace(rong,"");
			
			var matKhau = txtMatKhau.value;
			var value_1 = matKhau.replace(rong,"");
			
			var ho = txtHo.value;
			var value_2 = ho.replace(rong,"");
			
			var tenLot = txtTenLot.value;
			var value_5 = tenLot.replace(rong,"");
			
			var ten = txtTen.value;
			var value_3 = ten.replace(rong,"");
			
			var CMND = txtCMND.value;
			var value_4 = CMND.replace(rong,"");
			
			var ngaysinh = txtNgaySinh.value;
			var value_6 = ngaysinh.replace(rong,"");
			
			if(value == ""){
			 	alert("Bạn phải nhập tên đăng nhập !!!" );

			}else if(value_1 == ""){
				alert("Bạn phải nhập mật khẩu !!!" );

			}else if(value_2 == ""){
				alert("Bạn phải nhập họ tên đầy đủ !!!" );

			}else if(value_5 == ""){
				alert("Bạn phải nhập họ tên đầy đủ !!!");			
			
			}else if(value_3 == ""){
				alert("Bạn phải nhập họ tên đầy đủ !!!" );

			}else if(txtNgaySinh.value == ""){
				alert("Bạn phải nhập ngày sinh !!!" );

			}else if(txtEmail.value == ""){
				alert("Bạn phải nhập Email !!!" );

			}else if(re.test(txtEmail.value) == false){
				alert("Email không hợp lệ !!! Ví dụ : qchuong@gmail.com");

			}else if(value_4 == ""){
				alert("Bạn phải nhập số chứng minh nhân dân !!!" );

			}else if(isNaN(txtCMND.value)){
				alert("Chứng minh nhân dân phải nhập số !!!" );

			}
			else if(isNaN(txtDienThoaiNha.value)){
				alert("Điện thoại nhà phải nhập số !!!" );

			}
			else if(isNaN(txtDienThoaiDD.value)){
				alert("Điện thoại di động phải nhập số !!!" );

			}
			else{
				if(confirm("Bạn có chắc chắn muốn thêm thành viên này ko ?"))
					document.forms["formSinhVien"].submit();
			}
				
		}
	}
</script>

<title>Thành Viên</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_QuanLySinhVien.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var="listVaiTro" value="<%= VaiTroDAO.timAllVaiTro()%>"></c:set>

	<form action="<%=request.getContextPath()%>/SinhVienController" name  = "formSinhVien" id = "formSinhVien">
		<input type = "hidden" name = "hidden" value="ThemMoiSinhVienSoLuocLyLich" />
		<div>
		<table cellspacing="4px" cellpadding="4px" style="background-color: transparent; width: 805px">
			<tr style="background-color: transparent;"><td colspan="4">
				<div style="font-size: 16px; color: blue; font-weight: bolder; font-style: italic">Bạn Đang Tạo Mới Sơ Lược Lý Lịch</div>
				<%if(request.getAttribute("err") == "err") {%>
					<br /><br /><b class="error">Tên đăng nhập tôn tại trong hệ thồng xin vui lòng dùng tên khác !!!</b><br /><br />
				<%}else if(request.getAttribute("err") == "good"){ %>				
					<br /><br /><b class="error" style="background-color: yellow">Bạn Vừa Thêm Mới Sơ Lược Lý Lịch Thành Công.</b><br /><br />
				<%} %>

			</td></tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_taikhoang.png" border = "0" /><b style="color: red">Tài Khoản</b></div></td>
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_nganhang.png" border = "0" /><b style="color: red">Ngân hàng</b></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Tên đăng nhập : </div></td>
				<td class = "widthContent"><div><input type = "text" name = "txtTenDangNhap" size="18" style="background-color: transparent;" /><b class="error">*</b></div></td>
				<td class = "widthLabel"><div>Số tài khoản : </div></td>
				<td class = "widthContent"><div><input type = "text"  name = "txtSoTaiKhoan" size="18" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Mật khẩu : </div></td>
				<td class = "widthContent"><div><input type = "password" name="txtMatKhau" size="19" style="background-color: transparent;" /><b class="error">*</b></div></td>
				<td class = "widthLabel"><div>Ngân hàng : </div></td>
				<td class = "widthContent"><div><input type = "text" name = "txtNganhang" size="18" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Vai trò : </div></td>
				<td class = "widthContent"><div>
					Sinh viên
				</div></td>
				<td class = "widthLabel"><div>Ngày lập thẻ : </div></td>
				<td class = "widthContent">
					<div>
						<input type = "text" readonly="readonly" id = "txtNgayLapThe" size="14" name = "txtNgayLapThe" style="background-color: transparent;" />
						<img id="imgFromDate_1" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
					</div>
				</td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Bộ Phận : </div></td>
				<td class = "widthContent"><div>
					<% ArrayList<Integer> arr = new ArrayList<Integer>();
												arr.add(6);
												arr.add(7);
												arr.add(8);
												arr.add(9);
												arr.add(10);
												arr.add(11);
												arr.add(12);
												arr.add(13);
												arr.add(14);
												arr.add(15);	%>
											
					<c:set var="listKhoa" value='<%= KhoaDAO.getListKhoaTrungTam(arr) %>'></c:set>
					<select name = "cboKhoa" id = "cboKhoa" style="width: 180px">				
						<c:forEach var="maKhoa" items="${listKhoa}">
							<option value="${maKhoa.maKhoa}">${maKhoa.tenKhoa}</option> 
						</c:forEach>
					</select>
				</div></td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_chitiet.png" border = "0" /><b style="color: red"> Chi Tiết</b></div></td>
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_diachi.png" border = "0" /> <b style="color: red">Địa chỉ</b></div></td>
			</tr>
			<tr style="background-color: transparent;">
				
				<td class = "widthLabel"><div>Họ : </div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtHo" size="18" style="background-color: transparent;" /><b class="error">*</b>
				</div></td>
				<td class = "widthLabel"><div>Số nhà :</div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtSoNha" size="18" style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Tên lót : </div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtTenLot" size="18" style="background-color: transparent;" /><b class="error">*</b>	
				</div></td>
				<td class = "widthLabel"><div>Đường :</div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtDuong" size="18" style="background-color: transparent;"  />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Tên : </div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtTen" size="18" style="background-color: transparent;" /><b class="error">*</b>
				</div></td>
				<td class = "widthLabel"><div>Phường/xã :</div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtPhuong" size="18"  style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Ngày sinh : </div></td>
				<td class = "widthContent"><div>
					<input type = "text" readonly="readonly" size="14" id = "txtNgaySinh" name = "txtNgaySinh" style="background-color: transparent;" />
					<img id="imgFromDate" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
					<b class="error">*</b>
				</div></td>
				<td class = "widthLabel"><div>Quận/huyện :</div></td>
				<td class = "widthContent"><div>	
					<input type = "text" name = "txtQuan" size="18"  style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Email : </div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtEmail" size="18" style="background-color: transparent;" /><b class="error">*</b>
				</div></td>
				<td class = "widthLabel"><div>Thành phố :</div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtThanhPho" size="18"  style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Chứng minh nhân dân : </div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtCMND" size="18" style="background-color: transparent;" /><b class="error">*</b>
				</div></td>
				<td class = "widthLabel"><div>Điện thoại nhà : </div></td>
				<td class = "widthContent"><div>
					<input type = "text" name = "txtDienThoaiNha" size="18" style="background-color: transparent;" /><b class="error"></b>
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Tình trạng : </div></td>
				<td class = "widthContent"><div>
					<input type = "radio" id = "Active" disabled="disabled" checked="checked" name = "radio" />Hoạt Động
					<input type = "radio" id = "Disable" disabled="disabled" name = "radio" />Nghỉ								
				</div></td>
				<td class = "widthLabel"><div>Điện thoại di động : </div></td>
				<td class = "widthContent"><div><input type = "text" name = "txtDienThoaiDD"  size="18" style="background-color: transparent;" /><b class="error"></b></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_chitiet.png" border = "0" /><b style="color: red">Thông Tin Cá Nhân Gia Đình</b></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Họ tên khai sinh: </div></td>
				<td class = "widthContent"><div>
					<input name="HoTenKhaiSinh" id="HoTenKhaiSinh" size="18" type="text" style="background-color: transparent;" /><!-- <b class="error">*</b>-->
				</div></td>				
				<td class = "widthLabel"><div>Giới tính: </div></td>
				<td class = "widthContent"><div>
					<select name="Sex" id="Sex" style="width:100px; background-color:transparent;">				
						<option value="1">Nam</option>
						<option value="0">Nữ</option>
					</select>
				<!-- <b class="error">*</b>-->
				</div></td>				
			</tr>	
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Tên thường gọi: </div></td>
				<td class = "widthContent"><div>
					<input name="TenThuongGoi" id="TenThuongGoi" size="18" type="text" style="background-color:transparent" /><!-- <b class="error">*</b>-->
				</div></td>				
				<td class = "widthLabel"><div>Nơi sinh:</div></td>
				<td class = "widthContent"><div><input size="18" style="background-color: transparent;" name="NoiSinh" id="NoiSinh" type="text" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Quê quán:</div></td>
				<td class = "widthContent"><div><input style="background-color: transparent;" size="18" name="QueQuan" id="QueQuan" type="text" /></div></td>
				<td class = "widthLabel"><div>Nơi đăng ký thường trú:</div></td>
				<td class = "widthContent">
					<div>
						<textarea name="NoiDangKyThuongTru" rows="6" cols="25" style="width:150px; height:60px; background-color:transparent; font-family:tahoma; resize:none; font-size: 12px" wrap="HARDER"></textarea>										
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Dân tộc:</div></td>
				<td class = "widthContent"><div><input style="background-color: transparent;" size="18" name="DanToc" id="DanToc" type="text" /></div></td>
				<td class = "widthLabel"><div>Tôn giáo:</div></td>
				<td class = "widthContent"><div><input style="background-color: transparent;" size="18" name="TonGiao" id="TonGian" type="text" size="15" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Trình độ học vấn trước khi vào học:</div></td>
				<td class = "widthContent"><div><input style="background-color: transparent;" size="18" name="TrinhDoHocVanTruocKhiVaoHoc" id="TrinhDoHocVanTruocKhiVaoHoc" type="text" size="15" /></div></td>
				<td class = "widthLabel"><div>Ngày tham gia vào Đảng CSVN:</div></td>
				<td class = "widthContent">
					<div>
						<input name="NgayThamGiaDang" size="14" style="background-color: transparent;" id="NgayThamGiaDang" type="text" style="width:130px" readonly="readonly"  />
						<img id="imgNgayThamGiaDang" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>				
					</div>				
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
			
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Ngày chính thức:</div></td>
				<td class = "widthContent">
					<div>
						<input name="NgayChinhThuc" size="14" style="background-color: transparent;" id="NgayChinhThuc" type="text" size="18" style="width:90px" readonly="readonly"   />
						<img id="imgNgayChinhThuc" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>				
					</div>				
				</td>
				<td class = "widthLabel"><div>Ngày kết nạp vào Đoàn TNCS Hồ Chí Minh:</div></td>
				<td class = "widthContent">
					<div>
						<input name="NgayKetNapDoan" size="14" style="background-color: transparent;" id="NgayKetNapDoan" type="text" style="width:130px" readonly="readonly"  />
						<img id="imgNgayKetNapDoan" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>				
					</div>				
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
			  		output += "inputField        : 'NgayChinhThuc',";
			  		output += "button            : 'imgNgayChinhThuc',";
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
			  		output += "inputField        : 'NgayKetNapDoan',";
			  		output += "button            : 'imgNgayKetNapDoan',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
		</script>
			
			
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Họ và tên bố : </div></td>
				<td class = "widthContent"><div><input size="18" name="HoTenBo" id="HoTenBo" type="text" style="background-color:transparent;" /></div></td>
				<td class = "widthLabel"><div>Nghề nghiệp : </div></td>
				<td class = "widthContent"><div><input size="18" name="NgheNghiepBo" id="NgheNghiepBo" type="text" size="15" style="background-color:transparent;" /></div></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Họ và tên mẹ : </div></td>
				<td class = "widthContent"><div><input size="18" name="HoTenMe" id="HoTenMe" type="text" style="background-color:transparent;" /></div></td>
				<td class = "widthLabel"><div>Nghề nghiệp : </div></td>
				<td class = "widthContent"><div><input size="18" name="NgheNghiepMe" id="NgheNghiepMe" type="text" size="15" style="background-color:transparent;" /></div></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Họ và tên vợ (chồng) : </div></td>
				<td class = "widthContent"><div><input size="18" name="HoTenVoChong" id="HoTenVoChong" type="text" style="background-color:transparent;" /></div></td>
				<td class = "widthLabel"><div>Nghề nghiệp : </div></td>
				<td class = "widthContent"><div><input size="18" name="NgheNghiepVoChong" id="NgheNghiepVoChong" type="text" size="15" style="background-color:transparent;" /></div></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Đối tượng thuộc diện chính sách : </div></td>
				<td class = "widthContent"><div><textarea name="DoiTuongThuocDienChinhSach" rows="5" cols="18" style="width:160px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea></div></td>
				<td class = "widthLabel"><div>Nghề nghiệp làm trước khi vào học : </div></td>
				<td class = "widthContent"><div><textarea name="NgheNghiepLamTruocKhiVaoHoc" rows="5" cols="18" style="width:160px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea></div></td>								
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Nguyện vọng làm việc sau khi kết thúc khóa học : </div></td>
				<td class = "widthContent" colspan="3"><div><textarea name="NguyenVong" rows="7" cols="25" style="background-color:transparent; width:500px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea></div></td>
				<!-- <td class = "widthLabel"><div></div></td>
				<td class = "widthContent"><div></div></td>		 -->		
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_bangcap.png" border = "0" /> <b style="color: red">Bằng cấp</b></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Loại Bằng : </div></td>
				<td class = "widthContent"><div><input size="18" type = "text" name = "txtLoaiBang" style="background-color: transparent;" /></div></td>
				<td></td>
				<td></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Trường cấp : </div></td>
				<td class = "widthContent"><div><input size="18" type = "text" name = "txtTruongCap" style="background-color: transparent;" /></div></td>
				<td></td>
				<td></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td class = "widthLabel"><div>Loại tốt nghiệp : </div></td>
				<td class = "widthContent"><div><input size="18" type = "text" name = "txtLoaiTotNghiep" style="background-color: transparent;" /></div></td>				
				<td></td>
				<td></td>				
			</tr>
			<!-- button tao moi -->
			<tr style="background-color: transparent;">
				<td colspan="2">
					<a href = "javascript: submit()">
						<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" border = "0" />
					</a>
				</td>
				<td colspan="2"><b class="error">Yêu cầu nhập đúng thông tin ở các ô có đấu (*)</b></td>
			</tr>
		</table>
		</div>
		
		<script type="text/javascript">
			
			//<![CDATA[  
			  <%
			  	for(int i=1; i<= 1 ; i++) {
			  		String output = "";
			  		output += "Zapatec.Calendar.setup({";
			  		output += "firstDay          : 1,";
			  		output += "weekNumbers       : false,";
			  		output += "range             : [2000.01, 2030.12],";
			  		output += "electric          : false,";
			  		output += "inputField        : 'txtNgaySinh',";
			  		output += "button            : 'imgFromDate',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
			//]]>
			
			//<![CDATA[  
			  <%
			  	for(int i=1; i<= 1 ; i++) {
			  		String output = "";
			  		output += "Zapatec.Calendar.setup({";
			  		output += "firstDay          : 1,";
			  		output += "weekNumbers       : false,";
			  		output += "range             : [2000.01, 2030.12],";
			  		output += "electric          : false,";
			  		output += "inputField        : 'txtNgayLapThe',";
			  		output += "button            : 'imgFromDate_1',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
			//]]>
		</script>
		
	</form>

		<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>