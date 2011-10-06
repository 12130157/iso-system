<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThangTheoDoiModel"%><pd4ml:transform
	screenWidth="700"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="30,20,0,20,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Times New Roman" monospace="Courier New" />
<pd4ml:header 
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM04-QT7.3/1               Ngày hiệu lực: 20/8/2010"
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask1.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,820,600,20"	      
       fontSize="12">       
 </pd4ml:footer>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Theo doi hoc tap</title> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>
<%
	ThangTheoDoiModel thangTheoDoi = (ThangTheoDoiModel) request.getSession().getAttribute("ThangTheoDoi");
	int count = 0;
%>
</head>
<div align="center">
<div class = "div_body">
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td style="width: 200px"></td>
			<td align="center">Mẫu số 3<br />Ban hành kèm theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan="3" align="center"><font size="5"><strong>THEO DÕI NGÀY HỌC TẬP</strong></font><br />
			Tháng <%=thangTheoDoi.getThang() %> năm 
			</td>
		</tr>
	</table>
	<table border = "1" width = "650" align="center" style="background-color: transparent; background-position: center;">
			<tr style="background-color: transparent; font-size: 9px" align="center">
				<td rowspan="2"><strong>STT</strong></td>
				<td rowspan="2"><strong>Họ và tên học viên</strong></td>
				<td colspan="31"><strong>NGÀY</strong></td>
				<td rowspan="2"><strong>Số giờ nghỉ có phép</strong></td>
				<td rowspan="2"><strong>Số giờ nghỉ không phép</strong></td>
				<td rowspan="2"><strong>Ghi chú</strong></td>
			</tr>
			<tr  style="background-color: transparent;font-size: 7px" align="center">
				<c:forEach var = "Ngay" begin = "1" end = "31">
					<td>${Ngay}</td>
				</c:forEach>
			</tr>
			<c:forEach var = "ThanhVienDiemDanh" items = "<%=thangTheoDoi.getThanhVienDiemDanhModelList() %>">
				<%
					int size = thangTheoDoi.getThanhVienDiemDanhModelList().get(count).getChiTietDiemDanhList().size();
					count++; 
				%>
				<c:set var = "dem" value = "0"/>
				<tr style="background-color: transparent; font-size: 9px" align="center">
					<td><%=count %></td>
					<td>${ThanhVienDiemDanh.tenThanhVien}</td>
					<c:forEach var = "Ngay" begin = "1" end = "31">
						<c:set var = "check" value = "0"/>
						<td>
							<c:forEach var = "Count" begin = "${dem}" end = "<%=size %>">
								<c:if test = "${Ngay eq ThanhVienDiemDanh.chiTietDiemDanhList[Count].ngay}">
									<c:choose>
										<c:when test = "${ChiTietDiemDanh[Count].tinhTrangDiHoc eq 4}">x&nbsp;</c:when>
										<c:otherwise>k&nbsp;</c:otherwise>
									</c:choose>
									<c:set var = "dem" value = "${Count + 1}"/>
									<c:set var = "check" value = "1"/>
								</c:if>
							</c:forEach>
							<c:if test = "${check eq '0'}">&nbsp;&nbsp;&nbsp;</c:if>
						</td>
					</c:forEach>
					<td><p></p></td>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
			</c:forEach>
		</table>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>