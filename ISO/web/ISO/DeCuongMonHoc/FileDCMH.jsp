<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chon DCMH</title>
<script type="text/javascript">
	<% String[] listFile = DeCuongMonHocDAO.getListFile();%>
	function pageLoad()
	{
		timFile();
	}
	function timFile()
	{
		var patt = new RegExp(document.getElementById('txtTimKiem').value, "i");
		document.getElementById('cboTenFile').innerHTML = null;
		if(document.getElementById('txtTimKiem').value != '') 
		{
		<%
			for(int i=0;i<listFile.length;i++) {
				out.print("if('" + listFile[i] + "'.match(patt) != null) {");
				out.print("var option = new Option('" + listFile[i] + "', '" + listFile[i] + "');");
				out.print("document.getElementById('cboTenFile').add(option, undefined); }");
			}
		%>	
			if(document.getElementById('cboTenFile').options.length == 0)
			{
				var option = new Option('', 'Không có file nào');
				document.getElementById('cboTenFile').add(option, undefined);
			}
		}
		else
		{
		<%
			for(int i=0;i<listFile.length;i++) {
				out.print("var option = new Option('" + listFile[i] + "', '" + listFile[i] + "');");
				out.print("document.getElementById('cboTenFile').add(option, undefined);");
			}
		%>
		}	
	}
	function traVe()
	{
		window.returnValue = document.getElementById('cboTenFile').value;
		window.close();
	}
</script>
</head>
<body onload="pageLoad();">
	<table border="1">
		<tr align="center">
			<th colspan="3">Chọn đề cương môn học</th>
		</tr>
		<tr align="center">
			<td colspan="3">
				<input type = "text" id = "txtTimKiem" size="30"/>
				<input type = "button" value = "Tìm kiếm" onclick="timFile();"/>
			</td>
		</tr>
		<tr align="center">
			<td colspan="3">
				<select id = "cboTenFile" size="10">
					<option></option>
				</select>
			</td>
		</tr>
		<tr align="center">
			<td colspan="3">
				<input type = "button" value = "Xác nhận" onclick="traVe();"/>
				<input type = "button" value = "Đóng" onclick="window.close();"/>
			</td>
		</tr>
	</table>
</body>
</html>