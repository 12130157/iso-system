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
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.CongTacThangModel"%>
<%@page import="vn.edu.hungvuongaptech.model.TinhTrangCongTacModel"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachThangModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachThangDAO"%><html>
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

<title>Kế hoạch công tác tuần</title>
<script language="JavaScript" type="text/javascript">
var duongDan = "";
var objTuan;
var count = 0;
var arrCongTac = new Array();
var soTuan = 4;
	<%
		String namHeThong = SysParamsDAO.getNamHeThong();
		int soTuan = 4;
		KeHoachThangModel keHoachThang = new KeHoachThangModel();
		
		if(request.getParameter("maID") != null) {
			keHoachThang = KeHoachThangDAO.getKeHoachThangByID(request.getParameter("maID"));
		} 
		if(request.getAttribute("keHoachThang") != null){
			keHoachThang = (KeHoachThangModel) request.getAttribute("keHoachThang");
			out.print("duongDan = 'ISO/KeHoachCongTacThang/';");
		}
		if(keHoachThang.getMaKeHoachThang() != null)
			soTuan = TuanLeDAO.getSoTuanByThangAndNam(keHoachThang.getThang(), keHoachThang.getNam());
	%>
	function pageLoad()
	{
		document.getElementById('TotalCongTac').value = 0;
		soTuan = <%=soTuan%>;
		var line = '\n';
		var dauNhay = '\'';
		var dauNhay1 = '\"';
		<%
		String [] arrStr1, arrStr2, arrStr;
		ArrayList<CongTacThangModel> congTacThangList = new ArrayList<CongTacThangModel>();
		ArrayList<TinhTrangCongTacModel> tinhTrangCongTacList = new ArrayList<TinhTrangCongTacModel>();
		if(keHoachThang.getCongTacThangList() != null) {
			
			congTacThangList = keHoachThang.getCongTacThangList();
			for(int j=0;j<congTacThangList.size();j++) {
				CongTacThangModel congTacThang = congTacThangList.get(j);
				out.print("var objCongTac = new Object();");
				out.print("objCongTac.maCongTac = " + congTacThang.getMaCongTac() + ";");
				
				congTacThang.setNoiDungCongTac(congTacThang.getNoiDungCongTac().replaceAll("'", "-DAUNHAY-"));
				congTacThang.setNoiDungCongTac(congTacThang.getNoiDungCongTac().replaceAll("\"", "-DAUNHAY1-"));
				arrStr = congTacThang.getNoiDungCongTac().split("\r\n");
				for(int k=0;k<arrStr.length;k++) {
					if(k == 0)
						out.print("objCongTac.noiDung = '" + arrStr[k] + "';");
					else
						out.print("objCongTac.noiDung += line + '" + arrStr[k] + "';");
				}
				out.print("objCongTac.noiDung = objCongTac.noiDung.replace(/-DAUNHAY-/gi,dauNhay);");
				out.print("objCongTac.noiDung = objCongTac.noiDung.replace(/-DAUNHAY1-/gi,dauNhay1);");
			
				out.print("arrCongTac[count++] = objCongTac;");
				out.print("themCongTac(objCongTac);");
				
					congTacThang.setBoPhanThucHien(congTacThang.getBoPhanThucHien().replaceAll("'", "-DAUNHAY-"));
					congTacThang.setBoPhanThucHien(congTacThang.getBoPhanThucHien().replaceAll("\"", "-DAUNHAY1-"));
					congTacThang.setGhiChu(congTacThang.getGhiChu().replaceAll("'", "-DAUNHAY-"));
					congTacThang.setGhiChu(congTacThang.getGhiChu().replaceAll("\"", "-DAUNHAY1-"));
					arrStr1 = congTacThang.getBoPhanThucHien().split("\r\n");
					arrStr2 = congTacThang.getGhiChu().split("\r\n");
					for(int k=0;k<arrStr1.length;k++) {
						if(k == 0)
							out.print("document.getElementById('txtBoPhanThucHien' + objCongTac.maCongTac).value = '" + arrStr1[k] + "';");
						else
							out.print("document.getElementById('txtBoPhanThucHien' + objCongTac.maCongTac).value += line + '" + arrStr1[k] + "';");
					}
					out.print("document.getElementById('txtBoPhanThucHien' + objCongTac.maCongTac).value = document.getElementById('txtBoPhanThucHien' + objCongTac.maCongTac).value.replace(/-DAUNHAY-/gi,dauNhay);");
					out.print("document.getElementById('txtBoPhanThucHien' + objCongTac.maCongTac).value = document.getElementById('txtBoPhanThucHien' + objCongTac.maCongTac).value.replace(/-DAUNHAY1-/gi,dauNhay1);");
				
				for(int k=0;k<arrStr2.length;k++) {
					if(k == 0)
						out.print("document.getElementById('txtGhiChu' + objCongTac.maCongTac).value = '" + arrStr2[k] + "';");
					else
						out.print("document.getElementById('txtGhiChu' + objCongTac.maCongTac).value += line + '" + arrStr2[k] + "';");
				}
				out.print("document.getElementById('txtGhiChu' + objCongTac.maCongTac).value = document.getElementById('txtGhiChu' + objCongTac.maCongTac).value.replace(/-DAUNHAY-/gi,dauNhay);");
				out.print("document.getElementById('txtGhiChu' + objCongTac.maCongTac).value = document.getElementById('txtGhiChu' + objCongTac.maCongTac).value.replace(/-DAUNHAY1-/gi,dauNhay1);");
				
				
				
				out.print("var arrTinhTrang = new Array();");
				tinhTrangCongTacList = congTacThang.getTinhTrangCongTacList();
				for(int k = 0; k <tinhTrangCongTacList.size();k++) {
					TinhTrangCongTacModel tinhTrangCongTac = tinhTrangCongTacList.get(k);
					out.print("document.getElementById('Check' + objCongTac.maCongTac + '_" + tinhTrangCongTac.getThuTuTuan() + "').checked = true;");
					out.print("document.getElementById('txtCongTacTuan' + objCongTac.maCongTac + '_" + tinhTrangCongTac.getThuTuTuan() + "').value = '1';");
				}
				
			}
		}
								
		%>
		
	}
	function openPopupCongTac()
	{
		var index = arrCongTac.length;
		var value = window.showModalDialog(duongDan + "ThemCongTac.jsp",arrCongTac,"dialogHeight: 450px; dialogWidth: 800px; dialogTop: 150px; dialogLeft: 400px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;");
		if(value != null)
		{
			for(var i=index;i<value.length;i++)
			{
				arrCongTac[count++] = value[i];	
				themCongTac(value[i]);
			}
		}
	}
	function xuLyCheckbox(str)
	{
		if(document.getElementById('Check' + str).checked == true)
			document.getElementById('Check' + str).value = 'DeleteCongTac';
		else
			document.getElementById('Check' + str).value = '';
	}
	function deleteCongTac()
	{
		var table = document.getElementById('TableKeHoachThang');
		var row = parseInt(document.getElementById('TotalCongTac').value);
		var index = 0;
		var check = 0;
		var demDongXoa = 0;
		for(var i=0;i< row;i++)
		{
			if(table.rows[i + 2].innerHTML.match('DeleteCongTac') != null)
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
					table.deleteRow(i + 2);
					arrCongTac.splice(i);
					i--;
					row--;
				}
			}
		}
		document.getElementById('TotalCongTac').value = row;
		if(check == 0)
			alert("Hãy chọn công tác cần xóa!!!");
	}
	function themCongTac(objCongTac) 
	{
		var table = document.getElementById('TableKeHoachThang');
		var row = parseInt(document.getElementById('TotalCongTac').value);
		var tr = table.insertRow(row + 2);
		tr.insertCell(0).innerHTML = "<input type = 'checkbox' id = 'Check" + objCongTac.maCongTac + "' onclick = 'xuLyCheckbox(" + objCongTac.maCongTac + ")'/><input type = 'hidden' value = '' id = 'Checkbox" + objCongTac.maCongTac + "'/>";
		tr.insertCell(1).innerHTML = row + 1;
		tr.insertCell(2).innerHTML = objCongTac.noiDung;
		tr.insertCell(3).innerHTML = "<textarea name = 'txtBoPhanThucHien" + objCongTac.maCongTac + "' id = 'txtBoPhanThucHien" + objCongTac.maCongTac + "'></textarea>";
		for(var i=0;i<soTuan;i++)
		{
			tr.insertCell(4 + i).innerHTML = "<input type = 'checkbox' id = 'Check" + objCongTac.maCongTac + "_" + (i+1) + "' onclick = 'chonTuan(" + objCongTac.maCongTac + "," + (i+1) + ")'/><input type = 'hidden' id = 'txtCongTacTuan" + objCongTac.maCongTac + "_" + (i+1) + "' name = 'txtCongTacTuan" + objCongTac.maCongTac + "_" + (i+1) + "' value = '0'/>";
		}
		tr.insertCell(4 + soTuan).innerHTML = "<textarea id = 'txtGhiChu" + objCongTac.maCongTac + "' name = 'txtGhiChu" + objCongTac.maCongTac + "'></textarea>";
		document.getElementById('TotalCongTac').value = row + 1;
	}
	function chonTuan(maCongTac, thuTuTuan)
	{
		if(document.getElementById('Check' + maCongTac + '_' + thuTuTuan).checked == true)
			document.getElementById('txtCongTacTuan' + maCongTac + '_' + thuTuTuan).value = '1';
		else
			document.getElementById('txtCongTacTuan' + maCongTac + '_' + thuTuTuan).value = '0';
	}
	function submitForm(x)
	{	
		if(x == 1)
			document.getElementById('actionType').value = 'TaoMoi';
		else if(x == 2)
			document.getElementById('actionType').value = 'CapNhat';
		var td = document.getElementById('td');
			if(arrCongTac.length > 0) {
				var strCongTac = "";
				for(var i=0;i<arrCongTac.length;i++)
				{
					var objCongTac = arrCongTac[i];
					if(i < arrCongTac.length - 1)
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung + "<->";
					else
						strCongTac += objCongTac.maCongTac + "</>" + objCongTac.noiDung;
				}
				strCongTac = "<input type = 'hidden' value = '" + strCongTac + "' name = 'MangCongTac'/>";
			}
		td.innerHTML = strCongTac;
		document.forms["KeHoachThang"].submit();
	}
	function confirmSending() {
		if (confirm('Bạn có chắc muốn gửi kế hoạch tháng không ?')) {
			document.getElementById('actionType').value = 'GuiHieuTruong';
			submitForm(0);
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
			document.forms["Duyet1KeHoachThang"].submit();	
	}
	function checkOrUncheckAll()
	{
		if(document.getElementById('CheckAll').checked == true)
		{
			for(var i=0;i<arrCongTac.length;i++)
			{
				document.getElementById('Check' + arrCongTac[i].maCongTac).checked = true;
				document.getElementById('Checkbox' + arrCongTac[i].maCongTac).value = 'DeleteCongTac';
			}
		}
		else
		{
			for(var i=0;i<arrCongTac.length;i++)
			{
				document.getElementById('Check' + arrCongTac[i].maCongTac).checked = false;
				document.getElementById('Checkbox' + arrCongTac[i].maCongTac).value = '';
			}
		}
	}
</script>
</head>
<body onload="pageLoad();">
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var = "KeHoachThang" value = "<%=keHoachThang %>" scope="session"></c:set>
	
		<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>		
		<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
		<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
		<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
		<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
		
		<c:set var = "NEW" value = "<%= Constant.TINHTRANG_NEW %>"></c:set>
		<c:set var = "PENDING" value = "<%= Constant.TINHTRANG_SEND %>"></c:set>
		<c:set var = "REJECT" value = "<%= Constant.TINHTRANG_REJECT %>"></c:set>
		<c:set var = "APPROVE" value = "<%= Constant.TINHTRANG_APPROVE %>"></c:set>
		<c:set var = "BOSUNG" value = "<%= Constant.TINHTRANG_BO_SUNG %>"/>
		
		<c:if test="${not empty param.err}">
			<b class="error"> Nhập liệu vào các ô bắt buộc (*) </b>
		</c:if>
		<c:if test="${not empty param.TaoMoi and param.TaoMoi eq 'OK'}">
			<b class="msg"> Thêm mới "KẾ HOẠCH THÁNG" thành công </b>
		</c:if>
		<c:if test="${(not empty param.CapNhat and param.CapNhat eq 'OK')}">
			<b class="msg"> Cập nhật "KẾ HOẠCH THÁNG" thành công </b>
		</c:if>	
		<c:if test="${(not empty param.CapNhatThatBai and param.CapNhatThatBai eq 'OK')}">
			<b class="msg"> Cập nhật "KẾ HOẠCH THÁNG" thất bại </b>
		</c:if>
		<c:if test="${(not empty param.TaoMoiThatBai and param.TaoMoiThatBai eq 'OK')}">
			<b class="msg"> Thêm mới "KẾ HOẠCH THÁNG" thất bại </b>
		</c:if>
		<c:if test="${(not empty param.Trung and param.Trung eq 'OK')}">
			<b class="msg"> KẾ HOẠCH THÁNG này đã có rồi </b>
		</c:if>		
		
	<c:choose>	
		<c:when test = "${empty KHDTObj.maNguoiTao}">
			<c:set var = "Row" value = "0" scope="session"/>
		</c:when>
		<c:otherwise>
			<c:set var = "Row" value = "<%=keHoachThang.getCongTacThangList().size()%>" scope="session"/>
		</c:otherwise>
	</c:choose>	
	
	<form action="<%=request.getContextPath()%>/keHoachThangController?them=ok" method="post" name = "KeHoachThang">
		<table style="background-color: transparent;" width="800" border="1">
			<tr style="background-color: transparent;" align="center">
				<td>ỦY BAN NHÂN DÂN QUẬN 5<BR/> TRƯỜNG TCN CN HÙNG VƯƠNG<BR/>_______________</td>
				<td>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<BR/>Độc lập-Tự do-Hạnh phúc<BR/>_______________________</td>
			</tr>
		</table><br /><br />
		<c:set var = "NamHeThong" value = "<%=namHeThong %>"/>
		<div class="tieu_de">KẾ HOẠCH CÔNG TÁC THÁNG
			<select name = "cboThang">
				<c:forEach var = "Thang" begin="1" end="12">
					<option value = "${Thang}" <c:if test="${KeHoachThang.thang eq Thang }">selected</c:if>>${Thang}</option>
				</c:forEach>
			</select>
			NĂM 
			<select name="cboNam">
				<option value = "${NamHeThong-1}" <c:if test="${KeHoachThang.nam eq NamHeThong-1 }">selected</c:if>>${NamHeThong-1}</option>
				<option value = "${NamHeThong}" <c:if test="${KeHoachThang.nam eq NamHeThong }">selected</c:if>>${NamHeThong}</option>
				<option value = "${NamHeThong+1}" <c:if test="${KeHoachThang.nam eq NamHeThong+1 }">selected</c:if>>${NamHeThong+1}</option>
			</select>
		</div>
		<table border = 1 style="background-color: transparent;" id = "TableKeHoachThang" name = "TableKeHoachThang">
		  	<tr style="background-color: transparent;" align="center">
		  		<td rowspan="2" id = "td"><input type = "checkbox" id = "CheckAll" onclick = "checkOrUncheckAll();"/></td>
				<td rowspan="2">STT</td>
				<td width="400" rowspan="2">Nội dung thực hiện</td>
				<td rowspan="2">Bộ phận thực hiện</td>
				<td colspan="<%=soTuan %>">Thời gian thực hiện/tuần</td>
				<td rowspan="2">Ghi chú</td>
			</tr>
			<tr style="background-color: transparent;" align="center">
				<c:forEach var = "Tuan" begin="1" end="<%=soTuan %>">
					<td>${Tuan}</td>
				</c:forEach>
			</tr>
			<c:if test = "${not empty KeHoachThang.maKeHoachThang}">
				<tr style="background-color: transparent;" align="center">
					<td colspan="<%=soTuan + 5 %>">
						<input type = "button" value = "Thêm công tác" onclick="openPopupCongTac();"/>
						<input type = "button" value = "Xóa công tác" onclick="deleteCongTac();"/>
					</td>
				</tr>
			</c:if>
		</table>
		<table style="background-color: transparent;" id = "TableKeHoachThang" name = "TableKeHoachThang">
			<tr align="left"><td>Nơi nhận :</td></tr>
			<tr align="left">
				<td colspan="3">
					<TEXTAREA rows="5" cols="70" name = "txtNoiNhan">${KeHoachThang.noiNhan}</TEXTAREA>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="6">
				<c:choose>
					<c:when test = "${not empty KeHoachThang.maKeHoachThang}">
						<a href="javascript: submitForm(2);">
							<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập nhật" border = "0" />
						</a>
					</c:when>
					<c:otherwise>
						<a href="javascript: submitForm(1);">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Tạo mới" border = "0" />
						</a>
					</c:otherwise>	
				</c:choose>
				
				<input type = "hidden" value = "" id = "TotalCongTac" name = "TotalCongTac"/>
				<input type = "hidden" id = "SoTuan" name = "SoTuan" value = "<%=soTuan %>"/>
				
				<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and KeHoachThang.tinhTrang eq PENDING}">
					<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Approve" /> </a>
				</c:if>
				<c:if test="${KeHoachThang.tinhTrang eq NEW 
										and ((MaBoPhan eq BO_PHAN_PHC and maThanhVien eq KeHoachThang.maNguoiTao) or MaBoPhan eq BO_PHAN_ADMIN)}">
					<a href = "javascript: confirmSending()">
						<img src="<%=request.getContextPath()%>/images/buttom/guihieutruong.png" alt="Gửi Hiệu Trưởng" border = "0" />
					</a>
				</c:if>	
				<c:if test="${KeHoachThang.tinhTrang eq APPROVE }">	
					<c:if test="${(MaBoPhan eq BO_PHAN_PHC and maThanhVien eq KeHoachThang.maNguoiTao) or MaBoPhan eq BO_PHAN_ADMIN}">						
						<a href = "<%=Constant.PATH_RES.getString("iso.InKeHoachThangPath") %>">								 
							<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
						</a>
					</c:if>
				</c:if>
				<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and KeHoachThang.tinhTrang eq PENDING}">
					<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" /> </a>
				</c:if>
			</td>
		</tr>
	</table>
		<input type="hidden" value = "0" name="txtHidden" id = "txtHidden"/>
		<input type = "hidden" name = "actionType" id = "actionType" value = ""/>
	</form>	
	<form method="post" action="<%=request.getContextPath()%>/keHoachThangController?duyet1kehoach=yes&maKeHoachThang=${KeHoachThang.maKeHoachThang}" name="Duyet1KeHoachThang">	
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