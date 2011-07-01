<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysRoleAppDAO"%><fmt:bundle basename="i18n">



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

<title>Ứng dụng</title>

<script type="text/javascript" language="JavaScript">
	
	function themChucNang()
	{
		obj=document.getElementById("cboChuaPhanQuyen");
		str=obj.options[obj.selectedIndex].value;
		if(str!="")
		{
			document.forms['ActionChuaPhanQuyen'].submit();
			
		}
		return ; 
	}

	function huyChucNang()
	{
		obj=document.getElementById("cboPhanQuyen");
		str=obj.options[obj.selectedIndex].value;
		if(str!="")
		{
			document.forms['ActionPhanQuyen'].submit();
			
		}
		return ; 
	}

	function themAllChucNang()
	{
		if(confirm("Bạn có chắc muốn thay đổi")==true)
			document.forms['ActionChuaPhanQuyenAll'].submit();
	}

	function huyAllChucNang()
	{
		if(confirm("Bạn có chắc muốn thay đổi")==true)
			document.forms['ActionPhanQuyenAll'].submit();
		
	}
</script>

</head>
<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var="tenApp" value='<%=SysRoleAppDAO.getSysAppByAppID(request.getParameter("appID"))%>'></c:set>	
	<c:set var="listPhanQuyen" value='<%=SysRoleAppDAO.getVaiTroDaPhanQuyen(request.getParameter("appID"))%>'></c:set>
	<c:set var="listChuaPhanQuyen" value='<%=SysRoleAppDAO.getVaiTroChuaPhanQuyen(request.getParameter("appID"))%>'></c:set>
	
	<br/><br/><br/><br/><br/>
	
	<b>Bạn đang chọn <u>vai trò</u> cho chức năng <u>${tenApp.appName}</u></b>
	<form method="post" action="<%=request.getContextPath()%>/AdminController?actionType=PhanQuyen&actionStatus=huy&appID=${param.appID}" name="ActionPhanQuyen" id="ActionPhanQuyen" enctype="application/x-www-form-urlencoded">	
			<table>
			<tr>
			<td>
				Vai trò đã phân quyền<br/>
				<select multiple="multiple" size="5" name="cboPhanQuyen" id="cboPhanQuyen">
					<c:forEach items="${listPhanQuyen}" var="objPhanQuyen">
						<option value="${objPhanQuyen.maVaiTro}">${objPhanQuyen.tenVaiTro}</option>
					</c:forEach>
				</select>
			</td>
			<td>
			<!-- <input type='button' onclick="huyChucNang()" value="Xóa một" /> --><br/>
			<img src="../..<%=Constant.PATH_RES.getString("IconAction.AddOne")%>" height='24' width='65' onclick="huyChucNang()" style="cursor:pointer"/><br>
	</form>
			<br/>
	<form action="<%=request.getContextPath()%>/AdminController?actionType=PhanQuyen&actionStatus=huyAll&appID=${param.appID}"  method="post" name="ActionPhanQuyenAll" enctype="application/x-www-form-urlencoded">
		 <!--  <input type="submit" value="Xóa hết"/>--> 
		<img src="../..<%=Constant.PATH_RES.getString("IconAction.AddAll")%>" height='24' width='65' onclick="huyAllChucNang()" style="cursor:pointer"/>
	</form>		
			<br/>
			
	<form action="<%=request.getContextPath()%>/AdminController?actionType=PhanQuyen&actionStatus=them&appID=${param.appID}" name="ActionChuaPhanQuyen" id="ActionChuaPhanQuyen" method="post" enctype="application/x-www-form-urlencoded">
				<!-- <input type='button' onclick="themChucNang()"  value="Thêm một" />-->
		<img src="../..<%=Constant.PATH_RES.getString("IconAction.DelOne")%>"  height='24' width='65' onclick="themChucNang()" style="cursor:pointer"/>
				</td>
			<td>
				Vai trò chưa phân quyền<br/>
				<select multiple="multiple" size="5" name="cboChuaPhanQuyen" id="cboChuaPhanQuyen">
					<c:forEach items="${listChuaPhanQuyen}" var="objChuaPhanQuyen">
						<option value="${objChuaPhanQuyen.maVaiTro}">${objChuaPhanQuyen.tenVaiTro}</option>
					</c:forEach>
				</select>
		
			</td>
		</tr>
	</form>
	
	<tr>
		<td></td>
		<td><form action="<%=request.getContextPath()%>/AdminController?actionType=PhanQuyen&actionStatus=themAll&appID=${param.appID}" name="ActionChuaPhanQuyenAll" id="ActionChuaPhanQuyenAll" method="post" enctype="application/x-www-form-urlencoded">
		 	<!--  <input type="submit" value="Thêm hết"/>	-->	
		 	
			<img src="../..<%=Constant.PATH_RES.getString("IconAction.DelAll")%>" height='24' width='65' onclick="themAllChucNang()" style="cursor:pointer"/>
		 	</form>	
		 </td>

		 <td></td>
	</tr>
		</table>
	<br/>
		
		<br/>
	
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>