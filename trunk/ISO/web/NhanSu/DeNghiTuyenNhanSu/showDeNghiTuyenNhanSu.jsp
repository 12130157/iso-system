<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DeNghiNhanSuDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp"/>
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
<title>Xem Đề Nghị Tuyển Nhân Sự</title>
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "BO_PHAN_PDT" value = '<%= Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "TRUONG_KHOA" value= '<%=Constant.TRUONG_KHOA %>'></c:set>
	<c:set var = "ADMIN" value= '<%=Constant.ADMIN %>'></c:set>
	
	<c:set var = "TINHTRANG_BGH_APPROVE_DNTNS" value = '<%= Constant.TINHTRANG_BGH_APPROVE_DNTNS %>'></c:set>
	<c:set var = "TINHTRANG_PHC_APPROVE_DNTNS" value = '<%= Constant.TINHTRANG_PHC_APPROVE_DNTNS %>'></c:set>
	<c:set var = "TINHTRANG_PDT_APPROVE_DNTNS" value = '<%= Constant.TINHTRANG_PDT_APPROVE_DNTNS %>'></c:set>
	<c:set var = "TINHTRANG_TK_APPROVE_DNTNS" value = '<%= Constant.TINHTRANG_TK_APPROVE_DNTNS %>'></c:set>
	<c:set var="sig" value="/"></c:set>
	
	<c:choose>
		<c:when test="${not empty param.msg}">
			<c:set var="listDeNghi" value='<%=DeNghiNhanSuDAO.getAllDeNghi(session.getAttribute("maBoPhan").toString(),session.getAttribute("maThanhVien").toString(),request.getParameter("msg")) %>'></c:set>	
		</c:when>
		<c:otherwise>
			<c:set var="listDeNghi" value='<%=DeNghiNhanSuDAO.getAllDeNghi(session.getAttribute("maBoPhan").toString(),session.getAttribute("maThanhVien").toString(),"") %>'></c:set>
		</c:otherwise>
	</c:choose>
	<script>
		function submitFormSearch(){
			document.getElementById("action").value = 'search';
			document.forms["dsDeNghiNS"].submit();
		}
	</script>
</head>
<body>	
	<div align="center">
		<!-- S HEAD CONTENT -->
				<jsp:include page="../../block/header_NhanSu.jsp" />
		<!-- E HEAD CONTENT -->
		<form action="<%=request.getContextPath() %>/deNghiNhanSuController" name="dsDeNghiNS" method="post">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>Đề Nghị Tuyển Nhân Sự</strong></div><br /><br /></td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">	
					<td colspan = "6">	
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
				<th bgcolor="#186fb2" style="width: 300px;"><div class = "div_txtintable1">Tên Đề Nghị</div></th>
				<th bgcolor="#186fb2" style="width: 100px;"><div class = "div_txtintable1">Người Lập</div></th>
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
		<c:forEach var="model" items="${listDeNghi}">
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;">
					<a href="<%=request.getContextPath()%>/NhanSu/DeNghiTuyenNhanSu/DeNghiTuyenNhanSu.jsp?id=${model.id}">
						 ${model.ten_chuc_danh } - ${model.nam} 
					<br/><c:if test="${model.bo_sung ne '0'}">( Bổ Sung Lần ${model.bo_sung } )</c:if>
					</a>
					<br/><c:if test="${model.tinh_trang eq '0'}"><p style="color: red;font-style: italic;font-weight: bold;">***Chưa Gửi***</p></c:if>
				</td>
				<td style="background-color: transparent;">${model.ten_nguoi_de_nghi }</td>
				<td style="background-color: transparent;">${model.ten_bo_phan }</td>
				<td style="background-color: transparent;">${model.ngay_lap_mdy }</td>
				<td style="background-color: transparent;">
					<input type="radio" 
						<c:if test="${model.tinh_trang eq '5'}">
							checked
						</c:if>
					 name="txtTinhTrang${model.id}" disabled="disabled"/>
				</td>
				<td style="background-color: transparent;">
					<input type="radio"
						<c:if test="${not empty model.ly_do_reject}">
							checked
						</c:if>
				 	name="txtTinhTrang${model.id}" disabled="disabled"/>
				 </td>
				<td style="background-color: transparent;"><textarea style="background-color: transparent;" rows="3" cols="15" readonly="readonly">${model.ly_do_reject }</textarea> </td>
			</tr>	
		</c:forEach>
		</table>
					<c:choose>
						<c:when test="${MaBoPhan eq BO_PHAN_ADMIN || MaBoPhan eq BO_PHAN_BGH || MaBoPhan eq BO_PHAN_PDT || MaBoPhan eq BO_PHAN_PHC}">
						</c:when>
						<c:otherwise>
							<c:if test="${vaiTro eq TRUONG_KHOA || vaiTro eq ADMIN}">
								<a href="<%=request.getContextPath() %>/NhanSu/DeNghiTuyenNhanSu/DeNghiTuyenNhanSu.jsp?Them=yes">
									<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
								</a>
							</c:if>								
						</c:otherwise>
					</c:choose>																
		
		<input type="hidden" id="action" name="action" />
		</form>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
		<!-- E FOOT CONTENT -->
		
	</div>

</body>
</html>