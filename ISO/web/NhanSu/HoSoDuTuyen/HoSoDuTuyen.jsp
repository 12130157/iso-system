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
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%><html>
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
	
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	
	<c:set var="listViTriDuTuyen" value='<%=ChiTietKHTNSDAO.getAllCTKHTNS() %>'></c:set>
	<c:if test="${not empty param.id}">
		<c:set var="boPhan" value='<%=KhoaDAO.getKhoaByMaBoPhan(session.getAttribute("maBoPhan").toString()) %>' ></c:set>
		<c:set var="HoSoDuTuyen" value='<%=HoSoDuTuyenDAO.getHoSoByID(request.getParameter("id").toString().trim()) %>'></c:set>
		<c:set var="locktext" value="readonly"></c:set>
		<c:set var="lockbtn" value="disabled"></c:set>
		<c:set var="truongKhoa" value='<%=HoSoDuTuyenDAO.getTK(request.getParameter("id").toString().trim()) %>'/>
	</c:if>
	
<script language="javascript">
	var mes = "<font color='red' style='font-weight: bold;font-style: italic;'>Biệt Danh này đã tồn tại!!!<br/>Phiền bạn thêm số ký tự trước _ exam: thien2_vd !!!</font>";
	var mes1 = "<font color='red' style='font-weight: bold;font-style: italic;'>Biệt Danh không đúng qui tắc<br/>vd : Võ Đức Thiện -> thien_vd</font>";
	var mes2 = "<font color='blue' style='font-weight: bold;'>Bạn có thể sử dụng Biệt Danh này !!!</font>";
		function confirmSending(){	
			var re = /^([\w.-])+\@(([\w.]){3,6})+[A-Za-z]{2,4}$/;
			var rong = /\s/g;
			
			var TenDangNhap = document.getElementById("TenDangNhap").value;
			var test = document.getElementById("test").value;
			var val_1 = TenDangNhap.replace(rong,"");	

			var Ho = document.getElementById("Ho").value;
			var val_2 = Ho.replace(rong,"");

			var SoNha = document.getElementById("SoNha").value;
			var val_3 = SoNha.replace(rong,"");

			var TenLot = document.getElementById("TenLot").value;
			var val_4 = TenLot.replace(rong,"");

			var TenDuong = document.getElementById("TenDuong").value;
			var val_5 = TenDuong.replace(rong,"");

			var Ten = document.getElementById("Ten").value;
			var val_6 = Ten.replace(rong,"");

			var PhuongXa = document.getElementById("PhuongXa").value;
			var val_7 = PhuongXa.replace(rong,"");

			var NgaySinh = document.getElementById("NgaySinh").value;

			var QuanHuyen = document.getElementById("QuanHuyen").value;
			var val_8 = QuanHuyen.replace(rong,"");

			var TinhTP = document.getElementById("TinhTP").value;
			var val_9 = TinhTP.replace(rong,"");

			var Email = document.getElementById("Email").value;
			var val_10 = Email.replace(rong,"");
			
			var DTNha = document.getElementById("DTNha").value;
			var val_11 = DTNha.replace(rong,"");

			var CMND = document.getElementById("CMND").value;
			var val_12 = CMND.replace(rong,"");

			var DTDD = document.getElementById("DTDD").value;
			var val_13 = DTDD.replace(rong,"");

			if(val_1 == ""){
			 	alert("Bạn phải nhập Biệt Danh !!!" );
			 	
			} else if(val_2 == ""){
				alert("Bạn phải nhập đầy đủ họ tên !!!" );
				
			} else if(!isNaN(val_2)){
				alert("Họ tên không thể là số !!!" );
				
			} else if(val_3 == ""){
				alert("Bạn phải nhập số nhà !!!" );
				
			} else if(val_4 != "" && !isNaN(val_4)){
				alert("Tên lót không thể là số !!!" );
				
			} else if(val_5 == ""){
				alert("Bạn phải nhập tên đường !!!" );
				
			} else if(val_6 == ""){
				alert("Bạn phải nhập đầy đủ họ tên !!!" );
				
			} else if(!isNaN(val_6)){
				alert("Họ tên không thể là số !!!" );
				
			} else if(val_7 == ""){
				alert("Bạn phải nhập Phường(Xã) !!!" );
				
			} else if(val_8 == ""){
				alert("Bạn phải nhập Quận(Huyện) !!!" );
				
			} else if(val_9 == ""){
				alert("Bạn phải nhập Tỉnh(Thành Phố) !!!" );
				
			} else if(NgaySinh == ""){
				alert("Bạn phải nhập ngày sinh !!!" );

			} else if(Email == ""){
				alert("Bạn phải nhập Email !!!" );

			} else if(re.test(Email) == false){
				alert("Email không hợp lệ !!! Ví dụ : thanhtc.hv@gmail.com");

			} else if(val_12 == ""){
				alert("Bạn phải nhập số Chứng Minh Nhân Dân !!!" );
				
			} else if(val_13 == ""){
				alert("Bạn phải nhập số Điện Thoại Di Động !!!" );
			
			} else if(isNaN(CMND)){
				alert("Chứng minh nhân dân phải nhập số !!!" );

			} else if(val_11 != "" && isNaN(DTNha)){
				alert("Điện thoại nhà phải nhập số !!!" );
				
			} else if(isNaN(DTDD)){
				alert("Điện thoại di động phải nhập số !!!" );
				
			} else if(test == "1"){
				alert("Biệt Danh đã tồn tại !!!" );
			
			} else if(test == "0"){
				alert("Biệt Danh không đúng qui tắc !!!" );
				
			} else{
				if(confirm("Bạn có chắc chắn muốn Đăng Ký Dự Tuyển ?")){
					document.getElementById("action").value = "new";
					document.forms['HoSoDuTuyen'].submit();
				}
			}
			
		}

		function checkTenDangNhap(){
			var ru = /^([\w])+\_([\w]){2,5}$/;
			var rong = /\s/g;
			
			var listTenDangNhap = new Array()
			var listEmail = new Array();
			var TenDangNhap = document.getElementById("TenDangNhap").value;
			var Email = document.getElementById("Email").value;
			var error = document.getElementById("error");
			var testU = TenDangNhap.replace(rong,"");
			
			if(ru.test(testU)==false){
				error.innerHTML = mes1;
				document.getElementById("test").value = "0";
				return;
			}
			
			<%
				ArrayList<ThanhVienModel> listTV = ThanhVienDAO.timAllThanhVien();
				for(ThanhVienModel model : listTV){
					out.print("listTenDangNhap.push('"+model.getTenDangNhap()+"');");
					out.print("listEmail.push('"+model.getEmail()+"');");
				}
				ArrayList<HoSoDuTuyenModel> listHSDT = HoSoDuTuyenDAO.getAllHoSo();
				for(HoSoDuTuyenModel model : listHSDT){
					out.print("listTenDangNhap.push('"+model.getTen_dang_nhap()+"');");
					out.print("listEmail.push('"+model.getEmail()+"');");
				}
			%>
			
			for ( var check in listTenDangNhap) {
				if(testU == listTenDangNhap[check]){
					error.innerHTML = mes;
					document.getElementById("test").value = "1";
					return;
				}
			}

			error.innerHTML = mes2;
			document.getElementById("test").value = "2";
		}

		function deNghiKhoanThuViec(){
			document.getElementById("action").value = "new1";
			document.forms['HoSoDuTuyen'].submit();
		}
		
		function hopDongLanDau(){
			document.getElementById("action").value = "new2";
			document.forms['HoSoDuTuyen'].submit();
		}
	</script>
	
</head>
<body>
<div class = "div_pagebody">
<div align="center">
	<c:if test="${param.Them ne 'yes'}">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	</c:if>
	<table style="background-color: transparent;">
		<tr  style="background-color: transparent;">
			<c:choose>
			<c:when test="${param.Them eq 'yes'}">
				<td><h2 style="margin: 20px;">ĐĂNG KÝ DỰ TUYỂN VIÊN CHỨC, GIÁO VIÊN</h2></td>
			</c:when>
			<c:when test="${not empty param.id}">
				<td><h2 style="margin: 20px;">CHI TIẾT THÔNG TIN ${fn:toUpperCase(HoSoDuTuyen.user1) }</h2></td>
			</c:when>
		</c:choose>
			
		</tr>
	</table>
	<form name="HoSoDuTuyen" action="<%=request.getContextPath() %>/hoSoDuTuyenController" method="post" >
	<table class="hosodutuyen" style="margin-bottom: 20px;">
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Biệt danh </td>
				<td style="text-align: left;">
					<input style="background-color: transparent;" ${locktext } type="text" onchange="checkTenDangNhap()" id="TenDangNhap" name="TenDangNhap" value="${HoSoDuTuyen.ten_dang_nhap }" />
					<c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if>
				</td>				
				<td colspan="2" style="height:50px;width:250px;text-align: left;padding-left: 10px;" id="error">
					<c:if test="${empty param.id}">
					<font color="blue">exam : Tên của bạn là Võ Đức Thiện <br/> biệt danh sẽ là thien_vd ...</font></c:if>
					
				</td>				
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Họ </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="Ho" name="Ho" value="${HoSoDuTuyen.ho }" /><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Số nhà </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="SoNha" name="SoNha" value="${HoSoDuTuyen.so_nha }" /><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tên lót </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="TenLot" name="TenLot" value="${HoSoDuTuyen.ten_lot }" /></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tên đường </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="TenDuong" name="TenDuong" value="${HoSoDuTuyen.duong }"/><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tên </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="Ten" name="Ten" value="${HoSoDuTuyen.ten }"/><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Phường/ xã </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="PhuongXa" name="PhuongXa" value="${HoSoDuTuyen.phuong_xa }" /><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Ngày sinh </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" readonly="readonly" id="NgaySinh" name="NgaySinh" value="${HoSoDuTuyen.ngay_sinh_mdy }" /><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Quận/ huyện </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="QuanHuyen" name="QuanHuyen" value="${HoSoDuTuyen.quan_huyen }" /><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">CMND </td> 
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="CMND" name="CMND" value="${HoSoDuTuyen.cmnd }" /><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tỉnh/ thành phố </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="TinhTP" name="TinhTP" value="${HoSoDuTuyen.tinh_thanhpho }" /><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Email </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="Email" name="Email" value="${HoSoDuTuyen.email }"/><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				<td style="background-color: transparent;text-align: right;padding: 5px;">Điện thoại nhà </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="DTNha" name="DTNha" value="${HoSoDuTuyen.dien_thoai_nha }" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Giới tính </td>
				<td style="text-align: left;">
					<select name="GioiTinh" ${lockbtn } >
						<option value="0">Nữ</option>
						<option value="1" <c:if test="${HoSoDuTuyen.gioi_tinh eq 'Nam' }">selected</c:if>>Nam</option>
						
					</select>
				</td>				
				<td style="background-color: transparent;text-align: right;padding: 5px;">Điện thoại di động </td>
				<td style="text-align: left;"><input style="background-color: transparent;" ${locktext } type="text" id="DTDD" name="DTDD" value="${HoSoDuTuyen.dien_thoai_dd }"/><c:if test="${empty param.id}"><font color="red" style="font-style: italic;"> (*) </font></c:if></td>
				
			</tr>
			<tr style="background-color: transparent;">				
				<td style="background-color: transparent;text-align: right;padding: 5px;">Vị trí dự tuyển </td>
				<td style="background-color: transparent;text-align: left;">
					<select id="ViTriDuTuyen" name="ViTriDuTuyen" ${lockbtn } >
					<c:choose>
						<c:when test="${not empty param.id}">
							<c:set var="listVT" value="<%=ChiTietKHTNSDAO.getAllCTKHTNS() %>"/>
						</c:when>
						<c:otherwise>
							<c:set var="listVT" value="<%=ChiTietKHTNSDAO.getAllCTKHTNSCoDK() %>"/>
						</c:otherwise>
					</c:choose>
					
						<c:forEach items="${listVT}" var="model">		
							<option value="${model.id}" <c:if test="${HoSoDuTuyen.vi_tri_du_tuyen eq model.id }">selected</c:if>>
								${model.user1 }-${model.user2 }
							</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Trình độ văn hóa  </td>
				<td colspan="3" style="text-align: left"><input style="background-color: transparent;width: 250px;" ${locktext } type="text" name="TrinhDoVanHoa" value="${HoSoDuTuyen.trinh_do_van_hoa }" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Tin học  </td>
				<td colspan="3" style="text-align: left"><input style="background-color: transparent;width: 250px;" ${locktext } type="text" name="TinHoc" value="${HoSoDuTuyen.tin_hoc }"/></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Ngoại Ngữ </td>
				<td colspan="3" style="text-align: left"><input style="background-color: transparent;width: 250px;" ${locktext } type="text" name="NgoaiNgu" value="${HoSoDuTuyen.ngoai_ngu }" /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;">Chuyên môn  </td>
				<td colspan="3" style="text-align: left"><input style="background-color: transparent;width: 250px;" ${locktext } type="text" name="ChuyenMon" value="${HoSoDuTuyen.chuyen_mon }" /></td>			
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding: 5px;" >Tóm tắt bản thân  </td>
				<td colspan="3" style="text-align: left"><textarea style="background-color: transparent;" ${locktext } name="TomTatBanThan" rows="3" cols="60">${HoSoDuTuyen.tom_tat_ban_than_area }</textarea></td>
			</tr>
					
			
		</table>
		<c:choose>
			<c:when test="${param.Them eq 'yes'}">
				<a href = "javascript: confirmSending()">
					<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Thêm" border = "0" style="margin: 20px;"/>
				</a>
			</c:when>
			<c:when test="${HoSoDuTuyen.tinh_trang eq '1' and maThanhVien eq truongKhoa}">
				<a href = "javascript: deNghiKhoanThuViec()">
					<img src="<%=request.getContextPath()%>/images/buttom/denghikhoanthuviec.png" alt="Thêm" border = "0" style="margin: 20px;"/>
				</a>
			</c:when>
			<c:when test="${HoSoDuTuyen.tinh_trang eq '5' and maThanhVien eq truongKhoa}">
				<a href = "javascript: hopDongLanDau()">
					<img src="<%=request.getContextPath()%>/images/buttom/hopdonglandau.png" alt="Thêm" border = "0" style="margin: 20px;"/>
				</a>
			</c:when>
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>
		<input type="hidden" id="test" />
		<input type="hidden" id="id" name="id" value="${HoSoDuTuyen.id}" />
		<input type="hidden" id="action" name="action" />
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
	range             : [1962.01, 1991.12],
	electric          : false,
	inputField        : "NgaySinh",
	button            : "Calendar",
	ifFormat          : "%d-%m-%Y"
  });
//]]>
 </script>
</body>
</html>