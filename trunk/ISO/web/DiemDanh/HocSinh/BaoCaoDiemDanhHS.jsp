<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.DiemDanhDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp" />
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
	var nhomList = new Array();
	var monHocList = new Array();
	var hocSinhList = new Array();
	
	function pageLoad(){
	<% 
	ArrayList<KhoaModel> khoaList;
	khoaList = DiemDanhDAO.getThongTinHocSinhReport(
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
				out.print("var arrNamHoc = new Array();");
				out.print("objLopHoc.namHocList = arrNamHoc;");
				out.print("arrLopHoc[arrLopHoc.length]=objLopHoc;");
				for(int k=0;k<khoaList.get(i).getLopHocList().get(j).getNamHocList().size();k++) {
					out.print("var objNamHoc = new Object();");
					out.print("objNamHoc.maNamHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getMaNamHoc() + "';");
					out.print("objNamHoc.namBatDau = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNamBatDau() + "';");
					out.print("var arrNhom = new Array();");
					out.print("objNamHoc.nhomList = arrNhom;");
					out.print("arrNamHoc[arrNamHoc.length]=objNamHoc;");
					for(int m=0;m<khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().size();m++) {
						out.print("var objNhom = new Object();");
						out.print("objNhom.nhom = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getNhom() + "';");
						out.print("var arrMonHoc = new Array();");
						out.print("var arrHocSinh = new Array();");
						out.print("objNhom.monHocList =arrMonHoc;");
						out.print("objNhom.thanhVienList =arrHocSinh;");
						out.print("arrNhom[arrNhom.length]=objNhom;");
						for(int n=0;n<khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getMonHocList().size();n++) {
							out.print("var objMonHoc = new Object();");
							out.print("objMonHoc.maMonHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getMonHocList().get(n).getMaMonHoc() + "';");
							out.print("objMonHoc.tenMonHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getMonHocList().get(n).getTenMonHoc() + "';");
							out.print("objMonHoc.maGiaoVien= '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getMonHocList().get(n).getUser1() + "';");
							out.print("objMonHoc.tenGiaoVien = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getMonHocList().get(n).getUser2() + "';");
							out.print("arrMonHoc[arrMonHoc.length] = objMonHoc;");
						}
						for(int n=0;n<khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getThanhVienList().size();n++) {
							out.print("var objHocSinh = new Object();");
							out.print("objHocSinh.maThanhVien = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getThanhVienList().get(n).getMaThanhVien() + "';");
							out.print("objHocSinh.tenThanhVien = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNhomList().get(m).getThanhVienList().get(n).getTenThanhVien() + "';");
							out.print("arrHocSinh[arrHocSinh.length] = objHocSinh;");
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
					var opt = new Option(objNamHoc.namBatDau, objNamHoc.maNamHoc);
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
		document.getElementById('cboNhom').innerHTML = '';
		for(var i=0;i<namHocList.length;i++)
		{
			var objNamHoc = new Object();
			objNamHoc = namHocList[i];
			if(objNamHoc.maNamHoc == maNam)
			{
				nhomList = objNamHoc.nhomList;
				for(var j=0;j<nhomList.length;j++)
				{
					var objNhom = new Object();
					objNhom = nhomList[j];
					var opt = new Option(objNhom.nhom,objNhom.nhom);
					document.getElementById('cboNhom').add(opt, undefined);
				}
				break;
			}
		}
		selectNhom(x);
	}
	function selectNhom(x)
	{
		if(x == 2)
			document.getElementById('cboNhom').value = <%="'" + request.getParameter("Nhom") + "'"%>;
		var maNhom = document.getElementById("cboNhom").value;
		document.getElementById('cboMonHoc').innerHTML = '';
		document.getElementById('cboGiaoVien').innerHTML = '';
		document.getElementById('cboHocSinh').innerHTML = '';
		for(var i=0;i<nhomList.length;i++)
		{
			var objNhom = new Object();
			objNhom = nhomList[i];
			if(objNhom.nhom == maNhom)
			{
				hocSinhList = objNhom.thanhVienList;
				for(var j=0;j<hocSinhList.length;j++)
				{
					var objHocSinh = new Object();
					objHocSinh = hocSinhList[j];

					var opt = new Option(objHocSinh.tenThanhVien, objHocSinh.maThanhVien);
					document.getElementById('cboHocSinh').add(opt, undefined);
				}
			
				monHocList = objNhom.monHocList;
				for(var j=0;j<monHocList.length;j++)
				{
					var objMonHoc = new Object();
					objMonHoc = monHocList[j];
					var opt2 = new Option(objMonHoc.tenGiaoVien, objMonHoc.maGiaoVien);
					document.getElementById('cboGiaoVien').add(opt2, undefined);
					var opt = new Option(objMonHoc.tenMonHoc, objMonHoc.maMonHoc);
					document.getElementById('cboMonHoc').add(opt, undefined);
					
				}
				break;
			}
		}
		selectMonHoc(x);
		selectHocSinh(x);
	}
	
	function selectMonHoc(x)
	{
		if(x == 2)
			document.getElementById('cboMonHoc').value = <%="'" + request.getParameter("MonHoc") + "'"%>;
		var maMonHoc = document.getElementById("cboMonHoc").value;
		for(var j=0;j<monHocList.length;j++)
		{
			var objMonHoc = new Object();
			objMonHoc = monHocList[j];
			if(objMonHoc.maMonHoc==maMonHoc){
				document.getElementById('cboGiaoVien').value = objMonHoc.maGiaoVien;
				break;
			}
		}
	}
	function selectHocSinh(x)
	{
		if(x == 2)
			document.getElementById('cboHocSinh').value = <%="'" + request.getParameter("HocSinh") + "'"%>;
	}

	function submitSearch()
	{
		document.forms["FormHienThiTTHS"].submit();
	}
</script>


<title>Hệ Thống Quản Lý (Điểm Danh)</title>
</head>
<body onload="pageLoad()">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_diemdanh.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/>
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Báo Cáo Tiến Độ Học Tập Học Sinh</div></td></tr>
	</table><br/><br/>
	<form action="<%=request.getContextPath()%>/DiemDanhController" id = "FormHienThiTTHS" name = "FormHienThiTTHS" method="post">
		<input type = "hidden" name="actionType" id="actionType" value="HienThiTTHS" />
		<font size="4" style="text-align: left;" color="#0000FF">Thông Tin Tìm Kiếm</font><br /><br />
		<table style="background-image: url('../../images/background_diemdanh.png')">
			<tr style="background-color: transparent;"></tr>
			<tr style="background-color: transparent;">
				<th align="left">Khoa :<br/>
					<select name = "cboKhoa" id = "cboKhoa" onchange="selectKhoa('1')">
						<option></option>
					</select>
				</th>
				<th align="left">Lớp :<br/>
					<select name ="cboLop" id ="cboLop" onchange="selectLopHoc('1');">
						<option></option>
					</select>
				</th>
				<th align="left">Năm học :<br/>
					<select name="cboNamHoc" id="cboNamHoc"  onchange="selectNamHoc('1');">
						<option></option>
					</select>
				</th>
				<th align="left">Nhóm :<br/>
					<select name="cboNhom" id="cboNhom" onchange="selectNhom('1');">
						<option></option>
					</select>
				</th>
			</tr>
			<tr style="background-color: transparent;">
				<th align="left">Môn Học :<br/>
					<select name = "cboMonHoc" id = "cboMonHoc" onchange="selectMonHoc('1')">
						<option></option>
					</select>
				</th>
				<th align="left">Giáo Viên :<br/>
					<select name ="cboGiaoVien" id ="cboGiaoVien" disabled="disabled">
						<option></option>
					</select>
				</th>
				<th align="left">Học Sinh :<br/>
					<select name="cboHocSinh" id="cboHocSinh" onchange="selectHocSinh('1');">
						<option></option>
					</select>
				</th>
				<th><input type="button" value="Tìm Kiếm" onclick="submitSearch()" /></th>
			</tr>
			<tr style="background-color: transparent;"></tr>
		</table>
		<%
			String Khoa = "", Lop = "", NamHoc = "", HocSinh = "", MonHoc = "",Nhom="";
			if(request.getParameter("Khoa") != null)
				Khoa = request.getParameter("Khoa");
			if(request.getParameter("Lop") != null)
				Lop = request.getParameter("Lop");
			if(request.getParameter("NamHoc") != null)
				NamHoc = request.getParameter("NamHoc");
			if(request.getParameter("HocSinh") != null)
				HocSinh = request.getParameter("HocSinh");
			if(request.getParameter("MonHoc") != null)
				MonHoc = request.getParameter("MonHoc");
			if(request.getParameter("Nhom") != null)
				Nhom = request.getParameter("ThoiGian");
			int stt = 1 ;
			if(Khoa!="" && Lop!="" && NamHoc!="" && HocSinh!="" && MonHoc!=""){
		%>
			<c:set 	var = "ListHocSinh" value = '<%=DiemDanhDAO.getHocSinhByDieuKien(Khoa,Lop,NamHoc,HocSinh, MonHoc,Nhom) %>' scope="session"></c:set>
		<%
			}
		 %>
		<br /><br /><font size="4" style="text-align: left;" color="#0000FF">Kết Quả Tìm Kiếm</font><br /><br />
		<table border="1" width="800px" style="background-image: url('../../images/background_diemdanh.png');background-repeat: repeat-y">
			<tr style="background-color: transparent;">
				<th style="background-color: #0000FF"><div class="div_textWhite">STT</div></th>
				<th style="background-color: #0000FF"><div class="div_textWhite">Môn học</div></th>
				<th style="background-color: #0000FF"><div class="div_textWhite">Giáo Viên</div></th>
				<th style="background-color: #0000FF"><div class="div_textWhite">Học Sinh</div></th>
				<th style="background-color: #0000FF"><div class="div_textWhite">Ngày học</div></th>
				<th style="background-color: #0000FF"><div class="div_textWhite">Bắt đầu</div></th>
				<th style="background-color: #0000FF"><div class="div_textWhite">Kết thúc</div></th>
				<th style="background-color: #0000FF"><div class="div_textWhite">Thời gian học</div></th>
			</tr>
			<c:set var="n" value="1"></c:set>
			<c:forEach var="DDHocSinh" items="${ListHocSinh}">
				<tr style="background-color: transparent;">
					<td>${n }</td>
					<td>${DDHocSinh.tenMonHoc }</td>
					<td>${DDHocSinh.tenGiaoVien }</td>
					<td>${DDHocSinh.tenHocSinh }</td>
					<td>${DDHocSinh.ngayBatDau }</td>
					<td>${DDHocSinh.gioBatDau }</td>
					<td>${DDHocSinh.gioKetThuc }</td>
					<td>${DDHocSinh.gioGiangDay }</td>
				</tr>
				<c:set var="n" value="${n+1}"></c:set>
			</c:forEach>
		</table>
		<br /><br /><input type="button" value="In kết quả" />
	</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</div>
</body>
</html>