<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel"%>
<%@page import="org.zefer.html.doc.k"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thêm Bộ Phận Thực Hiện</title>
<script language="JavaScript" type="text/javascript">
var listThucHien = window.dialogArguments;
var cbo1;
var cbo2;
<%
ArrayList<KhoaModel> khoaModelList = KhoaDAO.showAllKhoa();
ArrayList<ThanhVienModel> thanhVienModelList = ThanhVienDAO.getAllGiaoVienOrderByTen();
%>
function pageLoad()
{
	var check = true;
	var countBoPhan = 0;
	var line = '\n';
	<%
		if(khoaModelList.size()>0) {
			for(int i=0;i<khoaModelList.size();i++) {
				out.print("if(listThucHien != null) {");
				out.print("for(var i=0;i<listThucHien.length;i++) {");
				out.print("var obj = listThucHien[i];");
				out.print("if(obj.boPhan.maBoPhan == '-1')");
				out.print("document.getElementById('txtBoPhan').value = obj.boPhan.boPhan.replace(/<--->/gi,line);");
				out.print("else if(obj.boPhan.maBoPhan == " + khoaModelList.get(i).getMaKhoa() + ") {");
				out.print("check = false;");
				out.print("countBoPhan++;");
				out.print("break; } } }");
				out.print("var opt = new Option('" + khoaModelList.get(i).getTenKhoa() + "','" + khoaModelList.get(i).getMaKhoa() +"');");
				out.print("if(check == true) {");
				out.print("document.getElementById('BoPhanChuaAdd').add(opt, undefined); }");
				out.print("else {");
				out.print("document.getElementById('BoPhanDaAdd').add(opt, undefined); } ");
				out.print("check = true;");
			}
		}
	%>
	for(var i=0;i<countBoPhan;i++)
	{
		var obj = listThucHien[i];
		taoCbobox(obj.boPhan.maBoPhan);
		var arr = obj.thucHien;
		for(var j=0;j<arr.length;j++)
		{
			themNguoiThucHien(arr[j].maNguoiThucHien,obj.boPhan.maBoPhan);
		}
		giaTriMacDinhCboNguoiThucHienChuaAdd(obj.boPhan.maBoPhan);
		giaTriMacDinhCboNguoiThucHienDaAdd(obj.boPhan.maBoPhan);
	}
	giaTriMacDinhCboBoPhanChuaAdd();
	giaTriMacDinhCboBoPhanDaAdd();
}
function taoCbobox(value)//value = ma bo phan
{
		var btnThemNguoi = "<a href = \"javascript: themNguoiThucHien(''," + value + ");\"><img src='<%=request.getContextPath()%>/images/icon_action/addone.png' alt='Thêm người thực hiện' border = '0' /></a>";
		var btnThemToanBoNguoi = "<a href='javascript: themToanBoNguoiThucHien(" + value + ");'><img src='<%=request.getContextPath()%>/images/icon_action/addall.png' alt='Thêm toàn bộ người thực hiện' border = '0' /></a>";
		var btnXoaNguoi = "<a href='javascript: xoaNguoiThucHien(" + value + ");'><img src='<%=request.getContextPath()%>/images/icon_action/delone.png' alt='Xóa người thực hiện' border = '0' /></a>";
		var btnXoaToanBoNguoi = "<a href='javascript: xoaToanBoNguoiThucHien(" + value + ");'><img src='<%=request.getContextPath()%>/images/icon_action/delall.png' alt='Xóa toàn bộ người thực hiện' border = '0' /></a>";
		var table = document.getElementById('TableThucHien');
		var count = parseInt(document.getElementById('CountCboNguoi').value);
		table.insertRow(count + 2);
		table.rows[count + 2].align = "center";
		table.rows[count+2].insertCell(0).innerHTML = "<div  style='overflow-x: scroll; width: 240px'><select size = '10' id = 'NguoiThucHienChuaAdd" + value + "' multiple='multiple'></select></div>";
		table.rows[count+2].insertCell(1).innerHTML = "<div>" + btnThemNguoi + "<br/>" + btnThemToanBoNguoi + "<br/>" + btnXoaNguoi + "<br/>" + btnXoaToanBoNguoi + "</div>";
		//table.rows[count+1].insertCell(1).innerHTML = "<input type='button' value='Thêm' onclick=\"themNguoiThucHien(''," + value + ");\"/><br/><input type='button' value='Thêm toàn bộ' onclick='themToanBoNguoiThucHien(" + value + ");'/><br/><input type='button' value='Xóa' onclick='xoaNguoiThucHien(" + value + ");'/><br/><input type='button' value='Xóa toàn bộ' onclick='xoaToanBoNguoiThucHien(" + value + ");'/>";
		table.rows[count+2].insertCell(2).innerHTML = "<div  style='overflow-x: scroll; width: 240px'><select size = '10' id = 'NguoiThucHienDaAdd" + value + "' multiple='multiple'></select></div>";
		table.rows[count+2].cells[0].style.width = '45%';
		table.rows[count+2].cells[1].style.width = '10%';
		table.rows[count+2].cells[2].style.width = '45%';
		<%
			for(int i=0;i<thanhVienModelList.size();i++) {
				out.print("if(document.getElementById('BoPhanDaAdd').options[count].value == " + thanhVienModelList.get(i).getMaBoPhan() + ") {");
				out.print("var opt = new Option('" + thanhVienModelList.get(i).getHoThanhVien() + " " + thanhVienModelList.get(i).getTenLot() + " " + thanhVienModelList.get(i).getTenThanhVien() + "','" + thanhVienModelList.get(i).getMaThanhVien() + "');");
				out.print("document.getElementById('NguoiThucHienChuaAdd' + value).add(opt, undefined); }");
			}
		%>
		count++;
		document.getElementById('CountCboNguoi').value = count;
		giaTriMacDinhCboNguoiThucHienChuaAdd(value);
		giaTriMacDinhCboNguoiThucHienDaAdd(value);
}
function xoaCbobox(position)//position = thu tu dong
{
	var table = document.getElementById('TableThucHien');
	var count = parseInt(document.getElementById('CountCboNguoi').value);
	table.deleteRow(position);
	count--;
	document.getElementById('CountCboNguoi').value = count;
}
function themNguoiThucHien(maThanhVien, value) 
{
	if(document.getElementById('NguoiThucHienChuaAdd' + value).options[0].value != "")
	{
		if(document.getElementById('NguoiThucHienDaAdd' + value).options[0].value == "")
		{
			document.getElementById('NguoiThucHienDaAdd' + value).innerHTML = "";
		}
		for(var i=0;i<document.getElementById('NguoiThucHienChuaAdd' + value).length;i++) 
		{
			if(document.getElementById('NguoiThucHienChuaAdd' + value).options[i].selected == true || maThanhVien == document.getElementById('NguoiThucHienChuaAdd' + value).options[i].value)
			{
				var opt = new Option(document.getElementById('NguoiThucHienChuaAdd' + value).options[i].text,document.getElementById('NguoiThucHienChuaAdd' + value).options[i].value);
				document.getElementById('NguoiThucHienDaAdd' + value).add(opt, undefined);
				document.getElementById('NguoiThucHienChuaAdd' + value).remove(i);
				i--;
			}
		}
		giaTriMacDinhCboNguoiThucHienDaAdd(value);
		giaTriMacDinhCboNguoiThucHienChuaAdd(value);
	}	
}
function xoaNguoiThucHien(value) 
{
	if(document.getElementById('NguoiThucHienDaAdd' + value).options[0].value != "")
	{
		if(document.getElementById('NguoiThucHienChuaAdd' + value).options[0].value == "")
		{
			document.getElementById('NguoiThucHienChuaAdd' + value).innerHTML = "";
		}
		for(var i=0;i<document.getElementById('NguoiThucHienDaAdd' + value).length;i++) 
		{
			if(document.getElementById('NguoiThucHienDaAdd' + value).options[i].selected == true)
			{
				var opt = new Option(document.getElementById('NguoiThucHienDaAdd' + value).options[i].text,document.getElementById('NguoiThucHienDaAdd' + value).options[i].value);
				document.getElementById('NguoiThucHienChuaAdd' + value).add(opt, undefined);
				document.getElementById('NguoiThucHienDaAdd' + value).remove(i);
				i--;
			}
		}
		giaTriMacDinhCboNguoiThucHienChuaAdd(value);
		giaTriMacDinhCboNguoiThucHienDaAdd(value);
	}
}
function themToanBoNguoiThucHien(value) 
{
		if(document.getElementById('NguoiThucHienChuaAdd' + value).options[0].value != "")
		{
			if(document.getElementById('NguoiThucHienDaAdd' + value).options[0].value == "")
				document.getElementById('NguoiThucHienDaAdd' + value).innerHTML = "";
			for(var i=0;i<document.getElementById('NguoiThucHienChuaAdd' + value).length;i++) 
			{
				var opt = new Option(document.getElementById('NguoiThucHienChuaAdd' + value).options[i].text,document.getElementById('NguoiThucHienChuaAdd' + value).options[i].value);
				document.getElementById('NguoiThucHienDaAdd' + value).add(opt, undefined);
				document.getElementById('NguoiThucHienChuaAdd' + value).remove(i);
				i--;
			}
			giaTriMacDinhCboNguoiThucHienDaAdd(value);
			giaTriMacDinhCboNguoiThucHienChuaAdd(value);
		}
		
}
function xoaToanBoNguoiThucHien(value) 
{
	if(document.getElementById('NguoiThucHienDaAdd' + value).options[0].value != "")
	{
		if(document.getElementById('NguoiThucHienChuaAdd' + value).options[0].value == "")
		{
			document.getElementById('NguoiThucHienChuaAdd' + value).innerHTML = "";
		}
		for(var i=0;i<document.getElementById('NguoiThucHienDaAdd' + value).length;i++) 
		{
			var opt = new Option(document.getElementById('NguoiThucHienDaAdd' + value).options[i].text,document.getElementById('NguoiThucHienDaAdd' + value).options[i].value);
			document.getElementById('NguoiThucHienChuaAdd' + value).add(opt, undefined);
			document.getElementById('NguoiThucHienDaAdd' + value).remove(i);
			i--;
		}
		giaTriMacDinhCboNguoiThucHienChuaAdd(value);
		giaTriMacDinhCboNguoiThucHienDaAdd(value);
	}
}
function themBoPhan() 
{	if(document.getElementById('BoPhanChuaAdd').options[0].value != "")
	{
		if(document.getElementById('BoPhanDaAdd').options[0].value == "")
			document.getElementById('BoPhanDaAdd').innerHTML = "";
		for(var i=0;i<document.getElementById('BoPhanChuaAdd').length;i++) 
		{
			if(document.getElementById('BoPhanChuaAdd').options[i].selected == true)
			{
				var opt = new Option(document.getElementById('BoPhanChuaAdd').options[i].text,document.getElementById('BoPhanChuaAdd').options[i].value);
				var value = document.getElementById('BoPhanChuaAdd').options[i].value;
				document.getElementById('BoPhanDaAdd').add(opt, undefined);
				document.getElementById('BoPhanChuaAdd').remove(i);
				i--;
				taoCbobox(value);
				
			}
		}
		giaTriMacDinhCboBoPhanChuaAdd();
		giaTriMacDinhCboBoPhanDaAdd();
	}
}
function xoaBoPhan() 
{
	if(document.getElementById('BoPhanDaAdd').options[0].value != "")
	{
		if(document.getElementById('BoPhanChuaAdd').options[0].value == "")
			document.getElementById('BoPhanChuaAdd').innerHTML = "";
		for(var i=0;i<document.getElementById('BoPhanDaAdd').length;i++) 
		{
			if(document.getElementById('BoPhanDaAdd').options[i].selected == true)
			{
				var opt = new Option(document.getElementById('BoPhanDaAdd').options[i].text,document.getElementById('BoPhanDaAdd').options[i].value);
				document.getElementById('BoPhanChuaAdd').add(opt, undefined);
				document.getElementById('BoPhanDaAdd').remove(i);
				xoaCbobox(i+2);
				i--;
			}
		}
		giaTriMacDinhCboBoPhanDaAdd();
		giaTriMacDinhCboBoPhanChuaAdd();
	}
}
function themToanBoBoPhan() 
{
	if(document.getElementById('BoPhanChuaAdd').options[0].value != "")
	{
		if(document.getElementById('BoPhanDaAdd').options[0].value == "")
			document.getElementById('BoPhanDaAdd').innerHTML = "";
		for(var i=0;i<document.getElementById('BoPhanChuaAdd').length;i++) 
		{
			var opt = new Option(document.getElementById('BoPhanChuaAdd').options[i].text,document.getElementById('BoPhanChuaAdd').options[i].value);
			var value = document.getElementById('BoPhanChuaAdd').options[i].value;
			document.getElementById('BoPhanDaAdd').add(opt, undefined);
			document.getElementById('BoPhanChuaAdd').remove(i);
			i--;
			taoCbobox(value);
		}
		giaTriMacDinhCboBoPhanChuaAdd();
		giaTriMacDinhCboBoPhanDaAdd();
	}
}
function xoaToanBoBoPhan() 
{
	if(document.getElementById('BoPhanDaAdd').options[0].value != "")
	{
		if(document.getElementById('BoPhanChuaAdd').options[0].value == "")
		{
			document.getElementById('BoPhanChuaAdd').innerHTML = "";
		}
		for(var i=0;i<document.getElementById('BoPhanDaAdd').length;i++) 
		{
			var opt = new Option(document.getElementById('BoPhanDaAdd').options[i].text,document.getElementById('BoPhanDaAdd').options[i].value);
			document.getElementById('BoPhanChuaAdd').add(opt, undefined);
			document.getElementById('BoPhanDaAdd').remove(i);
			xoaCbobox(i+2);
			i--;
		}
		giaTriMacDinhCboBoPhanDaAdd();
	}
}
function confirmThemNguoi()
{
	var returnValue = new Array();
	var check = true;
	if(document.getElementById('BoPhanDaAdd').options[0].value != "" || document.getElementById('txtBoPhan').value != "")
	{
		for(var i=0;i<parseInt(document.getElementById('BoPhanDaAdd').length);i++)
		{
			if(document.getElementById('BoPhanDaAdd').options[0].value != "")
			{
				if(document.getElementById('NguoiThucHienDaAdd' + document.getElementById('BoPhanDaAdd').options[i].value).options[0].value == "")
				{
					alert("Hãy chọn người thực hiện cho từng bộ phận");
					check = false;
					break;
				}
			}
		}
	}
	else
	{
		alert("Hãy chọn bộ phận thực hiện hay nhập vào bộ phận thực hiện");
		check = false;
	}
	if(check == false)
		return false;
	else
	{
		if(confirm("Bạn có chắc muốn thêm bộ phận thực hiện không ???"))
		{
			if(document.getElementById('BoPhanDaAdd').options[0].value != "")
			{
				for(var i=0;i<parseInt(document.getElementById('BoPhanDaAdd').length);i++)
				{
					var obj = new Object();
					var objBoPhan = new Object();
					objBoPhan.maBoPhan = document.getElementById('BoPhanDaAdd').options[i].value;
					objBoPhan.boPhan = document.getElementById('BoPhanDaAdd').options[i].text;
					var arrNguoiThucHien = new Array();
					for(var j=0;j<parseInt(document.getElementById('NguoiThucHienDaAdd' + objBoPhan.maBoPhan).length);j++)
					{
						var objNguoiThucHien = new Object();
						objNguoiThucHien.maNguoiThucHien = document.getElementById('NguoiThucHienDaAdd' + objBoPhan.maBoPhan).options[j].value;
						objNguoiThucHien.nguoiThucHien = document.getElementById('NguoiThucHienDaAdd' + objBoPhan.maBoPhan).options[j].text;
						arrNguoiThucHien[j] = objNguoiThucHien;
					}
					obj.boPhan = objBoPhan;
					obj.thucHien = arrNguoiThucHien;
					returnValue[i] = obj;
				}
			}
			if(document.getElementById('txtBoPhan').value != "")
			{
				var obj = new Object();
				var objBoPhan = new Object();
				objBoPhan.maBoPhan = "-1";
				objBoPhan.boPhan = document.getElementById('txtBoPhan').value.replace(/\n/gi,'<--->');
				var arrNguoiThucHien = new Array();
				obj.boPhan = objBoPhan;
				obj.thucHien = arrNguoiThucHien;
				returnValue[returnValue.length] = obj;
			}
			window.returnValue = returnValue;
			closeWindow();
		}
	}	
}
function closeWindow()
{
	window.close();
}
function giaTriMacDinhCboBoPhanChuaAdd()
{
	if(document.getElementById('BoPhanChuaAdd').length == 0)
	{
		var opt = new Option('Bộ phận','');
		document.getElementById('BoPhanChuaAdd').add(opt, undefined);
	}
}
function giaTriMacDinhCboBoPhanDaAdd()
{
	if(document.getElementById('BoPhanDaAdd').length == 0)
	{
		var opt = new Option('Thêm bộ phận','');
		document.getElementById('BoPhanDaAdd').add(opt, undefined);
	}
}
function giaTriMacDinhCboNguoiThucHienChuaAdd(maBoPhan)
{
	if(document.getElementById('NguoiThucHienChuaAdd' + maBoPhan).length == 0)
	{
		var opt = new Option('Người thực hiện','');
		document.getElementById('NguoiThucHienChuaAdd' + maBoPhan).add(opt, undefined);
	}
}
function giaTriMacDinhCboNguoiThucHienDaAdd(maBoPhan)
{
	if(document.getElementById('NguoiThucHienDaAdd' + maBoPhan).length == 0)
	{
		var opt = new Option('Thêm người thực hiện','');
		document.getElementById('NguoiThucHienDaAdd' + maBoPhan).add(opt, undefined);
	}
}


</script>
</head>
<body onload="pageLoad();">
	<c:set var = "ListKhoa" value="<%=KhoaDAO.showAllKhoa() %>"/>
	<table id = "TableThucHien" border="1">
		<tr align="center">
			<td colspan="3" style="background-color: aqua">
				Thêm Bộ Phận Thực Hiện
			</td>
		</tr>	
		<tr align="center">
			<td style="width: 45%">
				<div  style="overflow-x: scroll; width: 240px" >
					<select size="10" id = "BoPhanChuaAdd" multiple="multiple">
					</select>
				</div>
			</td>
			<td style="width: 10%">
				<div style="width: 80px">
					<a href="javascript: themBoPhan();">
						<img src="<%=request.getContextPath()%>/images/icon_action/addone.png" alt="Thêm bộ phận" border = "0" />
					</a><br/>
					<a href="javascript: themToanBoBoPhan();">
						<img src="<%=request.getContextPath()%>/images/icon_action/addall.png" alt="Thêm toàn bộ bộ phận" border = "0" />
					</a><br/>
					<a href="javascript: xoaBoPhan();">
						<img src="<%=request.getContextPath()%>/images/icon_action/delone.png" alt="Xóa bộ phận" border = "0" />
					</a><br/>
					<a href="javascript: xoaToanBoBoPhan();">
						<img src="<%=request.getContextPath()%>/images/icon_action/delall.png" alt="Xóa toàn bộ bộ phận" border = "0" />
					</a>
					<a href="javascript: themBoPhanKhac();">
						Thêm bộ phận khác
					</a>
				</div>
			</td>
			<td style="width: 45%">
				<div  style="overflow-x: scroll; width: 240px" >
					<select size="10" id = "BoPhanDaAdd" multiple="multiple">
					</select>
				</div>	
			</td>
		</tr>
		<tr align="left"><td colspan="3"><font style="color: blue;">Nhập bộ phận thực hiện</font>
			<textarea rows="3" cols="70" id = "txtBoPhan"></textarea>
			</td>
		</tr>
		<tr align="center">
			<td colspan="3">
				<input type="button" value = "OK" onclick="confirmThemNguoi();"/>
				<input type="button" value = "Cancel" onclick="closeWindow();"/>
				<input type="hidden" id = "CountCboNguoi" value = "0"/>
			</td>
		</tr>
	</table>
</body>
</html>