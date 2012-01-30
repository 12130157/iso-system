<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.LichSuThietBiDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:if test="${param.maThietBi ne ''}">
	<c:set var="listLichSuThietBi" value='<%=LichSuThietBiDAO.getLichSuThietBiByMaThietBi(request.getParameter("maThietBi").toString()) %>'></c:set>
	<c:set var="stt" value="1"></c:set>
</c:if>
</head>
<body>
	<table border="1">
		<tr>
			<th>Stt</th>
			<th>Tên Thiết Bị</th>
			<th>Tên Hành Động</th>
			<th>Ngày</th>
			<th>Vào Lúc</th>
			<th>Vật Tư Thay Thế</th>
			<th>Ghi Chú</th>
		</tr>
		<c:forEach var="lichSuThietBi" items="${listLichSuThietBi}">
			<tr>
				<td>${stt }</td>
				<td>${lichSuThietBi.tenThietBi }</td>
				<td>${lichSuThietBi.tenHanhDong }</td>
				<td>${lichSuThietBi.ngayThucHien }</td>
				<td>${lichSuThietBi.gioThucHien }</td>
				<td>${lichSuThietBi.tenVatTuThayThe }</td>
				<td>${lichSuThietBi.ghiChu }</td>
			</tr>
			<c:set var="stt" value="${stt+1}"></c:set>
		</c:forEach>
	</table>
</body>
</html>