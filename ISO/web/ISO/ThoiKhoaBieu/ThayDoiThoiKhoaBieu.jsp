<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.model.ChiTietMonHocCTDTModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietMonHocCTDTDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.PhongBanModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.DeCuongMonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungDCMHModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NoiDungDCMHDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.SuDungModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SuDungDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TuanLeModel"%>
<%@page import="vn.edu.hungvuongaptech.model.NgayLeModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NgayLeDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietTKBThayDoiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBThayDoiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBThayDoiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocTKBThayDoiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cập nhật môn học TKB</title>
<script language="JavaScript" type="text/javascript">
var tonTai = 0; // kiem tra bang 1 co ton tai khong -0 : chua ton tai -1 : da ton tai
var obj = window.dialogArguments;
var addTKB = new Object(); //obj dung de tra ve
var soThucHanh = 0;
var soLyThuyet = 0;
var soTiet = 0;
var listSuDungPhong;
var STT = 0, soBuoiTongCong = 0;// STT : so thu tu cua tung buoi trong bang 1, soBuoiTongCong : tong so buoi cua mon hoc
var tonTaiBang = false; //kiem tra xem bang 2 ton tai chua -true : da ton tai -false : chua ton tai
var kieu; // mang luu kieu day cua bang theo trinh tu ben de cuong
var objMonHocTKB = new Object();
var tuanBatDau = 0;
var tietBatDau = 1;
var maLop;
var listMonHoc = new Array();
var listLopHoc = new Array();
var ngayHocList = new Array();
var ngayLeList = new Array();
var listChiTietThayDoi = new Array();
<%
	ArrayList<PhongBanModel> phongBanModelList = PhongBanDAO.getAllPhongBan();
	ArrayList<ThanhVienModel> thanhVienModelList = ThanhVienDAO.getAllGiaoVienOrderByTen();
	ArrayList<MonHocModel> monHocList = MonHocDAO.getMonHoc();
	ArrayList<LopHocModel> lopHocList = LopHocDAO.getAllKiHieuLop();
	ArrayList<TuanLeModel> tuanLeList = TuanLeDAO.getNgayTrongTuanByTuanBatDauVaTuanKetThucVaMaNamHoc(request.getParameter("tuTuan"), request.getParameter("denTuan"), request.getParameter("maNamHoc"));
	ArrayList<NgayLeModel> ngayLeList = NgayLeDAO.getAllNgayLe();
	ArrayList<ChiTietTKBThayDoiModel> thayDoiList = ChiTietTKBThayDoiDAO.getChiTietTKBThayDoiByMaMonHocTKB(request.getParameter("maMonHocTKB"));
	MonHocTKBThayDoiModel monHocTKBThayDoi = MonHocTKBThayDoiDAO.getThayDoiByMaMonHocTKB(request.getParameter("maMonHocTKB"));
	String ngayHeThong = SysParamsDAO.getNgayGioHeThong().getNgayHeThong();
%>
function taoListThayDoi()
{
	<%
		for(int i=0;i<thayDoiList.size();i++) {
			out.print("var objThayDoi = new Object();");
			out.print("objThayDoi.maThayDoi = '" + thayDoiList.get(i).getId() + "';");
			out.print("objThayDoi.tuan = '" + thayDoiList.get(i).getTuan() + "';");
			out.print("objThayDoi.thuTrongTuan = '" + thayDoiList.get(i).getThuTrongTuan() + "';");
			out.print("objThayDoi.buoi = '" + thayDoiList.get(i).getBuoi() + "';");
			out.print("objThayDoi.ngayHoc = '" + thayDoiList.get(i).getNgayHoc() + "';");
			out.print("objThayDoi.maChiTietTKB = '" + thayDoiList.get(i).getMaChiTietTKB() + "';");
			out.print("objThayDoi.tinhTrang = '" + thayDoiList.get(i).getTinhTrang() + "';");
			out.print("listChiTietThayDoi[" + i + "] = objThayDoi;");
		}
	%>
}
function taoNgayLe()
{
	<%
		for(int i=0;i<ngayLeList.size();i++)
		{
			out.print("var objNgayLe = new Object();");
			out.print("objNgayLe.maNgayLe = '" + ngayLeList.get(i).getMaNgayLe() + "';");
			out.print("objNgayLe.ngay = '" + ngayLeList.get(i).getNgay() + "';");
			out.print("objNgayLe.thang = '" + ngayLeList.get(i).getThang() + "';");
			out.print("ngayLeList[" + i + "] = objNgayLe;");
		}
	%>
}
function taoNgayHoc()
{
	<%
		for(int i=0;i<tuanLeList.size();i++) {
			out.print("var objNgayHoc = new Object();");
			out.print("objNgayHoc.tuan = '" + tuanLeList.get(i).getSoThuTu() + "';");
			out.print("objNgayHoc.thuHai = '" + tuanLeList.get(i).getThuHai() + "';");
			out.print("objNgayHoc.thuBa = '" + tuanLeList.get(i).getThuBa() + "';");
			out.print("objNgayHoc.thuTu = '" + tuanLeList.get(i).getThuTu() + "';");
			out.print("objNgayHoc.thuNam = '" + tuanLeList.get(i).getThuNam() + "';");
			out.print("objNgayHoc.thuSau = '" + tuanLeList.get(i).getThuSau() + "';");
			out.print("objNgayHoc.thuBay = '" + tuanLeList.get(i).getThuBay() + "';");
			out.print("objNgayHoc.chuNhat = '" + tuanLeList.get(i).getChuNhat() + "';");
			out.print("ngayHocList[" + i + "] = objNgayHoc;");
		}
	%>	
}
function taoListMonHocVaListLopHoc()
{
	var x = 0;
	<%
		for(int i=0;i<monHocList.size();i++) {
			out.print("var monHocLoi = new Object;");
			out.print("monHocLoi.maMonHoc = '" + monHocList.get(i).getMaMonHoc() + "';");
			out.print("monHocLoi.tenMonHoc = '" + monHocList.get(i).getTenMonHoc() + "';");
			out.print("listMonHoc[x] = monHocLoi;");
			out.print("x++;");
		}
		out.print("x = 0;");
		for(int i=0;i<lopHocList.size();i++) {
			out.print("var lopHocLoi = new Object;");
			out.print("lopHocLoi.maLopHoc = '" + lopHocList.get(i).getMaLopHoc() + "';");
			out.print("lopHocLoi.tenLopHoc = '" + lopHocList.get(i).getKiHieu() + "';");
			out.print("listLopHoc[x] = lopHocLoi;");
			out.print("x++;");
		}
	%>
}
function loadPage()
{
	var param = 0;
	<%
		out.print("document.getElementById('txtMaTKB').value = '" + request.getParameter("maTKB") + "';");
		out.print("document.getElementById('txtMaMonHocTKB').value = '" + request.getParameter("maMonHocTKB") + "';");
		if(request.getParameter("ThayDoiMonHoc") != null && request.getParameter("ThayDoiChiTiet") != null) 
			out.print("param = 3;");
		else if(request.getParameter("ThayDoiMonHoc") != null)
			out.print("param = 2;");
		else if(request.getParameter("ThayDoiChiTiet") != null)
			out.print("param = 1;");
		else if(request.getParameter("Error") != null)
			out.print("param = 4;");
	%>
	if(param == 0)
	{
		maLop = <%="'" + request.getParameter("maLop") + "'"%>;
		document.getElementById('TableHidden').insertRow(0).insertCell(0).innerHTML = "";
		document.getElementById('TableHidden').rows[0].insertCell(1).innerHTML = "";
		document.getElementById('TableButton').insertRow(0).insertCell(0).innerHTML = "";
		document.getElementById('TongHocSinh').value = obj.soHocSinh;
		objMonHocTKB = obj.monHocTKB;
		
		document.getElementById('MangChiTietLength').value = objMonHocTKB.chiTietTKBList.length;
		
		createGiaoVien();
		//createTuanLe();
		createPhongBan('phongLyThuyet');
		createPhongBan('phongThucHanh');
		
		//cap nhat mon hoc tkb
		document.getElementById('txtTenMonHoc').value = objMonHocTKB.tenMonHoc;
		document.getElementById('txtMonHoc').value = objMonHocTKB.maMonHoc; // co the khong can
		document.getElementById('txtSoNoiDung').value = objMonHocTKB.soNoiDung;
		document.getElementById('giaoVien').value = objMonHocTKB.maGiaoVien;
		document.getElementById('phongLyThuyet').value = objMonHocTKB.phongLyThuyet; 
		document.getElementById('phongThucHanh').value = objMonHocTKB.phongThucHanh; 
		document.getElementById('SoCa').value = objMonHocTKB.soCaThucHanh;
		document.getElementById('SoCaLyThuyet').value = objMonHocTKB.soCaLyThuyet;
		document.getElementById('txtTenGiaoVien').value = objMonHocTKB.tenGiaoVien;
		document.getElementById('GhiChu').value = objMonHocTKB.ghiChu;
		document.getElementById('phongLyThuyet').value = objMonHocTKB.maPhongLT;
		document.getElementById('phongThucHanh').value = objMonHocTKB.maPhongTH;
		document.getElementById('txtSoTiet1Buoi').value = objMonHocTKB.soTiet1Buoi;
		if(objMonHocTKB.maPhongLT == "null") {
			document.getElementById('phongLyThuyet').options[0].selected = true;
			//document.getElementById('phongLyThuyet').disabled = true;
		}
		if(objMonHocTKB.maPhongTH == "null") {
			document.getElementById('phongThucHanh').options[0].selected = true;
			//document.getElementById('phongThucHanh').disabled = true;
		}
		if((parseInt(objMonHocTKB.tuanBatDauLT) <= parseInt(objMonHocTKB.tuanBatDauTH) && objMonHocTKB.tuanBatDauLT != 0) || parseInt(objMonHocTKB.tuanBatDauTH) == 0)
		{
			document.getElementById('TuanLeBatDau').value = objMonHocTKB.tuanBatDauLT;
			tuanBatDau = parseInt(objMonHocTKB.tuanBatDauLT);
		}
		else 
		{
			document.getElementById('TuanLeBatDau').value = objMonHocTKB.tuanBatDauTH;
			tuanBatDau = parseInt(objMonHocTKB.tuanBatDauTH);
		}
		taoNgayHoc();
		taoNgayLe();
		taoListThayDoi();
		createTableKieuDay();
		selectKieuDay(2,'1');
		taoListMonHocVaListLopHoc();
		<%
			if(monHocTKBThayDoi.getId() != null) {
				out.print("document.getElementById('giaoVien').style.background = 'lime';");	 
				if(monHocTKBThayDoi.getTinhTrang().equals(Constant.TINHTRANG_SEND))
					out.print("document.getElementById('giaoVien').disabled = true;");
				out.print("document.getElementById('giaoVien').alt = '" + monHocTKBThayDoi.getTenGiaoVien() + "';");
				out.print("document.getElementById('txtMaGVThayDoi').value = '" + monHocTKBThayDoi.getId() + "';");
			}
		%>
		
	}
	else
	{
		if(param != 4)
			window.returnValue = param;
		window.close();
	}
}
function taoListSuDungPhong()
{
	listSuDungPhong = new Array();
	<%
	ArrayList<ChiTietTKBModel> chiTietTKBModelList = ChiTietTKBDAO.getAllSuDungPhongByNamHoc(request.getParameter("maNamHoc"),request.getParameter("maMonHocTKB"), request.getParameter("tuTuan"),request.getParameter("denTuan"));
	// tao list su dung phong
		out.print("var thuTuTuan, buoi, thu;");
		out.print("var listPhong = new Array();");
		out.print("var listThu = new Array();");
		out.print("var listBuoi = new Array();");
		for(int i=0;i<chiTietTKBModelList.size();i++)
		{
			ChiTietTKBModel chiTiet = chiTietTKBModelList.get(i);
			if(i == chiTietTKBModelList.size() - 1)
			{
				out.print("thuTuTuan = '';");
				out.print("buoi = '';");
				out.print("thu = '';");
			}
			else
			{
				out.print("thuTuTuan = '" + chiTietTKBModelList.get(i + 1).getTuan() + "';");
				out.print("buoi = '" + chiTietTKBModelList.get(i + 1).getBuoi() + "';");
				out.print("thu = '" + chiTietTKBModelList.get(i + 1).getThuTrongTuan() + "';");
			}
			out.print("var objPhong = new Object;");
			out.print("objPhong.maPhong = '" + chiTiet.getMaPhong() + "';");
			out.print("objPhong.maGiaoVien = '" + chiTiet.getMaGiaoVien() + "';");
			out.print("objPhong.tietBatDau = '" + chiTiet.getTietBatDau() + "';");
			out.print("objPhong.soTiet = '" + chiTiet.getSoTietHoc1Buoi() + "';");
			out.print("objPhong.maLop = '" + chiTiet.getMaLop() + "';");
			out.print("objPhong.nhom = '" + chiTiet.getNhom() + "';");
			out.print("objPhong.maMonHoc = '" + chiTiet.getMaMonHoc() + "';");
			out.print("listPhong[listPhong.length] = objPhong;");
			out.print("if(thu != '" + chiTiet.getThuTrongTuan() + "' || buoi != '" + chiTiet.getBuoi() + "' || thuTuTuan != '" + chiTiet.getTuan() + "') {");
				out.print("var objThu = new Object();");
				out.print("objThu.thu = '" + chiTiet.getThuTrongTuan() + "';");
				out.print("objThu.listPhong = listPhong;");
				out.print("listThu[listThu.length] = objThu;");
				out.print("var listPhong = new Array();");
			out.print("}");	
			
			out.print("if(buoi != '" + chiTiet.getBuoi() + "' || thuTuTuan != '" + chiTiet.getTuan() + "') {");
				out.print("var objBuoi = new Object();");
				out.print("objBuoi.buoi = '" + chiTiet.getBuoi() + "';");
				out.print("objBuoi.listThu = listThu;");
				out.print("listBuoi[listBuoi.length] = objBuoi;");
				out.print("var listThu = new Array();");
			out.print("}");	
			
			out.print("if(thuTuTuan != '" + chiTiet.getTuan() + "') {");
				out.print("var objTuan = new Object();");
				out.print("objTuan.tuan = '" + chiTiet.getTuan() + "';");
				out.print("objTuan.listBuoi = listBuoi;");
				out.print("listSuDungPhong[listSuDungPhong.length] = objTuan;");
				out.print("var listBuoi = new Array();");
			out.print("}");
		}
	%>
}


function createGiaoVien()
{
	document.getElementById('giaoVien').innerHTML = null;
	var opt = new Option('Select','');
	document.getElementById('giaoVien').add(opt,undefined);
	<%
		for(int i=0;i<thanhVienModelList.size();i++) {
			out.print("var opt = new Option('" + thanhVienModelList.get(i).getHoThanhVien() + " " + thanhVienModelList.get(i).getTenLot() + " " + thanhVienModelList.get(i).getTenThanhVien() + "','" + thanhVienModelList.get(i).getMaThanhVien() + "');");
			out.print("document.getElementById('giaoVien').add(opt,undefined);");
		}
		                                                     
	%>
}
function selectGiaoVien()
{
	document.getElementById('txtTenGiaoVien').value = document.getElementById('giaoVien').options[document.getElementById('giaoVien').selectedIndex].text;
}
function createPhongBan()
{
	document.getElementById('phongLyThuyet').innerHTML = null;
	document.getElementById('phongThucHanh').innerHTML = null;
	<%
		/*for(int i=0;i<phongBanModelList.size();i++) {
			out.print("if('LT' == '" + phongBanModelList.get(i).getChucNang() + "') {");
			out.print("var opt = new Option('" + phongBanModelList.get(i).getKiHieu() + "','" + phongBanModelList.get(i).getMaPhongBan() + "');");
			out.print("document.getElementById('phongLyThuyet').add(opt,undefined); }");
			out.print("if('TH' == '" + phongBanModelList.get(i).getChucNang() + "') {");
			out.print("var opt = new Option('" + phongBanModelList.get(i).getKiHieu() + "','" + phongBanModelList.get(i).getMaPhongBan() + "');");
			out.print("document.getElementById('phongThucHanh').add(opt,undefined); }");
		}*/
		for(int i=0;i<phongBanModelList.size();i++) {
			out.print("var opt = new Option('" + phongBanModelList.get(i).getKiHieu() + "','" + phongBanModelList.get(i).getMaPhongBan() + "');");
			out.print("document.getElementById('phongLyThuyet').add(opt,undefined);");
			out.print("var opt = new Option('" + phongBanModelList.get(i).getKiHieu() + "','" + phongBanModelList.get(i).getMaPhongBan() + "');");
			out.print("document.getElementById('phongThucHanh').add(opt,undefined);");
		}
	%>
	selectPhongThucHanh();
}

function createTableKieuDay()// tao bang 1 de chon thu tu cac buoi hoc ly thuyet va thuc hanh, chi duoc tao ra khi kieu bien soan la 1 voi so LT va TH phai > 0
{
	var coHieu = "", day;
	kieu = new Array;
	document.getElementById('TableHidden').rows[0].cells[0].innerHTML = "";
	document.getElementById('TableHidden').rows[0].cells[1].innerHTML = "";
	STT = 0;
	var table = document.getElementById('TableKieuDay');

	var temp = ""; // dung de so sanh voi so thu tu noi dung
	var arrChiTiet = new Array();
	arrChiTiet = objMonHocTKB.chiTietTKBList;
	
	if(tonTai == 1)
	{
		table.deleteRow(1);
		table.deleteRow(0);
		tonTai = 0;
	}
	if(objMonHocTKB.kieuBienSoan == '0' && objMonHocTKB.soTietLT != '0' && objMonHocTKB.soTietTH != '0')
	{
		tonTai = 1;	
		var tr1 = table.insertRow(0);
		var tr2 = table.insertRow(1);

		var hidden = "";
		tr1.insertCell(0).innerHTML = "STT Nội dung chương";
		tr2.insertCell(0).innerHTML = "";
		// cap nhat mon hoc tkb
		for(var i=0;i<arrChiTiet.length;i++)
		{
			if(i != 0)
				temp = objChiTiet.sTTNoiDung;
			var objChiTiet = new Object();
			objChiTiet = arrChiTiet[i];
			if(objChiTiet.sTTNoiDung != temp)
			{
				STT++;
				tr1.insertCell(STT).innerHTML = STT;
				if(objChiTiet.coHieu == 0)
				{
					tr2.insertCell(STT).innerHTML = "<input type = 'radio' name = 'KieuDay_" + STT + "' id = 'KieuDay_LT" + STT + "' value = 'LT' checked = 'checked'>LT</input><br/><input type = 'radio' name = 'KieuDay_" + STT + "' id = 'KieuDay_TH" + STT + "' value = 'TH'>TH</input>";
					soLyThuyet++;
					kieu[STT-1] = 'LT<-->' + objChiTiet.coHieu + '<-->' + objChiTiet.tenChuong + "<-->" + objChiTiet.mucTieu;
				}
				else if(objChiTiet.coHieu == 1)
				{
					soThucHanh++;
					kieu[STT-1] = 'TH<-->' + objChiTiet.coHieu + '<-->' + objChiTiet.tenChuong + "<-->" + objChiTiet.mucTieu;
					tr2.insertCell(STT).innerHTML = "<input type = 'radio' name = 'KieuDay_" + STT + "' id = 'KieuDay_LT" + STT + "' value = 'LT' >LT</input><br/><input type = 'radio' name = 'KieuDay_" + STT + "' id = 'KieuDay_TH" + STT + "' value = 'TH' checked = 'checked'>TH</input>";
				}
				else if(objChiTiet.coHieu == 4)
				{
					if(objChiTiet.hinhThucDay == 'LT')
					{
						tr2.insertCell(STT).innerHTML = "<input type = 'radio' name = 'KieuDay_" + STT + "' id = 'KieuDay_LT" + STT + "' value = 'LT' checked = 'checked' disabled = 'disabled'>LT</input><br/><input type = 'radio' name = 'KieuDay_" + STT + "' id = 'KieuDay_TH" + STT + "' value = 'TH' disabled = 'disabled'>TH</input>";
						soLyThuyet++;	
						kieu[STT-1] = 'LT<-->' + objChiTiet.coHieu + '<-->' + objChiTiet.tenChuong + "<-->" + objChiTiet.mucTieu;
					}
					else
					{
						tr2.insertCell(STT).innerHTML = "<input type = 'radio' name = 'KieuDay_" + STT + "' id = 'KieuDay_LT" + STT + "' value = 'LT' disabled = 'disabled'>LT</input><br/><input type = 'radio' name = 'KieuDay_" + STT + "' id = 'KieuDay_TH" + STT + "' value = 'TH' checked = 'checked' disabled = 'disabled'>TH</input>";
						soThucHanh++;
						kieu[STT-1] = 'TH<-->' + objChiTiet.coHieu + '<-->' + objChiTiet.tenChuong + "<-->" + objChiTiet.mucTieu;
					}
				}
				hidden = "<input type = 'hidden' value = '" + objChiTiet.sTTNoiDung + "<-->" + objChiTiet.coHieu + "' name = 'STT_noi_dung" + STT + "' id = 'STT_noi_dung" + STT + "'/>";
				coHieu = "<input type = 'hidden' value = '" + kieu[STT-1] + "<-->" + STT + "' name = 'Day" + STT + "' id = 'Day" + STT + "'/>";
				document.getElementById('TableHidden').rows[0].cells[1].innerHTML = document.getElementById('TableHidden').rows[0].cells[1].innerHTML + coHieu;
				document.getElementById('TableHidden').rows[0].cells[0].innerHTML = document.getElementById('TableHidden').rows[0].cells[0].innerHTML + hidden;
			}
		}
	}
	else if(objMonHocTKB.kieuBienSoan == '1' || objMonHocTKB.kieuBienSoan == '0')
	{
		//cap nhat mon hoc tkb
		var count = 0;
		for(var i=0;i<arrChiTiet.length;i++)
		{
			if(i != 0)
				temp = objChiTiet.sTTNoiDung;
			var objChiTiet = new Object();
			objChiTiet = arrChiTiet[i];
			if(objChiTiet.sTTNoiDung != temp)
			{
				STT++;
				if(objChiTiet.coHieu == 0)
					day = 'LT';
				else if(objChiTiet.coHieu == 1)
					day = 'TH';
				else if(objChiTiet.coHieu == 4)
				{
					if(objChiTiet.hinhThucDay == 'LT')
						day = 'LT';
					else
						day = 'TH';
				}
				coHieu = "<input type = 'hidden' value = '" + day + "<-->" + STT + "<-->" + objChiTiet.coHieu + "<-->" + objChiTiet.tenChuong + "<-->" + objChiTiet.mucTieu + "' name = 'Day" + STT + "' id = 'Day" + STT + "'/>";
				hidden = "<input type = 'hidden' value = '" + objChiTiet.sTTNoiDung + "' name = 'STT_noi_dung" + STT + "' id = 'STT_noi_dung" + STT + "'/>";
				document.getElementById('TableHidden').rows[0].cells[1].innerHTML = document.getElementById('TableHidden').rows[0].cells[1].innerHTML + coHieu;
				document.getElementById('TableHidden').rows[0].cells[0].innerHTML = document.getElementById('TableHidden').rows[0].cells[0].innerHTML + hidden;
			}
			else
			{
				if(objMonHocTKB.kieuBienSoan == '1')
				{
					count++;
					if(count == parseInt(document.getElementById('SoCa').value))
					{
						STT++;
						count = 0;
						day = 'TH';
						coHieu = "<input type = 'hidden' value = '" + day + "<-->" + STT + "<-->" + objChiTiet.coHieu + "<-->" + objChiTiet.tenChuong + "<-->" + objChiTiet.mucTieu + "' name = 'Day" + STT + "' id = 'Day" + STT + "'/>";
						hidden = "<input type = 'hidden' value = '" + objChiTiet.sTTNoiDung + "' name = 'STT_noi_dung" + STT + "' id = 'STT_noi_dung" + STT + "'/>";
						document.getElementById('TableHidden').rows[0].cells[1].innerHTML = document.getElementById('TableHidden').rows[0].cells[1].innerHTML + coHieu;
						document.getElementById('TableHidden').rows[0].cells[0].innerHTML = document.getElementById('TableHidden').rows[0].cells[0].innerHTML + hidden;
					}
				}
			}
		}
	}
	else
	{
		for(var i=0;i<arrChiTiet.length;i++)
		{
			if(i != 0)
				temp = objChiTiet.sTTNoiDung;
			var objChiTiet = new Object();
			objChiTiet = arrChiTiet[i];
			if(objChiTiet.sTTNoiDung != temp)
			{
				STT++;
				day = "THP";
			}
			coHieu = "<input type = 'hidden' value = '" + day + "<-->" + STT + "<-->" + objChiTiet.coHieu + "<-->" + objChiTiet.tenChuong + "<-->" + objChiTiet.mucTieu + "' name = 'Day" + STT + "' id = 'Day" + STT + "'/>";
			hidden = "<input type = 'hidden' value = '" + STT + "' name = 'STT_noi_dung" + STT + "' id = 'STT_noi_dung" + STT + "'/>";
			document.getElementById('TableHidden').rows[0].cells[1].innerHTML = document.getElementById('TableHidden').rows[0].cells[1].innerHTML + coHieu;
			document.getElementById('TableHidden').rows[0].cells[0].innerHTML = document.getElementById('TableHidden').rows[0].cells[0].innerHTML + hidden;
		}
	}
	
}

function kiemTraKieuDay() // kiem tra lai trinh tu hoc o bang 1 va sap xep lai cho dung
{
	var demLT = 0, demTH = 0;
	var soBuoiLT = 0;
	var soBuoiTH = 0;
	for(var i=1;i<=STT;i++){
		if(document.getElementById('KieuDay_LT' + i).checked == true)
		{
			for(var j=demLT;j<kieu.length;j++)
			{	
				if((kieu[j].split("<-->"))[0] == 'LT')
				{
					document.getElementById('STT_noi_dung' + i).value = j+1;
					demLT = j + 1;
					document.getElementById('Day' + i).value = 'LT<-->' + i + '<-->' + (kieu[j].split("<-->"))[1] + '<-->' + (kieu[j].split("<-->"))[2] + '<-->' + (kieu[j].split("<-->"))[3];
					break;
				}
			}
			soBuoiLT++;
		}	
		else
		{
			for(var j=demTH;j<kieu.length;j++)
			{
				if((kieu[j].split("<-->"))[0] == 'TH')
				{
					document.getElementById('STT_noi_dung' + i).value = j+1;
					demTH = j + 1;
					document.getElementById('Day' + i).value = 'TH<-->' + i + '<-->' + (kieu[j].split("<-->"))[1] + '<-->' + (kieu[j].split("<-->"))[2] + '<-->' + (kieu[j].split("<-->"))[3];
					break;
				}
			}
			soBuoiTH++;
		}
	}
	if(soBuoiLT == soLyThuyet && soBuoiTH == soThucHanh)
		return true;
	else
		return false;
}

function selectKieuDay(act, up) // tao bang 2
{
	if(objMonHocTKB.kieuBienSoan == '0' && objMonHocTKB.soTietLT != '0' && objMonHocTKB.soTietTH != '0')
	{
		kiemTraKieuDay();
	}
	var table = document.getElementById('TableBuoiHoc');
	var tr;
	var size;
	var x = 1;
	var soTuan = 0;
	var kieuDay, ch;//ch = cờ hiệu
	var y;
	var soNoiDung;
	var disable;
	var option = "";
	var optionNhomLyThuyet = "";
	var optionNhomThucHanh = "";
	var dem = 1;
	var hiddenTuan;
	var so = -1;
	var phongBan = "";
	var soBuoiMoiTuan = 0;
	var selectNhom = "";
	var chonPhong = "";
	var tenChuong = "";
	var mucTieu = "";
	var hiddenTenChuong;
	var hiddenMucTieu;
	var ngayHoc = "";
	var baoNgayLe = "";
	var selectThu = "";
	var selectBuoiHoc = "";
	var optionTietHoc = "<option value = '1'>1</option><option value = '2'>2</option><option value = '3'>3</option><option value = '4'>4</option><option value = '5'>5</option>";
	if(act == '0')
	{
		for(var i = soBuoiTongCong;i>=0;i--)
		{
			table.deleteRow(i);
		}
	}
	else
	{
		
		table.insertRow(0);
		table.rows[0].insertCell(0).innerHTML = "Số Tuần";
		table.rows[0].insertCell(1).innerHTML = "Số Buổi";
		table.rows[0].insertCell(2).innerHTML = "Ngày học";
		table.rows[0].insertCell(3).innerHTML = "Buổi";
		table.rows[0].insertCell(4).innerHTML = "Tiết bắt đầu";
		table.rows[0].insertCell(5).innerHTML = "Kiểu dạy";
		table.rows[0].insertCell(6).innerHTML = "Nhóm";
		table.rows[0].insertCell(7).innerHTML = "Thứ";
		table.rows[0].insertCell(8).innerHTML = "Phòng";
		table.rows[0].insertCell(9).innerHTML = "Tình trạng";
		for(var i=1;i<=parseInt(document.getElementById('SoCa').value);i++)
		{
			optionNhomThucHanh += "<option value = '" + i + "'>" + i + "</option>";
		}   
		for(var i=1;i<=parseInt(document.getElementById('SoCaLyThuyet').value);i++)
		{
			optionNhomLyThuyet += "<option value = '" + i + "'>" + i + "</option>";
		}
		for(var i=1;i<=STT;i++)
		{
			if((document.getElementById('Day' + i).value.split("<-->")[0]) == 'LT')
				for(var n=1;n<=parseInt(document.getElementById('SoCaLyThuyet').value);n++)
					soBuoiMoiTuan++;
			else
				for(var n=1;n<=parseInt(document.getElementById('SoCa').value);n++)
					soBuoiMoiTuan++;
			so = -1; 
			if(objMonHocTKB.kieuBienSoan == '1')
			{
				if(i%((parseInt(objMonHocTKB.soTietTH) + parseInt(objMonHocTKB.soTietLT))/parseInt(objMonHocTKB.soTietLT)) == 0)
				{
					so = 0;
				}
			}
			else
			{
				so = 0;	
			}
			if((parseInt((document.getElementById('Day' + i).value.split("<-->"))[1])%parseInt(document.getElementById('txtSoNoiDung').value) == 0 && so == 0) || i == STT)
			{
				soTuan++;
				for(var j=x;j<=i;j++)
				{
					dem = 1;
					soNoiDung = document.getElementById('STT_noi_dung' + j).value;
					tr = table.insertRow(soBuoiTongCong + 1);
					var hienThiTuan = soTuan + tuanBatDau - 1; // thu tu tuan le
					if(j == x)
					{
						tr.insertCell(0).innerHTML = "<input type = 'text' value = '" + hienThiTuan + "' onblur = 'doiTuanHoc(" + (soBuoiTongCong + 1) + ", " + soBuoiMoiTuan + ", " + hienThiTuan + ")' id = 'txtTuanHoc" + hienThiTuan + "' size = '3' onclick = 'getTuanHoc(" + hienThiTuan + ")'/>";
						table.rows[soBuoiTongCong + 1].cells[0].rowSpan = soBuoiMoiTuan;
						dem = 0;
					}
					if(up != 1)
					{
						for(var c=0;c<ngayHocList.length;c++)
						{
							if(hienThiTuan == ngayHocList[c].tuan)
							{
								ngayHoc = ngayHocList[c].thuHai;
								var m = ngayHoc.split("/");
								for(var d=0;d<ngayLeList.length;d++)
								{
									if(m[0] == ngayLeList[d].ngay && m[1] == ngayLeList[d].thang)
									{
										baoNgayLe = "style = 'color : red'";
										break;
									}
								}
								break;
							}
						}
					}
					if((document.getElementById('Day' + j).value.split("<-->")[0]) == 'LT')
					{
						kieuDay = "LT";
						ch = document.getElementById('Day' + j).value.split("<-->")[2];
						tenChuong = document.getElementById('Day' + j).value.split("<-->")[3];
						mucTieu = document.getElementById('Day' + j).value.split("<-->")[4];
						y = parseInt(document.getElementById('SoCaLyThuyet').value);
						disable = "disabled = 'disabled'";
						phongBan = document.getElementById('phongLyThuyet').innerHTML;
						chonPhong = document.getElementById('phongLyThuyet').value;
						option = optionNhomLyThuyet;
					}
					else
					{
						kieuDay = document.getElementById('Day' + j).value.split("<-->")[0];;
						ch = document.getElementById('Day' + j).value.split("<-->")[2];
						tenChuong = document.getElementById('Day' + j).value.split("<-->")[3];
						mucTieu = document.getElementById('Day' + j).value.split("<-->")[4];
						y = parseInt(document.getElementById('SoCa').value);
						disable = "";
						phongBan = document.getElementById('phongThucHanh').innerHTML;
						chonPhong = document.getElementById('phongThucHanh').value;
						option = optionNhomThucHanh;
					}
					for(var z = 1;z<=y;z++)
					{
						
						soBuoiTongCong++;
						if(z != 1)
						{
							tr = table.insertRow(soBuoiTongCong);
							dem = 1;
						}
						selectThu = "selectThuTrongTuan(" + soBuoiTongCong + ");";
						selectBuoiHoc = "onclick = 'selectBuoi(" + soBuoiTongCong + ")'";
						tr.id = "tr" + soBuoiTongCong;
						tr.insertCell(1-dem).innerHTML = soBuoiTongCong + "<input type = 'hidden' id = 'txtDong" + soBuoiTongCong + "' name = 'txtDong" + soBuoiTongCong + "' value = '0'/><input type = 'hidden' id = 'txtError" + soBuoiTongCong + "' value = ''/><input type = 'hidden' id = 'txtMaThayDoi" + soBuoiTongCong + "' name = 'txtMaThayDoi" + soBuoiTongCong + "' value = '-1'><input type = 'hidden' id = 'txtMaChiTietTKB" + soBuoiTongCong + "' name = 'txtMaChiTietTKB" + soBuoiTongCong + "' value = '-1'>";
						tr.insertCell(2-dem).innerHTML = "<input type = 'text' id = 'txtNgayHoc" + soBuoiTongCong + "' name = 'txtNgayHoc" + soBuoiTongCong + "' value = '" + ngayHoc + "'" + baoNgayLe + " size = '10'/>";
						tr.insertCell(3-dem).innerHTML = "<input type = 'radio' name = 'Buoi" + soBuoiTongCong + "' id = 'BuoiSang" + soBuoiTongCong + "' value = 'Sáng-" + soNoiDung + "-" + ch + "' checked='checked' " + selectBuoiHoc + "/>Sáng<input type = 'radio' name = 'Buoi" + soBuoiTongCong + "' id = 'BuoiChieu" + soBuoiTongCong + "' value = 'Chiều-" + soNoiDung + "-" + ch + "' " + selectBuoiHoc + "/>Chiều";
						tr.insertCell(4-dem).innerHTML = "<select name = 'cboTietBatDau" +soBuoiTongCong + "' id = 'cboTietBatDau" + soBuoiTongCong + "' disabled = 'disabled'>" + optionTietHoc + "</select>";
						tr.insertCell(5-dem).innerHTML = "<input type = 'text' name = 'HinhThucDay" + soBuoiTongCong + "' value = '" + kieuDay + "' id = 'HinhThucDay" + soBuoiTongCong + "' readonly = 'readonly' size = '3'/>";
						tr.insertCell(6-dem).innerHTML = "<select name = 'Nhom" + soBuoiTongCong + "' id = 'Nhom" + soBuoiTongCong + "' disabled = 'disabled'>" + option + "</select>";
						tr.insertCell(7-dem).innerHTML = "<select name = 'Thu" + soBuoiTongCong + "' id = 'Thu" + soBuoiTongCong + "' onchange = '" + selectThu + " showNgayHoc(" + hienThiTuan + "," + soBuoiTongCong + ")'><option value = '1'>Thứ hai</option><option value = '2'>Thứ ba</option><option value = '3'>Thứ tư</option><option value = '4'>Thứ năm</option><option value = '5'>Thứ sáu</option><option value = '6'>Thứ bảy</option><option value = '7'>Chủ nhật</option></select>";
						tr.insertCell(8-dem).innerHTML = "<select id = 'Phong" + soBuoiTongCong + "' name = 'Phong" + soBuoiTongCong + "' onchange = 'thayDoiPhong(" + soBuoiTongCong + ")'>" + phongBan + "</select>";
						tr.insertCell(9-dem).innerHTML = "&nbsp;";
						tr.cells[9-dem].id = "tdTinhTrang" + soBuoiTongCong;
						tr.cells[9-dem].onclick = (function(a) {return function(){ thongBaoChiTietLoi(a); }})(soBuoiTongCong);
						//hiddenBuoi = "<input type = 'hidden' name = 'hiddenBuoi" + soBuoiTongCong + "' value = '" + soBuoiTongCong + "'/>";
						hiddenTuan = "<input type = 'hidden' name = 'hiddenTuan" + soBuoiTongCong   + "' value = '" + (soTuan + tuanBatDau - 1) + "' id = 'hiddenTuan" + soBuoiTongCong + "'/>";
						hiddenTenChuong = "<input type = 'hidden' name = 'hiddenTenChuong" + soBuoiTongCong   + "' value = '" + tenChuong + "' id = 'hiddenTenChuong" + soBuoiTongCong + "'/>";
						hiddenMucTieu = "<input type = 'hidden' name = 'hiddenMucTieu" + soBuoiTongCong   + "' value = '" + mucTieu + "' id = 'hiddenMucTieu" + soBuoiTongCong + "'/>";
						table.rows[soBuoiTongCong].cells[0].innerHTML = table.rows[soBuoiTongCong].cells[0].innerHTML + hiddenTuan + hiddenTenChuong + hiddenMucTieu;	
						document.getElementById('Phong' + soBuoiTongCong).value = chonPhong;	
						if(up == 1)
						{
							var objChiTiet = new Object();
							objChiTiet = objMonHocTKB.chiTietTKBList[soBuoiTongCong-1];
							document.getElementById('ChuoiMaChiTietTKB').value += objChiTiet.maChiTietTKB + "<->";
							document.getElementById('txtMaChiTietTKB' + soBuoiTongCong).value = objChiTiet.maChiTietTKB;
							var tinhTrangThayDoi = "";
							for(var d=0;d<listChiTietThayDoi.length;d++)
							{
								var objThayDoi =  listChiTietThayDoi[d];
								if(objThayDoi.maChiTietTKB == objChiTiet.maChiTietTKB)
								{
									document.getElementById('txtMaThayDoi' + soBuoiTongCong).value = objThayDoi.maThayDoi;
									tinhTrangThayDoi = objThayDoi.tinhTrang;
									document.getElementById('tr' + soBuoiTongCong).style.background = "lime";
									break;
								}
							}
							if(objChiTiet.buoi == 'Sáng')
								document.getElementById('BuoiSang' + soBuoiTongCong).checked = true;
							else
								document.getElementById('BuoiChieu' + soBuoiTongCong).checked = true;
							//document.getElementById('HinhThucDay' + soBuoiTongCong).value = objChiTiet.hinhThucDay;
							document.getElementById('Nhom' + soBuoiTongCong).value = objChiTiet.nhom;
							document.getElementById('Thu' + soBuoiTongCong).value = objChiTiet.thuTrongTuan;
							document.getElementById('Phong' + soBuoiTongCong).value = objChiTiet.phong;
							document.getElementById('cboTietBatDau' + soBuoiTongCong).value = objChiTiet.tietBatDau;
							document.getElementById('hiddenTuan' + soBuoiTongCong).value = objChiTiet.tuan;
							if(objChiTiet.tuan != soTuan + tuanBatDau - 1)
								document.getElementById('txtTuanHoc' + (soTuan + tuanBatDau - 1)).value = objChiTiet.tuan;
							
							for(var c=0;c<ngayHocList.length;c++)
							{
								if(hienThiTuan == ngayHocList[c].tuan)
								{
									if(objChiTiet.thuTrongTuan == '1')
										ngayHoc = ngayHocList[c].thuHai;
									else if(objChiTiet.thuTrongTuan == '2')
										ngayHoc = ngayHocList[c].thuBa;
									else if(objChiTiet.thuTrongTuan == '3')
										ngayHoc = ngayHocList[c].thuTu;
									else if(objChiTiet.thuTrongTuan == '4')
										ngayHoc = ngayHocList[c].thuNam;
									else if(objChiTiet.thuTrongTuan == '5')
										ngayHoc = ngayHocList[c].thuSau;
									else if(objChiTiet.thuTrongTuan == '6')
										ngayHoc = ngayHocList[c].thuBay;
									else 
										ngayHoc = ngayHocList[c].chuNhat;
									var m = ngayHoc.split("/");
									for(var d=0;d<ngayLeList.length;d++)
									{
										if(m[0] == ngayLeList[d].ngay && m[1] == ngayLeList[d].thang)
										{
											document.getElementById('txtNgayHoc' + soBuoiTongCong).style.color = "red";
											break;
										}
									}
									document.getElementById('txtNgayHoc' + soBuoiTongCong).value = ngayHoc;
									break;
								}
							}
							var m1 = <%="'" + ngayHeThong + "'"%>.split("-");
							if(Date.UTC(m[2], m[1], m[0]) <= Date.UTC(m1[2], m1[1], m1[0]) || tinhTrangThayDoi == '1')
							{
								document.getElementById('BuoiSang' + soBuoiTongCong).disabled = true;
								document.getElementById('BuoiChieu' + soBuoiTongCong).disabled = true;
								document.getElementById('Nhom' + soBuoiTongCong).disabled = true;
								document.getElementById('Thu' + soBuoiTongCong).disabled = true;
								document.getElementById('Phong' + soBuoiTongCong).disabled = true;
								document.getElementById('cboTietBatDau' + soBuoiTongCong).disabled = true;
							}
						}
					}
				}
				x = i + 1;
				soBuoiMoiTuan = 0;
			}
		}
		if((soTuan + tuanBatDau - 1) > obj.tuanLe[1])
			return false;
	}
	return true;
}
function thayDoiPhong(x)
{
	var objChiTiet = new Object();
	objChiTiet = objMonHocTKB.chiTietTKBList[x - 1];
	if(document.getElementById('Phong' + x).value != objChiTiet.phong)
	{
		document.getElementById("txtDong" + x).value = "1";
		document.getElementById("tr" + x).style.background = "lime";
	}
	else
	{
		if(document.getElementById('BuoiSang' + x).checked == true)
		{
			if('Sáng' == objChiTiet.buoi && document.getElementById('Thu' + x).value == objChiTiet.thuTrongTuan && document.getElementById('hiddenTuan' + x).value == objChiTiet.tuan)
			{
				document.getElementById("txtDong" + x).value = "0";
				document.getElementById("tr" + x).style.background = "";
			}
		}
		else
		{
			if('Chiều' == objChiTiet.buoi && document.getElementById('Thu' + x).value == objChiTiet.thuTrongTuan && document.getElementById('hiddenTuan' + x).value == objChiTiet.tuan)
			{
				document.getElementById("txtDong" + x).value = "0";
				document.getElementById("tr" + x).style.background = "";
			}
		}
	}
}
function showNgayHoc(tuanLePhuThuoc, x)
{
	var checkNgayHoc = true;
	for(var i=0;i<ngayHocList.length;i++)
	{
		if(ngayHocList[i].tuan == tuanLePhuThuoc)
		{
			if(document.getElementById('Thu' + x).value == 1)
				document.getElementById('txtNgayHoc' + x).value = ngayHocList[i].thuHai;
			else if(document.getElementById('Thu' + x).value == 2)
				document.getElementById('txtNgayHoc' + x).value = ngayHocList[i].thuBa;
			else if(document.getElementById('Thu' + x).value == 3)
				document.getElementById('txtNgayHoc' + x).value = ngayHocList[i].thuTu;
			else if(document.getElementById('Thu' + x).value == 4)
				document.getElementById('txtNgayHoc' + x).value = ngayHocList[i].thuNam;
			else if(document.getElementById('Thu' + x).value == 5)
				document.getElementById('txtNgayHoc' + x).value = ngayHocList[i].thuSau;
			else if(document.getElementById('Thu' + x).value == 6)
				document.getElementById('txtNgayHoc' + x).value = ngayHocList[i].thuBay;
			else 
				document.getElementById('txtNgayHoc' + x).value = ngayHocList[i].chuNhat;
			for(var j=0;j<ngayLeList.length;j++)
			{
				var m = document.getElementById('txtNgayHoc' + x).value.split("/");
				if(m[0] == ngayLeList[j].ngay && m[1] == ngayLeList[j].thang)
				{
					document.getElementById('txtNgayHoc' + x).style.color = "red"; 
					checkNgayHoc = false;
					break;
				}
			}
			break;
		}
	}
	if(checkNgayHoc == true)
		document.getElementById('txtNgayHoc' + x).style.color = "black";
}
function getTuanHoc(tuanMacDinh)
{
	checkTuanHoc = document.getElementById('txtTuanHoc' + tuanMacDinh).value;
}
function doiTuanHoc(buoiBatDau, soBuoi, tuanMacDinh)
{
	var checkNgayHoc = true;
	if(validateTuan(tuanMacDinh) == true)
	{
		var objNgayHoc = new Object();
		var ngayHoc = "";
		for(var j=0;j<ngayHocList.length;j++)
		{
			objNgayHoc = ngayHocList[j];
			if(objNgayHoc.tuan == document.getElementById('txtTuanHoc' + tuanMacDinh).value)
				break;
		}
		var x = buoiBatDau;
		for(var i=buoiBatDau; i< buoiBatDau + soBuoi; i++)
		{
			document.getElementById('hiddenTuan' + i).value = document.getElementById('txtTuanHoc' + tuanMacDinh).value;
			var objChiTiet = new Object();
			objChiTiet = objMonHocTKB.chiTietTKBList[x - 1];
			if(document.getElementById('hiddenTuan' + x).value != objChiTiet.tuan)
			{
				document.getElementById("txtDong" + x).value = "1";
				document.getElementById("tr" + x).style.background = "lime";
			}
			else
			{
				if(document.getElementById('BuoiSang' + x).checked == true)
				{
					if('Sáng' == objChiTiet.buoi && document.getElementById('Thu' + x).value == objChiTiet.thuTrongTuan && document.getElementById('Phong' + x).value == objChiTiet.phong)
					{
						document.getElementById("txtDong" + x).value = "0";
						document.getElementById("tr" + x).style.background = "";
					}
				}
				else
				{
					if('Chiều' == objChiTiet.buoi && document.getElementById('Thu' + x).value == objChiTiet.thuTrongTuan && document.getElementById('Phong' + x).value == objChiTiet.phong)
					{
						document.getElementById("txtDong" + x).value = "0";
						document.getElementById("tr" + x).style.background = "";
					}
				}				
			}
			if(document.getElementById('Thu' + i).value == '1')
				ngayHoc = objNgayHoc.thuHai;
			else if(document.getElementById('Thu' + i).value == '2')
				ngayHoc = objNgayHoc.thuBa;
			else if(document.getElementById('Thu' + i).value == '3')
				ngayHoc = objNgayHoc.thuTu;
			else if(document.getElementById('Thu' + i).value == '4')
				ngayHoc = objNgayHoc.thuNam;
			else if(document.getElementById('Thu' + i).value == '5')
				ngayHoc = objNgayHoc.thuSau;
			else if(document.getElementById('Thu' + i).value == '6')
				ngayHoc = objNgayHoc.thuBay;
			else 
				ngayHoc = objNgayHoc.chuNhat;
			document.getElementById('txtNgayHoc' + i).value = ngayHoc;
			for(var j=0;j<ngayLeList.length;j++)
			{
				var m = document.getElementById('txtNgayHoc' + i).value.split("/");
				if(m[0] == ngayLeList[j].ngay && m[1] == ngayLeList[j].thang)
				{
					document.getElementById('txtNgayHoc' + i).style.color = "red"; 
					checkNgayHoc = false;
					break;
				}
			}
			if(checkNgayHoc == true)
				document.getElementById('txtNgayHoc' + i).style.color = "black";
		}
		document.getElementById('txtTuanHoc' + tuanMacDinh).style.background = "";
	}
	else
	{
		document.getElementById('txtTuanHoc' + tuanMacDinh).value = checkTuanHoc;
		document.getElementById('txtTuanHoc' + tuanMacDinh).style.background = "red";
	}
}
function validateTuan(tuanMacDinh)
{
		var tuanHoc = document.getElementById('txtTuanHoc' + tuanMacDinh).value;
		if(tuanHoc != '')
		{
			tuanHoc = tuanHoc.replace("-","");
			if((parseInt(tuanHoc) - 0) + "" != document.getElementById('txtTuanHoc' + tuanMacDinh).value)
			{
				alert("Phải nhập số vào ô này");
				return false;
			}
			else
			{
				var tuanTruoc = document.getElementById('TuanLeBatDau').value;
				var tuanSau = obj.tuanLe[1];
				if(document.getElementById('txtTuanHoc' + (tuanMacDinh - 1)) != null)
					tuanTruoc = document.getElementById('txtTuanHoc' + (tuanMacDinh - 1)).value;
				if(document.getElementById('txtTuanHoc' + (tuanMacDinh + 1)) != null)
					tuanSau = document.getElementById('txtTuanHoc' + (tuanMacDinh + 1)).value;
				if(parseInt(tuanHoc) > parseInt(tuanSau) || tuanHoc < parseInt(tuanTruoc))
				{
					alert("Tuần lễ này không phù hợp!!!");
					return false;
				}
			}
		}
		else
		{
			alert("Không thể bỏ trống ô này");	
			return false;
		}
	return true;
}
function changePhongLyThuyet()
{
	for(var i=1;i<=soBuoiTongCong;i++)
	{
		if(document.getElementById('HinhThucDay' + i).value == 'LT')
			document.getElementById('Phong' + i).value = document.getElementById('phongLyThuyet').value;
	}
}
function changePhongThucHanh()
{
	for(var i=1;i<=soBuoiTongCong;i++)
	{
		if(document.getElementById('HinhThucDay' + i).value != 'TH' || document.getElementById('HinhThucDay' + i).value != 'THP')
			document.getElementById('Phong' + i).value = document.getElementById('phongThucHanh').value;
	}
}
function kiemTraTrungGioHoc()
{
	var check = true, tinhTrang = true;
	var tuan = "na";
	var temp;
	for(var i=1;i<=soBuoiTongCong;i++)
	{
		tinhTrang = true;
		var tdTinhTrang = "&nbsp;";
		if(document.getElementById('hiddenTuan' + i).value != tuan)
		{
			tuan = document.getElementById('hiddenTuan' + i).value;
			temp = i;
		}
		else
		{
			for(var j=temp;j<i;j++)
			{
				var tdTinhTrang1 = document.getElementById('tdTinhTrang' + j).innerHTML;
				if(document.getElementById('BuoiSang' + i).checked == document.getElementById('BuoiSang' + j).checked && document.getElementById('BuoiChieu' + i).checked == document.getElementById('BuoiChieu' + j).checked)
				{
					if(document.getElementById('Thu' + i).value == document.getElementById('Thu' + j).value)
					{
						//
						if(document.getElementById('Nhom' + i).value == document.getElementById('Nhom' + j).value)
						{
							var tiet = parseInt(document.getElementById('cboTietBatDau' + i).value);
							for(var k=tiet;k<tiet + parseInt(document.getElementById('txtSoTiet1Buoi').value);k++)
							{
								if(document.getElementById('cboTietBatDau' + j).value <= k && k < parseInt(document.getElementById('cboTietBatDau' + j).value) + parseInt(document.getElementById('txtSoTiet1Buoi').value))
								{
									tdTinhTrang1 = "<font color = 'red'>#</font>";
									document.getElementById('tdTinhTrang' + j).innerHTML = tdTinhTrang1;
									check = false;
									tinhTrang = false;
									break;
								}
							}
						}
						else
						{
							var tiet = parseInt(document.getElementById('cboTietBatDau' + i).value);
							for(var k=tiet;k<tiet + parseInt(document.getElementById('txtSoTiet1Buoi').value);k++)
							{
								if(document.getElementById('cboTietBatDau' + j).value <= k && k < parseInt(document.getElementById('cboTietBatDau' + j).value) + parseInt(document.getElementById('txtSoTiet1Buoi').value))
								{
									tdTinhTrang1 = "<font color = 'red'>#</font>";
									document.getElementById('tdTinhTrang' + j).innerHTML = tdTinhTrang1;
									check = false;
									tinhTrang = false;
									break;
								}
							}
						}
						//
						
					}
				}
			}
			
			if(tinhTrang == false)
			{
				tdTinhTrang = "<font color = 'red'>#</font>";
			}
		}
		document.getElementById('tdTinhTrang' + i).innerHTML = tdTinhTrang;
	}
	return check;
}
function selectThuTrongTuan(x) // chon thu trong dong dau tien thi thu o cac dong sau se chay theo
{
	var objChiTiet = new Object();
	objChiTiet = objMonHocTKB.chiTietTKBList[x - 1];
	if(document.getElementById('Thu' + x).value != objChiTiet.thuTrongTuan)
	{
		document.getElementById("txtDong" + x).value = "1";
		document.getElementById("tr" + x).style.background = "lime";
	}
	else
	{
		if(document.getElementById('BuoiSang' + x).checked == true)
		{
			if('Sáng' == objChiTiet.buoi && document.getElementById('Phong' + x).value == objChiTiet.phong && document.getElementById('hiddenTuan' + x).value == objChiTiet.tuan)
			{
				document.getElementById("txtDong" + x).value = "0";
				document.getElementById("tr" + x).style.background = "";
			}
		}
		else
		{
			if('Chiều' == objChiTiet.buoi && document.getElementById('Phong' + x).value == objChiTiet.phong && document.getElementById('hiddenTuan' + x).value == objChiTiet.tuan)
			{
				document.getElementById("txtDong" + x).value = "0";
				document.getElementById("tr" + x).style.background = "";
			}
		}
	}
}

function selectBuoi(x) // chon nhom trong dong dau tien thi nhom o cac dong sau se chay theo
{
	var objChiTiet = new Object();
	objChiTiet = objMonHocTKB.chiTietTKBList[x - 1];
	if(document.getElementById('BuoiSang' + x).checked == true)
	{
		if(document.getElementById('BuoiSang' + x).value.split("-")[0] != objChiTiet.buoi)
		{
			document.getElementById("txtDong" + x).value = "1";
			document.getElementById("tr" + x).style.background = "lime";
		}
		else
		{
			if(document.getElementById('Thu' + x).value == objChiTiet.thuTrongTuan && document.getElementById('Phong' + x).value == objChiTiet.phong && document.getElementById('hiddenTuan' + x).value == objChiTiet.tuan)
			{
				document.getElementById("txtDong" + x).value = "0";
				document.getElementById("tr" + x).style.background = "";
			}
		}
	}
	else if(document.getElementById('BuoiChieu' + x).checked == true)
	{
		if(document.getElementById('BuoiChieu' + x).value.split("-")[0] != objChiTiet.buoi)
		{
			document.getElementById("txtDong" + x).value = "1";
			document.getElementById("tr" + x).style.background = "lime";
		}
		else
		{
			if(document.getElementById('Thu' + x).value == objChiTiet.thuTrongTuan && document.getElementById('Phong' + x).value == objChiTiet.phong && document.getElementById('hiddenTuan' + x).value == objChiTiet.tuan)
			{
				document.getElementById("txtDong" + x).value = "0";
				document.getElementById("tr" + x).style.background = "";
			}
		}
	}
	
}
function kiemTraNgayLe()
{
	for(var i=1;i<=soBuoiTongCong;i++)
	{
		if(document.getElementById('txtNgayHoc' + i).style.color == 'red')
			return false;
	}
	return true;
}
function kiemTraThayDoi()
{
	var thayDoi = false;
	if(objMonHocTKB.maGiaoVien != document.getElementById('giaoVien').value)
	{
		thayDoi = true;
		document.getElementById('txtThayDoiGV').value = "1";
	}
	else
		document.getElementById('txtThayDoiGV').value = "0";
	if(thayDoi == false)
	{
		for(var i=1;i<=soBuoiTongCong;i++)
		{
			if(document.getElementById('txtDong' + i).value == '1')
			{
				thayDoi = true;
				break;
			}
		}
	}
	return thayDoi;
}
function taoMonHoc()// tao ra mon hoc voi day du du lieu va truyen ve cu so chinh
{
	var check = true, checkBuoi = true, err = false;
	var table = document.getElementById('TableBuoiHoc');
	document.getElementById('txtSoBuoi').value = soBuoiTongCong;
	document.getElementById('MaNamHoc').value = <%=request.getParameter("maNamHoc")%>;
	var t = true; // dung de kiem tra xem co bi trung phong hay giao vien khong
	if(document.getElementById('txtMonHoc').value == "")
	{
		alert("Hãy chọn môn học");
		check = false;
	}
	else if(document.getElementById('giaoVien').value == "")
	{
		alert("Hãy chọn giáo viên");
		check = false;
	} 
	else if (<%=Constant.SETTING_RES.getString("Check")%> == 1)
		check = true;
	else if(kiemTraTrungGioHoc() == false)
	{
		alert("Giờ học không hợp lệ");
		check = false;
	}
	else if(kiemTraNgayLe() == false)
	{
		alert("Giờ học trùng với ngày lễ");
		check = false;	
	}
	else if(kiemTraThayDoi() == false)
	{
		alert("Không có thay đổi nào");
		check = false;	
	}
	else 
	{
		taoListSuDungPhong();
		var buoi = '';
		for(var i=1;i<=soBuoiTongCong;i++)
		{
			//var phong = document.getElementById('Phong' + i).value;
			var tdTinhTrang = "&nbsp;";
			document.getElementById('txtError' + i).value = "";
			//var tdTietBatDau = document.getElementById('tdTietBatDau' + i).innerHTML;
			//var c = tdPhong.charAt(tdPhong.length-8);
			t = true;
			if(document.getElementById('BuoiSang' + i).checked == true)
				buoi = 'Sáng';
			else
				buoi = 'Chiều';		
			for(var j=0;j<listSuDungPhong.length;j++)
			{
				var objTuan = new Object();
				objTuan = listSuDungPhong[j];
				if(document.getElementById('hiddenTuan' + i).value == objTuan.tuan)
				{
					var listBuoi = new Array();
					listBuoi = objTuan.listBuoi;
					for(var k =0;k<listBuoi.length;k++)
					{
						var objBuoi = new Object();
						objBuoi = listBuoi[k];
						if(buoi == objBuoi.buoi)
						{
							var listThu = new Array();
							listThu = objBuoi.listThu;
							for(var h =0;h<listThu.length;h++)
							{
								var objThu = new Object();
								objThu = listThu[h];
								if(document.getElementById('Thu' + i).value == objThu.thu)
								{
										
										listPhong = objThu.listPhong;
										for(var m=0;m<listPhong.length;m++)
										{
											var objPhong = new Object();
											objPhong = listPhong[m];
											if(maLop == objPhong.maLop)
											{
												if(document.getElementById('Nhom' + i).value == objPhong.nhom)
												{
													var tiet = parseInt(document.getElementById('cboTietBatDau' + i).value);
													for(var n=tiet;n<tiet + parseInt(document.getElementById('txtSoTiet1Buoi').value);n++)
													{
														if(objPhong.tietBatDau <= n && n < parseInt(objPhong.tietBatDau) + parseInt(objPhong.soTiet))
														{
															tdTinhTrang = "<font color = 'red'>TG</font>";
															document.getElementById('txtError' + i).value = "1/" + objPhong.maMonHoc;
															err = true;
															check = false;
															t = false;
															break;
														}
													}
													if(t == false)
														break;
												}
											}
										}
										if(t)
										{
											for(var m=0;m<listPhong.length;m++)
											{
												var objPhong = new Object();
												objPhong = listPhong[m];	
												if(document.getElementById('Phong' + i).value == objPhong.maPhong)
												{
													var tiet = parseInt(document.getElementById('cboTietBatDau' + i).value);
													for(var n=tiet;n<tiet + parseInt(document.getElementById('txtSoTiet1Buoi').value);n++)
													{
														if(objPhong.tietBatDau <= n && n < parseInt(objPhong.tietBatDau) + parseInt(objPhong.soTiet))
														{
															tdTinhTrang = "<font color = 'red'>*</font>";
															document.getElementById('txtError' + i).value = "2/" + objPhong.maLop;
															err = true;
															check = false;
															t = false;
															break;
														}
													}
													if(t == false)
														break;
												}
											}
										}
										if(t)
										{
											for(var m=0;m<listPhong.length;m++)
											{
												var objPhong = new Object();
												objPhong = listPhong[m];
												if(document.getElementById('giaoVien').value == objPhong.maGiaoVien) 
												{
													var tiet = parseInt(document.getElementById('cboTietBatDau' + i).value);
													for(var n=tiet;n<tiet + parseInt(document.getElementById('txtSoTiet1Buoi').value);n++)
													{
														if(objPhong.tietBatDau <= n && n < parseInt(objPhong.tietBatDau) + parseInt(objPhong.soTiet))
														{
															tdTinhTrang = "<font color = 'red'>x</font>";
															document.getElementById('txtError' + i).value = "3/" + objPhong.maLop;
															/*if(c != ">" && c != "x")
															{
																tdPhong = tdPhong.replace(">" + c + "</font>", ">x</font>");
																tdPhong = tdPhong.replace(">" + c + "</FONT>", ">x</FONT>");
															}
															else 
															{
																tdPhong = tdPhong.replace("></font>", ">x</font>");
																tdPhong = tdPhong.replace("></FONT>", ">x</FONT>");
															}*/
															//document.getElementById('tdPhong' + i).innerHTML = tdPhong;
															//document.getElementById('Phong' + i).value = phong;
															err = true;
															check = false;
															t = false;
															break;
														}
													}
													if(t == false)
														break;
												}
											}
										}
										if(t == false)
											break;
									}
							}
							if(t == false)
								break;
						}
					}
					if(t == false)
						break;
				}
			}
			document.getElementById('tdTinhTrang' + i).innerHTML = tdTinhTrang;
			//document.getElementById('Phong' + i).value = phong;
		}
	}
	if(check == false)
	{
		if(err == true) 
		{
			alert("TG : Trùng giờ học\n* : Phòng bị trùng\nx : Giáo viên bị trùng");
		}
		return false;
	}
	else {
		if(confirm("Bạn có chắc muốn thay đổi không ???"))
		{
			taoChuoiThuTrongTuan();
			//thayDoi();
		}
	}
}
function thongBaoChiTietLoi(x)
{
	if(document.getElementById('txtError' + x).value != '')
	{
		var kieuTrung = document.getElementById('txtError' + x).value.split('/');
		if(kieuTrung[0] == 1)
		{
			for(var i=0;i<listMonHoc.length;i++)
			{
				if(kieuTrung[1] == listMonHoc[i].maMonHoc)
				{
					alert("Trùng giờ học với môn " + listMonHoc[i].tenMonHoc);
					break;
				}
			}
		}
		else
		{
			for(var i=0;i<listLopHoc.length;i++)
			{
				if(kieuTrung[1] == listLopHoc[i].maLopHoc)
				{
					if(kieuTrung[0] == 2)
						alert("Trùng phòng học với lớp " + listLopHoc[i].tenLopHoc);
					else
						alert("Trùng giáo viên với lớp " + listLopHoc[i].tenLopHoc);
					break;
				}
			}
		}
	}
}
function selectPhongThucHanh()
{
	<%
		for(int i=0;i<phongBanModelList.size();i++) {
			out.print("if(document.getElementById('phongThucHanh').value == '" + phongBanModelList.get(i).getMaPhongBan() + "')");
			out.print("document.getElementById('SucChua').value = '" + phongBanModelList.get(i).getSucChua() + "';");
		}
	%>
}
function taoChuoiThuTrongTuan() // tao 1 chuoi de display ben cua so chinh va gan cac gia tri vao obj addTKB
{
	var chuoiPhongTH = "";
	var chuoiPhongLT = "";
	var chuoi = "";
	var chuoiThuTrongTuan = "";
	var str = "";
	var soTuanLT = 0, soTuanTH = 0;
	
	addTKB.tuanKetThucLT = "";
	addTKB.tuanKetThucTH = "";
	addTKB.tuanBatDauLT = "";
	addTKB.tuanBatDauTH = "";
	
	for(var i=1;i<=soBuoiTongCong;i++)
	{
		if(document.getElementById('HinhThucDay' + i).value == 'LT') {
			soTuanLT++;
			addTKB.tuanKetThucLT = document.getElementById('hiddenTuan' + i).value;
			// code phần phòng
			if(chuoiPhongLT.match(document.getElementById('Phong' + i).options[document.getElementById('Phong' + i).selectedIndex].text) == null)
			{
				if(chuoiPhongLT == "")
					chuoiPhongLT += document.getElementById('Phong' + i).options[document.getElementById('Phong' + i).selectedIndex].text;
				else
					chuoiPhongLT += "-" + document.getElementById('Phong' + i).options[document.getElementById('Phong' + i).selectedIndex].text;
			}
			//
		}
		else // su dung cho TH va Tich hop
		{
			soTuanTH++;
			addTKB.tuanKetThucTH = document.getElementById('hiddenTuan' + i).value;
			// code phần phòng
			if(chuoiPhongTH.match(document.getElementById('Phong' + i).options[document.getElementById('Phong' + i).selectedIndex].text) == null)
			{
				if(chuoiPhongTH == "")
					chuoiPhongTH += document.getElementById('Phong' + i).options[document.getElementById('Phong' + i).selectedIndex].text;
				else
					chuoiPhongTH += "-" + document.getElementById('Phong' + i).options[document.getElementById('Phong' + i).selectedIndex].text;
			}
			//
		}
		if(soTuanLT == 1)
			addTKB.tuanBatDauLT = addTKB.tuanKetThucLT;
		if(soTuanTH == 1)
			addTKB.tuanBatDauTH = addTKB.tuanKetThucTH;
		if(i == 1)
			str = "";
		else
			str = "-";
		if(document.getElementById('BuoiSang' + i).checked == true)
		{
			chuoi += 'Sáng/' + document.getElementById('Thu' + i).value + '/' + document.getElementById('HinhThucDay' + i).value;	
		}
		else
		{
			chuoi += 'Chiều/' + document.getElementById('Thu' + i).value + '/' + document.getElementById('HinhThucDay' + i).value;	
		}
		if(!chuoiThuTrongTuan.match(chuoi))
			chuoiThuTrongTuan += str + chuoi;
		chuoi = "";
	}
	document.getElementById('Tuan_bat_dau_LT').value = addTKB.tuanBatDauLT;
	document.getElementById('Tuan_bat_dau_TH').value = addTKB.tuanBatDauTH;
	document.getElementById('Tuan_ket_thuc_LT').value = addTKB.tuanKetThucLT;
	document.getElementById('Tuan_ket_thuc_TH').value = addTKB.tuanKetThucTH;
	document.getElementById('ChuoiThuTrongTuan').value = chuoiThuTrongTuan;
	document.getElementById('ChuoiPhongLT').value = chuoiPhongLT;
	document.getElementById('ChuoiPhongTH').value = chuoiPhongTH;
	document.getElementById('KieuBienSoan').value = objMonHocTKB.kieuBienSoan;
	document.getElementById('SoTietLyThuyet').value = objMonHocTKB.soTietLT;
	document.getElementById('SoTietThucHanh').value = objMonHocTKB.soTietTH;
	
	document.forms["AddThoiKhoaBieu"].submit();
}
function thayDoi()
{
	var xmlhttp;
	var result = "";
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
	  	xmlhttp = new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
	  	xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
	  	if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
	    {
	    	result = xmlhttp.responseText;
	    }
	}
	xmlhttp.open("POST", <%="'" + request.getContextPath() + "'"%> + "/thoiKhoaBieuController?thayDoi=yes",true);
	xmlhttp.send();
}
function closeWindow()
{
	window.close();
}
function traVe(tempObject)
{
	addTKB.maMonHocTKB = tempObject.maMonHocTKB;
	addTKB.soNoiDung = tempObject.soNoiDung;
	addTKB.soCaThucHanh = tempObject.soCaThucHanh;
	addTKB.maMonHoc = tempObject.maMonHoc;
	addTKB.tenMonHoc = tempObject.tenMonHoc;
	addTKB.maGiaoVien = tempObject.maGiaoVien;
	addTKB.tenGiaoVien = tempObject.tenGiaoVien;
	addTKB.ghiChu = tempObject.ghiChu;
	addTKB.tuanBatDauLT = tempObject.tuanBatDauLT;
	addTKB.tuanBatDauTH = tempObject.tuanBatDauTH;
	addTKB.ngayBatDauLT = tempObject.ngayBatDauLT;
	addTKB.ngayBatDauTH = tempObject.ngayBatDauTH;
	addTKB.ngayKetThucLT = tempObject.ngayKetThucLT;
	addTKB.ngayKetThucTH = tempObject.ngayKetThucTH;
	addTKB.chuoiThuTrongTuan = tempObject.chuoiThuTrongTuan;
	addTKB.phongLT= tempObject.phongLT;
	addTKB.phongTH= tempObject.phongTH;
	addTKB.kieuBienSoan = tempObject.kieuBienSoan;
	addTKB.soTietLT = tempObject.soTietLT;
	addTKB.soTietTH = tempObject.soTietTH;
	addTKB.maPhongLT = tempObject.maPhongLT;
	addTKB.maPhongTH = tempObject.maPhongTH;
	addTKB.soTiet1Buoi = tempObject.soTiet1Buoi;
	addTKB.chiTietTKBList = new Array();
	var arr = tempObject.chiTietTKBList;
	addTKB.chiTietTKBList = new Array();
	for(var i=0;i<arr.length;i++) {
		addTKB.chiTietTKBList[i] = new Object();
		addTKB.chiTietTKBList[i].maChiTietTKB = arr[i].maChiTietTKB;
		addTKB.chiTietTKBList[i].buoi = arr[i].buoi;
		addTKB.chiTietTKBList[i].sTTNoiDung = arr[i].sTTNoiDung;
		addTKB.chiTietTKBList[i].coHieu = arr[i].coHieu;
		addTKB.chiTietTKBList[i].hinhThucDay = arr[i].hinhThucDay;
		addTKB.chiTietTKBList[i].thuTrongTuan = arr[i].thuTrongTuan;
		addTKB.chiTietTKBList[i].phong = arr[i].phong;
		addTKB.chiTietTKBList[i].tuan = arr[i].tuan;
		addTKB.chiTietTKBList[i].soThuTu = arr[i].soThuTu;
		addTKB.chiTietTKBList[i].nhom = arr[i].nhom;
		addTKB.chiTietTKBList[i].tenChuong = arr[i].tenChuong;
		addTKB.chiTietTKBList[i].mucTieu = arr[i].mucTieu;
		addTKB.chiTietTKBList[i].tietBatDau = arr[i].tietBatDau;
	}	
}
</script>
</head>
<body onload="loadPage();">
	<form action = "<%=request.getContextPath()%>/thoiKhoaBieuController?thayDoi=yes" method="post" name = "AddThoiKhoaBieu">
		<table id = "TKB">
			<th colspan="4">Thêm Môn Học</th>
			<tr>
				<td>Tổng số học sinh :</td>
				<td><input type="text" readonly="readonly" name = "txtTongHocSinh" id = "TongHocSinh"/></td>
			</tr>
			<tr>
				
				<td>Tên môn học :</td>
				<td>
					<input type = "hidden" name = "txtMonHoc" id = "txtMonHoc"/>
					<input type = "text" id = "txtTenMonHoc" name = "txtTenMonHoc" readonly="readonly"/>
				</td>
			</tr>
			<tr id="trGiangDay">
			</tr>
			<tr>
				<td>Giáo viên :</td>
				<td>
				<input type = "hidden" name="txtTenGiaoVien" id = "txtTenGiaoVien"/> 
				<select id="giaoVien" name="cboGiaoVien" onchange="selectGiaoVien();">
					<option value="">select</option>
				</select></td>
			</tr>
			<tr>
				<td>Số nội dung học trong tuần</td>
				<td>
					<input type = "text" id = "txtSoNoiDung" value = "1" name = "txtSoNoiDung"/> 
				</td>
				<td>Số tiết học 1 buổi</td>
				<td><input type = "text" id = "txtSoTiet1Buoi" value = "1" name = "txtSoTiet1Buoi" readonly="readonly"/></td> 
			</tr>
		 	<tr>
				<td>Phòng học lý thuyết :</td>
				<td><select id="phongLyThuyet" onchange="changePhongLyThuyet();" name = "cboPhongLT">
					<option></option>
				</select></td>
			</tr>
			<tr>
				<td>Phòng học thưc hành :</td>
				<td><select id="phongThucHanh" onchange="changePhongThucHanh();" name = "cboPhongTH">
					<option></option>
				</select></td>
				<td>Sức chứa :</td>
				<td><input type="text" readonly="readonly" id="SucChua"/></td>
			</tr> 
			<tr>
				<td>Số ca lý thuyết :</td>
				<td><input type="text" id = "SoCaLyThuyet" value="1" name="SoCaLyThuyet" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>Số ca thực hành :</td>
				<td><input type="text" id = "SoCa" value="1" name="SoCa" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>Tuần bắt đầu :</td>
				<td>
					<input type = "text" id = "TuanLeBatDau" name="cboTuanLeBatDau" readonly="readonly"/>
				</td>
			</tr>
		</table>
		<table id = "TableHidden"></table>
		<table border="1" id = "TableKieuDay"></table>
		<table id = "TableButton"></table>
		<table border="1" id = "TableBuoiHoc"></table>
		<table>
			<tr><td>Ghi chú
					<textarea rows="5" cols="50" name = "areaGhiChu" id = "GhiChu" readonly="readonly"></textarea>
			</td>
			</tr>
				<tr align="center"ju><td>	
					<input type="button" value = "Thay đổi" onclick="taoMonHoc();"/>
					<input type="button" value = "Đóng cửa sổ" onclick="closeWindow();"/>
				</td>
			</tr>	
		</table>
		<input type="hidden" name = "txtMaMonHocTKB" id = "txtMaMonHocTKB"/>
		<input type="hidden" name = "txtSoBuoi" id = "txtSoBuoi"/>
		<input type="hidden" name = "action" value = "Update"/>
		<input type="hidden" name = "txtMaTKB" id = "txtMaTKB" value = ""/>
		<input type="hidden" name = "Tuan_bat_dau_LT" id = "Tuan_bat_dau_LT" value = ""/>
		<input type="hidden" name = "Tuan_ket_thuc_LT" id = "Tuan_ket_thuc_LT" value = ""/>
		<input type="hidden" name = "Tuan_bat_dau_TH" id = "Tuan_bat_dau_TH" value = ""/>
		<input type="hidden" name = "Tuan_ket_thuc_TH" id = "Tuan_ket_thuc_TH" value = ""/>
		<input type="hidden" name = "MaNamHoc" id = "MaNamHoc"/>
		<input type="hidden" name = "ChuoiPhongLT" id = "ChuoiPhongLT" value = ""/>
		<input type="hidden" name = "ChuoiPhongTH" id = "ChuoiPhongTH" value = ""/>
		<input type="hidden" name = "ChuoiThuTrongTuan" id = "ChuoiThuTrongTuan" value = ""/>
		<input type="hidden" name = "KieuBienSoan" id = "KieuBienSoan" value=""/>
		<input type="hidden" name = "SoTietLyThuyet" id = "SoTietLyThuyet" value=""/>
		<input type="hidden" name = "SoTietThucHanh" id = "SoTietThucHanh" value=""/>
		<input type="hidden" name = "ChuoiMaChiTietTKB" id = "ChuoiMaChiTietTKB" value=""/>
		<input type="hidden" name = "MangChiTietLength" id = "MangChiTietLength" value=""/>
		<input type = "hidden" id = "txtThayDoiGV" name = "txtThayDoiGV" value = "0"/>
		<input type = "hidden" id = "txtMaGVThayDoi" name = "txtMaGVThayDoi" value = "-1"/>
	</form>
</body>
</html>