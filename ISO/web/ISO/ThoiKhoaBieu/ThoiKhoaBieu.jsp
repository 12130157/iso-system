<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.HeDaoTaoModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.HeDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TuanLeModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.SuDungModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SuDungDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietTKBModel"%><html>
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
var duongDan = '';
var arrSuDungKhongThuocTKB = new Array();
var arrSuDungThuocTKB = new Array();
<%
	int size1 = 0, size2 = 0;
	ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
	if(request.getParameter("maID") != null) {
		thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuByID(request.getParameter("maID"));
	}
	if(request.getAttribute("thoiKhoaBieu") != null)
	{
		thoiKhoaBieuModel = (ThoiKhoaBieuModel) request.getAttribute("thoiKhoaBieu");
		//thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuByID(thoiKhoaBieuModel.getMaThoiKhoaBieu());
		out.print("duongDan = 'ISO/ThoiKhoaBieu/';");
	}	
	ArrayList<TuanLeModel> tuanLeModelList = TuanLeDAO.getAllTuanLe();
	ArrayList<NamHocModel> namHocModelList = NamHocDAO.getAllNamHoc();
	
%>
var maChuongTrinh = '';
var hocKi = '';
var rowSang = 0, rowChieu = 0;
var soNam;
var namBatDau;
var obj = new Object();
var monHocList = new Array(); // mang chua cac mon hoc da tao tkb
var tuanLe = new Array(); 
var soHocSinh = "";
var addTKB = new Array(); // mang chua toan bo chi tiet ve cac mon hoc
var ngay = new Array();
var maNamHoc, maTKB;
function pageLoad()
{
	<%
	String str = "";
	out.print("if('" + request.getParameter("Them") + "' == 'null' || " + request.getParameter("maID") + " != null){");
	out.print("if('" + thoiKhoaBieuModel.getMaLop() + "' != '') {");
	out.print("document.getElementById('Lop').value = '" + thoiKhoaBieuModel.getMaLop() + "';");
	out.print("selectLop(); ");
	out.print("if('" + thoiKhoaBieuModel.getHocKi() + "' != '') ");
	out.print("document.getElementById('HocKi').value = '" + thoiKhoaBieuModel.getHocKi() + "';");
	out.print("if('" + thoiKhoaBieuModel.getNam1() + "' != '') {");
	out.print("document.getElementById('Nam1').value = '" + thoiKhoaBieuModel.getNam1() + "';");
	out.print("selectNam1();}");
	out.print("if('" + thoiKhoaBieuModel.getTuanBatDau() +"' != '') {");
	out.print("document.getElementById('TuanBatDau').value = '" + thoiKhoaBieuModel.getTuanBatDau() + "';");
	out.print("document.getElementById('TuNgay').value = '" + thoiKhoaBieuModel.getNgayBatDau() + "';");
	out.print("tuanLe[0] = document.getElementById('TuanBatDau').value;}");
	out.print("if('" + thoiKhoaBieuModel.getTuanKetThuc() +"' != '') {");
	out.print("document.getElementById('TuanKetThuc').value = '" + thoiKhoaBieuModel.getTuanKetThuc() + "';");
	out.print("document.getElementById('DenNgay').value = '" + thoiKhoaBieuModel.getNgayKetThuc() + "';");
	out.print("tuanLe[1] = document.getElementById('TuanKetThuc').value;} }");
	if(thoiKhoaBieuModel.getMonHocTKBModelList() != null) {
		for(int i=0;i<thoiKhoaBieuModel.getMonHocTKBModelList().size();i++) {
			MonHocTKBModel monHocTKB = thoiKhoaBieuModel.getMonHocTKBModelList().get(i);
			out.print("var monHoc = new Object();");// tao obj chua ten mon hoc va ma mon hoc
			out.print("var objTKB = new Object();");
			out.print("monHoc.maMonHoc = '" + monHocTKB.getMaMonHoc() + "';");
			out.print("monHoc.tenMonHoc = '" + monHocTKB.getTenMonHoc() + "';");
			out.print("monHocList[monHocList.length] = monHoc;");
			out.print("objTKB.tenMonHoc = '" + monHocTKB.getTenMonHoc() + "';");
			out.print("objTKB.tenGiaoVien = '" + monHocTKB.getTenGiaoVien() + "';");
			if(monHocTKB.getNgayBatDauLT() != null)
				out.print("objTKB.ngayBatDauLT = '" + monHocTKB.getNgayBatDauLT().replace("-","/") + "';");
			else
				out.print("objTKB.ngayBatDauLT = '" + monHocTKB.getNgayBatDauLT() + "';");
			if(monHocTKB.getNgayBatDauTH() != null )
				out.print("objTKB.ngayBatDauTH = '" + monHocTKB.getNgayBatDauTH().replace("-","/") + "';");
			else
				out.print("objTKB.ngayBatDauTH = '" + monHocTKB.getNgayBatDauTH() + "';");	
			if(monHocTKB.getNgayKetThucLT() != null)
				out.print("objTKB.ngayKetThucLT = '" + monHocTKB.getNgayKetThucLT().replace("-","/") + "';");
			else
				out.print("objTKB.ngayKetThucLT = '" + monHocTKB.getNgayKetThucLT() + "';");
			if(monHocTKB.getNgayKetThucTH() != null)
				out.print("objTKB.ngayKetThucTH = '" + monHocTKB.getNgayKetThucTH().replace("-","/") + "';");
			else
				out.print("objTKB.ngayKetThucTH = '" + monHocTKB.getNgayKetThucTH() + "';");
			out.print("objTKB.ghiChu = '" + monHocTKB.getGhiChu() + "';");
			
			out.print("objTKB.maMonHoc = '" + monHocTKB.getMaMonHoc() + "';");
			out.print("objTKB.maGiaoVien = '" + monHocTKB.getMaGiaoVien() + "';");
			out.print("objTKB.maMonHocTKB = '" + monHocTKB.getMaMonHocTKB() + "';");
			out.print("objTKB.chuoiThuTrongTuan = '" + monHocTKB.getChuoiThuTrongTuan() + "';");
			out.print("objTKB.phongLT = '" + monHocTKB.getChuoiPhongLT() + "';");
			out.print("objTKB.phongTH = '" + monHocTKB.getChuoiPhongTH() + "';");
			out.print("objTKB.soNoiDung = '" + monHocTKB.getSoNoiDung() + "';");
			out.print("objTKB.soCaThucHanh = '" + monHocTKB.getSoCaThucHanh() + "';");
			out.print("objTKB.soCaLyThuyet = '" + monHocTKB.getUser4() + "';");
			out.print("objTKB.kieuBienSoan = '" + monHocTKB.getKieuBienSoan() + "';");
			out.print("objTKB.soTietLT = '" + monHocTKB.getLyThuyetCTMH() + "';");
			out.print("objTKB.soTietTH = '" + monHocTKB.getThucHanhCTMH() + "';");
			out.print("objTKB.tuanBatDauLT = '" + monHocTKB.getTuanBatDauLT() + "';");
			out.print("objTKB.tuanBatDauTH = '" + monHocTKB.getTuanBatDauTH() + "';");
			out.print("objTKB.maPhongLT = '" + monHocTKB.getUser1() + "';");
			out.print("objTKB.maPhongTH = '" + monHocTKB.getUser2() + "';");
			out.print("objTKB.soTiet1Buoi= '" + monHocTKB.getSoTietHoc1Buoi() + "';");
			out.print("var arrChiTiet = new Array();");
			
			
			for(int j=0;j<monHocTKB.getChiTietTKBModelList().size();j++) {
				ChiTietTKBModel chiTietTKB = monHocTKB.getChiTietTKBModelList().get(j);
				out.print("var chiTiet = new Object();");
				out.print("chiTiet.maChiTietTKB = '" + chiTietTKB.getMaChiTietTKB() + "';");
				out.print("chiTiet.buoi = '" + chiTietTKB.getBuoi() + "';");
				out.print("chiTiet.sTTNoiDung = '" + chiTietTKB.getsTTNoiDung() + "';");
				out.print("chiTiet.coHieu = '" + chiTietTKB.getCoHieu() + "';");
				out.print("chiTiet.hinhThucDay = '" + chiTietTKB.getHinhThucDay() + "';");
				out.print("chiTiet.thuTrongTuan = '" + chiTietTKB.getThuTrongTuan() + "';");
				out.print("chiTiet.phong = '" + chiTietTKB.getMaPhong() + "';");
				out.print("chiTiet.tuan = '" + chiTietTKB.getTuan() + "';");
				out.print("chiTiet.soThuTu = '" + chiTietTKB.getSoThuTu() + "';");
				out.print("chiTiet.nhom = '" + chiTietTKB.getNhom() + "';");
				
				out.print("chiTiet.tenChuong = '" + chiTietTKB.getTenChuong() + "';");
				out.print("chiTiet.mucTieu = '" + chiTietTKB.getMucTieu() + "';");
				out.print("chiTiet.tietBatDau = '" + chiTietTKB.getTietBatDau() + "';");
				//out.print("chiTiet.maSuDung = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getSuDungModelList().get(j).getMaSuDung() + "';");
				out.print("arrChiTiet[" + j + "] = chiTiet;");
				
			}	
			out.print("objTKB.chiTietTKBList = arrChiTiet;");
			out.print("addTKB[" + i + "] = objTKB;");
			out.print("createRow(objTKB, 0);");
		}
	}
	out.print("maTKB = '" + thoiKhoaBieuModel.getMaThoiKhoaBieu() + "'; }");
	//out.print("tuanLe[0] = document.getElementById('TuanBatDau').value;");
	//out.print("tuanLe[1] = document.getElementById('TuanKetThuc').value;");
	//out.print("changeButton();}");
	if(thoiKhoaBieuModel.getMaThoiKhoaBieu() != null && thoiKhoaBieuModel.getMaThoiKhoaBieu() != "") {
		out.print("document.getElementById('Lop').disabled = true;");
		out.print("document.getElementById('HocKi').disabled = true;");
		out.print("document.getElementById('Nam1').disabled = true; ");
	}
	%>	
	
	
}

function selectLop()
{
	if(document.getElementById('Lop').value != '')
	{
		<%
			ArrayList<LopHocModel> lopHocModelList = LopHocDAO.getAllLopByMaChuongTrinhApproved();
			for(int i=0;i<lopHocModelList.size();i++) {
				out.print("if(document.getElementById('Lop').value == " + lopHocModelList.get(i).getMaLopHoc() + ") {");
				out.print("document.getElementById('ChuyenNganh').value = '" + lopHocModelList.get(i).getTenChuyenNganh() + "';");
				out.print("namBatDau = " + lopHocModelList.get(i).getNamBatDau() + ";");
				out.print("soHocSinh = '" + lopHocModelList.get(i).getSoHocSinh() + "';");
				out.print("maChuongTrinh = " + lopHocModelList.get(i).getMaChuongtrinh() + "; }");
			}
			ArrayList<HeDaoTaoModel> heDaoTaoModelList = HeDaoTaoDAO.getSoNamHeDaoTao();
			for(int i=0;i<heDaoTaoModelList.size();i++) {
				out.print("if(maChuongTrinh == " + heDaoTaoModelList.get(i).getMaChuongtrinh() + ")");
				out.print("soNam = " + heDaoTaoModelList.get(i).getSoNam() + ";");
			}
		%>
		document.getElementById('Nam1').innerHTML = null;
		var nam = namBatDau;
		for(var i=1;i<=soNam;i++)
		{
			var Opt = new Option(nam, nam);
			document.getElementById('Nam1').add(Opt, undefined);
			nam += 1;
		}
		selectNam1();
	}
	else
	{
		document.getElementById('ChuyenNganh').value = "";
		document.getElementById('TuanBatDau').value = "";
		document.getElementById('TuNgay').value = "";
		document.getElementById('TuanKetThuc').value = "";
		document.getElementById('DenNgay').value = "";
		document.getElementById('HocKi').value = '1';
		document.getElementById('Nam1').innerHTML = '';
		document.getElementById('Nam1').add(new Option('--Select--', ''),undefined);
		document.getElementById('Nam2').value = '';
	}
}
function selectNam1()
{
	document.getElementById('Nam2').value = parseInt(document.getElementById('Nam1').value) + 1;
	<%
	if(namHocModelList != null) {
		for(int i=0;i<namHocModelList.size();i++) {
			out.print("if(document.getElementById('Nam1').value == '" + namHocModelList.get(i).getNamBatDau() + "')");
			out.print("maNamHoc = " + namHocModelList.get(i).getMaNamHoc() + ";");
		}
	}
	%>
	kiemTraHocKi();
}
function selectTuanBatDau() 
{
	tuanLe[0] = document.getElementById('TuanBatDau').value;
	<%
	for(int i=0;i<tuanLeModelList.size();i++) {
		out.print("if(document.getElementById('Nam1').value == " + tuanLeModelList.get(i).getNamBatDau() + ") {");
		out.print("if(document.getElementById('TuanBatDau').value == " + tuanLeModelList.get(i).getSoThuTu() + ") {");
		out.print("document.getElementById('TuNgay').value = '" + tuanLeModelList.get(i).getTuNgay() + "'; } }");
	}
	%>
}
function selectTuanKetThuc()
{
	tuanLe[1] = document.getElementById('TuanKetThuc').value;
	<%
	for(int i=0;i<tuanLeModelList.size();i++) {
		out.print("if(document.getElementById('Nam1').value == " + tuanLeModelList.get(i).getNamBatDau() + ") {");
		out.print("if(document.getElementById('TuanKetThuc').value == " + tuanLeModelList.get(i).getSoThuTu() + ") {");
		out.print("document.getElementById('DenNgay').value = '" + tuanLeModelList.get(i).getDenNgay() + "'; } }");
	}
	%>
}
function kiemTraHocKi()
{
	if(document.getElementById('HocKi').value == '1')
		hocKi = (parseInt(document.getElementById('Nam1').value) - namBatDau) * 2 + 1;
	else
		hocKi = (parseInt(document.getElementById('Nam1').value) - namBatDau) * 2 + 2;
}
function openAdd() 
{	
	var checkCapNhat = false;
	<%
	out.print("if('" + request.getParameter("Them") + "' == 'null' || " + request.getParameter("maID") + " != null){");
		out.print("if(monHocList.length == 0) {");
			out.print("if(confirm('Bạn có muốn cập nhật không, nếu không những thay đổi trong thời khóa biểu này sẽ không được lưu lại khi bạn thêm môn học???')) {");
				out.print("submitForm();");
				out.print("checkCapNhat = true; }");
			out.print("else {");
				out.print("tuanLe[0] = '" + thoiKhoaBieuModel.getTuanBatDau() + "';");
				out.print("tuanLe[1] = '" + thoiKhoaBieuModel.getTuanKetThuc() + "';");
				out.print("document.getElementById('TuNgay').value = '" + thoiKhoaBieuModel.getNgayBatDau() + "';");
				out.print("document.getElementById('DenNgay').value = '" + thoiKhoaBieuModel.getNgayKetThuc() + "';");
				out.print("document.getElementById('TuanBatDau').value = '" + thoiKhoaBieuModel.getTuanBatDau() + "';");
				out.print("document.getElementById('TuanKetThuc').value = '" + thoiKhoaBieuModel.getTuanKetThuc() + "'; } } }");
	%>
	if(checkCapNhat == false)
	{
		var value = new Object;
		obj.soHocSinh = soHocSinh;
		obj.tuanLe = tuanLe;
		obj.monHocList = monHocList;
		var maLop = document.getElementById('Lop').value;
		value = window.showModalDialog(duongDan + "AddThoiKhoaBieu.jsp?maChuongTrinh="+maChuongTrinh+"&hocKi="+hocKi+"&maNamHoc="+maNamHoc+"&maTKB="+maTKB+"&tuTuan="+tuanLe[0]+"&denTuan="+tuanLe[1]+"&maLop="+maLop,obj,"dialogHeight: 650px; dialogWidth: 750px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;");
		if(value != null)
		{
				addTKB[addTKB.length] = value;
				var monHoc = new Object();
				monHoc.maMonHoc = addTKB[addTKB.length-1].maMonHoc;
				monHoc.tenMonHoc = addTKB[addTKB.length-1].tenMonHoc;

				

				monHocList[monHocList.length] = monHoc;
				createRow(addTKB[addTKB.length-1], 0);
				//changeButton();
			
		}
	}
}
function openUpdate(x)
{
	var value = new Object;
	obj.soHocSinh = soHocSinh;
	obj.tuanLe = tuanLe;
	var maMonHocTKB = document.getElementById('cboXoaMonHoc').value;
	var index = 0;
	for(var i=0;i<addTKB.length;i++)
	{
		if(addTKB[i].maMonHocTKB == maMonHocTKB)
		{
			index = i;
			obj.monHocTKB = addTKB[i];
			break;
		}
	}
	var tableSang = document.getElementById('tableSang');
	var tableChieu = document.getElementById('tableChieu');
	var maLop = document.getElementById('Lop').value;
	value = window.showModalDialog(duongDan + "UpdateThoiKhoaBieu.jsp?maTKB="+maTKB+"&maNamHoc="+maNamHoc+"&maMonHocTKB="+maMonHocTKB + "&capNhat=" + x+"&tuTuan="+tuanLe[0]+"&denTuan="+tuanLe[1]+"&maLop="+maLop,obj,"dialogHeight: 650px; dialogWidth: 750px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;");
	if(value != null)
	{
		addTKB[index] = value;
		createRow(value,1);
	}
}
function createRow(monHocTkb, action)
{
	if(action == 0)
	{
		var opt = new Option(monHocTkb.tenMonHoc, monHocTkb.maMonHocTKB);
		document.getElementById('cboXoaMonHoc').add(opt, undefined);
	}
	var checkBuoiSang = true, checkBuoiChieu = true;
	var chuoiLT = "", chuoiTH = "";
	var trSang, trChieu;
	var tableSang = document.getElementById('tableSang');
	var tableChieu = document.getElementById('tableChieu');
	var thu = monHocTkb.chuoiThuTrongTuan.split("-");
	
	for(var i=0;i<thu.length;i++)
	{
		if((thu[i].split("/"))[2] == 'LT')
		{
			if(chuoiLT == "")
				chuoiLT += "Lý thuyết " + monHocTkb.ngayBatDauLT + "-" + monHocTkb.ngayKetThucLT + "<br/>" + "Phòng : " + monHocTkb.phongLT + "<br/>";
		}
		else
		{
			if(chuoiTH == "")
			{
				if((thu[i].split("/"))[2] == 'TH')
					chuoiTH += "Thực hành " + monHocTkb.ngayBatDauTH + "-" + monHocTkb.ngayKetThucTH + "<br/>" + "Phòng : " + monHocTkb.phongTH + "<br/>";
				else
					chuoiTH += "Kiểu dạy : tích hợp<br/>" + monHocTkb.ngayBatDauTH + "-" + monHocTkb.ngayKetThucTH + "<br/>" + "Phòng : " + monHocTkb.phongTH + "<br/>";
			}
		}
		if((thu[i].split("/"))[0] == 'Sáng' && checkBuoiSang == true)
		{
			if(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang') == null)
			{
				rowSang++;
				trSang = tableSang.insertRow(rowSang + 1);
				trSang.insertCell(0).innerHTML = "&nbsp;";
				trSang.insertCell(1).innerHTML = "&nbsp;";
				trSang.insertCell(2).innerHTML = "&nbsp;";
				trSang.insertCell(3).innerHTML = "&nbsp;";
				trSang.insertCell(4).innerHTML = "&nbsp;";
				trSang.insertCell(5).innerHTML = "&nbsp;";
				trSang.insertCell(6).innerHTML = "&nbsp;";
				trSang.insertCell(7).innerHTML = "&nbsp;";
			}
			else
			{
				trSang = document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang');
				trSang.cells[0].innerHTML = "&nbsp;";
				trSang.cells[1].innerHTML = "&nbsp;";
				trSang.cells[2].innerHTML = "&nbsp;";
				trSang.cells[3].innerHTML = "&nbsp;";
				trSang.cells[4].innerHTML = "&nbsp;";
				trSang.cells[5].innerHTML = "&nbsp;";
				trSang.cells[6].innerHTML = "&nbsp;";
				trSang.cells[7].innerHTML = "&nbsp;";
			}
			trSang.id = 'MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang';
			
			trSang.cells[0].width = "200px";
			trSang.cells[1].width = "50px";
			trSang.cells[2].width = "50px";
			trSang.cells[3].width = "50px";
			trSang.cells[4].width = "50px";
			trSang.cells[5].width = "50px";
			trSang.cells[6].width = "50px";
			trSang.cells[7].width = "50px";
			checkBuoiSang = false;
		}
		if((thu[i].split("/"))[0] == 'Sáng' && checkBuoiSang == false)
		{	
			trSang.cells[(thu[i].split("/"))[1]].innerHTML = trSang.cells[(thu[i].split("/"))[1]].innerHTML + "<br/>" + (thu[i].split("/"))[2];
		}
		if((thu[i].split("/"))[0] == 'Chiều' && checkBuoiChieu == true)
		{
			if(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu') == null)
			{
				rowChieu++;
				trChieu = tableChieu.insertRow(rowChieu + 1);
				trChieu.id = 'MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu';
				trChieu.insertCell(0).innerHTML = "&nbsp;";
				trChieu.insertCell(1).innerHTML = "&nbsp;";
				trChieu.insertCell(2).innerHTML = "&nbsp;";
				trChieu.insertCell(3).innerHTML = "&nbsp;";
				trChieu.insertCell(4).innerHTML = "&nbsp;";
				trChieu.insertCell(5).innerHTML = "&nbsp;";
				trChieu.insertCell(6).innerHTML = "&nbsp;";
				trChieu.insertCell(7).innerHTML = "&nbsp;";
			}
			else
			{
				trChieu = document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu');
				trChieu.cells[0].innerHTML = "&nbsp;";
				trChieu.cells[1].innerHTML = "&nbsp;";
				trChieu.cells[2].innerHTML = "&nbsp;";
				trChieu.cells[3].innerHTML = "&nbsp;";
				trChieu.cells[4].innerHTML = "&nbsp;";
				trChieu.cells[5].innerHTML = "&nbsp;";
				trChieu.cells[6].innerHTML = "&nbsp;";
				trChieu.cells[7].innerHTML = "&nbsp;";
			}
			trChieu.cells[0].width = "200px";
			trChieu.cells[1].width = "50px";
			trChieu.cells[2].width = "50px";
			trChieu.cells[3].width = "50px";
			trChieu.cells[4].width = "50px";
			trChieu.cells[5].width = "50px";
			trChieu.cells[6].width = "50px";
			trChieu.cells[7].width = "50px";
			checkBuoiChieu = false;
		}
		if((thu[i].split("/"))[0] == 'Chiều' && checkBuoiChieu == false)
		{
			trChieu.cells[(thu[i].split("/"))[1]].innerHTML = trChieu.cells[(thu[i].split("/"))[1]].innerHTML + "<br/>" + (thu[i].split("/"))[2];
		}
	}
	if(checkBuoiSang == false)
		trSang.cells[0].innerHTML = "<font color = 'blue'><b>" + monHocTkb.tenMonHoc + "</b></font><br/><b>" + monHocTkb.tenGiaoVien + "</b><br/>" + chuoiLT + chuoiTH + monHocTkb.ghiChu;
	else
	{
		if(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang') != null)
		{
			rowSang--;
			tableSang.deleteRow(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang').rowIndex);
		}
	}
	if(checkBuoiChieu == false)
		trChieu.cells[0].innerHTML = "<font color = 'blue'><b>" + monHocTkb.tenMonHoc + "</b></font><br/><b>" + monHocTkb.tenGiaoVien + "</b><br/>" + chuoiLT + chuoiTH + monHocTkb.ghiChu;
	else
	{
		if(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu') != null)
		{
			rowChieu--;
			tableChieu.deleteRow(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu').rowIndex);
		}
	}
	
}

function deleteRow()
{
	if(document.getElementById('cboXoaMonHoc').value != "")
	{
		if(confirm("Bạn có chắc muốn xóa môn học này không???"))
		{
			document.getElementById('XoaMonHoc').value = 'XoaMonHoc';
			submitForm();
		}
	}
	else
		alert("Hãy chọn môn học cần xóa");
}
function submitForm(){	
	document.getElementById('txtTongSoMonHoc').value = document.getElementById('cboXoaMonHoc').options.length;
	if(parseInt(document.getElementById('TuanBatDau').value) >= parseInt(document.getElementById('TuanKetThuc').value))
		alert("Tuần kết thúc phải lớn hơn tuần bắt đầu");
	else
	{
		if(document.getElementById('actionType').value == 'CapNhat')
		{
			for(var i=0;i<addTKB.length;i++) // map tung obj trong mang addTKB vao tung hidden field
			{
				var strMonHoc = "", strChiTiet = "";
				var obj = new Object();
				obj = addTKB[i];
				strMonHoc =  obj.ghiChu  + "<->" + obj.soNoiDung + "<->" + obj.soCaThucHanh + "<->" + obj.maMonHoc + "<->" + obj.tenMonHoc + "<->" + obj.maGiaoVien + "<->" + obj.tenGiaoVien + "<->" + obj.maMonHocTKB + "<->" + obj.phongLT + "<->" + obj.phongTH + "<->" + obj.ngayBatDauLT  + "<->" + obj.ngayBatDauTH + "<->" + obj.ngayKetThucLT  + "<->" + obj.ngayKetThucTH + "<->" + obj.chuoiThuTrongTuan + "<->" + obj.kieuBienSoan + "<->" + obj.soTietLT + "<->" + obj.soTietTH + "<->" + obj.tuanBatDauLT + "<->" + obj.tuanBatDauTH + "<->" + obj.maPhongLT + "<->" + obj.maPhongTH + "<->" + obj.soTiet1Buoi + "<->" + obj.soCaLyThuyet;
				var arr = new Array();
				arr = obj.chiTietTKBList;
				for(var j=0;j<arr.length;j++)
				{
					var chiTiet = new Object();
					chiTiet = arr[j];
					if(j == 0)
						strChiTiet += chiTiet.maChiTietTKB + "<->" + chiTiet.buoi + "<->" + chiTiet.sTTNoiDung + "<->" + chiTiet.coHieu + "<->" + chiTiet.hinhThucDay + "<->" + chiTiet.thuTrongTuan + "<->" + chiTiet.phong + "<->" + chiTiet.tuan + "<->" + chiTiet.soThuTu + "<->" + chiTiet.nhom + "<->" + chiTiet.tenChuong + "<->" + obj.mucTieu + "<->" + obj.tietBatDau;
					else
						strChiTiet += "</>" + chiTiet.maChiTietTKB + "<->" + chiTiet.buoi + "<->" + chiTiet.sTTNoiDung + "<->" + chiTiet.coHieu + "<->" + chiTiet.hinhThucDay + "<->" + chiTiet.thuTrongTuan + "<->" + chiTiet.phong + "<->" + chiTiet.tuan + "<->" + chiTiet.soThuTu + "<->" + chiTiet.nhom + "<->" + chiTiet.tenChuong + "<->" + obj.mucTieu + "<->" + obj.tietBatDau;
				}
				document.getElementById('td').innerHTML += "<input type = 'hidden' name = 'MonHoc" + (i+1) + "' value = '" + strMonHoc + "'/><input type = 'hidden' name = 'ChiTiet" + (i+1) + "' value = '" + strChiTiet + "'/>";
			}
		}
		document.getElementById('txtTongSoMonHoc').value = addTKB.length;
		document.getElementById('txtMaNamHoc').value = maNamHoc;
		document.forms["TKB"].submit();
	}
	
}
function confirmSending() {
	if (confirm('Bạn có chắc muốn gửi thời khóa biểu này không ?')) {
		document.TKB.GuiHieuTruong.value = 'GuiHieuTruong';
		submitForm();
	}
	//return false;
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
	if(confirm("Bạn có chắc muốn " + act + " thời khóa biểu này không?"))
		document.forms["Duyet1TKB"].submit();	
}
</script>

<title>Thêm Thời Khóa Biểu</title>
</head>
<body onload="pageLoad();">
<div align="center" >
<c:set var="ThoiKhoaBieu" 
				value = "<%= thoiKhoaBieuModel %>" scope="session"></c:set>
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	<!-- <c:if test="${not empty param.xoa}">
			<b class="msg"> Xóa môn học thành công </b>
		</c:if>  -->
		<c:if test="${not empty param.err}">
			<b class="error"> Nhập liệu vào các ô bắt buộc (*) </b>
		</c:if>
		<c:if test="${not empty param.errTrung}">
			<b class="error"> Thời khóa biểu này đã tồn tại </b>
		</c:if>
		<c:if test="${not empty param.xoa}">
			<b class="msg"> Xóa môn học thành công </b>
		</c:if>
		<c:if test="${not empty param.msg and param.msg eq 'ThemMoi'}">
			<b class="msg"> Thêm mới "THỜI KHÓA BIỂU" thành công </b>
		</c:if>
		<c:if test="${(not empty param.msg and param.msg eq 'CapNhat')
							or (not empty requestScope.msgDeleteRow)}">
			<b class="msg"> Cập nhật "THỜI KHÓA BIỂU" thành công </b>
		</c:if>	
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
		<c:set var = "TruongKhoa" value="<%=Constant.TRUONG_KHOA %>"></c:set>
		<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
		<c:set var = "NEW" value = "<%= Constant.TINHTRANG_NEW %>"></c:set>
		<c:set var = "PENDING" value = "<%= Constant.TINHTRANG_SEND %>"></c:set>
		<c:set var = "REJECT" value = "<%= Constant.TINHTRANG_REJECT %>"></c:set>
		<c:set var = "APPROVE" value = "<%= Constant.TINHTRANG_APPROVE %>"></c:set>
	<form action="<%=request.getContextPath()%>/thoiKhoaBieuController?them=yes" method="post" name = "TKB">	
	
	<table width = "800" style="background-color: transparent;">
	<tr style="background-color: transparent;">
		<td>Trường Trung cấp nghề KTCN Hùng Vương<br />Khoa Công Nghệ Thông Tin </td>
		<td>Cộng hòa Xã hội Chủ nghĩa Việt Nam <br />Độc lập - Tự do - Hạnh phúc </td>
	</tr>
	<tr style="background-color: transparent;">
		<td colspan = "2">
			<strong>THỜI KHÓA BIỂU HỌC KỲ 
			<select id="HocKi" name="cboHocKi">
				<option value = "1" <c:if test = "${ThoiKhoaBieu.hocKi eq 1}">selected</c:if>>I</option>
				<option value = "2" <c:if test = "${ThoiKhoaBieu.hocKi eq 2}">selected</c:if>>II</option>
			</select> 
			- NĂM HỌC <select name="cboNam1" id="Nam1" onchange="selectNam1()">
				<option value="">Select</option></select> - 
			<input type = "text" size = "3" name="txtNam2" id="Nam2" style="background-color: transparent;" readonly="readonly"/></strong>
		</td>
	</tr>
	<c:set var="LopList" value="<%=LopHocDAO.getAllLopByMaChuongTrinhApproved() %>"></c:set>
	<tr style="background-color: transparent;">
		<td colspan = "2"><br /><div class = "div_tr">
			Lớp: <select name="cboLop" id="Lop" onclick="selectLop();">
					<option value="">--Select--</option>
					<c:forEach var = "Lop" items="${LopList}">
						<option value="${Lop.maLopHoc}" <c:if test = "${ThoiKhoaBieu.maLop eq Lop.maLopHoc}">selected</c:if>>${Lop.kiHieu}</option>
					</c:forEach>
				</select>
				<c:if test="${not empty param.err and ThoiKhoaBieu.maLop eq ''}"><b class="error">(*)</b></c:if>
			Chuyên ngành <input type="text" name="txtChuyenNganh" id="ChuyenNganh" readonly="readonly"/> <br />
			Tuần lễ thứ <select id = "TuanBatDau" onchange="selectTuanBatDau();" name="cboTuanBatDau">
							<option value="">Select</option>
							<c:forEach var="count" begin="1" end="47">
								<option value="${count}" <c:if test = "${ThoiKhoaBieu.tuanBatDau eq count}">selected</c:if>>${count}</option>
							</c:forEach>
						</select> 
						<c:if test="${not empty param.err and ThoiKhoaBieu.tuanBatDau eq ''}"><b class="error">(*)</b></c:if>
			đến tuần lễ thứ <select id="TuanKetThuc" onchange="selectTuanKetThuc();" name="cboTuanKetThuc">
								<option value="">Select</option>
							<c:forEach var="count" begin="1" end="54">
								<option value="${count}" <c:if test = "${ThoiKhoaBieu.tuanKetThuc eq count}">selected</c:if>>${count}</option>
							</c:forEach>
						</select>
						<c:if test="${not empty param.err and ThoiKhoaBieu.tuanKetThuc eq ''}"><b class="error">(*)</b></c:if><br />
			Từ ngày <input type = "text" id="TuNgay" name="txtTuNgay" size = 8 style="background-color: transparent;" />
				
			đến ngày <input type = "text" id="DenNgay" name="txtDenNgay" size = 8 style="background-color: transparent;" />
				
		</div></td><br />
	</tr>
	<tr style="background-color: transparent;">
		<td colspan="2">Chọn môn học để xóa : 
			<select id = "cboXoaMonHoc" name = "cboXoaMonHoc">
				<option value="">--Select--</option>
			</select>
<c:if test = "${not empty ThoiKhoaBieu.maThoiKhoaBieu}">					
	<c:choose>		
		<c:when test="${not empty ThoiKhoaBieu.maThoiKhoaBieu and ThoiKhoaBieu.tinhTrang ne APPROVE and ThoiKhoaBieu.tinhTrang ne PENDING and (ThoiKhoaBieu.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN)}">	
			<a href = "javascript: deleteRow()">
				<img src="<%=request.getContextPath()%>/images/buttom/xoamonhoc.png" alt="Xóa môn học" border="0"/>
			</a>
			<a href = "javascript: openUpdate('CapNhat')">
				<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập nhật môn học" border="0"/>
			</a>
		</c:when>	
		<c:otherwise>
			<a href = "javascript: openUpdate('Xem')">
				<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập nhật môn học" border="0"/>
			</a>
		</c:otherwise>
	</c:choose>	
</c:if>		
		</td>
	</tr>
</table>
<table width = "800" border = "1" style="background-color: transparent;" id="tableSang">
	<tr style="background-color: transparent;"><td colspan="8" id = "td">BUỔI SÁNG</td></tr>
	<tr style="background-color: transparent;" align="center">
		<td width = "17" >&nbsp;</td>
		<td width = "17" >HAI</td>
		<td width = "17" >BA</td>
		<td width = "17" >TƯ</td>
		<td width = "17" >NĂM</td>
		<td width = "17" >SÁU</td>
		<td width = "17" >BẢY</td>
		<td width = "17" >Chủ nhật</td>
	</tr>
	
</table>

<br />
<table width = "800" border = "1" style="background-color: transparent;" id="tableChieu">
	<tr style="background-color: transparent;"><td colspan="8">BUỔI CHIỀU</td></tr>
	<tr style="background-color: transparent;" align="center">
		<td width = "17" >&nbsp;</td>
		<td width = "17" >HAI</td>
		<td width = "17" >BA</td>
		<td width = "17" >TƯ</td>
		<td width = "17" >NĂM</td>
		<td width = "17" >SÁU</td>
		<td width = "17" >BẢY</td>
		<td width = "17" >Chủ nhật</td>
	</tr>
	
</table>
<input type = "hidden" value = "1" id = "CountTableSang"/>
<input type = "hidden" value = "1" id = "CountTableChieu"/>
<input type="hidden" name = "txtTongSoMonHoc" id = "txtTongSoMonHoc" value = "0"/>
<input type="hidden" name = "txtMaNamHoc" id = "txtMaNamHoc" value = "0"/>
<c:if test="${not empty ThoiKhoaBieu.maThoiKhoaBieu and ThoiKhoaBieu.tinhTrang ne APPROVE and ThoiKhoaBieu.tinhTrang ne PENDING and (ThoiKhoaBieu.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN)}">
	<a href = "javascript: openAdd()">
		<img src="<%=request.getContextPath()%>/images/buttom/themmonhoc.png" alt="Thêm môn học" border="0"/>
	</a>
	<input type="hidden" name = "XoaMonHoc" id = "XoaMonHoc" value=""/>
</c:if>
	<a href="<%=Constant.PATH_RES.getString("iso.LichSuDungPhongPath") %>">
		<img src="<%=request.getContextPath()%>/images/buttom/lichsudungphong.png" alt="Lịch sử dụng phòng" border="0"/>
	</a>
<table width = "800" style="background-color: transparent;">
		<tr style="background-color: transparent;"><td colspan="2">
			<br />Phòng học lý thuyết  <input type = "text"  style="background-color: transparent;"/><br /><br />
		</td></tr>
	<tr style="background-color: transparent;">
		<td>Ban Giám hiệu<br /><br /><input type = "text" /><br /><br /></td>
		<td>Trưởng khoa CNTT<br /><br /><input type = "text"  style="background-color: transparent;"/><br /><br /></td>
	</tr>
</table>
	<input type="hidden" name="actionType" style="background-color: transparent;" id = "actionType"
			<c:choose>				
				<c:when test="${empty ThoiKhoaBieu.maThoiKhoaBieu}">
					value="ThemMoi"
				</c:when>
				<c:otherwise>
					value="CapNhat"
				</c:otherwise>	
			</c:choose>  
		/>		
		<c:if test = "${ThoiKhoaBieu.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN or ThoiKhoaBieu.tinhTrang eq null}"> 
			<c:choose>
				<c:when test="${ThoiKhoaBieu.tinhTrang eq NEW or ThoiKhoaBieu.tinhTrang eq REJECT or ThoiKhoaBieu.tinhTrang eq null}">
					<!--  <input type = "submit" name="TaoMoi" -->
					<a href = "javascript: submitForm()" name="TaoMoi"> 
					<c:choose>
						<c:when test="${empty ThoiKhoaBieu.maThoiKhoaBieu}">
							<img id="ButtonAction" src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Tạo mới" border = "0" />
						</c:when>
						<c:otherwise>							
							<img id="ButtonAction" src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập Nhật" border = "0" />
						</c:otherwise>
					</c:choose> </a>				
					<c:choose>
						<c:when test="${not empty ThoiKhoaBieu.maThoiKhoaBieu and empty param.AddRow and empty param.err}">							
							<a href = "javascript: confirmSending()">
								<input type="hidden" name="GuiHieuTruong" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/guihieutruong.png" alt="Gửi Hiệu Trưởng" border = "0" />
							</a>
						</c:when>				
					</c:choose>
				</c:when>
			</c:choose>
		</c:if>	
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and ThoiKhoaBieu.tinhTrang eq PENDING}">
			<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Approve" border="0"/> </a>
		</c:if>	
		<c:if test="${ThoiKhoaBieu.tinhTrang eq APPROVE and (ThoiKhoaBieu.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN)}">	
			<a href = "<%=Constant.PATH_RES.getString("iso.InThoiKhoaBieuPath") %>">								 
				<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
		</c:if>	
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and ThoiKhoaBieu.tinhTrang eq PENDING}">
			<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" border="0"/> </a>
		</c:if>
		
	</form>
	<form method="post" action="<%=request.getContextPath()%>/thoiKhoaBieuController?duyet1TKB=yes&maThoiKhoaBieu=${ThoiKhoaBieu.maThoiKhoaBieu}" name="Duyet1TKB">	
		<input type="hidden" name="Duyet" value = "" id="Duyet"/>
		<input type="hidden" name="LyDoReject" value="" id = "LyDoReject"/>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>