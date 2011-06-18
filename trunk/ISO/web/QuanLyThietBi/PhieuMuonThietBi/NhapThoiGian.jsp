<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nhap thoi gian</title>
<script type="text/javascript">
var ngayMuon = window.dialogArguments;

function kiemTraThietBiMuon()
{
	var xmlhttp;
	var str = "";
	var thoiGianMuon = ngayMuon + ' ' + document.getElementById('cboGioMuon').value + ':' + document.getElementById('cboPhutMuon').value;
	var thoiGianTra = ngayMuon + ' ' + document.getElementById('cboGioTra').value + ':' + document.getElementById('cboPhutTra').value;
	if(window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
	  	xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
	  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
	  	if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
	    {
	    	str = xmlhttp.responseText;
	    }
	}
	xmlhttp.open("POST", <%="'" + request.getContextPath() + "'"%> + "/phieuMuonController?actionType=KiemTraThietBiMuon?thoiGianMuon=" + thoiGianMuon + "&thoiGianTra=" + thoiGianTra, true);
	xmlhttp.send();
	window.returnValue = str + '</>' + thoiGianMuon + '</>' + thoiGianTra;
	window.close();
}
</script>
</head>
<body>
<form>	
	<p align="center">
		<input type = "hidden" name = "txtNgayMuon" id = "txtNgayMuon"/>
		<table border="1">
			<tr style="background-color: transparent;">
				<td >
					<div style="font-weight: bold; font-style: inherit; color: blue;" align="center">Nhập thời gian mượn thiết bị</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<select name = "cboGioMuon" id = "cboGioMuon">
						<c:forEach var = "GioMuon" begin = "7" end = "20">
							<option value = "${GioMuon }" 
								<c:if test = "${GioMuon eq ChiTietPhieuMuon.gioMuon }">selected</c:if>>${GioMuon }</option>
						</c:forEach>
					</select>
					Giờ
					<select name = "cboPhutMuon" id = "cboPhutMuon">
						<c:forEach var = "PhutMuon" begin = "0" end = "55" step = "5">
							<option value = "${PhutMuon }" 
								<c:if test = "${PhutMuon eq ChiTietPhieuMuon.phutMuon }">selected</c:if>>${PhutMuon }</option>
						</c:forEach>
					</select>
					Phút
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td >
					<select name = "cboGioTra" id = "cboGioTra">
						<c:forEach var = "GioTra" begin = "7" end = "20">
							<option value = "${GioTra }" 
								<c:if test = "${GioTra eq ChiTietPhieuMuon.gioTra }">selected</c:if>>${GioTra }</option>
						</c:forEach>
					</select>
					Giờ
					<select name = "cboPhutTra" id = "cboPhutTra">
						<c:forEach var = "PhutTra" begin = "0" end = "55" step = "5">
							<option value = "${PhutTra }" 
								<c:if test = "${PhutTra eq ChiTietPhieuMuon.phutTra }">selected</c:if>>${PhutTra }</option>
						</c:forEach>
					</select>
					Phút
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align="center">
					<input type="button" value = "Xác nhận" onclick="kiemTraThietBiMuon();"/>
				</td>
			</tr>
		</table>
	</p>	
</form>	

</body>
</html>