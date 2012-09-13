<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChuongTrinhDaoTaoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietMonHocCTDTDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietMonHocCTDTModel"%>
<%@page import="vn.edu.hungvuongaptech.model.DeCuongMonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungDCMHModel"%>

<%@page import="vn.edu.hungvuongaptech.util.XmlUtil"%><html>
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
var truongHop;
var kieuBienSoan;
var thucHanh;
var lyThuyet;
var monHocList = new Array();
var tenChuong = new Array();
var line = '\n';
var duongDan = "";
var dauNhay = "'";
var dauNhay1 = "\"";
var soTiet;
var mucTieu = new Array();
var kieuDayLyThuyet = new Array();
<%
	//int check = 1;
	String[] arrStr1, arrStr2;
	char[] arrChar;
	String maDeCuong = "";
	ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList = new ArrayList<ChiTietMonHocCTDTModel>(); 
	//ArrayList<MonHocModel> monHocModelList = new ArrayList<MonHocModel>();
	DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();
	if(request.getParameter("maID") != null) {
		maDeCuong = request.getParameter("maID");
		deCuongMonHocModel = DeCuongMonHocDAO.getDeCuongMonHocByID(maDeCuong);
	}
	if(request.getAttribute("deCuongMonHoc") != null) {
		deCuongMonHocModel = (DeCuongMonHocModel) request.getAttribute("deCuongMonHoc");
		maDeCuong = deCuongMonHocModel.getMaDeCuongMonHoc();
		out.print("duongDan = 'ISO/DeCuongMonHoc/';");
	}
	
	if(deCuongMonHocModel.getMaDeCuongMonHoc() != null) {
		//monHocModelList = MonHocDAO.getMonHoc();
		//check = 0;
		chiTietMonHocCTDTModelList = ChiTietMonHocCTDTDAO.getChiTietCTDTByMaDeCuong(maDeCuong);
	}
	else
	{
		//monHocModelList = MonHocDAO.getMonHocByTruongBoMon((String)session.getAttribute("maThanhVien"));
		chiTietMonHocCTDTModelList = ChiTietMonHocCTDTDAO.getAllChiTietCTDTChuaDuyet();
	}
	if(request.getParameter("maID") != null || request.getAttribute("deCuongMonHoc") != null) {
		for(int i=0;i<deCuongMonHocModel.getNoiDungDCMHModelsList().size();i++) {
			NoiDungDCMHModel noiDungDCMH = deCuongMonHocModel.getNoiDungDCMHModelsList().get(i);
			if(noiDungDCMH.getSoThuTu().equals("1")) {
				if(noiDungDCMH.getCoHieu().equals("0"))
					out.print("kieuDayLyThuyet[" + i + "] = " + noiDungDCMH.getSoTiet() + ";");
				else
					out.print("kieuDayLyThuyet[" + i + "] = 0;");
				noiDungDCMH.setTenChuong(noiDungDCMH.getTenChuong().replaceAll("'", "-DAUNHAY-"));
				noiDungDCMH.setTenChuong(noiDungDCMH.getTenChuong().replaceAll("\"", "-DAUNHAY1-"));
				noiDungDCMH.setMucTieu(noiDungDCMH.getMucTieu().replaceAll("'", "-DAUNHAY-"));
				noiDungDCMH.setMucTieu(noiDungDCMH.getMucTieu().replaceAll("\"", "-DAUNHAY1-"));
				arrStr1 = noiDungDCMH.getTenChuong().split("\r\n");
				arrStr2 = noiDungDCMH.getMucTieu().split("\r\n");
				for(int j=0;j<arrStr1.length;j++) {
					if(j == 0)
						out.print("tenChuong[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "] = '" + arrStr1[j] + "';");
					else
						out.print("tenChuong[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "] += line + '" + arrStr1[j] + "';");
				}
				out.print("tenChuong[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "] = tenChuong[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "].replace(/-DAUNHAY-/gi,dauNhay);");
				out.print("tenChuong[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "] = tenChuong[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "].replace(/-DAUNHAY1-/gi,dauNhay1);");
				// set gia tri cho mang mucTieu
				for(int j=0;j<arrStr2.length;j++) {
					if(j == 0)
						out.print("mucTieu[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "] = '" + arrStr2[j] + "';");
					else
						out.print("mucTieu[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "] += line + '" + arrStr2[j] + "';");
				}
				out.print("mucTieu[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "] = mucTieu[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "].replace(/-DAUNHAY-/gi,dauNhay);");
				out.print("mucTieu[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "] = mucTieu[" + (Integer.parseInt(noiDungDCMH.getSoBuoi()) - 1) + "].replace(/-DAUNHAY1-/gi,dauNhay1);");
			}
		}
		if(deCuongMonHocModel.getKieuBienSoan().equals("0")) {
			out.print("kieuBienSoan = 0;");
		} else if(deCuongMonHocModel.getKieuBienSoan().equals("1")){
			out.print("kieuBienSoan = 1;");
		} else {
			out.print("kieuBienSoan = 2;");
		}
	}
		
%>
	function loadPage() 
	{	
		<%
		out.print("if('" + request.getParameter("Them") + "' == 'null' || " + request.getParameter("maID") + " != null){");
		out.print("if('" + deCuongMonHocModel.getMaChuongTrinh() + "' != '') {");
		out.print("document.getElementById('ChuongTrinh').value = '" + deCuongMonHocModel.getMaChuongTrinh() + "';");
		out.print("selectChuongTrinh(); }");
		//out.print("if('" + deCuongMonHocModel.getMaMonHoc() + "' != '') {");
		//out.print("document.getElementById('monHoc').value = '" + deCuongMonHocModel.getMaMonHoc() + "';");
		//out.print("selectMonHoc(); } }");
		out.print("if(lyThuyet != " + deCuongMonHocModel.getLyThuyet() + " && thucHanh != " + deCuongMonHocModel.getThucHanh() + ") {");
		out.print("document.getElementById('LyThuyet').value = lyThuyet;");
		out.print("document.getElementById('ThucHanh').value = thucHanh;");
		out.print("document.getElementById('TichHop').value = tichHop;");
		out.print("document.getElementById('KiemTra').value = 0;");
		out.print("} else {");
		out.print("document.getElementById('LyThuyet').value = " + deCuongMonHocModel.getLyThuyet() + ";");
		out.print("document.getElementById('ThucHanh').value = " + deCuongMonHocModel.getThucHanh() + ";");
		out.print("document.getElementById('TichHop').value = " + deCuongMonHocModel.getUser1() + ";");
		out.print("document.getElementById('KiemTra').value = " + deCuongMonHocModel.getKiemTra() + "; }");
		
		out.print("createRow(); }");
		%>
	}
	function selectChuongTrinh()
	{
		var x = document.getElementById('ChuongTrinh').value;
		document.getElementById('monHoc').innerHTML = null;
		var opt = new Option('--Select--','');
		document.getElementById('monHoc').add(opt,undefined);
		<%
			
			for(Integer i=0; i< chiTietMonHocCTDTModelList.size();i++)
			{
				out.print("if(x == '" + chiTietMonHocCTDTModelList.get(i).getMaChuongTrinh() + "') {");
				//out.print("for(var i=0;i<monHocList.length;i++) {");
				//out.print("if(monHocList[i].MaMonHoc == " + chiTietMonHocCTDTModelList.get(i).getMaMonHoc() + ") {");
				//out.print("var opt = new Option(monHocList[i].TenMonHoc, monHocList[i].MaMonHoc);");
				out.print("var opt = new Option('" + chiTietMonHocCTDTModelList.get(i).getTenMonHoc() + "','" + chiTietMonHocCTDTModelList.get(i).getMaMonHoc() + "');");
				out.print("document.getElementById('monHoc').add(opt,undefined); } ");
			}
		%>
			document.getElementById('SoDong').value = 0;
			document.getElementById('monHoc').value = "";
			document.getElementById('TenKhoa').value = '';
			document.getElementById('ThoiGianMonHoc').value = '0';
			document.getElementById('LyThuyet').value = '0';
			document.getElementById('ThucHanh').value = '0';
			document.getElementById('KiemTra').value = '0';
			document.getElementById('TinhChatMonHoc').value = '';
			thucHanh = 0;
			lyThuyet = 0;
			createRow();
		<%
		if(deCuongMonHocModel.getMaMonHoc() != "" && deCuongMonHocModel.getMaMonHoc() != null) {
			out.print("document.getElementById('monHoc').value = " + deCuongMonHocModel.getMaMonHoc() + ";");
			out.print("selectMonHoc();");
		}
		%>
	}
	function selectMonHoc()
	{
		
		if(document.getElementById('ChuongTrinh').value != '' && document.getElementById('monHoc').value != '')
		{
			<%
			for(Integer i=0; i< chiTietMonHocCTDTModelList.size();i++) {
				out.print("if(document.getElementById('ChuongTrinh').value == '" + chiTietMonHocCTDTModelList.get(i).getMaChuongTrinh() + "') {");
				out.print("if(document.getElementById('monHoc').value == " + chiTietMonHocCTDTModelList.get(i).getMaMonHoc() + ") {");	
				out.print("document.getElementById('TenMonHoc').value = '" + chiTietMonHocCTDTModelList.get(i).getTenMonHoc() + "';");
				out.print("document.getElementById('TenKhoa').value = '" + chiTietMonHocCTDTModelList.get(i).getTenKhoa() + "';");
				out.print("document.getElementById('ThoiGianMonHoc').value = " + (Integer.parseInt(chiTietMonHocCTDTModelList.get(i).getLyThuyet()) + Integer.parseInt(chiTietMonHocCTDTModelList.get(i).getThucHanh()) + Integer.parseInt(chiTietMonHocCTDTModelList.get(i).getUser1())) + ";");
				out.print("document.getElementById('LyThuyet').value = " + chiTietMonHocCTDTModelList.get(i).getLyThuyet() + ";");
				out.print("document.getElementById('ThucHanh').value = " + chiTietMonHocCTDTModelList.get(i).getThucHanh() + ";");
				out.print("document.getElementById('TichHop').value = " + chiTietMonHocCTDTModelList.get(i).getUser1() + ";");
				out.print("document.getElementById('txtLyThuyetCTDT').value = " + chiTietMonHocCTDTModelList.get(i).getLyThuyet() + ";");
				out.print("document.getElementById('txtThucHanhCTDT').value = " + chiTietMonHocCTDTModelList.get(i).getThucHanh() + ";");
				out.print("document.getElementById('txtTichHopCTDT').value = " + chiTietMonHocCTDTModelList.get(i).getUser1() + ";");
				out.print("document.getElementById('TinhChatMonHoc').value = '" + chiTietMonHocCTDTModelList.get(i).getTinhChat() + "';");
				out.print("document.getElementById('KiemTra').value = 0;");
				out.print("lyThuyet = " + chiTietMonHocCTDTModelList.get(i).getLyThuyet() + ";");
				out.print("tichHop = " + chiTietMonHocCTDTModelList.get(i).getUser1() + ";");
				out.print("thucHanh = " + chiTietMonHocCTDTModelList.get(i).getThucHanh() + "; } }");
			}
			%>
			if((lyThuyet == 0 || thucHanh == 0) && tichHop == 0)
			{
				//document.DCMH.Kieu[0].disabled = true;
				//document.DCMH.Kieu[1].disabled = true;
				//document.DCMH.Kieu[2].disabled = true;
				truongHop = 1;	
			}	
			else if(parseInt(thucHanh) % parseInt(lyThuyet) == 0 || parseInt(lyThuyet) % parseInt(thucHanh) == 0 || (parseInt(thucHanh) == 0 && parseInt(lyThuyet == 0)))
			{
				document.DCMH.Kieu[0].disabled = false;
				document.DCMH.Kieu[1].disabled = false;
				document.DCMH.Kieu[2].disabled = false;
				if(parseInt(lyThuyet) % parseInt(thucHanh) == 0)
					//document.DCMH.Kieu[1].disabled = true;
				if(document.DCMH.Kieu[0].checked == true || kieuBienSoan == 0) 
					truongHop = 1;
				else if(document.DCMH.Kieu[1].checked == true || kieuBienSoan == 1) 
					truongHop = 2;
				else if(document.DCMH.Kieu[2].checked == true || kieuBienSoan == 2)
					truongHop = 3;
			} 
			else
			{
				
				
				//document.DCMH.Kieu[1].disabled = true;
				if(parseInt(thucHanh) >= parseInt(lyThuyet))
				{
					document.DCMH.Kieu[0].disabled = false;
					document.DCMH.Kieu[2].disabled = false;
					if(document.DCMH.Kieu[0].checked == true || kieuBienSoan == 0) 
						truongHop = 1;
					else if(document.DCMH.Kieu[2].checked == true || kieuBienSoan == 2)
						truongHop = 3;
				}
				else
				{
					//document.DCMH.Kieu[2].disabled = true;
					//document.DCMH.Kieu[0].disabled = true;
					truongHop = 1;
				}
					
			}
		
		}
		else
		{
			document.getElementById('TenKhoa').value = '';
			document.getElementById('ThoiGianMonHoc').value = '0';
			document.getElementById('LyThuyet').value = '0';
			document.getElementById('ThucHanh').value = '0';
			document.getElementById('KiemTra').value = '0';
			document.getElementById('TinhChatMonHoc').value = '';
			thucHanh = 0;
			lyThuyet = 0;
		}
		<%
		if(deCuongMonHocModel.getMaMonHoc() == "" || deCuongMonHocModel.getMaMonHoc() == null) 
			out.print("createRow();");
		%>
		
	}
	function changeKieuBienSoan()
	{
		if(document.DCMH.Kieu[0].checked == true)
			truongHop = 1;
		else if(document.DCMH.Kieu[1].checked == true) 
			truongHop = 2;
		else 
			truongHop = 3;
		kieuDayLyThuyet = new Array();
		createRow();
	}
	function clickSoTiet()
	{
		soTiet = document.getElementById('SoTiet').value;
	}
	function checkSoTiet() 
	{
		if(thucHanh == 0)
		{
			if(parseInt(lyThuyet) % parseInt(document.getElementById('SoTiet').value) != 0)
			{
				alert("Số tiết này không phù hợp");
				document.getElementById('SoTiet').value = soTiet;
			}
			else
			{
				document.getElementById('KiemTra').value = 0;
				document.getElementById('LyThuyet').value = lyThuyet;
				document.getElementById('ThucHanh').value = thucHanh;
				kieuDayLyThuyet = new Array();
				createRow();
			}	
		}
		else if(parseInt(thucHanh) % parseInt(document.getElementById('SoTiet').value) != 0 || parseInt(lyThuyet) % parseInt(document.getElementById('SoTiet').value) != 0 )
		{
			alert("Số tiết này không phù hợp");
			document.getElementById('SoTiet').value = soTiet;
		}
		else
		{
			document.getElementById('KiemTra').value = 0;
			document.getElementById('LyThuyet').value = lyThuyet;
			document.getElementById('ThucHanh').value = thucHanh;
			kieuDayLyThuyet = new Array();
			createRow();
		}
	}
	function changeKiemTra() 
	{
		if(document.getElementById('ChuongTrinh').value != '' && document.getElementById('monHoc').value != '')
		{
			var kiemTra = document.getElementById('KiemTra').value;
			if(kiemTra != '')
			{
				kiemTra = kiemTra.replace("-","");
				if((parseInt(kiemTra) - 0) + "" == document.getElementById('KiemTra').value)
				{
					if((truongHop == 1 || truongHop == 3) && parseInt(kiemTra) <= parseInt(document.getElementById('SoTiet').value) && parseInt(kiemTra) % parseInt(document.getElementById('SoTiet').value) == 0)
					{
						if(parseInt(thucHanh) != 0)
							document.getElementById('ThucHanh').value = parseInt(thucHanh) - parseInt(kiemTra);
						else
							document.getElementById('LyThuyet').value = parseInt(lyThuyet) - parseInt(kiemTra);
						createRow();
					}
					else if(truongHop == 2 && parseInt(kiemTra) <= parseInt(document.getElementById('SoTiet').value) * parseInt(thucHanh)/parseInt(lyThuyet) && parseInt(kiemTra) % parseInt(document.getElementById('SoTiet').value) == 0)
					{
						document.getElementById('ThucHanh').value = parseInt(thucHanh) - parseInt(kiemTra);
						createRow();
					}
					else
					{
						alert("Số tiết của kiểm tra nhập sai, xin nhập lại");
						document.getElementById('KiemTra').focus();
					}
				}
				else
				{
					alert('Số tiết của kiểm tra nhập sai, xin nhập lại bằng số');
					document.getElementById('KiemTra').focus();
				}
			}
			else
			{
				alert('Số tiết của kiểm tra không thể bỏ trống');
				document.getElementById('KiemTra').focus();
			}
		}
		else
		{
			if(document.getElementById('KiemTra').value != '0')
				alert('Số tiết của kiểm tra chưa thể nhập');
			document.getElementById('KiemTra').value = '0';
		}
	}

	function createRow() 
	{
		
		var table = document.getElementById('TableNoiDungDCMH');
		var soDong = 0;
		var soDongDaCo = parseInt(document.getElementById("SoDong").value);
		if(document.getElementById('monHoc').value != "" && document.getElementById('ChuongTrinh').value != "")
		{
			
			var count = parseInt(document.getElementById('ThoiGianMonHoc').value)/parseInt(document.getElementById('SoTiet').value);
			var count1 = parseInt(thucHanh)/parseInt(lyThuyet);
			var count2 = parseInt(lyThuyet)/parseInt(document.getElementById('SoTiet').value);
			//var count3 = parseInt(document.getElementById('ThucHanh').value)/parseInt(document.getElementById('SoTiet').value);
			var thucHanh1 = 0;
			var lyThuyet1 = 0;
			var tichHop = 0;
			var err = "";
			if(truongHop != 3)
				lyThuyet1 = parseInt(document.getElementById('SoTiet').value);
			else
				tichHop = parseInt(document.getElementById('SoTiet').value);
			if(truongHop == 1 || truongHop == 3) 
			{
				soDong = count;
			}
			else if(truongHop == 2)
			{
				soDong = count2;
			} 	
			var tongSo = parseInt(document.getElementById('ThoiGianMonHoc').value)/soDong;
			if(soDongDaCo > 0)
			{
				for(var i=0;i<soDongDaCo;i++)
				{
					var x = 'areaTenChuong_' + (i+1);
					tenChuong[i] = document.getElementById(x).value;
					mucTieu[i] = document.getElementById('txtMucTieu_' + (i+1)).value;
				}
				for(var i=1;i<=soDongDaCo;i++)
				{
					table.deleteRow(2);
				}
			}
			else
			{
				soDongDaCo = tenChuong.length;	
			}	
			for(var i = 1;i<=soDong;i++)
			{ 
				if(i > tenChuong.length)
				{
					tenChuong[i-1] = '';
					mucTieu[i-1] = '';
				}		
				if(truongHop == 1)
				{
					if(i > count2)
					{
						if(kieuDayLyThuyet[i-1] != null)
							lyThuyet1 = kieuDayLyThuyet[i-1];
						else
							lyThuyet1 = 0;
					}
					else
					{
						if(kieuDayLyThuyet[i-1] != null)
							lyThuyet1 = kieuDayLyThuyet[i-1];
						else
							lyThuyet1 = document.getElementById('SoTiet').value;
					}
					kieuDayLyThuyet[i-1] = lyThuyet1;
				}
				<%
					if(request.getParameter("err") != null) {
						out.print("if(tenChuong[i-1] == '')");
						out.print("err = \"<br/><b class='error'>(*)</b>\";");
					}
				%>				
				var row = table.insertRow(i+1);
				row.insertCell(0).innerHTML = "<a onclick = 'inputMucTieu(" + i + ")'><font color = 'blue'><u>" + i + "</u></font></a> <input type = 'hidden' name = 'txtMucTieu_" + i + "' id = 'txtMucTieu_" + i + "' value = '" + mucTieu[i - 1] + "'/><input type = 'hidden' name = 'KieuDay" + i + "' id = 'KieuDay" + i + "'/>";
				row.insertCell(1).innerHTML = "<textarea  rows='4' cols='15' id = 'areaTenChuong_" + i + "' name = 'areaTenChuong_" + i + "'>" + tenChuong[i - 1] + "</textarea>" + err;
				document.getElementById('areaTenChuong_' + i).onclick = (function(d) {return function(){ showPopUp(d); }})(i);
				row.insertCell(2).innerHTML = "-";
				row.insertCell(3).innerHTML = "-";
				row.insertCell(4).innerHTML = "-";
				row.insertCell(5).innerHTML = "-";
				row.insertCell(6).innerHTML = "-";
				row.insertCell(7).innerHTML = "-";
				
				if(truongHop == 1)
				{
					row.cells[2].id = "td_" + i + "_" + 2;
					if(lyThuyet != 0)
						row.cells[2].onclick = (function(a,b) {return function(){ doiKieuDay(a,b); }})(i, 2);
					row.cells[3].id = "td_" + i + "_" + 3;
					if(thucHanh != 0)
						row.cells[3].onclick = (function(a,b) {return function(){ doiKieuDay(a,b); }})(i, 3);
					if(tichHop != 0)
						row.cells[4].onclick = (function(a,b) {return function(){ doiKieuDay(a,b); }})(i, 4);
					row.cells[7].id = "td_" + i + "_" + 7;
					if(document.getElementById('KiemTra').value != '0')
						row.cells[7].onclick = (function(a,b) {return function(){ doiKieuDay(a,b); }})(i, 7);
				}
				if(lyThuyet1 != 0)
					document.getElementById('KieuDay' + i).value = "0";
				else
					document.getElementById('KieuDay' + i).value = "1";
				if(Math.round(parseFloat(document.getElementById('KiemTra').value)/tongSo + 0.4) > soDong - i)
				{
					/*if(parseInt(document.getElementById('KiemTra').value) % tongSo != 0 && Math.round(parseFloat(document.getElementById('KiemTra').value)/parseInt(document.getElementById('SoTiet').value) + 0.4) - 1 == soDong - i)
					{
						if(tongSo - parseInt(document.getElementById('KiemTra').value) % tongSo > lyThuyet1)
						{
							row.insertCell(2).innerHTML = lyThuyet1;
							row.insertCell(3).innerHTML = tongSo - parseInt(document.getElementById('KiemTra').value) % tongSo - lyThuyet1;
						}
						else
						{
							row.insertCell(2).innerHTML = tongSo - parseInt(document.getElementById('KiemTra').value) % tongSo;
							row.insertCell(3).innerHTML = 0;
						}*/
						//moi
					if(parseInt(document.getElementById('KiemTra').value) < tongSo)	{
						if(truongHop != 3)
						{
							row.cells[2].innerHTML = lyThuyet1;
							if(tongSo - lyThuyet1 - parseInt(document.getElementById('KiemTra').value) == 0)
								row.cells[3].innerHTML = "-";
							else
								row.cells[3].innerHTML = tongSo - lyThuyet1 - parseInt(document.getElementById('KiemTra').value);
							//
						}
						else
							row.cells[4].innerHTML = tichHop;
						row.cells[7].innerHTML = document.getElementById('KiemTra').value;
						if(document.getElementById('KiemTra').value != '0')
							document.getElementById('KieuDay' + i).value = "4";
					}
					else
					{
						row.cells[7].innerHTML = tongSo;
						document.getElementById('KieuDay' + i).value = "4";
					}
				}
				else
				{
					if(truongHop != 3) 
					{
					 	row.cells[2].innerHTML = lyThuyet1;
						row.cells[3].innerHTML = tongSo - lyThuyet1;
					}
					else
						row.cells[4].innerHTML = tichHop;
				}
				row.insertCell(8).innerHTML = tongSo;
				err = "";
			}
			
		}
		else
		{
			if(soDongDaCo > 0)
			{
				for(var i=1;i<=soDongDaCo;i++)
				{
					table.deleteRow(2);
				}
			}
		}
		document.getElementById('SoDong').value = soDong;
		if(truongHop != 3)
		{
			table.rows[soDong+2].cells[2].innerHTML = document.getElementById('LyThuyet').value;
			table.rows[soDong+2].cells[3].innerHTML = document.getElementById('ThucHanh').value;
			table.rows[soDong+2].cells[4].innerHTML = document.getElementById('TichHop').value;
		}
		else
		{
			table.rows[soDong+2].cells[2].innerHTML = 0;
			table.rows[soDong+2].cells[3].innerHTML = 0;
			table.rows[soDong+2].cells[4].innerHTML = parseInt(document.getElementById('ThoiGianMonHoc').value) - parseInt(document.getElementById('KiemTra').value);
		}
		table.rows[soDong+2].cells[7].innerHTML = document.getElementById('KiemTra').value;
		table.rows[soDong+2].cells[8].innerHTML = document.getElementById('ThoiGianMonHoc').value;
	}	
	function doiKieuDay(x, y)
	{
		var tiet = parseInt(document.getElementById('SoTiet').value);
		if(y == 2)
		{
			document.getElementById('KieuDay' + x).value = "0";
			kieuDayLyThuyet[x-1] = tiet;
			document.getElementById('td_' + x + '_' + 2).innerHTML = tiet;
			document.getElementById('td_' + x + '_' + 3).innerHTML = "-";
			document.getElementById('td_' + x + '_' + 7).innerHTML = "-";
		}
		else if (y == 3)
		{
			document.getElementById('KieuDay' + x).value = "1";
			kieuDayLyThuyet[x-1] = 0;
			document.getElementById('td_' + x + '_' + 3).innerHTML = tiet;
			document.getElementById('td_' + x + '_' + 2).innerHTML = "-";
			document.getElementById('td_' + x + '_' + 7).innerHTML = "-";
		}
		else
		{
			document.getElementById('KieuDay' + x).value = "4";	
			kieuDayLyThuyet[x-1] = 0;
			document.getElementById('td_' + x + '_' + 7).innerHTML = tiet;
			document.getElementById('td_' + x + '_' + 3).innerHTML = "-";
			document.getElementById('td_' + x + '_' + 2).innerHTML = "-";
		}
	}
	function showPopUp(index)
	{
		var valueArea = document.getElementById('areaTenChuong_' + index).value;
		var value = window.showModalDialog(duongDan + "NhapText.jsp",valueArea,"dialogHeight: 450px; dialogWidth: 450px; dialogTop: 120px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value!=false && value != null)
			document.getElementById('areaTenChuong_' + index).value = value;		
	}
	function inputMucTieu(index)
	{
		var valueArea = document.getElementById('txtMucTieu_' + index).value;
		var value = window.showModalDialog(duongDan + "NhapMucTieu.jsp",valueArea,"dialogHeight: 450px; dialogWidth: 450px; dialogTop: 120px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value!=false && value != null)
			document.getElementById('txtMucTieu_' + index).value = value;	
	}
	function browse()
	{
		var value = window.showModalDialog(duongDan + "FileDCMH.jsp","","dialogHeight: 450px; dialogWidth: 550px; dialogTop: 120px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value!=false && value != null)
		{
			document.getElementById('txtFile').value = value;
		}	
	}
	function isEmpty() {
		return true;
	}
	function submitForm(){
		var checkNoiDung = true;
		if(truongHop == 1)
		{
			var soLT = 0, soTH = 0, soKT = 0;
			var tiet = parseInt(document.getElementById('SoTiet').value);
			for(var i=1;i<=parseInt(document.getElementById('ThoiGianMonHoc').value)/tiet;i++)
			{
				if(document.getElementById('KieuDay' + i).value == '0')	
					soLT++;
				else if(document.getElementById('KieuDay' + i).value == '1')
					soTH++;
				else
					soKT++;
			}
			if(parseInt(document.getElementById('LyThuyet').value)/tiet != soLT || parseInt(document.getElementById('ThucHanh').value)/tiet != soTH || parseInt(document.getElementById('KiemTra').value)/tiet != soKT)
			{
				alert("Số nội dung lý thuyết và thực hành không đúng !!!");
				checkNoiDung = false;
			}
		}
		if(checkNoiDung)
			document.forms["DCMH"].submit();
	}
	function confirmSending() {
		if (confirm('Bạn có chắc muốn gửi đề cương này không ?')) {
			document.DCMH.GuiTruongKhoa.value = 'GuiTruongKhoa';
			submitForm();
		}
		//return false;
	}
	function submitFormSoSanh(){
		if(document.getElementById('SoSanh').value == '')
		{
			alert("Hãy chọn đề cương muốn so sánh");
			return;
		}
		document.forms["SoSanhDCMH"].submit();
	}
	function changeSoSanh()
	{
		document.getElementById('SoSanh').value = document.getElementById('cboSoSanh').value;
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
			value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: 150px; dialogWidth: 150px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
			if(value != false && value != null)
			{
				act = 'Reject';
				document.getElementById('Duyet').value = act;
				document.getElementById('LyDoReject').value = value;
			}
			else
				return;
		}
		if(confirm("Bạn có chắc muốn " + act + " đề cương này không?"))
			document.forms["Duyet1DCMH"].submit();	
	}
	function xuLyFile(x)
	{	
		if(x == 2)
		{
			document.getElementById('txtXuLyFile').value = 'GhiFile';
			submitForm();
		} 
		else if(x == 1) 
		{
			var f = document.getElementById('txtFile').value;
			if(f != "")
			{
				f = f.split("[")[1];
				f = f.split("]")[0];
				var chuoi = f.split("-");
				if(chuoi[0] == document.getElementById('monHoc').value && chuoi[1] == document.getElementById('txtLyThuyetCTDT').value && chuoi[2] == document.getElementById('txtThucHanhCTDT').value)
				{
					if(confirm("Dữ liệu bạn đang nhập có thể bị mất, có muốn tiếp tục không???"))
					{
						document.getElementById('txtXuLyFile').value = 'DocFile';
						submitForm();
					}
				}
				else
				{
					alert("File bạn chọn không phù hợp. Lý do :\n1/Môn học không đúng.\n2/Số tiết lý thuyết và thực hành không đúng.");
				}
			}
			else
			{
				alert("Hãy chọn file !!!");
			}
		}
	}
</script>
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Thêm Dề Cương Môn Học</title>
</head>
<body onload="loadPage();">
<c:choose>	 
		<c:when test="${not empty param.maID}">
			<c:set var = "DeCuongMonHoc" value = '<%= DeCuongMonHocDAO.getDeCuongMonHocByID(request.getParameter("maID")) %>' scope="session"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var = "DeCuongMonHoc" value = "${requestScope.deCuongMonHoc}" scope="session"></c:set>
		</c:otherwise>
</c:choose>	
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var="maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "Truong_Khoa" value="<%=Constant.TRUONG_KHOA %>"></c:set>
	<c:set var = "Pho_Khoa" value="<%=Constant.PHO_KHOA %>"></c:set>
	<c:set var = "Giao_vien" value="<%=Constant.GIAO_VIEN %>"></c:set>
	<c:set var = "Truong_Bo_Mon" value="<%=Constant.TRUONG_BO_MON %>"></c:set>
	
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	
	<c:set var = "NEW" value = '<%= Constant.TINHTRANG_NEW %>'></c:set>
	<c:set var = "SEND" value = '<%= Constant.TINHTRANG_SEND %>'> </c:set>
	<c:set var = "APPROVE" value = '<%= Constant.TINHTRANG_APPROVE %>'> </c:set>
	<c:set var = "REJECT" value = '<%= Constant.TINHTRANG_REJECT %>'> </c:set>
		<c:if test="${not empty param.errTrung}">
			<b class="error"> Môn học của chương trình đào tạo này đã tồn tại </b>
		</c:if>
		<c:if test="${not empty param.err}">
			<b class="error"> Nhập liệu vào các ô bắt buộc (*) </b>
		</c:if>
		<c:if test="${not empty param.msg and param.msg eq 'ThemMoi'}">
			<b class="msg"> Thêm mới "ĐỀ CƯƠNG MÔN HỌC" thành công </b>
		</c:if>
		<c:if test="${(not empty param.msg and param.msg eq 'CapNhat')
							or (not empty requestScope.msgDeleteRow)}">
			<b class="msg"> Cập nhật "ĐỀ CƯƠNG MÔN HỌC" thành công </b>
		</c:if>	
		<c:if test="${not empty param.GhiFile}">
			<b class="error"> Ghi file thành công </b>
		</c:if>
		<c:if test="${not empty param.GhiFileError}">
			<b class="error"> Ghi file không thành công </b>
		</c:if>
		
	<form action="<%=request.getContextPath()%>/deCuongMonHocController?them=yes" method="post" name="DCMH">
		<table width = "800" style="background-color: transparent;">
			<tr style="background-color: transparent;"><td><div class = "div_tr">Trường TCNKTCN Hùng Vương<br />
			Khoa: <input type = "text" id = "TenKhoa" name = "txtTenKhoa" style="background-color: transparent;" readonly="readonly" value="${DeCuongMonHoc.tenKhoa}"/></div>
			</td></tr>
			<tr style="background-color: transparent;"><td><font size="5"><strong>ĐỀ CƯƠNG CHI TIẾT CHƯƠNG TRÌNH MÔN HỌC</strong></font><br /><br /></td></tr>
		<c:choose>
			<c:when test = "${not empty param.maID}">
				<c:set var = "ChuongTrinhList" value = "<%=ChuongTrinhDaoTaoDAO.getAllChuongTrinh() %>"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var = "ChuongTrinhList" value = "<%=ChuongTrinhDaoTaoDAO.getAllChuongTrinhChuaDuyet() %>"></c:set>
			</c:otherwise>
		</c:choose>
		
			<tr style="background-color: transparent;"><td><div class = "div_tr">-	Tên chương trình 
				<select id = "ChuongTrinh" name = "cboChuongTrinh" onchange="selectChuongTrinh();"
				<c:if test = "${not empty DeCuongMonHoc.maDeCuongMonHoc}">disabled</c:if>>
					<option value = "" >--Select--</option>
			 		<c:forEach var = "ChuongTrinh" items="${ChuongTrinhList}">
						<option <c:if test="${ChuongTrinh.maChuongTrinhDaoTao eq DeCuongMonHoc.maChuongTrinh}">selected</c:if> value="${ChuongTrinh.maChuongTrinhDaoTao}">${sf:upperString(ChuongTrinh.tenNghe)} - Khóa ${ChuongTrinh.maKhoa}</option>
					</c:forEach>
				</select><c:if test="${not empty param.err and DeCuongMonHoc.maChuongTrinh eq ''}"><b class="error">(*)</b></c:if>
				</div></td></tr>
			<tr style="background-color: transparent;"><td><div class = "div_tr">-	Tên môn học  
					<select id= "monHoc" name = "cboMonHoc" onchange="selectMonHoc();"
						<c:if test = "${not empty DeCuongMonHoc.maDeCuongMonHoc}">disabled</c:if>>
						<option value="">--Select--</option>
					</select><c:if test="${not empty param.err and DeCuongMonHoc.maMonHoc eq ''}"><b class="error">(*)</b></c:if>
					<input type="hidden" value="" name="txtTenMonHoc" id="TenMonHoc"/>
				</div></td></tr>
			<tr style="background-color: transparent;"><td><div class = "div_tr">-	Số tiết mỗi buổi 
						<select id="SoTiet" name="cboSoTiet" onchange="checkSoTiet();" onclick="clickSoTiet();">
							<c:forEach var = "count" begin = "1" end="5">
								<option <c:if test="${count eq DeCuongMonHoc.soTietHocMotBuoi}">selected</c:if> value="${count }">${count }</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_tr">
					Kiểu biên soạn : 
					<input type = "radio" value="LT/TH" name = "Kieu" onclick="changeKieuBienSoan();" 
						<c:if test = "${empty DeCuongMonHoc.kieuBienSoan or DeCuongMonHoc.kieuBienSoan eq '0'}">checked</c:if> />Lý Thuyết/Thực Hành
					<input type = "radio" value="LT+TH" name = "Kieu" onclick="changeKieuBienSoan();"
						<c:if test = "${DeCuongMonHoc.kieuBienSoan eq '1'}">checked</c:if>/>Lý Thuyết + Thực Hành
					<input type = "radio" value="TichHop" name = "Kieu" onclick="changeKieuBienSoan();"
						<c:if test = "${DeCuongMonHoc.kieuBienSoan eq '2'}">checked</c:if>/>Tích hợp
					</div>
				</td>	
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_tr">
						-	Thời gian môn học  <input type = "text" id = "ThoiGianMonHoc" size = "" style="background-color: transparent;" name="txtThoiGianMonHoc" readonly="readonly" value="0"/>
					</div> 
					<Table>
						<tr style="background-color: transparent;">
							<td>Lý thuyết</td>
							<td><input type = "text" id = "LyThuyet" size = "" style="background-color: transparent;" name="txtLyThuyet" readonly="readonly" value="0"/> 
							<input type = "hidden" id = "txtLyThuyetCTDT"  name="txtLyThuyetCTDT" value = "0"/></td>
							<td>Thực hành</td>
							<td><input type = "text" id = "ThucHanh" size = ""  style="background-color: transparent;" name="txtThucHanh" readonly="readonly" value="0"/> 
							<input type = "hidden" id = "txtThucHanhCTDT"  name="txtThucHanhCTDT" value = "0"/></td>
						</tr>
						<tr style="background-color: transparent;">
							<td>Tích Hợp</td>
							<td><input type = "text" id = "TichHop" size = ""  style="background-color: transparent;" name="txtTichHop" readonly="readonly" value="0"/> 
							<input type = "hidden" id = "txtTichHopCTDT"  name="txtTichHopCTDT" value = "0"/></td>
							<td>Kiểm tra</td>
							<td><input type = "text" id = "KiemTra" size = "" style="background-color: transparent;" name="txtKiemTra" onblur="changeKiemTra();" value="0"/></td>
						</tr>
					</Table>
						 
						 
							
						 
						 
				</td>
			</tr>
				<c:if test="${empty DeCuongMonHoc.maDeCuongMonHoc}">
					<tr style="background-color: transparent;">
						<td>
							Chọn đề cương : <input type="text" name="txtFile" id = "txtFile" value = ""/> 
							<input type="button" value = "Browse" onclick="browse();"/>
							<input type="button" value = "Sao chép từ file" onclick="xuLyFile(1);"/>
						</td>
					</tr>
				</c:if>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_tr">
						-	Vị trí môn học <br />
						<textarea  rows="2" cols="70"  style="background-color: transparent;" id="ViTriMonHoc" name="areaViTriMonHoc">${DeCuongMonHoc.viTriMonHoc }</textarea>
						<c:if test="${not empty param.err and DeCuongMonHoc.viTriMonHoc eq ''}"><b class="error">(*)</b></c:if>
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_tr">
						-	Tính chất môn học <br />
						<input type="text" style="background-color: transparent;" id="TinhChatMonHoc" name="areaTinhChatMonHoc" readonly="readonly"/>
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_tr"><strong>
						I/ Mục tiêu đào tạo môn học:
					</strong></div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_tr">
						<ul><ol>
							<li>Kiến thức chuyên môn:</li><br />
								<textarea rows="2" cols="70"  style="background-color: transparent;" name="areaMucTieu1" id="MucTieu1">${DeCuongMonHoc.mucTieu1}</textarea>
								<c:if test="${not empty param.err and DeCuongMonHoc.mucTieu1 eq ''}"><b class="error">(*)</b></c:if>
							<li>Kỹ năng nghề:</li><br />
								<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaMucTieu2" id="MucTieu2">${DeCuongMonHoc.mucTieu2}</textarea>
								<c:if test="${not empty param.err and DeCuongMonHoc.mucTieu2 eq ''}"><b class="error">(*)</b></c:if>
							<li>Thái độ lao động:</li><br />
								<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaMucTieu3" id="MucTieu3">${DeCuongMonHoc.mucTieu3}</textarea>
								<c:if test="${not empty param.err and DeCuongMonHoc.mucTieu3 eq ''}"><b class="error">(*)</b></c:if>
							<li>Các kỹ năng cần thiết khác:</li> <br />
								<textarea  rows="2" cols="70" style="background-color: transparent;" name="areaMucTieu4" id="MucTieu4">${DeCuongMonHoc.mucTieu4}</textarea>
								<c:if test="${not empty param.err and DeCuongMonHoc.mucTieu4 eq ''}"><b class="error">(*)</b></c:if>
						</ol></ul>
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;"><td><div class = "div_tr"><strong>II/ Tổng quát về chương trình:</strong></div></td></tr>
			<tr style="background-color: transparent;"><td><div class = "div_tr">
				<ul><ol>
					<li>Điều kiện thực hiện môn học:</li><br/>
						-	Máy móc, trang thiết bị, công cụ :<br />
							<textarea  rows="2" cols="70"  style="background-color: transparent;" name="areaDieuKien1" id="DieuKien1">${DeCuongMonHoc.dieuKien1}</textarea>
							<c:if test="${not empty param.err and DeCuongMonHoc.dieuKien1 eq ''}"><b class="error">(*)</b></c:if><br />
						-	Nguyên vật liệu thực hành :<br />
							<textarea  rows="2" cols="70"  style="background-color: transparent;" name="areaDieuKien2" id="DieuKien2">${DeCuongMonHoc.dieuKien2}</textarea>
							<c:if test="${not empty param.err and DeCuongMonHoc.dieuKien2 eq ''}"><b class="error">(*)</b></c:if><br />
						-	Phương tiện giảng dạy :<br />
							<textarea  rows="2" cols="70"  style="background-color: transparent;" name="areaDieuKien3" id="DieuKien3">${DeCuongMonHoc.dieuKien3}</textarea>
							<c:if test="${not empty param.err and DeCuongMonHoc.dieuKien3 eq ''}"><b class="error">(*)</b></c:if><br />
						-	Phiếu hướng dẫn thực hiện (môn thực hành) :<br />
							<textarea  rows="2" cols="70"  style="background-color: transparent;" name="areaDieuKien4" id="DieuKien4">${DeCuongMonHoc.dieuKien4}</textarea>
							<c:if test="${not empty param.err and DeCuongMonHoc.dieuKien4 eq ''}"><b class="error">(*)</b></c:if><br />
					<li>Phương pháp và nội dung đánh giá:</li><br/>
						-	Lý thuyết:<br />
							<textarea  rows="2" cols="70"  style="background-color: transparent;" name="areaPhuongPhap1" id="PhuongPhap1">${DeCuongMonHoc.phuongPhap1}</textarea>
							<c:if test="${not empty param.err and DeCuongMonHoc.phuongPhap1 eq ''}"><b class="error">(*)</b></c:if><br />
						-	Thực hành:<br />
							<textarea  rows="2" cols="70"  style="background-color: transparent;" name="areaPhuongPhap2" id="PhuongPhap2">${DeCuongMonHoc.phuongPhap2}</textarea>
							<c:if test="${not empty param.err and DeCuongMonHoc.phuongPhap2 eq ''}"><b class="error">(*)</b></c:if><br />
						-	Nội dung:<br />
							<textarea  rows="2" cols="70"  style="background-color: transparent;" name="areaPhuongPhap3" id="PhuongPhap3">${DeCuongMonHoc.phuongPhap3}</textarea>
							<c:if test="${not empty param.err and DeCuongMonHoc.phuongPhap3 eq ''}"><b class="error">(*)</b></c:if><br />
				</ol></ul>
			</div></td></tr>
			<tr style="background-color: transparent;"><td><div class = "div_tr"><strong>III/ Phân phối chương trình môn học:</strong></div></td></tr>
		</table>
		<table border = "1" width = "800" style="background-color: transparent;" id="TableNoiDungDCMH"> 
				<tr style="background-color: transparent;">
					<td rowspan = "2">TT</td>
					<td rowspan = "2">Nội dung<br />(chương trình, bài học)</td>
					<td colspan = "6">Số tiết</td>
				</tr>
				<tr style="background-color: transparent;">
					<td>
					Lý thuyết
					</td>
					<td>
					Thực hành
					</td>
					<td>
					Tích hợp
					</td>
					<td>
					Thực nghiệm
					</td>
					<td>
					Bài tập
					</td>
					<td>
					Kiểm tra
					</td>
					<td>
					Cộng
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td widtd="160">TỔNG CỘNG</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr> 
		</table>
	<input type="hidden" id = "SoDong" value = "0"/>
		<table width = "800" style="background-color: transparent;"> 
			<tr style="background-color: transparent;">
				<td></td>
				<td><input type = "text" size = 8 style="background-color: transparent;" value="${DeCuongMonHoc.ngayDuyet }"/></td>
				<td>Quận 5, ngày <input type = "text" id="txtCalendar" size = 8 name="txtCalendar" style="background-color: transparent;" value="${DeCuongMonHoc.ngayCapNhatCuoi }"/></td>
			</tr>
			<tr style="background-color: transparent;">
				<td>Hiệu trưởng<br/><br/><br/></td>
				<td>Trưởng khoa<br/><br/><br/>${DeCuongMonHoc.tenNguoiDuyet}</td>
				<td>Giáo viên biên soạn<br/><br/><br/>${DeCuongMonHoc.tenNguoiTao}</td>
			</tr>
	<tr style="background-color: transparent;">
		<td colspan="3"><input type="hidden" name="actionType" style="background-color: transparent;"
			<c:choose>				
				<c:when test="${empty DeCuongMonHoc.maDeCuongMonHoc}">
					value="ThemMoi"
				</c:when>
				<c:otherwise>
					value="CapNhat"
				</c:otherwise>	
			</c:choose>  
		/>	
  		<c:if test = "${MaBoPhan eq BO_PHAN_ADMIN or DeCuongMonHoc.tinhTrang eq null or DeCuongMonHoc.maNguoiTao eq maThanhVien}"> 
			<c:choose>
				<c:when test="${DeCuongMonHoc.tinhTrang eq NEW or DeCuongMonHoc.tinhTrang eq REJECT or DeCuongMonHoc.tinhTrang eq null}">
					<!--  <input type = "submit" name="TaoMoi" -->
					<a href = "javascript: submitForm()" name="TaoMoi"> 
					<c:choose>
						<c:when test="${empty DeCuongMonHoc.maDeCuongMonHoc}">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Tạo mới" border = "0" />
						</c:when>
						<c:otherwise>							
							<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập Nhật" border = "0" />
						</c:otherwise>
					</c:choose> </a>					
					<c:choose>
						<c:when test="${not empty DeCuongMonHoc.maDeCuongMonHoc}">							
							<a href = "javascript: confirmSending()">
								<input type="hidden" name="GuiTruongKhoa" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/guitruongkhoa.png" alt="Gửi Trưởng Khoa" border = "0" />
							</a>
						</c:when>				
					</c:choose>
				</c:when> 
			</c:choose>	
		</c:if>	
		<!--<c:set var="check" value=""></c:set>
	--><c:if test="${DeCuongMonHoc.tinhTrang ne null and ((vaiTro eq Giao_vien and DeCuongMonHoc.maNguoiTao eq maThanhVien) or vaiTro ne Giao_vien)}">	
			<a href = "javascript: xuLyFile(2);">	
				<input type="hidden" name="Copy" value = "" />							 
				<img src="<%=request.getContextPath()%>/images/buttom/saochep.png" alt="Sao chép" border = "0" />
			</a>									
		</c:if>
		<!--DeCuongMonHoc.status eq APPROVE and ( khi tình trang approve mới in--> 
		<c:if test="${DeCuongMonHoc.status ne null and ((vaiTro eq Giao_vien and DeCuongMonHoc.maNguoiTao eq maThanhVien) or vaiTro ne Giao_vien)}">										
			<a href = "<%=Constant.PATH_RES.getString("iso.InDeCuongMonHocPath") %>">								 
				<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
		</c:if>
		<c:if test="${not empty DeCuongMonHoc.maDeCuongMonHoc}">	
				<c:set var = "ListDCMHApproved" value='<%=DeCuongMonHocDAO.getAllDeCuongMonHocApproved()%>'></c:set>
			<c:if test="${(vaiTro eq Truong_Khoa or MaBoPhan eq BO_PHAN_ADMIN or vaiTro eq Truong_Khoa) and DeCuongMonHoc.tinhTrang ne NEW and DeCuongMonHoc.tinhTrang ne null and DeCuongMonHoc.status ne APPROVE}">
				<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Reject" border="1"/> </a>
			</c:if>			
				<select name = "cboSoSanh" onclick="changeSoSanh();" id="cboSoSanh">
						<option value="">--Select--</option>
					<c:forEach  var="DCMHApproved" 
							items = "${ListDCMHApproved}">
						<c:if test="${DCMHApproved.maDeCuongMonHoc ne DeCuongMonHoc.maDeCuongMonHoc}">
							<c:choose>
								<c:when test="${vaiTro eq Truong_Bo_Mon}">
									<c:if test="${maThanhVien eq DCMHApproved.maNguoiTao and DCMHApproved.maMonHoc eq DeCuongMonHoc.maMonHoc}">
										<option value="${DCMHApproved.maDeCuongMonHoc}">${DCMHApproved.tenDeCuongMonHoc}</option>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${DCMHApproved.maMonHoc eq DeCuongMonHoc.maMonHoc}">
										<option value="${DCMHApproved.maDeCuongMonHoc}">${DCMHApproved.tenDeCuongMonHoc}</option>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:if>	
					</c:forEach>
				</select>	
		<a href = "javascript: submitFormSoSanh()">									 
			<img src="<%=request.getContextPath()%>/images/buttom/sosanh.png" alt="So sánh" border = "0" />
		</a>
		</c:if>
		<c:if test="${(vaiTro eq Truong_Khoa or MaBoPhan eq BO_PHAN_ADMIN or vaiTro eq Pho_Khoa) and DeCuongMonHoc.tinhTrang ne NEW and DeCuongMonHoc.tinhTrang ne null and DeCuongMonHoc.status ne APPROVE}">
			<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" border="1"/> </a>
		</c:if>
		</td>
	</tr>
		</table>
		<input type="hidden" id = "txtXuLyFile" name = "txtXuLyFile" value = ""/>
	</form>
	<form method="post" action="<%=request.getContextPath()%>/deCuongMonHocController?sosanh=yes" name="SoSanhDCMH">	
		<input type="hidden" name="SoSanh" value = "" id="SoSanh"/>	
	</form>
	<form method="post" action="<%=request.getContextPath()%>/deCuongMonHocController?duyet1DeCuong=yes&maDeCuong=${DeCuongMonHoc.maDeCuongMonHoc}" name="Duyet1DCMH">	
		<input type="hidden" name="Duyet" value = "" id="Duyet"/>
		<input type="hidden" name="LyDoReject" value="" id = "LyDoReject"/>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
<script type="text/javascript">
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtCalendar",
	button            : "Calendar",
	ifFormat          : "%m-%d-%Y"
  });
//]]>
 </script>
</body>
</html>