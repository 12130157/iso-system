<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>


<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
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

<title>Hệ Thống Quản Lý Sinh Viên</title>
<script>
function btnsearch()
{
	document.getElementById("hidden").value = "search";
	document.forms["SinhVienController"].submit();
}
function btnReset()
{
	document.getElementById("SHo").value = "";
	document.getElementById("SSoNha").value = "";
	document.getElementById("STenLot").value = "";
	document.getElementById("STenDuong").value = "";
	document.getElementById("STen").value = "";
	document.getElementById("SPhuongXa").value = "";
	document.getElementById("SNgaySinh").value = "";
	document.getElementById("SQuanHuyen").value = "";
	document.getElementById("SEmail").value = "";
	document.getElementById("STinhTP").value = "";
	document.getElementById("SBoPhan").selectedIndex = 0;
}
</script>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_QuanLySinhVien.jsp" />
	<!-- E HEAD CONTENT -->	
	
<form action="<%=request.getContextPath()%>/SinhVienController" method="post" name="SinhVienController" id="SinhVienController">
	<table class="div_table_TimKiem" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan="6" style="background-color: transparent;" align="center" >
					<h3>Tìm kiếm sinh viên<input name="hidden" id="hidden" type="hidden"/></h3>					
				</td>			
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Họ : </td>
				<td><input style="background-color: transparent;" type="text" id="SHo" name="SHo" <c:if test="${not empty requestScope.ho}"> value="${requestScope.ho}" </c:if> /></td>
				<td></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Số nhà : </td>
				<td><input style="background-color: transparent;" type="text" id="SSoNha" name="SSoNha" <c:if test="${not empty requestScope.sonha}"> value="${requestScope.sonha}" </c:if> /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Tên lót : </td>
				<td><input style="background-color: transparent;" type="text" id="STenLot" name="STenLot" <c:if test="${not empty requestScope.tenlot}"> value="${requestScope.tenlot}" </c:if> /></td>
				<td></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Tên đường : </td>
				<td><input style="background-color: transparent;" type="text" id="STenDuong" name="STenDuong" <c:if test="${not empty requestScope.tenduong}"> value="${requestScope.tenduong}" </c:if> /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Tên : </td>
				<td><input style="background-color: transparent;" type="text" id="STen" name="STen" <c:if test="${not empty requestScope.ten}"> value="${requestScope.ten}" </c:if> /></td>
				<td></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Phường/ xã : </td>
				<td><input style="background-color: transparent;" type="text" id="SPhuongXa" name="SPhuongXa" <c:if test="${not empty requestScope.phuongxa}"> value="${requestScope.phuongxa}" </c:if> /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Ngày sinh : </td>
				<td> <input style="background-color: transparent;" type="text" id="SNgaySinh" readonly="readonly" <c:if test="${not empty requestScope.ngaysinh}"> value="${requestScope.ngaysinh}" </c:if> id="SNgaySinh" name="SNgaySinh" /></td>
				<td></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Quận/ huyện : </td>
				<td><input style="background-color: transparent;" type="text" id="SQuanHuyen" name="SQuanHuyen" <c:if test="${not empty requestScope.quanhuyen}"> value="${requestScope.quanhuyen}" </c:if> /></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Email : </td>
				<td><input style="background-color: transparent;" type="text" id="SEmail" name="SEmail" <c:if test="${not empty requestScope.email}"> value="${requestScope.email}" </c:if> /></td>
				<td></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Tỉnh/ thành phố : </td>
				<td><input style="background-color: transparent;" type="text"id="STinhTP"  name="STinhTP" <c:if test="${not empty requestScope.tinh}"> value="${requestScope.tinh}" </c:if> /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Bộ phận : </td>
				<td colspan="4" style="text-align: left;padding-left: 30px;">
					<c:set var="listBP" value="<%=KhoaDAO.getAllKhoa_QLSV() %>"></c:set>
					<select id="SBoPhan" name="SBoPhan" style="background-color: transparent;">
						<option value="All">Tất Cả</option>
						<c:forEach var="model" items="${listBP}">
							<option value="${model.maKhoa }" <c:if test="${model.maKhoa eq requestScope.bophan}">selected</c:if>>${model.tenKhoa }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="6" style="background-color: transparent;" align="center">
					<a href="javascript: btnsearch();">
						<img src="<%=request.getContextPath()%>/images/buttom/timkiem2.png" alt="Thêm" border = "0"/>
					</a>
					<a href="javascript: btnReset();">
						<img src="<%=request.getContextPath()%>/images/buttom/reset2.png" alt="Thêm" border = "0"/>
					</a>
				</td>
			</tr>			
		</table>	
		<script type="text/javascript">
			  <%
			  	for(int i=1; i<= 1 ; i++) {
			  		String output = "";
			  		output += "Zapatec.Calendar.setup({";
			  		output += "firstDay          : 1,";
			  		output += "weekNumbers       : false,";
			  		output += "range             : [2000.01, 2030.12],";
			  		output += "electric          : false,";
			  		output += "inputField        : 'SNgaySinh',";
			  		output += "button            : 'SNgaySinh',";
			  		output += "ifFormat          : '%m-%d-%Y'";
			  		output += "});";  		
			  		out.println(output); 
			  	}
			  %>
		</script>
</form>
		<div class = "div_tieude" style="width: 790px;">DANH SÁCH SINH VIÊN</div>
		
		<table border="1" class="div_table_TimKiem" style="background-color: transparent; width: 790px; margin: 20px;" >

				<tr style="background-color: #186fb2; color: white; ">
					<th style="background-color: transparent;width: 50px;">Stt</th>
					<th style="background-color: transparent;width: 150px;">Họ tên</th>
					<th style="background-color: transparent;width: 100px;">Ngày sinh</th>
					<th style="background-color: transparent;width: 200px;">Email</th>
					<th style="background-color: transparent;width: 100px;">Bộ phận</th>
					<th style="background-color: transparent;width: 100px;">Vai trò</th>
				</tr>
				
				<c:choose>		
				<c:when test="${ empty requestScope.SHo}">
					<c:set var="n" value="1" />
					<c:forEach var="item" items="${dssv}">
						<tr style="background-color: transparent;">
							<td style="background-color: transparent;height: 50px;">${n}</td>
						<td style="background-color: transparent;text-align: left;padding-left: 5px;">
							<a href="<%=request.getContextPath() %>/QuanLySinhVien/ThongTinCaNhan.jsp?maThanhVien=${item.maThanhVien}">
								${item.hoTen }
							</a>
						</td>
						<td style="background-color: transparent;">${item.ngaySinh }</td>
						<td style="background-color: transparent;text-align: left;padding-left: 5px;">${item.email }</td>
						<td style="background-color: transparent;">${item.tenKhoa }</td>
						<td style="background-color: transparent;">${item.tenVaiTro }</td>
						</tr>
						<c:set var="n" value="${n+1}" />
					</c:forEach>				
				</c:when>		
					
				<c:when test="${not empty requestScope.SHo}">
				<c:set var="n" value="1" /><c:set var="listNS" value='<%=ThanhVienDAO.timSinhVien("","","","","","","","","","","","") %>' />
				<c:forEach items="${listNS}" var="model">
				<tr style="background-color: transparent;">
					<c:choose>
						<c:when test="${empty param.pages}">
							<c:set var="pages" value="1"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="pages" value="${param.pages}"></c:set>
						</c:otherwise>
					</c:choose>
					<td style="background-color: transparent;height: 50px;">${n+((pages-1)*20) }</td>
					<td style="background-color: transparent;text-align: left;padding-left: 5px;">
						<a href="<%=request.getContextPath() %>/QuanLySinhVien/ThongTinSinhVien.jsp?maThanhVien=${model.maThanhVien}">
							${model.hoTen }
						</a>
					</td>
					<td style="background-color: transparent;">${model.ngaySinh }</td>
					<td style="background-color: transparent;text-align: left;padding-left: 5px;">${model.email }</td>
					<td style="background-color: transparent;">${model.tenKhoa }</td>
					<td style="background-color: transparent;">${model.tenVaiTro }</td>
				</tr>
				<c:set var="n" value="${n+1}" />
				</c:forEach>				
				</c:when>
				</c:choose>			
		</table>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>