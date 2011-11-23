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
			var ho = txtHo.value;
			var value_2 = ho.replace(rong,"");
			
			var ten = txtTen.value;
			var value_3 = ten.replace(rong,"");
			
			var CMNN = txtCMNN.value;
			var value_4 = CMNN.replace(rong,"");
			
			if(value_2 == ""){
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
				if(confirm("Bạn có chắc chắn muốn cập nhật không ?"))
					document.forms["formThanhVien"].submit();
			}	
	}
}
</script>
<c:set var="maVaiTro" value='<%=session.getAttribute("maVaiTro") %>'></c:set>
<title>Thông tin cá nhân</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_QuanLySinhVien.jsp" />
	<!-- E HEAD CONTENT -->
	<c:if test="${not empty thongbao}">
		<p style="color:red; background-color: yellow; width: 200px"><b><c:out value="${thongbao}"></c:out></b></p>
	</c:if>
	<c:set var = "listVaiTro" value = "<%= VaiTroDAO.timAllVaiTro() %>"></c:set>
	<form action="<%=request.getContextPath()%>/SinhVienController" name  = "formThanhVien" id = "formThanhVien">
		<input type = "hidden" name = "actionType" value="Admin_updateTV" />
		<table style="background-color: transparent;">
			<c:choose>
				<c:when test="${not empty param.maThanhVien && param.maThanhVien ne ''}">
					<c:set var="ChiTietThanhVien" value = '<%= ThanhVienDAO.XemChiTietThanhVienByMaThanhVien(request.getParameter("maThanhVien").toString()) %>' scope="session"></c:set>
					<input type = "hidden" name = "id" value="<%=request.getParameter("maThanhVien") %>" /><input type = "hidden" name = "hidden" value="cap nhat thong tin sinh vien" />
					<c:if test="${maVaiTro eq '8' || maVaiTro eq '9' || maVaiTro eq '11' || maVaiTro eq '13'}">
						<c:set var="lock_txt" value="readonly" />
						<c:set var="lock_btn" value="disabled" />
					</c:if>
				</c:when>
				<c:otherwise>
					<c:set var="ChiTietThanhVien" 
					value = '<%= ThanhVienDAO.XemChiTietThanhVienByMaThanhVien(session.getAttribute("maThanhVien").toString()) %>' scope="session"></c:set>
					<input type = "hidden" name = "id" value="<%=session.getAttribute("maThanhVien") %>" /><input type = "hidden" name = "hidden" value="cap nhat thong tin ca nhan" />
					<c:set var="lock_khoa" value="disabled" />
				</c:otherwise>	
			</c:choose>
			<tr style="background-color: transparent;"><td colspan="4"><div class = "div_thanhvientieude">Thông tin cá nhân ${ChiTietThanhVien.hoThanhVien} ${ChiTietThanhVien.tenLot} ${ChiTietThanhVien.tenThanhVien}</div></td></tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_chitiet.png" border = "0" /> Chi Tiết</div></td>
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_diachi.png" border = "0" /> Địa chỉ</div></td>
			</tr>
			<tr style="background-color: transparent;">
				
				<td style="text-align: right;padding-right: 10px;font-weight: bold;width: 120px;">Họ</td>
				<td style="width: 200px;text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.hoThanhVien}" name = "txtHo" style="background-color: transparent;" />	
				</td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;width: 120px;">Số nhà</td>
				<td style="width: 200px;text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.soNha}" name = "txtSoNha" style="background-color: transparent;" />
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Tên lót</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.tenLot}" name = "txtTenLot" style="background-color: transparent;" />	
				</td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Đường</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.duong}" name = "txtDuong" style="background-color: transparent;"  />
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Tên</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.tenThanhVien}" name = "txtTen" style="background-color: transparent;" />	
				</td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Phường/xã</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.phuongXa}" name = "txtPhuong"  style="background-color: transparent;" />
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Ngày sinh</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_btn} value = "${ChiTietThanhVien.ngaySinh}" id = "txtNgaySinh" name = "txtNgaySinh" style="background-color: transparent;" />
					<br/>
				</td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Quận/huyện</td>
				<td style="text-align: left;">	
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.quanHuyen}" name = "txtQuan"  style="background-color: transparent;" />
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Email</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.email}" name = "txtEmail" style="background-color: transparent;" />
				</td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Thành phố</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.thanhPho}" name = "txtThanhPho"  style="background-color: transparent;" />
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Chứng minh nhân dân</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.chungMinhNhanDan}" name = "txtCMNN" style="background-color: transparent;" />
				</td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Điện thoại nhà</td>
				<td style="text-align: left;">
					<input type = "text" ${lock_txt} value = "${ChiTietThanhVien.dienThoaiNha}" name = "txtDienThoaiNha" style="background-color: transparent;" />
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;"></td>
				<td style="text-align: left;"></td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Điện thoại di động</td>
				<td style="text-align: left;"><input type = "text" ${lock_txt} value = "${ChiTietThanhVien.dienThoaiDiDong}" name = "txtDienThoaiDD" style="background-color: transparent;" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_nganhang.png" border = "0" /> Ngân hàng</div></td>
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_bangcap.png" border = "0" /> Bằng cấp</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Số tài khoản</td>
				<td style="text-align: left;"><input type = "text" ${lock_txt} value = "${ChiTietThanhVien.soTaiKhoan}" name = "txtSoTaiKhoan" style="background-color: transparent;" /></td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Loại Bằng</td>
				<td style="text-align: left;"><input type = "text" ${lock_txt} value = "${ChiTietThanhVien.loaiBang}" name = "txtLoaiBang" style="background-color: transparent;" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Ngân hàng</td>
				<td style="text-align: left;"><input type = "text" ${lock_txt} value = "${ChiTietThanhVien.nganHang}" name = "txtNganHang" style="background-color: transparent;" /></td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Trường cấp</td>
				<td style="text-align: left;"><input type = "text" ${lock_txt} value = "${ChiTietThanhVien.truongCap}" name = "txtTruongCap" style="background-color: transparent;" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Ngày lập thẻ</td>
				<td style="text-align: left;">
					<input type = "text" value = "${ChiTietThanhVien.ngayLapThe}" ${lock_btn} readonly="readonly" id = "txtNgayLapThe" name = "txtNgayLapThe" style="background-color: transparent;" />
				</td>
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Loại tốt nghiệp</td>
				<td style="text-align: left;"><input type = "text" ${lock_txt} value = "${ChiTietThanhVien.loaiTotNghiep}" name = "txtLoaiTotNghiep" style="background-color: transparent;" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_taikhoang.png" border = "0" /> Khoa</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align: right;padding-right: 10px;font-weight: bold;">Bộ Phận</td>
				<td style="text-align: left;">
					<c:set var="listKhoa" value="<%= KhoaDAO.showAllKhoa() %>"></c:set>
					<select name = "cboKhoa" id = "cboKhoa" ${lock_btn} ${lock_khoa }>				
						<c:forEach var="maKhoa" items="${listKhoa}">
							<option 
								<c:if test="${ChiTietThanhVien.maKhoa eq maKhoa.maKhoa }">selected</c:if>
									value="${maKhoa.maKhoa}">${maKhoa.tenKhoa}</option> 
						</c:forEach>
					</select>
				</td>
				<c:set var="maThanhVien" value="${ChiTietThanhVien.maThanhVien}"></c:set>
				<c:set var="sessionMaThanhVien" value='<%=session.getAttribute("maThanhVien") %>'></c:set>
				<c:if test='${maThanhVien eq sessionMaThanhVien}'>
				<td colspan="2">
					<a href = "javascript: submit()">	
						<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
					</a>
				</td>
				</c:if>
				<c:if test='${maThanhVien != sessionMaThanhVien}'>
				<td colspan="2">
					<a href = "PrintSoLuocLyLich.jsp?maThanhVien=<%=request.getParameter("maThanhVien") %>">	
						<img src="<%=request.getContextPath()%>/images/buttom/Printer-icon.png" border = "0" />
					</a>
				</td>
				</c:if>
			</tr>	
		</table>

		
	</form>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
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
			  		output += "button            : 'txtNgaySinh',";
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
			  		output += "button            : 'txtNgayLapThe',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
			//]]>
		</script>
</body>
</html>
</fmt:bundle>