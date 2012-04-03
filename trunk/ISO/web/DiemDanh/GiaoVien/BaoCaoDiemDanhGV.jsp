<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DiemDanhDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel" %>

<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
var khoaList = new Array();
var lopHocList = new Array();
var namHocList = new Array();
var thanhVienList = new Array();
var monHocList = new Array();
function pageLoad(){
	<% 
	ArrayList<KhoaModel> khoaList;
	khoaList = DiemDanhDAO.getThongTinGiaoVienReport(
									session.getAttribute("maThanhVien").toString(),
										session.getAttribute("maVaiTro").toString(),
											session.getAttribute("maBoPhan").toString());
	// Truong Khoa, PhoKhoa search theo khoa 
	// PDT, PHC, BGH search tất cả
	// Giáo Viên search giáo viên
	if(khoaList.size() > 0)
		out.print("document.getElementById('cboKhoa').innerHTML = '';");
		for(int i=0;i<khoaList.size();i++) {
			// dua du lieu vo combobox khoa 
			out.print("var objKhoa = new Object();");
			out.print("objKhoa.maKhoa = '" + khoaList.get(i).getMaKhoa() + "';");
			out.print("objKhoa.tenKhoa = '" + khoaList.get(i).getTenKhoa() + "';");
			out.print("var opt = new Option(objKhoa.tenKhoa, objKhoa.maKhoa);");
			out.print("document.getElementById('cboKhoa').add(opt, undefined);");
			out.print("var arrLopHoc = new Array();");
			for(int j=0;j<khoaList.get(i).getLopHocList().size();j++) {
				out.print("var objLopHoc = new Object();");
				out.print("objLopHoc.maLop = '" + khoaList.get(i).getLopHocList().get(j).getMaLopHoc() + "';");
				out.print("objLopHoc.kiHieuLop = '" + khoaList.get(i).getLopHocList().get(j).getKiHieu() + "';");
				//out.print("var opt = new Option( objLopHoc.kiHieuLop,objLopHoc.maLop);");
				//out.print("document.getElementById('cboLop').add(opt, undefined);");
				out.print("var arrNamHoc = new Array();");
				out.print("objLopHoc.namHocList = arrNamHoc;");
				out.print("arrLopHoc[arrLopHoc.length]=objLopHoc;");
				for(int k=0;k<khoaList.get(i).getLopHocList().get(j).getNamHocList().size();k++) {
					out.print("var objNamHoc = new Object();");
					out.print("objNamHoc.maNamHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getMaNamHoc() + "';");
					out.print("objNamHoc.namBatDau = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNamBatDau() + "';");
					out.print("objNamHoc.namKetThuc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNamKetThuc() + "';");
					out.print("var arrGiaoVien = new Array();");
					out.print("objNamHoc.thanhVienList =arrGiaoVien;");
					out.print("arrNamHoc[arrNamHoc.length]=objNamHoc;");
					for(int m=0;m<khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getThanhVienList().size();m++) {
						out.print("var objGiaoVien = new Object();");
						out.print("objGiaoVien.tenThanhVien = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getThanhVienList().get(m).getTenThanhVien() + "';");
						out.print("objGiaoVien.maThanhVien = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getThanhVienList().get(m).getMaThanhVien() + "';");
						out.print("var arrMonHoc = new Array();");
						out.print("objGiaoVien.monHocList =arrMonHoc;");
						out.print("arrGiaoVien[arrGiaoVien.length]=objGiaoVien;");
						for(int n=0;n<khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getThanhVienList().get(m).getMonHocList().size();n++) {
							out.print("var objMonHoc = new Object();");
							out.print("objMonHoc.maMonHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getThanhVienList().get(m).getMonHocList().get(n).getMaMonHoc() + "';");
							out.print("objMonHoc.tenMonHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getThanhVienList().get(m).getMonHocList().get(n).getTenMonHoc() + "';");
							out.print("arrMonHoc[arrMonHoc.length] = objMonHoc;");
						}
					}
				}
			
			}
			out.print("objKhoa.lopHocList = arrLopHoc;");
			out.print("khoaList[khoaList.length]=objKhoa;");
		}
		
		%>
		selectKhoa(2);
		//out.print("selectKhoa(2);");
	}
	
	function selectKhoa(x)
	{
		if(x == 2)
			document.getElementById("cboKhoa").value = <%="'" + request.getParameter("Khoa") + "'"%>;
		if(document.getElementById("cboKhoa").value != '') {
			var maKhoa = document.getElementById("cboKhoa").value;
			document.getElementById('cboLop').innerHTML = '';
			for(var i=0;i<khoaList.length;i++)
			{
				var objKhoa = new Object();
				objKhoa = khoaList[i];
				if(objKhoa.maKhoa == maKhoa)
				{
					
					lopHocList = objKhoa.lopHocList;
					for(var j=0;j<lopHocList.length;j++)
					{
						var objLopHoc = new Object();
						objLopHoc = lopHocList[j];
						var opt = new Option(objLopHoc.kiHieuLop, objLopHoc.maLop);
						document.getElementById('cboLop').add(opt, undefined);
					}
					break;
				}
			}
			selectLopHoc(x);
		}
	}
	function selectLopHoc(x)
	{
		if(x == 2)
			document.getElementById('cboLop').value = <%="'" + request.getParameter("Lop") + "'"%>;
		var maLop = document.getElementById("cboLop").value;
		document.getElementById('cboNamHoc').innerHTML = '';
		for(var i=0;i<lopHocList.length;i++)
		{
			var objLopHoc = new Object();
			objLopHoc = lopHocList[i];
			if(objLopHoc.maLop == maLop)
			{
				namHocList = objLopHoc.namHocList;
				for(var j=0;j<namHocList.length;j++)
				{
					var objNamHoc = new Object();
					objNamHoc = namHocList[j];
					var opt = new Option(objNamHoc.namBatDau + '-' + objNamHoc.namKetThuc, objNamHoc.maNamHoc);
					document.getElementById('cboNamHoc').add(opt, undefined);
				}
				break;
			}
		}
		selectNamHoc(x); //Võ Đức Thiện
	}
	function selectNamHoc(x)
	{
		if(x== 2) 
			document.getElementById('cboNamHoc').value = <%="'" +request.getParameter("NamHoc") + "'"%>;
		var maNam = document.getElementById("cboNamHoc").value;
		document.getElementById('cboGiaoVien').innerHTML = '';
		for(var i=0;i<namHocList.length;i++)
		{
			var objNamHoc = new Object();
			objNamHoc = namHocList[i];
			if(objNamHoc.maNamHoc == maNam)
			{
				thanhVienList = objNamHoc.thanhVienList;
				for(var j=0;j<thanhVienList.length;j++)
				{
					var objGiaoVien = new Object();
					objGiaoVien = thanhVienList[j];
					var opt = new Option( objGiaoVien.tenThanhVien,objGiaoVien.maThanhVien);
					document.getElementById('cboGiaoVien').add(opt, undefined);
				}
				break;
			}
		}
		selectGiaoVien(x);
	}
	function selectGiaoVien(x)
	{
		if(x == 2)
			document.getElementById('cboGiaoVien').value = <%="'" + request.getParameter("GiaoVien") + "'"%>;
		var maGiaoVien = document.getElementById("cboGiaoVien").value;
		document.getElementById('cboMonHoc').innerHTML = '';
		for(var i=0;i<thanhVienList.length;i++)
		{
			var objGiaoVien = new Object();
			objGiaoVien = thanhVienList[i];
			if(objGiaoVien.maThanhVien == maGiaoVien)
			{
				monHocList = objGiaoVien.monHocList;
				for(var j=0;j<monHocList.length;j++)
				{
					var objMonHoc = new Object();
					objMonHoc = monHocList[j];
					var opt = new Option(objMonHoc.tenMonHoc, objMonHoc.maMonHoc);
					document.getElementById('cboMonHoc').add(opt, undefined);
				}
				break;
			}
		}
		selectMonHoc(x);
	}
	
	function selectMonHoc(x)
	{
		if(x == 2)
			document.getElementById('cboMonHoc').value = <%="'" + request.getParameter("MonHoc") + "'"%>;
	}

	function submitSearch()
	{
		document.forms["FormHienThiTTGV"].submit();
	}
</script>


<title>Hệ Thống Quản Lý (Điểm Danh)</title>
</head>
<body onload="pageLoad();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_diemdanh.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/>
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Báo Cáo Tiến Độ Giảng Dạy Giáo Viên</div></td></tr>
	</table><br/><br/>
	<form action="<%=request.getContextPath()%>/DiemDanhController" id = "FormHienThiTTGV" name = "FormHienThiTTGV" method="post">
		<input type = "hidden" name="actionType" id="actionType" value="HienThiTTGV" />
		<font size="4" style="text-align: left;" color="#0000FF">Thông Tin Tìm Kiếm</font><br /><br />
		<table border="1" style="background-image: url('../../images/background_diemdanh.png')">
			<tr style="background-color: transparent;"></tr>
			<tr style="background-color: transparent;">
				<th align="left">Khoa :<br>
					<select name = "cboKhoa" id = "cboKhoa" onchange="selectKhoa('1')">
						<option>Khoa trung tam</option>
					</select>
				</th>
				<th align="left">Lớp :<br>
					<select name ="cboLop" id ="cboLop" onchange="selectLopHoc('1');">
						<option> </option>
					</select>
				</th>
				<th align="left">Năm học :<br>
					<select name="cboNamHoc" id="cboNamHoc"  onchange="selectNamHoc('1');">
						<option>2011 - 2012</option>
					</select>
				</th>
				<th align="left">Thời gian :<br>
					<select name="cboThoiGian" id="cboThoiGian" >
						<option value = "" >ALL</option>	
						<c:forEach var="iterater" begin="61" end="72" step="1">
							<option value="${iterater}" <c:if test = "${iterater eq param.ThoiGian}">selected</c:if>>Tháng ${iterater - 60}</option>
						</c:forEach>
						<option value = "" <c:if test = "${param.tuan eq 0}">selected</c:if>>--------------</option>
						<c:forEach var="iterater" begin="1" end="52" step="1">
							<option value="${iterater}" <c:if test = "${iterater eq param.ThoiGian}">selected</c:if>>Tuần ${iterater}</option>
						</c:forEach>
						<option value = "" <c:if test = "${param.tuan eq 0}">selected</c:if>>--------------</option>
						
					</select>
				</th>
				<td rowspan="2"><input type="button" value="tim kiếm" name="FormHienThiTTGV" id="FormHienThiTTGV" onclick="submitSearch();"/></td>
			</tr>
			<tr style="background-color: transparent;">
				<th align="left">Giáo viên :<br>
					<select name="cboGiaoVien" id="cboGiaoVien" onchange="selectGiaoVien('1');">
						<option></option>
					</select>
				</th>
				<th align="left" colspan="2">Môn học :<br>
					<select name="cboMonHoc" id="cboMonHoc" >
						<option>Work With DataBase</option>
					</select>
				</th>
				<th align="left">Tình trạng :<br>
					<select>
						<option value="5">ALL</option>
						<option value="4">Đã Dạy</option>
						<option value="0">Vắng</option>
					</select>
				</th>
			</tr>
			<tr style="background-color: transparent;"></tr>
		</table>
		<%
			String Khoa = "", Lop = "", NamHoc = "", GiaoVien = "", MonHoc = "",ThoiGian="";
			if(request.getParameter("Khoa") != null)
				Khoa = request.getParameter("Khoa");
			if(request.getParameter("Lop") != null)
				Lop = request.getParameter("Lop");
			if(request.getParameter("NamHoc") != null)
				NamHoc = request.getParameter("NamHoc");
			if(request.getParameter("GiaoVien") != null)
				GiaoVien = request.getParameter("GiaoVien");
			if(request.getParameter("MonHoc") != null)
				MonHoc = request.getParameter("MonHoc");
			if(request.getParameter("ThoiGian") != null)
				ThoiGian = request.getParameter("ThoiGian");
			int stt = 1 ;
			if(Khoa!="" && Lop!="" && NamHoc!="" && GiaoVien!="" && MonHoc!=""){
		%>
			<c:set 	var = "ListGiaoVien" value = '<%=DiemDanhDAO.getGiaoVienByDieuKien(Khoa,Lop,NamHoc,GiaoVien, MonHoc,ThoiGian) %>' scope="session"></c:set>
		<%
			}
		 %>
		<br /><br /><font size="4" style="text-align: left;" color="#0000FF">Kết Quả Tìm Kiếm</font><br /><br />
		<table border="1" width="800px" style="background-image: url('../../images/background_diemdanh.png');background-repeat: repeat-y">
			<tr style="background-color: transparent;">
			<th style="background-color: #0000FF"><div class="div_textWhite">STT</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Giáo viên</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Môn học</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Ngày dạy</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Buổi</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Hình Thức dạy</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Phòng</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Bắt đầu</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Kết thúc</div></th>
			<th style="background-color: #0000FF"><div class="div_textWhite">Thời gian dạy</div></th>
			</tr>
			<c:forEach var="obj" items = "${ListGiaoVien}">
			<tr style="background-color: transparent;">
			<td><%=stt %></td>
			<td>
				<a href="<%=request.getContextPath() %>/DiemDanh/HocSinh/BaoCaoDiemDanhHS.jsp?Khoa=${obj.maKhoa }&Lop=${obj.maLop }&NamHoc=${obj.maNamHoc }&HocSinh=&MonHoc=${obj.maMonHoc }&Nhom=<c:if test="${obj.nhom ne ''}">${obj.nhom}</c:if>&NgayHoc=${obj.ngayBatDau}">
					${obj.tenGiaoVien}
				</a>
			</td>
			<td>${obj.tenMonHoc}</td>
			<td>${obj.ngayBatDau}</td>
			<td>${obj.buoi}<c:if test="${obj.nhom ne ''}"> - Nhóm ${obj.nhom}</c:if></td>
			<td>${obj.hinhThucDay}</td>
			<td>${obj.tenPhong}</td>
			<td>${obj.gioBatDau }</td>
			<td>${obj.gioKetThuc }</td>
			<td>${obj.gioGiangDay }</td>
			</tr>
			<% stt++; %>
			</c:forEach>
		</table>
		<br /><br /><input type="button" value="In kết quả" onclick =""/>
	</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</div>
</body>
</html>