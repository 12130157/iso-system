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
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><html>
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
var arrCongTac = new Array();
var duongDan = "";
	<%
	ChiTietKHDTModel chiTietKHDTModel = new ChiTietKHDTModel();
	if(request.getParameter("maChiTiet") != null)
		chiTietKHDTModel = ChiTietKHDTDAO.timChiTietKHDTByID(request.getParameter("maChiTiet"));
	else {
		chiTietKHDTModel = (ChiTietKHDTModel) request.getAttribute("chiTietKHDT");
		out.print("duongDan = 'ISO/PhanCongTacTuan/';");
	}
	%>
	function pageLoad()
	{
		var line = '\n';
		document.getElementById('Count1Sang').value = 0;
		document.getElementById('Count1Chieu').value = 0;
		
		document.getElementById('Count2Sang').value = 0;
		document.getElementById('Count2Chieu').value = 0;
		
		document.getElementById('Count3Sang').value = 0;
		document.getElementById('Count3Chieu').value = 0;
		
		document.getElementById('Count4Sang').value = 0;
		document.getElementById('Count4Chieu').value = 0;

		document.getElementById('Count5Sang').value = 0;
		document.getElementById('Count5Chieu').value = 0;

		document.getElementById('Count6Sang').value = 0;
		document.getElementById('Count6Chieu').value = 0;

		document.getElementById('Count7Sang').value = 0;
		document.getElementById('Count7Chieu').value = 0;
		<%
		String[] arr;
			if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList() != null) {
				ArrayList<NoiDungChiTietKHDTModel> noiDungList = chiTietKHDTModel.getNoiDungChiTietKHDTModelList();
				for(int i=0;i<noiDungList.size();i++) {
					out.print("var obj = new Object();");
					out.print("obj.index = " + i + ";");
					out.print("obj.id = " + noiDungList.get(i).getMaNoiDungChiTietKHDT() + ";");
					out.print("obj.thu = " + noiDungList.get(i).getThu() + ";");
					out.print("obj.buoi = " + noiDungList.get(i).getBuoi() + ";");
					out.print("obj.khoa = " + noiDungList.get(i).getKhoa() + ";");
					out.print("obj.maCongTac = " + noiDungList.get(i).getMaCongTac() + ";");
					out.print("obj.noiDung = '" + noiDungList.get(i).getNoiDungCongTac() + "';");
					out.print("obj.tinhTrangPhanCong = " + noiDungList.get(i).getTinhTrangPhanCong() + ";");
					out.print("arrCongTac[" + i + "] = obj;");
					out.print("if(obj.tinhTrangPhanCong == '1') {");
					out.print("if(obj.buoi == '1') {");
					out.print("themCongTac(obj.thu, 'Sang', 'Chieu', obj);}");
					out.print("else {");
					out.print("themCongTac(obj.thu, 'Chieu', 'Sang', obj);}");
					if(noiDungList.get(i).getGio() != null)
						out.print("document.getElementById('cboGio' + obj.id).value = " + noiDungList.get(i).getGio() + ";");
					if(noiDungList.get(i).getPhut() != null)
						out.print("document.getElementById('cboPhut' + obj.id).value = " + noiDungList.get(i).getPhut() + ";");
					if(noiDungList.get(i).getGhiChu() != null && !noiDungList.get(i).getGhiChu().equals("")) {
						arr = noiDungList.get(i).getGhiChu().split("\r\n");
						for(int j=0;j<arr.length;j++) {
							if(j == 0)
								out.print("document.getElementById('txt' + obj.id).value = '" + arr[j] + "';");
							else
								out.print("document.getElementById('txt' + obj.id).value += line + '" + arr[j] + "';");
						}
					}
					out.print("}");
				}
			}
		%>
	}
	function taoCboGio(cboGio, buoi)
	{
		if(buoi == 'Sang')
		{
			for(var i=0;i<12;i++)
			{
				var opt = new Option(i, i);
				document.getElementById(cboGio).add(opt, undefined);
			}
		}
		else
		{
			for(var i=12;i<24;i++)
			{
				var opt = new Option(i, i);
				document.getElementById(cboGio).add(opt, undefined);
			}
		}
	}
	function taoCboPhut(cboPhut)
	{
		for(var i=0;i<60;i++)
		{
			var opt = new Option(i, i);
			document.getElementById(cboPhut).add(opt, undefined);
		}
	}
	function getGiaTriBuoi(buoi)
	{
		if(buoi == 'Sang')
			return 1;
		else
			return 2;
	}
	function openPopupChonCongTac(iterator, buoiChinh, buoiPhu)
	{
		value = window.showModalDialog(duongDan + "ChonCongTac.jsp",arrCongTac,"dialogHeight: 400px; dialogWidth: 650px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;");
		if(value != null)
		{
			for(var i=0;i<value.length;i++)
			{
				var obj = new Object();
				obj = value[i];
				obj.buoi = getGiaTriBuoi(buoiChinh);
				obj.thu = iterator;
				obj.tinhTrangPhanCong = 1;
				themCongTac(iterator, buoiChinh, buoiPhu, obj);
				arrCongTac[obj.index] = obj;
			}
		}
	}
	function themCongTac(iterator, buoiChinh, buoiPhu, obj)
	{
		var table = document.getElementById('TablePhanCongTac');
		var rowThu = parseInt(document.getElementById('Thu' + iterator).rowIndex);
		if(buoiChinh == 'Sang')
			var row = rowThu;
		else
			var row = parseInt(document.getElementById('Buoi' + buoiChinh + iterator).rowIndex);
		var countChinh = parseInt(document.getElementById('Count' + iterator + buoiChinh).value);
		var countPhu = parseInt(document.getElementById('Count' + iterator + buoiPhu).value);
		table.insertRow(row + countChinh);
		var cell = 0;
		if(countChinh == 0)
		{
			if(buoiChinh == 'Sang')
			{
				table.rows[row + countChinh].insertCell(cell).innerHTML = table.rows[row + 1].cells[0].innerHTML;
				table.rows[row + countChinh].id = table.rows[row + 1].id;
				table.rows[row + countChinh].cells[cell++].rowSpan = countChinh + countPhu + 2 + 1;
				table.rows[row + 1].deleteCell(0);
				table.rows[row + countChinh].insertCell(cell).innerHTML = table.rows[row + 1].cells[0].innerHTML;
				table.rows[row + countChinh].cells[cell++].rowSpan = countChinh + 1 + 1;
				table.rows[row + 1].deleteCell(0);
			}
			else
			{
				table.rows[rowThu].cells[0].rowSpan = countChinh + countPhu + 2 + 1;
				table.rows[row + countChinh].insertCell(cell).innerHTML = table.rows[row + 1].cells[0].innerHTML;
				table.rows[row + countChinh].id = table.rows[row + 1].id;
				table.rows[row + countChinh].cells[cell++].rowSpan = countChinh + 1 + 1;
				table.rows[row + 1].deleteCell(0);
			}
		}
		else
		{
			table.rows[rowThu].cells[0].rowSpan = countChinh + countPhu + 2 + 1;
			if(buoiChinh == 'Sang')
				table.rows[rowThu].cells[1].rowSpan = countChinh + 1 + 1;
			else
				table.rows[row].cells[0].rowSpan = countChinh + 1 + 1;
		}
		table.rows[row + countChinh].insertCell(cell++).innerHTML = "<select id = 'cboGio" + obj.id + "' name = 'cboGio" + obj.id + "'></select>-<select id = 'cboPhut" + obj.id + "' name = 'cboPhut" + obj.id + "'></select>";
		taoCboGio('cboGio' + obj.id, buoiChinh);
		taoCboPhut('cboPhut' + obj.id);
		table.rows[row + countChinh].insertCell(cell++).innerHTML = obj.noiDung;
		table.rows[row + countChinh].insertCell(cell++).innerHTML = "<textarea id = 'txt" + obj.id + "' name = 'txt" + obj.id + "'></textarea>";
		table.rows[row + countChinh].insertCell(cell++).innerHTML = "<input type = 'hidden' value = 'MaNoiDungCongTac-" + obj.id + "-MaNoiDungCongTac'/><input type = 'checkbox' id = 'chkbox" +  iterator + buoiChinh + (countChinh+1) + "' onclick = \"clickCheckbox('chkbox" +  iterator + buoiChinh + (countChinh+1) + "');\" value = ''/>";
		countChinh++;
		document.getElementById('Count' + iterator + buoiChinh).value = countChinh;
	}
	function clickCheckbox(checkbox)
	{
		if(document.getElementById(checkbox).checked == true)
			document.getElementById(checkbox).value = "DeleteCongTac";
		else
			document.getElementById(checkbox).value = "";
	}
	function xoaCongTac(iterator, buoiChinh, buoiPhu)
	{
		var table = document.getElementById('TablePhanCongTac');
		var rowThu = parseInt(document.getElementById('Thu' + iterator).rowIndex);
		if(buoiChinh == 'Sang')
			var row = rowThu;
		else
			var row = parseInt(document.getElementById('Buoi' + buoiChinh + iterator).rowIndex);
		var countChinh = parseInt(document.getElementById('Count' + iterator + buoiChinh).value);
		var countPhu = parseInt(document.getElementById('Count' + iterator + buoiPhu).value);
		for(var i=row;i<row + countChinh;i++)
		{
			if(table.rows[i].innerHTML.match("DeleteCongTac") != null)
			{
				countChinh--;
				for(var j=0;j<arrCongTac.length;j++)
				{
					var obj = new Object();
					obj = arrCongTac[j];
					if(table.rows[i].innerHTML.match('MaNoiDungCongTac-' + obj.id + '-MaNoiDungCongTac') != null)
					{
						obj = arrCongTac[j];
						obj.tinhTrangPhanCong = 0;
						obj.buoi = null;
						obj.thu = null;
						obj.ngay = null;
						obj.ghiChu = '';
						arrCongTac[j] = obj;
						break;
					}
				}
				if(row == i)
				{
					table.rows[i + 1].id = table.rows[row].id;
					table.rows[i + 1].insertCell(0).innerHTML = table.rows[row].cells[0].innerHTML;
					if(buoiChinh == 'Sang')
						table.rows[i + 1].insertCell(1).innerHTML = table.rows[row].cells[1].innerHTML;
				}
				table.deleteRow(i);
				table.rows[rowThu].cells[0].rowSpan = countChinh + countPhu + 2;
				if(buoiChinh == 'Sang')
					table.rows[row].cells[1].rowSpan = countChinh + 1;
				else
					table.rows[row].cells[0].rowSpan = countChinh + 1;
				
				i--;
				
			}
		}
		document.getElementById('Count' + iterator + buoiChinh).value = countChinh;
	}
	function submitForm()
	{
		var str = "";
		if(arrCongTac.length > 0)
		{
			for(var i=0;i<arrCongTac.length;i++)
			{
				var obj = new Object();
				obj = arrCongTac[i];
				if(i == 0)
					str += obj.thu + "/" + obj.buoi + "/" + obj.tinhTrangPhanCong;
				else
					str += "-" + obj.thu + "/" + obj.buoi + "/" + obj.tinhTrangPhanCong;
			}
			document.getElementById('td').innerHTML = "<input type = 'hidden' value = '" + str + "' name = 'CongTac'/>";
		}
		document.forms["PhanCongTacTuan"].submit();
	}
	function guiCongTac()
	{
		document.getElementById('GuiCongTac').value = "GuiCongTac";
		submitForm();
	}
</script>
</head>
<body onload="pageLoad();">
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var = "ChiTietKHDT" value = "<%=chiTietKHDTModel %>" scope="session"></c:set>
	<c:set var = "TinhTrang" value = "<%=chiTietKHDTModel.getTinhTrangPhanCongTac() %>"></c:set>
		<c:if test="${not empty param.err}">
			<b class="error"> Lịch công tác chưa có đầy đủ thông tin (*) </b>
		</c:if>
		<c:if test="${not empty param.msg and param.msg eq 'ok'}">
			<b class="msg"> Công tác đã được lưu </b>
		</c:if>
		<c:if test="${not empty param.msg and param.msg eq 'sendOk'}">
			<b class="msg"> Lịch công tác đã được gửi </b>
		</c:if>
	<table style="background-color: transparent;" width="800">
		<tr style="background-color: transparent;" align="center">
			<td><div class = "div_tieude">LỊCH PHÂN CÔNG TÁC TUẦN</div></td>
		</tr>
	</table><br /><br />
	<form action="<%=request.getContextPath()%>/phanCongTacTuanController" method="post" name = "PhanCongTacTuan">
		<table id = "TablePhanCongTac" border="1" style="background-color: transparent;">
			<tr style="background-color: transparent;" align="center">
				<th style="background-color: #AFEEEE">Thứ</th>
				<th style="background-color: #AFEEEE">Buổi</th>
				<th style="background-color: #AFEEEE">Thời gian</th>
				<th style="background-color: #AFEEEE">Nội dung công tác
				<input type="hidden" value = "0" id = "Count1Sang"/>
				<input type="hidden" value = "0" id = "Count1Chieu"/>
				<input type="hidden" value = "0" id = "Count2Sang"/>
				<input type="hidden" value = "0" id = "Count2Chieu"/>
				<input type="hidden" value = "0" id = "Count3Sang"/>
				<input type="hidden" value = "0" id = "Count3Chieu"/>
				<input type="hidden" value = "0" id = "Count4Sang"/>
				<input type="hidden" value = "0" id = "Count4Chieu"/>
				<input type="hidden" value = "0" id = "Count5Sang"/>
				<input type="hidden" value = "0" id = "Count5Chieu"/>
				<input type="hidden" value = "0" id = "Count6Sang"/>
				<input type="hidden" value = "0" id = "Count6Chieu"/>
				<input type="hidden" value = "0" id = "Count7Sang"/>
				<input type="hidden" value = "0" id = "Count7Chieu"/>
				</th>
				<th style="background-color: #AFEEEE">Ghi chú</th>
				<th style="background-color: #AFEEEE" id = "td"></th>
			</tr>
			<tr style="background-color: transparent;" align="center" id = "Thu1">
				<td rowspan="2">Hai</td>
				<td>Sáng</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						onclick="openPopupChonCongTac(1,'Sang', 'Chieu');"/>
					<input type = "button" value = "Xóa công tác" 
						onclick="xoaCongTac(1,'Sang', 'Chieu');"/>
				</td>
			</tr>
			<tr style="background-color: transparent;" align="center" id = "BuoiChieu1">
				<td>Chiều</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						onclick="openPopupChonCongTac(1,'Chieu', 'Sang');"/>
					<input type = "button" value = "Xóa công tác" 
						onclick="xoaCongTac(1,'Chieu', 'Sang');"/>
				</td>
			</tr>
			
			<tr style="background-color: transparent;" align="center"  id = "Thu2">
				<td rowspan="2">Ba</td>
				<td>Sáng</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						onclick="openPopupChonCongTac(2,'Sang', 'Chieu');"/>
					<input type = "button" value = "Xóa công tác" 
						onclick="xoaCongTac(2,'Sang', 'Chieu');"/>
				</td>
			</tr>
			<tr style="background-color: transparent;" align="center"  id = "BuoiChieu2">
				<td>Chiều</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						onclick="openPopupChonCongTac(2,'Chieu', 'Sang');"/>
					<input type = "button" value = "Xóa công tác" 
						onclick="xoaCongTac(2,'Chieu', 'Sang');"/>
				</td>
			</tr>
			
			<tr style="background-color: transparent;" align="center"  id = "Thu3">
				<td rowspan="2">Tư</td>
				<td>Sáng</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						onclick="openPopupChonCongTac(3,'Sang', 'Chieu');"/>
					<input type = "button" value = "Xóa công tác" 
						onclick="xoaCongTac(3,'Sang', 'Chieu');"/>
				</td>
			</tr>
			<tr style="background-color: transparent;" align="center"  id = "BuoiChieu3">
				<td>Chiều</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						onclick="openPopupChonCongTac(3,'Chieu', 'Sang');"/>
					<input type = "button" value = "Xóa công tác" 
						onclick="xoaCongTac(3,'Chieu', 'Sang');"/>
				</td>
			</tr>
			
			<tr style="background-color: transparent;" align="center"  id = "Thu4">
				<td rowspan="2">Năm</td>
				<td>Sáng</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						onclick="openPopupChonCongTac(4,'Sang', 'Chieu');"/>
					<input type = "button" value = "Xóa công tác" 
						onclick="xoaCongTac(4,'Sang', 'Chieu');"/>
				</td>
			</tr>
			<tr style="background-color: transparent;" align="center"  id = "BuoiChieu4">
				<td>Chiều</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						
						onclick="openPopupChonCongTac(4,'Chieu', 'Sang');"/>
					<input type = "button" value = "Xóa công tác" 
						
						onclick="xoaCongTac(4,'Chieu', 'Sang');"/>
				</td>
			</tr>
			
			<tr style="background-color: transparent;" align="center"  id = "Thu5">
				<td rowspan="2">Sáu</td>
				<td>Sáng</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						
						onclick="openPopupChonCongTac(5,'Sang', 'Chieu');"/>	
					<input type = "button" value = "Xóa công tác" 
						
						onclick="xoaCongTac(5,'Sang', 'Chieu');"/>
				</td>
			</tr>
			<tr style="background-color: transparent;" align="center"  id = "BuoiChieu5">
				<td>Chiều</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						
						onclick="openPopupChonCongTac(5,'Chieu', 'Sang');"/>
					<input type = "button" value = "Xóa công tác" 
						
						onclick="xoaCongTac(5,'Chieu', 'Sang');"/>
				</td>
			</tr>
			
			<tr style="background-color: transparent;" align="center"  id = "Thu6">
				<td rowspan="2">Bảy</td>
				<td>Sáng</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						
						onclick="openPopupChonCongTac(6,'Sang', 'Chieu');"/>
					<input type = "button" value = "Xóa công tác" 
						
						onclick="xoaCongTac(6,'Sang', 'Chieu');"/>
				</td>
			</tr>
			<tr style="background-color: transparent;" align="center"  id = "BuoiChieu6">
				<td>Chiều</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						
						onclick="openPopupChonCongTac(6,'Chieu', 'Sang');"/>
					<input type = "button" value = "Xóa công tác" 
						
						onclick="xoaCongTac(6,'Chieu', 'Sang');"/>
				</td>
			</tr>
			
			<tr style="background-color: transparent;" align="center"  id = "Thu7">
				<td rowspan="2">Chủ nhật</td>
				<td>Sáng</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						
						onclick="openPopupChonCongTac(7,'Sang', 'Chieu');"/>
					<input type = "button" value = "Xóa công tác" 
						
						onclick="xoaCongTac(7,'Sang', 'Chieu');"/>
				</td>
			</tr>
			<tr style="background-color: transparent;" align="center"  id = "BuoiChieu7">
				<td>Chiều</td>
				<td colspan="4">
					<input type = "button" value = "Chọn công tác" 
						
						onclick="openPopupChonCongTac(7,'Chieu', 'Sang');"/>
					<input type = "button" value = "Xóa công tác" 
						
						onclick="xoaCongTac(7,'Chieu', 'Sang');"/>
				</td>
			</tr>
		</table>
		<table><tr><td>
		<div class = "div_khung">	
			Ghi chú<br />
			<textarea name = "txtGhiChu" style="background-color: transparent;" cols="90" rows="5">${ChiTietKHDT.ghiChu}</textarea>
		</div>
		</td></tr></table>
		<table>	
			<tr  style="background-color: transparent;">
				<td colspan="6">
							<a href="javascript: submitForm();">
								<img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu" border = "0" />
							</a>
							<a href="javascript: guiCongTac();">
								<input type="hidden" id = "GuiCongTac" name="GuiCongTac"/>
								<img src="<%=request.getContextPath()%>/images/buttom/guilichct.png" alt="Xuất File" border = "0" />
							</a>
							<a href="/HungVuongISO/ISO/PhanCongTacTuan/PrintLichCongTacTuan.jsp?maChiTiet=${ChiTietKHDT.id}">
								<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
							</a>
					<!--<c:choose>
						<c:when test="${TinhTrang eq 0 or TinhTrang eq null}">
							-->
						<!--</c:when>
						<c:otherwise>
							-->
							
						<!--</c:otherwise>
					</c:choose>
				--></td>
			</tr>
		</table>
	</form>	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->	
</div>
</div>
</body>
</html>