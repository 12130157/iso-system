<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.CongTacModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.CongTacDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="JavaScript" type="text/javascript">
var listCongTac = window.dialogArguments;
var cbo1;
var cbo2;
var giaTriTraVe = new Array();
var size = listCongTac.length;
var listObjectCongTac = new Array(); // mang obj cong tac duoc phan theo a-z
function pageLoad()
{
	cbo1 = document.getElementById('cboCongTacChuaAdd');
	cbo2 = document.getElementById('cboCongTacDaAdd');
	var check = true;
	var chuDau = "na";
	<%
		ArrayList<CongTacModel> congTacModelList = CongTacDAO.getAllCongTac();
		if(congTacModelList.size() > 0) {
			for(int i=0;i<congTacModelList.size();i++) {
				out.print("if(listCongTac.length > 0) {");
				out.print("for(var i=0;i<listCongTac.length;i++) {");
				out.print("if(listCongTac[i].maCongTac == " + congTacModelList.get(i).getMaCongTac() + ") {");
				out.print("check = false;");
				out.print("break; } } }");
				out.print("var opt = new Option('" + congTacModelList.get(i).getNoiDung() + "','" + congTacModelList.get(i).getMaCongTac() + "');");
				out.print("if(check == true) {");
				// tao mang obj cong tac
				out.print("if(chuDau != '" + congTacModelList.get(i).getNoiDung().charAt(0) + "') {");
				out.print("chuDau = '" + congTacModelList.get(i).getNoiDung().charAt(0) + "';");
				out.print("var obj = new Object();");
				out.print("obj.chuDau = chuDau;");
				out.print("var mang = new Array();");
				out.print("obj.mangCongTac = mang;");
				out.print("listObjectCongTac[listObjectCongTac.length] = obj;");
				out.print(" }");
				out.print("var objMang = new Object();");
				out.print("objMang.maCongTac = '" + congTacModelList.get(i).getMaCongTac() + "';");
				out.print("objMang.noiDung = '" + congTacModelList.get(i).getNoiDung() + "';");
				out.print("mang[mang.length] = objMang;");
				//
				out.print("cbo1.add(opt, undefined); }");
				out.print("else {");
				out.print("cbo2.add(opt, undefined); }");
				out.print("check = true;");
			}
		}
	%>
	if(cbo1.length == 0)
	{
		var opt = new Option('CongTac','');
		cbo1.add(opt, undefined);
	}
	if(cbo2.length == 0)
	{
		var opt = new Option('Thêm công tác','');
		cbo2.add(opt, undefined);
	}
}
function themCongTac() 
{
	if(cbo1.options[0].value != "")
	{
		if(cbo2.options[0].value == "")
			cbo2.innerHTML = "";
		for(var i=0;i<cbo1.length;i++) 
		{
			if(cbo1.options[i].selected == true)
			{
				var opt = new Option(cbo1.options[i].text,cbo1.options[i].value);
				cbo2.add(opt, undefined);
				cbo1.remove(i);
				i--;
			}
		}
		if(cbo1.length == 0)
		{
			var opt = new Option('Công tác','');
			cbo1.add(opt, undefined);
		}
		if(cbo2.length == 0)
		{
			var opt = new Option('Thêm Công tác','');
			cbo2.add(opt, undefined);
		}
	}
}
function xoaCongTac() 
{
	
	for(var i=0;i<cbo2.length;i++) 
	{
		if(cbo1.options[i].selected == true)
		{
			var opt = new Option(cbo2.options[i].text,cbo2.options[i].value);
			cbo1.add(opt, undefined);
			cbo2.remove(i);
			i--;
		}
	}
}
function themToanBoCongTac() 
{	if(cbo1.options[0].value != "")
	{
		if(cbo2.options[0].value == "")
			cbo2.innerHTML = "";
		for(var i=0;i<cbo1.length;i++) 
		{
			var opt = new Option(cbo1.options[i].text,cbo1.options[i].value);
			cbo2.add(opt, undefined);
			cbo1.remove(i);
			i--;
		}

		if(cbo1.length == 0)
		{
			var opt = new Option('Công tác','');
			cbo1.add(opt, undefined);
		}
		if(cbo2.length == 0)
		{
			var opt = new Option('Thêm Công tác','');
			cbo2.add(opt, undefined);
		}
	}
}
function xoaToanBoCongTac() 
{
	for(var i=0;i<cbo2.length;i++) 
	{
		
		var opt = new Option(cbo1.options[i].text,cbo1.options[i].value);
		cbo1.add(opt, undefined);
		cbo2.remove(i);
		i--;
	}
}
function closeWindow()
{
	window.close();
}
function confirmThemCongTac()
{
	if(document.getElementById('cboCongTacDaAdd').options[0].value != "")
	{
		if(confirm("Bạn có muốn thêm những công tác này không ???"))
		{
			for(var i=0;i<document.getElementById('cboCongTacDaAdd').length;i++)
			{
				var obj = new Object();
				if(i < size) {
					obj = listCongTac[i];
				}
				else {
					obj.maCongTac = document.getElementById('cboCongTacDaAdd').options[i].value;
					obj.noiDung = document.getElementById('cboCongTacDaAdd').options[i].text;
				}
				giaTriTraVe[i] = obj;
			}
			window.returnValue = giaTriTraVe;
			window.close();
		}
	}
	else
	{
		alert("Hãy chọn công tác");
	}
}
function sortCongTac()
{
	var sort = parseInt(document.getElementById('cboSort').value);
	cbo1.innerHTML = '';
	cbo1.add(new Option('   ---  Chọn công tác  ---   ',''), undefined);
	cbo1.options[0].disabled = true;
	for(var i=0;i<listObjectCongTac.length;i++)
	{
		var obj = new Object();
		obj = listObjectCongTac[i];
		if(String.fromCharCode(sort) == obj.chuDau || String.fromCharCode(sort-32) == obj.chuDau || document.getElementById('cboSort').value == '')
		{
			var objMang = new Array();
			objMang = obj.mangCongTac;
			for(var j=0;j<objMang.length;j++)
			{
				var opt = new Option(objMang[j].noiDung,objMang[j].maCongTac);
				cbo1.add(opt, undefined); 
			}
		}
	}
}
</script>
<title>Thêm công tác</title>
</head>
<body onload="pageLoad();">
	<table border="1">
		<tr align="center">
			<th colspan="3">Thêm công tác</th>
		</tr>
		<%int alpha = 65; %>
		<tr align="center">
			<td colspan="3">
				Sort by : <select onchange="sortCongTac()" id = "cboSort">
					<option value = "">   ---   All   ---   </option>
					<c:forEach var = "Alpha" begin = "1" end="26">
						<option value = "<%=alpha %>"><%=(char) alpha++ %></option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th style="width: 45%">
				<div  style="overflow-x: scroll; width: 330px" >
					<select size="20" id = "cboCongTacChuaAdd" multiple="multiple">
					</select>
				</div>	
			</th>
			<th style="width: 10%">
				<div style="width: 100px">
				<a href="javascript: themCongTac();">
					<img src="<%=request.getContextPath()%>/images/icon_action/addone.png" alt="Thêm công tác" border = "0" />
				</a><br/>
				<a href="javascript: themToanBoCongTac();">
					<img src="<%=request.getContextPath()%>/images/icon_action/addall.png" alt="Thêm toàn bộ công tác" border = "0" />
				</a>
				</div>
			</th>
			<th style="width: 45%">
				<div  style="overflow-x: scroll; width: 330px" >
					<select size="20" id = "cboCongTacDaAdd" multiple="multiple">
					</select>
				</div>
			</th>
		</tr>
		<tr>
			<th colspan="3">
				<input type="button" value = "OK" onclick="confirmThemCongTac();"/>
				<input type="button" value = "Cancel" onclick="closeWindow();"/>
			</th>
		</tr>
	</table>
	
</body>
</html>