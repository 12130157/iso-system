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
<%@page import="vn.edu.hungvuongaptech.model.SysRoleMenuModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysRoleMenuDAO"%><fmt:bundle basename="i18n">



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

<title>Menu</title>

<script type="text/javascript" language="JavaScript">

function checkValue(){
/*	str=document.getElementById("txtTenMenuImage").value;
	exst=str.substring(str.length-4,str.length);
	if(document.forms['ActionMenu'].txtTenMenuName.value == "" || document.forms['ActionMenu'].txtTenMenuName.value == null){
		 alert("Bạn phải nhập tên Menu !!" );
	     return;
	}
	else if(str!=""&&exst!=".png")
	{
		alert("Bạn chỉ chọn file png");
		return;
	}
*/	
	var rong = /\s/g;

	var tenMenuName = document.ActionMenu.txtTenMenuName.value;
	var value = tenMenuName.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập Tên Menu !!!" );
	     return;
	}
	
	var tenMenuImage = document.ActionMenu.txtTenMenuImage.value;
	var value_1 = tenMenuImage.replace(rong,"");
	if(value_1 == ""){
		 alert("Bạn phải nhập tên hình !!!" );
	     return;
	}
	
	var tenMenuLink = document.ActionMenu.txtTenMenuLink.value;
	var value_2 = tenMenuLink.replace(rong,"");
	if(value_2 == ""){
		 alert("Bạn phải nhập đường dẫn !!!" );
	     return;
	}
	document.forms['ActionMenu'].submit();
}



function showMenu()
{
	cbo=document.getElementById("cboAppName");
	str=cbo.options[cbo.selectedIndex].value;
	location.href="<%=Constant.PATH_RES.getString("Admin.XemMenuPath") %>?appID="+str;
}

function linkThemDong()
{
	cbo=document.getElementById("cboAppName");
	str=cbo.options[cbo.selectedIndex].value;
	location.href="<%=Constant.PATH_RES.getString("Admin.XemMenuPath") %>?status=themdong&appID="+str;
}

function linkHuyThemDong()
{
	cbo=document.getElementById("cboAppName");
	str=cbo.options[cbo.selectedIndex].value;
	location.href="<%=Constant.PATH_RES.getString("Admin.XemMenuPath") %>?status=huythemdong&appID="+str;
}

</script>

</head>
<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
		<jsp:include page="../../block/header_Admin.jsp" /> 
	<!-- E HEAD CONTENT -->
	<br/><br/><br/><br/>
		<form method="post" enctype="application/x-www-form-urlencoded" action="<%=request.getContextPath()%>/AdminController" name="ActionMenu" id="ActionMenu">
		<input type="hidden" value="ShowMenu" name="actionType"/>
		<input type="hidden" value="${param.appID}" name="txtTenAppID"/>
		
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
					<td>
						<div class = "div_thanhvientieude">Danh Sách Các Menu</div>
					</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<c:if test="${param.err eq 'insertTB'}">
						<b class="error">Menu này đã có rồi !!!</b>
					</c:if>
					<c:if test="${param.msg eq 'insertTC'}">
						<b class="msg">Cập nhật thành công !!!</b>
					</c:if>
					<c:if test="${param.err eq 'updateTB'}">
						<b class="error">Cập nhật thất bại!!!</b>
					</c:if>
					<c:if test="${param.msg eq 'updateTC'}">
						<b class="msg">Cập nhật thành công !!!</b>
					</c:if>
				</td>
			</tr>
		</table>
		
		<c:set var="listApp" value="<%=SysRoleAppDAO.getAllSysApp() %>"></c:set>
		Chọn tên ứng dụng <select name="cboAppName" id="cboAppName" onchange="showMenu()">
		
		
		
		
		
		
		
		
		
		<c:choose>
			<c:when test="${ not empty param.appID  }">		
				<c:set var="objApp" value='<%=SysRoleAppDAO.getSysAppByAppID(request.getParameter("appID"))%>'></c:set>
			
				<option value="${objApp.appID}">${objApp.appName}</option>
				<c:forEach items="${listApp}" var="obj">
					<c:if test="${ param.appID ne obj.appID }">
						<option value="${obj.appID}">${obj.appName}</option>
					</c:if>
				</c:forEach>

			</c:when>
			<c:otherwise>
			
				<c:forEach items="${listApp}" var="obj">
					<option value="${obj.appID}">${obj.appName}</option>
				</c:forEach>
			
			</c:otherwise>
		</c:choose>
		
		</select>


		<c:if test="${ not empty param.appID }">
			<c:set var="listMenu" value='<%=SysRoleMenuDAO.getAllSysMenuByAppID(request.getParameter("appID"))%>'></c:set>
			<% int stt=1; %>

			<table border="1" style="background-color: transparent;">		
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên Menu</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Hình</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Đường Dẫn</div></th>
				<th bgcolor=#186fb2"></th>
			</tr>
			
			<c:forEach items="${listMenu}" var="obj">
				<tr style="background-color: transparent;">
				
				<c:choose>
					<c:when test="${param.roleID ne obj.roleID }">
						<td><%=stt%></td>
					</c:when>
					<c:otherwise>
						<td>		
							<%=stt%>
							<input type='hidden' value="${obj.roleID}" style="background-color:transparent;border:none;text-align:center"  name="txtTenID" id="txtTenID"/>
						</td>
					</c:otherwise>
				</c:choose>
					
				<c:choose>
					<c:when test="${param.roleID ne obj.roleID }">
						<td><a href="<%=Constant.PATH_RES.getString("Admin.XemPhanQuyenMenuPath") %>?menuID=${obj.roleID}">${obj.menuName}</a></td>
					</c:when>
					<c:otherwise>
						<td><input type="text" name = "txtTenMenuName" id="txtTenMenuName" value="${obj.menuName}" style="background-color: transparent;" /></td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.roleID ne obj.roleID }">
						<td><img src='../../${obj.menuImage}' height='50'/></td>
					</c:when>
					<c:otherwise>
						<td><input type="file" name = "txtTenMenuImage" id="txtTenMenuImage" value="${obj.menuImage}" style="background-color: transparent;" /></td>
					</c:otherwise>
				</c:choose>
				
				
				<c:choose>
					<c:when test="${param.roleID ne obj.roleID }">
						<td>${obj.menuLink}</td>
					</c:when>
					<c:otherwise>
						<td><input type="file" name = "txtTenMenuLink" id="txtTenMenuLink" value="${obj.menuLink}" style="background-color: transparent;" /></td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.roleID eq obj.roleID }">
						
						<input type="hidden" name="actionStatus" value="capnhat" />
						<td><a href="javascript:checkValue()">Cập nhật</a>			
						</td>
					</c:when>
					<c:otherwise>
						<td><a href="<%=Constant.PATH_RES.getString("Admin.XemMenuPath") %>?appID=${obj.appID}&roleID=${obj.roleID}">Sửa</a></td>
					</c:otherwise>
				</c:choose>
				
				</tr>
			
			
				<% stt++;%>
			</c:forEach>
			
			<tr style="background-color: transparent;">
				<td colspan='5'><img src="<%=request.getContextPath()%>/images/buttom/themdong.png" alt="thêm dòng mới" onclick='linkThemDong()' border = "0" />
				<c:if test="${param.status eq 'themdong'}">
						<img src="<%=request.getContextPath()%>/images/buttom/xoadong.png" alt="xóa dòng mới" onclick="linkHuyThemDong()" border = "0" />
				</c:if>
				</td>
			</tr>
			<c:if test="${param.status eq 'themdong'}">
			<tr style="background-color: transparent;">
				<td><%=stt++%></td>
					<td><input type='text' name='txtTenMenuName' id='txtTenMenuName'  style="background-color: transparent;"/></td>
					<td><input type="file" name='txtTenMenuImage' id='txtTenMenuImage'  style="background-color: transparent;"/></td>
					<td><input type="file" name='txtTenMenuLink' id='txtTenMenuLink' style="background-color: transparent;"/></td>
					<td><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="thêm mới" onclick="checkValue()" border = "0" />		
					<input type="hidden" name="actionStatus" value="themmoi" />
				</td>
			</tr>
			</c:if>	
		</table>
		</c:if>
	</form>
		
		

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>