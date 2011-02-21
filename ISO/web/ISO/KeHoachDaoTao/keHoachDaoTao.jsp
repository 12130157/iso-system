<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.model.NguoiThucHienModel"%>
<%@page import="org.zefer.html.doc.n"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TuanLeModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<title>Thêm Kế Hoach Đào Tạo</title>
<script language="JavaScript" type="text/javascript">
var listTuan = new Array();
var duongDan = "";
var arrNam1 = new Array();
var arrNam2 = new Array();
var value1, value2;
var arrTuanLe = new Array();
var valueNamHoc, valueTuanLe;
var tinhTrang;
<%
	int dieuKienPHC = 0; 
	if(request.getParameter("Them") != null)
		Constant.NUM_ROWS = 1;
	KeHoachDaoTaoModel keHoachDaoTaoModel = new KeHoachDaoTaoModel();
	if(request.getParameter("ID") != null)
		keHoachDaoTaoModel = KeHoachDaoTaoDao.getAllKeHoachOfTableByID(request.getParameter("ID"));
	if(request.getAttribute("keHoachDaoTao") != null)
	{
		keHoachDaoTaoModel = (KeHoachDaoTaoModel) request.getAttribute("keHoachDaoTao");
		out.print("duongDan = 'ISO/KeHoachDaoTao/';");
	}
	if(((String) session.getAttribute("maBoPhan")).equals(Constant.BO_PHAN_PHC) && keHoachDaoTaoModel.getTinhTrang().equals(Constant.TINHTRANG_BO_SUNG))
		dieuKienPHC = 1;
	//	ArrayList<NamHocModel> namHocList = NamHocDAO.getAllNamHoc();
	//	ArrayList<TuanLeModel> tuanLeList = TuanLeDAO.getAllTuanLe();
	out.print("tinhTrang = " + keHoachDaoTaoModel.getTinhTrang() + ";");
%>
	function pageLoad()
	{
		document.getElementById('CountTableRow').value = <%=Constant.NUM_ROWS * 2 + 1%>;
		for(var i=1;i<=<%=Constant.NUM_ROWS%>;i++)
		{
			document.getElementById('CountCongTacKhoaA' + i).value = 0;
			document.getElementById('CountCongTacKhoaB' + i).value = 0;
		}
		<%
		ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietList = new ArrayList<NoiDungChiTietKHDTModel>();
		ArrayList<BoPhanThucHienKHDTModel> boPhanThucHienList = new ArrayList<BoPhanThucHienKHDTModel>();
		ArrayList<NguoiThucHienModel> nguoiThucHienList = new ArrayList<NguoiThucHienModel>();
		if(keHoachDaoTaoModel.getChiTietKHDTList() != null) {
			ArrayList<ChiTietKHDTModel> chiTietKHDTList = keHoachDaoTaoModel.getChiTietKHDTList(); 
			for(int i=0;i<chiTietKHDTList.size();i++) {
				out.print("listTuan[" + i + "] = new Object();");
				if(chiTietKHDTList.get(i).getNoiDungChiTietKHDTModelList() != null) {
					out.print("listTuan[" + i + "].listA = new Array();");
					out.print("listTuan[" + i + "].listB = new Array();");
					out.print("var countA = 0, countB = 0;");
					out.print("var arrA = new Array();");
					out.print("var arrB = new Array();");
					noiDungChiTietList = chiTietKHDTList.get(i).getNoiDungChiTietKHDTModelList();
					for(int j=0;j<noiDungChiTietList.size();j++) {
						if(noiDungChiTietList.get(j).getStatus().equals("1")) {
							out.print("var obj = new Object();");
							out.print("var objCongTac = new Object();");
							out.print("objCongTac.boSung = " + noiDungChiTietList.get(j).getBoSung() + ";");
							out.print("objCongTac.maCongTac = " + noiDungChiTietList.get(j).getMaCongTac() + ";");
							out.print("objCongTac.noiDung = '" + noiDungChiTietList.get(j).getNoiDungCongTac() + "';");
							out.print("objCongTac.thoiGian = '" + noiDungChiTietList.get(j).getThoiGian() + "';");
							if(noiDungChiTietList.get(j).getKhoa().equals("1")) {
								out.print("var objA = new Object();");
								out.print("objA.congTac = objCongTac;");
								out.print("themCongTac(" + (i + 1) + ", 'A', 'B', objCongTac);");
								if(noiDungChiTietList.get(j).getBoPhanThucHienKHDTModelList() != null) {
									boPhanThucHienList = noiDungChiTietList.get(j).getBoPhanThucHienKHDTModelList();
									out.print("var arrThucHien = new Array();");
									out.print("var countBoPhan = 0;");
										for(int k=0;k<boPhanThucHienList.size();k++) {
											if(boPhanThucHienList.get(k).getStatus().equals("1")) {
												out.print("var objThucHien = new Object();");
												out.print("var objBoPhan = new Object();");
												out.print("objBoPhan.maBoPhan = '" + boPhanThucHienList.get(k).getMaKhoa() + "';");
												out.print("objBoPhan.boPhan = '" + boPhanThucHienList.get(k).getTenBoPhan() + "';");
												out.print("var arrNguoiThucHien = new Array();");
												if(boPhanThucHienList.get(k).getNguoiThucHienModelList() != null) {
													nguoiThucHienList = boPhanThucHienList.get(k).getNguoiThucHienModelList();
													out.print("var countNguoi = 0;");
													for(int h =0;h<nguoiThucHienList.size();h++) {
														if(nguoiThucHienList.get(h).getStatus().equals("1")) {
															out.print("var objNguoiThucHien = new Object();");
															out.print("objNguoiThucHien.maNguoiThucHien = " + nguoiThucHienList.get(h).getMaThanhVien() + ";");
															out.print("objNguoiThucHien.nguoiThucHien = '" + nguoiThucHienList.get(h).getTenThanhVien() + "';");
															out.print("arrNguoiThucHien[countNguoi] = objNguoiThucHien;");
															out.print("countNguoi++;");
														}
													}
												}
												out.print("objThucHien.boPhan = objBoPhan;");
												out.print("objThucHien.thucHien = arrNguoiThucHien;");
												out.print("arrThucHien[countBoPhan] = objThucHien;");
												out.print("countBoPhan++;");
												
											}
										
										}
										out.print("themNguoi(objCongTac.boSung," + (i + 1) + ", 'A', 'B', objCongTac.maCongTac, arrThucHien);");
										out.print("objA.thucHien = arrThucHien;");
								}
								out.print("arrA[countA] = objA;");
								out.print("countA++;");
							} else {
								out.print("var objB = new Object();");
								out.print("objB.congTac = objCongTac;");
								out.print("themCongTac(" + (i + 1) + ", 'B', 'A', objCongTac);");
								if(noiDungChiTietList.get(j).getBoPhanThucHienKHDTModelList() != null) {
									boPhanThucHienList = noiDungChiTietList.get(j).getBoPhanThucHienKHDTModelList();
									out.print("var arrThucHien = new Array();");
									out.print("var countBoPhan = 0;");
									for(int k=0;k<boPhanThucHienList.size();k++) {
										if(boPhanThucHienList.get(k).getStatus().equals("1")) {
											out.print("var objThucHien = new Object();");
											out.print("var objBoPhan = new Object();");
											out.print("objBoPhan.maBoPhan = '" + boPhanThucHienList.get(k).getMaKhoa() + "';");
											out.print("objBoPhan.boPhan = '" + boPhanThucHienList.get(k).getTenBoPhan() + "';");
											out.print("var arrNguoiThucHien = new Array();");
											if(boPhanThucHienList.get(k).getNguoiThucHienModelList() != null) {
												nguoiThucHienList = boPhanThucHienList.get(k).getNguoiThucHienModelList();
												out.print("var countNguoi = 0;");
												for(int h =0;h<nguoiThucHienList.size();h++) {
													if(nguoiThucHienList.get(h).getStatus().equals("1")) {
														out.print("var objNguoiThucHien = new Object();");
														out.print("objNguoiThucHien.maNguoiThucHien = " + nguoiThucHienList.get(h).getMaThanhVien() + ";");
														out.print("objNguoiThucHien.nguoiThucHien = '" + nguoiThucHienList.get(h).getTenThanhVien() + "';");
														out.print("arrNguoiThucHien[countNguoi] = objNguoiThucHien;");
														out.print("countNguoi++;");
													}
												}
											}
											out.print("objThucHien.boPhan = objBoPhan;");
											out.print("objThucHien.thucHien = arrNguoiThucHien;");
											out.print("arrThucHien[countBoPhan] = objThucHien;");
											out.print("countBoPhan++;");
											
										}
									}		
									out.print("themNguoi(objCongTac.boSung," + (i + 1) + ", 'B', 'A', objCongTac.maCongTac, arrThucHien);");
									out.print("objB.thucHien = arrThucHien;");
								}
								out.print("arrB[countB] = objB;");
								out.print("countB++;");
							}
						}
					}
					out.print("listTuan[" + i + "].listA = arrA;");
					out.print("listTuan[" + i + "].listB = arrB;");
				}
				else
					out.print("listTuan[" + i + "] = null;");
			}
		}
		%>
	}
	function setTuan()
	{
		var maNamHoc;
		var kiTuTuan = "";
		var max = 0;
		
		<%if(keHoachDaoTaoModel.getTinhTrang() != null) {
			if(keHoachDaoTaoModel.getMaKeHoachDaoTao() == null) {
				out.print("document.getElementById('td1').innerHTML = 1;");
				out.print("document.getElementById('txtKiTuTuan1').value = 1;");
			}
			else {
				if(keHoachDaoTaoModel.getChiTietKHDTList().size() == 0) {
					ArrayList<NamHocModel> namHocList = NamHocDAO.get2NamHocByNamBatDau(keHoachDaoTaoModel.getNam1(), keHoachDaoTaoModel.getNam3());
					ArrayList<TuanLeModel> tuanLeList = TuanLeDAO.getTuanLeBy2NamBatDau(keHoachDaoTaoModel.getNam1(), keHoachDaoTaoModel.getNam3());
						out.print("document.getElementById('td1').innerHTML = 1;");
						out.print("document.getElementById('txtKiTuTuan1').value = 1;");
						for(int i=0;i<namHocList.size();i++) {
							out.print("if(document.getElementById('cboNam1').value == '" + namHocList.get(i).getNamBatDau() + "')");
							out.print("document.getElementById('txtNamHoc1').value = " + namHocList.get(i).getMaNamHoc() + ";");
						}
						for(int i=0;i<tuanLeList.size();i++) {
							out.print("if(document.getElementById('txtNamHoc1').value == '" + tuanLeList.get(i).getMaNamHoc() + "') {");
							out.print("if(document.getElementById('txtKiTuTuan1').value == '" + tuanLeList.get(i).getSoThuTu() + "'){");
							out.print("document.getElementById('txtTuNgay1').value = '" + tuanLeList.get(i).getTuNgay() + "';");
							out.print("document.getElementById('txtDenNgay1').value = '" + tuanLeList.get(i).getDenNgay() + "';");
							out.print("document.getElementById('txtTuanLe1').value = " + tuanLeList.get(i).getMaTuanLe() + "; }}");
						}
					
				}
			}
		}
		%>
	}
	//Javascript validation functions		
	function isEmpty() {
    	return true;
	}

	function confirmSending() {
		if (confirm('Bạn có chắc muốn gửi kế hoạch không ?')) {
			document.KHDT.GuiHieuTruong.value = 'GuiHieuTruong';
			submitForm(2);
		}
		//return false;
	}
	
	function changeComboboxValue() {
		document.getElementById('txtNam2').value = parseInt(document.getElementById('cboNam1').value) + 1;
		document.getElementById('txtNam3').value = parseInt(document.getElementById('cboNam1').value) - 1 ;
		document.getElementById('txtNam4').value = parseInt(document.getElementById('cboNam1').value);
		document.getElementById('txtNam5').value = document.getElementById('cboNam1').value;
		document.getElementById('txtNam6').value = parseInt(document.getElementById('cboNam1').value) + 1;
		if(tinhTrang != null)
			setTuan();
		pageLoad();		
	}
	
	function getNgay(iterator)
	{
		var arr = new Array();
		if(document.getElementById('cboNamHoc').selectedIndex == 0)
			arr = arrNam1;	
		else
			arr = arrNam2;
		for(var i=0;i<arr.length;i++)
		{
			var obj = new Object();
			obj = arr[i];
			if(obj.maTuanLe == document.getElementById('cboTuanLe').value)
			{
				document.getElementById('txtTuNgay').value = obj.tuNgay;
				document.getElementById('txtDenNgay').value = obj.denNgay;
			}
		}
	}
	function selectCheckboxAll() {		
		if (document.KHDT.chkAllRow.checked == true) {
			<%
			for (Integer i = 1; i <= Constant.NUM_ROWS; i++) {
				out.print("document.KHDT.chkRow" + i.toString() +".checked = true;\n");
			}
			%>
		} else {
			<%
			for (Integer i = 1; i <= Constant.NUM_ROWS; i++) {
				out.print("document.KHDT.chkRow" + i.toString() +".checked = false;\n");
			}
			%>
		}	 	
	}
	function selectCheckboxRow() {		
		if (document.KHDT.chkAllRow.checked == true)
			document.KHDT.chkAllRow.checked = false;		
	}	

	function confirmDeleteRow() {		
		document.KHDT.XuLyDong.value = 'XoaDong';			
		<%		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter printWriter = response.getWriter();
		out.print("var msg='';\n");	 	
	 	for(Integer i = 1; i<= Constant.NUM_ROWS; i++) {
	 		out.write("if(document.KHDT.chkRow" + i.toString() +".checked == true){\n");
	 		out.write("msg += ' " + i.toString() + " - '; } \n");
	 	}
	 	out.write("if(msg == '') {\n");
	 	out.write("alert('Hãy chọn dòng muốn xóa');\n");
	 	out.write("} else {\n");
	 	out.write("if (confirm('Bạn có chắc muốn xóa dòng ' + msg + ' không ?')) \n submitForm(); \n");
	 	out.write("}\n");	 	
		%>			 			 		
	}
	function submitForm(x)
	{	
		var str = "";
		if((document.getElementById('action').value == 'CapNhat' && x == 1) || x == 2)
			document.getElementById('txtHidden').value = "1";
		var td = document.getElementById('td');
		for(var i=0;i<listTuan.length;i++)
		{
			if(listTuan[i] != null) {
				var strCongTac = "";
				var arrA = listTuan[i].listA;
				for(var j=0;j<arrA.length;j++)
				{
					var objCongTac = arrA[j].congTac;
					if(j < arrA.length - 1)
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "</>" + objCongTac.boSung + "</>" + objCongTac.thoiGian + "<->";
					else
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "</>" + objCongTac.boSung + "</>" + objCongTac.thoiGian;
					var arA = arrA[j].thucHien;
					if(arA != null)
					{
						var strBoPhan = "";
						if(arA.length > 0) {
							
							for(var k =0;k<arA.length;k++)
							{
								var objBoPhan = arA[k].boPhan;
								if(k < arA.length - 1)
									strBoPhan += objBoPhan.maBoPhan + "</>" + objBoPhan.boPhan + "<->";
								else
									strBoPhan += objBoPhan.maBoPhan + "</>" + objBoPhan.boPhan;
								var aA = arA[k].thucHien;
								var strNguoiThucHien = "";
								for(var m =0;m<aA.length;m++)
								{
									if(m < aA.length - 1)
										strNguoiThucHien += aA[m].maNguoiThucHien + "</>" + aA[m].nguoiThucHien + "<->";
									else
										strNguoiThucHien += aA[m].maNguoiThucHien + "</>" + aA[m].nguoiThucHien;
								}
								strNguoiThucHien = "<input type = 'hidden' value = '" + strNguoiThucHien + "' name = 'NguoiThucHienA" + (i+1) + "_" + (j+1) + "_" + (k+1) + "'/>";
								//td.innerHTML += strNguoiThucHien;
								str += strNguoiThucHien;
								//alert(strNguoiThucHien);
							} 
							
						}
						strBoPhan = "<input type = 'hidden' value = '" + strBoPhan + "' name = 'BoPhanThucHienA" + (i+1) + "_" + (j+1) + "'/>";
						//td.innerHTML += strBoPhan;
						str += strBoPhan;
						//alert(strBoPhan);
					}
				}	
				if(strCongTac != "")
				{
					strCongTac = "<input type = 'hidden' value = '" + strCongTac + "' name = 'CongTacKhoaA" + (i+1) + "'/>";
					//td.innerHTML += strCongTac;
					str += strCongTac;
					//alert(strCongTac);
				}
				var strCongTac = "";
				var arrB = listTuan[i].listB;
				for(var j=0;j<arrB.length;j++)
				{
					var objCongTac = arrB[j].congTac;
					if(j < arrB.length - 1)
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "</>" + objCongTac.boSung + "</>" + objCongTac.thoiGian + "<->";
					else
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "</>" + objCongTac.boSung + "</>" + objCongTac.thoiGian;
					var arB = arrB[j].thucHien;
					if(arB != null) {
						var strBoPhan = "";
						if(arB.length > 0)
						{
							
							for(var k =0;k<arB.length;k++)
							{
								var objBoPhan = arB[k].boPhan;
								if(k < arB.length - 1)
									strBoPhan += objBoPhan.maBoPhan + "</>" + objBoPhan.boPhan + "<->";
								else
									strBoPhan += objBoPhan.maBoPhan + "</>" + objBoPhan.boPhan;
								var aB = arB[k].thucHien;
								var strNguoiThucHien = "";
								for(var m =0;m<aB.length;m++)
								{
									if(m < aB.length - 1)
										strNguoiThucHien += aB[m].maNguoiThucHien + "</>" + aB[m].nguoiThucHien + "<->";
									else
										strNguoiThucHien += aB[m].maNguoiThucHien + "</>" + aB[m].nguoiThucHien;
								}
								strNguoiThucHien = "<input type = 'hidden' value = '" + strNguoiThucHien + "' name = 'NguoiThucHienB" + (i+1) + "_" + (j+1) + "_" + (k+1) + "'/>";
								//td.innerHTML += strNguoiThucHien;
								str += strNguoiThucHien;
							} 
							
						}
						strBoPhan = "<input type = 'hidden' value = '" + strBoPhan + "' name = 'BoPhanThucHienB" + (i+1) + "_" + (j+1) + "'/>";
						//td.innerHTML += strBoPhan;
						str += strBoPhan;
						//alert(strBoPhan);
					}
				}	
				if(strCongTac != "")
				{
					strCongTac = "<input type = 'hidden' value = '" + strCongTac + "' name = 'CongTacKhoaB" + (i+1) + "'/>";
					//td.innerHTML += strCongTac;
					str += strCongTac;
					//alert(strCongTac);
				}
			}
		}
		td.innerHTML = str;
		document.forms["KHDT"].submit();
	}
	function submitFormSoSanh(){
		if(document.getElementById('SoSanh').value == '')
		{
			alert("Hãy chọn kế hoạch muốn so sánh");
			return;
		}
		document.forms["SoSanhKHDT"].submit();
	}
	function addRowTren(){		
		document.KHDT.XuLyDong.value = 'ThemDongTren';
		submitForm(0);
	}
	function addRowDuoi(){		
		document.KHDT.XuLyDong.value = 'ThemDongDuoi';
		submitForm(0);
	}
	function copy()
	{
		document.KHDT.Copy.value = 'Copy';
		submitForm(0);
	}
	function boSung()
	{
		document.KHDT.BoSung.value = 'BoSung';
		submitForm(0);
	}
	function khongBoSung()
	{
		document.KHDT.BoSung.value = 'KhongBoSung';
		submitForm(0);
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
			value = window.showModalDialog(duongDan + "LyDoRejectBox.jsp","Arg1","dialogHeight: 150px; dialogWidth: 150px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
			if(value != false && value != null)
			{
				act = 'Reject';
				document.getElementById('Duyet').value = act;
				document.getElementById('LyDoReject').value = value;
			}
			else
				return;
		}
		if(confirm("Bạn có chắc muốn " + act + " kế hoạch này không?"))
			document.forms["Duyet1KHDT"].submit();	
	}
	function openPopupCongTac(iterator, khoaChinh, khoaPhu)
	{
		var arr = new Array();
		var index = 0;
		if(listTuan[iterator - 1] == null)
		{
			listTuan[iterator - 1] = new Object();
			listTuan[iterator - 1].listA = new Array();
			listTuan[iterator - 1].listB = new Array();
		}
		if(khoaChinh == 'A')
		{
			if(listTuan[iterator-1].listA != null)
			{
				for(var i=0;i<listTuan[iterator-1].listA.length;i++)
					arr[i] = listTuan[iterator-1].listA[i].congTac;
			}
		}
		else
		{
			if(listTuan[iterator-1].listB != null)
			{
				for(var i=0;i<listTuan[iterator-1].listB.length;i++)
					arr[i] = listTuan[iterator-1].listB[i].congTac;
			}
		}
		index = arr.length;
		var value = window.showModalDialog(duongDan + "ThemCongTac.jsp",arr,"dialogHeight: 450px; dialogWidth: 800px; dialogTop: 150px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;");
		if(value != null)
		{
			if(khoaChinh == 'A')
			{	
				for(var i=index;i<value.length;i++)
				{
					var objCongTac = new Object();
					objCongTac = value[i];
					themCongTac(iterator, khoaChinh, khoaPhu, objCongTac);
					var arrThucHien = new Array();
					var congTac = new Object();
					congTac.congTac = objCongTac;
					congTac.thucHien = arrThucHien;
					listTuan[iterator-1].listA[i] = congTac;
				}	
			}
			else
			{
				for(var i=index;i<value.length;i++)
				{
					
					var objCongTac = new Object();
					objCongTac = value[i];
					themCongTac(iterator, khoaChinh, khoaPhu, objCongTac);
					var arrThucHien = new Array();
					var congTac = new Object();
					congTac.congTac = objCongTac;
					congTac.thucHien = arrThucHien;
					listTuan[iterator-1].listB[i] = congTac;
				}
			}
			
		}
	}
	function openPopupThemNguoi(boSung,iterator, khoa, maCongTac)
	{
		var index;
		var arr = new Array();
		if(khoa == 'A')
		{
			for(var i=0;i<listTuan[iterator-1].listA.length;i++)
			{
				if(listTuan[iterator-1].listA[i].congTac.maCongTac == maCongTac)
				{
					arr = listTuan[iterator-1].listA[i].thucHien;
					index = i;
					break;
				}
			}
		}
		else
		{
			for(var i=0;i<listTuan[iterator-1].listB.length;i++)
			{
				if(listTuan[iterator-1].listB[i].congTac.maCongTac == maCongTac)
				{
					arr = listTuan[iterator-1].listB[i].thucHien;
					index = i;
					break;
				}
			}
		}
		value = window.showModalDialog(duongDan + "ThemNguoiThucHien.jsp",arr,"dialogHeight: 600px; dialogWidth: 600px; dialogTop: 150px; dialogLeft: 350px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;");
		if(value != null) 
		{
			if(khoa == 'A')
			{
				listTuan[iterator-1].listA[index].thucHien = value;
				themNguoi(boSung, iterator, 'A', 'B', maCongTac, value);
			}
			else
			{
				listTuan[iterator-1].listB[index].thucHien = value;
				themNguoi(boSung, iterator, 'B', 'A', maCongTac, value);
			}
		}
	}
	function themNguoi(boSung, iterator, khoaChinh, khoaPhu, maCongTac, objThucHien)
	{
		var table = document.getElementById('TableKHDT');
		var count1 = 0;
		var count2 = 0;
		var row = 1;
		var x = 1, y = 1;
		for(var i=1;i<= iterator;i++)
		{
			
			count1 = parseInt(document.getElementById('CountCongTacKhoaA' + i).value);
			count2 = parseInt(document.getElementById('CountCongTacKhoaB' + i).value);
			if(i == iterator)
			{
				
				if(khoaChinh == 'A')
				{
					size = count1;
					count1 = 0;
					x = 0;					
				}
				else
					size = count2;
				count2 = 0;
				y = 0;
			}
			row = row + count1 + count2 + x + y;
		}
		count1 = parseInt(document.getElementById('CountCongTacKhoa' + khoaChinh + iterator).value);
		count2 = parseInt(document.getElementById('CountCongTacKhoa' + khoaPhu + iterator).value);
		var x = 1;
		for(var i=row;i<row + size;i++)
		{
			if(table.rows[i].innerHTML.match('MaCongTac-' + maCongTac + '-MaCongTac') != null)
			{
				if(i == row)
				{
					if(khoaChinh == 'A')
						x = 5;
					else
						x = 2;
				}
				table.rows[i].cells[x].innerHTML = "<input type = 'hidden' value = 'MaCongTac-" + maCongTac + "-MaCongTac'/>";
				for(var j=0;j<objThucHien.length;j++)
				{
					if(objThucHien[j].boPhan.maBoPhan == '-1')
						table.rows[i].cells[x].innerHTML = table.rows[i].cells[x].innerHTML + "<font color = 'blue'>" + objThucHien[j].boPhan.boPhan.replace(/<--->/gi,'<br/>') + "</font><br/>";
					else
						table.rows[i].cells[x].innerHTML = table.rows[i].cells[x].innerHTML + "<font color = 'blue'>" + objThucHien[j].boPhan.boPhan + "</font><br/>";	
					for(var k=0;k<objThucHien[j].thucHien.length;k++)
					{
						table.rows[i].cells[x].innerHTML = table.rows[i].cells[x].innerHTML + "-" + objThucHien[j].thucHien[k].nguoiThucHien + "<br/>";
					}
				}
				
				if((tinhTrang == <%=Constant.TINHTRANG_NEW %> || tinhTrang == <%=Constant.TINHTRANG_REJECT %> || boSung != 0) && document.getElementById('txtDieuKien' + iterator).value == '0')
					table.rows[i].cells[x].innerHTML = table.rows[i].cells[x].innerHTML + "<input type = 'button' value = 'Thêm BPTH' onclick = \"openPopupThemNguoi(" + boSung + "," + iterator + ",'" + khoaChinh + "'," + maCongTac + ")\" />";
			}
		}
	}
	function xuLyCheckbox(str)
	{
		if(document.getElementById(str).checked == true)
			document.getElementById(str).value = 'DeleteCongTac';
		else
			document.getElementById(str).value = '';
	}
	function deleteCongTac(iterator, khoaChinh, khoaPhu)
	{
		var table = document.getElementById('TableKHDT');
		var count1 = 0;
		var count2 = 0;
		var row = 1, rowNgoai = 1;
		var x = 1, y = 1;
		for(var i=1;i<= iterator;i++)
		{
			
			count1 = parseInt(document.getElementById('CountCongTacKhoaA' + i).value);
			count2 = parseInt(document.getElementById('CountCongTacKhoaB' + i).value);
			if(i == iterator)
			{
				
				if(khoaChinh == 'A')
				{
					size = count1;
					count1 = 0;
					x = 0;					
				}
				else
					size = count2;
				rowNgoai = row;
				count2 = 0;
				y = 0;
			}
			row = row + count1 + count2 + x + y;
		}
		count1 = parseInt(document.getElementById('CountCongTacKhoa' + khoaChinh + iterator).value);
		count2 = parseInt(document.getElementById('CountCongTacKhoa' + khoaPhu + iterator).value);
		var index = 0;
		var check = 0;
		var demDongXoa = 0;
		for(var i=row;i< row+size;i++)
		{
			if(table.rows[i].innerHTML.match('DeleteCongTac') != null)
			{
				if(check == 0)
				{
					if(confirm("Bạn có chắc muốn xóa những công tác này không ???"))
						check = 2;
					else
					{
						check = 1;
						break;
					}
				}
				if(check == 2)
				{
					count1--;
					demDongXoa++;
					if(i == row)
					{
						if(khoaChinh == 'A')
						{
							var tuNgay = document.getElementById('txtTuNgay' + iterator).value;
							var denNgay = document.getElementById('txtDenNgay' + iterator).value;
							
							table.rows[i + 1].insertCell(0).innerHTML = table.rows[i].cells[0].innerHTML;
							table.rows[i + 1].insertCell(1).innerHTML = table.rows[i].cells[1].innerHTML;
							table.rows[i + 1].cells[1].id = table.rows[i].cells[1].id;
							
							table.rows[i + 1].insertCell(2).innerHTML = table.rows[i].cells[2].innerHTML;
							table.rows[i + 1].insertCell(3).innerHTML = table.rows[i].cells[3].innerHTML;
							
							table.deleteRow(i);
							
							document.getElementById('txtTuNgay' + iterator).value = tuNgay;
							document.getElementById('txtDenNgay' + iterator).value = denNgay;
						}	
						else
						{
							table.rows[i + 1].insertCell(0).innerHTML = table.rows[i].cells[0].innerHTML;
							table.deleteRow(i);
						}
					}
					else
						table.deleteRow(i);
					table.rows[rowNgoai].cells[0].rowSpan = count1 + count2 + 2;
					table.rows[rowNgoai].cells[1].rowSpan = count1 + count2 + 2;
					table.rows[rowNgoai].cells[2].rowSpan = count1 + count2 + 2;
					if(khoaChinh == 'A')
					{
						listTuan[iterator-1].listA.splice(index,1);
						table.rows[row].cells[3].rowSpan = count1 + 1;
					}
					else
					{
						listTuan[iterator-1].listB.splice(index,1);
						table.rows[row].cells[0].rowSpan = count1 + 1;
					}
					i--;
					index--;
					size--;
				}
			}
			index++;
		}
		document.getElementById('CountCongTacKhoa' + khoaChinh + iterator).value = count1;
		//sua ngay 14/08/2010
		document.getElementById('CountTableRow').value = parseInt(document.getElementById('CountTableRow').value) - demDongXoa;
		//
		if(check == 0)
			alert("Hãy chọn công tác cần xóa!!!");
	}
	function themCongTac(iterator, khoaChinh, khoaPhu, objCongTac) 
	{
		var table = document.getElementById('TableKHDT');
		var count1 = 0;
		var count2 = 0;
		var count = parseInt(document.getElementById('CountTableRow').value);
		var row = 1;
		var x = 1, y = 1;
		var cell = 0;
		for(var i=1;i<=iterator;i++)
		{
			count1 = parseInt(document.getElementById('CountCongTacKhoa' + khoaChinh + i).value);
			count2 = parseInt(document.getElementById('CountCongTacKhoa' + khoaPhu + i).value);
			
			if(i == iterator)
			{
				if(khoaChinh == 'A')
				{
					count2 = 0;
					x = 0;
				}
				y = 0;
			}
			row = row + count1 + count2 + x + y;
		}
		table.insertRow(row);
		count1 = parseInt(document.getElementById('CountCongTacKhoa' + khoaChinh + iterator).value);
		count2 = parseInt(document.getElementById('CountCongTacKhoa' + khoaPhu + iterator).value);
		count1++;
		document.getElementById('CountCongTacKhoa' + khoaChinh + iterator).value = count1;
		count++;
		if(count1 == 1 && khoaChinh == 'A')
		{
			table.rows[row].insertCell(cell).innerHTML = table.rows[row+1].cells[0].innerHTML;
			table.rows[row].cells[cell++].rowSpan = count1 + count2 + 2;
			table.rows[row+1].deleteCell(0);
			table.rows[row].insertCell(cell).innerHTML = table.rows[row+1].cells[0].innerHTML;
			table.rows[row].cells[cell].id = table.rows[row+1].cells[0].id;
			table.rows[row].cells[cell++].rowSpan = count1 + count2 + 2;
			table.rows[row+1].deleteCell(0);
			var tuNgay = document.getElementById('txtTuNgay' + iterator).value;
			var denNgay = document.getElementById('txtDenNgay' + iterator).value;
			table.rows[row].insertCell(cell).innerHTML = table.rows[row+1].cells[0].innerHTML;
			table.rows[row].cells[cell++].rowSpan = count1 + count2 + 2;
			table.rows[row+1].deleteCell(0);
			document.getElementById('txtTuNgay' + iterator).value = tuNgay;
			document.getElementById('txtDenNgay' + iterator).value = denNgay;
			table.rows[row].insertCell(cell).innerHTML = table.rows[row+1].cells[0].innerHTML;
			table.rows[row].cells[cell++].rowSpan = count1 + 1;
			table.rows[row+1].deleteCell(0);
		}
		else if(count1 == 1 && khoaChinh == 'B')
		{
			table.rows[row-count1-count2].cells[0].rowSpan = count1 + count2 + 2;
			table.rows[row-count1-count2].cells[1].rowSpan = count1 + count2 + 2;
			table.rows[row-count1-count2].cells[2].rowSpan = count1 + count2 + 2;
			table.rows[row].insertCell(cell).innerHTML = table.rows[row+1].cells[0].innerHTML;
			table.rows[row].cells[cell++].rowSpan = count1 + 1;
			table.rows[row+1].deleteCell(0);
		}
		else
		{
			if(khoaChinh == 'A')
			{
				table.rows[row-count1+1].cells[0].rowSpan = count1 + count2 + 2;
				table.rows[row-count1+1].cells[1].rowSpan = count1 + count2 + 2;
				table.rows[row-count1+1].cells[2].rowSpan = count1 + count2 + 2;
				table.rows[row-count1+1].cells[3].rowSpan = count1 + 1;
			}
			else
			{
				table.rows[row-count1-count2].cells[0].rowSpan = count1 + count2 + 2;
				table.rows[row-count1-count2].cells[1].rowSpan = count1 + count2 + 2;
				table.rows[row-count1-count2].cells[2].rowSpan = count1 + count2 + 2;
				table.rows[row-count1+1].cells[0].rowSpan = count1 + 1;
			}
			
			
		}
		table.rows[row].insertCell(cell++).innerHTML = objCongTac.noiDung;
		if(objCongTac.boSung == -1) {
			table.rows[row].cells[--cell].innerHTML += "<br/><font color = 'blue'>P.Đào Tạo bổ sung</font>";
			cell++;
		} else if(objCongTac.boSung == 1) {
			table.rows[row].cells[--cell].innerHTML += "<br/><font color = 'blue'>P.Hành Chánh bổ sung</font>";
			cell++;
		}
		table.rows[row].insertCell(cell++).innerHTML = "<input type = 'hidden' value = 'MaCongTac-" + objCongTac.maCongTac + "-MaCongTac'/>";
		if((tinhTrang == <%=Constant.TINHTRANG_NEW %> || tinhTrang == <%=Constant.TINHTRANG_REJECT %> || objCongTac.boSung != 0) && document.getElementById('txtDieuKien' + iterator).value == '0') {
			table.rows[row].cells[--cell].innerHTML += "<input type = 'button' value = 'Thêm BPTH' onclick = \"openPopupThemNguoi(" + objCongTac.boSung + "," + iterator + ",'" + khoaChinh + "'," + objCongTac.maCongTac + ")\" />";
			cell++;
		}
		table.rows[row].insertCell(cell).innerHTML = "<input type = 'checkbox' id = 'chkboxCongTac" + khoaChinh + iterator + "_" + count1 + "' onclick = \"xuLyCheckbox('chkboxCongTac" + khoaChinh + iterator + "_" + count1 + "');\"/>";
		if((((objCongTac.boSung != 0 || objCongTac.boSung != 1) && document.getElementById('txtDieuKien' + iterator).value == '0') && tinhTrang == <%=Constant.TINHTRANG_APPROVE %>) || document.getElementById('txtDieuKien' + iterator).value == '1') 
			document.getElementById('chkboxCongTac' + khoaChinh + iterator + '_' + count1).disabled = true;
		document.getElementById('CountTableRow').value = count;
		document.getElementById('CountCongTacKhoa' + khoaChinh + iterator).value = count1;
	}
	function phanCongTac(iterator)
	{
		document.getElementById('PhanCongTac' + iterator).click();
	}
</script>	 
</head>
<body onload="changeComboboxValue();">
<div class = "div_pagebody">
<div align="center">
<c:set var="KHDTObj" value="<%=keHoachDaoTaoModel %>" scope="session" ></c:set>
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
		<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
		<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
		
		<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
		<c:set var = "BO_PHAN_PDT" value = '<%= Constant.BO_PHAN_PDT %>'></c:set>
		<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
		<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
		<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
		
		<c:set var = "NEW" value = "<%= Constant.TINHTRANG_NEW %>"></c:set>
		<c:set var = "PENDING" value = "<%= Constant.TINHTRANG_SEND %>"></c:set>
		<c:set var = "REJECT" value = "<%= Constant.TINHTRANG_REJECT %>"></c:set>
		<c:set var = "APPROVE" value = "<%= Constant.TINHTRANG_APPROVE %>"></c:set>
		<c:set var = "BOSUNG" value = "<%= Constant.TINHTRANG_BO_SUNG %>"/>
		<c:set var = "NgayHienTai" value="<%=SysParamsDAO.getNgayGioHeThong().getNgayHeThong() %>"/>
		
		<c:set var = "DieuKienPHC" value = "<%=dieuKienPHC%>"/>
	<c:choose>	
		<c:when test = "${not empty param.ThemDongTren or not empty param.ThemDongDuoi}">
			<c:set var = "Row" value = "<%=keHoachDaoTaoModel.getChiTietKHDTList().size() + 1 %>" scope="session"/>
		</c:when>
		<c:otherwise>
			<c:if test = "${not empty KHDTObj.maNguoiLap}">
				<c:set var = "Row" value = "<%=keHoachDaoTaoModel.getChiTietKHDTList().size()%>" scope="session"/>
			</c:if>	
		</c:otherwise>
	</c:choose>	
	<c:if test = "${empty KHDTObj.maNguoiLap or Row eq 0}">
		<c:set var = "Row" value = "1" scope="session"/>
	</c:if>
	<form action="<%=request.getContextPath()%>/keHoachDaoTaoController?them=yes" method="post" name="KHDT" >
		
	<div id = "div_border">
		<c:if test="${not empty param.Them}">
			<% Constant.NUM_ROWS = 1; %>
		</c:if>
		<c:if test="${not empty param.errNam}">
			<b class="error">Kế Hoạch năm này đã có rồi</b>
		</c:if>
		<c:if test="${not empty param.err}">
			<b class="error"> Nhập liệu vào các ô bắt buộc (*) </b>
		</c:if>
		<c:if test="${not empty param.msg and param.msg eq 'ThemMoi'}">
			<b class="msg"> Thêm mới "KẾ HOẠCH ĐÀO TẠO" thành công </b>
		</c:if>
		<c:if test="${(not empty param.msg and param.msg eq 'CapNhat')
							or (not empty requestScope.msgDeleteRow)}">
			<b class="msg"> Cập nhật "KẾ HOẠCH ĐÀO TẠO" thành công </b>
		</c:if>		
		
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;" ><br /><br />
				<td><div class = "div_td">
					CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />
					Độc lập - Tự do - Hạnh phúc</div>
				</td>
				<td><div class = "div_td">
					TRƯỜNG TCN KTCN HÙNG VƯƠNG<br />
					PHÒNG ĐÀO TẠO</div>
				</td>
			</tr></table><table>
			<tr style="background-color: transparent;">
				<td colspan = 2><br /><br />
						KẾ HOẠCH ĐÀO TẠO HỆ CHÍNH QUI DÀI HẠN NĂM HỌC						
						<select name="cboNam1" id="cboNam1" onchange="changeComboboxValue();"
						<c:if test = "${not empty KHDTObj.maKeHoachDaoTao}">disabled</c:if> >
							<c:forEach var="iterator" begin="2000" end="2030" step="1">
								<option value="${iterator}" <c:if test="${KHDTObj.nam1 eq iterator}">selected</c:if>>${iterator}</option>
							</c:forEach>
						</select>-
						<input type="text" id="txtNam2" name="txtNam2" size = 2 value="${KHDTObj.nam2}" readonly="readonly"  style="background-color: transparent;"/>						
						<br />
						Phát huy hiệu quả đào tạo trong năm
						<input type="text" id="txtNam3" name="txtNam3" size = 2 value="${KHDTObj.nam3}" readonly="readonly"  style="background-color: transparent;"/>-
						<input type="text" id="txtNam4" name="txtNam4" size = 2 value="${KHDTObj.nam4}" readonly="readonly" style="background-color: transparent;" />
						, nhằm không ngừng ổn định và nâng cao chất lượng đào tạo, hoàn thiện công tác quản lý,
						Trường Trung cấp nghề Kỹ thuật Công nghệ  Hùng Vương xác định nhiệm vụ trọng tâm năm học 
						<input type="text" id="txtNam5" name="txtNam5" size = 2 value="${KHDTObj.nam5}" readonly="readonly" style="background-color: transparent;" />-
						<input type="text" id="txtNam6" name="txtNam6" size = 2 value="${KHDTObj.nam6}" readonly="readonly" style="background-color: transparent;" /> 
						với một số chủ điểm sau :
				</td>
			</tr>
			<tr style="background-color: transparent;">
			<td><div class = "div_tr"><strong>I./ NHIỆM VỤ  NĂM HỌC :</strong></div></td>
			</tr>
				<tr style="background-color: transparent;">
					<td colspan = 2>
						<div class = "div_tr">1. Công tác giảng dạy : </div><br />
						
						<textarea  rows="2" cols="90" name="areaNhiemvu1" style="background-color: transparent;">${KHDTObj.nhiemVu1}</textarea>
						
						<c:if test="${not empty param.err and KHDTObj.nhiemVu1 eq ''}"><b class="error">(*)</b></c:if>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan = 2>
						<div class = "div_tr">2. Công tác quản lý : </div><br />
						<textarea  rows="2" cols="90" name="areaNhiemvu2" style="background-color: transparent;">${KHDTObj.nhiemVu2}</textarea>
						<c:if test="${not empty param.err and KHDTObj.nhiemVu2 eq ''}"><b class="error">(*)</b></c:if>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan = 2>
						<div class = "div_tr">3. Công tác xây dựng chương trình, giáo trình : </div><br />
						<textarea  rows="2" cols="90" name="areaNhiemvu3" style="background-color: transparent;">${KHDTObj.nhiemVu3}</textarea>
						<c:if test="${not empty param.err and KHDTObj.nhiemVu3 eq ''}"><b class="error">(*)</b></c:if>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan = 2>
						<div class = "div_tr">4. Công tác hỗ trợ học tập của học sinh : </div><br />
						<textarea  rows="2" cols="90" name="areaNhiemvu4" style="background-color: transparent;">${KHDTObj.nhiemVu4}</textarea>
						<c:if test="${not empty param.err and KHDTObj.nhiemVu4 eq ''}"><b class="error">(*)</b></c:if>
					</td>
				</tr>
			<tr style="background-color: transparent;">
				<td><div class = "div_tr"><strong>II./ KẾ  HOẠCH CÔNG TÁC :</strong></div></td>
			</tr>
		</table>
		<c:set var = "ThemDongTren" value = "false"/>
		<c:set var = "ThemDongDuoi" value = "false"/>
		<table border = 1 style="background-color: transparent;" id = "TableKHDT" name = "KHDT">
		  <tr style="background-color: transparent;">
		  		<td><input type = "checkbox" name = "chkAllRow" onclick="selectCheckboxAll();"/></td>
				<td><p align="center">TUẦN</p></td>
				<td width="200"><p align="center">THỜI GIAN<br />(Từ ngày-đến ngày)<br />(mm-dd-yyyy)</td>
				<td><p align="center">Khóa</p></td>
				<td width="300"><p align="center">Nội dung<br />công tác</p></td>
				<td width="300"><p align="center">Bộ phận<br />thực hiện</p></td>
				<td width="40" id = "td">&nbsp;</td>
			</tr>
		<c:forEach var="iterator" begin="1" end="${Row}">
			<c:choose>	
				<c:when test="${KHDTObj.chiTietKHDTList[iterator-1].denNgay eq '' or KHDTObj.chiTietKHDTList[iterator-1].denNgay eq null}">
					<c:set var = "SoSanhNgay" value = "false"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var = "SoSanhNgay" value = "${sf:compareDate(NgayHienTai, KHDTObj.chiTietKHDTList[iterator-1].denNgay)}"></c:set>
				</c:otherwise>
			</c:choose>
		
			<c:choose>				
					<c:when test="${((MaBoPhan ne BO_PHAN_PDT and MaBoPhan ne BO_PHAN_ADMIN) 
							or KHDTObj.tinhTrang eq null 
								or KHDTObj.tinhTrang eq PENDING 
									or (KHDTObj.tinhTrang eq APPROVE and SoSanhNgay eq true)) }"><!--
											or KHDTObj.chiTietKHDTList[iterator-1].tinhTrangPhanCongTac eq 1 }">
						--><c:set var = "DieuKien" value="1"></c:set>
						<input type="hidden" id = "txtDieuKien${iterator}" style="background-color: transparent;" value = "1"/>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test = "${KHDTObj.tinhTrang ne APPROVE}">
								<c:choose>
									<c:when test="${(MaBoPhan eq BO_PHAN_PDT and KHDTObj.maNguoiLap eq maThanhVien) or MaBoPhan eq BO_PHAN_ADMIN}">
										<c:set var = "DieuKien" value="0"></c:set>
										<input type="hidden" id = "txtDieuKien${iterator}" style="background-color: transparent;" value = "0"/>
									</c:when>
									<c:otherwise>
										<c:set var = "DieuKien" value="1"></c:set>
										<input type="hidden" id = "txtDieuKien${iterator}" style="background-color: transparent;" value = "1"/>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:set var = "DieuKien" value="0"></c:set>
								<input type="hidden" id = "txtDieuKien${iterator}" style="background-color: transparent;" value = "0"/>
							</c:otherwise>
						</c:choose>	
					</c:otherwise>	
				</c:choose>  
			
				
			
			<tr style="background-color: transparent;">
				<td rowspan="2"><input type = "checkbox" name = "chkRow${iterator}" onclick="selectCheckboxRow();"/></td>
				<td rowspan="2" id="td${iterator}">
					${KHDTObj.chiTietKHDTList[iterator-1].thuTuTuan}
				</td>
				<td rowspan="2">
					<input type="hidden" id = "txtKiTuTuan${iterator}" name="txtKiTuTuan${iterator}" value="${KHDTObj.chiTietKHDTList[iterator-1].thuTuTuan}"/>
					<input type="hidden" id = "txtNamHoc${iterator}" name="txtNamHoc${iterator}" value="${KHDTObj.chiTietKHDTList[iterator-1].maNamHoc}"/>
					<input type="hidden" id = "txtTuanLe${iterator}" name="txtTuanLe${iterator}" value="${KHDTObj.chiTietKHDTList[iterator-1].tuan}"/>
					<input type = "text" id = "txtTuNgay${iterator}" name="txtTuNgay${iterator}" value="${KHDTObj.chiTietKHDTList[iterator-1].tuNgay}" style="background-color: transparent;" readonly="readonly"/>
					<input type = "text" id = "txtDenNgay${iterator}" name="txtDenNgay${iterator}" value="${KHDTObj.chiTietKHDTList[iterator-1].denNgay}" style="background-color: transparent;" readonly="readonly"/>	
					<c:if test="${(KHDTObj.tinhTrang eq APPROVE or KHDTObj.tinhTrang eq BOSUNG) and (MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN)}">
						<a href="<%=Constant.PATH_RES.getString("iso.PhanCongTacTuanPath")%>?maChiTiet=${KHDTObj.chiTietKHDTList[iterator-1].id}" id="PhanCongTac${iterator}">	
							<img src="<%=request.getContextPath()%>/images/buttom/phancttuan.png" alt="Phân công tác tuần" border = "0" />
						</a>			
					</c:if>
				</td>
				<td><c:choose>
						<c:when test="${not empty KHDTObj.maKeHoachDaoTao}">
							<%=Constant.SETTING_RES.getString("Khoa1") %>
							<input type = "hidden" name = "txtKhoa1" value = "<%=Constant.SETTING_RES.getString("Khoa1") %>"/>
						</c:when>
						<c:otherwise>
							${KHDTObj.user1}
							<input type = "hidden" name = "txtKhoa1" value = "${KHDTObj.user1}"/>
						</c:otherwise>
					</c:choose> 
				</td>
				<td colspan="3">
					<input value="Thêm công tác" type = "button" 
						id = "Btn_khoaA" onclick="openPopupCongTac(${iterator},'A','B');"
						<c:if test = "${DieuKien eq 1}">disabled</c:if>
					/>
					
					<input type = "button" value = "Xóa công tác" 
						onclick="deleteCongTac(${iterator},'A','B')"
						<c:if test = "${DieuKien eq 1}">disabled</c:if>
					/>
				</td>
			</tr>
			<tr>
				<td><c:choose>
						<c:when test="${not empty KHDTObj.maKeHoachDaoTao}">
							<%=Constant.SETTING_RES.getString("Khoa2") %>
							<input type = "hidden" name = "txtKhoa2" value = "<%=Constant.SETTING_RES.getString("Khoa2") %>"/>
						</c:when>
						<c:otherwise>
							${KHDTObj.user2}
							<input type = "hidden" name = "txtKhoa2" value = "${KHDTObj.user2}"/>
						</c:otherwise>
					</c:choose> 
				</td>
				<td colspan="3">
					<input value="Thêm công tác"  type = "button" 
						id = "Btn_khoaB" onclick="openPopupCongTac(${iterator},'B','A');"
						<c:if test = "${DieuKien eq 1}">disabled</c:if>
					/>
					
					<input type = "button" value = "Xóa công tác" 
						onclick="deleteCongTac(${iterator},'B','A');"
						<c:if test="${DieuKien eq 1}">disabled</c:if>
					/>
					
				</td>		
			  </tr>
			  <input type = "hidden" id = "CountCongTacKhoaA${iterator}" value="0"/>
			  <input type = "hidden" id = "CountCongTacKhoaB${iterator}" value="0"/>
			  
		  </c:forEach>
		</table>
		<input type = "hidden" id = "CountTableRow" value = "<%=Constant.NUM_ROWS * 2 + 1 %>"/>
				
		<table align = "center" style="background-color: transparent;">
			<tr style="background-color: transparent;">

				<c:if test="${(KHDTObj.tinhTrang eq NEW 
								and ((MaBoPhan eq BO_PHAN_PDT and maThanhVien eq KHDTObj.maNguoiLap) or MaBoPhan eq BO_PHAN_ADMIN))
									or (KHDTObj.tinhTrang eq APPROVE
										and (MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_ADMIN))}">
						<td>							
							<a href = "javascript: addRowTren()">
								<input type="hidden" name="XuLyDong" id="XuLyDong" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/themdongtren.png" alt="Thêm dòng trên" border = "0" />
							</a>
						</td>
						<td>								
							<a href = "javascript: addRowDuoi()">								
								<img src="<%=request.getContextPath()%>/images/buttom/themdongduoi.png" alt="Thêm dòng dưới" border = "0" />
							</a>
						</td>
				</c:if>
			</tr>
			<tr style="background-color: transparent;">
				<td>
						Quận5, <input type="text" name="txtCalendar8" id="txtCalendar8" size = 15 readonly="readonly" value="${KHDTObj.ngayCapNhatCuoi}" style="background-color: transparent;"/> 
						<br /><strong>PHÒNG ĐÀO TẠO</strong><br />
						<br />${KHDTObj.tenNguoiLap}
				</td>
				<td>
						<p>Quận5, <input type="text" name="txtCalendar9" id="txtCalendar9" size = 10 readonly="readonly"  value = "${KHDTObj.ngayDuyet}" style="background-color: transparent;"/> 
				 
						<br /><strong>BAN GIÁM HIỆU DUYỆT</strong><br />
						<br />${KHDTObj.tenNguoiDuyet}
				</td>
			</tr>
		</table>
		<br /><br /><br /><br /></div>
		<input type="hidden" id = "action" name="actionType" style="background-color: transparent;" 
			<c:choose>				
				<c:when test="${empty KHDTObj.maKeHoachDaoTao}">
					value="ThemMoi"
				</c:when>
				<c:otherwise>
					value="CapNhat"
				</c:otherwise>	
			</c:choose>  
		/>		
		 
		<c:if test="${((MaBoPhan eq BO_PHAN_PDT and (maThanhVien eq KHDTObj.maNguoiLap or KHDT.obj eq null)) or MaBoPhan eq BO_PHAN_ADMIN) and KHDTObj.tinhTrang ne PENDING}">
				<!--  <input type = "submit" name="TaoMoi" -->
			<a href = "javascript: submitForm(1)" name="TaoMoi"> 
				<c:choose>
					<c:when test="${empty KHDTObj.maKeHoachDaoTao}">
						<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Tạo mới" border = "0" />
					</c:when>
					<c:otherwise>						
						<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập Nhật" border = "0" />
					</c:otherwise>
				</c:choose> 
			</a>
										
		</c:if>
		<c:if test="${KHDTObj.tinhTrang eq NEW 
								and ((MaBoPhan eq BO_PHAN_PDT and maThanhVien eq KHDTObj.maNguoiLap) or MaBoPhan eq BO_PHAN_ADMIN)}">
			<a href = "javascript: confirmSending()">
				<input type="hidden" name="GuiHieuTruong" /> 
				<img src="<%=request.getContextPath()%>/images/buttom/guihieutruong.png" alt="Gửi Hiệu Trưởng" border = "0" />
			</a>
		</c:if>	
		<c:if test="${KHDTObj.tinhTrang eq APPROVE }">	
			<c:if test="${(MaBoPhan eq BO_PHAN_PDT and maThanhVien eq KHDTObj.maNguoiLap) or MaBoPhan eq BO_PHAN_ADMIN or MaBoPhan eq BO_PHAN_PHC or maThanhVien eq KHDTObj.maNguoiDuyet}">						
				<a href = "<%=Constant.PATH_RES.getString("iso.InKeHoachDaoTaoPath") %>">								 
					<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
				</a>
			</c:if>
		</c:if>
			<c:if test="${not empty KHDTObj.maKeHoachDaoTao}">	
				<c:set var = "ListKHDTApproved" value='<%=KeHoachDaoTaoDao.getAllKeHoachDaoTaoApproved()%>'></c:set>
				<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and KHDTObj.tinhTrang eq PENDING}">
					<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Approve" /> </a>
				</c:if>			
				<select name = "cboSoSanh" onclick="changeSoSanh();" id="cboSoSanh">
						<option value="">--Select--</option>
					<c:forEach  var="KHDTApproved" 
							items = "${ListKHDTApproved}">
						<c:if test="${KHDTApproved.maKeHoachDaoTao ne KHDTObj.maKeHoachDaoTao}">
							<c:choose>
								<c:when test="${MaBoPhan eq BO_PHAN_PDT}">
									<c:if test="${maThanhVien eq KHDTApproved.maNguoiLap}">
										<option value="${KHDTApproved.maKeHoachDaoTao}">${KHDTApproved.nam1}-${KHDTApproved.nam2}</option>
									</c:if>
								</c:when>
								<c:otherwise>
									<option value="${KHDTApproved.maKeHoachDaoTao}">${KHDTApproved.nam1}-${KHDTApproved.nam2}</option>
								</c:otherwise>
							</c:choose>
						</c:if>	
					</c:forEach>
				</select>			
			<a href = "javascript: submitFormSoSanh()">									 
				<img src="<%=request.getContextPath()%>/images/buttom/sosanh.png" alt="So sánh" border = "0" />
			</a>
		</c:if>
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and KHDTObj.tinhTrang eq PENDING}">
			<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" /> </a>
		</c:if>
		<input type="hidden" value = "0" name="txtHidden" id = "txtHidden"/>
	</form>

							
	<form method="post" action="<%=request.getContextPath()%>/keHoachDaoTaoController?sosanh=yes" name="SoSanhKHDT">	
		<input type="hidden" name="SoSanh" value = "" id="SoSanh"/>	
	</form>
							
	<form method="post" action="<%=request.getContextPath()%>/keHoachDaoTaoController?duyet1kehoach=yes&maKeHoach=${KHDTObj.maKeHoachDaoTao}" name="Duyet1KHDT">	
		<input type="hidden" name="Duyet" value = "" id="Duyet"/>
		<input type="hidden" name="LyDoReject" value="" id="LyDoReject"/>
	</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>