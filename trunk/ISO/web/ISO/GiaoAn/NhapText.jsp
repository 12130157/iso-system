<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.model.LoaiCongViecChuanBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiCongViecChuanBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.CongViecChuanBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.CongViecChuanBiModel"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script language="JavaScript" type="text/javascript">
	function closeWindow()
	{
		window.close();
		window.returnValue = false;
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
	
	function loadText()
	{
		
		if(window.dialogArguments!=null){
			
			var	allArgs = window.dialogArguments;
			var valueContent=allArgs.valueContent;

			if(allArgs.quyen=="false"||allArgs.loai=="TH"){
				if(allArgs.quyen=="false")
					document.getElementById("OK").disabled="disabled";
				document.getElementById("ftLoaiCVCB").style.visibility="hidden";
			}
			
			document.getElementById("titleContent").innerHTML=allArgs.titleContent;
			document.title=allArgs.titleContent;
			if(valueContent!=undefined&&valueContent!="")
				document.getElementById('areaInput').innerHTML=valueContent;

			if(allArgs.maLoai!=null){
				var str="";
				var maLoai=allArgs.maLoai;
				var index=1;
				<%
			
				ArrayList<CongViecChuanBiModel> congViecChuanBiList=CongViecChuanBiDAO.getAllCongViecChuanBi();
			
				for(int i=0;i<congViecChuanBiList.size();i++)
				{
					out.print("if(maLoai=='"+congViecChuanBiList.get(i).getMaLoai()+"'){");
					out.print("str=str+\"<br/><input type='checkbox' name='ckbTen' id='ckbTen\"+index+\"'  value='"+congViecChuanBiList.get(i).getTen()+"' onclick='click_ckbTen()'/> Mẫu\" +index;");
					out.print("index++;}");
				}
				%>
				document.getElementById("lengthCheckbox").value=index+"";
				document.getElementById("an").innerHTML = str;
			}

		}
	}

	

	function click_ckbTen()
	{
		var str="";
		var ckbList=document.NhapText.ckbTen;
		var lengthCKB=parseInt(document.getElementById("lengthCheckBox").value);
		var i;
		for(i=1;i<lengthCKB;i++)
		{
			if(document.getElementById("ckbTen"+i).checked==true)
				str=str+document.getElementById("ckbTen"+i).value+"\n";
		}
		document.getElementById('areaInput').value=str;
			
	}


		
</script>
</head>

		
<c:set var="congViecChuanBiList" value='<%=CongViecChuanBiDAO.getAllCongViecChuanBiByMaLoai(Constant.CongViecChuanBi_Start)%>'></c:set>
<c:set var="loaiCVCBList" value="<%=LoaiCongViecChuanBiDAO.getAllLoaiCongViecChuanBi()%>"></c:set>
<body style="text-align:center;margin:0 auto;" onload="loadText()">
	<form name="NhapText">
		<table width="600">
			<tr><th colspan="2">Nhập dữ liệu cho <b>"<font id="titleContent"></font>"</b></th></tr>
			<tr>
				<td colspan="2">
					<textarea rows="20" cols="50" name="areaInput" id="areaInput"></textarea> 
				</td>
				
				<td valign="top" >
					<font id="ftLoaiCVCB">
						Chọn công việc chuẩn bị:<br/>
						
						<a id='an'>
							
						</a>
					</font>
				</td>
			</tr>
			<tr align="center">
				<td>
					<input type="button" value = "  OK  " name = "OK"  id="OK" onclick="return confirm();"/>
				</td>
				<td>	
					<input type="button" value="Cancel" onclick="closeWindow();"/> 
				</td>
			</tr>
		</table>
	</form>
	<input type='hidden' id="lengthCheckbox"/>
</body>
</html>