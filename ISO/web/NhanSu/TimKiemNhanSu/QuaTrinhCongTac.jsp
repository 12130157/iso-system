<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietCongViecThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChungChiBangCapKhacDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.QuaTrinhCongTacDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<title>Danh Sách Chứng Chỉ/Bằng Cấp Khác</title>

<c:if test="${not empty param.maThanhVien}">
	<c:set var="listQuaTrinhCongTac" value='<%=QuaTrinhCongTacDAO.getQuaTrinhCongTac(request.getParameter("maThanhVien").toString()) %>'></c:set>
</c:if>
<script>
	function submitForm(ac){
		if(ac=='C'){
			if(document.getElementById("txtChucVu")=='error'){
				alert("Bạn chưa chọn Chức Vụ !!!");
			}else{
				document.getElementById("action").value = "create";
				document.forms["QuaTrinhCongTac"].submit();
			}
		}
	}
</script>
</head>
<body>
	<div align="center">
		<form action="<%=request.getContextPath() %>/quaTrinhCongTacController" method="post" name="QuaTrinhCongTac">
			<table style="width: 600px;margin-top: 30px;">
				<tr>
					<td colspan="3" style="padding-left: 10px;font-weight: bold;font-size: 18px;">
						Thêm Mới Quá Trình Công Tác
						<c:if test="${not empty requestScope.error}"><br/><font style="color: red;font-style: italic;">${requestScope.error}</font></c:if>
					</td>
				</tr>
				<tr>
					<td style="width: 100px;">Ngày Nhận Chức</td>
					<td style="width: 300px;">Chức Vụ</td>
				</tr>
				<tr>
					<td><input type="text" name="txtNgayNhanChuc" id="txtNgayNhanChuc" readonly="readonly" /></td>
					<td>
						<select name="txtChucVu" id="txtChucVu">
							<option value="error">Chọn</option>
							<c:set var="listVT" value="<%=VaiTroDAO.getVaiTroKhongSinhVien() %>"/>
							<c:forEach var="model" items="${listVT}">
								<option value="${model.maVaiTro }">${model.tenVaiTro }</option>						
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
			<input type="button" value="Tạo Mới" onclick="submitForm('C')"/>
			<input type="hidden" name="action" id="action" />
			<input type="hidden" name="maThanhVien" id="maThanhVien" value="${param.maThanhVien }" />
			<table style="width: 600px;" border="1">
				<tr>
					<th style="width: 50px;">Stt</th>
					<th style="width: 275px;">Ngày Nhận Chức</th>
					<th style="width: 275px;">Chức Vụ</th>
				</tr>
				<c:set var="stt" value="1"></c:set>
				<c:forEach var="qtct" items="${listQuaTrinhCongTac}">
					<tr>
						<td style="text-align: center;">${stt }</td>
						<td style="text-align: center;">${qtct.ngayNhanChuc }</td>
						<td style="text-align: center;">${qtct.tenChucVu }</td>
					</tr>
					<c:set var="stt" value="${stt+1}"></c:set>
				</c:forEach>
			</table>
			
		</form>
	</div>
	<script type="text/javascript">
	  Zapatec.Calendar.setup({
		firstDay          : 1,
		weekNumbers       : false,
		range             : [1960.01, 2040.12],
		electric          : false,
		inputField        : "txtNgayNhanChuc",
		button            : "txtNgayNhanChuc",
		ifFormat          : "%d-%m-%Y"
	  });
	</script>
</body>
</html>