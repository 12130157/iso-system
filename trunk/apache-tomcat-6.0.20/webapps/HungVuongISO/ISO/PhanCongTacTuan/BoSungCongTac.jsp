<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.PhanCongTacTuanModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhanCongTacTuanDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHDTDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.model.NguoiThucHienModel"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TuanLeModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Phân công tác tuần</title>
<script language="JavaScript" type="text/javascript">
var duongDan = "";
var objTuan;
	<%
		String kieuTuan = "1";
		if(request.getParameter("KieuTuan") != null)
			kieuTuan = request.getParameter("KieuTuan");
		//TuanLeModel tuanLe = TuanLeDAO.getTuanByNgay(kieuTuan);
		KeHoachDaoTaoModel keHoach = new KeHoachDaoTaoModel();
		ChiTietKHDTModel chiTiet = new ChiTietKHDTModel();
		if(request.getParameter("maKHDT") != null) {
			keHoach = KeHoachDaoTaoDao.getKeHoachDaoTaoByID(request.getParameter("maKHDT"));
			chiTiet = ChiTietKHDTDAO.getChiTietJoinAllTableByMaKHDTAndNgay(keHoach.getMaKeHoachDaoTao(), kieuTuan, keHoach.getNam1());
		} else {
			keHoach = (KeHoachDaoTaoModel) request.getAttribute("keHoachDaoTao");
			chiTiet = (ChiTietKHDTModel) request.getAttribute("chiTietKHDT");
			out.print("duongDan = 'ISO/PhanCongTacTuan/';");
		}
	%>
	function pageLoad()
	{
		document.getElementById('CountCongTacKhoaA').value = 0;
		document.getElementById('CountCongTacKhoaB').value = 0;
		<%
		ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietList = new ArrayList<NoiDungChiTietKHDTModel>();
		ArrayList<BoPhanThucHienKHDTModel> boPhanThucHienList = new ArrayList<BoPhanThucHienKHDTModel>();
		ArrayList<NguoiThucHienModel> nguoiThucHienList = new ArrayList<NguoiThucHienModel>();
		if(chiTiet.getTuNgay() != null) {
			if(chiTiet.getId() != null) {
				if(chiTiet.getNoiDungChiTietKHDTModelList() != null) {
					out.print("objTuan = new Object();");
					out.print("objTuan.listA = new Array();");
					out.print("objTuan.listB = new Array();");
					out.print("var countA = 0, countB = 0;");
					out.print("var arrA = new Array();");
					out.print("var arrB = new Array();");
					noiDungChiTietList = chiTiet.getNoiDungChiTietKHDTModelList();
					for(int j=0;j<noiDungChiTietList.size();j++) {
						if(noiDungChiTietList.get(j).getStatus().equals("1")) {
							out.print("var obj = new Object();");
							out.print("var objCongTac = new Object();");
							out.print("objCongTac.boSung = " + noiDungChiTietList.get(j).getBoSung() + ";");
							out.print("objCongTac.maCongTac = " + noiDungChiTietList.get(j).getMaCongTac() + ";");
							out.print("objCongTac.noiDung = '" + noiDungChiTietList.get(j).getNoiDungCongTac() + "';");
							if(noiDungChiTietList.get(j).getKhoa().equals("1")) {
								out.print("var objA = new Object();");
								out.print("objA.congTac = objCongTac;");
								out.print("themCongTac('A', 'B', objCongTac);");
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
										out.print("themNguoi(objCongTac.boSung, 'A', 'B', objCongTac.maCongTac, arrThucHien);");
										out.print("objA.thucHien = arrThucHien;");
								}
								out.print("arrA[countA] = objA;");
								out.print("countA++;");
							} else {
								out.print("var objB = new Object();");
								out.print("objB.congTac = objCongTac;");
								out.print("themCongTac('B', 'A', objCongTac);");
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
									out.print("themNguoi(objCongTac.boSung, 'B', 'A', objCongTac.maCongTac, arrThucHien);");
									out.print("objB.thucHien = arrThucHien;");
								}
								out.print("arrB[countB] = objB;");
								out.print("countB++;");
							}
						}
					}
					out.print("objTuan.listA = arrA;");
					out.print("objTuan.listB = arrB;");
				}
			}
		}
		else
		{
			out.print("document.getElementById('TableChiTiet').rows[1].cells[0].innerHTML = '';");
			out.print("alert('Tuần này không thể thuộc kế hoạch này!!!');");
			out.print("document.getElementById('txtTuNgay').value = '';");
			out.print("document.getElementById('txtDenNgay').value = '';");
			
		}
		%>
	}
	function openPopupCongTac(khoaChinh, khoaPhu)
	{
		var arr = new Array();
		var index = 0;
		if(objTuan == null)
		{
			objTuan = new Object();
			objTuan.listA = new Array();
			objTuan.listB = new Array();
		}
		if(khoaChinh == 'A')
		{
			if(objTuan.listA != null)
			{
				for(var i=0;i<objTuan.listA.length;i++)
					arr[i] = objTuan.listA[i].congTac;
			}
		}
		else
		{
			if(objTuan.listB != null)
			{
				for(var i=0;i<objTuan.listB.length;i++)
					arr[i] = objTuan.listB[i].congTac;
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
					themCongTac(khoaChinh, khoaPhu, objCongTac);
					var arrThucHien = new Array();
					var congTac = new Object();
					congTac.congTac = objCongTac;
					congTac.thucHien = arrThucHien;
					objTuan.listA[i] = congTac;
				}	
			}
			else
			{
				for(var i=index;i<value.length;i++)
				{
					
					var objCongTac = new Object();
					objCongTac = value[i];
					themCongTac(khoaChinh, khoaPhu, objCongTac);
					var arrThucHien = new Array();
					var congTac = new Object();
					congTac.congTac = objCongTac;
					congTac.thucHien = arrThucHien;
					objTuan.listB[i] = congTac;
				}
			}
			
		}
	}
	function openPopupThemNguoi(boSung, khoa, maCongTac)
	{
		var index;
		var arr = new Array();
		if(khoa == 'A')
		{
			for(var i=0;i<objTuan.listA.length;i++)
			{
				if(objTuan.listA[i].congTac.maCongTac == maCongTac)
				{
					arr = objTuan.listA[i].thucHien;
					index = i;
					break;
				}
			}
		}
		else
		{
			for(var i=0;i<objTuan.listB.length;i++)
			{
				if(objTuan.listB[i].congTac.maCongTac == maCongTac)
				{
					arr = objTuan.listB[i].thucHien;
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
				objTuan.listA[index].thucHien = value;
				themNguoi(boSung, 'A', 'B', maCongTac, value);
			}
			else
			{
				objTuan.listB[index].thucHien = value;
				themNguoi(boSung, 'B', 'A', maCongTac, value);
			}
		}
	}
	function themNguoi(boSung, khoaChinh, khoaPhu, maCongTac, objThucHien)
	{
		var table = document.getElementById('TableChiTiet');
		var count1 = parseInt(document.getElementById('CountCongTacKhoaA').value);
		var count2 = parseInt(document.getElementById('CountCongTacKhoaB').value);
		var row = 1;
		var x = 1;
		if(khoaChinh == 'A')
		{
			size = count1;
			count1 = 0;
			x = 0;					
		}
		else
			size = count2;
		row = row + count1 + x;
		var x = 1;
		for(var i=row;i<row + size;i++)
		{
			if(table.rows[i].innerHTML.match('MaCongTac-' + maCongTac + '-MaCongTac') != null)
			{
				if(i == row)
				{
					if(khoaChinh == 'A')
						x = 4;
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
				if(boSung == '1' || boSung == null)
					table.rows[i].cells[x].innerHTML = table.rows[i].cells[x].innerHTML + "<input type = 'button' value = 'Thêm BPTH' onclick = \"openPopupThemNguoi(" + boSung + ",'" + khoaChinh + "'," + maCongTac + ")\" />";
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
	function deleteCongTac(khoaChinh, khoaPhu)
	{
		var table = document.getElementById('TableChiTiet');
		var count1 = parseInt(document.getElementById('CountCongTacKhoaA').value);
		var count2 = parseInt(document.getElementById('CountCongTacKhoaB').value);
		var row = 1, rowNgoai = 1;
		var x = 1, y = 1;
		
		if(khoaChinh == 'A')
		{
			size = count1;
			count1 = 0;
			x = 0;					
		}
		else
			size = count2;
		row = row + count1 + x;
		count1 = parseInt(document.getElementById('CountCongTacKhoa' + khoaChinh).value);
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
							var tuNgay = document.getElementById('txtTuNgay').value;
							var denNgay = document.getElementById('txtDenNgay').value;
							
							table.rows[i + 1].insertCell(0).innerHTML = table.rows[i].cells[0].innerHTML;
							table.rows[i + 1].insertCell(1).innerHTML = table.rows[i].cells[1].innerHTML;
							table.rows[i + 1].cells[1].id = table.rows[i].cells[1].id;
							
							table.rows[i + 1].insertCell(2).innerHTML = table.rows[i].cells[2].innerHTML;
							
							table.deleteRow(i);
							
							document.getElementById('txtTuNgay').value = tuNgay;
							document.getElementById('txtDenNgay').value = denNgay;
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
					if(khoaChinh == 'A')
					{
						objTuan.listA.splice(index,1);
						table.rows[row].cells[2].rowSpan = count1 + 1;
					}
					else
					{
						objTuan.listB.splice(index,1);
						table.rows[row].cells[0].rowSpan = count1 + 1;
					}
					i--;
					index--;
					size--;
				}
			}
			index++;
		}
		document.getElementById('CountCongTacKhoa' + khoaChinh).value = count1;
		if(check == 0)
			alert("Hãy chọn công tác cần xóa!!!");
	}
	function themCongTac(khoaChinh, khoaPhu, objCongTac) 
	{
		var table = document.getElementById('TableChiTiet');
		var count1 = parseInt(document.getElementById('CountCongTacKhoa' + khoaChinh).value);
		var count2 = parseInt(document.getElementById('CountCongTacKhoa' + khoaPhu).value);
		var row = 1;
		var x = 1;
		var cell = 0;
		if(khoaChinh == 'A')
		{
			count2 = 0;
			x = 0;
		}
		row = row + count1 + count2 + x;
		table.insertRow(row);
		count1 = parseInt(document.getElementById('CountCongTacKhoa' + khoaChinh).value);
		count2 = parseInt(document.getElementById('CountCongTacKhoa' + khoaPhu).value);
		count1++;
		document.getElementById('CountCongTacKhoa' + khoaChinh).value = count1;
		if(count1 == 1 && khoaChinh == 'A')
		{
			table.rows[row].insertCell(cell).innerHTML = table.rows[row+1].cells[0].innerHTML;
			table.rows[row].cells[cell++].rowSpan = count1 + count2 + 2;
			table.rows[row+1].deleteCell(0);
			table.rows[row].insertCell(cell).innerHTML = table.rows[row+1].cells[0].innerHTML;
			table.rows[row].cells[cell].id = table.rows[row+1].cells[0].id;
			table.rows[row].cells[cell++].rowSpan = count1 + count2 + 2;
			table.rows[row+1].deleteCell(0);
			var tuNgay = document.getElementById('txtTuNgay').value;
			var denNgay = document.getElementById('txtDenNgay').value;
			
			document.getElementById('txtTuNgay').value = tuNgay;
			document.getElementById('txtDenNgay').value = denNgay;
			table.rows[row].insertCell(cell).innerHTML = table.rows[row+1].cells[0].innerHTML;
			table.rows[row].cells[cell++].rowSpan = count1 + 1;
			table.rows[row+1].deleteCell(0);
		}
		else if(count1 == 1 && khoaChinh == 'B')
		{
			table.rows[row-count1-count2].cells[0].rowSpan = count1 + count2 + 2;
			table.rows[row-count1-count2].cells[1].rowSpan = count1 + count2 + 2;
	
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
				
				table.rows[row-count1+1].cells[2].rowSpan = count1 + 1;
			}
			else
			{
				table.rows[row-count1-count2].cells[0].rowSpan = count1 + count2 + 2;
				table.rows[row-count1-count2].cells[1].rowSpan = count1 + count2 + 2;
				table.rows[row-count1+1].cells[0].rowSpan = count1 + 1;
			}
			
			
		}
		table.rows[row].insertCell(cell++).innerHTML = objCongTac.noiDung;
		if(objCongTac.boSung != null && parseInt(objCongTac.boSung) > 0) {
			table.rows[row].cells[--cell].innerHTML += "<br/><font color = 'blue'>Bổ sung</font>";
			cell++;
		}
		table.rows[row].insertCell(cell++).innerHTML = "<input type = 'hidden' value = 'MaCongTac-" + objCongTac.maCongTac + "-MaCongTac'/>";
		if(objCongTac.boSung == null || objCongTac.boSung == '1') {
			table.rows[row].cells[--cell].innerHTML += "<input type = 'button' value = 'Thêm BPTH' onclick = \"openPopupThemNguoi(" + objCongTac.boSung + ",'" + khoaChinh + "'," + objCongTac.maCongTac + ")\" />";
			cell++;
		}
			table.rows[row].insertCell(cell).innerHTML = "<input type = 'checkbox' id = 'chkboxCongTac" + khoaChinh + count1 + "' onclick = \"xuLyCheckbox('chkboxCongTac" + khoaChinh + count1 + "');\"/>";
		if(objCongTac.boSung != null && parseInt(objCongTac.boSung) < 1)
			document.getElementById('chkboxCongTac' + khoaChinh + count1).disabled = true;
	}
	function submitForm(x)
	{	
		if(x == 0)
			document.getElementById('txtCapNhat').value = 'CapNhat';
		else
			document.getElementById('txtCapNhat').value = '';
		var str = "";
		var td = document.getElementById('td');
			if(objTuan != null) {
				var strCongTac = "";
				var arrA = objTuan.listA;
				for(var j=0;j<arrA.length;j++)
				{
					var objCongTac = arrA[j].congTac;
					if(j < arrA.length - 1)
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "</>" + objCongTac.boSung + "<->";
					else
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "</>" + objCongTac.boSung;
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
								strNguoiThucHien = "<input type = 'hidden' value = '" + strNguoiThucHien + "' name = 'NguoiThucHienA" + (j+1) + "_" + (k+1) + "'/>";
								str += strNguoiThucHien;
							} 
							
						}
						strBoPhan = "<input type = 'hidden' value = '" + strBoPhan + "' name = 'BoPhanThucHienA" + (j+1) + "'/>";
						str += strBoPhan;
					}
				}	
				if(strCongTac != "")
				{
					strCongTac = "<input type = 'hidden' value = '" + strCongTac + "' name = 'CongTacKhoaA'/>";
					str += strCongTac;
				}
				var strCongTac = "";
				var arrB = objTuan.listB;
				for(var j=0;j<arrB.length;j++)
				{
					var objCongTac = arrB[j].congTac;
					if(j < arrB.length - 1)
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "</>" + objCongTac.boSung + "<->";
					else
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "</>" + objCongTac.boSung;
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
								strNguoiThucHien = "<input type = 'hidden' value = '" + strNguoiThucHien + "' name = 'NguoiThucHienB" + (j+1) + "_" + (k+1) + "'/>";
								str += strNguoiThucHien;
							} 
							
						}
						strBoPhan = "<input type = 'hidden' value = '" + strBoPhan + "' name = 'BoPhanThucHienB" + (j+1) + "'/>";
						str += strBoPhan;
					}
				}	
				if(strCongTac != "")
				{
					strCongTac = "<input type = 'hidden' value = '" + strCongTac + "' name = 'CongTacKhoaB'/>";
					str += strCongTac;
				}
			}
		td.innerHTML = str;
		document.forms["PhanCongTacTuan"].submit();
	}
	function selectTuan()
	{
		window.location.href = <%= "'" + Constant.PATH_RES.getString("iso.BoSungCongTacPath") + "'"%> + '?KieuTuan=' + document.getElementById('cboTuan').value + '&maKHDT=' + <%=keHoach.getMaKeHoachDaoTao()%>;
	}
</script>
</head>
<body onload="pageLoad();">
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var = "ChiTietKHDT" value = "<%=chiTiet %>" scope="session"></c:set>
	<c:set var = "KeHoach" value = "<%=keHoach %>" scope="session"></c:set>
	<c:set var = "APPROVE" value="<%=Constant.TINHTRANG_APPROVE %>" />
	<form action="<%=request.getContextPath()%>/phanCongTacTuanController?BoSungCongTac=yes" method="post" name = "PhanCongTacTuan">
		<table style="background-color: transparent;" width="800">
			<tr style="background-color: transparent;" align="center">
				<td><div class = "div_tieude">KẾ HOẠCH ĐÀO TẠO NĂM HỌC <%=keHoach.getNam1() + "-" + keHoach.getNam2() %></div></td>
			</tr>
			<tr>
				<td>Chọn tuần : 
					<select onchange="selectTuan();" id = "cboTuan" name = "cboTuan">
						<option value = "1" <c:if test = "${param.KieuTuan eq '1'}">selected</c:if>>Tuần hiện tại</option>
						<option value = "2" <c:if test = "${param.KieuTuan eq '2'}">selected</c:if>>Tuần sau</option>
					</select>
				</td>
			</tr>
		</table><br /><br />
		<table border = 1 style="background-color: transparent;" id = "TableChiTiet" name = "KHDT">
		  	<tr style="background-color: transparent;">
				<td><p align="center">TUẦN</p></td>
				<td width="200"><p align="center">THỜI GIAN<br />(Từ ngày-đến ngày)<br />(mm-dd-yyyy)</td>
				<td><p align="center">Khóa</p></td>
				<td width="300"><p align="center">Nội dung<br />công tác</p></td>
				<td width="300"><p align="center">Bộ phận<br />thực hiện</p></td>
				<td width="40" id = "td">&nbsp;</td>
			</tr>
			<tr>
				<td rowspan="2">
					<%= chiTiet.getThuTuTuan() %>
					<input type="hidden" value = "<%= chiTiet.getThuTuTuan() %>" name = "txtThuTuTuan" id = "txtThuTuTuan"/>
					<input type="hidden" value = "<%= chiTiet.getTuan() %>" name = "txtThuTuTuan" id = "txtThuTuTuan"/>
				</td>
				<td rowspan="2">
					<input type="text" value = "<%=chiTiet.getTuNgay() %>" name = "txtTuNgay" id = "txtTuNgay"/>-
					<input type="text" value = "<%=chiTiet.getDenNgay() %>" name = "txtDenNgay" id = "txtDenNgay"/>
				</td>
				<td>
					<c:choose>
						<c:when test="${not empty ChiTietKHDT.id}">
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
						<input type="button" value = "Thêm công tác" onclick="openPopupCongTac('A','B')" />
						<input type="button" value ="Xóa công tác" onclick="deleteCongTac('A','B')" />
					
				</td>
			</tr>
			<tr>
				<td>
					<c:choose>
						<c:when test="${not empty ChiTietKHDT.id}">
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
					
						<input type="button" value = "Thêm công tác" onclick="openPopupCongTac('B','A')" />
						<input type="button" value ="Xóa công tác" onclick="deleteCongTac('B','A')"/>
				</td>
			</tr>
		</table>
		<input type = "hidden" value = "0" id = "CountCongTacKhoaA"/>
		<input type = "hidden" value = "0" id = "CountCongTacKhoaB"/>
		<table>
			<tr>
				<td colspan="6">
				<c:if test = "${not empty ChiTietKHDT.tuNgay}">
					
							<a href="javascript: submitForm(0);">
								<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập nhật" border = "0" />
							</a>
							<a href="<%=Constant.PATH_RES.getString("iso.PhanCongTacTuanPath")%>?maChiTiet=${ChiTietKHDT.id}">
								<img src="<%=request.getContextPath()%>/images/buttom/phancttuan.png" alt="Phân công tác tuần" border = "0" />
							</a>
					
				</c:if>	
				</td>
			</tr>
		</table>
		<input type = "hidden" value = "" id = "txtBoSung" name = "BoSung"/>
		<input type = "hidden" value = "" id = "txtCapNhat" name = "actionType"/>
	</form>	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->	
</div>
</div>
</body>
</html>