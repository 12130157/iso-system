<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.util.ArrayList"%>

<%@page import="vn.edu.hungvuongaptech.dao.XemDiemDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>

<%@page import="vn.edu.hungvuongaptech.model.ChiTietThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>

<html>
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

<title>Xem Điểm Tốt Nghiệp</title>

<script type="text/javascript" language="JavaScript">

	function searchGiaoVienTN()
	{
		document.getElementById('actionType').value = 'GiaoVienTN';
		document.forms['ShowDiemTotNghiep'].submit();
	}
	function searchSinhVienTN()
	{
		document.getElementById('actionType').value = 'SinhVienTN';
		document.forms['ShowDiemTotNghiep'].submit();
	}
	
	function capNhatDiemTN()
	{
		document.getElementById('actionType').value = 'CapNhatDiemTN';
		document.forms['ShowDiemTotNghiep'].submit();
	}

</script>

</head>
<body>
<div align="center">

	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_XemDiem.jsp" />
	<!-- E HEAD CONTENT -->
	
	<%
		ArrayList<ChiTietThanhVienModel> sinhVienList = ChiTietThanhVienDAO.getAllChiTietThanhVienByMaLop((String) session.getAttribute("maLop"));
	%>
	
	<form action="<%=request.getContextPath()%>/XemDiemController" name="ShowDiemTotNghiep" method="post">
	
		<input type = "hidden" value = "" name = "actionType" id = "actionType"/>
		
		<c:set var="MaThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
		<c:set var = "VaiTroSV" value="<%=Constant.MA_VAI_TRO_HS%>"/>
		
		<c:if test="${sessionScope.maVaiTro eq VaiTroSV}">
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td colspan="7">
						<div class="div_thanhvientieude">
							Bảng Điểm Tốt Nghiệp
						</div>
					</td>
				</tr>
	
				<tr style="background-color: transparent;">
					<th style="background-color: #99bff9" align="right">
						Tên SV
					</th>
					
					<th style="background-color: #99bff9" align="left">
						<c:choose>
							<c:when test="${empty param.maSinhVien}">
								<c:set var="MaSV" value="${MaThanhVien}"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var = "MaSV" value = "${param.maSinhVien}"/>
							</c:otherwise>
						</c:choose>
						
						<c:set var="SinhVienList" value="<%= sinhVienList %>"></c:set>
						
						<select name="cboSinhVien" id="cboSinhVien">
							<c:forEach var="SinhVien" items="${SinhVienList}">
								<c:set var="i" value="1"></c:set>
								<option value="${SinhVien.maThanhVien}" <c:if test="${MaSV eq SinhVien.maThanhVien }">selected</c:if>								>
									${SinhVien.hoThanhVien} ${SinhVien.tenLot} ${SinhVien.tenThanhVien}
								</option>
								
								<c:if test="${empty i}">
									<option value="">Không có</option>
								</c:if>
							</c:forEach>
						</select>
					</th>
					
					<th style="background-color: #99bff9" align="right">
						Lớp
					</th>
					
					<th style="background-color: #99bff9" align="left">
						<input type="text" id="txtLopHoc" readonly="readonly" size="10" value="<%= (String) session.getAttribute("kiHieuLop") %>"></input>
					</th>

					<th style="background-color: #99bff9">
						<a href = ""><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
					</th>
				</tr>
			</table>
			
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Lần thi</div></th>
					<th bgcolor = "#186fb2" colspan="7"><div class = "div_textWhite">Điểm thi</div></th>
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Điểm TBTN</div></th>
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Xếp loại</div></th>
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Ghi chú</div></th>
				</tr>
				
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Chính trị</div></th>
					<th bgcolor = "#186fb2" colspan="3"><div class = "div_textWhite">Lý thuyết nghề</div></th>
					<th bgcolor = "#186fb2" colspan="3"><div class = "div_textWhite">Thực hành nghề</div></th>
				</tr>
				
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Trắc nghiệm</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Tự luận</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Tổng lý thuyết</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Modul 1</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Modul 2</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Tổng thực hành</div></th>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${sessionScope.maVaiTro ne VaiTroSV}">
			<table style="background-color: transparent;">
			
				<tr style="background-color: transparent;">
					<th colspan="9">
						<div class="div_thanhvientieude">
							Bảng Điểm Thi
						</div>
					</th>
				</tr>
				
				<tr style="background-color: transparent;">
					<th style="background-color: #99bff9" align="right">
						Khoa
					</th>
					
					<th style="background-color: #99bff9" align="left">
						<select name="cboKhoa" id="cboKhoa">
							<option>Không có</option>
						</select>
					</th>
					
					<th style="background-color: #99bff9" align="right">
						Lớp
					</th>
					
					<th style="background-color: #99bff9" align="left">
						<select name="cboLop" id="cboLop">
							<option>Không có</option>
						</select>
					</th>
					
					<th style="background-color: #99bff9" align="right">
						Niên khóa
					</th>
					
					<th style="background-color: #99bff9" align="left">
						<select name="cboNienKhoa" id="cboNienKhoa">
							<option>Không có</option>
						</select>
					</th>
					
					<th style="background-color: #99bff9" align="right">
						Lần thi
					</th>
					
					<th style="background-color: #99bff9" align="left">
						<select name="cboLan" id="cboLan">
							<option>Không có</option>
						</select>
					</th>
					
					<th style="background-color: #99bff9">
						<a href = ""><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
					</th>
				</tr>
			</table>
			
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">STT</div></th>
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Mã SV</div></th>
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Tên SV</div></th>
					<th bgcolor = "#186fb2" colspan="7"><div class = "div_textWhite">Điểm thi</div></th>
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Điểm TBTN</div></th>
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Xếp loại</div></th>
					<th bgcolor = "#186fb2" rowspan="3"><div class = "div_textWhite">Ghi chú</div></th>
				</tr>
				
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Chính trị</div></th>
					<th bgcolor = "#186fb2" colspan="3"><div class = "div_textWhite">Lý thuyết nghề</div></th>
					<th bgcolor = "#186fb2" colspan="3"><div class = "div_textWhite">Thực hành nghề</div></th>
				</tr>
				
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Trắc nghiệm</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Tự luận</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Tổng lý thuyết</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Modul 1</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Modul 2</div></th>
					<th bgcolor = "#186fb2"><div class = "div_textWhite">Tổng thực hành</div></th>
				</tr>
				
			</table>
		</c:if>
	</form>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
	
</div>
</body>
</html>