<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.HeDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.QuyetDinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChuyenNganhModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.model.HeDaoTaoModel"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChuongTrinhDaoTaoModel"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietMonHocCTDTModel"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
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

<script language="JavaScript" type="text/javascript">
var listChiTietMonHoc = new Array();
<% 
	ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();
	/*if(request.getParameter("Them") != null)
	{
		Constant.NUM_ROWS_PHAN_1 = 1; 
		Constant.NUM_ROWS_PHAN_2 = 1; 
		Constant.NUM_ROWS_PHAN_3 = 1; 
	}*/
	if(request.getParameter("maID") != null)
	{
		chuongTrinhDaoTaoModel = ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTaoByID(request.getParameter("maID"));
	}
	if(request.getAttribute("chuongTrinhDaoTao") != null)
	{
		chuongTrinhDaoTaoModel = (ChuongTrinhDaoTaoModel) request.getAttribute("chuongTrinhDaoTao");
	}
	String maNghe = "";
	if(chuongTrinhDaoTaoModel.getMaChuongTrinhDaoTao() != null || chuongTrinhDaoTaoModel.getMaChuongTrinhDaoTao() != "") {
		maNghe = chuongTrinhDaoTaoModel.getMaNghe();
	} 
	ArrayList<ChuyenNganhModel> chuyenNganhModelList = ChuyenNganhDAO.getAllChuyenNganhAndMaQuyetDinh(maNghe);
%>
function loadPage() 
{
	<%
		out.print("if('" + request.getParameter("Them") + "' == 'null' || " + request.getParameter("maID") + " != null){");
		out.print("if('" + chuongTrinhDaoTaoModel.getMaQuyetDinh() + "' != ''){");
		out.print("document.getElementById('QuyetDinh').value = '" + chuongTrinhDaoTaoModel.getMaQuyetDinh() + "';");
		out.print("selectQuyetDinh();");
		out.print("document.getElementById('ThoiGian5').value = '" + chuongTrinhDaoTaoModel.getThoiGian5() + "';");
		out.print("document.getElementById('ThoiGian6').value = '" + chuongTrinhDaoTaoModel.getThoiGian6() + "';");
		out.print("document.getElementById('ThoiGian7').value = '" + chuongTrinhDaoTaoModel.getThoiGian7() + "';");
		out.print("document.getElementById('ThoiGian8').value = '" + chuongTrinhDaoTaoModel.getThoiGian8() + "';}");
		out.print("if('" + chuongTrinhDaoTaoModel.getMaNghe() + "' != ''){");
		out.print("document.getElementById('nghe').value = '" + chuongTrinhDaoTaoModel.getMaNghe() + "';");
		out.print("selectNghe();");
		out.print("document.getElementById('ThoiGianHocTap').value = '" + chuongTrinhDaoTaoModel.getThoiGian2() + "';}");
		out.print("count1=1, count2=1, count3=1, dem = 0;");
		if(request.getParameter("Them")== null || request.getParameter("maID") != null) {
			for(int i=0;i<chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().size();i++)
			{
				ChiTietMonHocCTDTModel chiTiet = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i);
				out.print("if('" + chiTiet.getNamHoc() + "' != '0'){");
				out.print("document.getElementById('NamHoc_PhanI_' + count1).value = '" + chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i).getNamHoc() + "';");
				out.print("selectNamHoc('I',count1);}");
				out.print("document.getElementById('HocKi_PhanI_' + count1).value = '" + chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i).getHocKi() + "';");
				out.print("count1++;");
				if(chiTiet.getMaDeCuong() != null && !chiTiet.getMaDeCuong().equals(""))
				{
					out.print("var objChiTietMonHoc = new Object();");
					out.print("objChiTietMonHoc.maMonHoc = '" + chiTiet.getMaMonHoc() + "';");
					out.print("objChiTietMonHoc.tenMonHoc = '" + chiTiet.getTenMonHoc() + "';");
					out.print("objChiTietMonHoc.LT = '" + chiTiet.getLyThuyet() + "';");
					out.print("objChiTietMonHoc.TH = '" + chiTiet.getThucHanh() + "';");
					out.print("objChiTietMonHoc.TiH = '" + chiTiet.getUser1() + "';");
					out.print("objChiTietMonHoc.thayDoi = '0';");
					out.print("listChiTietMonHoc[dem] = objChiTietMonHoc;");
					out.print("dem++;");
				}
			}
			for(int i=0;i<chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().size();i++)
			{
				ChiTietMonHocCTDTModel chiTiet = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i);
				out.print("if('" + chiTiet.getNamHoc() + "' != '0'){");
				out.print("document.getElementById('NamHoc_PhanII_' + count2).value = '" + chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i).getNamHoc() + "';");
				out.print("selectNamHoc('II',count2);}");
				out.print("document.getElementById('HocKi_PhanII_' + count2).value = '" + chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i).getHocKi() + "';");
				out.print("count2++; ");
				if(chiTiet.getMaDeCuong() != null && !chiTiet.getMaDeCuong().equals(""))
				{
					out.print("var objChiTietMonHoc = new Object();");
					out.print("objChiTietMonHoc.maMonHoc = '" + chiTiet.getMaMonHoc() + "';");
					out.print("objChiTietMonHoc.tenMonHoc = '" + chiTiet.getTenMonHoc() + "';");
					out.print("objChiTietMonHoc.LT = '" + chiTiet.getLyThuyet() + "';");
					out.print("objChiTietMonHoc.TH = '" + chiTiet.getThucHanh() + "';");
					out.print("objChiTietMonHoc.TiH = '" + chiTiet.getUser1() + "';");
					out.print("objChiTietMonHoc.thayDoi = '0';");
					out.print("listChiTietMonHoc[dem] = objChiTietMonHoc;");
					out.print("dem++;");
				}
			}
			for(int i=0;i<chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().size();i++)
			{
				ChiTietMonHocCTDTModel chiTiet = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i);
				out.print("if('" + chiTiet.getNamHoc() + "' != '0'){");
				out.print("document.getElementById('NamHoc_PhanIII_' + count3).value = '" + chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i).getNamHoc() + "';");
				out.print("selectNamHoc('III',count3);}");
				out.print("document.getElementById('HocKi_PhanIII_' + count3).value = '" + chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i).getHocKi() + "';");
				out.print("count3++; ");
				if(chiTiet.getMaDeCuong() != null && !chiTiet.getMaDeCuong().equals(""))
				{
					out.print("var objChiTietMonHoc = new Object();");
					out.print("objChiTietMonHoc.maMonHoc = '" + chiTiet.getMaMonHoc() + "';");
					out.print("objChiTietMonHoc.tenMonHoc = '" + chiTiet.getTenMonHoc() + "';");
					out.print("objChiTietMonHoc.LT = '" + chiTiet.getLyThuyet() + "';");
					out.print("objChiTietMonHoc.TH = '" + chiTiet.getThucHanh() + "';");
					out.print("objChiTietMonHoc.TiH = '" + chiTiet.getUser1() + "';");
					out.print("objChiTietMonHoc.thayDoi = '0';");
					out.print("listChiTietMonHoc[dem] = objChiTietMonHoc;");
					out.print("dem++;");
				}
			}
		}
		out.print("selectSogio(1);");
		out.print("selectSogio(2);");
		out.print("selectSogio(3);");
		out.print("}");
		if(request.getParameter("ThemDong1") != null) 
			out.print("document.getElementById('MonHoc_PhanI_' + count1).focus();");
		else if(request.getParameter("ThemDong2") != null) 
			out.print("document.getElementById('MonHoc_PhanII_' + count2).focus();");
		else if(request.getParameter("ThemDong3") != null) 
			out.print("document.getElementById('MonHoc_PhanIII_' + count3).focus();");
	%>
}	

function selectQuyetDinh() 
{	
	var x = document.getElementById('QuyetDinh').value;
	<%
	
	%>
	document.getElementById('nghe').innerHTML = null;
	var opt = new Option('--Select--','');
	document.getElementById('nghe').add(opt, undefined);
	if(x != '') {	
		<%
		
		for(Integer i=0;i<chuyenNganhModelList.size();i++)
			{
				out.print("if(x ==" + chuyenNganhModelList.get(i).getMaQuyetDinh() + "){");
				out.print("document.getElementById('Khoa').value = " + chuyenNganhModelList.get(i).getMaKhoa() + ";");
				out.print("document.getElementById('NienKhoa1').value = " + chuyenNganhModelList.get(i).getNamBatDau() + ";");
				out.print("document.getElementById('NienKhoa2').value = parseInt(document.getElementById('NienKhoa1').value) + " + chuyenNganhModelList.get(i).getSoNam() + ";");
				out.print("document.getElementById('TrinhDoDaoTao').value = '" + chuyenNganhModelList.get(i).getTenHeDaoTao() + "';");
				out.print("document.getElementById('MaTrinhDo').value = " + chuyenNganhModelList.get(i).getMaHeDaoTao() + ";");
				out.print("document.getElementById('BangCap').value = '" + chuyenNganhModelList.get(i).getTenBangCap() + "';");
				out.print("selectHeDaoTao(" + chuyenNganhModelList.get(i).getMaHeDaoTao() +");");
				out.print("var opt = new Option('"+ chuyenNganhModelList.get(i).getTenChuyenNganh() + "','" + chuyenNganhModelList.get(i).getMaChuyenNganh() + "');");
				out.print("document.getElementById('nghe').add(opt, undefined);}");
			}
		%>	
	}
	else
	{
		document.getElementById('Khoa').value = '';
		document.getElementById('NienKhoa1').value = '';
		document.getElementById('NienKhoa2').value = '';
		document.getElementById('TrinhDoDaoTao').value = '';
	}
	document.getElementById('nghe').value = "";
	selectNghe();
}	

function selectNghe()
{
	<%
		for(Integer i=0;i<chuyenNganhModelList.size();i++) {
			out.print("if(document.getElementById('nghe').value == " + chuyenNganhModelList.get(i).getMaChuyenNganh() + ") {");
			out.print("document.getElementById('maNghe').value = '" + chuyenNganhModelList.get(i).getKiHieu() + "';}");
		}
	%>
	if(document.getElementById('nghe').value == '')
	{
		document.getElementById('maNghe').value = '';
	}
}
function selectHeDaoTao(maTrinhDo)
{
	document.getElementById('ThoiGianHocTap').innerHTML = null;
	<%
	
	ArrayList<HeDaoTaoModel> heDaoTaoModelList = HeDaoTaoDAO.getHeDaoTao();
	for(int i=0;i<heDaoTaoModelList.size();i++)
	{
		out.print("if(maTrinhDo == " + heDaoTaoModelList.get(i).getMaHeDaoTao() + "){");
		out.print("document.getElementById('ThoiGianDaoTao').value = " + heDaoTaoModelList.get(i).getSoNam() + ";");
		out.print("document.getElementById('ThoiGian5').value = " + (Integer.parseInt(heDaoTaoModelList.get(i).getSoNam()) * 2 + 1) + ";");
		out.print("document.getElementById('ThoiGian6').value = " + (Integer.parseInt(heDaoTaoModelList.get(i).getSoNam()) * 2 + 1) * 40 + ";");
		out.print("document.getElementById('ThoiGian7').value = 2;");
		out.print("document.getElementById('ThoiGian8').value = 2 * 40;}");
	}
	%>
	for(var i=1; i<=parseInt(document.getElementById('txtRows1').value);i++) {
		document.getElementById('NamHoc_PhanI_' + i).innerHTML = null;
		for(var j =1;j<=document.getElementById('ThoiGianDaoTao').value;j++) {
			var opt = new Option(j,j);
			document.getElementById('NamHoc_PhanI_' + i).add(opt,undefined);
		}
		selectNamHoc('I', i);
	}
	for(var i=1; i<=parseInt(document.getElementById('txtRows2').value);i++) {
		document.getElementById('NamHoc_PhanII_' + i).innerHTML = null;
		for(var j =1;j<=document.getElementById('ThoiGianDaoTao').value;j++) {
			var opt = new Option(j,j);
			document.getElementById('NamHoc_PhanII_' + i).add(opt,undefined);
		}
		selectNamHoc('II', i);
	}
	for(var i=1; i<=parseInt(document.getElementById('txtRows3').value);i++) {
		document.getElementById('NamHoc_PhanIII_' + i).innerHTML = null;
		for(var j =1;j<=document.getElementById('ThoiGianDaoTao').value;j++) {
			var opt = new Option(j,j);
			document.getElementById('NamHoc_PhanIII_' + i).add(opt,undefined);
		}
		selectNamHoc('III', i);
	}
	
	for(var i = document.getElementById('ThoiGianDaoTao').value*12*4-20;i<document.getElementById('ThoiGianDaoTao').value*12*4 + 20;i++)
	{
		var opt = new Option(i,i);
		document.getElementById('ThoiGianHocTap').add(opt,undefined);
	}
	if(document.getElementById('ThoiGianDaoTao').value == '2')
	{
		document.getElementById('ThoiGianHocTap').value = '80';
	}
}

function selectMonHoc(x,y) {
	var monhoc = 'MonHoc_Phan' + x + '_' + y;
	var lythuyet = 'LyThuyet_Phan' + x + '_' + y;
	var thuchanh = 'ThucHanh_Phan' + x + '_' + y;
	<%
		ArrayList<MonHocModel> monHocModelList = MonHocDAO.getMonHoc();
		for(int i=0;i<monHocModelList.size();i++)
		{
			if(monHocModelList.get(i).getLyThuyet() == null || monHocModelList.get(i).getLyThuyet() == "") {
				monHocModelList.get(i).setLyThuyet("0");
			}
			if(monHocModelList.get(i).getThucHanh() == null || monHocModelList.get(i).getThucHanh() == "") {
				monHocModelList.get(i).setThucHanh("0");
			}
			out.print("if(document.getElementById(monhoc).value==" + monHocModelList.get(i).getMaMonHoc() +"){");
			out.print("document.getElementById(lythuyet).value = " + monHocModelList.get(i).getLyThuyet() + ";");
			out.print("document.getElementById(thuchanh).value = " + monHocModelList.get(i).getThucHanh() + ";}");
		}
	%>
	if(document.getElementById(monhoc).value == "")
	{
		document.getElementById(lythuyet).value = 0;
		document.getElementById(thuchanh).value = 0;
	}
	if(x=='I')
		selectSogio(1);
	else if(x=='II')
		selectSogio(2);
	else if(x == 'III')
		selectSogio(3);
}

function selectNamHoc(x,y)
{	
	
	var namhoc = 'NamHoc_Phan' + x + '_' + y;
	var hocki = 'HocKi_Phan' + x + '_' + y;
	var x = document.getElementById(namhoc).value;
	document.getElementById(hocki).innerHTML = null;
	var opt = new Option(x*2-1,x*2-1);
	document.getElementById(hocki).add(opt,undefined);
	var opt = new Option(x*2,x*2);
	document.getElementById(hocki).add(opt,undefined);
	
}

function selectCheckboxAll(x) {
		if(x == 1)
		{
			if(document.CTDT.chkAllRow_PhanI.checked == true)
			{
				for(var i=1;i<=parseInt(document.getElementById('txtRows1').value);i++)
				{
					document.getElementById('chkRow_PhanI_' + i).checked = true;
					document.getElementById('Tr_PhanI_' + i).style.background = "#FFFF99";
				}	
						
			}
			else
			{
				for(var i=1;i<=parseInt(document.getElementById('txtRows1').value);i++)
				{
					document.getElementById('chkRow_PhanI_' + i).checked = false;
					document.getElementById('Tr_PhanI_' + i).style.background = "";
				}
			}			
		}	
		else if(x == 2)
		{
			if(document.CTDT.chkAllRow_PhanII.checked == true)
			{
				for(var i=1;i<=parseInt(document.getElementById('txtRows2').value);i++)
				{
					document.getElementById('chkRow_PhanII_' + i).checked = true;
					document.getElementById('Tr_PhanII_' + i).style.background = "#FFFF99";
				}
			}
			else
			{
				for(var i=1;i<=parseInt(document.getElementById('txtRows2').value);i++)
				{
					document.getElementById('chkRow_PhanII_' + i).checked = false;
					document.getElementById('Tr_PhanII_' + i).style.background = "";
				}
			}			
		}
		else {
			if(document.CTDT.chkAllRow_PhanIII.checked == true)
			{
				for(var i=1;i<=parseInt(document.getElementById('txtRows3').value);i++)
				{
					document.getElementById('chkRow_PhanIII_' + i).checked = true;
					document.getElementById('Tr_PhanIII_' + i).style.background = "#FFFF99";
				}
			}
			else
			{
				for(var i=1;i<=parseInt(document.getElementById('txtRows3').value);i++)
				{
					document.getElementById('chkRow_PhanIII_' + i).checked = false;
					document.getElementById('Tr_PhanIII_' + i).style.background = "";
				}
			}			
		}
}
function selectCheckboxRow(x,y) {
	if(x == 1)
	{
		if (document.CTDT.chkAllRow_PhanI.checked == true)
			document.CTDT.chkAllRow_PhanI.checked = false;	
		if(document.getElementById('chkRow_PhanI_' + y).checked == true)
			document.getElementById('Tr_PhanI_' + y).style.background = "#FFFF99";
		else
			document.getElementById('Tr_PhanI_' + y).style.background = "";
	}
	else if(x == 2)
	{
		if (document.CTDT.chkAllRow_PhanII.checked == true)
			document.CTDT.chkAllRow_PhanII.checked = false;	
		if(document.getElementById('chkRow_PhanII_' + y).checked == true)
			document.getElementById('Tr_PhanII_' + y).style.background = "#FFFF99";
		else
			document.getElementById('Tr_PhanII_' + y).style.background = "";
	}
	else 
	{
		if (document.CTDT.chkAllRow_PhanIII.checked == true)
			document.CTDT.chkAllRow_PhanIII.checked = false;	
		if(document.getElementById('chkRow_PhanIII_' + y).checked == true)
			document.getElementById('Tr_PhanIII_' + y).style.background = "#FFFF99";
		else
			document.getElementById('Tr_PhanIII_' + y).style.background = "";
	}	
}
	
function selectSogio(x, y) {
	if(x == 1)
	{
		var tongLT = 0;
		var tongTH = 0;
		var tongTiH = 0;
		for(var i=1;i<=parseInt(document.getElementById('txtRows1').value);i++)
		{
			var a = parseInt(document.getElementById('LyThuyet_PhanI_' + i).value);
			tongLT += a;
			var b = parseInt(document.getElementById('ThucHanh_PhanI_' + i).value);
			tongTH += b;
			var c = parseInt(document.getElementById('TichHop_PhanI_' + i).value);
			tongTiH += c;
			document.getElementById('TongSo_PhanI_' + i).value = a + b + c;
		}
		document.getElementById('TongSoLyThuyet_PhanI').value = tongLT;
		document.getElementById('TongSoThucHanh_PhanI').value = tongTH;
		document.getElementById('TongSoTichHop_PhanI').value = tongTiH;
		document.getElementById('TongSo_PhanI').value = tongLT + tongTH + tongTiH;
		if(y != null)
		{
			for(var i=0;i<listChiTietMonHoc.length;i++)
			{
				var objChiTietMonHoc = new Object();
				objChiTietMonHoc = listChiTietMonHoc[i];
				if(document.getElementById('MonHoc_PhanI_' + y).value == objChiTietMonHoc.maMonHoc)
				{
					if(document.getElementById('LyThuyet_PhanI_' + y).value == objChiTietMonHoc.lyThuyet || document.getElementById('ThucHanh_PhanI_' + y).value == objChiTietMonHoc.thucHanh || document.getElementById('TichHop_PhanI_' + y).value == objChiTietMonHoc.user1)
						objChiTietMonHoc.thayDoi = "0";
					else
						objChiTietMonHoc.thayDoi = "1";
					listChiTietMonHoc[i] = objChiTietMonHoc;
					break;
				}
			}
		}
	}
	else if(x == 2)
	{
		var tongLT = 0;
		var tongTH = 0;
		var tongTiH = 0;
		for(var i=1;i<=parseInt(document.getElementById('txtRows2').value);i++)
		{
			var a = parseInt(document.getElementById('LyThuyet_PhanII_' + i).value);
			tongLT += a;
			var b = parseInt(document.getElementById('ThucHanh_PhanII_' + i).value);
			tongTH += b;
			var c = parseInt(document.getElementById('TichHop_PhanII_' + i).value);
			tongTiH += c;
			document.getElementById('TongSo_PhanII_' + i).value = a + b + c;
		}
		document.getElementById('TongSoLyThuyet_PhanII').value = tongLT;
		document.getElementById('TongSoThucHanh_PhanII').value = tongTH;
		document.getElementById('TongSoTichHop_PhanII').value = tongTiH;
		document.getElementById('TongSo_PhanII').value = tongLT + tongTH + tongTiH;
		if(y != null)
		{
			for(var i=0;i<listChiTietMonHoc.length;i++)
			{
				var objChiTietMonHoc = new Object();
				objChiTietMonHoc = listChiTietMonHoc[i];
				if(document.getElementById('MonHoc_PhanII_' + y).value == objChiTietMonHoc.maMonHoc)
				{
					if(document.getElementById('LyThuyet_PhanII_' + y).value == objChiTietMonHoc.lyThuyet || document.getElementById('ThucHanh_PhanII_' + y).value == objChiTietMonHoc.thucHanh || document.getElementById('TichHop_PhanII_' + y).value == objChiTietMonHoc.user1)
						objChiTietMonHoc.thayDoi = "0";
					else
						objChiTietMonHoc.thayDoi = "1";
					listChiTietMonHoc[i] = objChiTietMonHoc;
					break;
				}
			}
		}
	}
	else if(x == 3)
	{
		var tongLT = 0;
		var tongTH = 0;
		var tongTiH = 0;
		for(var i=1;i<=parseInt(document.getElementById('txtRows3').value);i++)
		{
			var a = parseInt(document.getElementById('LyThuyet_PhanIII_' + i).value);
			tongLT += a;
			var b = parseInt(document.getElementById('ThucHanh_PhanIII_' + i).value);
			tongTH += b;
			var c = parseInt(document.getElementById('TichHop_PhanIII_' + i).value);
			tongTiH += c;
			document.getElementById('TongSo_PhanIII_' + i).value = a + b + c;
		}
		document.getElementById('TongSoLyThuyet_PhanIII').value = tongLT;
		document.getElementById('TongSoThucHanh_PhanIII').value = tongTH;
		document.getElementById('TongSoTichHop_PhanIII').value = tongTiH;
		document.getElementById('TongSo_PhanIII').value = tongLT + tongTH + tongTiH;
		if(y != null)
		{
			for(var i=0;i<listChiTietMonHoc.length;i++)
			{
				var objChiTietMonHoc = new Object();
				objChiTietMonHoc = listChiTietMonHoc[i];
				if(document.getElementById('MonHoc_PhanIII_' + y).value == objChiTietMonHoc.maMonHoc)
				{
					if(document.getElementById('LyThuyet_PhanIII_' + y).value == objChiTietMonHoc.lyThuyet || document.getElementById('ThucHanh_PhanIII_' + y).value == objChiTietMonHoc.thucHanh || document.getElementById('TichHop_PhanIII_' + y).value == objChiTietMonHoc.user1)
						objChiTietMonHoc.thayDoi = "0";
					else
						objChiTietMonHoc.thayDoi = "1";
					listChiTietMonHoc[i] = objChiTietMonHoc;
					break;
				}
			}
		}
	}
	document.getElementById('PhanBo1').value = document.getElementById('TongSo_PhanI').value;
	document.getElementById('PhanBo2').value = parseInt(document.getElementById('TongSo_PhanII').value) + parseInt(document.getElementById('TongSo_PhanIII').value);
	document.getElementById('PhanBo3').value = parseInt(document.getElementById('TongSoLyThuyet_PhanII').value) + parseInt(document.getElementById('TongSoLyThuyet_PhanIII').value);
	document.getElementById('PhanBo4').value = parseInt(document.getElementById('TongSoThucHanh_PhanII').value) + parseInt(document.getElementById('TongSoThucHanh_PhanIII').value);
	document.getElementById('TongSo').value = parseInt(document.getElementById('TongSo_PhanI').value) + parseInt(document.getElementById('TongSo_PhanII').value) + parseInt(document.getElementById('TongSo_PhanIII').value);
	document.getElementById('TongSoLyThuyet').value = parseInt(document.getElementById('TongSoLyThuyet_PhanI').value) + parseInt(document.getElementById('TongSoLyThuyet_PhanII').value) + parseInt(document.getElementById('TongSoLyThuyet_PhanIII').value);
	document.getElementById('TongSoThucHanh').value = parseInt(document.getElementById('TongSoThucHanh_PhanI').value) + parseInt(document.getElementById('TongSoThucHanh_PhanII').value) + parseInt(document.getElementById('TongSoThucHanh_PhanIII').value);
	document.getElementById('TongSoTichHop').value = parseInt(document.getElementById('TongSoTichHop_PhanI').value) + parseInt(document.getElementById('TongSoTichHop_PhanII').value) + parseInt(document.getElementById('TongSoTichHop_PhanIII').value);
	document.getElementById('ThoiGian4').value = parseInt(document.getElementById('PhanBo1').value) + parseInt(document.getElementById('PhanBo2').value);	
}

function isEmpty() {
	return true;
}

function confirmSending(x) {
	if (confirm('Bạn có chắc muốn gửi chương trình không ?')) {
		if(x == 1)
			document.CTDT.GuiHieuTruong.value = 'GuiPhongKiemDinh';
		else
			document.CTDT.GuiHieuTruong.value = 'GuiHieuTruong';
		submitForm();
	}
	//return false;
}
function submitForm(){
	var str = "";
	for(var i=0;i<listChiTietMonHoc.length;i++)
	{
		var objChiTietMonHoc = new Object();
		objChiTietMonHoc = listChiTietMonHoc[i];
		if(objChiTietMonHoc.thayDoi == "1")
		{
			str += objChiTietMonHoc.tenMonHoc + ' : LT/' + objChiTietMonHoc.LT + ' TH/' + objChiTietMonHoc.TH + 'TiH/' + objChiTietMonHoc.TiH + '\n'; 
		}
	}
	if(str != '')
	{
		if(confirm('Đề cương của những môn học sau đây sẽ bị xóa do thay đổi số tiết\n' + str + 'Bạn có muốn tiếp tục không??'))
			document.forms["CTDT"].submit();
	}
	else
		document.forms["CTDT"].submit();
}

function addRow(x){		
	<%
		for(Integer i=1;i<=3;i++)
		{
			out.print("if(x == " + i.toString() + "){");
			out.print("document.CTDT.XuLyDong_Phan" + i.toString() + ".value = 'ThemDong';");
			out.print("submitForm();}");
		}
	%>	
}

function confirmDeleteRow(x) {
	var check = '';
	<%
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter printWriter = response.getWriter();
	out.print("var msg='';\n");	 	
	%>
	if(x == 1)
	{
		document.CTDT.XuLyDong_Phan1.value = 'XoaDong';
		for(var i=1;i<=parseInt(document.getElementById('txtRows1').value);i++)
		{
			if(document.getElementById('chkRow_PhanI_' + i).checked == true)
			{
				check = '1';
				msg += i + ' - ';
			}
		}
		msg += 'của các môn học chung';
	} else if(x == 2)
	{
		document.CTDT.XuLyDong_Phan2.value = 'XoaDong';
		for(var i=1;i<=parseInt(document.getElementById('txtRows2').value);i++)
		{
			if(document.getElementById('chkRow_PhanII_' + i).checked == true)
			{
				check = '1';
				msg += i + ' - ';
			}
		}
		msg += 'của các môn học cơ sở';
	} else 
	{
		document.CTDT.XuLyDong_Phan3.value = 'XoaDong';
		for(var i=1;i<=parseInt(document.getElementById('txtRows3').value);i++)
		{
			if(document.getElementById('chkRow_PhanIII_' + i).checked == true)
			{
				check = '1';
				msg += i + ' - ';
			}
		}
		msg += 'của các môn học chuyên ngành';
	}
	if(check == '') 
		alert('Hãy chọn dòng muốn xóa');
	else {
		if (confirm('Đề cương của các môn học này sẽ bị xóa, Bạn có chắc muốn xóa dòng ' + msg + ' không ?'))
			submitForm();
	}					 		
}

function changeSoSanh()
{
	document.getElementById('SoSanh').value = document.getElementById('cboSoSanh').value;
}

function submitFormSoSanh(){
	if(document.getElementById('SoSanh').value == '')
	{
		alert("Hãy chọn Chương trình muốn so sánh");
		return;
	}
	document.forms["SoSanhCTDT"].submit();
}
function confirmDuyet(x)
{
	var act = '';
	if(x == 'A')
	{
		act = 'Approve';
		document.getElementById('Duyet').value = act;
	}
	else
	{
		var value = false;
		value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: 200px; dialogWidth: 300px; dialogTop: 250px; dialogLeft: 350px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value != false && value != null)
		{
			act = 'Reject';
			document.getElementById('Duyet').value = act;
			document.getElementById('LyDoReject').value = value;
		}
		else
			return;
	}
	if(confirm("Bạn có chắc muốn " + act + " chương trình này không?"))
		document.forms["Duyet1CTDT"].submit();	
}
function validateInputNumber()
{
	if(document.getElementById('QuyetDinh') != '')
	{
		var thoiGian4 = document.getElementById('ThoiGian4').value;
		if(thoiGian4 != '')
		{
			thoiGian4 = thoiGian4.replace("-","");
			if((parseInt(thoiGian4) - 0) + "" != document.getElementById('ThoiGian4').value)
			{
				alert("Phải nhập số vào ô này");
				document.getElementById('ThoiGian4').focus();
			}
		}
		else
		{
			alert("Không thể bỏ trống ô này");
			document.getElementById('ThoiGian4').focus();
		}
	}
}
</script>
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Thêm Chương Trình Đào Tạo</title>

</head>
<body onload="loadPage();">

<c:set var = "ChuongTrinhDaoTao" value = "<%=chuongTrinhDaoTaoModel  %>" scope="session"></c:set>
	<c:choose>
		<c:when test="${not empty param.ThemDong1}">
			<c:set var = "Rows1" value = "<%=chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().size() + 1 %>" scope="session"/>
		</c:when>	
		<c:when test="${not empty param.ThemDong2}">
			<c:set var = "Rows2" value = "<%=chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().size() + 1 %>" scope="session"/>
		</c:when>	
		<c:when test="${not empty param.ThemDong3}">
			<c:set var = "Rows3" value = "<%=chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().size() + 1 %>" scope="session"/>
		</c:when>
		<c:otherwise>
			<c:if test = "${not empty ChuongTrinhDaoTao.maNguoiTao}">
				<c:set var = "Rows1" value = "<%=chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().size() %>" scope="session"/>
				<c:set var = "Rows2" value = "<%=chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().size() %>" scope="session"/>
				<c:set var = "Rows3" value = "<%=chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().size() %>" scope="session"/>
			</c:if>	
		</c:otherwise>
	</c:choose>	
	<c:if test = "${empty ChuongTrinhDaoTao.maNguoiTao or Rows1 eq 0}">
		<c:set var = "Rows1" value = "1" scope="session"/>
	</c:if>
	<c:if test = "${empty ChuongTrinhDaoTao.maNguoiTao or Rows2 eq 0}">
		<c:set var = "Rows2" value = "1" scope="session"/>
	</c:if>
	<c:if test = "${empty ChuongTrinhDaoTao.maNguoiTao or Rows3 eq 0}">
		<c:set var = "Rows3" value = "1" scope="session"/>
	</c:if>
	<input type = "hidden" value = "${Rows1}" id = "txtRows1"/>
	<input type = "hidden" value = "${Rows2}" id = "txtRows2"/>
	<input type = "hidden" value = "${Rows3}" id = "txtRows3"/>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "Admin" value = '<%= Constant.ADMIN %>'></c:set>
	<c:set var = "Truong_Khoa" value = '<%= Constant.TRUONG_KHOA %>'> </c:set>
	
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_PKID" value = '<%= Constant.BO_PHAN_PKID %>'></c:set>
	
	<c:set var = "NEW" value = '<%= Constant.TINHTRANG_NEW %>'></c:set>
	<c:set var = "SEND" value = '<%= Constant.TINHTRANG_SEND %>'> </c:set>
	<c:set var = "APPROVE" value = '<%= Constant.TINHTRANG_APPROVE %>'> </c:set>
	<c:set var = "REJECT" value = '<%= Constant.TINHTRANG_REJECT %>'> </c:set>
	<c:set var = "PENDING" value = '<%= Constant.TINHTRANG_PENDING %>'> </c:set>
<!-- Goi Hàm để lấy các môn học -->
	<c:set var = "ListMonHoc" value = "<%=MonHocDAO.getMonHoc()%>"></c:set>

<div align="center" background-color ="transparent;">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
		<c:if test="${not empty param.warning}">
			<b class="error">Tổng số thời gian học phải lớn hơn hoặc bằng thời gian thự học tới thiểu</b>
		</c:if>
		<c:if test="${not empty param.errTrungMonHoc}">
			<b class="error"> Môn học bị trùng</b>
		</c:if>
		<c:if test="${not empty param.errTinhTrang}">
			<b class="error"> Chương trình đào tạo này chưa đủ đề cương môn học</b>
		</c:if>
		<c:if test="${not empty param.errNghe}">
			<b class="error"> Chương trình đào tạo của nghề này đã tồn tại </b>
		</c:if>
		<c:if test="${not empty param.err}">
			<b class="error"> Nhập liệu vào các ô bắt buộc (*) </b>
		</c:if>
		<c:if test="${not empty param.msg and param.msg eq 'ThemMoi'}">
			<b class="msg"> Thêm mới "CHƯƠNG TRÌNH ĐÀO TẠO" thành công </b>
		</c:if>
		<c:if test="${(not empty param.msg and param.msg eq 'CapNhat')}">
			<b class="msg"> Cập nhật "CHƯƠNG TRÌNH ĐÀO TẠO" thành công </b>
		</c:if>
		<c:if test="${not empty requestScope.msgDeleteRow}">
			<b class="msg"> Xóa môn học thành công </b>
		</c:if>	
				
	
	<form action="<%=request.getContextPath()%>/chuongTrinhDaoTaoController?them=yes" method="post" name = "CTDT">
	
<table width = "800" style="background-color: transparent;">
	<tr style="background-color: transparent;">
		<td>
			TRƯỜNG TCN KTCN HÙNG VƯƠNG <br />KHOA/TT
			
		</td>
		<td>
			CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />Độc lập - Tự do - Hạnh phúc
		</td>
	</tr>
</table>
<table>	
	<tr style="background-color: transparent;">
		<td colspan = "2">
			<Strong>CHƯƠNG TRÌNH ĐÀO TẠO </Strong>
	</tr>
	<tr style="background-color: transparent;" align="right">
		<td colspan="2">
		Khóa <input type="text" size="2" id = "Khoa" readonly="readonly"/>
		Niên khóa <input type="text" size="2" id = "NienKhoa1" readonly="readonly"/>-
		<input type="text" size="2" id = "NienKhoa2" readonly="readonly"></input>
		</td>
	</tr>
	<tr style="background-color: transparent;">	
		<td colspan="2">
			<div class = "div_tr">
			<br /><br />
			Quyết định đào tạo:
		<!-- Gọi hàm để lấy data từ QuyetDinhMoLop -->
		<c:set var = "ListQuyetDinh" value = "<%=QuyetDinhDAO.getAllQuyetDinhDaoTaoApproved()%>"></c:set>
			<select id = "QuyetDinh" onchange = "selectQuyetDinh();" name = "cboQuyetDinhDaoTao" 
				<c:if test="${not empty ChuongTrinhDaoTao.maChuongTrinhDaoTao}">disabled</c:if>>
				<option value = "">--Select--</option>
			<c:forEach var = "QuyetDinhObj" items="${ListQuyetDinh}">
				<option value = "${QuyetDinhObj.maQuyetDinh}">${QuyetDinhObj.tenQuyetDinh}
				</option>
			</c:forEach>	
			</select><c:if test="${not empty param.err and (ChuongTrinhDaoTao.maQuyetDinh eq null or ChuongTrinhDaoTao.maQuyetDinh eq '')}"><b class="error">(*)</b></c:if>
			
				Tên nghề:
				<select id = "nghe" name="cboTenNghe" onchange="selectNghe();"
				<c:if test="${not empty ChuongTrinhDaoTao.maChuongTrinhDaoTao}">disabled</c:if>>
					<option style="background-color: transparent;" value = "">--Select--</option>
				</select><c:if test="${not empty param.err and (ChuongTrinhDaoTao.maNghe eq '' or ChuongTrinhDaoTao.maNghe eq null)}"><b class="error">(*)</b></c:if>
			</div>
		</td>
	</tr>
	<tr style="background-color: transparent;">	
		<td colspan="2">
			<div class = "div_tr">
				Mã nghề:<input type = "text" id = "maNghe" name = "txtMaNghe" size = "" style="background-color: transparent;" readonly="readonly" value="${ChuongTrinhDaoTao.kiHieu}"/><br />
				Trình độ đào tạo:
				<input type="text" id = "TrinhDoDaoTao" readonly="readonly" name="txtTrinhDoDaoTao"/>
				<input type="hidden" name = "txtMaTrinhDo" id = "MaTrinhDo"/>
				<br />
			</div>
		</td>
	</tr>	
	<tr style="background-color: transparent;">	
		<td colspan="2">
			<div class = "div_tr">		
				<strong>* Đối tượng tuyển sinh:</strong><br />		
				
				<textarea  rows="2" cols="70"  style="background-color: transparent;" name="areaDoiTuongTuyenSinh" >${ChuongTrinhDaoTao.doiTuong1}</textarea>
				
				<c:if test="${not empty param.err and ChuongTrinhDaoTao.doiTuong1 eq ''}"><b class="error">(*)</b></c:if><br />
			</div>
		</td>
	</tr>		
	<tr style="background-color: transparent;">	
		<td colspan="2">
			<div class = "div_tr">		
				Số lượng môn học, module đào tạo nghề:<br />	
				
				<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaSoLuongMonHoc">${ChuongTrinhDaoTao.soLuongMonHoc}</textarea>
				
				<c:if test="${not empty param.err and ChuongTrinhDaoTao.soLuongMonHoc eq ''}"><b class="error">(*)</b></c:if><br />
			</div>
		</td>
	</tr>		
	<tr style="background-color: transparent;">	
		<td colspan="2">
			<div class = "div_tr">		
				Bằng cấp sau khi tốt nghiệp: 
				<input type="text" readonly="readonly" name="txtBangCap" id="BangCap" value="${ChuongTrinhDaoTao.bangCap}"/>
			</div>
		</td>
	</tr>		
	<tr style="background-color: transparent;">	
		<td colspan="2">
			<div class = "div_tr">		
			<strong>I/ MỤC TIÊU ĐÀO TẠO:</strong><br /><br />
				1.	Kiến thức, kỹ năng nghề nghiệp:<br />
					* Kiến thức nghề:<br />
					
					<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaKienThucNghe">${ChuongTrinhDaoTao.mucTieu1}</textarea>
					
					<c:if test="${not empty param.err and ChuongTrinhDaoTao.mucTieu1 eq ''}"><b class="error">(*)</b></c:if><br />
				
					* Kỹ năng nghề:<br />
					 
					 <textarea  rows="2" cols="70" style="background-color: transparent;" name="areaKynangNghe">${ChuongTrinhDaoTao.mucTieu2}</textarea>
					 
					 <c:if test="${not empty param.err and ChuongTrinhDaoTao.mucTieu2 eq ''}"><b class="error">(*)</b></c:if><br />
				2.	Chính trị, đạo đức; thể chất, quốc phòng:<br />
				
				<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaChinhTri">${ChuongTrinhDaoTao.mucTieu3}</textarea>
				
				<c:if test="${not empty param.err and ChuongTrinhDaoTao.mucTieu3 eq ''}"><b class="error">(*)</b></c:if>
				<br />
				3.	Thái độ lao động:<br />
				
				<textarea  rows="2" cols="70" style="background-color: transparent;" name = "areaKiNang">${ChuongTrinhDaoTao.mucTieu4}</textarea>
				
				<c:if test="${not empty param.err and ChuongTrinhDaoTao.mucTieu4 eq ''}"><b class="error">(*)</b></c:if>
				<br />
				4.	Kỹ năng khác:<br />
				
				<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaCoHoiViecLam">${ChuongTrinhDaoTao.mucTieu5}</textarea>
				
				<c:if test="${not empty param.err and ChuongTrinhDaoTao.mucTieu5 eq ''}"><b class="error">(*)</b></c:if>
				<br />
			<br />
			<strong>II/ PHƯƠNG PHÁP GIẢNG DẠY:</strong><br /><br />
			
				1.Phương pháp giảng dạy:<br />
				
					* Lý thuyết:<br />
					
					<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaPhuongPhapLyThuyet">${ChuongTrinhDaoTao.phuongPhap1}</textarea>
					
					<c:if test="${not empty param.err and ChuongTrinhDaoTao.phuongPhap1 eq ''}"><b class="error">(*)</b></c:if><br />
					* Thực hành:<br />
					
					<textarea  rows="2" cols="70" style="background-color: transparent;" name = "areaPhuongPhapThucHanh">${ChuongTrinhDaoTao.phuongPhap2}</textarea>
					
					<c:if test="${not empty param.err and ChuongTrinhDaoTao.phuongPhap2 eq ''}"><b class="error">(*)</b></c:if><br />
				
				2.Phương pháp học tập:<br/>
				
					<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaPhuongPhapHocTap">${ChuongTrinhDaoTao.phuongPhap3}</textarea>
					
					<c:if test="${not empty param.err and ChuongTrinhDaoTao.phuongPhap3 eq ''}"><b class="error">(*)</b></c:if><br />
				
			
			<strong>III/ THỜI GIAN CỦA KHÓA HỌC VÀ THỜI GIAN THỰC HỌC TỐI THIỂU:</strong><br />
			<ul>
				<li>Thời gian của khóa học và thời gian thực học tối thiểu:</li><br />
				-   Thời gian đào tạo: 
				<input type = "text" size = "3" style="background-color: transparent;" id = "ThoiGianDaoTao" name="txtThoiGianDaoTao"/> năm.<br />
				-   Thời gian học tập:
				<select id = "ThoiGianHocTap" name="cboThoiGianHocTap">
					<option value = null>--Select--</option>
				</select> tuần.<br />
				-   Thời gian thực học:<input type = "text" size = "3" style="background-color: transparent;" name="txtThoiGian4" id = "ThoiGian4" value = "" name = "txtThoiGian4" onblur="validateInputNumber();"/> giờ.
				<c:if test="${not empty param.err and ChuongTrinhDaoTao.thoiGian4 eq ''}"><b class="error">(*)</b></c:if><br /><br />
				-   Thời gian ôn, kiểm tra hết môn, thi: 
				<input type = "text" size = "3" id = "ThoiGian5" style="background-color: transparent;" name="txtThoiGian5" /> tuần (<input type = "text" size = "3" style="background-color: transparent;" name="txtThoiGian6" id = "ThoiGian6"/> giờ)<br />
				-   trong đó thi tốt nghiệp: 
				<input type = "text" size = "3" style="background-color: transparent;" name="txtThoiGian7" id = "ThoiGian7"/> tuần (<input type = "text" size = "3" style="background-color: transparent;" name="txtThoiGian8" id = "ThoiGian8"/> giờ).<br />
				<li>Phân bố thời gian thực học tối thiểu:</li><br />
				-   Thời gian học các môn học chung bắt buộc: 
				<input type = "text" size = "3" style="background-color: transparent;" name = "txtPhanBo1" id = "PhanBo1"/> giờ.<br />
				-   Thời gian học các môn học, module đào tạo nghề: 
				<input type = "text" size = "3" style="background-color: transparent;" name = "txtPhanBo2" id = "PhanBo2" value = "0"/> giờ.<br />
				-   Thời gian học lý thuyết:
				<input type = "text" size = "3" style="background-color: transparent;" name = "txtPhanBo3" id = "PhanBo3" value="0"/><br />
				-   Thời gian học thực hành:
				<input type = "text" size = "3" style="background-color: transparent;" name = "txtPhanBo4" id = "PhanBo4" value="0"/><br />
			</ul>
			<strong>IV. PHÂN PHỐI CHƯƠNG TRÌNH CÁC MÔN HỌC:</strong><br />
			<ul>
				<li> Danh mục môn học, module đào tạo nghề bắt buộc:</li>
			</ul></div>
		</td>
	</tr>
</table>

<table border = "1" width = "800" style="background-color: transparent;">
	<tr style="background-color: transparent;">
		<td rowspan="2">Tình trạng</td>
		<td rowspan="2">&nbsp;</td>
		<td rowspan = "2">STT</td>
		<td rowspan = "2">Tên môn học, module</td>
		<td colspan = "2">Thời gian  đào tạo</td>
		<td colspan = "6">Thời gian của môn học, module (giờ)</td>
	</tr>
	<tr style="background-color: transparent;">
		<td>Năm học</td>
		<td>Học kì</td>
		<td>Tổng số</td>
		<td>Lý thuyết</td>
		<td>Thực hành</td>
		<td>Tích Hợp</td>
	</tr>
	<tr style="background-color: transparent; background-color: #c3d9ff;">
		<td>&nbsp;</td>
		<td><input type = "checkbox" name="chkAllRow_PhanI" onclick="selectCheckboxAll(1);" id="chkAllRow_PhanI"></input></td>
		<td>I</td>
		<td>CÁC MÔN HỌC CHUNG</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><input type = "text" size = "2" id = "TongSo_PhanI" value = "0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoLyThuyet_PhanI" value = "0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoThucHanh_PhanI" value = "0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoTichHop_PhanI" value = "0" readonly="readonly"></input></td>
	</tr>

<c:forEach var = "count" begin = "1" end = "${Rows1}" step = "1">
	<c:set var="ChiTietCTDT" value="${ChuongTrinhDaoTao.chiTietMonHocCTDTModelList1[count-1]}"></c:set>
	<tr style="background-color: transparent;" id = "Tr_PhanI_${count}">
		<td><input type="checkbox" name = "TinhTrangMonHoc_PhanI_${count}"
			<c:if test="${ChiTietCTDT.tinhTrang eq APPROVE}">checked</c:if> disabled="disabled"/>
			<input type="hidden" name="MaDeCuong_PhanI_${count}" value="${ChiTietCTDT.maDeCuong}"/>			
			<input type="hidden" name="TinhTrang_PhanI_${count}" value="${ChiTietCTDT.tinhTrang}"/>
			<input type="hidden" name="MaNguoiTaoDeCuong_PhanI_${count}" value="${ChiTietCTDT.maNguoiTaoDeCuong}"/>
		</td>
		<td><input type = "checkbox" name = "chkRow_PhanI_${count}" onclick="selectCheckboxRow(1,${count});" id = "chkRow_PhanI_${count}"></input></td>
		<td>${count}.</td>
		<td>
			<select <c:if test = "${ChiTietCTDT.tinhTrang ne null and ChiTietCTDT.tinhTrang ne ''}">disabled</c:if>
				id = "MonHoc_PhanI_${count}" name="cboMonHoc_PhanI_${count}" onclick="selectMonHoc('I','${count}');">
				<option value = "">--Select--</option>
				<c:forEach var = "MonHocObj" items="${ListMonHoc}">
					<option value = "${MonHocObj.maMonHoc}" <c:if test="${ChiTietCTDT.maMonHoc eq MonHocObj.maMonHoc}">selected</c:if>>${MonHocObj.tenMonHoc}</option>
				</c:forEach>
			</select>
			<c:if test="${(not empty ChiTietCTDT.maDeCuong and ChiTietCTDT.maDeCuong ne -1) and ChiTietCTDT.tinhTrang ne null and ChiTietCTDT.tinhTrang ne NEW}">	
				<a href="<%=request.getContextPath()%>/ISO/DeCuongMonHoc/DeCuong.jsp?maID=${ChiTietCTDT.maDeCuong}">Xem chi tiết</a>
			</c:if>
			<c:if test="${not empty param.errTrungMonHoc and ChiTietCTDT.maMonHoc ne '' and ChiTietCTDT.kiemTraTrung eq 1}"><b class="error">(X)</b></c:if>
			<c:if test="${not empty param.err and ChiTietCTDT.maMonHoc eq ''}"><b class="error">(*)</b></c:if>
		</td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "NamHoc_PhanI_${count}" onchange = "selectNamHoc('I','${count}');" name="cboNamHoc_PhanI_${count}">
			<option value = "0">None</option>
		</select></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "HocKi_PhanI_${count}" name="cboHocKi_PhanI_${count}">
			<option value="0">None</option>
		</select></td>
		<td><input type = "text" size = "2" id = "TongSo_PhanI_${count}" readonly="readonly" value="0"></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE and ChiTietCTDT.maHocPhan eq 1}">disabled</c:if> 
				id = "LyThuyet_PhanI_${count}" name="cboLyThuyet_PhanI_${count}" onchange="selectSogio(1, ${count});">
			<option value = "0">0</option>
			<c:forEach var = "iterator" begin = "1" end = "500">
				<option value = "${iterator }" <c:if test = "${ChiTietCTDT.lyThuyet eq iterator}">selected</c:if>>${iterator}</option>
			</c:forEach>
		</select></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if> 
				id = "ThucHanh_PhanI_${count}" name="cboThucHanh_PhanI_${count}" onchange="selectSogio(1, ${count});">
			<option value = "0">0</option>
			<c:forEach var = "iterator" begin = "1" end = "500">
				<option value = "${iterator }" <c:if test = "${ChiTietCTDT.thucHanh eq iterator}">selected</c:if>>${iterator}</option>
			</c:forEach>
		</select></td>
		<td>
		<select style="display: none;" <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if> 
				id = "TinhChat_PhanI_${count}" name="cboTinhChat_PhanI_${count}">
			<option value = "Thi" <c:if test="${ChiTietCTDT.tinhChat eq 'Thi'}">selected</c:if>>Thi</option>
			<option value = "Kiểm tra" <c:if test="${ChiTietCTDT.tinhChat eq 'Kiểm tra'}">selected</c:if>>Kiểm tra</option>
			<option value = "Báo cáo" <c:if test="${ChiTietCTDT.tinhChat eq 'Báo cáo'}">selected</c:if>>Báo cáo</option>
			<option value = "Đồ án" <c:if test="${ChiTietCTDT.tinhChat eq 'Đồ án'}">selected</c:if>>Đồ án</option>
		</select>
		<select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if> 
				id = "TichHop_PhanI_${count}" name="cboTichHop_PhanI_${count}" onchange="selectSogio(1, ${count});">
			<option value = "0">0</option>
			<c:forEach var = "iterator" begin = "1" end = "500">
				<option value = "${iterator }" <c:if test = "${ChiTietCTDT.user1 eq iterator}">selected</c:if>>${iterator}</option>
			</c:forEach>
		</select>
		</td>
	</tr>
</c:forEach>
	<tr style="background-color: transparent;">
			<c:if test = "${MaBoPhan eq BO_PHAN_ADMIN or ChuongTrinhDaoTao.tinhTrang eq null or ChuongTrinhDaoTao.maNguoiTao eq maThanhVien}">
				<c:choose>
					<c:when test="${ChuongTrinhDaoTao.tinhTrang eq NEW or ChuongTrinhDaoTao.tinhTrang eq REJECT or ChuongTrinhDaoTao.tinhTrang eq null}">			
						<td colspan = 12>							
							<a href = "javascript: addRow(1)">
								<input type="hidden" name="XuLyDong_Phan1" id="XuLyDong_Phan1" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/themdong.png" alt="Thêm Dòng" border = "0"/>
							</a>						
							<a href = "javascript: confirmDeleteRow(1)">								
								<img src="<%=request.getContextPath()%>/images/buttom/xoadong.png" alt="Xóa Dòng" border = "0" />
							</a>
						</td>
					</c:when>
				</c:choose>
			</c:if>		
	</tr>
	 <tr style="background-color: transparent; background-color: #c3d9ff;">
	 	<td>&nbsp;</td>
	 	<td><input type = "checkbox" name="chkAllRow_PhanII" onclick="selectCheckboxAll(2);" id="chkAllRow_PhanII"></input></td>
		<td>II</td>
		<td>CÁC MÔN HỌC CƠ SỞ</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><input type = "text" size = "2" id = "TongSo_PhanII" value = "0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoLyThuyet_PhanII" value = "0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoThucHanh_PhanII" value = "0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoTichHop_PhanII" value = "0" readonly="readonly"></input></td>
	</tr>
	<c:forEach var = "count" begin = "1" end = "${Rows2}" step = "1">
		<c:set var="ChiTietCTDT" value="${ChuongTrinhDaoTao.chiTietMonHocCTDTModelList2[count-1]}"></c:set>
	<tr style="background-color: transparent;" id = "Tr_PhanII_${count}">
		<td><input type="checkbox" name = "TinhTrangMonHoc_PhanII_${count}"
			<c:if test="${ChiTietCTDT.tinhTrang eq APPROVE}">checked</c:if> disabled="disabled"/>
			<input type="hidden" name="MaDeCuong_PhanII_${count}" value="${ChiTietCTDT.maDeCuong}"/>	
			<input type="hidden" name="TinhTrang_PhanII_${count}" value="${ChiTietCTDT.tinhTrang}"/>			
			<input type="hidden" name="MaNguoiTaoDeCuong_PhanII_${count}" value="${ChiTietCTDT.maNguoiTaoDeCuong}"/>
		</td>
		<td><input type = "checkbox" name = "chkRow_PhanII_${count}" onclick="selectCheckboxRow(2,${count});" id = "chkRow_PhanII_${count}"></input></td>
		<td>${count}.</td>
		<td>
			<select <c:if test = "${ChiTietCTDT.tinhTrang ne null and ChiTietCTDT.tinhTrang ne ''}">disabled</c:if>
				id = "MonHoc_PhanII_${count}" name = "cboMonHoc_PhanII_${count}" onclick="selectMonHoc('II','${count}');">
				<option value="">--Select--</option>
				<c:forEach var = "MonHocObj" items="${ListMonHoc}">
					<option value = "${MonHocObj.maMonHoc}" <c:if test="${ChiTietCTDT.maMonHoc eq MonHocObj.maMonHoc}">selected</c:if>>${MonHocObj.tenMonHoc}</option>
				</c:forEach>
			</select>
			<c:if test="${(not empty ChiTietCTDT.maDeCuong and ChiTietCTDT.maDeCuong ne -1) and ChiTietCTDT.tinhTrang ne null and ChiTietCTDT.tinhTrang ne NEW}">	
				<a href="<%=request.getContextPath()%>/ISO/DeCuongMonHoc/DeCuong.jsp?maID=${ChiTietCTDT.maDeCuong}">Xem chi tiết</a>
			</c:if>
			<c:if test="${not empty param.errTrungMonHoc and ChiTietCTDT.maMonHoc ne '' and ChiTietCTDT.kiemTraTrung eq 1}"><b class="error">(X)</b></c:if>
			<c:if test="${not empty param.err and ChiTietCTDT.maMonHoc eq '' and ChiTietCTDT.maHocPhan eq 2}"><b class="error">(*)</b></c:if>
		</td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "NamHoc_PhanII_${count}" onchange = "selectNamHoc('II','${count}');" name = "cboNamHoc_PhanII_${count}">
			<option value="0">None</option>
		</select></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "HocKi_PhanII_${count}" name = "cboHocKi_PhanII_${count}">
			<option value="0">None</option>
		</select></td>
		<td><input type = "text" size = "2" id = "TongSo_PhanII_${count}" value="0" readonly="readonly"></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "LyThuyet_PhanII_${count}" onchange="selectSogio(2, ${count})"; name = "cboLyThuyet_PhanII_${count}">
			<option value = "0">0</option>
			<c:forEach var = "iterator" begin = "1" end = "500">
				<option value = "${iterator }" <c:if test = "${ChiTietCTDT.lyThuyet eq iterator}">selected</c:if>>${iterator}</option>
			</c:forEach>
		</select></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "ThucHanh_PhanII_${count}" onchange="selectSogio(2, ${count})" name="cboThucHanh_PhanII_${count}">
			<option value = "0">0</option>
			<c:forEach var = "iterator" begin = "1" end = "500">
				<option value = "${iterator }" <c:if test = "${ChiTietCTDT.thucHanh eq iterator}">selected</c:if>>${iterator}</option>
			</c:forEach>
		</select></td>
		
		<td>
			<select style="display: none;" <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
					id = "TinhChat_PhanII_${count}" name="cboTinhChat_PhanII_${count}">
				<option value = "Thi" <c:if test="${ChiTietCTDT.tinhChat eq 'Thi'}">selected</c:if>>Thi</option>
				<option value = "Kiểm tra" <c:if test="${ChiTietCTDT.tinhChat eq 'Kiểm tra'}">selected</c:if>>Kiểm tra</option>
				<option value = "Báo cáo" <c:if test="${ChiTietCTDT.tinhChat eq 'Báo cáo'}">selected</c:if>>Báo cáo</option>
				<option value = "Đồ án" <c:if test="${ChiTietCTDT.tinhChat eq 'Đồ án'}">selected</c:if>>Đồ án</option>
			</select>
			<select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if> 
				id = "TichHop_PhanII_${count}" name="cboTichHop_PhanII_${count}" onchange="selectSogio(2, ${count});">
			<option value = "0">0</option>
			<c:forEach var = "iterator" begin = "1" end = "500">
				<option value = "${iterator }" <c:if test = "${ChiTietCTDT.user1 eq iterator}">selected</c:if>>${iterator}</option>
			</c:forEach>
			</select>
		</td>
	</tr>
</c:forEach>
	<tr style="background-color: transparent;">
			<c:if test = "${MaBoPhan eq BO_PHAN_ADMIN or ChuongTrinhDaoTao.tinhTrang eq null or ChuongTrinhDaoTao.maNguoiTao eq maThanhVien}">
				<c:choose>
					<c:when test="${ChuongTrinhDaoTao.tinhTrang eq NEW or ChuongTrinhDaoTao.tinhTrang eq REJECT or ChuongTrinhDaoTao.tinhTrang eq null}">
						<td colspan = 12>							
							<a href = "javascript: addRow(2)">
								<input type="hidden" name="XuLyDong_Phan2" id="XuLyDong_Phan2" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/themdong.png" alt="Thêm Dòng" border = "0"/>
							</a>							
							<a href = "javascript: confirmDeleteRow(2)">								
								<img src="<%=request.getContextPath()%>/images/buttom/xoadong.png" alt="Xóa Dòng" border = "0" />
							</a>
						</td>
					</c:when>
				</c:choose>
			</c:if>		
	</tr>	
	<tr style="background-color: transparent; background-color: #c3d9ff;">
		<td>&nbsp;</td>
		<td><input type = "checkbox" name="chkAllRow_PhanIII" onclick="selectCheckboxAll(3);" id="chkAllRow_PhanIII"></input></td>
		<td>III</td>
		<td>CÁC MÔN HỌC CHUYÊN NGÀNH</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><input type = "text" size = "2" id = "TongSo_PhanIII" value="0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoLyThuyet_PhanIII" value="0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoThucHanh_PhanIII" value="0" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id = "TongSoTichHop_PhanIII" value = "0" readonly="readonly"></input></td>
	</tr>
	<c:forEach var = "count" begin = "1" end = "${Rows3}" step = "1">
		<c:set var="ChiTietCTDT" value="${ChuongTrinhDaoTao.chiTietMonHocCTDTModelList3[count-1]}"></c:set>
	<tr style="background-color: transparent;" id = "Tr_PhanIII_${count}">
		<td><input type="checkbox" name = "TinhTrangMonHoc_PhanIII_${count}"
			<c:if test="${ChiTietCTDT.tinhTrang eq APPROVE}">checked</c:if> disabled="disabled"/>
			<input type="hidden" name="MaDeCuong_PhanIII_${count}" value="${ChiTietCTDT.maDeCuong}"/>	
			<input type="hidden" name="TinhTrang_PhanIII_${count}" value="${ChiTietCTDT.tinhTrang}"/>
			<input type="hidden" name="MaNguoiTaoDeCuong_PhanIII_${count}" value="${ChiTietCTDT.maNguoiTaoDeCuong}"/>
		</td>
		<td><input type = "checkbox" name = "chkRow_PhanIII_${count}" onclick="selectCheckboxRow(3,${count});" id = "chkRow_PhanIII_${count}"></input></td>
		<td>${count}.</td>
		<td>
			<select <c:if test = "${ChiTietCTDT.tinhTrang ne null and ChiTietCTDT.tinhTrang ne ''}">disabled</c:if>
				id = "MonHoc_PhanIII_${count}" name = "cboMonHoc_PhanIII_${count}" onclick="selectMonHoc('III','${count}');">
				<option value="">--Select--</option>
				<c:forEach var = "MonHocObj" items="${ListMonHoc}">
					<option value = "${MonHocObj.maMonHoc}" <c:if test="${ChiTietCTDT.maMonHoc eq MonHocObj.maMonHoc}">selected</c:if>>${MonHocObj.tenMonHoc}</option>
				</c:forEach>
			</select>
			<c:if test="${(not empty ChiTietCTDT.maDeCuong and ChiTietCTDT.maDeCuong ne -1) and ChiTietCTDT.tinhTrang ne null and ChiTietCTDT.tinhTrang ne NEW}">	
				<a href="<%=request.getContextPath()%>/ISO/DeCuongMonHoc/DeCuong.jsp?maID=${ChiTietCTDT.maDeCuong}">Xem chi tiết</a>
			</c:if>
			<c:if test="${not empty param.errTrungMonHoc and ChiTietCTDT.maMonHoc ne '' and ChiTietCTDT.kiemTraTrung eq 1}"><b class="error">(X)</b></c:if>
			<c:if test="${not empty param.err and ChiTietCTDT.maMonHoc eq ''}"><b class="error">(*)</b></c:if>
		</td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "NamHoc_PhanIII_${count}" onchange = "selectNamHoc('III','${count}');" name = "cboNamHoc_PhanIII_${count}">
			<option value="0">0</option>
		</select></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "HocKi_PhanIII_${count}" name = "cboHocKi_PhanIII_${count}">
			<option value="0">0</option>
		</select></td>
		<td><input type = "text" size="2" id = "TongSo_PhanIII_${count}" value="0" readonly="readonly"></input></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "LyThuyet_PhanIII_${count}" onchange="selectSogio(3, ${count})" name = "cboLyThuyet_PhanIII_${count}">
			<option value = "0">0</option>
			<c:forEach var = "iterator" begin = "1" end = "500">
				<option value = "${iterator }" <c:if test = "${ChiTietCTDT.lyThuyet eq iterator}">selected</c:if>>${iterator}</option>
			</c:forEach>
		</select></td>
		<td><select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
				id = "ThucHanh_PhanIII_${count}" onchange="selectSogio(3, ${count})" name = "cboThucHanh_PhanIII_${count}">
			<option value = "0">0</option>
			<c:forEach var = "iterator" begin = "1" end = "500">
				<option value = "${iterator }" <c:if test = "${ChiTietCTDT.thucHanh eq iterator}">selected</c:if>>${iterator}</option>
			</c:forEach>
		</select></td>
		<td>
			<select style="display: none;" <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if>
					id = "TinhChat_PhanIII_${count}" name="cboTinhChat_PhanIII_${count}">
				<option value = "Thi" <c:if test="${ChiTietCTDT.tinhChat eq 'Thi'}">selected</c:if>>Thi</option>
				<option value = "Kiểm tra" <c:if test="${ChiTietCTDT.tinhChat eq 'Kiểm tra'}">selected</c:if>>Kiểm tra</option>
				<option value = "Báo cáo" <c:if test="${ChiTietCTDT.tinhChat eq 'Báo cáo'}">selected</c:if>>Báo cáo</option>
				<option value = "Đồ án" <c:if test="${ChiTietCTDT.tinhChat eq 'Đồ án'}">selected</c:if>>Đồ án</option>
			</select>
			<select <c:if test = "${ChiTietCTDT.tinhTrang eq APPROVE}">disabled</c:if> 
					id = "TichHop_PhanIII_${count}" name="cboTichHop_PhanIII_${count}" onchange="selectSogio(3, ${count});">
				<option value = "0">0</option>
				<c:forEach var = "iterator" begin = "1" end = "500">
					<option value = "${iterator }" <c:if test = "${ChiTietCTDT.user1 eq iterator}">selected</c:if>>${iterator}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</c:forEach>
<tr style="background-color: transparent;">
			<c:if test = "${MaBoPhan eq BO_PHAN_ADMIN or ChuongTrinhDaoTao.tinhTrang eq null or ChuongTrinhDaoTao.maNguoiTao eq maThanhVien}">
				<c:choose>
					<c:when test="${ChuongTrinhDaoTao.tinhTrang eq NEW or ChuongTrinhDaoTao.tinhTrang eq REJECT or ChuongTrinhDaoTao.tinhTrang eq null}">
						<td colspan = 12>							
							<a href = "javascript: addRow(3)">
								<input type="hidden" name="XuLyDong_Phan3" id="XuLyDong_Phan3" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/themdong.png" alt="Thêm Dòng" border = "0"/>
							</a>						
							<a href = "javascript: confirmDeleteRow(3)">								
								<img src="<%=request.getContextPath()%>/images/buttom/xoadong.png" alt="Xóa Dòng" border = "0" />
							</a>
						</td>
					</c:when>
				</c:choose>		
			</c:if>
	</tr>
	<tr style="background-color: transparent;">
		<td>&nbsp;<input type = "hidden" value = "${param.ThemDong}" name = "txtThemDong"/></td>
		<td>&nbsp;</td> 
		<td>&nbsp;</td>
		<td>TỔNG CỘNG</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><input type = "text" size = "2" id ="TongSo" name = "txtTongSo" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id ="TongSoLyThuyet" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id ="TongSoThucHanh" readonly="readonly"></input></td>
		<td><input type = "text" size = "2" id ="TongSoTichHop" readonly="readonly"></input></td>
	</tr>
</table>
<table style="background-color: transparent;">
	<tr style="background-color: transparent;">
		<td colspan="2"><div class = "div_tr">
			<ul><li>Đề cương chi tiết chương trình môn học, module đào tạo nghề bắt buộc ( đính kèm).</li></ul>
			<strong>V. CÔNG TÁC THI/ KIỂM TRA:</strong><br />
				* Thi học kỳ, thi hết môn:<br />
				
				<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaThiHocKi">${ChuongTrinhDaoTao.thiHocKi}</textarea>
				
				<c:if test="${not empty param.err and ChuongTrinhDaoTao.thiHocKi eq ''}"><b class="error">(*)</b></c:if><br />
				* Thi tốt nghiệp:<br />
				
				<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaThiTotNghiep">${ChuongTrinhDaoTao.thiTotNghiep}</textarea>
				
				<c:if test="${not empty param.err and ChuongTrinhDaoTao.thiTotNghiep eq ''}"><b class="error">(*)</b></c:if><br />
			
			<strong>VI. THỰC TẬP SẢN XUẤT:</strong><br />
			
			<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaTTSX">${ChuongTrinhDaoTao.thucTap}</textarea>
			
			<c:if test="${not empty param.err and ChuongTrinhDaoTao.thucTap eq ''}"><b class="error">(*)</b></c:if><br />
			<strong>VII. NHỮNG Ý KIẾN ĐỀ XUẤT:</strong><br />
			
			<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaYKienDeXuat">${ChuongTrinhDaoTao.yKienDeXuat}</textarea>
			
			<c:if test="${not empty param.err and ChuongTrinhDaoTao.yKienDeXuat eq ''}"><b class="error">(*)</b></c:if><br />	
		</div></td>
	</tr>
	<tr style="background-color: transparent;">
		<td>Ngày <input type = "text"  size = 8 style="background-color: transparent;" value = "${ChuongTrinhDaoTao.ngayDuyet}" readonly="readonly" /></td>
		<td>Quận 5, ngày <input type = "text" id="txtCalendar" size = 8 name="txtCalendar"  style="background-color: transparent;" value = "${ChuongTrinhDaoTao.ngayCapNhatCuoi}" readonly="readonly" />
		</td>
	</tr>
	<tr style="background-color: transparent;">
		<td>Hiệu trưởng<br /><br /><input type="text" value="${ChuongTrinhDaoTao.tenNguoiDuyet}" style="background-color: transparent;" readonly="readonly"/><br /><br /></td>
		<td>Trưởng khoa<br /><br /><input type="text" value="${ChuongTrinhDaoTao.tenNguoiTao}" style="background-color: transparent;" readonly="readonly"/><br /><br /></td>
	</tr>
	<tr style="background-color: transparent;">
		<td colspan="2"><input type="hidden" name="actionType" style="background-color: transparent;"
			<c:choose>				
				<c:when test="${empty ChuongTrinhDaoTao.maChuongTrinhDaoTao}">
					value="ThemMoi"
				</c:when>
				<c:otherwise>
					value="CapNhat"
				</c:otherwise>	
			</c:choose>  
		/>	
		<c:if test = "${MaBoPhan eq BO_PHAN_ADMIN or ChuongTrinhDaoTao.tinhTrang eq null or ChuongTrinhDaoTao.maNguoiTao eq maThanhVien}"> 
			<c:choose>
				<c:when test="${ChuongTrinhDaoTao.tinhTrang eq NEW or ChuongTrinhDaoTao.tinhTrang eq REJECT or ChuongTrinhDaoTao.tinhTrang eq null}">
					<!--  <input type = "submit" name="TaoMoi" -->
					<a href = "javascript: submitForm()" name="TaoMoi"> 
					<c:choose>
						<c:when test="${empty ChuongTrinhDaoTao.maChuongTrinhDaoTao}">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Tạo mới" border = "0" />
						</c:when>
						<c:otherwise>							
							<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập Nhật" border = "0" />
						</c:otherwise>
					</c:choose> </a>					
					<c:choose>
						<c:when test="${not empty ChuongTrinhDaoTao.maChuongTrinhDaoTao and empty param.AddRow and empty param.err}">							
							<a href = "javascript: confirmSending(1)">
								<input type="hidden" name="GuiHieuTruong" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/guikiemdinh.png" alt="Gửi Phòng Kiểm Định" border = "0" />
							</a>
						</c:when>				
					</c:choose>
				</c:when>
			</c:choose>
		</c:if>		
		<c:if test="${ChuongTrinhDaoTao.tinhTrang eq APPROVE and (ChuongTrinhDaoTao.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN)}">	
			<a href = "javascript: submitForm()">	
				<input type="hidden" name="Copy" value = "Copy" />							 
				<img src="<%=request.getContextPath()%>/images/buttom/saochep.png" alt="Sao chép" border = "0" />
			</a>										
		</c:if>
		<!-- ChuongTrinhDaoTao.tinhTrang ne null and (ChuongTrinhDaoTao.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN or ChuongTrinhDaoTao.maNguoiDuyet eq maThanhVien) dk in -->
		<c:if test="${ChuongTrinhDaoTao.tinhTrang ne null}">	
			<a href = "<%=Constant.PATH_RES.getString("iso.InChuongTrinhDaoTaoPath") + "?maID="%>${ChuongTrinhDaoTao.maChuongTrinhDaoTao}">								 
				<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
		</c:if>
	<c:if test="${not empty ChuongTrinhDaoTao.maChuongTrinhDaoTao}">	
			<c:set var = "ListCTDTApproved" value='<%=ChuongTrinhDaoTaoDAO.getAllChuongTrinhDaoTaoApproved()%>'></c:set>		
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and ChuongTrinhDaoTao.tinhTrang eq SEND}">
			<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Approve" border="0"/> </a>
		</c:if>	
		<c:if test = "${(MaBoPhan eq BO_PHAN_PKID or MaBoPhan eq BO_PHAN_ADMIN) and ChuongTrinhDaoTao.tinhTrang eq PENDING}">
			<input type="hidden" name="GuiHieuTruong" /> 
			<a href="javascript: confirmSending('2')"><img src="<%=request.getContextPath()%>/images/buttom/guihieutruong.png" alt="Gửi Hiệu Trưởng" border = "0" /></a>
		</c:if>
			<select name = "cboSoSanh" onclick="changeSoSanh();" id="cboSoSanh">
						<option value="">--Select--</option>
					<c:forEach  var="CTDTApproved" 
							items = "${ListCTDTApproved}">
					<c:if test="${ChuongTrinhDaoTao.maNghe eq CTDTApproved.maNghe and ChuongTrinhDaoTao.maChuongTrinhDaoTao ne CTDTApproved.maChuongTrinhDaoTao and ChuongTrinhDaoTao.maTrinhDo eq CTDTApproved.maTrinhDo}">		
						<c:choose>
							<c:when test="${ChuongTrinhDaoTao.maNguoiTao eq maThanhVien}">
								<c:if test="${maThanhVien eq CTDTApproved.maNguoiTao}">
									<option value="${CTDTApproved.maChuongTrinhDaoTao}">${sf:upperString(CTDTApproved.tenNghe)} - Khóa ${CTDTApproved.maKhoa}</option>
								</c:if>
							</c:when>
							<c:otherwise>
								<option value="${CTDTApproved.maChuongTrinhDaoTao}">${sf:upperString(CTDTApproved.tenNghe)} - Khóa ${CTDTApproved.maKhoa}</option>
							</c:otherwise>
						</c:choose>
					</c:if>	
				</c:forEach>
			</select>	
		<a href = "javascript: submitFormSoSanh()">									 
			<img src="<%=request.getContextPath()%>/images/buttom/sosanh.png" alt="So sánh" border = "0" />
		</a>
		<c:if test = "${(MaBoPhan eq BO_PHAN_PKID or MaBoPhan eq BO_PHAN_ADMIN) and ChuongTrinhDaoTao.tinhTrang eq PENDING}">
			<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" border="0"/> </a>
		</c:if>
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and ChuongTrinhDaoTao.tinhTrang eq SEND}">
			<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" border="0"/> </a>
		</c:if>
	</c:if>	
		</td>
	</tr>
</table>

	</form>
	<form method="post" action="<%=request.getContextPath()%>/chuongTrinhDaoTaoController?sosanh=yes" name="SoSanhCTDT">	
		<input type="hidden" name="SoSanh" value = "" id="SoSanh"/>	
	</form>
	<form method="post" action="<%=request.getContextPath()%>/chuongTrinhDaoTaoController?duyet1chuongtrinh=yes&maChuongTrinh=${ChuongTrinhDaoTao.maChuongTrinhDaoTao}" name="Duyet1CTDT">	
		<input type="hidden" name="Duyet" value = "" id="Duyet"/>
		<input type="hidden" name="LyDoReject" value="" id="LyDoReject"/>
	</form>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>

</body>
</html>