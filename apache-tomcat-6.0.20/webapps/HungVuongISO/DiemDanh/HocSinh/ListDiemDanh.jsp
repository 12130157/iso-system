<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DiemDanhDAO" %>

<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%><html xmlns="http://www.w3.org/1999/xhtml">
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
	function submit(){
		document.Action.txtIDSinhVien.focus();
	}
	function submitlogin(){
		document.forms["ActionDDSinhVien"].submit();
	}
</script>
<title>Điểm Danh</title>
</head>
<body onload="submit();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_diemdanh.jsp" />
	<!-- E HEAD CONTENT -->
	
	<c:if test="${param.err eq 'khongdukitu'}">
			<b class="error">Ban Phai Nhap Du 18 Ky Tu</b><br />
	</c:if>
	<c:if test="${param.TinhTrang eq 'ThatBai'}">
			<b class="error">Thẻ Không Hợp Lệ</b><br />
	</c:if>
	<c:if test="${param.tt eq 'lan3'}">
			<b class="error">Kết Thúc Ngày Học</b><br />
	</c:if>
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td colspan="4"><div class = "div_thanhvientieude">Thông Tin Giáo Viên</div></td></tr>
	</table>
	<form action="<%=request.getContextPath()%>/DiemDanhController" id = "ActionDDSinhVien" name = "ActionDDSinhVien" method="post">
		<input type = "hidden" name="actionType" id="actionType" value="DDSinhVien" />
		<input type = "hidden" name="maGiaoVien" id="maGiaoVien" value="<%= request.getParameter("IDThe")%>"/>
		<c:set var="gvDiemDanh" value = '<%= DiemDanhDAO.GetGiaoVienById(request.getParameter("IDThe")) %>' scope="session"></c:set>
					
			<table border="0" style="background-image: url('../../images/background_diemdanh.png');background-color : transparent;">
				<tr style="background-color : transparent; ">
					<td><div class = "div_txtleft">GV :</div></td>
					<td><div class = "div_txtleft">${gvDiemDanh.tenGiaoVien}</div></td>
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
		<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Thông Tin Sinh Viên</div></td></tr>
	</table>
	
	<table style="background-image: url('../../images/background_diemdanh.png'); background-color: transparent; " border = "0" >
			<tr style="background-color: transparent;">
			<td>Hình Ảnh : </td>
			<td> 
			<c:if test="${not empty requestScope.thongTinDiemDanh}">
			<img src = "<%=request.getContextPath()%>${requestScope.thongTinDiemDanh.user1}" height="100" width="100"/>
			</c:if>
			</td> 
			</tr>
			<tr  style="background-color: transparent;">
			<td>
			Họ Tên : 
			</td>
			<td>
				<c:if test="${empty requestScope.thongTinDiemDanh}">
					&nbsp
				</c:if>
				<c:if test="${not empty requestScope.thongTinDiemDanh}">
						<c:out value="
						${requestScope.thongTinDiemDanh.hoThanhVien}
						${requestScope.thongTinDiemDanh.tenLot}
						${requestScope.thongTinDiemDanh.tenThanhVien} 
						"></c:out>	
						</c:if>
			</td>
		</tr>
	</table>
	
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td><div class = "div_thanhvientieude">Danh Sách Sinh Viên</div></td></tr>
	</table>
				<c:set var="ntMonHoc" value = '<%= DiemDanhDAO.GetDiemDanhModel() %>' scope="session"></c:set>
				
					<table border='0' style="background-color: transparent;">
						<tr style="background-color: transparent;">
							<td >
								<font color="#0000FF"><b>ID :</b></font>
								<input type="text" name = "txtIDSinhVien" id = "txtIDSinhVien" style="background-color: transparent;" />	

								<a href = "javascript: submitlogin()">
								<img src = "<%=request.getContextPath()%>/images/buttom/diemdanh.png" border = "0"/>						
								</a>
						
							</td>
						</tr>
					</table>
					
				<c:set var="listThanhVien" value = '<%= DiemDanhDAO.GetThanhVienByIdGiaoVien(request.getParameter("IDThe")) %>' scope="session"></c:set>
					<% int stt=1 ;%>
					
					<!-- begin phan mau dong -->
					<% int count = 0; %>
					<c:set var="iterator" value="<%=count%>"></c:set>
					<!-- end phan mau dong -->
					
					<table border="1" style="background-color : transparent; width: 580px">
						
						<tr style="background-color: #778899; color: white;">
							<td>STT</td>
							<td>ID</td>
							<td>Họ & Tên</td>
							<td>Tình Trạng</td>
						</tr>
						
						<c:forEach items="${listThanhVien}" var="list">
						<tr
							<c:if test="${iterator % 2 eq 1}">style="background-color: #E6E6FA; background-color: white;"</c:if>
							<c:if test="${iterator % 2 eq 0}">style="background-color: transparent;"</c:if>>
							<td><%=stt%></td>
							<td>ID</td>
							<td>${list.hoGiaoVien} ${list.tenLotGiaoVien} ${list.tenGiaoVien}</td>
							<td>
								<c:if test= "${list.tinhTrang eq '1'}">
									Vắng Mặt
								</c:if>
								<c:if test= "${list.tinhTrang eq '2'}">
									Đang học 
								</c:if>
								<c:if test= "${list.tinhTrang eq '3'}">
									Kết Thúc 
								</c:if>
								<c:if test= "${list.tinhTrang eq '4'}">
									Có Đi Học 
								</c:if>
							</td>
						</tr>
						<% stt++; %>
						</c:forEach>
					</table>
					<br></br>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>