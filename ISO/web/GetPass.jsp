<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<title>Cổng Đăng Nhập Hùng Vương Portal</title>
<script type="text/javascript" language="JavaScript">

function submitlogin(){
	var msg = <%= "'" + request.getParameter("msg") + "'" %>;
	if ( document.getpass.txtTenDangNhap.value == "" ){
        alert("phải nhập tên đăng nhập !!!");
        return;
	}else if ( document.getpass.txtEmail.value == ""){
		alert("phải nhập email !!!");
		return;
	}
	document.forms["getpass"].submit();
}
</script>
</head>
<body>
<c:set var="TenDN" value = "${requestScope.tenDangNhap}"></c:set>
<div class = "div_pagebody">
<div align="center">
	<div class = "div_loand">
			<form id="getpass" name = "getpass" action="ThanhVienController?actionType=getPass" method="post" >
					<div class = "div_index">
					<div class = "rong">
					</div>		
					
						<c:if test="${param.err eq 'NtxtTenDangNhap'}">
							<b class="error">Tên đăng nhập không tồn tại !!!</b><br />
						</c:if>
						<c:if test="${param.err eq 'NtxtEmail'}">
							<b class="error">Email không hợp lệ !!!</b><br />
						</c:if>
						
					<c:choose>
						<c:when test="${param.msg eq 'c'}">
							<div class = "div_text">yêu cầu của bạn đã được thực thi !!!</div><br />
							<a href = "<%=request.getContextPath()%>/Login.jsp">
								<img src = "<%=request.getContextPath()%>/images/icon_action/back.png" border = "0"  />
							</a>
						</c:when>
						<c:otherwise>
							<div class = "text_Title_login">
								<b>Tên đăng nhập :&nbsp;</b><input type="text" name="txtTenDangNhap" style="background-color: transparent;" value = "${TenDN}"/>
								<p><br />
								<b>Email của bạn :&nbsp;</b><input type="text" name="txtEmail" style="background-color: transparent;" />
							</div><br />
							<div class="div_bt">
								<a href = "javascript: submitlogin()">
									<img src = "<%=request.getContextPath()%>/images/buttom/gui.png" border = "0"/>
								</a> 
								&nbsp;&nbsp;&nbsp;
								<a href = "<%=request.getContextPath()%>/Login.jsp">
									<img src = "<%=request.getContextPath()%>/images/icon_action/back.png" border = "0"  />
								</a>
								<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
								<div class = "div_text">
								Hãy điền đầy đũ thông tin trên và bấm nút gủi để lấy lại mật khẩu !!!<br />
								Mật khẩu sẽ được gửi đến cho bạn thông qua email mà bạn đã điền ở phần trên !!!
								</div>
							</div>
						</c:otherwise>
					</c:choose>										
					</div>
			</form>
	</div>
</div>
</div>
</body>
</html>