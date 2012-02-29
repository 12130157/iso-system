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
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.BaiKiemTraModel"%>
<%@page import="vn.edu.hungvuongaptech.model.HocKiTungLopModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.HocKiTungLopDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SoDiemMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.BangDiemHocKiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.BangDiemHocKiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.SoDiemMonHocModel"%><html>
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
var lopHocList = new Array();
var namHocList = new Array();
var diem = 0;
var TBHocKy = 0;
var soMonHoc = 0;
var path = "HungVuongISO/XemDiem";
var monHocTC = "";
var namHocTC = "";
var hocKiTC = "";
var maHKTLTC = "";
var path = "";
function pageLoad()
{
<%	
	String maVaiTro = (String)session.getAttribute("maVaiTro");
	String maMonHocTKB = "" ,maMonHoc = "", maGiaoVien = "";
	SoDiemMonHocModel soDiemMonHoc = new SoDiemMonHocModel();
	BangDiemHocKiModel bangDiemHocKi = new BangDiemHocKiModel();
	ArrayList<HocKiTungLopModel> hocKiTungLopList = new ArrayList<HocKiTungLopModel>();
	ArrayList<DangKyMonHocModel> dangKyMonHocList = new ArrayList<DangKyMonHocModel>();
	if(maVaiTro.equals(Constant.MA_VAI_TRO_HS)) { 
		if(request.getParameter("MaNamHoc") != null) {
			out.print("namHocTC = '" + request.getParameter("MaNamHoc") + "';");
			out.print("hocKiTC = '" + request.getParameter("HocKi") + "';");
		}
		hocKiTungLopList = HocKiTungLopDAO.getHocKiTungLopByMaLop(request.getSession().getAttribute("maLop") + "");
		String maNamHoc = "na";
		out.print("var length1 = 0;");
		for(int i=0;i<hocKiTungLopList.size();i++) {
			HocKiTungLopModel hocKiTungLop = hocKiTungLopList.get(i);
			if(!maNamHoc.equals(hocKiTungLop.getMaNamHoc())) {
				out.print("var opt = new Option('" + hocKiTungLop.getNamHoc() + "', '" + hocKiTungLop.getMaNamHoc() + "');");
				out.print("document.getElementById('cboNamHoc').add(opt, undefined);");
				out.print("var namHoc = new Object();");
				out.print("namHoc.maNamHoc = '" + hocKiTungLop.getMaNamHoc() + "';");
				out.print("namHoc.namHoc = '" + hocKiTungLop.getNamHoc() + "';");
				out.print("var hocKiList = new Array();");
				out.print("namHoc.hocKiList = hocKiList;");
				out.print("var length2 = 0;");
				out.print("namHocList[length1] = namHoc;");
				out.print("length1++;");
				maNamHoc = hocKiTungLop.getMaNamHoc();
			}
			out.print("var hocKi = '" + hocKiTungLop.getHocKi() +  "';");
			out.print("hocKiList[length2] = hocKi;");
			out.print("length2++;");
		}
		out.print("document.getElementById('cboNamHoc').value = namHocTC;");	
		out.print("changeNamHocSinhVien();");
		if(request.getParameter("HocKi") != null) {
			out.print("document.getElementById('cboHocKy').value = hocKiTC;");
			dangKyMonHocList = XemDiemDAO.getShowDiemSinhVien(request.getSession().getAttribute("maThanhVien") + "", request.getParameter("HocKi") + "", (String)session.getAttribute("maLop"), request.getParameter("MaNamHoc") + "");
			bangDiemHocKi = BangDiemHocKiDAO.getBangDiemHocKiByHocKiAndMaLopAndMaNamHocAndMaSinhVien(request.getParameter("MaNamHoc") + "", request.getSession().getAttribute("maThanhVien") + "", request.getParameter("HocKi") + "", (String)session.getAttribute("maLop"));
		}
	}
	else {
		if(request.getParameter("MaNamHoc") != null) {
			out.print("namHocTC = '" + request.getParameter("MaNamHoc") + "';");
			out.print("hocKiTC = '" + request.getParameter("HocKi") + "';");
			hocKiTungLopList = HocKiTungLopDAO.getHocKiTungLopByMaNamHocAndHocKiAndMaGiaoVien(request.getParameter("MaNamHoc"), request.getParameter("HocKi"), request.getSession().getAttribute("maThanhVien") + "");
			out.print("var length1 = 0;");
			for(int i=0;i<hocKiTungLopList.size();i++) {
				HocKiTungLopModel hocKiTungLop = hocKiTungLopList.get(i);
				out.print("var lopHoc = new Object();");
				out.print("lopHoc.maLopHoc = '" + hocKiTungLop.getMaLop() + "';");
				out.print("lopHoc.maHKTL = '" + hocKiTungLop.getMaHocKiTungLop() + "';");
				out.print("lopHoc.kiHieuLop = '" + hocKiTungLop.getKiHieuLop() + "';");
				out.print("var opt = new Option('" + hocKiTungLop.getKiHieuLop() + "', '" + hocKiTungLop.getMaHocKiTungLop() + "');");
				out.print("document.getElementById('cboLop').add(opt, undefined);");
				out.print("var monHocTKBList = new Array();");
				out.print("var length2 = 0;");
				for(int j=0;j<hocKiTungLopList.get(i).getMonHocTKBList().size();j++) {
					MonHocTKBModel monHocTKB = hocKiTungLopList.get(i).getMonHocTKBList().get(j);
					out.print("var monHocTKB = new Object();");
					out.print("monHocTKB.maMonHocTKB = '" + monHocTKB.getMaMonHocTKB() + "';");
					out.print("monHocTKB.maMonHoc = '" + monHocTKB.getMaMonHoc() + "';");
					out.print("monHocTKB.tenMonHoc = '" + monHocTKB.getTenMonHoc() + "';");
					out.print("monHocTKBList[length2] = monHocTKB;");
					out.print("length2++;");
					//out.print("var opt = new Option('" + monHocTKB.getMaMonHocTKB() + "', '" + monHocTKB.getTenMonHoc() + "')");
					//out.print("document.getElementById('cboMonHoc').add(opt, undefined);");
				}
				out.print("lopHoc.monHocTKBList = monHocTKBList;");
				out.print("lopHocList[length1] = lopHoc;");
			}
			out.print("document.getElementById('cboNamHoc').value = namHocTC;");
			out.print("document.getElementById('cboHocKy').value = hocKiTC;");
			if(request.getParameter("maMonHocTKB") != null) {
				out.print("maHKTLTC = '" + request.getParameter("maHKTL") + "';");
				out.print("document.getElementById('cboLop').value = maHKTLTC;");
				out.print("document.getElementById('cboHocKy').value = hocKiTC;");
				out.print("changeLopHoc();");
				maMonHocTKB = request.getParameter("maMonHocTKB") + "";
				if(request.getAttribute("soDiemMonHoc") != null) {
					soDiemMonHoc = (SoDiemMonHocModel)request.getAttribute("soDiemMonHoc");
					out.print("path = 'HungVuongISO/XemDiem/';");
				} else
					soDiemMonHoc = SoDiemMonHocDAO.getSoDiemMonHocByMaMonHocTKB(maMonHocTKB);
				out.print("maMonHocTC = '" + request.getParameter("maMonHoc") + "-" + request.getParameter("maMonHocTKB") + "';");
				out.print("document.getElementById('cboMonHoc').value = '" + request.getParameter("maMonHocTKB") + "-" + request.getParameter("maMonHoc") + "';");
			}
		}
	}
	if(request.getParameter("monHocTKB") != null) {
		maMonHocTKB = request.getParameter("monHocTKB");
		maMonHoc = request.getParameter("monHoc");
		maGiaoVien = request.getParameter("maGiaoVien");
	}
	ArrayList<BaiKiemTraModel> baiKiemTraList =  BaiKiemTraDAO.getAllBaiKiemTraByMaMonHocOrderByTenBaiKiemTra(request.getParameter("maMonHoc"));
%>
	
}
function changeLopHoc()
{
	var maHKTL = document.getElementById("cboLop").value;
	document.getElementById('cboMonHoc').innerHTML = '';
	var opt = new Option('	---		Chọn	---	 ', '');
	document.getElementById('cboMonHoc').add(opt, undefined);
	for(var i=0;i<lopHocList.length;i++)
	{
		var lopHoc = new Object();
		lopHoc = lopHocList[i];
		if(lopHoc.maHKTL == maHKTL)
		{
			monHocTKBList = lopHoc.monHocTKBList;
			for(var j=0;j<monHocTKBList.length;j++)
			{
				var monHocTKB = new Object();
				monHocTKB = monHocTKBList[j];
				var opt = new Option(monHocTKB.tenMonHoc, monHocTKB.maMonHocTKB + "-" + monHocTKB.maMonHoc);
				document.getElementById('cboMonHoc').add(opt, undefined);
			}
			break;
		}
	}
}
function changeNamHocSinhVien()
{
	var maNamHoc = document.getElementById("cboNamHoc").value;
	document.getElementById('cboHocKy').innerHTML = '';
	var opt = new Option('	---		Chọn	---	 ', '');
	document.getElementById('cboHocKy').add(opt, undefined);
	for(var i=0;i<namHocList.length;i++)
	{
		var namHoc = new Object();
		namHoc = namHocList[i];
		if(namHoc.maNamHoc == maNamHoc)
		{
			hocKiList = namHoc.hocKiList;
			for(var j=0;j<hocKiList.length;j++)
			{
				var opt = new Option(hocKiList[j], hocKiList[j]);
				document.getElementById('cboHocKy').add(opt, undefined);
			}
			break;
		}
	}
}
function capNhat()
{
	document.getElementById('actionType').value = 'CapNhatDiem';
	document.forms['ShowDiem'].submit();
}
function selectNamHoc()
{
	var namHoc = document.getElementById('cboNamHoc').value;
	var hocKi = document.getElementById('cboHocKy').value;
	if(namHoc == '')
	{
		alert("Năm học chọn sai !!!");
		document.getElementById('cboLopHoc').value = namHocTC;
	}
	else if(hocKi != '')
	{
		location.href = path + "ShowDiem.jsp?MaNamHoc=" + namHoc + "&HocKi=" + hocKi;
	}
}
function selectHocKi()
{
	var namHoc = document.getElementById('cboNamHoc').value;
	var hocKi = document.getElementById('cboHocKy').value;
	if(hocKi == '') 
	{
		alert("Học kỳ chọn sai !!!");
		document.getElementById('cboHocKy').value = hocKiTC;
	}
	else if(namHoc != '')
	{
		location.href = path + "ShowDiem.jsp?MaNamHoc=" + namHoc + "&HocKi=" + hocKi;
	}
}
function selectLop()
{
	var namHoc = document.getElementById('cboNamHoc').value;
	var hocKi = doument.getElementById('cboHocKy').value;
	var lop = doument.getElementById('cboLop').value;
	var monHoc = document.getElementById('cboMonHoc').value;
	if(lop == '')
	{
		alert("Lớp chọn sai !!!");
		document.getElementById('cboLopHoc').value = maHKTLTC;
	}
	else
		changeLopHoc();
}
function selectMonHoc()
{
	var namHoc = document.getElementById('cboNamHoc').value;
	var hocKi = document.getElementById('cboHocKy').value;
	var lop = document.getElementById('cboLop').value;
	var str = document.getElementById('cboMonHoc').value.split("-");
	if(document.getElementById('cboMonHoc').value == '')
	{
		alert("Môn học chọn sai");
		document.getElementById('cboMonHoc').value = monHocTC;
	}
	else
		location.href = path + "ShowDiem.jsp?MaNamHoc=" + namHoc + "&HocKi=" + hocKi + "&maMonHoc=" + str[1] + "&maMonHocTKB=" + str[0] + "&maHKTL=" + lop;
	                  	
}
function getNamHoc(value)
{
	namHocTC = value;	
}
function getHocKi(value)
{
	hocKiTC = value;
}
function getLop(value)
{
	maHKTLTC = value;
}
function getMonHoc(value)
{
	monHocTC = value;
}
function guiSoDiem()
{
	document.getElementById('actionType').value = 'GuiSoDiem';
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
		<c:set var = "BangDiemHocKi" value = "<%=bangDiemHocKi %>"/>
		<c:set var = "MonHocList" value = "<%=dangKyMonHocList %>"/>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="9"><div class = "div_thanhvientieude">Bảng Điểm</div></td></tr>
			
			<tr style="background-color: transparent;">				
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
					<select id = "cboNamHoc" name = "cboNamHoc" onchange="changeNamHocSinhVien()" onclick = "getNamHoc(this.value);">
						<option value = "">		---		Chọn	---		</option>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Học kỳ
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboHocKy" id="cboHocKy" onclick="getHocKi();" onchange="selectHocKi(this.value);">
						<option value = "">		---		Chọn	---		</option>
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
					//var heSo = ${MonHoc.user1};
					<%
						//if(c != 1) {
							out.print("document.getElementById('td1_" + (c-1) + "').rowSpan = " + c1 + ";");
							out.print("document.getElementById('td2_" + (c-1) + "').rowSpan = " + c1 + ";");
							out.print("if(document.getElementById('td3_" + (c-1) + "') != null) {");
								out.print("document.getElementById('td3_" + (c-1) + "').rowSpan = " + c1 + ";}");
								//out.print("soMonHoc+=heSo;");
								//out.print("TBHocKy += parseFloat(document.getElementById('td3_" + (c-1) + "').innerHTML)*heSo;}");
						//}
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
		<c:choose>
			<c:when test = "${not empty param.HocKi}">
				Điểm TB các môn : ${BangDiemHocKi.diemTrungBinh }<br/>
				Điểm rèn luyện : ${BangDiemHocKi.diemRenLuyen }<br/>
				Điểm TB học kì : ${BangDiemHocKi.diemTBHocKi }<br/>
				Học lực : ${BangDiemHocKi.hocLuc }<br/>
				Hạnh kiểm : ${BangDiemHocKi.hanhKiem }
			</c:when>	
		</c:choose>
	</c:if>
	
	<c:if test="${sessionScope.maVaiTro ne VaiTroSV}">
	<c:set var = "SoDiemMonHoc" value = "<%=soDiemMonHoc %>" scope="session"/>	
		<c:choose>
			<c:when test="${param.CapNhat eq 'ThanhCong'}">
				Cập nhật điểm thành công
			</c:when>
			<c:when test="${param.CapNhat eq 'KoThanhCong'}">
				Cập nhật điểm không thành công
			</c:when>
			<c:when test="${param.Gui eq 'ThanhCong'}">
				Gửi sổ điểm thành công
			</c:when>
			<c:when test="${param.Gui eq 'KoThanhCong'}">
				Gửi sổ điểm không thành công
			</c:when>
		</c:choose>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="5"><div class = "div_thanhvientieude">Bảng Điểm Học Kỳ</div></td></tr>
			
			<tr style="background-color: transparent;">
								
				<th style="background-color: #99bff9" align="left">Năm học</th>
				
				<th style="background-color: #99bff9" align="left">
					<select name="cboNamHoc" id="cboNamHoc" onchange="selectNamHoc();" onclick="getNamHoc(this.value);">
						<option value = "">		---		Chọn	---		</option>
						<c:forEach var = "NamHoc" items="<%=NamHocDAO.getAllNamHoc() %>">
							<option value = "${NamHoc.maNamHoc }">${NamHoc.namBatDau } - ${NamHoc.namKetThuc }</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Học kỳ
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboHocKy" id="cboHocKy" onchange="selectHocKi();" onclick="getHocKi(this.value)">
						<option value = "">		---		Chọn	---		</option>
						<c:forEach var="HocKy" begin="1" end="4">
							<option value = "${HocKy }">${HocKy }</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Lớp học
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboLop" id="cboLop" onchange="changeLopHoc();" onclick="getLop(this.value)">
						<option value = "">		---		Chọn	---		</option>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Môn học
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboMonHoc" id="cboMonHoc" onchange="selectMonHoc();" onclick="getMonHoc(this.value)">
						<option value = "">		---		Chọn	---		</option>
					</select>
				</th>
			</tr>
		</table>
		<%int count = 0, count1 = 0; %>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Mã Sinh Viên</div></th>
				<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Tên sinh viên</div></th>
				<c:set var = "BaiKiemTraList" value = "<%=baiKiemTraList %>" scope="session"/>
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
			<c:forEach var = "SinhVien" items="${SoDiemMonHoc.dangKyMonHocList}">
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
								<c:if test="${ListDiem[i].diem ne '-1.0'}">
									value = "${ListDiem[i].diem}"	
								</c:if>
							size="5"/>	
							<c:set var = "i" value = "${i + 1}"/>
							<c:set var = "MaTenBaiKiemTra" value = "${BaiKiemTra.maTenBaiKiemTra}"/>
							<input type = "hidden" id = "txtMaTenBaiKiemTra<%=c %>" value = "${MaTenBaiKiemTra }"/>	
							 		
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
						if(document.getElementById('txtMaTenBaiKiemTra'+x).value == <%="'" + Constant.MADIEMMIENG + "'"%>)
						{
							tong += parseFloat(document.getElementById('txtDiem' + x + '_' + i).value);
							soBai++;
						}
						else if(document.getElementById('txtMaTenBaiKiemTra'+x).value == <%="'" + Constant.MADIEM15 + "'"%> || document.getElementById('txtMaTenBaiKiemTra' + x).value == <%="'" + Constant.MADIEM1TIET + "'"%>)
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
				var num = new Number(tong/soBai);
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
		<table>
				<tr align="center">
					<td>
						<a href = "javascript: capNhat()">	
							<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0" />
						</a>	
							<c:if test = "${SoDiemMonHoc.tinhTrang eq 0}">
								<a href = "javascript: guiSoDiem();">
									<img src="<%=request.getContextPath()%>/images/buttom/gui.png" border = "0" />
								</a>	
							</c:if>
						<a href = "<%=request.getContextPath() + Constant.PATH_RES.getString("xemDiem.InDiemMonHocShortPath") + "?maMonHocTKB=" + request.getParameter("maMonHocTKB")%>">	
							<img src="<%=request.getContextPath()%>/images/buttom/indiem.png" />
						</a>
					</td>
				</tr>
			</table>
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