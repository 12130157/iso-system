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

function checkValue(){
/*	str=document.getElementById("txtTenAppImage").value;
	exst=str.substring(str.length-4,str.length);
	if(document.forms['ActionUngDung'].txtTenAppName.value == "" || document.forms['ActionUngDung'].txtTenAppName.value == null){
		 alert("Bạn phải nhập tên ứng dụng !!" );
	     return;
	}
	else if(str!=""&&exst!=".png")
	{
		alert("Bạn chỉ chọn file png");
		return;
	}
*/
	var rong = /\s/g;

	var tenAppName = document.ActionUngDung.txtTenAppName.value;
	var value = tenAppName.replace(rong,"");
	if(value == ""){
		 alert("Bạn phải nhập Tên Ứng Dụng !!!" );
	     return;
	}
	
	var tenAppLink = document.ActionUngDung.txtTenAppLink.value;
	var value_1 = tenAppLink.replace(rong,"");
	if(value_1 == ""){
		 alert("Bạn phải nhập đường dẫn !!!" );
	     return;
	}
	
	var tenAppImage = document.ActionUngDung.txtTenAppImage.value;
	var value_2 = tenAppImage.replace(rong,"");
	if(value_2 == ""){
		 alert("Bạn phải nhập tên hình !!!" );
	     return;
	}
	document.forms['ActionUngDung'].submit();
}

function linkThemDong()
{
	location.href="<%=Constant.PATH_RES.getString("Admin.XemUngDungPath") %>?status=themdong";
}

</script>

</head>
<body onload="">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var="listApp" value="<%=SysRoleAppDAO.getAllSysApp() %>"></c:set>
	
	<form action="<%=request.getContextPath()%>/AdminController" id ="ActionUngDung"  name = "ActionUngDung" method="post" enctype="application/x-www-form-urlencoded/multipart/form-data">
		<input type="hidden" name="actionType" value="UngDung" />
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_thanhvientieude">Danh Sách Các Ứng Dụng</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<c:if test="${param.err eq 'insertTB'}">
						<b class="error">Ứng dụng này đã có rồi !!!</b>
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
		<table border="1" style="background-color: transparent;">		
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite">STT</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tên Ứng Dụng</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Đường Dẫn</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Hình</div></th>
				<th bgcolor=#186fb2"></th>
			</tr>
			<% int stt=1; %>
			
			<c:forEach items="${listApp}" var="obj">
			
				<tr style="background-color: transparent;">
				<c:choose>
					<c:when test="${param.appID ne obj.appID }">
						<td><%=stt%></td>
					</c:when>
					<c:otherwise>
						<td>		
							<%=stt%>
							<input type='hidden' value="${obj.appID}" style="background-color:transparent;border:none;text-align:center"  name="txtTenID" id="txtTenID"/>
						</td>
					</c:otherwise>
				</c:choose>	
					<% stt++; %>	
				<c:choose>
					<c:when test="${param.appID ne obj.appID }">
						<td><a href="<%=Constant.PATH_RES.getString("Admin.XemPhanQuyenPath")%>?appID=${obj.appID}">${obj.appName}</a></td>
					</c:when>
					<c:otherwise>
						<td><input type="text" name = "txtTenAppName" id="txtTenAppName" value="${obj.appName}" style="background-color: transparent;" /></td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${param.appID ne obj.appID }">
						<td>${obj.appLink}</td>
					</c:when>
					<c:otherwise>
						<td><input type="file" name = "txtTenAppLink" id="txtTenAppLink" value="${obj.appLink}" style="background-color: transparent;" /></td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${param.appID ne obj.appID }">
						<td><img src="../../${obj.appImage}" height="50"/></td>
					</c:when>
					<c:otherwise>
						<td><input type="file" name ="txtTenAppImage" id="txtTenAppImage" value="${obj.appImage}" style="background-color: transparent;" /></td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${param.appID eq obj.appID }">
						
						<input type="hidden" name="actionStatus" value="capnhat" />
						<td><a href="javascript:checkValue()">Cập nhật</a>
						
						</td>
					</c:when>
					<c:otherwise>
						<td><a href="<%=Constant.PATH_RES.getString("Admin.XemUngDungPath") %>?appID=${obj.appID}">Sửa</a></td>
					</c:otherwise>
				</c:choose>
				
				</tr>
				
			</c:forEach>
				<tr style="background-color: transparent;"><td colspan='5'><img src="<%=request.getContextPath()%>/images/buttom/themdong.png" alt="thêm dòng mới" onclick='linkThemDong()' border = "0" />
					<c:if test="${param.status eq 'themdong'}">
						<img src="<%=request.getContextPath()%>/images/buttom/xoadong.png" alt="xóa dòng mới" onclick="location.href='<%=Constant.PATH_RES.getString("Admin.XemUngDungPath")%>'" border = "0" />
					</c:if>
				</td>
				</tr>
				
				<c:if test="${param.status eq 'themdong'}">
					<tr style="background-color: transparent;">
					<td><%=stt++%></td>
					<td><input type='text' name='txtTenAppName' id='txtAppName' style="background-color: transparent;"/></td>
					<td><input type="file" name='txtTenAppLink' id='txtTenAppLink' style="background-color: transparent;"/></td>
					<td><input type="file" name='txtTenAppImage' id='txtTenAppImage' style="background-color: transparent;"/></td>
					<td>
						<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="thêm mới" onclick="checkValue()" border = "0" />
					</td></tr>
					<input type="hidden" name="actionStatus" value="themmoi" />
				
				
				</c:if>			
		</table>
	</form>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>