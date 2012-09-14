<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lý do reject Dialog</title>
<script language="JavaScript" type="text/javascript">
	var arg = window.dialogArguments;
	function closeWindow()
	{
		window.close();
		window.returnValue = false;
	}
	
	function pageLoad(){
		document.getElementById("LyDoReject").value = arg.valueContent;
		document.title = arg.titleContent;
		if (arg.quyen == "false") {
			document.getElementById("Reject").disabled = true;
		}
	}
	
	function confirm()
	{
		if(document.getElementById('LyDoReject').value == '')
		{
			alert("Hãy nhập lý do reject");
			return false;
		}
		else
		{
			window.returnValue = document.getElementById('LyDoReject').value;
		}
		window.close();
	}
</script>
</head>
<body onload="pageLoad()">
	<form name="KHDT-Reject">
		<table width="200" >
			<th colspan="2">Nhập lý do reject</th>
			<tr><td colspan="2"><textarea rows="5" cols="30" name="areaLyDoReject" id="LyDoReject"></textarea> </td></tr>
			<tr align="center">
				<td>
					<input type="button" value = "  OK  " name = "Reject" onclick="return confirm();"/>
				</td>
				<td>	
					<input type="button" value="Cancel" onclick="closeWindow();"/> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>