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
<%@page import="org.zefer.html.doc.r"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<title>Hệ Thống Quản Lý Thiết Bị</title>
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
		ThietBiModel thietBiModel = new ThietBiModel();
		thietBiModel.setSoLanBaoTri("0");
		thietBiModel.setSoLanSuDung("0");
		thietBiModel.setTanSuatSuDung("0.0");
		if(request.getParameter("maThietBi") != null)
			thietBiModel = ThietBiDAO.getThietBiByID(request.getParameter("maThietBi"));
		else if(request.getAttribute("thietBi") != null)
			thietBiModel = (ThietBiModel) request.getAttribute("thietBi");
	%>
</script>
<c:set var='phongList' value='<%=PhongBanDAO.getAllPhongBan()%>' ></c:set>
<c:set var='khoaList' value='<%=KhoaDAO.showAllKhoa()%>'></c:set>
<c:set var='nhaCCList' value='<%=NhaCungCapDAO.getAllNhaCungCapByTen(1,NhaCungCapDAO.getTotalNhaCungCapByTen(""),"")%>'></c:set>
<c:set var='loaiThietBiList' value='<%=LoaiThietBiDAO.getAllLoaiThietBi()%>' ></c:set>
<c:set var = "ThietBi" value="<%=thietBiModel %>" scope = "session"/>
<c:set var = "TanSuatList" value = "<%=TanSuatDAO.getAllTanSuat() %>"/>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/>
	
	<a id="aFocus"></a>
	<font color='red' id='alertValidate'></font>
		<c:if test="${param.ThemThietBi eq 'ok'}">
			<font class="msg">Thêm thiết bị thành công</font>
		</c:if>
		<c:if test="${param.ThemThietBi eq 'fail'}">
			<font class="error">Thêm thiết bị thất bại</font>
		</c:if>
		
		<c:if test="${param.UpdateThietBi eq 'ok'}">
			<font class="msg">Cập nhật thiết bị thành công</font>
		</c:if>
		<c:if test="${param.UpdateThietBi eq 'fail'}">
			<font class="error">Cập nhật thiết bị thất bại</font>
		</c:if>
	<br/><br/>
			
	<form name="frmThietBi" id="frmThietBi" method="post" action="<%=request.getContextPath()%>/ThietBiController">
		<div>
				<input type="hidden" name="actionType" id="actionType"/>
				<input type="hidden" name="txtIndexRow" id="txtIndexRow"/>
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Thiết Bị</div>
				</td>
			</tr>
		</table>

				<table class="table1" width="500px" >
						<tr>
							<td style="text-align:right;background-color: transparent;">Tên thiết bị</td>
							<td>
								<input type="text" size="25" name="txtTenThietBi" id="txtTenThietBi" value = "${ThietBi.tenThietBi }"/> <font color='red' id='alertTenThietBi'></font>
							</td>	
							<td style="text-align:right">Kí hiệu máy</td>
							<td>
								<input type="text" size="25" id="txtKiHieu" name="txtKiHieu"  value = "${ThietBi.kiHieu }"/>
								<font color='red' id='alertKiHieu'></font>
							</td>
							
						</tr>
						<tr>
							<td style="text-align:right;background-color: transparent;">Loại thiết bị</td>
							<td style="background-color: transparent;">
								<select id="cboLoaiThietBiLinhKien" name="cboLoaiThietBiLinhKien" style="width: 178px">
									<option>--Chọn--</option>
									<c:forEach var="objLoaiThietBi" items="${loaiThietBiList}">
											<option value="${objLoaiThietBi.maLoaiThietBi}"
												<c:if test = "${ThietBi.maLoaiThietBi eq objLoaiThietBi.maLoaiThietBi}">selected</c:if>>
													${objLoaiThietBi.tenLoaiThietBi}</option>
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
												<c:if test = "${ThietBi.maNhaCungCap eq objNhaCungCap.maNhaCungCap}">selected</c:if>>
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
											<c:if test = "${ThietBi.maBoPhan eq objKhoa.maKhoa}">selected</c:if>>
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
											<c:if test = "${ThietBi.maPhongBan eq objPhong.maPhongBan}">selected</c:if>>
												${objPhong.kiHieu}</option>
									</c:forEach>
								</select>
								<font id='alertPhong' color='red'></font>
				
							</td>	
						</tr> 
						<tr>
							<td style="text-align:right">Ngày sản xuất</td>
							<td><input type = "text" size="25" id="txtCalendar1" size = 8 name="txtCalendar1" style="background-color: transparent;" value = "${ThietBi.ngaySanXuat }"/>
								<font id='alertNgaySanXuat' color='red'></font>
							</td>
							<td style="text-align:right">Hạn bảo hành</td>
							<td><input type = "text" size="25" id="txtCalendar3" size = 8 name="txtCalendar3" style="background-color: transparent;" value = "${ThietBi.hanBaoHanh }"/>
								<font id='alertNgayBaoHanh' color='red'></font>
							</td>
						</tr> 
						<tr>
							<td style="text-align:right">Ngày mua</td>
							<td><input type = "text" size="25" id="txtCalendar2" size = 8 name="txtCalendar2" style="background-color: transparent;" value = "${ThietBi.ngayMua }"/>
								<font id='alertNgayMua' color='red'></font>
							</td>
							<td style="text-align:right">Giá mua</td>
							<td>
								<input name="txtGiaMua" size="25" id="txtGiaMua" type="text" width="50px"  value = "${ThietBi.giaMua }"/>
								<font id='alertGiaMua' color='red'></font>
							</td>
						</tr> 
						<tr>
							<td style="text-align:right">Ngày bắt đầu sử dụng</td>
							<td><input type = "text" size="25" id="txtCalendar4" size = 8 name="txtCalendar4" style="background-color: transparent;" value = "${ThietBi.ngayBatDauSuDung }"/>
								<font id='alertNgayMua' color='red'></font>
							</td>
							<td style="text-align:right">Tần suất tối đa</td>
							<td>
								<input type="text" size="13" id="txtTanSuatToiDa" name="txtTanSuatToiDa" value = "${ThietBi.tanSuatToiDa }"/>
								<select name="cboTanSuat" id = "cboTanSuat">
									<c:forEach var = "TanSuat" items="${TanSuatList}">
										<option value="${TanSuat.maTanSuat}"
											<c:if test = "${TanSuat.maTanSuat eq ThietBi.maTanSuat}">selected</c:if>
										>${TanSuat.tenTanSuat}</option>
									</c:forEach>
								</select>
								<font id='alertTanSuatToiDa' color='red'></font>
							</td>
							
							
						</tr> 
						<tr>
							<td style="text-align:right">Số lần sử dụng</td>
							<td>
								<input type="text" size="25" id="txtSoLanSuDung" name="txtSoLanSuDung" value = "${ThietBi.soLanSuDung }" readonly="readonly"/>
							</td>
							<td style="text-align:right">Số lần bảo trì</td>
							<td>
								<input type="text" size="25" id="txtSoLanBaoTri" name="txtSoLanBaoTri"  value = "${ThietBi.soLanBaoTri }" readonly="readonly"/>
							</td>
							
							
						</tr> 
						<tr>
							<td style="text-align:right">Tần suất sử dụng</td>
							<td>
								<input type="text" size="25" id="txtTanSuatSuDung" name="txtTanSuatSuDung" value = "${ThietBi.tanSuatSuDung }%" readonly="readonly"/>
							</td>
							<c:if test = "${empty ThietBi.maThietBi}">
								<td>Số lượng</td>
								<td>
									<select name = "cboSoLuong" id = "cboSoLuong">
										<c:forEach var = "s" begin = "1" end="30">
											<option value = "${s}">${s }</option>
										</c:forEach>
									</select>
								</td>
							</c:if>
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
							<textarea rows="4" cols="30" id="txtNguyenTacSD" name="txtNguyenTacSD">${ThietBi.nguyenTacSuDung }</textarea>
							<font id='alertNguyenTacSD' color='red'></font>
						</td>
					</tr> 
					<tr>
						<td style="text-align:right">Đặc tính kĩ thuật</td>
						<td>
							<textarea rows="4" cols="30" id="txtDacTinhKT" name="txtDacTinhKT">${ThietBi.dacTinhKyThuat }</textarea>
										<font id='alertDacTinhKT' color='red'></font>
						</td>
					</tr> 	
					<tr>
						<td style="text-align:right">Ghi chú</td>
						<td>
							<textarea rows="4" cols="30" id="txtGhiChu" name="txtGhiChu">${ThietBi.ghiChu}</textarea>
						</td>
					</tr> 		
				</table>
				
				
				<br/>
				<br/>
				<p style="font-weight:bold">Linh kiện của thiết bị</p>
				<%int c=1; %>
				<table border="1"  id="frmChiTietThietBi" class="table3">
					<tr style="color:white;background-color: #186fb2">
						<th><input type="checkbox" onclick="checkAll()"/></th>
						<th>Tên linh kiện</th>
						<th>Kí hiệu</th>
						<th>Nhà cung cấp</th>
						<th>Số lần sử dụng</th>
						<th>Số lần bảo trì</th>
					</tr>
					<c:forEach var = "LinhKien" items="${ThietBi.chiTietThietBiList}">
						<tr>
							<td><input type = "checkbox" value = "${LinhKien.maChiTietThietBi}" id = "chk<%=c %>"
								<c:if test = "${LinhKien.soLanSuDung ne 0}">disabled</c:if>/></td>
							<td><a href = "<%=Constant.PATH_RES.getString("qltb.XemChiTietThietBiPath")%>?maLinhKien=${LinhKien.maChiTietThietBi}">${LinhKien.tenChiTietThietBi }</a></td>
							<td>${LinhKien.kiHieu }</td>
							<td>${LinhKien.tenNhaCungCap }</td>
							<td>${LinhKien.soLanSuDung }</td>
							<td>${LinhKien.soLanBaoTri }</td>
						</tr>
						<%c++; %>
					</c:forEach>
					<c:set var = "count" value = "<%=c %>"/>
					<c:if test = "${not empty ThietBi.maThietBi}">
						<tr>
							<td colspan="6">
								<a href = "<%=Constant.PATH_RES.getString("qltb.XemChiTietThietBiPath")%>?maThietBi=${ThietBi.maThietBi}">
									<img src="<%=request.getContextPath()%>/images/buttom/themdong.png" border = "0" />
								</a>
								<c:if test = "${count gt 1}">	
									<a href = "javascript: click_btnXoaDong()">
											<img src="<%=request.getContextPath()%>/images/buttom/xoadong.png" border = "0" />
										</a>
									<a id='aFocusThemDong'></a>
								</c:if>	
							</td>
						</tr>
					</c:if>
				</table>
				<br/>
			<c:choose>
				<c:when test="${not empty ThietBi.maThietBi}">
					<a href = "javascript: click_btnUpdateThietBi();">
						<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
					</a>
				</c:when>
				<c:otherwise>
					<a href = "javascript: click_btnThemThietBi();">
						<img src="<%=request.getContextPath()%>/images/buttom/them.png" border = "0" />
					</a>
				</c:otherwise>
			</c:choose>	
				
			<input type = "hidden" id = "txtListLinhKien" name = "txtListLinhKien"/>
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
  var indexRow=1;

  function click_btnXoaDong(){
  	
  	var listLinhKien = "";
  	
  	for(i=1;i<<%=c%>;i++){
  		
  		//alert("checkBox"+i+" : "+document.getElementById("checkBox"+i).checked);
  		if(document.getElementById("chk"+i).checked==true){
  			listLinhKien += "-" + document.getElementById("chk"+i).value;
  		}
  	}
	if(listLinhKien != "")
	{
		document.getElementById('txtListLinhKien').value = listLinhKien;
		if(confirm("Bạn có chắc muốn xóa các linh kiện này không???"))
			document.getElementById('frmThietBi').submit();
	}
	else
		alert("Hãy chọn linh kiện cần xóa!!!");
  }
  function click_btnThemThietBi()
  {
  	if(validateFormThietBi()&&validateFormChiTietThietBi())
  	{
  			document.getElementById("actionType").value="ThemThietBi";		
	  		document.getElementById("txtIndexRow").value=indexRow;
	  		document.forms['frmThietBi'].submit();
  
  	}
  	else
  	{
  		document.getElementById("aFocus").innerHTML="<input type='text' style='background-color: transparent;border:none' id='txtAlertFocus'/>";
  		document.getElementById("txtAlertFocus").focus();
  		document.getElementById("aFocus").innerHTML="";
  	}
  }
  function click_btnUpdateThietBi()
  {
  	if(validateFormThietBi()&&validateFormChiTietThietBi())
  	{
  			document.getElementById("actionType").value="CapNhatThietBi";		
	  		document.getElementById("txtIndexRow").value=indexRow;
	  		document.forms['frmThietBi'].submit();
  
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
