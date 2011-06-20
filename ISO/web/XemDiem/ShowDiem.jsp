<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>

<%@page import="vn.edu.hungvuongaptech.dao.HocKyDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>

<%@page import="vn.edu.hungvuongaptech.dao.XemDiemDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel"%>
<%@page import="com.sun.org.apache.xml.internal.dtm.Axis"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.HocKyModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietDiemModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.BaiKiemTraDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.DangKyMonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%><html>
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
<script type="text/javascript" language="JavaScript">
	
</script> 
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title> Xem Điểm</title>
<script type="text/javascript" language="JavaScript">
var khoaList = new Array();
var lopHocList = new Array();
var namHocList = new Array();
var hocKiList = new Array();
var monHocTKBList = new Array();
var diem = 0;
var TBHocKy = 0;
var soMonHoc = 0;
function pageLoad()
{
<%	
	String maSinhVien = "", hocKyChon = "";
	ArrayList<ChiTietThanhVienModel> sinhVienList = new ArrayList<ChiTietThanhVienModel>();
	ArrayList<DangKyMonHocModel> dangKyMonHocList = new ArrayList<DangKyMonHocModel>();
	String maVaiTro = (String)session.getAttribute("maVaiTro");
	String maMonHocTKB = "" ,maMonHoc = "", maGiaoVien = "";
	ArrayList<KhoaModel> khoaList;
if(!maVaiTro.equals(Constant.MA_VAI_TRO_HS)) { 
	khoaList = XemDiemDAO.getDieuKienXemDiemOfGiaoVien();
	
	if(request.getParameter("monHocTKB") != null) {
		maMonHocTKB = request.getParameter("monHocTKB");
		maMonHoc = request.getParameter("monHoc");
		maGiaoVien = request.getParameter("maGiaoVien");
	}
	else {
		if(khoaList.size() > 0) {
			maMonHocTKB = khoaList.get(0).getLopHocList().get(0).getNamHocList().get(0).getHocKyList().get(0).getMonHocTKBList().get(0).getMaMonHocTKB();
			maMonHoc = khoaList.get(0).getLopHocList().get(0).getNamHocList().get(0).getHocKyList().get(0).getMonHocTKBList().get(0).getMaMonHoc();
			maGiaoVien = khoaList.get(0).getLopHocList().get(0).getNamHocList().get(0).getHocKyList().get(0).getMonHocTKBList().get(0).getMaGiaoVien();
		}
	}
	if(khoaList.size() > 0)
		out.print("document.getElementById('cboKhoa').innerHTML = '';");
	for(int i=0;i<khoaList.size();i++) {
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
			for(int k=0;k<khoaList.get(i).getLopHocList().get(j).getNamHocList().size();k++) {
				out.print("var objNamHoc = new Object();");
				out.print("objNamHoc.maNamHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getMaNamHoc() + "';");
				out.print("objNamHoc.namBatDau = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNamBatDau() + "';");
				out.print("objNamHoc.namKetThuc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getNamKetThuc() + "';");
				out.print("var arrHocKi = new Array();");
				for(int m=0;m<khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getHocKyList().size();m++) {
					out.print("var objHocKi = new Object();");
					out.print("objHocKi.hocKi = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getHocKyList().get(m).getHocKy() + "';");
					out.print("var arrMonHocTKB = new Array();");
					for(int n=0;n<khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getHocKyList().get(m).getMonHocTKBList().size();n++) {
						out.print("var objMonHocTKB = new Object();");
						out.print("objMonHocTKB.maMonHocTKB = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getHocKyList().get(m).getMonHocTKBList().get(n).getMaMonHocTKB() + "';");
						out.print("objMonHocTKB.tenMonHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getHocKyList().get(m).getMonHocTKBList().get(n).getTenMonHoc() + "';");
						out.print("objMonHocTKB.tenGiaoVien = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getHocKyList().get(m).getMonHocTKBList().get(n).getTenGiaoVien() + "';");
						out.print("objMonHocTKB.maMonHoc = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getHocKyList().get(m).getMonHocTKBList().get(n).getMaMonHoc() + "';");
						out.print("objMonHocTKB.maGiaoVien = '" + khoaList.get(i).getLopHocList().get(j).getNamHocList().get(k).getHocKyList().get(m).getMonHocTKBList().get(n).getMaGiaoVien() + "';");
						out.print("arrMonHocTKB[arrMonHocTKB.length] = objMonHocTKB;");
					}
					out.print("objHocKi.monHocTKBList = arrMonHocTKB;");
					out.print("arrHocKi[arrHocKi.length] = objHocKi;");
				}
				out.print("objNamHoc.hocKiList = arrHocKi;");
				out.print("arrNamHoc[arrNamHoc.length] = objNamHoc;");
			}
			out.print("objLopHoc.namHocList = arrNamHoc;");
			out.print("arrLopHoc[arrLopHoc.length] = objLopHoc;");
		}
		out.print("objKhoa.lopHocList = arrLopHoc;");
		out.print("khoaList[khoaList.length] = objKhoa;");
	}
	out.print("selectKhoa(2);");
} else {
	String namHoc = "na", hocKi = "na";
	out.print("var arrHocKi = new Array();");
	ArrayList<ThoiKhoaBieuModel> list = ThoiKhoaBieuDAO.getAllThoiKhoaBieuApproveByMaLop((String) session.getAttribute("maLop"));
	sinhVienList = ChiTietThanhVienDAO.getAllChiTietThanhVienByMaLop((String) session.getAttribute("maLop"));
	if(list.size() > 0)
		out.print("document.getElementById('cboNamHoc').innerHTML = '';");
	for(int i=0;i<list.size();i++) {
		if(!hocKi.equals(list.get(i).getHocKi()) || !namHoc.equals(list.get(i).getNam1())) {
			out.print("arrHocKi[arrHocKi.length] = '" + list.get(i).getHocKi() + "';");
		}
		if(!namHoc.equals(list.get(i).getNam1())) {
			out.print("var namHoc = new Object();");
			out.print("namHoc.nam1 = '" + list.get(i).getNam1() + "';");
			out.print("namHoc.nam2 = '" + list.get(i).getNam2() + "';");
			out.print("namHoc.hocKiList = arrHocKi;");
			out.print("var arrHocKi = new Array();");
			out.print("var opt = new Option(namHoc.nam1 + '-' + namHoc.nam2, namHoc.nam1);");
			out.print("document.getElementById('cboNamHoc').add(opt,undefined);");
			out.print("namHocList[namHocList.length] = namHoc;");
		}
			
	}
	out.print("document.getElementById('cboNamHoc').value = '" + request.getParameter("namHoc") + "';");
	out.print("selectNamHocSinhVien();");
	out.print("document.getElementById('cboHocKy').value = '" + request.getParameter("hocKi") + "'");
	if(request.getParameter("maSinhVien") != null) {
		maSinhVien = request.getParameter("maSinhVien");
		hocKyChon = request.getParameter("hocKyChon");
	}
	else {
		maSinhVien = (String) request.getSession().getAttribute("maThanhVien");
		hocKyChon = list.get(0).getHocKi();
	}
}

%>
	
}
function selectKhoa(x)
{
	if(x == 2)
		document.getElementById("cboKhoa").value = <%="'" + request.getParameter("khoa") + "'"%>;
	if(document.getElementById("cboKhoa").value != '') {
		var maKhoa = document.getElementById("cboKhoa").value;
		document.getElementById('cboLopHoc').innerHTML = '';
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
					document.getElementById('cboLopHoc').add(opt, undefined);
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
		document.getElementById('cboLopHoc').value = <%="'" + request.getParameter("lop") + "'"%>;
	var maLop = document.getElementById("cboLopHoc").value;
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
	selectNamHoc(x);
}
function selectNamHoc(x)
{
	if(x== 2)
		document.getElementById('cboNamHoc').value = <%="'" +request.getParameter("namHoc") + "'"%>;
	var maNam = document.getElementById("cboNamHoc").value;
	document.getElementById('cboHocKy').innerHTML = '';
	for(var i=0;i<namHocList.length;i++)
	{
		var objNamHoc = new Object();
		objNamHoc = namHocList[i];
		if(objNamHoc.maNamHoc == maNam)
		{
			hocKiList = objNamHoc.hocKiList;
			for(var j=0;j<hocKiList.length;j++)
			{
				var objHocKi = new Object();
				objHocKi = hocKiList[j];
				var opt = new Option(objHocKi.hocKi, objHocKi.hocKi);
				document.getElementById('cboHocKy').add(opt, undefined);
			}
			break;
		}
	}
	selectHocKi(x);
}
function selectHocKi(x)
{
	if(x == 2)
		document.getElementById('cboHocKy').value = <%="'" + request.getParameter("hocKi") + "'"%>;
	var hocKy = document.getElementById("cboHocKy").value;
	document.getElementById('cboMonHoc').innerHTML = '';
	for(var i=0;i<hocKiList.length;i++)
	{
		var objHocKi = new Object();
		objHocKi = hocKiList[i];
		if(objHocKi.hocKi == hocKy)
		{
			monHocTKBList = objHocKi.monHocTKBList;
			for(var j=0;j<monHocTKBList.length;j++)
			{
				var objMonHocTKB = new Object();
				objMonHocTKB = monHocTKBList[j];
				var opt = new Option(objMonHocTKB.tenMonHoc, objMonHocTKB.maMonHocTKB);
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
		document.getElementById('cboMonHoc').value = <%="'" + maMonHocTKB + "'"%>;
	var maMonHocTKB = document.getElementById("cboMonHoc").value;
	document.getElementById('txtGiaoVien').value = '';
	for(var i=0;i<monHocTKBList.length;i++)
	{
		var objMonHocTKB = new Object();
		objMonHocTKB = monHocTKBList[i];
		if(objMonHocTKB.maMonHocTKB == maMonHocTKB)
		{
			document.getElementById('txtGiaoVien').value = objMonHocTKB.tenGiaoVien;
			document.getElementById('txtMaMonHoc').value = objMonHocTKB.maMonHoc;
			document.getElementById('txtMaGiaoVien').value = objMonHocTKB.maGiaoVien;
			break;
		}
	}
}
function selectNamHocSinhVien()
{
	var nam1 = document.getElementById("cboNamHoc").value;
	document.getElementById('cboHocKy').innerHTML = '';
	for(var i=0;i<namHocList.length;i++)
	{
		var objNamHoc = new Object();
		objNamHoc = namHocList[i];
		if(objNamHoc.nam1 == nam1)
		{
			hocKiList = objNamHoc.hocKiList;
			for(var j=0;j<hocKiList.length;j++)
			{
				var opt = new Option(hocKiList[i], hocKiList[i]);
				document.getElementById('cboHocKy').add(opt, undefined);
			}
			break;
		}
	}
}

function search()
{
	document.getElementById('actionType').value = 'GiaoVien';
	document.forms['ShowDiem'].submit();
}
function searchOfSinhVien()
{
	document.getElementById('actionType').value = 'SinhVien';
	document.forms['ShowDiem'].submit();
}
function capNhat()
{
	document.getElementById('actionType').value = 'CapNhatDiem';
	document.forms['ShowDiem'].submit();
}

</script>
</head>
<body onload="pageLoad();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_XemDiem.jsp" />
	<!-- E HEAD CONTENT -->
<form action="<%=request.getContextPath()%>/XemDiemController" name = "ShowDiem" method="post">
<input type = "hidden" value = "" name = "actionType" id = "actionType"/>
<c:set var="MaThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
<c:set var = "VaiTroSV" value="<%=Constant.MA_VAI_TRO_HS%>"/>
	<c:if test="${sessionScope.maVaiTro eq VaiTroSV}" >
		
		<c:set var = "MonHocList" value = '<%=XemDiemDAO.getShowDiemSinhVien(maSinhVien, hocKyChon, (String)session.getAttribute("maLop")) %>'/>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="9"><div class = "div_thanhvientieude">Bảng Điểm</div></td></tr>
			
			<tr style="background-color: transparent;">
				
				<th style="background-color: #99bff9" align="right">
					Tên SV
				</th>
				<th style="background-color: #99bff9" align="left">
					<c:choose>
						<c:when test = "${empty param.maSinhVien}">
							<c:set var = "MaSV" value = "${MaThanhVien}"/>
						</c:when>
						<c:otherwise>
							<c:set var = "MaSV" value = "${param.maSinhVien}"/>
						</c:otherwise>
					</c:choose>
					<c:set var = "SinhVienList" value = "<%=sinhVienList %>"/>
					<select name="cboTenSV" id="cboTenSV">
						<c:forEach var="SinhVien" items="${SinhVienList}">
							<c:set var = "i" value = "1"/>
							<option value="${SinhVien.maThanhVien }" <c:if test = "${MaSV eq SinhVien.maThanhVien}">selected</c:if>>${SinhVien.hoThanhVien} ${SinhVien.tenLot} ${SinhVien.tenThanhVien }</option>
						</c:forEach>
						<c:if test="${empty i}">
							<option value = "">Không có</option>
						</c:if>
					</select>
				</th>
				
				<th style="background-color: #99bff9" align="left">
					Lớp học
				</th>
				<th style="background-color: #99bff9" align="left">
					<input type="text" id="txtLopHoc" readonly="readonly" size="10" value="<%= (String) session.getAttribute("kiHieuLop")%>"></input>
				</th>
				
				<th style="background-color: #99bff9" align="left">
					Năm học
				</th>
				<th style="background-color: #99bff9" align="left">
					<select id = "cboNamHoc" name = "cboNamHoc" onchange="selectNamHocSinhVien()">
						<option value = "">Không có</option>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Học kỳ
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboHocKy" id="cboHocKy">
						<option value = "">Không có</option>
					</select>
				</th>
				
				<th style="background-color: #99bff9">
					<a href = "javascript: searchOfSinhVien()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</th>
			</tr>
		</table>
		<%
			int count = 0, count1 = 0, count2 = 1; 
		%>
		<table border = "1" style="background-color: transparent;">
			
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên môn học</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên bài kiểm tra</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Điểm</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Điểm TB</div></th>
			</tr>
			
			<%int c = 0, c1 = 0; boolean check = true;%>
			<c:set  var="TBM_HocKy" value="0"></c:set>
			<c:forEach var = "MonHoc" items="${MonHocList}">
				<%c++;%>
				<script type="text/javascript" language="JavaScript">
					<%
						if(c != 1) {
							out.print("document.getElementById('td1_" + (c-1) + "').rowSpan = " + c1 + ";");
							out.print("document.getElementById('td2_" + (c-1) + "').rowSpan = " + c1 + ";");
							out.print("if(document.getElementById('td3_" + (c-1) + "') != null) {");
								out.print("document.getElementById('td3_" + (c-1) + "').rowSpan = " + c1 + ";");
								out.print("soMonHoc++;");
								out.print("TBHocKy += parseFloat(document.getElementById('td3_" + (c-1) + "').innerHTML);}");
						}
						c1 = 0;
					%>
				</script>
				<tr style="background-color: transparent;">
					<td id = "td1_<%=c %>"><%= c %></td>
					<td id = "td2_<%=c %>">${MonHoc.tenMonHoc }</td>
					<c:choose>
						<c:when test = "${MonHoc.chiTietDiemList[0].maChiTietDiem ne null and MonHoc.chiTietDiemList[0].maChiTietDiem ne ''}">
							<td>${MonHoc.chiTietDiemList[0].tenBaiKiemTra}</td>
							<td>${MonHoc.chiTietDiemList[0].diem}</td>
							<td id = "td3_<%=c %>">${MonHoc.diemTrungBinh}</td>
						</c:when>
						<c:otherwise>
							<td colspan="3">Chưa có</td>
							<%c1 = 1; %>
						</c:otherwise>
					</c:choose>
				</tr>
				<c:forEach var = "ChiTietDiem" items="${MonHoc.chiTietDiemList}">
					<%c1++; %>
					<c:set var = "temp" value = "<%=c1 %>"/>
					<c:if test="${temp ne 1}">						
						<tr style="background-color: transparent;">
							<td>${ChiTietDiem.tenBaiKiemTra}</td>
							<td>${ChiTietDiem.diem}</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:forEach>
				<script type="text/javascript" language="JavaScript">
					<%
						out.print("document.getElementById('td1_" + c + "').rowSpan = " + c1 + ";");
						out.print("document.getElementById('td2_" + c + "').rowSpan = " + c1 + ";");
						out.print("if(document.getElementById('td3_" + c + "') != null){");
							out.print("document.getElementById('td3_" + c + "').rowSpan = " + c1 + ";");
							out.print("soMonHoc++;");
							out.print("TBHocKy += parseFloat(document.getElementById('td3_" + (c) + "').innerHTML);}");
					%>
					
				</script>
			
			<tr style="background-color: transparent;">		
				<th colspan="4" bgcolor = "#186fb2"><div class = "div_textWhite">Điểm Trung Bình Học Kỳ</th>
				<td id="txtTBMHocKy"></td>
			</tr>
			
			<script type="text/javascript" language="JavaScript">
				document.getElementById("txtTBMHocKy").innerHTML = (TBHocKy/soMonHoc).toFixed(2);
			</script>
		</table>
	</c:if>
	
	<c:if test="${sessionScope.maVaiTro ne VaiTroSV}">
	<c:choose>
		<c:when test = "${empty param.capNhat}">
			<c:set var = "SinhVienList" value = "<%=XemDiemDAO.getShowDiem(maMonHocTKB) %>" scope="session"/>
		</c:when>
		<c:otherwise>
			<c:set var = "SinhVienList" value = '<%=(ArrayList<DangKyMonHocModel>) session.getAttribute("dangKyMonHocList")  %>' scope="session"/>
		</c:otherwise>
	</c:choose>	
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="7"><div class = "div_thanhvientieude">Danh Sách Điểm</div></td></tr>
			
			<tr style="background-color: transparent;">
				<td colspan="10">
					<c:if test="${not empty param.CapNhat}">
						<b class="msg">Cập nhật điểm thành công !!!</b>
					</c:if>
					<c:if test="${not empty param.Error}">
						<b class="err">Cập nhật điểm thất bại !!!</b>
					</c:if>
				</td>
			</tr>
			
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9" align="left">
					Khoa
				</th>
				<th style="background-color: #99bff9" align="left">
			
					<select name="cboKhoa" id="cboKhoa" onchange="selectKhoa('1');">
						<option value = "">Không có</option>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Lớp
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboLopHoc" id="cboLopHoc" onchange="selectLopHoc('1');">
							<option value = "">Không có</option>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Năm học
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboNamHoc" id="cboNamHoc" onchange="selectNamHoc('1');">
						<option value = "">Không có</option>
					</select>
				</th>
				
				
				
				<th style="background-color: #99bff9" rowspan="2">
					<a href = "javascript: search()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</th>
			</tr>
			
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9" align="left">
					Học kỳ
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboHocKy" id="cboHocKy" onchange="selectHocKi('1');">
						<option value = "">Không có</option>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Môn học
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboMonHoc" id="cboMonHoc" onchange="selectMonHoc('1');">
						<option value = "">Không có</option>
					</select>
				</th>
				
				<th style="background-color: #99bff9" align="left">
					Giáo viên
				</th>
				<th style="background-color: #99bff9" align="left">
					<input type="text" id = "txtGiaoVien" readonly="readonly" value = "Không có"/>
				</th>
				
				
			</tr>
		</table>
		<%int count = 0, count1 = 0; %>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Mã Sinh Viên</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Tên sinh viên</div></th>
				<c:set var = "BaiKiemTraList" value = "<%=BaiKiemTraDAO.getAllBaiKiemTraByMaMonHocOrderByTenBaiKiemTra(maMonHoc) %>" scope="session"/>
				<c:forEach var = "BaiKiemTra" items = "${BaiKiemTraList}">
					<%count++; count1++; %>
					<c:set var = "count" value = "<%=count %>"/>
					<c:if test = "${(BaiKiemTra.maTenBaiKiemTra ne BaiKiemTraList[count].maTenBaiKiemTra and not empty BaiKiemTraList[count]) or empty  BaiKiemTraList[count]}">
						<th bgcolor = "#186fb2" colspan="<%=count1 %>"><div class = "div_textWhite">${BaiKiemTra.tenBaiKiemTra}</div></th>
						<%count1 = 0;%>
					</c:if>
				</c:forEach>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">TB môn</div></th>		
			</tr>
			<tr style="background-color: transparent;">
			<%count = 0; count1 = 0;%>
				<c:forEach var = "BaiKiemTra" items = "${BaiKiemTraList}">
					<%count++; count1++;%>
					<c:set var = "count" value = "<%=count %>"/>
					<td>Lần <%=count1 %></td>
					<c:if test = "${(BaiKiemTra.maTenBaiKiemTra ne BaiKiemTraList[count].maTenBaiKiemTra and not empty BaiKiemTraList[count]) or empty  BaiKiemTraList[count]}">
						 <%count1 = 0; %>
					</c:if>
				</c:forEach>			
			</tr>
			<%int c = 1, iterator = 0;%>
			<c:set var = "MaTenBaiKiemTra" value = "-1"/>
			<c:forEach var = "SinhVien" items="${SinhVienList}">
				<c:set var = "ListDiem" value = "${SinhVien.chiTietDiemList}"/>
				<c:set var = "i" value = "0"/>
				<tr style="background-color: transparent;">
					<td style="background-color: transparent;">
						<%= c %>
						<input type="hidden" name = "txtDangKiMonHoc<%=c%>" value = "${SinhVien.maDangKyMonHoc}"/>
					</td>
					<td style="background-color: transparent;"><div class = "div_txleft">${SinhVien.tenDangNhap}</div></td>
					<td style="background-color: transparent;"><div class = "div_txleft">${SinhVien.tenHocVien}</div></td>
					<c:forEach var = "BaiKiemTra" items="${BaiKiemTraList}">
						
						<td style="background-color: transparent;">
							
							<input type="text"  name= "txtDiem<%=c%>_<%=iterator %>" id = "txtDiem<%=c%>_<%=iterator %>" onblur = "kiemTraSo(<%=c + "," + iterator %>)" onfocus="getSoDiem(<%=c + "," + iterator %>)"
								<c:if test="${not empty ListDiem[i] and BaiKiemTra.maBaiKiemTra eq ListDiem[i].maBaiKiemTra}">
									value = "${ListDiem[i].diem}"	
									<c:set var = "i" value = "${i + 1}"/>
									<c:set var = "MaTenBaiKiemTra" value = "${BaiKiemTra.maTenBaiKiemTra}"/>
								</c:if>
							<input type = "hidden" id = "txtMaTenBaiKiemTra<%=c %>" value = "${MaTenBaiKiemTra }"/>	
							 size="5"/>			
						</td>
						<%iterator++; %>
					</c:forEach>
					<td style="background-color: transparent;">
						<input type="text" readonly="readonly" id = "txtTrungBinhMon<%=c %>" name = "txtTrungBinhMon<%=c %>" value = "${SinhVien.diemTrungBinh}" size="5"/>
					</td>
				</tr>
				<%c++; iterator = 0; %>
			</c:forEach>
		</table>
		<script type="text/javascript" language="JavaScript">
			function tinhDiemTrungBinh(x)
			{
				var size = <%=count%>;
				var tong = 0, soBai = 0;
				for(var i=0;i<size;i++)
				{
					if(document.getElementById('txtDiem' + x + '_' + i).value != '')
					{
						if(document.getElmentById('txtMaTenBaiKiemTra').value == <%="'" + Constant.MADIEMMIENG + "'"%>)
						{
							tong += parseFloat(document.getElementById('txtDiem' + x + '_' + i).value);
							soBai++;
						}
						else if(document.getElmentById('txtMaTenBaiKiemTra').value == <%="'" + Constant.MADIEM15 + "'"%> || document.getElmentById('txtMaTenBaiKiemTra').value == <%="'" + Constant.MADIEM1TIET + "'"%>)
						{
							tong += (parseFloat(document.getElementById('txtDiem' + x + '_' + i).value) * 2);
							soBai = soBai + 2;
						}
						else
						{
							tong += (parseFloat(document.getElementById('txtDiem' + x + '_' + i).value) * 3);
							soBai = soBai + 3;
						}
					}
				}
				var num = new Number(tong/soBai)
				if(soBai > 0)
					document.getElementById('txtTrungBinhMon' + x).value = num.toFixed(2);
				else
					document.getElementById('txtTrungBinhMon' + x).value = '';
			}
			function kiemTraSo(x, y)
			{
				var so = document.getElementById('txtDiem' + x + '_' + y).value;
				if(isNaN(so))
				{
					alert("Điểm phải là số");
					document.getElementById('txtDiem' + x + '_' + y).value = diem;
					document.getElementById('txtDiem' + x + '_' + y).focus();
				}
				else if (so >10) {
					alert("Điểm tối đa là 10");
					document.getElementById('txtDiem' + x + '_' + y).value = diem;
					document.getElementById('txtDiem' + x + '_' + y).focus();
				}
				else if (so.length >4){
					alert("Nhập điểm không hợp lệ");
					document.getElementById('txtDiem' + x + '_' + y).value = diem;
					document.getElementById('txtDiem' + x + '_' + y).focus();
				}
				else
				{
					if(so.match('-'))
					{
						alert('Không được nhập số âm');
						document.getElementById('txtDiem' + x + '_' + y).value = diem;
						document.getElementById('txtDiem' + x + '_' + y).focus();
					}
					else
						tinhDiemTrungBinh(x);
				}
			}
			function getSoDiem(x,y)
			{
				diem = document.getElementById('txtDiem' + x + '_' + y).value;
			}
		</script>
		<c:set var="maGiaoVien" value="<%= maGiaoVien %>"></c:set>
		<%System.out.println(maGiaoVien);
		System.out.println((String) session.getAttribute("maThanhVien"));
			
		%>
		<c:if test="${maGiaoVien eq MaThanhVien}">
			<table>
				<tr align="center">
					<td>
						<a href = "javascript: capNhat()">	
								<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
						</a>
					</td>
				</tr>
			</table>
		</c:if>
		<input type="hidden"  name="txtMaGiaoVien" id="txtMaGiaoVien"/>
	</c:if>
	<input type="hidden" value = "" name="txtMaMonHoc" id = "txtMaMonHoc"/>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>

</body>
</html>