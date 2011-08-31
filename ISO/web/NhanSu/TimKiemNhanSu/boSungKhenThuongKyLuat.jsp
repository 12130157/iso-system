<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietCongViecThanhVienDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bổ Sung Khen Thưởng/ Kỹ Luật</title>
<c:set var="listKhenThuongKyLuat" value='<%=ChiTietCongViecThanhVienDAO.getKhenThuongKyLuatByMaThanhVien(request.getParameter("maThanhVien")) %>'></c:set>
<c:if test="${not empty param.maKTKL}">
	<c:set var="khenThuongKyLuat" value='<%=ChiTietCongViecThanhVienDAO.getKTKLByID(request.getParameter("maKTKL").toString()) %>'></c:set>
</c:if>
<script>
	function submitForm(ac){
		var txtNoiDung = document.getElementById("txtNoiDung").value;
		var rong = /\s/g;
		var testNoiDung = txtNoiDung.replace(rong,"");
		if(testNoiDung==""){
			alert("Hãy Nhập Nội Dung !!!");
		}else{
			if(ac=='U'){
				document.getElementById("action").value = "Update";
				document.forms["BoSungKTKL"].submit();
				return;
			}
			if(ac=='C'){
				document.getElementById("action").value = "Create";
				document.forms["BoSungKTKL"].submit();
				return;
			}
		}
	}
</script>
</head>
<body>
	<div align="center">
		<form action="<%=request.getContextPath() %>/chiTietCongViecThanhVienController" method="post" name="BoSungKTKL">
			<c:if test="${not empty listKhenThuongKyLuat}">
				<table border="1" style="width: 600px;">
					<tr style="background-color: transparent;">
						<td width="100px" style="width: 100px;font-weight: bold;text-align: center;">Năm</td>
						<td width="250px" style="width: 250px;font-weight: bold;text-align: center;">Khen Thưởng</td>
						<td width="250px" style="width: 250px;font-weight: bold;text-align: center;">Kỹ Luật</td>
					</tr>
					<c:set var="n" value="1"></c:set>
					<c:set var="khenthuong" value=""></c:set>
					<c:set var="kyluat" value=""></c:set>
					<c:set var="listKTKLlength" value="${fn:length(listKhenThuongKyLuat)}"></c:set>
					<c:forEach var="listKhenThuongKyLuat" items="${listKhenThuongKyLuat}">
						<c:if test="${n eq '1'}">
							<c:set var="Nam1" value="${listKhenThuongKyLuat.namHoc}"></c:set>
							<c:set var="Nam2" value="${listKhenThuongKyLuat.namHoc}"></c:set>
						</c:if>
						<c:choose>
							<c:when test="${Nam1 ne Nam2}">
								<tr style="background-color: transparent;">
									<td valign="top" style="width: 100px;text-align: center;">${Nam1}</td>
									<td valign="top" style="width: 250px; text-align: left;padding-left: 5px;">${khenthuong }</td>
									<td valign="top" style="width: 250px; text-align: left;padding-left: 5px;">${kyluat }</td>
								</tr>
								<c:set var="khenthuong" value=""></c:set>
								<c:set var="kyluat" value=""></c:set>
								<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '1'}">
									<c:set var="khenthuong" value='<a href="/HungVuongISO/NhanSu/TimKiemNhanSu/boSungKhenThuongKyLuat.jsp?maThanhVien=${param.maThanhVien }&&maKTKL=${listKhenThuongKyLuat.id}">${listKhenThuongKyLuat.ghiChu}</a><br/><br/>'></c:set>
								</c:if>
								<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '0'}">
									<c:set var="kyluat" value='<a href="/HungVuongISO/NhanSu/TimKiemNhanSu/boSungKhenThuongKyLuat.jsp?maThanhVien=${param.maThanhVien}&&maKTKL=${listKhenThuongKyLuat.id}">${listKhenThuongKyLuat.ghiChu}</a><br/><br/>'></c:set>
								</c:if>
								<c:set var="Nam1" value="${listKhenThuongKyLuat.namHoc}"></c:set>
							</c:when>
							<c:otherwise>
								<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '1'}">
									<c:set var="khenthuong" value='${khenthuong}<a href="/HungVuongISO/NhanSu/TimKiemNhanSu/boSungKhenThuongKyLuat.jsp?maThanhVien=${param.maThanhVien}&&maKTKL=${listKhenThuongKyLuat.id}">${listKhenThuongKyLuat.ghiChu}</a><br/><br/>'></c:set>
								</c:if>
								<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '0'}">
									<c:set var="kyluat" value='${kyluat}<a href="/HungVuongISO/NhanSu/TimKiemNhanSu/boSungKhenThuongKyLuat.jsp?maThanhVien=${param.maThanhVien}&&maKTKL=${listKhenThuongKyLuat.id}">${listKhenThuongKyLuat.ghiChu}</a><br/><br/>'></c:set>
								</c:if>
							</c:otherwise>
						</c:choose>
						<c:if test="${n eq listKTKLlength}">
							<tr style="background-color: transparent;">
								<td valign="top" style="width: 100px;text-align: center;">${Nam1 }</td>
								<td valign="top" style="width: 250px; text-align: left;padding-left: 5px;">${khenthuong }</td>
								<td valign="top" style="width: 250px; text-align: left;padding-left: 5px;">${kyluat }</td>
							</tr>
						</c:if>
											
						<c:set var="Nam2" value="${listKhenThuongKyLuat.namHoc}"></c:set>
						<c:set var="n" value="${n+1}"></c:set>
					</c:forEach>
				</table>
			</c:if>
			<table>
				<tr>
					<td style="text-align: right;padding-right: 5px;">Loại</td>
					<td>
						<select name="txtLoaiGhiChu" id="txtLoaiGhiChu">
							<option value="1" <c:if test="${khenThuongKyLuat.loaiGhiChu eq 1}">selected</c:if> >Khen Thưởng</option>
							<option value="0" <c:if test="${khenThuongKyLuat.loaiGhiChu eq 0}">selected</c:if> >Kỷ Luật</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;padding-right: 5px;">Nội Dung</td>
					<td><textarea rows="2" cols="50" name="txtNoiDung" id="txtNoiDung">${khenThuongKyLuat.ghiChu }</textarea> </td>
				</tr>
			</table>

			<input type="button" value="Thêm" onclick="submitForm('C')" />
			<input type="button" value="Cập Nhật" onclick="submitForm('U')" />
			
			<input type="hidden" name="action" id="action" />
			<input type="hidden" name="maKTKL" id="maKTKL" value="${khenThuongKyLuat.id }" />
			<input type="hidden" name="maThanhVien" id="maThanhVien" value="${param.maThanhVien }" />
		</form>
	</div>
</body>
</html>