<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DiemDanhDAO" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<script type="text/javascript" language="JavaScript">
	
	function submitlogin(){
		document.forms["ActionDDOnlSinhVien"].submit();
	
	}
	function check()
	{
		if(document.ActionDDOnlSinhVien.fullCheck.checked==true){
			<%
			for (Integer i = 1; i < Constant.NUM_ROWS; i++) {
				out.print("document.ActionDDOnlSinhVien.checkbox" + i.toString() +".checked = true;\n");
			}
			%>
		}
		else 
			{
				<%
				for (Integer i = 1; i < Constant.NUM_ROWS; i++) {
					out.print("document.ActionDDOnlSinhVien.checkbox" + i.toString() +".checked = false;\n");
				}
				%>
			}	 
	}

	function selectCheckboxRow() {	
		if (document.ActionDDOnlSinhVien.fullCheck.checked==true)
		{
			document.ActionDDOnlSinhVien.fullCheck.checked=false;
		}		
	}
	
</script> 		

<title>Điểm Danh online</title>
</head>
<body onload="check();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_diemdanh.jsp" />
	<!-- E HEAD CONTENT -->
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td colspan="4"><div class = "div_thanhvientieude">Thông Tin Giáo Viên</div></td></tr>
	</table>
	<form action="<%=request.getContextPath()%>/DiemDanhController" id = "ActionDDSinhVien" name = "ActionDDSinhVien" method="post">
		<input type = "hidden" name="actionType" id="actionType" value="DDSinhVien" />
		<input type = "hidden" name="maGiaoVien" id="maGiaoVien" value="<%= request.getParameter("IDThe")%>"/>
		<c:set var="gvDiemDanh" value = '<%= DiemDanhDAO.GetGiaoVienById(request.getParameter("IDThe")) %>' scope="session"></c:set>
					
					<table border="0" style="background-image: url('../../images/background_diemdanh.png');background-color : transparent;">
						<tr style="background-color : transparent; ">
							<td><div class = "div_txtleft">GV : </div></td>
							<td><div class = "div_txtleft">{gvDiemDanh.tenGiaoVien}</div></td>
							<td><div class = "div_txtleft">Khoa : </div></td>
							<td><div class = "div_txtleft">${gvDiemDanh.tenKhoa}</div></td>
						</tr>
						<tr style="background-color : transparent;">
							<td><div class = "div_txtleft">Môn học : </div></td>
							<td><div class = "div_txtleft">${gvDiemDanh.tenMonHoc}</div></td>
							<td><div class = "div_txtleft">Ca : </div></td>
							<td><div class = "div_txtleft">${gvDiemDanh.buoi}</div></td>
						</tr>
						<tr style="background-color : transparent;">
							<td><div class = "div_txtleft">Thứ : </div></td>
							<td><div class = "div_txtleft">${gvDiemDanh.dayOfWeek}</div></td>
							<td><div class = "div_txtleft">Ngày : </div></td>
							<td><div class = "div_txtleft">${gvDiemDanh.ngayHienTai}</div></td>
						</tr>
						<tr style="background-color : transparent;">
							<td><div class = "div_txtleft">TG Khóa Học : </div></td>
							<td><div class = "div_txtleft">${gvDiemDanh.ngayBatDau}-->${gvDiemDanh.ngayKetThuc}</div></td>
							<td><div class = "div_txtleft">Hình Thức Dạy : </div></td>
							<td><div class = "div_txtleft">${gvDiemDanh.hinhThucDay}</div></td>
						</tr>
						
					</table>
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td colspan="4"><div class = "div_thanhvientieude">Danh Sách Sinh Viên</div></td></tr>
	</table>
				</form>
				<form action="<%=request.getContextPath()%>/DiemDanhController" id = "ActionDDOnlSinhVien" name = "ActionDDOnlSinhVien" method="post">
					<input type = "hidden" name="actionType" id="actionType" value="DDOnlineSinhVien" />
		
					<input type = "hidden" name="maGiaoVien" id="maGiaoVien" value="<%= request.getParameter("IDThe")%>"/>
				<c:set var="listThanhVien" value = '<%= DiemDanhDAO.GetThanhVienByIdGiaoVien(request.getParameter("IDThe")) %>' scope="session"></c:set>
					<% Constant.NUM_ROWS=1 ;%>
					<% int stt=1 ; %>
					<table border="1" style="background-image: url('../../images/background_diemdanh.png');background-color : transparent; width: 580px">
						
						<tr style="background-color: transparent;">
							<td>STT</td>
							<td>ID</td>
							<td>Họ & Tên</td>
							<td>
								<input type="checkbox" name="fullCheck" id="fullCheck" onclick = "check();" />
							</td>
						</tr>
						<c:forEach items="${listThanhVien}" var="list">
						<tr style="background-color: transparent;">
							<td><%=stt%></td>
							<td>ID</td>
							<td>${list.hoGiaoVien} ${list.tenLotGiaoVien} ${list.tenGiaoVien}</td>
							<td>
								<c:if test= "${list.tinhTrang eq '1'}">
								<input type = "checkbox" name ="checkbox<%=Constant.NUM_ROWS%>"	id ="checkbox<%=Constant.NUM_ROWS%>" onclick="selectCheckboxRow()"  value="${list.maThanhVienDiemDanh}"/>
								<%Constant.NUM_ROWS++; %>
								</c:if>
								<c:if test= "${list.tinhTrang eq '2'}">
								<input type = "checkbox" name ="checkbox<%=Constant.NUM_ROWS%>"	id ="checkbox<%=Constant.NUM_ROWS%>" onclick="selectCheckboxRow()"  value="${list.maThanhVienDiemDanh}"/>
								<%Constant.NUM_ROWS++; %>
								</c:if>
								<c:if test= "${list.tinhTrang eq '3'}">
								<input type = "checkbox" name ="checkbox<%=Constant.NUM_ROWS%>"	id ="checkbox<%=Constant.NUM_ROWS%>" onclick="selectCheckboxRow()"  value="${list.maThanhVienDiemDanh}"/>
								<%Constant.NUM_ROWS++; %>
								</c:if>
								<c:if test= "${list.tinhTrang eq '4'}">
								<input type = "checkbox" name ="checkbox"	id ="checkbox" onclick="selectCheckboxRow()"  value="${list.maThanhVienDiemDanh}" disabled="disabled" checked="checked"/>
								</c:if>
							</td>
						</tr>
							<% stt++; %>
						</c:forEach>
						<input type = "hidden" name="listSinhVien" id = "listSinhVien" value = "<%=Constant.NUM_ROWS%>"/>
						<tr>
							<td colspan="4"> 
								<a href = "javascript: submitlogin()">
									<img src = "<%=request.getContextPath()%>/images/buttom/luu.png" border = "0"/>
								</a>
							</td>
						</tr>
					</table>
					<br></br>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>