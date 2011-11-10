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
		var str = document.getElementById('areaInput').value;
		if(str == '')
		{
			alert("Hãy nhập giá trị cho form");
			return false;
		}
		else
		{
			var arrStr = str.split("\n");
			str = "";
			
			for(var i=0;i<arrStr.length;i++)
			{
				str += arrStr[i] + "<--->";
			} 
			var xmlhttp;
			if (window.XMLHttpRequest)
			{// code for IE7+, Firefox, Chrome, Opera, Safari
			  	xmlhttp = new XMLHttpRequest();
			}
			else
			{// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			/*xmlhttp.onreadystatechange=function()
			{
			  	if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {/*alert("shsd");
				    if(xmlhttp.responseText == '1')
			  			//window.returnValue = str;
			  			alert("ok");
			  		else
				  		alert("fail");
			    }
			}*/
			xmlhttp.open("POST",<%="'" + request.getContextPath() + "'"%> + "/soLenLopController?str="+str+"&maCT=" + <%="'" + request.getParameter("maCT") + "'"%>,true);
			xmlhttp.send();
		}
		window.returnValue = document.getElementById('areaInput').value;
		window.close();
	}
		
</script>
</head>
<body style="text-align:center;margin:0 auto;" onload="pageLoad()">
	<form name="KHDT-Reject">
		<table width="400">
			<th colspan="2"><b><font id="titleContent">Nhập Nội dung bài dạy</font></b></th>
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