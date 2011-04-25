<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DOI GIAO VIEN</title>
<script type="text/javascript">
var objGiaoVien = new Object();
function doiGiaoVien()
{
	if(document.getElementById('cboGiaoVien').value == <%=request.getParameter("maGiaoVien")%>)
		alert("Giáo viên chưa thay đổi!!!");
	else
		document.getElementById('DoiGiaoVien').submit();
		
}
function pageLoad()
{
	var param = 0;
	
	<%
		if(request.getParameter("Doi") != null)
		{
			if(request.getParameter("Doi").equals("ok"))
			{
				out.print("param = 1;");
				out.print("objGiaoVien.maGiaoVien = '" + request.getParameter("maGiaoVien") + "';");
				out.print("objGiaoVien.tenGiaoVien = '" + request.getAttribute("tenGiaoVien") + "';");
				
			}
			else if (request.getParameter("Doi").equals("fail"))
				out.print("param = 2;");
		}
	%>
	if(param != 0)
	{
		if(navigator.appName != 'Netscape') {
			var winOpen = window.opener;
			winOpen.traVe(objGiaoVien);
			winOpen.returnValue = winOpen.objGiaoVien;
			winOpen.close();
		}
		else {
			window.returnValue = objGiaoVien; 
		}
		window.close();
	}
	else
	{
		document.getElementById('txtMaMonHocTKB').value = <%=request.getParameter("maMonHocTKB")%>;
	}
}
function traVe(obj)
{
	var obj = new Object();
	objGiaoVien.maGiaoVien = obj.maGiaoVien;
	objGiaoVien.tenGiaoVien = obj.tenGiaoVien;
}
function changeGiaoVien()
{
	var giaoVien = document.getElementById('cboGiaoVien');
	document.getElementById('txtTenGiaoVien').value = giaoVien.options[giaoVien.selectedIndex].text;
}
</script>
</head>
<body onload="pageLoad();">
<c:set var = "GiaoVienList" value = "<%=ThanhVienDAO.getAllGiaoVienOrderByTen() %>"/>
<form action = "<%=request.getContextPath()%>/thoiKhoaBieuController?doiGiaoVien=yes" method="post" id = "DoiGiaoVien" name = "DoiGiaoVien" onsubmit="window.self">
	<table width="300px">
		<tr align="center">
			<td>
				<font style="color: blue; font-size: 20px; font-weight: bold;">Đổi giáo viên</font>
			</td>
		</tr>
		<tr align="center">
			<td>
				<br/>
				<select name = "cboGiaoVien" id = "cboGiaoVien" onchange="changeGiaoVien()" style="width: 250px">
					<c:forEach var = "GiaoVien" items="${GiaoVienList}">
						<option value="${GiaoVien.maThanhVien }"
							<c:if test = "${param.maGiaoVien eq GiaoVien.maThanhVien}"></c:if>
								>${GiaoVien.hoThanhVien} ${GiaoVien.tenLot} ${GiaoVien.tenThanhVien}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr align="center">
			<td>
				
				<br/>
				<input type = "button" value = "Đổi giáo viên" onclick="doiGiaoVien();" id = "btnDoi"/>
				<input type = "button" value = "Hủy bỏ" onclick="window.close();"/>
			</td>
		</tr>
	</table>
	<input type = "hidden" id = "txtTenGiaoVien" name = "txtTenGiaoVien"/>
	<input type = "hidden" id = "txtMaMonHocTKB" name = "txtMaMonHocTKB"/>
</form>	
</body>
</html>