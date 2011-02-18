<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Môn Học</title>
<script language="JavaScript" type="text/javascript">
var monHocList = window.dialogArguments;
	function listMonHoc()
	{
		for(var i=0;i<monHocList.length;i++)
		{
			var opt = new Option(monHocList[i].tenMonHoc,monHocList[i].maMonHoc);
			document.getElementById('MonHocList').add(opt, undefined);
		}
	}
	function closeWindow()
	{
		window.close();
	}
	function confirm()
	{
		if(document.getElementById('MonHocList').value == '')
		{
			alert("Hãy chọn môn học");
			return false;
		}
		else
		{
			window.returnValue = document.getElementById('MonHocList').value;
		}
		window.close();
	}
</script>
</head>
<body onload="listMonHoc();">
	<form>
		<table width="200" >
			<th colspan="2">Chọn môn học cần xóa</th>
			<tr><td colspan="2"><select id = "MonHocList">
				<option value="">--Select--</option>
			</select></td></tr>
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