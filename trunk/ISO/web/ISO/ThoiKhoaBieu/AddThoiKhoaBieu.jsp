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
<%@page import="vn.edu.hungvuongaptech.model.ChiTietTKBModel"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thêm môn học TKB</title>
<script language="JavaScript" type="text/javascript">
var objWindow = new Object();
var tonTai = 0; // kiem tra bang 1 co ton tai khong -0 : chua ton tai -1 : da ton tai
var obj = window.dialogArguments;
var addTKB = new Object(); //obj dung de tra ve
var listSuDungPhong; // list su dung phong
var kieuBienSoan;
var soThucHanh = 0;
var soLyThuyet = 0;
var lyThuyet;
var thucHanh;
var soTiet = 0;
var STT = 0, soBuoiTongCong = 0;// STT : so thu tu cua tung buoi trong bang 1, soBuoiTongCong : tong so buoi cua mon hoc
var tonTaiBang = false; //kiem tra xem bang 2 ton tai chua -true : da ton tai -false : chua ton tai
var kieu; // mang luu kieu day cua bang theo trinh tu ben de cuong
var tuanBatDau = 0;
var tietBatDau = 1;
var maLop;
var checkTuanHoc = -1;
<%
	// parameter hoc ki khong su dung cho ham getAllDeCuongMonHocApprovedByMaChuongTrinh() va getAllNoiDungDCMHByMaChuongTrinhAndHocKi
	ArrayList<DeCuongMonHocModel> deCuongMonHocModelList = DeCuongMonHocDAO.getAllDeCuongMonHocApprovedByMaChuongTrinh(request.getParameter("maChuongTrinh"), request.getParameter("hocKi"));
	ArrayList<PhongBanModel> phongBanModelList = PhongBanDAO.getAllPhongBan();
	ArrayList<ThanhVienModel> thanhVienModelList = ThanhVienDAO.getAllGiaoVienOrderByTen();
	ArrayList<NoiDungDCMHModel> noiDungDCMHModelList = NoiDungDCMHDAO.getAllNoiDungDCMHByMaChuongTrinhAndHocKi(request.getParameter("maChuongTrinh"), request.getParameter("hocKi"));
%>
function taoListSuDungPhong()
{
	listSuDungPhong = new Array();
	<%
		ArrayList<ChiTietTKBModel> chiTietTKBModelList = ChiTietTKBDAO.getAllSuDungPhongByNamHoc(request.getParameter("maNamHoc"),null,request.getParameter("tuTuan"),request.getParameter("denTuan"));
	// tao list su dung phong
		out.print("var thuTuTuan, buoi, thu;");
		out.print("var listPhong = new Array();");
		out.print("var listThu = new Array();");
		out.print("var listBuoi = new Array();");
		String thuTuTuan = "na", buoi = "na", thu = "na", phong = "na";
		int bac = 0;
		for(int i=0;i<chiTietTKBModelList.size();i++)
		{
			ChiTietTKBModel chiTiet = chiTietTKBModelList.get(i);
		/*	if(!chiTiet.getTuan().equals(thuTuTuan))
				bac = 3;
			else if(!chiTiet.getBuoi().equals(buoi))
				bac = 2;
			else if(!chiTiet.getThuTrongTuan().equals(thu))
				bac = 1;
			else
				bac = 0;
			if(bac == 3) {
				thuTuTuan = chiTiet.getTuan();
				out.print("var objTuan = new Object();");
				out.print("objTuan.tuan = '" + chiTiet.getTuan() + "';");
				out.print("objTuan.listBuoi = listBuoi;");
				out.print("listSuDungPhong[listSuDungPhong.length] = objTuan;");
				out.print("var listBuoi = new Array();");
			}
			if(bac > 1) {
				buoi = chiTiet.getBuoi();
				out.print("var objBuoi = new Object();");
				out.print("objBuoi.buoi = '" + chiTiet.getBuoi() + "';");
				out.print("objBuoi.listThu = listThu;");
				out.print("listBuoi[listBuoi.length] = objBuoi;");
				out.print("var listThu = new Array();");
			}
			if(bac > 0) {
				thu = chiTiet.getThuTrongTuan();
				out.print("var objThu = new Object();");
				out.print("objThu.thu = '" + chiTiet.getThuTrongTuan() + "';");
				out.print("objThu.listPhong = listPhong;");
				out.print("listThu[listThu.length] = objThu;");
			}
			out.print("var objPhong = new Object();");
			out.print("objPhong.maPhong = '" + chiTiet.getMaPhong() + "';");
			out.print("objPhong.maGiaoVien = '" + chiTiet.getMaGiaoVien() + "';");
			out.print("objPhong.tietBatDau = '" + chiTiet.getTietBatDau() + "';");
			out.print("objPhong.soTiet = '" + chiTiet.getSoTietHoc1Buoi() + "';");
			out.print("listPhong[listPhong.length] = objPhong;");*/
			
			
			if(i == chiTietTKBModelList.size() - 1)
			{
				out.print("thuTuTuan = 'na';");
				out.print("buoi = 'na';");
				out.print("thu = 'na';");
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
function loadPage()
{
	var param = 0;
	<%
		out.print("document.getElementById('txtMaTKB').value = '" + request.getParameter("maTKB") + "';");
		// tao 1 obj de tra ve cua so chinh 
		if(request.getAttribute("monHocTKB") != null && request.getParameter("AddThanhCong") != null)
		{
			out.print("param = 1;");
			MonHocTKBModel monHocModel = (MonHocTKBModel) request.getAttribute("monHocTKB");
			out.print("addTKB.maMonHocTKB = '" + monHocModel.getMaMonHocTKB() + "';");
			out.print("addTKB.soNoiDung = '" + monHocModel.getSoNoiDung() + "';");
			out.print("addTKB.soCaThucHanh = '" + monHocModel.getSoCaThucHanh() + "';");
			out.print("addTKB.soCaLyThuyet = '" + monHocModel.getUser4() + "';");
			out.print("addTKB.maMonHoc = '" + monHocModel.getMaMonHoc() + "';");
			out.print("addTKB.tenMonHoc = '" + monHocModel.getTenMonHoc() + "';");
			out.print("addTKB.maGiaoVien = '" + monHocModel.getMaGiaoVien() + "';");
			out.print("addTKB.tenGiaoVien = '" + monHocModel.getTenGiaoVien() + "';");
			out.print("addTKB.ghiChu = '" + monHocModel.getGhiChu() + "';");
			if(monHocModel.getTuanBatDauLT().equals(""))
				out.print("addTKB.tuanBatDauLT = '0';");
			else
				out.print("addTKB.tuanBatDauLT = '" + monHocModel.getTuanBatDauLT() + "';");
			if(monHocModel.getTuanBatDauTH().equals(""))
				out.print("addTKB.tuanBatDauTH = '0';");
			else
				out.print("addTKB.tuanBatDauTH = '" + monHocModel.getTuanBatDauTH() + "';");
			//out.print("addTKB.tuanKetThucLT = '" + monHocModel.getTuanKetThucLT() + "';");
			//out.print("addTKB.tuanKetThucTH = '" + monHocModel.getTuanKetThucTH() + "';");
			out.print("addTKB.ngayBatDauLT = '" + monHocModel.getNgayBatDauLT().replaceAll("-","/") + "';");
			out.print("addTKB.ngayBatDauTH = '" + monHocModel.getNgayBatDauTH().replaceAll("-","/") + "';");
			out.print("addTKB.ngayKetThucLT = '" + monHocModel.getNgayKetThucLT().replaceAll("-","/") + "';");
			out.print("addTKB.ngayKetThucTH = '" + monHocModel.getNgayKetThucTH().replaceAll("-","/") + "';");
			out.print("addTKB.chuoiThuTrongTuan = '" + monHocModel.getChuoiThuTrongTuan() + "';");
			out.print("addTKB.phongLT= '" + monHocModel.getChuoiPhongLT() + "';");
			out.print("addTKB.phongTH= '" + monHocModel.getChuoiPhongTH() + "';");
			out.print("addTKB.kieuBienSoan = '" + monHocModel.getKieuBienSoan() + "';");
			out.print("addTKB.soTietLT = '" + monHocModel.getLyThuyetCTMH() + "';");
			out.print("addTKB.soTietTH = '" + monHocModel.getThucHanhCTMH() + "';");
			out.print("addTKB.maPhongLT = '" + monHocModel.getUser1() + "';");
			out.print("addTKB.maPhongTH = '" + monHocModel.getUser2() + "';");
			out.print("addTKB.soTiet1Buoi = '" + monHocModel.getSoTietHoc1Buoi() + "';");
			out.print("var chiTietTKBList = new Array();");
			for(int i=0;i<monHocModel.getChiTietTKBModelList().size();i++)
			{
				ChiTietTKBModel chiTietTKB = monHocModel.getChiTietTKBModelList().get(i);
				out.print("var chiTietTKB = new Object();");
				out.print("chiTietTKB.maChiTietTKB = '" + chiTietTKB.getMaChiTietTKB() + "';");
				out.print("chiTietTKB.buoi = '" + chiTietTKB.getBuoi() + "';");
				out.print("chiTietTKB.sTTNoiDung = '" + chiTietTKB.getsTTNoiDung() + "';");
				out.print("chiTietTKB.coHieu = '" + chiTietTKB.getCoHieu() + "';");
				out.print("chiTietTKB.hinhThucDay = '" + chiTietTKB.getHinhThucDay() + "';");
				out.print("chiTietTKB.thuTrongTuan = '" + chiTietTKB.getThuTrongTuan() + "';");
				out.print("chiTietTKB.phong = '" + chiTietTKB.getMaPhong() + "';");
				out.print("chiTietTKB.tuan = '" + chiTietTKB.getTuan() + "';");
				out.print("chiTietTKB.soThuTu = '" + chiTietTKB.getSoThuTu() + "';");
				out.print("chiTietTKB.nhom = '" + chiTietTKB.getNhom() + "';");
				out.print("chiTietTKB.tenChuong = '" + chiTietTKB.getTenChuong() + "';");
				out.print("chiTietTKB.mucTieu = '" + chiTietTKB.getMucTieu() + "';");
				out.print("chiTietTKB.tietBatDau = '" + chiTietTKB.getTietBatDau() + "';");
				//out.print("chiTietTKB.maSuDung = '" + monHocModel.getSuDungModelList().get(i).getMaSuDung() + "';");
		
				out.print("chiTietTKBList[chiTietTKBList.length] = chiTietTKB;");
			}
			out.print("addTKB.chiTietTKBList = chiTietTKBList;");
			out.print("if(navigator.appName != 'Netscape') {");
			out.print("var winOpen = window.opener;");
			/*/
			out.print("winOpen.addTKB.maMonHocTKB = addTKB.maMonHocTKB;");
			out.print("winOpen.addTKB.soNoiDung = addTKB.soNoiDung;");
			out.print("winOpen.addTKB.soCaThucHanh = addTKB.soCaThucHanh;");
			out.print("winOpen.addTKB.maMonHoc = addTKB.maMonHoc;");
			out.print("winOpen.addTKB.tenMonHoc = addTKB.tenMonHoc;");
			out.print("winOpen.addTKB.maGiaoVien = addTKB.maGiaoVien;");
			out.print("winOpen.addTKB.tenGiaoVien = addTKB.tenGiaoVien;");
			out.print("winOpen.addTKB.ghiChu = addTKB.ghiChu;");
			out.print("winOpen.addTKB.tuanBatDauLT = addTKB.tuanBatDauLT;");
			out.print("winOpen.addTKB.tuanBatDauTH = addTKB.tuanBatDauTH;");
			
			//out.print("addTKB.tuanKetThucLT = '" + monHocModel.getTuanKetThucLT() + "';");
			//out.print("addTKB.tuanKetThucTH = '" + monHocModel.getTuanKetThucTH() + "';");
			out.print("winOpen.addTKB.ngayBatDauLT = addTKB.ngayBatDauLT;");
			out.print("winOpen.addTKB.ngayBatDauTH = addTKB.ngayBatDauTH;");
			out.print("winOpen.addTKB.ngayKetThucLT = addTKB.ngayKetThucLT;");
			out.print("winOpen.addTKB.ngayKetThucTH = addTKB.ngayKetThucTH;");
			out.print("winOpen.addTKB.chuoiThuTrongTuan = addTKB.chuoiThuTrongTuan;");
			out.print("winOpen.addTKB.phongLT= addTKB.phongLT;");
			out.print("winOpen.addTKB.phongTH= addTKB.phongTH;");
			out.print("winOpen.addTKB.kieuBienSoan = addTKB.kieuBienSoan;");
			out.print("winOpen.addTKB.soTietLT = addTKB.soTietLT;");
			out.print("winOpen.addTKB.soTietTH = addTKB.soTietTH;");
			out.print("winOpen.addTKB.maPhongLT = addTKB.maPhongLT;");
			out.print("winOpen.addTKB.maPhongTH = addTKB.maPhongTH;");
			out.print("winOpen.addTKB.chiTietTKBList = new Array();");
			out.print("var arr = addTKB.chiTietTKBList;");
			out.print("winOpen.addTKB.chiTietTKBList = new Array();");
			out.print("for(var i=0;i<arr.length;i++) {");
				out.print("winOpen.addTKB.chiTietTKBList[i] = new Object();");
				out.print("winOpen.addTKB.chiTietTKBList[i].maChiTietTKB = arr[i].maChiTietTKB;");
				out.print("winOpen.addTKB.chiTietTKBList[i].buoi = arr[i].buoi;");
				out.print("winOpen.addTKB.chiTietTKBList[i].sTTNoiDung = arr[i].sTTNoiDung;");
				out.print("winOpen.addTKB.chiTietTKBList[i].coHieu = arr[i].coHieu;");
				out.print("winOpen.addTKB.chiTietTKBList[i].hinhThucDay = arr[i].hinhThucDay;");
				out.print("winOpen.addTKB.chiTietTKBList[i].thuTrongTuan = arr[i].thuTrongTuan;");
				out.print("winOpen.addTKB.chiTietTKBList[i].phong = arr[i].phong;");
				out.print("winOpen.addTKB.chiTietTKBList[i].tuan = arr[i].tuan;");
				out.print("winOpen.addTKB.chiTietTKBList[i].soThuTu = arr[i].soThuTu;");
				out.print("winOpen.addTKB.chiTietTKBList[i].nhom = arr[i].nhom;");
				out.print("winOpen.addTKB.chiTietTKBList[i].tenChuong = arr[i].tenChuong;");
			out.print("}");
			*/
			out.print("winOpen.traVe(addTKB);");
			out.print("winOpen.returnValue = winOpen.addTKB;");
			out.print("winOpen.close(); }");
			out.print("else { ");
			out.print("window.returnValue = addTKB; }");
			out.print("window.close(); ");
		} else if(request.getParameter("Error") != null)
		{
			out.print("param = 1;");
			out.print("alert('Thêm môn học thời khóa biểu không thành công');");
			out.print("window.close();");
		}
		//
	%>
	if(param == 0)
	{
		maLop = <%="'" + request.getParameter("maLop") + "'"%>;
		document.getElementById('TableHidden').insertRow(0).insertCell(0).innerHTML = "";
		document.getElementById('TableHidden').rows[0].insertCell(1).innerHTML = "";
		document.getElementById('TableButton').insertRow(0).insertCell(0).innerHTML = "";
		document.getElementById('TongHocSinh').value = obj.soHocSinh;
		arrSuDungKhongThuocTKB = obj.arrSuDungKhongThuocTKB;
		arrSuDungThuocTKB = obj.arrSuDungThuocTKB;
		createMonHoc();
		createGiaoVien();
		createTuanLe();
		createPhongBan('phongLyThuyet');
		createPhongBan('phongThucHanh');
		//taoListSuDungPhong();
	}
}
function createTuanLe()
{	
	for(var i= parseInt(obj.tuanLe[0]);i<=parseInt(obj.tuanLe[1]);i++)
	{
		var opt = new Option(i,i);
		document.getElementById('TuanLeBatDau').add(opt, undefined);
	}
}
function createMonHoc()
{
	document.getElementById('monHoc').innerHTML = null;
	var opt = new Option('Select','');
	document.getElementById('monHoc').add(opt,undefined);
	<%
		for(int i=0;i<deCuongMonHocModelList.size();i++)
		{
			out.print("var trung = false;");
			out.print("for(var i=0;i<obj.monHocList.length;i++) {");
			out.print("if(obj.monHocList[i].maMonHoc == '" + deCuongMonHocModelList.get(i).getMaMonHoc() + "') {");
			out.print("trung = true;");
			out.print("break;} }");
			out.print("if(trung == false) {");
			out.print("var opt = new Option('" + deCuongMonHocModelList.get(i).getTenMonHoc() + "','" + deCuongMonHocModelList.get(i).getMaMonHoc() + "');");
			out.print("document.getElementById('monHoc').add(opt,undefined); }");
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
function createPhongBan()
{
	document.getElementById('phongLyThuyet').innerHTML = null;
	document.getElementById('phongThucHanh').innerHTML = null;
	<%
		for(int i=0;i<phongBanModelList.size();i++) {
			out.print("if('LT' == '" + phongBanModelList.get(i).getChucNang() + "') {");
			out.print("var opt = new Option('" + phongBanModelList.get(i).getKiHieu() + "','" + phongBanModelList.get(i).getMaPhongBan() + "');");
			out.print("document.getElementById('phongLyThuyet').add(opt,undefined); }");
			out.print("if('TH' == '" + phongBanModelList.get(i).getChucNang() + "') {");
			out.print("var opt = new Option('" + phongBanModelList.get(i).getKiHieu() + "','" + phongBanModelList.get(i).getMaPhongBan() + "');");
			out.print("document.getElementById('phongThucHanh').add(opt,undefined); }");
		}
	%>
	selectPhongThucHanh();
}

function selectMonHoc() 
{
	document.getElementById('phongThucHanh').disabled = false;
	document.getElementById('SoCa').readonly = false;
	document.getElementById('phongLyThuyet').disabled = false;
	soLyThuyet = 0;
	soThucHanh = 0;
	<%
	if(deCuongMonHocModelList.size() > 0) {
		for(int i=0;i<deCuongMonHocModelList.size();i++) {
			out.print("if(document.getElementById('monHoc').value == '" + deCuongMonHocModelList.get(i).getMaMonHoc() + "') {");
			out.print("if('" + deCuongMonHocModelList.get(i).getThucHanhCTMH() + "' == '0') {");
			out.print("document.getElementById('phongThucHanh').disabled = true;");
			out.print("document.getElementById('SoCa').readonly = true; }");
			out.print("if('" + deCuongMonHocModelList.get(i).getLyThuyetCTMH() + "' == '0' || '" + deCuongMonHocModelList.get(i).getKieuBienSoan() + "' == '2')");
			out.print("document.getElementById('phongLyThuyet').disabled = true;");
			out.print("lyThuyet = '" + deCuongMonHocModelList.get(i).getLyThuyetCTMH() + "';");
			out.print("thucHanh = '" + deCuongMonHocModelList.get(i).getThucHanhCTMH() + "';");
			out.print("soTiet = '" + deCuongMonHocModelList.get(i).getSoTietHocMotBuoi() + "';");
			out.print("kieuBienSoan = '" + deCuongMonHocModelList.get(i).getKieuBienSoan() + "'; }");
		}
		out.print("createTableKieuDay();");
		out.print("document.getElementById('txtSoTiet1Buoi').value = soTiet;");
	}
	%>
	changeMonHoc();
}
function selectGiaoVien()
{
	document.getElementById('txtTenGiaoVien').value = document.getElementById('giaoVien').options[document.getElementById('giaoVien').selectedIndex].text;
}
function createTableKieuDay()// tao bang 1 de chon thu tu cac buoi hoc ly thuyet va thuc hanh, chi duoc tao ra khi kieu bien soan la 1 voi so LT va TH phai > 0
{
	var coHieu = "", day;
	kieu = new Array;
	document.getElementById('TableHidden').rows[0].cells[0].innerHTML = "";
	document.getElementById('TableHidden').rows[0].cells[1].innerHTML = "";
	STT = 0;
	var table = document.getElementById('TableKieuDay');
	if(tonTai == 1)
	{
		table.deleteRow(1);
		table.deleteRow(0);
		tonTai = 0;
	}
	if(kieuBienSoan == '0' && lyThuyet != '0' && thucHanh != '0')
	{
		tonTai = 1;	
		var tr1 = table.insertRow(0);
		var tr2 = table.insertRow(1);

		var hidden = "";
		tr1.insertCell(0).innerHTML = "STT Nội dung chương";
		tr2.insertCell(0).innerHTML = "";
	//var dong2 = "<td><input type = 'button' value = 'Uncheck All' id = 'Uncheck' onclick = 'unCheckAll();'/></td>";
	<%
	String tenChuong = "", mucTieu = "";
		for(int i=0;i<noiDungDCMHModelList.size();i++) {
			if(noiDungDCMHModelList.get(i).getTenChuong() != null)
				tenChuong = noiDungDCMHModelList.get(i).getTenChuong().replace("\r\n","<+++>");
			else
				tenChuong = "null";
			if(noiDungDCMHModelList.get(i).getMucTieu() != null)
				mucTieu = noiDungDCMHModelList.get(i).getMucTieu().replace("\r\n","<+++>");
			else
				mucTieu = "null";
			out.print("if(document.getElementById('monHoc').value == '" + noiDungDCMHModelList.get(i).getMaMonHoc() + "') {");
			out.print("STT++;");
			out.print("tr1.insertCell(STT).innerHTML = STT;");
			out.print("if('" + noiDungDCMHModelList.get(i).getCoHieu() + "' == '0') {");
			out.print("tr2.insertCell(STT).innerHTML = \"<input type = 'radio' name = 'KieuDay_\" + STT + \"' id = 'KieuDay_LT\" + STT + \"' value = 'LT' checked = 'checked'>LT</input><br/><input type = 'radio' name = 'KieuDay_\" + STT + \"' id = 'KieuDay_TH\" + STT + \"' value = 'TH'>TH</input>\";");
			out.print("soLyThuyet++;");
			out.print("kieu[STT-1] = 'LT<-->" + noiDungDCMHModelList.get(i).getCoHieu() + "<-->" + tenChuong + "<-->" + mucTieu + "'; }");
			out.print("else if('" + noiDungDCMHModelList.get(i).getCoHieu() + "' == '1') {");
			out.print("soThucHanh++;");
			out.print("kieu[STT-1] = 'TH<-->" + noiDungDCMHModelList.get(i).getCoHieu() + "<-->" + tenChuong + "<-->" + mucTieu + "'; ");
			out.print("tr2.insertCell(STT).innerHTML = \"<input type = 'radio' name = 'KieuDay_\" + STT + \"' id = 'KieuDay_LT\" + STT + \"' value = 'LT' >LT</input><br/><input type = 'radio' name = 'KieuDay_\" + STT + \"' id = 'KieuDay_TH\" + STT + \"' value = 'TH' checked = 'checked'>TH</input>\"; }");
			out.print("else if('" + noiDungDCMHModelList.get(i).getCoHieu() + "' == '4') {");
			out.print("if(thucHanh == '0') {");
			out.print("tr2.insertCell(STT).innerHTML = \"<input type = 'radio' name = 'KieuDay_\" + STT + \"' id = 'KieuDay_LT\" + STT + \"' value = 'LT' checked = 'checked' disabled = 'disabled'>LT</input><br/><input type = 'radio' name = 'KieuDay_\" + STT + \"' id = 'KieuDay_TH\" + STT + \"' value = 'TH' disabled = 'disabled'>TH</input>\";");
			out.print("soLyThuyet++;");
			out.print("kieu[STT-1] = 'LT<-->" + noiDungDCMHModelList.get(i).getCoHieu() + "<-->" + tenChuong + "<-->" + mucTieu + "'; }");
			out.print("else {");
			out.print("tr2.insertCell(STT).innerHTML = \"<input type = 'radio' name = 'KieuDay_\" + STT + \"' id = 'KieuDay_LT\" + STT + \"' value = 'LT' disabled = 'disabled'>LT</input><br/><input type = 'radio' name = 'KieuDay_\" + STT + \"' id = 'KieuDay_TH\" + STT + \"' value = 'TH' checked = 'checked' disabled = 'disabled'>TH</input>\";");
			out.print("soThucHanh++;");
			out.print("kieu[STT-1] = 'TH<-->" + noiDungDCMHModelList.get(i).getCoHieu() + "<-->" + tenChuong + "<-->" + mucTieu + "'; } }");
			out.print("hidden = \"<input type = 'hidden' value = '" + noiDungDCMHModelList.get(i).getSoBuoi() + "<-->" + noiDungDCMHModelList.get(i).getCoHieu() + "' name = 'STT_noi_dung\" + STT + \"' id = 'STT_noi_dung\" + STT + \"'/>\";");
			out.print("coHieu = \"<input type = 'hidden' value = '\" + kieu[STT-1] + \"<-->" + noiDungDCMHModelList.get(i).getSoBuoi() + "' name = 'Day\" + STT + \"' id = 'Day\" + STT + \"'/>\";");
			out.print("document.getElementById('TableHidden').rows[0].cells[1].innerHTML = document.getElementById('TableHidden').rows[0].cells[1].innerHTML + coHieu;");
			out.print("document.getElementById('TableHidden').rows[0].cells[0].innerHTML = document.getElementById('TableHidden').rows[0].cells[0].innerHTML + hidden; } ");
		
		}
	%>
	}
	else if(kieuBienSoan == '1' || kieuBienSoan == '0')
	{
		<%
		for(int i=0;i<noiDungDCMHModelList.size();i++) {
			if(noiDungDCMHModelList.get(i).getTenChuong() != null)
				tenChuong = noiDungDCMHModelList.get(i).getTenChuong().replace("\r\n","<+++>");
			else
				tenChuong = "null";
			if(noiDungDCMHModelList.get(i).getMucTieu() != null)
				mucTieu = noiDungDCMHModelList.get(i).getMucTieu().replace("\r\n","<+++>");
			else
				mucTieu = "null";
			out.print("if(document.getElementById('monHoc').value == '" + noiDungDCMHModelList.get(i).getMaMonHoc() + "') {");
			out.print("STT++;");
			out.print("if('" + noiDungDCMHModelList.get(i).getCoHieu() + "' == '0')");
			out.print("day = 'LT';");
			out.print("else if('" + noiDungDCMHModelList.get(i).getCoHieu() + "' == '1')");
			out.print("day = 'TH';");
			out.print("else if('" + noiDungDCMHModelList.get(i).getCoHieu() + "' == '4') {");
			out.print("if(thucHanh == '0'){");
			out.print("day = 'LT';}");
			out.print("else{");
			out.print("day = 'TH';}}");
			out.print("coHieu = \"<input type = 'hidden' value = '\" + day + \"<-->" + noiDungDCMHModelList.get(i).getSoBuoi() + "<-->" + noiDungDCMHModelList.get(i).getCoHieu() + "<-->" + tenChuong + "<-->" + mucTieu + "' name = 'Day\" + STT + \"' id = 'Day\" + STT + \"'/>\";");
			out.print("hidden = \"<input type = 'hidden' value = '" + noiDungDCMHModelList.get(i).getSoBuoi() + "' name = 'STT_noi_dung\" + STT + \"' id = 'STT_noi_dung\" + STT + \"'/>\";");
			out.print("document.getElementById('TableHidden').rows[0].cells[1].innerHTML = document.getElementById('TableHidden').rows[0].cells[1].innerHTML + coHieu;");
			out.print("document.getElementById('TableHidden').rows[0].cells[0].innerHTML = document.getElementById('TableHidden').rows[0].cells[0].innerHTML + hidden; } ");
		}
		%>
	} else
	{
		<%
		for(int i=0;i<noiDungDCMHModelList.size();i++) {
			if(noiDungDCMHModelList.get(i).getTenChuong() != null)
				tenChuong = noiDungDCMHModelList.get(i).getTenChuong().replace("\r\n","<+++>");
			else
				tenChuong = "null";
			if(noiDungDCMHModelList.get(i).getMucTieu() != null)
				mucTieu = noiDungDCMHModelList.get(i).getMucTieu().replace("\r\n","<+++>");
			else
				mucTieu = "null";
			out.print("if(document.getElementById('monHoc').value == '" + noiDungDCMHModelList.get(i).getMaMonHoc() + "') {");
			out.print("STT++;");
			out.print("day = 'THP';");
			out.print("coHieu = \"<input type = 'hidden' value = '\" + day + \"<-->" + noiDungDCMHModelList.get(i).getSoBuoi() + "<-->" + noiDungDCMHModelList.get(i).getCoHieu() + "<-->" + tenChuong + "<-->" + mucTieu + "' name = 'Day\" + STT + \"' id = 'Day\" + STT + \"'/>\";");
			out.print("hidden = \"<input type = 'hidden' value = '" + noiDungDCMHModelList.get(i).getSoBuoi() + "' name = 'STT_noi_dung\" + STT + \"' id = 'STT_noi_dung\" + STT + \"'/>\";");
			out.print("document.getElementById('TableHidden').rows[0].cells[1].innerHTML = document.getElementById('TableHidden').rows[0].cells[1].innerHTML + coHieu;");
			out.print("document.getElementById('TableHidden').rows[0].cells[0].innerHTML = document.getElementById('TableHidden').rows[0].cells[0].innerHTML + hidden; } ");
		}
		%>
	}
	createButton();
}
function createButton()// tao ra 2 button tao bang va xoa bang
{
	document.getElementById('TableButton').rows[0].cells[0].innerHTML = "<input type = 'button' value = 'Tạo bảng' id = 'TaoBang' onclick = 'taoBang()'/> <input type = 'button' value = 'Xóa bảng' id = 'XoaBang' onclick = 'xoaBang()' disabled = 'disabled'/>";
}
function taoBang()
{
	var kiemTraSoBuoi = true;
	if(document.getElementById('TuanLeBatDau').value != '')
	{
		if(kieuBienSoan == '0' && lyThuyet != '0' && thucHanh != '0')
		{
			kiemTraSoBuoi = kiemTraKieuDay();
			if(kiemTraSoBuoi)
			{
				for(var i=1;i<=STT;i++)
				{
					document.getElementById('KieuDay_LT' + i).disabled = true;
					document.getElementById('KieuDay_TH' + i).disabled = true;
				}
			}
		}
		if(kiemTraSoBuoi)
		{
			var nh = selectKieuDay('1');	
			if(nh == false) {
				alert("Số tuần không phù hợp!!!");
				selectKieuDay('0');
				soBuoiTongCong = 0;
			}
			else {
				document.getElementById('TaoBang').disabled = true;
				document.getElementById('SoNoiDung').disabled = true;
				document.getElementById('SoCa').readOnly = true;
				document.getElementById('SoCaLyThuyet').readOnly = true;
				document.getElementById('XoaBang').disabled = false;
				document.getElementById('TuanLeBatDau').disabled = true;
				document.getElementById('monHoc').disabled = true;
				tonTaiBang = true;
			}
		}
		else
			alert("Số buổi học lý thuyết và thực hành không đúng");	
	}
	else
	{
		alert("Hãy chọn tuần bắt đầu");
	}	
}
function xoaBang()
{
	selectKieuDay('0');
	document.getElementById('TaoBang').disabled = false;
	document.getElementById('SoNoiDung').disabled = false;
	document.getElementById('SoCa').readOnly = false;
	document.getElementById('XoaBang').disabled = true;
	document.getElementById('monHoc').disabled = false;
	document.getElementById('SoCaLyThuyet').readOnly = false;
	soBuoiTongCong = 0;
	document.getElementById('TuanLeBatDau').disabled = false;
	if(kieuBienSoan == '0' && lyThuyet != '0' && thucHanh != '0')
	{
		for(var i=1;i<=STT;i++)
		{
			document.getElementById('KieuDay_LT' + i).disabled = false;
			document.getElementById('KieuDay_TH' + i).disabled = false;
		}
	}
	tonTaiBang = false;
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
					document.getElementById('Day' + i).value = 'LT<-->' + i + '<-->' + (kieu[j].split("<-->"))[1] + '<-->' + (kieu[j].split("<-->"))[2] + "<-->" + (kieu[j].split("<-->"))[3];
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
					document.getElementById('Day' + i).value = 'TH<-->' + i + '<-->' + (kieu[j].split("<-->"))[1] + '<-->' + (kieu[j].split("<-->"))[2] + "<-->" + (kieu[j].split("<-->"))[3];
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
function selectSoNoiDung()
{
	document.getElementById('txtSoNoiDung').value = document.getElementById('SoNoiDung').value;
}
function selectKieuDay(act) // tao bang 2
{
	if(kieuBienSoan == '0' && lyThuyet != '0' && thucHanh != '0')
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
	var selectThu = "";
	var chonPhong = "";
	var hiddenTenChuong;
	var hiddenMucTieu;
	var tenChuong = "";
	var mucTieu = "";
	var selectNhomHoc = "";
	var selectBuoiHoc = "";
	var optionTietHoc = "<option value = '1'>1</option><option value = '2'>2</option><option value = '3'>3</option><option value = '4'>4</option><option value = '5'>5</option>";
	if(act == '0')
	{
		for(var i = soBuoiTongCong;i>=0;i--)
			table.deleteRow(i);
	}
	else
	{
		if(document.getElementById('monHoc').value != '')
		{
			table.insertRow(0);
			table.rows[0].insertCell(0).innerHTML = "Số Tuần";
			table.rows[0].insertCell(1).innerHTML = "Số Buổi";
			table.rows[0].insertCell(2).innerHTML = "Buổi";
			table.rows[0].insertCell(3).innerHTML = "Tiết bắt đầu";
			table.rows[0].insertCell(4).innerHTML = "Kiểu dạy";
			table.rows[0].insertCell(5).innerHTML = "Nhóm";
			table.rows[0].insertCell(6).innerHTML = "Thứ";
			table.rows[0].insertCell(7).innerHTML = "Phòng";
			table.rows[0].insertCell(8).innerHTML = "Tình trạng";
		} 
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
			{
				for(var n=1;n<=parseInt(document.getElementById('SoCaLyThuyet').value);n++)
					soBuoiMoiTuan++;
			} else {
				for(var n=1;n<=parseInt(document.getElementById('SoCa').value);n++)
					soBuoiMoiTuan++;
			}
			so = -1; 
			if(kieuBienSoan == '1')
			{
				if(i%((parseInt(thucHanh) + parseInt(lyThuyet))/parseInt(lyThuyet)) == 0)
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
				selectThu = "";
				selectNhomHoc = "";
				selectBuoiHoc = "";
				soTuan++;
				if(soTuan == 1)
				{
					selectThu = "onchange = 'selectThuTrongTuan()'";
					selectNhomHoc = "onchange = 'selectNhom()'";
					selectBuoiHoc = "onclick = 'selectBuoi()'";
				}
				for(var j=x;j<=i;j++)
				{
					dem = 1;
					soNoiDung = document.getElementById('STT_noi_dung' + j).value;
					tr = table.insertRow(soBuoiTongCong + 1);
					if(j == x)
					{
						tr.insertCell(0).innerHTML = "<input type = 'text' value = '" + (soTuan + tuanBatDau - 1) + "' onblur = 'doiTuanHoc(" + (soBuoiTongCong + 1) + ", " + soBuoiMoiTuan + ", " + (soTuan + tuanBatDau - 1) + ")' id = 'txtTuanHoc" + (soTuan + tuanBatDau - 1) + "' size = '3' onclick = 'getTuanHoc(" + (soTuan + tuanBatDau - 1) + ")'/>";
						table.rows[soBuoiTongCong + 1].cells[0].rowSpan = soBuoiMoiTuan;
						dem = 0;
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
						kieuDay = document.getElementById('Day' + j).value.split("<-->")[0];
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
						tr.insertCell(1-dem).innerHTML = soBuoiTongCong;
						tr.insertCell(2-dem).innerHTML = "<input type = 'radio' name = 'Buoi" + soBuoiTongCong + "' id = 'BuoiSang" + soBuoiTongCong + "' value = 'Sáng-" + soNoiDung + "-" + ch + "' checked='checked' " + selectBuoiHoc + "/>Sáng<input type = 'radio' name = 'Buoi" + soBuoiTongCong + "' id = 'BuoiChieu" + soBuoiTongCong + "' value = 'Chiều-" + soNoiDung + "-" + ch + "' " + selectBuoiHoc + "/>Chiều";
						tr.insertCell(3-dem).innerHTML = "<select name = 'cboTietBatDau" +soBuoiTongCong + "' id = 'cboTietBatDau" + soBuoiTongCong + "' onchange = 'selectTietBatDau(" + soBuoiTongCong + ")' onclick = 'getSoTiet(" + soBuoiTongCong + ")'>" + optionTietHoc + "</select>";
						tr.insertCell(4-dem).innerHTML = "<input type = 'text' name = 'HinhThucDay" + soBuoiTongCong + "' value = '" + kieuDay + "' id = 'HinhThucDay" + soBuoiTongCong + "' readonly = 'readonly' size = '3'/>";
						tr.insertCell(5-dem).innerHTML = "<select name = 'Nhom" + soBuoiTongCong + "' id = 'Nhom" + soBuoiTongCong + "' " + selectNhomHoc + ">" + option + "</select>";
						tr.insertCell(6-dem).innerHTML = "<select name = 'Thu" + soBuoiTongCong + "' id = 'Thu" + soBuoiTongCong + "' " + selectThu + "><option value = '1'>Thứ hai</option><option value = '2'>Thứ ba</option><option value = '3'>Thứ tư</option><option value = '4'>Thứ năm</option><option value = '5'>Thứ sáu</option><option value = '6'>Thứ bảy</option><option value = '7'>Chủ nhật</option></select>";
						tr.insertCell(7-dem).innerHTML = "<select id = 'Phong" + soBuoiTongCong + "' name = 'Phong" + soBuoiTongCong + "'>" + phongBan + "</select>";
						tr.insertCell(8-dem).innerHTML = "&nbsp;";
						tr.cells[8-dem].id = "tdTinhTrang" + soBuoiTongCong;
						//tr.cells[3-dem].id = "tdTietBatDau" + soBuoiTongCong;
						//tr.cells[7-dem].id = "tdPhong" + soBuoiTongCong;
						//hiddenBuoi = "<input type = 'hidden' name = 'hiddenBuoi" + soBuoiTongCong + "' value = '" + soBuoiTongCong + "'/>";
						hiddenTuan = "<input type = 'hidden' name = 'hiddenTuan" + soBuoiTongCong   + "' value = '" + (soTuan + tuanBatDau - 1) + "' id = 'hiddenTuan" + soBuoiTongCong + "'/>";
						hiddenTenChuong = "<input type = 'hidden' name = 'hiddenTenChuong" + soBuoiTongCong   + "' value = '" + tenChuong + "' id = 'hiddenTenChuong" + soBuoiTongCong + "'/>";
						hiddenMucTieu = "<input type = 'hidden' name = 'hiddenMucTieu" + soBuoiTongCong   + "' value = '" + mucTieu + "' id = 'hiddenMucTieu" + soBuoiTongCong + "'/>";
						table.rows[soBuoiTongCong].cells[0].innerHTML = table.rows[soBuoiTongCong].cells[0].innerHTML + hiddenTuan + hiddenTenChuong + hiddenMucTieu;	
						
						document.getElementById('Phong' + soBuoiTongCong).value = chonPhong;	
					}
				}
				x = i + 1;
				soBuoiMoiTuan = 0;
			}
		}
		if((soTuan + tuanBatDau - 1) > parseInt(document.getElementById('TuanLeBatDau').options[document.getElementById('TuanLeBatDau').options.length-1].value))
			return false;
	}
	return true;
}
function changeMonHoc()
{
	document.getElementById('txtMonHoc').value = document.getElementById('monHoc').value;
	document.getElementById('txtTenMonHoc').value = document.getElementById('monHoc').options[document.getElementById('monHoc').selectedIndex].text;
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
				var tuanSau = document.getElementById('TuanLeBatDau').options[document.getElementById('TuanLeBatDau').options.length - 1].value;
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
function getTuanHoc(tuanMacDinh)
{
	checkTuanHoc = document.getElementById('txtTuanHoc' + tuanMacDinh).value;
}
function doiTuanHoc(buoiBatDau, soBuoi, tuanMacDinh)
{
	if(validateTuan(tuanMacDinh) == true)
	{
		for(var i=buoiBatDau; i< buoiBatDau + soBuoi; i++)
		{
			document.getElementById('hiddenTuan' + i).value = document.getElementById('txtTuanHoc' + tuanMacDinh).value;
		}
		document.getElementById('txtTuanHoc' + tuanMacDinh).style.background = "red";
	}
	else
	{
		document.getElementById('txtTuanHoc' + tuanMacDinh).value = checkTuanHoc;
		document.getElementById('txtTuanHoc' + tuanMacDinh).style.background = "red";
	}
}

function changeTuanBatDau()
{
	tuanBatDau = parseInt(document.getElementById('TuanLeBatDau').value);
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
		if(document.getElementById('HinhThucDay' + i).value == 'TH' || document.getElementById('HinhThucDay' + i).value == 'THP')
			document.getElementById('Phong' + i).value = document.getElementById('phongThucHanh').value;
	}
}
function selectThuTrongTuan() // chon thu trong dong dau tien thi thu o cac dong sau se chay theo
{
	var thuTuTuan = tuanBatDau;
	var demSoNgay = 1;
	var soNgayTuanDau = 0;
	for(var i=1;i<=soBuoiTongCong;i++)
	{
		if(parseInt(document.getElementById('hiddenTuan' + i).value) != thuTuTuan)
		{
			thuTuTuan = parseInt(document.getElementById('hiddenTuan' + i).value);
			demSoNgay = 1;
		}
		if(thuTuTuan > tuanBatDau)
		{
			if(soNgayTuanDau - demSoNgay >= 0)
			{
				document.getElementById('Thu' + i).value = document.getElementById('Thu' + demSoNgay).value;
				demSoNgay++;
			}
		}
		else
			soNgayTuanDau++;
	}
}
function selectNhom() // chon nhom trong dong dau tien thi nhom o cac dong sau se chay theo
{
	var thuTuTuan = tuanBatDau;
	var demSoNgay = 1;
	var soNgayTuanDau = 0;
	for(var i=1;i<=soBuoiTongCong;i++)
	{
		if(parseInt(document.getElementById('hiddenTuan' + i).value) != thuTuTuan)
		{
			thuTuTuan = parseInt(document.getElementById('hiddenTuan' + i).value);
			demSoNgay = 1;
		}
		if(thuTuTuan > tuanBatDau)
		{
			if(soNgayTuanDau - demSoNgay >= 0)
			{
				document.getElementById('Nhom' + i).value = document.getElementById('Nhom' + demSoNgay).value;
				demSoNgay++;
			}
		}
		else
			soNgayTuanDau++;
	}
}
function selectTietBatDau(x) // chon tietBatDau trong dong dau tien thi tietBatDau o cac dong sau se chay theo
{
	if(parseInt(document.getElementById('cboTietBatDau' + x).value) + parseInt(document.getElementById('txtSoTiet1Buoi').value) - 1 > 5)
	{
		alert("Tiết bắt đầu không phù hợp!!!");
		document.getElementById('cboTietBatDau' + x).value = tietBatDau;
	} 
	else {
		
			var thuTuTuan = tuanBatDau;
			var demSoNgay = 1;
			var soNgayTuanDau = 0;
			for(var i=1;i<=soBuoiTongCong;i++)
			{
				if(parseInt(document.getElementById('hiddenTuan' + i).value) != thuTuTuan)
				{
					thuTuTuan = parseInt(document.getElementById('hiddenTuan' + i).value);
					demSoNgay = 1;
				}
				if(thuTuTuan > tuanBatDau)
				{
					if(soNgayTuanDau - demSoNgay >= 0)
					{
						document.getElementById('cboTietBatDau' + i).value = document.getElementById('cboTietBatDau' + demSoNgay).value;
						demSoNgay++;
					}
				}
				else
					soNgayTuanDau++;
			}
		
	}
}
function getSoTiet(x)
{
	tietBatDau = document.getElementById('cboTietBatDau' + x).value;
}
function selectBuoi() // chon nhom trong dong dau tien thi nhom o cac dong sau se chay theo
{
	var thuTuTuan = tuanBatDau;
	var demSoNgay = 1;
	var soNgayTuanDau = 0;
	for(var i=1;i<=soBuoiTongCong;i++)
	{
		if(parseInt(document.getElementById('hiddenTuan' + i).value) != thuTuTuan)
		{
			thuTuTuan = parseInt(document.getElementById('hiddenTuan' + i).value);
			demSoNgay = 1;
		}
		if(thuTuTuan > tuanBatDau)
		{
			if(soNgayTuanDau - demSoNgay >= 0)
			{
				document.getElementById('BuoiSang' + i).checked = document.getElementById('BuoiSang' + demSoNgay).checked;
				document.getElementById('BuoiChieu' + i).checked = document.getElementById('BuoiChieu' + demSoNgay).checked;
				demSoNgay++;
			}
		}
		else
			soNgayTuanDau++;
	}
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
	else if(tonTaiBang == false)
	{
		alert("Hãy tạo bảng trước");
		check = false;
	}
	else if(kiemTraTrungGioHoc() == false)
	{
		alert("Giờ học không hợp lệ");
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
		if(confirm("Bạn có chắc muốn thêm môn học này không ???"))
			taoChuoiThuTrongTuan();
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
function selectPhongThucHanh()
{
	<%
		for(int i=0;i<phongBanModelList.size();i++) {
			out.print("if(document.getElementById('phongThucHanh').value == '" + phongBanModelList.get(i).getMaPhongBan() + "')");
			out.print("document.getElementById('SucChua').value = '" + phongBanModelList.get(i).getSucChua() + "';");
		}
	%>
}
function taoChuoiThuTrongTuan() // tao 1 chuoi thu trong tuan va submit form
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
	document.getElementById('KieuBienSoan').value = kieuBienSoan;
	document.getElementById('SoTietLyThuyet').value = lyThuyet;
	document.getElementById('SoTietThucHanh').value = thucHanh;
	
	document.forms["AddThoiKhoaBieu"].submit();
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
	addTKB.soCaLyThuyet = tempObject.soCaLyThuyet;
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
	<form action = "<%=request.getContextPath()%>/thoiKhoaBieuController?themChiTiet=yes" method="post" name = "AddThoiKhoaBieu" onsubmit="window.self">
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
					<input type = "hidden" id = "txtTenMonHoc" name = "txtTenMonHoc"/>
					<select id="monHoc" onchange="selectMonHoc();" name="cboMonHoc" >
						<option value="">select</option>
					</select></td>
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
					<input type = "hidden" id = "txtSoNoiDung" value = "1" name = "txtSoNoiDung"/> 
					<select id="SoNoiDung" onchange="selectSoNoiDung();">
						<c:forEach var = "SoNoiDung" begin = "1" end="7">
							<option value="${SoNoiDung}">${SoNoiDung}</option>
						</c:forEach>
					</select></td>
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
				<td><select id="phongThucHanh" onchange="changePhongThucHanh();"  name = "cboPhongTH">
					<option></option>
				</select></td>
				<td>Sức chứa :</td>
				<td><input type="text" readonly="readonly" id="SucChua"/></td>
			</tr>
			<tr>
				<td>Số ca lý thuyết :</td>
				<td><input type="text" id = "SoCaLyThuyet" value="1" name="SoCaLyThuyet"/></td>
			</tr>
			<tr>
				<td>Số ca thực hành :</td>
				<td><input type="text" id = "SoCa" value="1" name="SoCa"/></td>
			</tr>
			<tr>
				<td>Tuần bắt đầu :</td>
				<td>
					<select id = "TuanLeBatDau" name="cboTuanLeBatDau" onchange="changeTuanBatDau();">
					<option value="">Select</option>
					</select>
				</td>
			</tr>
		</table>
		<table id = "TableHidden"></table>
		<table border="1" id = "TableKieuDay"></table>
		<table id = "TableButton"></table>
		<table border="1" id = "TableBuoiHoc"></table>
		<table>
			<tr><td>Ghi chú
					<textarea rows="5" cols="50" name = "areaGhiChu" id = "GhiChu"></textarea>
			</td></tr>
			<tr align="center"><td>	
				<input type="button" value = "Thêm" onclick="taoMonHoc();"/>
				<input type="button" value = "Cancel" onclick="closeWindow();"/>
			</td></tr>	
		</table>
		<input type="hidden" name = "txtSoBuoi" id = "txtSoBuoi"/>
		<input type="hidden" name = "action" value = "Add"/>
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
		<input type="hidden" name = "MangChiTietLength" id = "MangChiTietLength" value="0"/>
		<input type="hidden" name = "ChuoiMaChiTietTKB" id = "ChuoiMaChiTietTKB" value=""/>
		<input type="hidden" name = "ChuoiMaSuDung" id = "ChuoiMaSuDung" value=""/>
	</form>
</body>
</html>