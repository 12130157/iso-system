<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.model.SysRoleAppModel"%>
<%@page import="java.util.ArrayList"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link href="<%=request.getContextPath()%>/icon.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Hệ Thống Quản Lý Trường Hùng Vương</title>
<script type="text/javascript" language="JavaScript">
function checkValue(){
	var currentPass = <%= "'" + request.getSession().getAttribute("matKhau").toString() + "'" %> ;
	if ( document.ChangePass.txtMatKhauCu.value == "" ){
	     alert("phải nhập mật khẩu cũ !!!" );
	     return;
	}  else if( document.ChangePass.txtMatKhauMoi.value == "" ){
		 alert("phải nhập mật khẩu mới !!!");
		 return;
	} else if(document.ChangePass.txtMatKhauMoi.value ==  document.ChangePass.txtMatKhauCu.value){
		alert("mật khẩu mới không trùng với mật khẩu cũ !!!");
		return;
	} else if(document.ChangePass.txtMatKhauMoi.value != document.ChangePass.txtNhapLaiMatKhauMoi.value ){
		alert("nhập lại mật khẩu mới phải giống với mật khẩu mơi nhập !!!");
		return;
	} 
	document.forms["ChangePass"].submit();
}

</script>
</head>
<body>
	<div class = "div_pagebody">
		<div align="center">
			
			<!-- S HEAD CONTENT -->
					<jsp:include page="block/header.jsp" />
			<!-- E HEAD CONTENT -->
				<c:if test="${param.msg eq 'c'}"> update khong thanh cong</c:if>
				<form action="ThanhVienController?actionType=changePass" name = "ChangePass" method="post">
					<table cellpadding="4" align="center" style="background-color: transparent;">	
								<c:if test="${param.err eq 'a'}">
									<tr><td colspan="2"><b class="error">Mật Khẩu cũ không đúng !</b></td></tr>
								</c:if>
								<tr style="background-color: transparent;">
									<td colspan="2"><h3>Thay Đổi Mật Khẩu</h3></td>
								</tr>
								<tr style="background-color: transparent;">
									<td>Nhâp Mật Khẩu Cũ :</td>
									<td><input type="password" name="txtMatKhauCu" style="background-color: transparent;" /></td>
								</tr>
								<tr style="background-color: transparent;">
									<td>Nhâp Mật Khẩu Mới:</td>
									<td><input type="password" name="txtMatKhauMoi" style="background-color: transparent;" /></td>
								</tr>
								<tr style="background-color: transparent;">
									<td>Xác nhận mật khẩu mới :</td>
									<td><input type="password" name="txtNhapLaiMatKhauMoi" style="background-color: transparent;"/></td>
								</tr>
								<tr style="background-color: transparent;">
									<td colspan="2">
										<a href = "javascript: checkValue()">
											<img src = "<%=request.getContextPath()%>/images/buttom/capnhat.png" border = "0"/>
										</a> 
									</td>
								</tr>	
					</table>
				</form>		
		
			<!-- S FOOT CONTENT -->
					<jsp:include page="block/footer.jsp" />
				<!-- E FOOT CONTENT -->
				
		</div>
	</div>
</body>
</html>