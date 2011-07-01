<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><fmt:bundle basename="i18n">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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

<script type="text/javascript" language="JavaScript">
function submit(){
	with (document.formThanhVien){
		var re=/^[\w.-]+@[\w.-]+\.[A-Za-z]{2,4}$/;
		var rong = /\s/g;
			
			var tenDangNhap = txtTenDangNhap.value;
			var value = tenDangNhap.replace(rong,"");
			
			var matKhau = txtMatKhau.value;
			var value_1 = matKhau.replace(rong,"");
			
			var ho = txtHo.value;
			var value_2 = ho.replace(rong,"");
			
			var ten = txtTen.value;
			var value_3 = ten.replace(rong,"");
			
			var CMNN = txtCMNN.value;
			var value_4 = CMNN.replace(rong,"");
			
			if(value == ""){
			 	alert("Bạn phải nhập tên đăng nhập !!!" );

			}else if(value_1 == ""){
				alert("Bạn phải nhập mật khẩu !!!" );

			}else if(value_2 == ""){
				alert("Bạn phải nhập họ tên đầy đủ !!!" );

			}else if(value_3 == ""){
				alert("Bạn phải nhập họ tên đầy đủ !!!" );

			}else if(txtNgaySinh.value == ""){
				alert("Bạn phải nhập ngày sinh !!!" );

			}else if(txtEmail.value == ""){
				alert("Bạn phải nhập Email !!!" );

			}else if(re.test(txtEmail.value) == false){
				alert("Email không hợp lệ !!! Ví dụ : xuananh@gmail.com");

			}else if(value_4 == ""){
				alert("Bạn phải nhập số chứng minh nhân dân !!!" );

			}else if(isNaN(txtCMNN.value)){
				alert("Chứng minh nhân dân phải nhập số !!!" );

			}else if(isNaN(txtDienThoaiNha.value)){
				alert("Điện thoại nhà phải nhập số !!!" );

			}
			else if(isNaN(txtDienThoaiDD.value)){
				alert("Điện thoại di động phải nhập số !!!" );

			}
			else{
				if(confirm("Bạn có chắc chắn muốn thêm thành viên này ko ?"))
					document.forms["formThanhVien"].submit();
			}	
	}
}
</script>

<title>Thành Viên</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var = "listVaiTro" value = "<%= VaiTroDAO.timAllVaiTro() %>"></c:set>
	<form action="<%=request.getContextPath()%>/ThanhVienController" name  = "formThanhVien" id = "formThanhVien">
		<input type = "hidden" name = "actionType" value="Admin_updateTV" />
		<table style="background-color: transparent;">
				<c:set var="ChiTietThanhVien" 
					value = '<%= ThanhVienDAO.XemChiTietThanhVienByMaThanhVien(request.getParameter("maThanhVien")) %>' scope="session"></c:set>
					<input type = "hidden" name = "id" value="<%=request.getParameter("maThanhVien") %>" />
			<tr style="background-color: transparent;"><td colspan="4"><div class = "div_thanhvientieude">Bạn Đang Xem Thông Tin Chi Tiết Của ${ChiTietThanhVien.hoThanhVien} ${ChiTietThanhVien.tenLot} ${ChiTietThanhVien.tenThanhVien}</div></td></tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_taikhoang.png" border = "0" /> Tài Khoản</div></td>
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_nganhang.png" border = "0" /> Ngân hàng</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Tên đăng nhập : </div></td>
				<td><div class = "div_textleft"><input type = "text" readonly="readonly" value = "${ChiTietThanhVien.tenDangNhap}" name = "txtTenDangNhap" style="background-color: transparent;" /></div></td>
				<td><div class = "div_textright">Số tài khoản : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThanhVien.soTaiKhoan}" name = "txtSoTaiKhoan" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Mật khẩu : </div></td>
				<td><div class = "div_textleft"><input type = "password" value = "${ChiTietThanhVien.matKhau}" name = "txtMatKhau" style="background-color: transparent;" /></div></td>
				<td><div class = "div_textright">Ngân hàng : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThanhVien.nganHang}" name = "txtNganHang" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Vai trò : </div></td>
				<td><div class = "div_textleft">
					<select name="cboVaiTro">				
						<c:forEach var="vaiTro" items="${listVaiTro}">
							<option 
								<c:if test="${ChiTietThanhVien.maVaiTro eq vaiTro.maVaiTro }">selected</c:if>
									value="${vaiTro.maVaiTro}">${vaiTro.tenVaiTro}</option> 
						</c:forEach>
					</select>
				</div></td>
				<td><div class = "div_textright">Ngày lập thẻ : </div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.ngayLapThe}" readonly="readonly" id = "txtNgayLapThe" name = "txtNgayLapThe" style="background-color: transparent;" />
					<img id="imgFromDate_1" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
				</div></td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Bộ Phận : </div></td>
				<td><div class = "div_textleft">
					<c:set var="listKhoa" value="<%= KhoaDAO.showAllKhoa() %>"></c:set>
					<select name = "cboKhoa" id = "cboKhoa">				
						<c:forEach var="maKhoa" items="${listKhoa}">
							<option 
								<c:if test="${ChiTietThanhVien.maKhoa eq maKhoa.maKhoa }">selected</c:if>
									value="${maKhoa.maKhoa}">${maKhoa.tenKhoa}</option> 
						</c:forEach>
					</select>
				</div></td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_chitiet.png" border = "0" /> Chi Tiết</div></td>
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_diachi.png" border = "0" /> Địa chỉ</div></td>
			</tr>
			<tr style="background-color: transparent;">
				
				<td ><div class = "div_textright">Họ : </div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.hoThanhVien}" name = "txtHo" style="background-color: transparent;" />	
				</div></td>
				<td><div class = "div_textright">Số nhà :</div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.soNha}" name = "txtSoNha" style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Tên lót : </div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.tenLot}" name = "txtTenLot" style="background-color: transparent;" />	
				</div></td>
				<td><div class = "div_textright">Đường :</div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.duong}" name = "txtDuong" style="background-color: transparent;"  />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Tên : </div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.tenThanhVien}" name = "txtTen" style="background-color: transparent;" />	
				</div></td>
				<td><div class = "div_textright">Phường/xã :</div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.phuongXa}" name = "txtPhuong"  style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Ngày sinh : </div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.ngaySinh}" id = "txtNgaySinh" name = "txtNgaySinh" style="background-color: transparent;" />
					<img id="imgFromDate" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>
					<br/>(mm/dd/yyyy)
				</div></td>
				<td><div class = "div_textright">Quận/huyện :</div></td>
				<td><div class = "div_textleft">	
					<input type = "text" value = "${ChiTietThanhVien.quanHuyen}" name = "txtQuan"  style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Email : </div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.email}" name = "txtEmail" style="background-color: transparent;" />
				</div></td>
				<td><div class = "div_textright">Thành phố :</div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.thanhPho}" name = "txtThanhPho"  style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Chứng minh nhân dân : </div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.chungMinhNhanDan}" name = "txtCMNN" style="background-color: transparent;" />
				</div></td>
				<td><div class = "div_textright">Điện thoại nhà : </div></td>
				<td><div class = "div_textleft">
					<input type = "text" value = "${ChiTietThanhVien.dienThoaiNha}" name = "txtDienThoaiNha" style="background-color: transparent;" />
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Tình trạng : </div></td>
				<td><div class = "div_textleft">

					<input type = "radio" id = "Active" 
						<c:if test="${ChiTietThanhVien.tinhTrang eq 1}">checked="checked"</c:if>
						 	value="1" name = "radio" />Hoạt Động
					<input type = "radio" id = "Disable"
						<c:if test="${ChiTietThanhVien.tinhTrang ne 1}">checked="checked"</c:if>
							value="0" name = "radio" />Nghỉ					

				</div></td>
				<td><div class = "div_textright">Điện thoại di động : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThanhVien.dienThoaiDiDong}" name = "txtDienThoaiDD" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_bangcap.png" border = "0" /> Bằng cấp</div></td>
				<td></td><td></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Loại Bằng : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThanhVien.loaiBang}" name = "txtLoaiBang" style="background-color: transparent;" /></div></td>
				<td colspan="2">
					<a href = "<%=request.getContextPath()%>/Admin/ThanhVien/ThemMoiThanhVien.jsp">
						<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" border = "0" />
					</a>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Trường cấp : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThanhVien.truongCap}" name = "txtTruongCap" style="background-color: transparent;" /></div></td>
				<td colspan="2">
					<a href = "javascript: submit()">	
						<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
					</a>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Loại tốt nghiệp : </div></td>
				<td><div class = "div_textleft"><input type = "text" value = "${ChiTietThanhVien.loaiTotNghiep}" name = "txtLoaiTotNghiep" style="background-color: transparent;" /></div></td>
				<td><div class = "div_textright"> </div></td>
				<td></td>
			</tr>
		</table>
		
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
			  		output += "range             : [1900.01, 2030.12],";
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
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>