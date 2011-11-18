<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietCongViecThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChungChiBangCapKhacDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh Sách Chứng Chỉ/Bằng Cấp Khác</title>
<c:set var="listChungChiBangCapKhac" value='<%=ChungChiBangCapKhacDAO.getDanhSachChungChiBangCapKhac() %>'></c:set>
<c:if test="${not empty param.loai}">
	<c:set var="listDoUuTien" value='<%=ChungChiBangCapKhacDAO.getDanhSachChungChiBangCapKhac(request.getParameter("loai").toString()) %>'></c:set>
</c:if>
<script>
	function submitForm(ac){
		if(ac=='C'){
			document.getElementById("action").value = "create";
			document.forms["ChungChiBangCapKhac"].submit();
		}
	}
	
	function getListDoUuTien(){
		var loai = document.getElementById("txtLoai").value;
		location.href = "<%=request.getContextPath() %>/NhanSu/TimKiemNhanSu/ChungChiBangCapKhac.jsp?loai="+loai;
		
	}
</script>
</head>
<body>
	<div align="center">
		<form action="<%=request.getContextPath() %>/chungChiBangCapKhacController" method="post" name="ChungChiBangCapKhac">
			<table style="width: 600px;margin-top: 30px;">
				<tr>
					<td colspan="3" style="padding-left: 10px;font-weight: bold;font-size: 18px;">
						Thêm Mới Chứng Chỉ/ Bằng Cấp Khác
						<c:if test="${not empty requestScope.error}"><br/><font style="color: red;font-style: italic;">${requestScope.error}</font></c:if>
					</td>
				</tr>
				<tr>
					<td style="width: 100px;">Loại</td>
					<td style="width: 300px;">Tên</td>
					<td style="width: 200px;">Cấp độ</td>
				</tr>
				<tr>
					<td>
						<select name="txtLoai" id="txtLoai" onchange="getListDoUuTien()">
							<option value="1" <c:if test="${param.loai eq 1}">selected</c:if>>Anh Văn</option>
							<option value="2" <c:if test="${param.loai eq 2}">selected</c:if>>Tin Học</option>
							<option value="3" <c:if test="${param.loai eq 3}">selected</c:if>>Khác</option>
						</select>
					</td>
					<td><input style="width: 300px;" type="text" name="txtTen" id="txtTen"/></td>
					<td>
						<select name="txtDoUuTien" id="txtDoUuTien" style="width: 200px;">
							<option value="-1">Cao Nhất</option>
							<c:forEach var="doUuTien" items="${listDoUuTien}">
								<option value="${doUuTien.doUuTien }">${doUuTien.ten }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
			<input type="button" value="Tạo Mới" onclick="submitForm('C')"/>
			<input type="hidden" name="action" id="action" />
			<input type="button" value="Đóng" />
			<table style="width: 600px;" border="1">
				<tr>
					<th style="width: 50px;">Stt</th>
					<th style="width: 300px;">Tên</th>
					<th style="width: 150px;">Loại</th>
					<th style="width: 100px;">Cấp độ</th>
				</tr>
				<c:set var="stt" value="1"></c:set>
				<c:forEach var="ccbck" items="${listChungChiBangCapKhac}">
					<tr>
						<td style="text-align: center;">${stt }</td>
						<td style="text-align: left;padding-left: 5px;">${ccbck.ten }</td>
						<td style="text-align: center;">
							<c:choose>
								<c:when test="${ccbck.loai eq 1}">
									Anh Văn
								</c:when>
								<c:when test="${ccbck.loai eq 2}">
									Tin Học
								</c:when>
								<c:when test="${ccbck.loai eq 3}">
									Khác
								</c:when>
							</c:choose>
						</td>
						<td style="text-align: center;">${ccbck.doUuTien }</td>
					</tr>
					<c:set var="stt" value="${stt+1}"></c:set>
				</c:forEach>
			</table>
			
		</form>
	</div>
</body>
</html>