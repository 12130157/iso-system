<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nhập form</title>
<script language="JavaScript" type="text/javascript">
var text = window.dialogArguments;
	function closeWindow()
	{
		window.close();
		window.returnValue = false;
	}
	function pageLoad()
	{
		document.getElementById('areaInput').value = text;
	}
	function confirm()
	{
	
		if(document.getElementById('areaInput').value == '')
		{
			alert("Hãy nhập giá trị cho form");
			return false;
		}
		else
		{
			window.returnValue = document.getElementById('areaInput').value;
		}
		window.close();
	}
		
</script>
</head>
<body style="text-align:center;margin:0 auto;" onload="pageLoad()">
	<form name="KHDT-Reject">
		<table width="400">
			<th colspan="2">Nhập dữ liệu cho <b><font id="titleContent">Mục tiêu</font></b></th>
			<tr>
				<td colspan="2">
					<textarea rows="20" cols="50" name="areaInput" id="areaInput"></textarea> 
				</td>
			</tr>
			<tr align="center">
				<td>
					<input type="button" value = "  OK  " name = "OK" onclick="return confirm();"/>
				</td>
				<td>	
					<input type="button" value="Cancel" onclick="closeWindow();"/> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>