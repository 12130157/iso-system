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
<%@page import="vn.edu.hungvuongaptech.dao.NhaCungCapDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.DonViTinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TanSuatDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TanSuatModel"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%>
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

<script src="<%=request.getContextPath()%>/QuanLyThietBi/js/ChiTietThietBi_Script.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Hệ Thống Quản Lý Thiết Bị - Chi Tiết Thiết Bị</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<c:if test="${ not empty param.errUpdate}">
			<c:if test="${param.errUpdate eq 'false'}">
					<font color='blue' style='font-weight:bold'>Cập nhật thành công</font>
					<br/>
					<br/>
			</c:if>
			<c:if test="${param.errUpdate eq 'true'}">
					<font color='red' style='font-weight:bold'>Cập nhật thất bại</font>
					<br/>
					<br/>
			</c:if>
	</c:if>
	
	<c:set var = "listThietBi" value = "<%= ThietBiDAO.getAllThietBi() %>"></c:set>
	<form action="<%=request.getContextPath()%>/ThietBiController" method="post" name  = "formThietBi" id = "formThietBi">
	
	<!-- chua co test -->
		<input type = "hidden" id = "actionType" name = "actionType" value="QLTB_updateTB" />
	<!-- chua co test -->
	
		<table>
	<c:set var="ChiTietThietBi" value = '<%= ThietBiDAO.XemChiTietThietBiByMaThietBi(request.getParameter("maThietBi")) %>' scope="session"></c:set>
	<c:set var="listPhong" value="<%= PhongBanDAO.getAllPhongBan() %>"></c:set>
	<c:set var="listLoaiTanSuat" value="<%= TanSuatDAO.getAllTanSuat() %>"></c:set>
	<c:set var="listLoaiThietBi" value="<%= LoaiThietBiDAO.getAllLoaiThietBi() %>"></c:set>
	<c:set var="listKhoa_TrungTam" value="<%= KhoaDAO.showAllKhoa() %>"></c:set>
	<c:set var="listTinhTrang" value="<%= ThietBiDAO.showAllTinhTrangTB() %>"></c:set>
	<c:set var="listNhaCungCap" value="<%= NhaCungCapDAO.showAllNhaCungCap() %>"></c:set>
	<c:set var="listDonViTinh" value="<%= DonViTinhDAO.getAllDonViTinh() %>"></c:set>
	<c:set var="thanhVienList" value='<%= ThietBiDAO.timAllNguoiTao() %>'></c:set>
					<input type = "hidden" name = "id" value="<%=request.getParameter("maThietBi") %>" />
			<tr style="background-color: transparent;">
				<td colspan="5">
					<div class = "div_thanhvientieude">Bạn Đang Xem Thông Tin Chi Tiết Của ${ChiTietThietBi.tenThietBi} </div>
				</td>
			</tr>
			</table>
			<table>
			<tr style="background-color: transparent;">
				<td colspan="5"><div class = "div_thanhvienmodun"><img src="<%=request.getContextPath()%>/images/icon/TV_taikhoang.png" border = "0" /> Thiết bị</td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td><div class="div_txright">Tên thiết bị : </div></td>
				<td><div class="div_txleft"><input type = "text" value ="${ChiTietThietBi.tenThietBi}" name = "txtTenThietBi" id = "txtTenThietBi" style="background-color: transparent;" /></div></td>
								
				<td><div class="div_txright">Tên đơn vị tần suất : </div></td>
				<td>
					<div class="div_txleft">
						<select id="cboDonViTanSuat" name="cboDonViTanSuat">	
								<c:forEach var="loaiTanSuat" items="${listLoaiTanSuat}">
									<option 
										<c:if test="${loaiTanSuat.maTanSuat eq ChiTietThietBi.maDonViTanSuat}">selected</c:if>
											value="${loaiTanSuat.maTanSuat}">${loaiTanSuat.tenTanSuat}
									</option>
								</c:forEach>
						</select>
					</div>
				</td>
				<td></td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td><div class="div_txright">Tên linh kiện : </div></td>
				<td><div class="div_txleft"><input type = "text" value ="${ChiTietThietBi.tenLinhKien}" name = "txtTenLinhKien" id = "txtTenLinhKien" style="background-color: transparent;" /></div></td>
								
				<td><div class="div_txright">Dung lượng : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.dungLuong}" name = "txtDungLuong" id = "txtDungLuong" style="background-color: transparent;" /></div></td>
				<td></td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td><div class="div_txright">Tên loại thiết bị :</div></td>
				<td>
					<div class="div_txleft">
						<select id="cboLoaiThietBi" name="cboLoaiThietBi">	
								<c:forEach var="loaiThietBi" items="${listLoaiThietBi}">
									<option 
										<c:if test="${loaiThietBi.maLoaiThietBi eq ChiTietThietBi.maLoaiThietBi}">selected</c:if>
											value="${loaiThietBi.maLoaiThietBi}">${loaiThietBi.tenLoaiThietBi}
									</option>
								</c:forEach>
						</select>
					</div>				
				</td>
				<td><div class="div_txright">Thuộc bộ phận : </div></td>
				<td colspan="2">						
					<div class="div_txleft">
						<select id="cboKhoa" name="cboKhoa">											
							<c:forEach var="khoa" items="${listKhoa_TrungTam}">
								<option 
									<c:if test="${khoa.maKhoa eq ChiTietThietBi.maBoPhan}">selected</c:if>
									value="${khoa.maKhoa}">${khoa.tenKhoa}
								</option> 
							</c:forEach>
						</select> 						
					</div>
				</td>								
			</tr>

			<tr style="background-color: transparent;">
				<td><div class="div_txright">Kí hiệu : </div></td>
				<td><div class="div_txtleft"><input type = "text" value = "${ChiTietThietBi.kiHieu}" name = "txtKiHieu" id = "txtKiHieu" style="background-color: transparent;" /></div></td>
				
				<td>
					<div class="div_txright">Người Tạo :</div>
				</td>
				<td colspan="2">
					<div class="div_txleft">
						<select name="cboNguoiTao">	
							<c:forEach var="chiTietThanhVien" items="${thanhVienList}">
								<option
									<c:if test="${chiTietThanhVien.maThanhVien eq ChiTietThietBi.maThanhVien}">selected</c:if>
										value="${chiTietThanhVien.maThanhVien}" >
										${chiTietThanhVien.hoThanhVien} ${chiTietThanhVien.tenLot} ${chiTietThanhVien.tenThanhVien}
								</option>
							</c:forEach>
						</select>
					</div>
				</td>				
				</tr>			

			<tr style="background-color: transparent;">
				<td><div class="div_txright">Số máy : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.soMay}" name = "txtSoMay" id = "txtSoMay" style="background-color: transparent;" /></div></td>
				
				<td><div class="div_txright">Phòng ban : </div></td>
				<td colspan="2">
					<div class="div_txleft">
						<select id="cboPhong" name="cboPhong">											
							<c:forEach var="phong" items="${listPhong}">
								<option 
									<c:if test="${phong.maPhongBan eq ChiTietThietBi.maPhongBan}">selected</c:if>
									value="${phong.maPhongBan}">${phong.kiHieu}
								</option> 
							</c:forEach>
						</select> 
					</div>
				</td>
																
			</tr>
		
			<tr style="background-color: transparent;">
				<td>
					<div class="div_txright">Tên nhà cung cấp : </div>
				</td>
				<td>
					<div class="div_txleft">
						<select id="cboNhaCungCap" name="cboNhaCungCap">											
							<c:forEach var="nhaCungCap" items="${listNhaCungCap}">
								<option 
									<c:if test="${nhaCungCap.maNhaCungCap eq ChiTietThietBi.maNhaCungCap}">selected</c:if>
									value="${nhaCungCap.maNhaCungCap}">${nhaCungCap.ten}
								</option> 
							</c:forEach>
						</select>						
					</div>
				</td>
				
				<td><div class="div_txright">Ngày sản xuất : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.ngaySanXuat}" readonly="readonly" name = "txtNgaySanXuat" id = "txtNgaySanXuat" style="background-color: transparent;" /></div></td>
				<td><img id="imgFromDate" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/></td>				
			</tr>

			<tr style="background-color: transparent;">
				<td><div class="div_txright">Tình trạng : </div></td>
				<td>
					<div class="div_txleft">
						<select id="cboTinhTrang" name="cboTinhTrang">											
							<c:forEach var="tt" items="${listTinhTrang}">
								<option 
									<c:if test="${tt.maTinhTrang eq ChiTietThietBi.maTinhTrang}">selected</c:if>
									value="${tt.maTinhTrang}">${tt.tenTinhTrang}
								</option> 
							</c:forEach>
						</select>
					</div>
				</td>
								
				<td><div class="div_txright">Giá mua : </div></td>
				<td colspan="2"><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.giaMua}" name = "txtGiaMua" id = "txtGiaMua" style="background-color: transparent;" /></div></td>
							
			</tr>
			
			<tr style="background-color: transparent;">
				<td><div class="div_txright">Hiện trạng : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "Rảnh" name = "txtHienTrang" style="background-color: transparent;" /></div></td>
								
				<td><div class="div_txright">Ngày mua : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.ngayMua}" name = "txtNgayMua" id = "txtNgayMua" readonly="readonly" style="background-color: transparent;" /></div></td>
				<td><img id="imgFromDate_1" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/></td>
			</tr>

			<tr style="background-color: transparent;">
				<td><div class="div_txright">Tần suất tối đa : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.tanSuatToiDa}" name = "txtTanSuatToiDa" id = "txtTanSuatToiDa" style="background-color: transparent;" /></div></td>
								
				<td><div class="div_txright">Ngày bắt đầu sử dụng : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.ngayBatDauSuDung}" readonly="readonly" name = "txtNgayBatDauSuDung" id = "txtNgayBatDauSuDung" style="background-color: transparent;" /></div></td>
				<td><img id="imgFromDate_2" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/></td>
			</tr>

			<tr style="background-color: transparent;">				
				<td><div class="div_txright">Tần suất sử dụng : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.tanSuatSuDung}" name = "txtTanSuatSuDung" id = "txtTanSuatSuDung" style="background-color: transparent;" /></div></td>
				
				<td><div class="div_txright">Số lần sử dụng : </div></td>
				<td colspan="2"><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.soLanSuDung}" name = "txtSoLanSuDung" id = "txtSoLanSuDung" style="background-color: transparent;" /></div></td>
								
			</tr>

			<tr style="background-color: transparent;">
				<td>
					<div class="div_txright">Mã đơn vị tính : </div>
				</td>
				<td>
					<div class="div_txleft">
						<select id="cboDonViTinh" name="cboDonViTinh">
								<c:forEach var="loaiDonViTinh" items="${listDonViTinh}">
									<option 
										<c:if test="${loaiDonViTinh.maDonViTinh eq ChiTietThietBi.maDonViTinh}">selected</c:if>
											value="${loaiDonViTinh.maDonViTinh}">${loaiDonViTinh.tenDonViTinh}
									</option>
								</c:forEach>
						</select>						
					</div>
				</td>
				
				<td><div class="div_txright">Phụ kiện : </div></td>
				<td colspan="2"><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.phuKien}" name = "txtPhuKien" id = "txtPhuKien" style="background-color: transparent;" /></div></td>
								
			</tr>
			
			<tr style="background-color: transparent;">
				<td><div class="div_txright">Số lần bảo trì : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.soLanBaoTri}" name = "txtSoLanBaoTri" id = "txtSoLanBaoTri" style="background-color: transparent;" /><font color='red' id='alertSoLanBaoTri'></font></div></td>
				
				<td><div class="div_txright">Ngày bảo hành : </div></td>
				<td><div class="div_txleft"><input type = "text" value = "${ChiTietThietBi.ngayBaoHanh}" readonly="readonly" name = "txtNgayBaoHanh" id = "txtNgayBaoHanh" style="background-color: transparent;" /></div></td>
				<td><div class="div_txleft"><img id="imgFromDate_3" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/></div></td>			
			</tr>

			<tr style="background-color: transparent;">
							<td colspan="5"><div class = "div_thanhvientieude"></td>
			</tr>
						
			<tr style="background-color: transparent;">
				<td colspan="2">Nguyên tắc sử dụng : </td>
				<td colspan="3"><textarea rows="10" cols="25" name="teaNguyenTacSuDung" id="teaNguyenTacSuDung">${ChiTietThietBi.nguyenTacSuDung}</textarea></td>
				
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2">Đặc tính kỹ thuật : </td>
				<td colspan="3"><textarea rows="10" cols="25" name="teaDacTinhKyThuat" id="teaDacTinhKyThuat">${ChiTietThietBi.dacTinhKyThuat}</textarea><font color='red' id='alertDacTinhKyThuat'></font></td>
			</tr>
			
			
			<tr></tr><tr></tr>
			<tr style="background-color: transparent;">
				<td colspan="5"><a href = "javascript: click_btnCapNhat()">	
						<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
					</a>
				</td>
		</table>
		
	</form>
	
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
			  		output += "inputField        : 'txtNgaySanXuat',";
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
			  		output += "inputField        : 'txtNgayMua',";
			  		output += "button            : 'imgFromDate_1',";
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
			  		output += "inputField        : 'txtNgayBatDauSuDung',";
			  		output += "button            : 'imgFromDate_2',";
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
			  		output += "inputField        : 'txtNgayBaoHanh',";
			  		output += "button            : 'imgFromDate_3',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
			//]]>
		</script>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</body>
</html>
