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
	function xyLyCombobox() {
		document.formLop.submit();
	}
	function ca1Chuyen0(){	{
		obj=document.getElementById("cboSinhVienCa1");
		str=obj.options[obj.selectedIndex].value;
		if(str=="")
		{
			document.Forms["formCa1Chuyen0"].submit();
			
		}
		
	}
</script>

</head>
<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_Admin.jsp" />
	<!-- E HEAD CONTENT -->
	<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan=""><div class = "div_thanhvientieude">Phân Ca Cho Sinh Viên</div></td></tr>
	</table>
	<c:set var="listLop" value = '<%= LopHocDAO.showLopHoc() %>' scope="session"></c:set>
	
	<form method="post" action="<%=request.getContextPath()%>/LopHocController" name="formLop" id="formLop">	
		<table style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td colspan="5">Lớp :
				<select onchange = "xyLyCombobox()" name = "cboLop" id ="cboLop" >
					<c:forEach var="lop" items="${listLop}" > 
						<option value = "${ lop.maLopHoc }" <c:if test="${param.lopHoc eq lop.maLopHoc}"> selected</c:if> > ${ lop.kiHieu } </option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</form>
	
	
	
		<tr style="background-color: transparent;">
			<td>Danh sách học sinh Ca 1 :</td>
			<td></td>
			<td>Lớp Hiện Tại :</td>
			<td></td>
			<td>Danh sách học sinh Ca 2 :</td>
		</tr>
		
		<tr style="background-color: transparent;">		
			<td>
			<c:set var="listThanhVienCa1" value = '<%= ThanhVienDAO.getThanhVienCa1ByMaLopHoc(request.getParameter("lopHoc")) %>' scope="session"></c:set>
				<form action="<%=request.getContextPath()%>/ThanhVienController?actionType=chuyenCa" method="post" Name = "formCa1Chuyen0" id = "formCa1Chuyen0">
					<select multiple="multiple" size="15" name="cboSinhVienCa1" id="cboSinhVienCa1">
						<c:forEach var = "sinhVienCa1" items = "${listThanhVienCa1}" >
							<option style="background-color: transparent;" value="${sinhVienCa1.maThanhVien}"> ${sinhVienCa1.tenLot} ${sinhVienCa1.tenThanhVien} ${sinhVienCa1.hoThanhVien }</option>	
						</c:forEach>
					</select>
				
				
			</td>
			<td>
				<img src="../..<%=Constant.PATH_RES.getString("IconAction.AddOne")%>" height='24' width='65' onClick="" style="cursor:pointer"/>
				<br></br>
				</form>
				<img src="../..<%=Constant.PATH_RES.getString("IconAction.DelOne")%>"  height='24' width='65' onclick="themChucNang()" style="cursor:pointer"/>
			</td>
			<td>
			<c:set var="listThanhVien" value = '<%= ThanhVienDAO.getThanhVienByMaLop(request.getParameter("lopHoc")) %>' scope="session"></c:set>
				
					<select multiple="multiple" size="15" name="cboSinhVien" id="cboSinhVien" style="background-color: transparent;">
						<c:forEach var = "sinhVien" items = "${listThanhVien}" >
							<option style="background-color: transparent;" value="${sinhVien.maThanhVien}"> ${sinhVien.tenLot} ${sinhVien.tenThanhVien} ${sinhVien.hoThanhVien }</option>			
						</c:forEach>
					</select>
				
			</td>
			<td>
				<img src="../..<%=Constant.PATH_RES.getString("IconAction.AddOne")%>" height='24' width='65' onclick="huyChucNang()" style="cursor:pointer"/>
				<br></br>
				<img src="../..<%=Constant.PATH_RES.getString("IconAction.DelOne")%>"  height='24' width='65' onclick="themChucNang()" style="cursor:pointer"/>
			</td>
			<td>
				<c:set var="listThanhVienCa2" value = '<%= ThanhVienDAO.getThanhVienCa2ByMaLop(request.getParameter("lopHoc")) %>' scope="session"></c:set>
				
					<select multiple="multiple" size="15" name="cboSinhVienCa2" id="cboSinhVienCa2" style="background-color: transparent;">
						<c:forEach var = "sinhVienCa2" items = "${listThanhVienCa2}" >
							<option style="background-color: transparent;" value="${sinhVienCa2.maThanhVien}"> ${sinhVienCa2.tenLot} ${sinhVienCa2.tenThanhVien} ${sinhVienCa2.hoThanhVien }</option>			
						</c:forEach>
					</select>
				
			</td>
		</tr>
		</table>

	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>
</fmt:bundle>