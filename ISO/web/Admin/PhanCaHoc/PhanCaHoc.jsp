<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysRoleAppDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%><fmt:bundle basename="i18n">
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Phân Ca cho Sinh Viên</title>

<script type="text/javascript" language="JavaScript">
var listSinhVien = new Array();
	<%
		String maLop = "";
		ArrayList<LopHocModel> lopHocList = LopHocDAO.showLopHoc();
		if(request.getParameter("maLop") != null)
			maLop = request.getParameter("maLop");
		else
			maLop = lopHocList.get(0).getMaLopHoc();
		ArrayList<ThanhVienModel> thanhVienList = new ArrayList<ThanhVienModel>();
		if(request.getParameter("status") != null && request.getParameter("status").equals("2"))
			thanhVienList = (ArrayList<ThanhVienModel>)request.getAttribute("thanhVienModelList");
		else
			thanhVienList = ThanhVienDAO.getThanhVienByMaLop(maLop);
	%>
	function pageLoad()
	{
		var str = "";
		var cboSinhVienCa1 = document.getElementById('cboSinhVienCa1');
		var cboSinhVien = document.getElementById('cboSinhVien');
		var cboSinhVienCa2 = document.getElementById('cboSinhVienCa2');
		cboSinhVienCa1.innerHTML = null;
		cboSinhVien.innerHTML = null;
		cboSinhVienCa2.innerHTML = null;
		<%
			for(int i=0;i<thanhVienList.size();i++) {
				ThanhVienModel thanhVien = thanhVienList.get(i);
				out.print("var sinhVien = new Object();");
				out.print("sinhVien.maSinhVien = '" + thanhVien.getMaThanhVien() + "';");
				out.print("sinhVien.tenSinhVien = '" + thanhVien.getHoThanhVien() + ' ' + thanhVien.getTenLot() + ' ' + thanhVien.getTenThanhVien() + "';");
				out.print("sinhVien.caHoc = '" + thanhVien.getUser2() + "';");
				out.print("listSinhVien[" + i + "] = sinhVien;");
				out.print("if(sinhVien.caHoc == '0' || sinhVien.caHoc == '')");
				out.print("taoOption(sinhVien.maSinhVien, sinhVien.tenSinhVien, cboSinhVien);");
				out.print("else if(sinhVien.caHoc == '1')");
				out.print("taoOption(sinhVien.maSinhVien, sinhVien.tenSinhVien, cboSinhVienCa1);");
				out.print("else\n");
				out.print("taoOption(sinhVien.maSinhVien, sinhVien.tenSinhVien, cboSinhVienCa2);");
				out.print("str += \"<input type = 'hidden' name = 'txtMaSinhVien\" + sinhVien.maSinhVien + \"MaSinhVien' id = 'txtMaSinhVien\" + sinhVien.maSinhVien + \"MaSinhVien' value = '\" + sinhVien.caHoc + \"'/>\";");
			}
		%>
		if(cboSinhVien.innerHTML == '')
			taoOption('', '  ---  Sinh viên  ---  ', cboSinhVien);
		if(cboSinhVienCa1.innerHTML == '')
			taoOption('', '  ---  Sinh viên ca 1  ---  ', cboSinhVienCa1);
		if(cboSinhVienCa2.innerHTML == '')
			taoOption('', '  ---  Sinh viên ca 2  ---  ', cboSinhVienCa2);
		document.getElementById('td').innerHTML = str;
	}
	function phanCa(add, nhan, ca, tenAdd, tenNhan)
	{
		var cboAdd = document.getElementById(add);
		var cbo = document.getElementById(nhan);
		var check = false;
		var count = 0;
		var ca2 = ca;
		if(ca == '0')
			ca2 = '';
		for(var i=0;i<cboAdd.length;i++)
		{
			
			if(cboAdd.options[i].selected == true)
			{
				if(check == false)
					cbo.innerHTML = null;
				check = true;
				for(var j=count;j<listSinhVien.length;j++)
				{
					var sinhVien = listSinhVien[j];
					if(sinhVien.caHoc == ca || sinhVien.caHoc == ca2)
						taoOption(sinhVien.maSinhVien, sinhVien.tenSinhVien, cbo);
					if(sinhVien.maSinhVien == cboAdd.options[i].value)
					{
						document.getElementById('txtMaSinhVien' + sinhVien.maSinhVien + 'MaSinhVien').value = ca;
						sinhVien.caHoc = ca;
						cboAdd.remove(i);
						i--;
						listSinhVien[j] = sinhVien;
						count = j + 1;
						taoOption(sinhVien.maSinhVien, sinhVien.tenSinhVien, cbo);
						break;
					}
					
				}
			}
		}
		if(check == false)
			alert("Phải chọn sinh viên !!!");	
		else 
		{
			for(var j=count;j<listSinhVien.length;j++)
			{
				var sinhVien = listSinhVien[j];
				if(sinhVien.caHoc == ca || sinhVien.caHoc == ca2)
					taoOption(sinhVien.maSinhVien, sinhVien.tenSinhVien, cbo);
			}
			if(cbo.innerHTML == '')
				taoOption('', '  ---  ' + tenNhan + '  ---  ', cbo);
			if(cboAdd.innerHTML == '')
				taoOption('', '  ---  ' + tenAdd + '  ---  ', cboAdd);
		}
		
	}
	function taoOption(value, text, cbo)
	{
		var opt = new Option(text, value);
		cbo.add(opt, undefined);
	}
	function changeLop()
	{
		var duongDan = '<%=Constant.PATH_RES.getString("iso.PhanCaPathAdmin") %>';
		window.location.href= duongDan + '?status=1&maLop=' + document.getElementById('cboLopHoc').value;
	}
	function luu()
	{
		document.getElementById('formCa1Chuyen0').submit();
	}
</script>

</head>
<body onload="pageLoad();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan=""><div class = "div_thanhvientieude">Phân Ca Cho Sinh Viên</div></td></tr>
	</table>
	<c:set var="listLop" value = "<%=lopHocList %>" scope="session"></c:set>
	<c:set var="listSinhVien" value = "<%=thanhVienList %>" scope="session"></c:set>
	<form action="<%=request.getContextPath()%>/ThanhVienController?actionType=chuyenCa" method="post" Name = "formCa1Chuyen0" id = "formCa1Chuyen0">	
		<table style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td colspan="5">Lớp :
				<select onchange = "changeLop()" name = "cboLopHoc" id ="cboLopHoc" >
					<c:forEach var="lop" items="${listLop}" > 
						<option value = "${ lop.maLopHoc }" <c:if test="${param.maLop eq lop.maLopHoc}"> selected</c:if> > ${ lop.kiHieu } </option>
					</c:forEach>
				</select>
			</td>
		</tr>
	
	
	
		<tr style="background-color: transparent;">
			<td>Danh sách học sinh Ca 1 :</td>
			<td></td>
			<td>Lớp Hiện Tại :</td>
			<td></td>
			<td>Danh sách học sinh Ca 2 :</td>
		</tr>
		
		<tr style="background-color: transparent;">		
			<td>
				
					<select multiple="multiple" size="15" name="cboSinhVienCa1" id="cboSinhVienCa1">
						<option value="">  ---  Sinh viên ca 1  ---  </option>	
					</select>
				
				
			</td>
			<td>
				<img src="<%=request.getContextPath()%>/images/icon_action/addone.png"  border = "0" onclick="phanCa('cboSinhVienCa1', 'cboSinhVien', '0', 'Sinh viên ca 1', 'Sinh viên');" style="cursor:pointer" height='24' width='65' />
				<br></br>
				<img src="<%=request.getContextPath()%>/images/icon_action/delone.png"  border = "0" onclick="phanCa('cboSinhVien', 'cboSinhVienCa1', '1', 'Sinh viên', 'Sinh viên ca 1');" style="cursor:pointer" height='24' width='65' />
				
			</td>
			<td>
					<select multiple="multiple" size="15" name="cboSinhVien" id="cboSinhVien" style="background-color: transparent;">
						<option value="">  ---  Sinh viên  ---  </option>			
					</select>
				
			</td>
			<td>
				<img src="<%=request.getContextPath()%>/images/icon_action/addone.png" border = "0" onclick="phanCa('cboSinhVien', 'cboSinhVienCa2', '2', 'Sinh viên', 'Sinh viên ca 2');" style="cursor:pointer" height='24' width='65' />
				
				<br></br>
				<img src="<%=request.getContextPath()%>/images/icon_action/delone.png"  border = "0" onclick="phanCa('cboSinhVienCa2', 'cboSinhVien', '0', 'Sinh viên ca 2', 'Sinh viên');" style="cursor:pointer" height='24' width='65' />
			</td>
			<td>
					<select multiple="multiple" size="15" name="cboSinhVienCa2" id="cboSinhVienCa2" style="background-color: transparent;">
						<option value="">  ---  Sinh viên ca 2  ---  </option>	
					</select>
				
			</td>
		</tr style="background-color: transparent;">
		<tr>
			<td colspan="5">
				<a href = "javascript: luu();"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu" border="0"/> </a>
			</td>
		</tr>
		<tr><td colspan="5" id = "td"></td></tr>
		</table>
		<input type = "hidden" value = "1" name = "txtPhanLoai"/>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>