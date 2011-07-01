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
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NhaCungCapDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.DonViTinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TanSuatDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<c:set var='phongList' value='<%=PhongBanDAO.getAllPhongBan()%>' ></c:set>
<c:set var='khoaList' value='<%=KhoaDAO.showAllKhoa()%>'></c:set>
<c:set var='nhaCCList' value='<%=NhaCungCapDAO.getAllNhaCungCapByTen(1,NhaCungCapDAO.getTotalNhaCungCapByTen(""),"")%>'></c:set>
<c:set var='donViTinhList' value='<%=DonViTinhDAO.getAllDonViTinh()%>' ></c:set>
<c:set var='loaiThietBiList' value='<%=LoaiThietBiDAO.getAllLoaiThietBi()%>' ></c:set>
<c:set var='tanSuatList' value='<%=TanSuatDAO.getAllTanSuat()%>' ></c:set>
<c:set var="maThanhVien" value='<%=(String) session.getAttribute("maThanhVien")%>'></c:set>

</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/>
	
	<a id="aFocus"></a>
	<font color='red' id='alertValidate'></font>
		<c:if test="${ not empty param.errInsert }">
			<c:if test="${param.errInsert eq 'true'}">
					<font color='red'>Lỗi thêm mới</font>
			</c:if>
			<c:if test="${param.errInsert eq 'false'}">
					<font color='blue'>Thêm mới thành công</font>
			</c:if>
		</c:if>
		
		
	<br/><br/>
			
	<form name="frmThietBi" id="frmThietBi" method="post" action="<%=request.getContextPath()%>/ThietBiController">
		<div>
				<input type="hidden" name="actionType" id="actionType"/>
				<input type="hidden" name="txtIndexRow" id="txtIndexRow"/>
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Thêm thiết Bị</div>
				</td>
			</tr>
		</table>

				<table class="table1" width="500px" >
						<tr>
							<td style="text-align:right;background-color: transparent;">Tên thiết bị</td>
							<td>
								<input type="text" name="txtTenThietBi" id="txtTenThietBi"/> <font color='red' id='alertTenThietBi'></font>
							</td>	
							
							<td style="text-align:right;background-color: transparent;">Loại thiết bị</td>
							<td style="background-color: transparent;">
								<select id="selLoaiThietBi" name="selLoaiThietBi">
									<option>--Chọn--</option>
									<c:forEach var="objLoaiThietBi" items="${loaiThietBiList}">
											<option value="${objLoaiThietBi.maLoai}">${objLoaiThietBi.tenLoai}</option>
									</c:forEach>
								</select>
								<font id='alertLoaiTB' color='red'></font>
							</td>
						</tr>
						<tr>
							<td style="text-align:right;">Khoa</td>
							<td>
								<select id="selKhoa" name="selKhoa">
									<option>--Chọn--</option>
									<c:forEach var="objKhoa" items="${khoaList}">
										<option value='${objKhoa.maKhoa}'>${objKhoa.tenKhoa}</option>
									</c:forEach>
								</select>
								<font id='alertKhoa' color='red'></font>
					
							</td>
							<td style="text-align:right">Nhà cung cấp</td>
							<td>
								<select id="selNhaCC" name="selNhaCC">
									<option>--Chọn--</option>
									<c:forEach var="objNhaCungCap" items="${nhaCCList}">
											<option value="${objNhaCungCap.maNhaCungCap}">${objNhaCungCap.ten}</option>
									</c:forEach>
								</select>
								<font id='alertNhaCC' color='red'></font>
					
							</td>	
						</tr>
						
						<tr>
							<td style="text-align:right">Số lượng</td>
							<td>
								<input name="txtSoLuong" id="txtSoLuong" type="text"/> 		
								<font id='alertSoLuong' color='red'></font>
							</td>
					
							<td style="text-align:right">Đơn vị tính</td>
							<td>
								<select id="selDonViTinh" name="selDonViTinh">
									<option>--Chọn--</option>
									<c:forEach var="objDonViTinh" items="${donViTinhList}">
											<option value="${objDonViTinh.maDonVi}">${objDonViTinh.tenDonVi}</option>
									</c:forEach>
								</select>
									<font id='alertDonViTinh' color='red'></font>
				
							</td>	
						</tr> 
						<tr>
							<td style="text-align:right">Phòng</td>
							<td>
								<select id="selPhong" name="selPhong">
									<option>--Chọn--</option>
									<c:forEach var="objPhong" items="${phongList}">
										<option value='${objPhong.maPhongBan}'>${objPhong.kiHieu}</option>
									</c:forEach>
								</select>
								<font id='alertPhong' color='red'></font>
				
							</td>	
							<td style="text-align:right">Tần suất tối đa</td>
							<td>
								<input type="text" id="txtTanSuatToiDa" name="txtTanSuatToiDa"/>
								<font id='alertTanSuatToiDa' color='red'></font>
							</td>
						</tr> 
						<tr>
							<td style="text-align:right">Ngày sản xuất</td><td><input type = "text" id="txtCalendar1" size = 8 name="txtCalendar1" style="background-color: transparent;"/></td>
							<td style="text-align:right">Đơn vị tần suất</td>
							<td>
								<select id="selDonViTanSuat" name="selDonViTanSuat">
									<option>--Chọn--</option>
									<c:forEach var="objTanSuat" items="${tanSuatList}">
											<option value="${objTanSuat.maTanSuat}">${objTanSuat.tenTanSuat}</option>
									</c:forEach>
								</select>
								<font id='alertDonViTanSuat' color='red'></font>
							</td>
						</tr> 
						<tr>
							<td style="text-align:right">Ngày mua</td>
							<td><input type = "text" id="txtCalendar2" size = 8 name="txtCalendar2" style="background-color: transparent;"/></td>
							<td style="text-align:right">Giá mua</td>
							<td>
								<input name="txtGiaMua" id="txtGiaMua" type="text" width="50px" />
								<font id='alertGiaMua' color='red'></font>
							</td>
						</tr> 
						<tr>
							<td style="text-align:right">Ngày bảo hành</td><td><input type = "text" id="txtCalendar3" size = 8 name="txtCalendar3" style="background-color: transparent;"/></td>
							<td style="text-align:right">Kí hiệu máy</td>
							<td>
								<input type="text" id="txtKiHieu" name="txtKiHieu"/>
								<font color='red' id='alertKiHieu'></font>
							</td>
							
						</tr> 
				</table>
						 
						
				<br/>
				<table class="table2">
					<tr>
						<td style="text-align:right">Phụ kiện</td>
						<td>
							<textarea rows="4" cols="30" id="txtPhuKien" name="txtPhuKien"></textarea>
							<font id='alertPhuKien' color='red'></font>
						</td>
					</tr> 
					<tr>
						<td style="text-align:right">Nguyên tắc sử dụng</td>
						<td>
							<textarea rows="4" cols="30" id="txtNguyenTacSD" name="txtNguyenTacSD"></textarea>
							<font id='alertNguyenTacSD' color='red'></font>
						</td>
					</tr> 
					<tr>
						<td style="text-align:right">Đặc tính kĩ thuật</td>
						<td>
							<textarea rows="4" cols="30" id="txtDacTinhKT" name="txtDacTinhKT"></textarea>
										<font id='alertDacTinhKT' color='red'></font>
						</td>
					</tr> 	
					<tr>
						<td style="text-align:right">Ghi chú</td>
						<td>
							<textarea rows="4" cols="30" id="txtGhiChu" name="txtGhiChu"></textarea>
						</td>
					</tr> 		
				</table>
				
				
				<br/>
				<br/>
				<p style="font-weight:bold">Khai báo các phụ kiện cần sửa chữa,thay thế</p>
				
				<table border="1"  id="frmChiTietThietBi" class="table3">
					<tr style="color:white;background-color: #186fb2">
						<th><input type="checkbox" onclick="checkAll()"/></th>
						<th>Tên linh kiện</th>
						<th>Nhà cung cấp</th>
						<th>Dung lượng</th>
						<th>Ghi chú</th>
					</tr>
					
					<tr>
						<td colspan="5">
							<input type="button" value="Thêm dòng" id="btnThemDong" onclick="click_btnThemDong()"/> 
							<input type="button" value="Xóa dòng" id="btnXoaDong" onclick="click_btnXoaDong()"/>
							<a id='aFocusThemDong'></a>
						</td>
					</tr>
			
				</table>
							<br/>
						<img src="<%=request.getContextPath()%>/images/buttom/them.png" border = "0" />
							<input type="button" value="Thêm thiết bị" id="btnThemThietBi" onclick="click_btnThemThietBi()"/>
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

  var indexRow=1;

  function click_btnXoaDong(){
  	
  	var tbChiTietTB=document.getElementById('frmChiTietThietBi');
  	
  	for(i=1;i<indexRow;i++){
  		
  		//alert("checkBox"+i+" : "+document.getElementById("checkBox"+i).checked);
  		if(document.getElementById("checkBox"+i).checked==true){
  			
  			
  			tbChiTietTB.deleteRow(i);
  			indexRow--;
  			for(j=i;j<indexRow;j++)
  			{	
  					//Cap nhat name truoc
  					
  					document.getElementById("checkBox"+(j+1)).name="checkBox"+j;
  					document.getElementById("txtTenLinhKien"+(j+1)).name="txtTenLinhKien"+j;
  					document.getElementById("selNhaCungCap"+(j+1)).name="selNhaCungCap"+j;
  					document.getElementById("txtDungLuong"+(j+1)).name="txtDungLuong"+j;
  					document.getElementById("txtGhiChu"+(j+1)).name="txtGhiChu"+j;
  					
  					document.getElementById("checkBox"+(j+1)).id="checkBox"+j;
  					document.getElementById("txtTenLinhKien"+(j+1)).id="txtTenLinhKien"+j;
  					document.getElementById("selNhaCungCap"+(j+1)).id="selNhaCungCap"+j;
  					document.getElementById("txtDungLuong"+(j+1)).id="txtDungLuong"+j;
  					document.getElementById("txtGhiChu"+(j+1)).id="txtGhiChu"+j;
  				
  			}
  			i--;
  			
  		}
  		
  	}

  }
  function click_btnThemThietBi()
  {
  	if(validateFormThietBi()&&validateFormChiTietThietBi())
  	{
  			document.getElementById("actionType").value="insert";		
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


  function click_btnThemDong()
  {
  	var tbChiTietTB=document.getElementById("frmChiTietThietBi");
  	row=tbChiTietTB.insertRow(indexRow);
  	var x=row.insertCell(0);
  	var y=row.insertCell(1);
  	var z=row.insertCell(2);
  	var h=row.insertCell(3);
  	var g=row.insertCell(4);
  	
  	x.innerHTML="<input type='checkbox' id='checkBox"+indexRow+"' name='checkBox"+indexRow+"'/>";

  	y.innerHTML="<input type='text' id='txtTenLinhKien"+indexRow+"' name='txtTenLinhKien"+indexRow+"' />";
  	
  	var hiddenNhaCungCap="<select id='selNhaCungCap"+indexRow+"' name='selNhaCungCap"+indexRow+"'><option>--Chọn--</option>";
  	hiddenNhaCungCap+="<c:forEach var='objNhaCungCap' items='${nhaCCList}'><option value='${objNhaCungCap.maNhaCungCap}'>${objNhaCungCap.ten}</option></c:forEach>";	
  	hiddenNhaCungCap+="</select>";
  	z.innerHTML=hiddenNhaCungCap;

  	h.innerHTML="<input type='text' id='txtDungLuong"+indexRow+"' name='txtDungLuong"+indexRow+"'/></td>";
  	g.innerHTML="<textarea rows='3' cols='10' id='txtGhiChu"+indexRow+"' name='txtGhiChu"+indexRow+"'></textarea>";
  	indexRow++;

	document.getElementById("aFocusThemDong").innerHTML="<input type='text' style='background-color: transparent;border:none' id='txtAlertFocus'/>";
	document.getElementById("txtAlertFocus").focus();
	document.getElementById("aFocusThemDong").innerHTML="";

	
  }

</script>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>