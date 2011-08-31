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
		document.forms["loginform"].submit();
}
function submitReset(){	
document.forms["loginform"].reset();
return false;
}
</script>
</head>
<body>
<div class = "div_pagebody">
<div align="center">
	<div class = "div_loand">
			<form id="loginform" action="ThanhVienController?actionType=login" method="post" >
					<div class = "div_index">
					<div class = "rong">
					</div>
					<div class = "text_Title_login">
					
						<c:if test="${param.err eq 'err'}">
								<b class="error">Đăng nhập thất bại</b><br />
						</c:if>
						<c:if test="${param.msg eq 'thanhcong'}">
								<b class="msg">Bạn đã thay đổi mật khẩu thành công !!! <br /> yêu cầu đăng nhập lại</b><br /><br />
						</c:if>
						<c:if test="${param.err eq 'khongHoatDong'}">
								<b class="error">Tài khoản này không hợp lệ !!! <br /> yêu cầu liên hệ với người quản lý</b><br /><br />
						</c:if>
							<b>Tên đăng nhập : </b><input type="text" name="txtTenDangNhap" value = "" maxlength="20" style="background-color: transparent; color: blue;" /><p><br /><p>
							<b>Nhập mật khẩu : </b><input type="password" name="txtMatKhau" value = "" maxlength="20" style="background-color: transparent; color: blue;" />
					</div><br />
					<div class="div_bt">
						<a href = "javascript: submitlogin()">
							<img src = "<%=request.getContextPath()%>/images/buttom/dangnhap.png" border = "0"/>
						</a> 
						&nbsp;&nbsp;&nbsp;
						<a href="#" onclick="submitReset();return false;">
							<img src ="<%=request.getContextPath()%>/images/buttom/huybo.png" border = "0"/>
						</a>
					<br /><br />
					<a href="<%=request.getContextPath()%>/GetPass.jsp" ><strong>Quên mật khẩu</strong></a><br/>
					<a style="text-decoration: none;" href="<%=request.getContextPath() %>/NhanSu/HoSoDuTuyen/HoSoDuTuyen.jsp?Them=yes">
						Đăng Ký Dự Tuyển
					</a>
					</div>
					</div>
			</form>
	</div>
</div>
</div>
</body>
</html>