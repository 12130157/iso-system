<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><fmt:bundle basename="i18n">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp"></meta>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Phân Lớp Học Cho Sinh Viên</title>

<script type="text/javascript" language="JavaScript">
function submit(){

	document.forms["ActionPhanLop"].submit();
}

</script>

</head>

<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>

<form action="<%=request.getContextPath()%>/AdminController" id = "ActionPhanLop" name = "ActionPhanLop" method="post">
	<input type = "hidden" name = "actionType" value="PhanLop" />
	<c:set var="listBoPhan" value="<%= KhoaDAO.getAllKhoaCoSinhVien() %>"></c:set>
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td>Khoa : 
				<select name="cboBoPhan">											
					<c:forEach var="khoa" items="${listBoPhan}">
						<option 
							<c:if test="${param.maKhoa eq khoa.maKhoa}">selected</c:if>
							value="${khoa.maKhoa}">${khoa.tenKhoa}
						</option> 
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			
		</tr>
	</table>
	
</form>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>