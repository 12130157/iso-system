<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HocPhanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HinhThucDAO"%>


<%@page import="vn.edu.hungvuongaptech.dao.BaiKiemTraDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TenBaiKiemTraDAO"%><fmt:bundle basename="i18n">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp"></meta>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Môn Học</title>

<script type="text/javascript" language="JavaScript">
	
	function submit(){
		var check = false;
		var rong = /\s/g;
		
		var tenMH = document.formMonHoc.txtTenMonHoc.value.replace(rong,"");
		var lyThuyet = document.formMonHoc.txtLyThuyet.value.replace(rong,"");
		var thucHanh = document.formMonHoc.txtThucHanh.value.replace(rong,"");
		var kiemTra = document.formMonHoc.txtKiemTra.value.replace(rong,"");
		var tinhChat = document.formMonHoc.txtTinhChat.value.replace(rong,"");
		if(tenMH == ""){
			 alert("Bạn phải nhập Tên Môn Học !!!" );
			 check = true;
		} else if(lyThuyet == "") {
			 alert("Bạn phải nhập số tiết lý thuyết !!!" );
			 check = true;
		} else if(isNaN(lyThuyet)) {
			alert("Bạn phải nhập chữ số lý thuyết !!!" );
			 check = true;
		} else if(thucHanh == "") {
			 alert("Bạn phải nhập số tiết thực hành !!!" );
			 check = true;
		} else if(isNaN(thucHanh)) {
			 alert("Bạn phải nhập chữ số thực hành !!!" );
			 check = true;
		} else if(tinhChat == "") {
			alert("Bạn phải nhập tính chất !!!" );
			 check = true;
		} else if(lyThuyet + thucHanh + kiemTra <= 0) {
			alert("Lý thuyết + thực hành + kiểm tra không đồng thời bằng 0 !!!" ); 
			 check = true;
		} 
		if(check == false) {
			<%
				for(int i=1;i<=Constant.NUM_ROW_1;i++)
				{
					out.print("var tenBaiKiemTra = document.getElementById('txtTenBaiKiemTra" + i + "').value.replace(rong,'');");
					out.print("var thangDiem = document.getElementById('txtThangDiem" + i + "').value.replace(rong,'');");
					out.print("if(tenBaiKiemTra == '') {");
						out.print("check = true;}");
					out.print("else if(thangDiem == '') {");
						out.print("check = true; }");
					out.print("else if(isNaN(thangDiem)) {");
						out.print("check = true; }");
					out.print("else if(thangDiem < 0 || thangDiem > 10) {");
						out.print("check = true; }");	
				}
			%>	
			if(check == true)
				alert("Bạn phải nhập tên bài kiểm tra. Thang điểm phải là số, không được nhỏ hơn 0, không được lớn hơn 10");			
		}
		if(check == false)
			 document.getElementById("formMonHoc").submit();			
	}
	function checkAll()
	{
		
		<%
			for(int i = 1; i<= Constant.NUM_ROW_1; i++) {
				out.print("document.getElementById('chk" + i + "').checked = document.getElementById('chkAll').checked;\n");
			}
		%>
		
	}
	function checkRow(){
		if(document.getElementById('chkAll').checked == true)
			document.getElementById('chkAll').checked = false;
	}
	function addRow()
	{
		document.getElementById('xulydong').value = 'ThemDong';
		submit();
	}
	function deleteRow()
	{
		var check = false;
		<%
			for(int i=1;i<=Constant.NUM_ROW_1;i++)
			{
				out.print("if(document.getElementById('chk" + i +"').checked == true)");
				out.print("check = true;");
			}
		%>
		if(check == true)
		{
			if(confirm("Bạn có chắc muốn xoá không???"))
			{
				document.getElementById('xulydong').value = 'xoadong';
				document.forms["formMonHoc"].submit();
			}
		}
	}
</script>
</head>

<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	
<c:if test="${not empty param.themMoi}">
	<% Constant.NUM_ROW_1 = 0; %>
</c:if>

<c:choose>
	<c:when test="${not empty param.maMH}">
		<c:set var="MonHoc" value = '<%= MonHocDAO.getMonHocByMaMonHoc(request.getParameter("maMH"))%>' scope="session"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="MonHoc" value = '<%= (MonHocModel) request.getAttribute("monHoc") %>' scope="session"/>
	</c:otherwise>
</c:choose>
	
	<c:set var="chuyenNganhList" value='<%= ChuyenNganhDAO.getAllChuyenNganh() %>'></c:set>
	<c:set var="hocPhanList" value='<%= HocPhanDAO.showAllHocPhan() %>'></c:set>
	<c:set var="thanhVienList" value='<%= ThanhVienDAO.timAllThanhVienLaGiaoVien() %>'></c:set>
	<c:set var="hinhThucList" value="<%= HinhThucDAO.showAllHinhThuc() %>"></c:set>
	<c:set var="tenBaiKiemTraList" value="<%= TenBaiKiemTraDAO.showAllTenBaiKiemTra() %>"></c:set>

<form action="<%=request.getContextPath()%>/AdminController" name  = "formMonHoc" id = "formMonHoc" method="post">
	<input type="hidden" name="actionType" value="MonHoc" id = "actionType" />
	<input type="hidden" name="maMonHoc" value="${param.maMH}" />
	<input type="hidden" name="maNguoiTao" value="${MonHoc.maNguoiTao }" />
	<input type="hidden" name="HanhDong" value="" />
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Danh Sách Môn Học</div></td></tr>
			<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test="${not empty param.them}">
						<b class="msg">Thêm mới thành công !!!</b>
					</c:if>
					<c:if test="${not empty param.sua}">
						<b class="msg">Cập nhật thành công !!!</b>
					</c:if>
				</td>
			</tr>
		</table>
		
		<table style="background-color: transparent;">	
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Tên môn học : </div></td>
				<td><div class = "div_textleft"><input type = "text" name="txtTenMonHoc" value="${MonHoc.tenMonHoc}" style="background-color: transparent;" /></div></td>
				
				<td><div class = "div_textright">Tính chất : </div></td>
				<td><div class = "div_textleft"><input type = "text" name="txtTinhChat" value="${MonHoc.tinhChat}" style="background-color: transparent;" /></div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Lý thuyết : </div></td>
				<td><div class = "div_textleft"><input type = "text" id="LyThuyet" name="txtLyThuyet" value="${MonHoc.lyThuyet}" style="background-color: transparent;" /></div></td>
				
				<td><div class = "div_textright">Chuyên ngành : </div></td>
				<td><div class = "div_textleft">
					<select name="cboChuyenNganh">
						<c:forEach var="chuyenNganh" items="${chuyenNganhList}" >
							<option
								<c:if test="${chuyenNganh.maChuyenNganh eq MonHoc.maChuyenNganh }">selected</c:if>
									 value="${chuyenNganh.maChuyenNganh}" >${chuyenNganh.tenChuyenNganh}</option>
						</c:forEach>
					</select>
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Thực hành : </div></td>
				<td><div class = "div_textleft"><input type = "text" id="ThucHanh" name="txtThucHanh" value="${MonHoc.thucHanh}" style="background-color: transparent;" /></div></td>
				
				<td><div class = "div_textright">Học Phần : </div></td>
				<td><div class = "div_textleft">
					<select name="cboHocPhan">
						<c:forEach var="hocPhan" items="${hocPhanList}" >
							<option value="${hocPhan.maHocPhan}"
								<c:if test="${MonHoc.maHocPhan eq hocPhan.maHocPhan }">selected</c:if>>
									${hocPhan.tenHocPhan}
							</option>
						</c:forEach>
					</select>
				</div></td>
			</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_textright">Kiểm tra : </div></td>
				<td><div class = "div_textleft"><input type = "text" id="KiemTra" name="txtKiemTra" value="${MonHoc.kiemTra}" readonly="readonly" style="background-color: transparent;" /></div></td>
				
				<td><div class = "div_textright">Trưởng bộ môn : </div></td>
				<td><div class = "div_textleft">
					<select name="cboTruongBoMon">
						<c:if test="${thanhVien.maThanhVien ne MonHoc.maTruongBoMon }">
							<option value="">Không có</option>
						</c:if>
						<c:if test="${param.themMoi eq 'themMoi' }">
							<option value="">Không có</option>
						</c:if>
						<c:forEach var="thanhVien" items="${thanhVienList}" >
							<option
								<c:if test="${thanhVien.maThanhVien eq MonHoc.maTruongBoMon }">selected</c:if>
									value="${thanhVien.maThanhVien}" >
									${thanhVien.hoThanhVien} ${thanhVien.tenLot} ${thanhVien.tenThanhVien}
							</option>
						</c:forEach>
					</select>
				</div></td>
			</tr>
		</table>
			
					<table style="background-color: transparent;">
						<tr style="background-color: transparent;">
							<td colspan="6"><div class = "div_thanhvientieude">Các bài kiểm tra</div></td>
						</tr>
						
						<tr style="background-color: transparent;">
							<td colspan="6">
								<c:if test="${not empty param.xoa}">
									<b class="msg">Xoá bài kiểm tra thành công !!!</b>
								</c:if>
								<c:if test="${not empty param.trung}">
									<b class="err">Bài kiểm tra bị trùng !!!</b>
								</c:if>
							</td>
						</tr>
					</table>
					
					<table width = "800" border = "1" style="background-color: transparent;">
						<tr width = "800" style="background-color: transparent;">
							<th bgcolor = "#186fb2">
								<div class = "div_textWhite">
									<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"></input>
								</div>
							</th>
							<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
							<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên bài kiểm tra</div></th>
							<th bgcolor = "#186fb2"><div class = "div_textWhite">Hình thức</div></th>
							<th bgcolor = "#186fb2"><div class = "div_textWhite">Thang điểm</div></th>
							<th bgcolor = "#186fb2"><div class = "div_textWhite">Hệ số</div></th>		
						</tr>
						
						<% int c = 1; %>
					<c:forEach var="iterator" begin="1" end="<%=Constant.NUM_ROW_1 %>">
						<c:set var = "BaiKiemTra" value = "${MonHoc.baiKiemTraList[iterator-1]}"/>
						<tr>
							<c:set var="c" value="<%= c %>"></c:set>
								<td><input type="checkbox" name="chk${c}" id="chk${c}" onclick="checkRow();"></input></td>
								<td><%= c %></td>
								<td>
									<select name="cboTenBaiKiemTra${c}">
										<c:forEach var="TenBaiKiemTra" items="${tenBaiKiemTraList}">
											<option value="${TenBaiKiemTra.maTenBaiKiemTra }" <c:if test="${BaiKiemTra.maTenBaiKiemTra eq TenBaiKiemTra.maTenBaiKiemTra}">selected</c:if>>${TenBaiKiemTra.tenBaiKiemTra }</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<select name="cboHinhThuc${c}">
										<c:forEach var="HinhThuc" items="${hinhThucList}">
											<option value="${HinhThuc.maHinhThuc }" <c:if test="${BaiKiemTra.maHinhThuc eq HinhThuc.maHinhThuc}">selected</c:if>>${HinhThuc.tenHinhThuc }</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<input type="text" name="txtThangDiem${c}" id = "txtThangDiem${c}" value="${BaiKiemTra.thangDiem }" />
								</td>
								
								<td>
									<select name="cboHeSo${c}">
										<c:forEach var="HeSo" begin="1" end="3">
											<option value="${HeSo}" <c:if test="${BaiKiemTra.heSo eq HeSo}">selected</c:if>>${HeSo }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<% c++; %>
						</c:forEach>	
									
						<tr style="background-color: transparent;">
							<td colspan="5">
								<a href = "javascript: addRow()">
									<img src="<%=request.getContextPath()%>/images/buttom/themdong.png" border = "0" />
								</a>
								
								<a href = "javascript: deleteRow()">
									<img src="<%=request.getContextPath()%>/images/buttom/xoadong.png" border = "0" />
								</a>
								<input type = "hidden" name="xulydong" value="" id = "xulydong" />
							</td>
						</tr>
												
					</table>
	
			
		<table>
			<tr style="background-color: transparent;">
				<td>
					<c:choose>
						<c:when test="${not empty param.themMoi}">
							<a href = "javascript: submit()">
								<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" border = "0" />
								<input type = "hidden" name="nhanbiet" value="themmoi" /></a>
						</c:when>
						<c:otherwise>
							<a href = "javascript: submit()">	
								<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
								<input type = "hidden" name="nhanbiet" value="capnhat" />
							</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
</form>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>