<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NhaCungCapDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.DonViTinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TanSuatDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThietBiDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<script src="<%=request.getContextPath()%>/QuanLyThietBi/js/ThemThietBi_Script.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Thêm chi tiết thiết bị</title>
<style>
	.table1{
		background:transparent;
	}
	.table1 td{
		background:transparent;
		text-align: left;
	}
	
	.table1 tr{
		background-color:transparent;
	}
	
	.table2 tr{
		background-color:transparent;
	}
	
	.table2 td{
		background-color:transparent;
	}
	
	.table3 tr{
		background-color:transparent;
	}
	
	.table3 td{
		background-color:transparent;
	}
</style>
<script language="type/text">
	<%
		ThietBiModel thietBi = new ThietBiModel();
		ChiTietThietBiModel chiTietThietBi = new ChiTietThietBiModel();
		if(request.getParameter("maThietBi") != null) {
			thietBi = ThietBiDAO.getThietBiSimpleByID(request.getParameter("maThietBi"));
			chiTietThietBi.setMaThietBi(thietBi.getMaThietBi());
			chiTietThietBi.setKiHieuThietBi(thietBi.getKiHieu());
			chiTietThietBi.setTenThietBi(thietBi.getTenThietBi());
			chiTietThietBi.setNgayBatDauSuDung(thietBi.getNgayBatDauSuDung());
			chiTietThietBi.setNgayMua(thietBi.getNgayMua());
			chiTietThietBi.setNgaySanXuat(thietBi.getNgaySanXuat());
			chiTietThietBi.setHanBaoHanh(thietBi.getHanBaoHanh());
			chiTietThietBi.setMaNhaCungCap(thietBi.getMaNhaCungCap());
		}
		if(request.getParameter("maLinhKien") != null)
			chiTietThietBi = ChiTietThietBiDAO.getLinhKienByID(request.getParameter("maLinhKien"));
		else if(request.getAttribute("chiTietThietBi") != null)
			chiTietThietBi = (ChiTietThietBiModel) request.getAttribute("chiTietThietBi");
	%>
</script>
<c:set var='phongList' value='<%=PhongBanDAO.getAllPhongBan()%>' ></c:set>
<c:set var='khoaList' value='<%=KhoaDAO.showAllKhoa()%>'></c:set>
<c:set var='nhaCCList' value='<%=NhaCungCapDAO.getAllNhaCungCapByTen(1,NhaCungCapDAO.getTotalNhaCungCapByTen(""),"")%>'></c:set>
<c:set var='loaiThietBiList' value='<%=LoaiThietBiDAO.getAllLoaiThietBi()%>' ></c:set>
<c:set var = "ChiTietThietBi" value="<%=chiTietThietBi %>" scope = "session"/>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/>
	
	<a id="aFocus"></a>
	<font color='red' id='alertValidate'></font>
		<c:if test="${param.ThemLinhKien eq 'ok'}">
			<font class="msg">Thêm thiết bị thành công</font>
		</c:if>
		<c:if test="${param.ThemLinhKien eq 'fail'}">
			<font class="error">Thêm thiết bị thất bại</font>
		</c:if>
		
		<c:if test="${param.UpdateLinhKien eq 'ok'}">
			<font class="msg">Cập nhật thiết bị thành công</font>
		</c:if>
		<c:if test="${param.UpdateLinhKien eq 'fail'}">
			<font class="error">Cập nhật thiết bị thất bại</font>
		</c:if>
	<br/><br/>
	<form name="frmLinhKien" id="frmLinhKien" method="post" action="<%=request.getContextPath()%>/ThietBiController">
		<div>
				<input type="hidden" name="actionType" id="actionType"/>
				<input type="hidden" name="txtIndexRow" id="txtIndexRow"/>
				
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Linh kiện</div>
				</td>
				
			</tr>
			<c:if test="${not empty ChiTietThietBi.maThietBi}">
				<tr style="background-color: transparent;">
					<td colspan="9">
						Tên thiết bị : <input type = "text" readonly="readonly" id = "txtTenThietBi" name = "txtTenThietBi" value = "${ChiTietThietBi.tenThietBi }"/>
						Kí hiệu : <input type = "text" readonly="readonly" id = "txtKiHieuThietBi" name = "txtKiHieuThietBi" value = "${ChiTietThietBi.kiHieuThietBi }"/>
						<input type = "hidden" name = "txtMaThietBi" id = "txtMaThietBi" value = "${ChiTietThietBi.maThietBi }"/>
						<a href="<%=Constant.PATH_RES.getString("qltb.XemThietBiPath") %>?maThietBi=${ChiTietThietBi.maThietBi }">Xem</a>
					</td>
				</tr>
			</c:if>	
		</table>
		<br/>
		<br/>
				<table class="table1" width="500px" >
						<tr>
							<td style="text-align:right;background-color: transparent;">Tên linh kiện</td>
							<td>
								<input type="text" size="25" name="txtTenLinhKien" id="txtTenLinhKien" value = "${ChiTietThietBi.tenChiTietThietBi }"/> <font color='red' id='alertTenThietBi'></font>
							</td>	
							<td style="text-align:right">Kí hiệu linh kiện</td>
							<td>
								<input type="text" size="25" id="txtKiHieu" name="txtKiHieu"  value = "${ChiTietThietBi.kiHieu }"/>
								<font color='red' id='alertKiHieu'></font>
							</td>
							
						</tr>
						<tr>
							<td style="text-align:right;background-color: transparent;">Loại linh kiện</td>
							<td style="background-color: transparent;">
								<select id="cboLoaiThietBiLinhKien" name="cboLoaiThietBiLinhKien" style="width: 178px">
									<option>--Chọn--</option>
									<c:forEach var="objLoaiLinhKien" items="${loaiThietBiList}">
											<option value="${objLoaiLinhKien.maLoaiThietBi}"
												<c:if test = "${ChiTietThietBi.maLoaiChiTietThietBi eq objLoaiLinhKien.maLoaiThietBi}">selected</c:if>>
													${objLoaiLinhKien.tenLoaiThietBi}</option>
									</c:forEach>
								</select>
								<font id='alertLoaiTB' color='red'></font>
							</td>
							<td style="text-align:right">Nhà cung cấp</td>
							<td>
								<select id="cboNhaCungCap" name="cboNhaCungCap" style="width: 178px">
									<option>--Chọn--</option>
									<c:forEach var="objNhaCungCap" items="${nhaCCList}">
											<option value="${objNhaCungCap.maNhaCungCap}"
												<c:if test = "${ChiTietThietBi.maNhaCungCap eq objNhaCungCap.maNhaCungCap}">selected</c:if>>
													${objNhaCungCap.ten}</option>
									</c:forEach>
								</select>
								<font id='alertNhaCC' color='red'></font>
					
							</td>	
						</tr>
						<tr>
							<td style="text-align:right;">Khoa</td>
							<td>
								<select id="cboKhoa" name="cboKhoa">
									<option>--Chọn--</option>
									<c:forEach var="objKhoa" items="${khoaList}">
										<option value='${objKhoa.maKhoa}'
											<c:if test = "${ChiTietThietBi.maBoPhan eq objKhoa.maKhoa}">selected</c:if>>
												${objKhoa.tenKhoa}</option>
									</c:forEach>
								</select>
								<font id='alertKhoa' color='red'></font>
					
							</td>
							<td style="text-align:right">Phòng</td>
							<td>
								<select id="cboPhongBan" name="cboPhongBan" style="width: 178px">
									<option>--Chọn--</option>
									<c:forEach var="objPhong" items="${phongList}">
										<option value='${objPhong.maPhongBan}'
											<c:if test = "${ChiTietThietBi.maPhongBan eq objPhong.maPhongBan}">selected</c:if>>
												${objPhong.kiHieu}</option>
									</c:forEach>
								</select>
								<font id='alertPhong' color='red'></font>
				
							</td>	
						</tr> 
						<tr>
							<td style="text-align:right">Ngày sản xuất</td>
							<td><input type = "text" size="25" id="txtCalendar1" size = 8 name="txtCalendar1" style="background-color: transparent;" value = "${ChiTietThietBi.ngaySanXuat }"/>
								<font id='alertNgaySanXuat' color='red'></font>
							</td>
							<td style="text-align:right">Hạn bảo hành</td>
							<td><input type = "text" size="25" id="txtCalendar3" size = 8 name="txtCalendar3" style="background-color: transparent;" value = "${ChiTietThietBi.hanBaoHanh }"/>
								<font id='alertNgayBaoHanh' color='red'></font>
							</td>
						</tr> 
						<tr>
							<td style="text-align:right">Ngày mua</td>
							<td><input type = "text" size="25" id="txtCalendar2" size = 8 name="txtCalendar2" style="background-color: transparent;" value = "${ChiTietThietBi.ngayMua }"/>
								<font id='alertNgayMua' color='red'></font>
							</td>
							<td style="text-align:right">Giá mua</td>
							<td>
								<input name="txtGiaMua" size="25" id="txtGiaMua" type="text" width="50px"  value = "${ChiTietThietBi.giaMua }"/>
								<font id='alertGiaMua' color='red'></font>
							</td>
						</tr> 
						<tr>
							<td style="text-align:right">Ngày bắt đầu sử dụng</td>
							<td><input type = "text" size="25" id="txtCalendar4" size = 8 name="txtCalendar4" style="background-color: transparent;" value = "${ChiTietThietBi.ngayMua }"/>
								<font id='alertNgayBatDauSuDung' color='red'></font>
							</td>
							<td style="text-align:right">Tần suất tối đa</td>
							<td>
								<input type="text" size="25" id="txtTanSuatToiDa" name="txtTanSuatToiDa" value = "${ChiTietThietBi.tanSuatToiDa }"/>
								<font id='alertTanSuatToiDa' color='red'></font>
							</td>
							
							
						</tr> 
						<tr>
							<td style="text-align:right">Số lần sử dụng</td>
							<td>
								<input type="text" size="25" id="txtSoLanSuDung" name="txtSoLanSuDung" value = "${ChiTietThietBi.soLanSuDung }" readonly="readonly"/>
							</td>
							<td style="text-align:right">Số lần bảo trì</td>
							<td>
								<input type="text" size="25" id="txtSoLanBaoTri" name="txtSoLanBaoTri"  value = "${ChiTietThietBi.soLanBaoTri }" readonly="readonly"/>
							</td>
						</tr> 
						<tr>
							<td style="text-align:right">Tần suất sử dụng</td>
							<td>
								<input type="text" size="25" id="txtTanSuatSuDung" name="txtTanSuatSuDung" value = "${ChiTietThietBi.tanSuatSuDung }" readonly="readonly"/>
							</td>
							<td></td>
							<td></td>
						</tr>
				</table>
				
				<table>		 
					<tr style="background-color: transparent;">
								<td colspan="7"><div class = "div_thanhvientieude"></div></td>
					</tr>
				</table>
						
				<br/>
				<table class="table2">
					<tr>
						<td style="text-align:right">Nguyên tắc sử dụng</td>
						<td>
							<textarea rows="4" cols="30" id="txtNguyenTacSD" name="txtNguyenTacSD">${ChiTietThietBi.nguyenTacSuDung }</textarea>
							<font id='alertNguyenTacSD' color='red'></font>
						</td>
					</tr> 
					<tr>
						<td style="text-align:right">Đặc tính kĩ thuật</td>
						<td>
							<textarea rows="4" cols="30" id="txtDacTinhKT" name="txtDacTinhKT">${ChiTietThietBi.dacTinhKyThuat }</textarea>
										<font id='alertDacTinhKT' color='red'></font>
						</td>
					</tr> 	
					<tr>
						<td style="text-align:right">Ghi chú</td>
						<td>
							<textarea rows="4" cols="30" id="txtGhiChu" name="txtGhiChu">${ChiTietThietBi.ghiChu}</textarea>
						</td>
					</tr> 		
				</table>
				
				
				<br/>
				<br/>
				<br/>
			<c:choose>
				<c:when test="${not empty ChiTietThietBi.maChiTietThietBi}">
					<a href = "javascript: click_btnUpdateLinhKien();">
						<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
					</a>
				</c:when>
				<c:otherwise>
					<a href = "javascript: click_btnThemLinhKien();">
						<img src="<%=request.getContextPath()%>/images/buttom/them.png" border = "0" />
					</a>
				</c:otherwise>
			</c:choose>

		</div>
	</form>	
	<br/>
<script>
	//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtCalendar1",
	button            : "Calendar",
	ifFormat          : "%m-%d-%Y"
  });
//]]>
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtCalendar2",
	button            : "Calendar1",
	ifFormat          : "%m-%d-%Y"
  });
//]]>
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtCalendar3",
	button            : "Calendar1",
	ifFormat          : "%m-%d-%Y"
  });
//]]>
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtCalendar4",
	button            : "Calendar1",
	ifFormat          : "%m-%d-%Y"
  });
//]]>
 
  function click_btnThemLinhKien()
  {
  	if(validateFormThietBi()&&validateFormChiTietThietBi())
  	{
  			document.getElementById("actionType").value="ThemLinhKien";		
	  		document.getElementById("txtIndexRow").value=indexRow;
	  		document.forms['frmLinhKien'].submit();
  
  	}
  	else
  	{
  		document.getElementById("aFocus").innerHTML="<input type='text' style='background-color: transparent;border:none' id='txtAlertFocus'/>";
  		document.getElementById("txtAlertFocus").focus();
  		document.getElementById("aFocus").innerHTML="";
  	}
  }
  function click_btnUpdateLinhKien()
  {
  	if(validateFormThietBi()&&validateFormChiTietThietBi())
  	{
  			document.getElementById("actionType").value="UpdateLinhKien";		
	  		document.getElementById("txtIndexRow").value=indexRow;
	  		document.forms['frmLinhKien'].submit();
  
  	}
  	else
  	{
  		document.getElementById("aFocus").innerHTML="<input type='text' style='background-color: transparent;border:none' id='txtAlertFocus'/>";
  		document.getElementById("txtAlertFocus").focus();
  		document.getElementById("aFocus").innerHTML="";
  	}
  }

</script>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
