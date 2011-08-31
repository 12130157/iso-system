<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.DonXinThoiViecDAO"%><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp"></meta>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
	<title>ĐƠN XIN THÔI VIỆC</title>
	<c:set var="space" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></c:set>
	<c:choose>
		<c:when test="${not empty param.msg}">
			<c:set var="listDonXinThoiViec" value='<%=DonXinThoiViecDAO.getAllDonXinThoiViec(request.getParameter("msg")) %>'></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="listDonXinThoiViec" value='<%=DonXinThoiViecDAO.getAllDonXinThoiViec("") %>'></c:set>
		</c:otherwise>
	</c:choose>
	<script language="javascript">
		function submitForm(ac){
			if(ac=='C'){
				document.getElementById("action").value = "create";
				document.forms["showDonXinThoiViec"].submit();
			}
		}
	</script>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	<form action="<%=request.getContextPath() %>/donXinThoiViecController" method="post" name="showDonXinThoiViec">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>Đơn Xin Thôi Việc</strong></div><br /><br /></td>
			</tr>
		</table>
		<table border="1" style="background-color: transparent;">
				<tr style="background-color: transparent;">	
					<td>	
						<div class = "div_tinhtrang">Tình trạng :	
							<select name = "selectTinhTrang">	
								<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if>>All</option>
								<c:if test="${MaBoPhan eq BO_PHAN_ADMIN}">
									<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Pending</option>
								</c:if>
								<option value = "5" <c:if test = "${param.msg eq '5'}">selected</c:if>>Approve</option>
								<option value = "6" <c:if test = "${param.msg eq '6'}">selected</c:if>>Reject</option>
							</select>
							<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
						</div>
					</td>				
				</tr>
		</table>
		<table border="1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor="#186fb2" style="width: 300px;"><div class = "div_txtintable1">Người Đề Nghị</div></th>
				<th bgcolor="#186fb2" style="width: 100px;"><div class = "div_txtintable1">Bộ Phận</div></th>
				<th bgcolor="#186fb2" style="width: 100px;"><div class = "div_txtintable1">Ngày Lập</div></th>
				<th bgcolor="#186fb2" style="width: 80px;"><div class = "div_txtintable1">Aprrove</div>
					<input type="checkbox" disabled="disabled"/>
				</th>
				<th bgcolor="#186fb2" style="width: 80px;"><div class = "div_txtintable1">Reject</div>
					<input type="checkbox" disabled="disabled"/>
				</th> 
				<th bgcolor="#186fb2" style="width: 150px;"><div class = "div_txtintable1">Lý Do Reject</div></th>
			</tr>
		<c:forEach var="model" items="${listDonXinThoiViec}">
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;">
					<a href="<%=request.getContextPath()%>/NhanSu/DonXinThoiViec/DonXinThoiViec.jsp?id=${model.maDonXinThoiViec}">
						 ${model.tenNguoiDuTuyen } 
					</a>
					<br/><c:if test="${model.tinhTrang eq '0'}"><p style="color: red;font-style: italic;font-weight: bold;">***Chưa Gửi***</p></c:if>
				</td>
				<td style="background-color: transparent;">${model.tenBoPhan }</td>
				<td style="background-color: transparent;">${model.ngayLapDMY }</td>
				<td style="background-color: transparent;">
					<input type="radio" 
						<c:if test="${model.tinhTrang eq '5'}">
							checked
						</c:if>
					  disabled="disabled"/>
				</td>
				<td style="background-color: transparent;">
					<input type="radio"
						<c:if test="${model.tinhTrang eq '6'}">
							checked
						</c:if>
				 	 disabled="disabled"/>
				 </td>
				<td style="background-color: transparent;"><textarea style="background-color: transparent;" rows="3" cols="15" readonly="readonly"><c:if test="${model.tinhTrang eq '6'}">${model.lyDoReject }</c:if></textarea> </td>
			</tr>	
		</c:forEach>
	</table>
			<a href="javascript: submitForm('C')">
				<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
			</a>
			<input type="hidden" name="action" id="action" />																				
	</form>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>