<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NoiDungChiTietKHDTDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chọn lịch công tác tuần</title>
<script language="JavaScript" type="text/javascript">
var arr = window.dialogArguments;
	function pageLoad()
	{
		var check;
		if(arr.length > 0)
		{
			for(var i=0;i<arr.length;i++)
			{
				var obj = new Object();
				obj = arr[i];
				if(obj.tinhTrangPhanCong != 1) {
					var opt = new Option(obj.noiDung, obj.id + "-" + obj.index);
					document.getElementById('cboCongTac').add(opt, undefined);
				}
			}
		}
	}
	function closeWindow()
	{
		window.close();
	}
	function confirmChonCongTac()
	{
		var giaTriTraVe = new Array();
		var count = 0;
		for(var i=0;i<document.getElementById('cboCongTac').length;i++) 
		{
			if(document.getElementById('cboCongTac').options[i].selected == true)
			{
				var obj = new Object();
				var value = document.getElementById('cboCongTac').options[i].value.split("-");
				obj.index = value[1];
				obj.id = value[0];
				obj.noiDung = document.getElementById('cboCongTac').options[i].text;
				giaTriTraVe[count] = obj;
				count++;
			}
		}	
		if(count > 0)
		{
			window.returnValue = giaTriTraVe;
			closeWindow();	
		}		
		else
			alert("Hãy chọn ít nhất 1 công tác");
	}
</script>
</head>
<body onload="pageLoad();">
	<table border="1">
		<tr style="background-color: transparent;" align="center">
			<td style="background-color: aqua;"> Chọn lịch công tác tuần
			</td>
		</tr>
		<tr style="background-color: transparent;" align="center">
			<td>
				<div style="overflow: scroll; width: 600px">
					<select size="20" multiple="multiple" id = "cboCongTac"></select>
				</div>
			</td>
		</tr>
		<tr style="background-color: transparent;" align="center">
			<td>
				<input type="button" value="OK" onclick="confirmChonCongTac();"/>
				<input type="button" value="Cancel" onclick="closeWindow();"/>
			</td>
		</tr>
	</table>
</body>
</html>