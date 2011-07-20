<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><pd4ml:transform
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
       titleTemplate="     BM05-QT7.3/1               Ngày hiệu lực: 15/9/2009"
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
<%@page import="java.io.PrintWriter"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Print Kế Hoạch Tuyển Nhân Sự</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="KeHoachTNS" value="${sessionScope.KeHoachTNS}"></c:set>
<c:set var="listDeNghi" value="${sessionScope.listDeNghi }"></c:set>
<c:set var="sig" value="-"></c:set>
<table width="700" height="550" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');background-position: center;">
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center; font-size: 12px;">
			<td>
				<div class = "div_td" style="text-align: center;">
					<b>ỦY BAN NHÂN DÂN QUẬN 5</b><br />
					<b>TRƯỜNG TRUNG CẤP NGHỀ KTCN HÙNG VƯƠNG</b>
				</div>
			</td>
			<td>
				<div class = "div_td" style="text-align: center;">
					<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br />
					<b>Độc lập - Tự do - Hạnh phúc</b>
				</div>
			</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<th colspan = "2"><br /><p style="font-weight: bold">Kế Hoạch Tuyển Nhân Sự ${KeHoachTNS.nam }</p><br /></th>
		</tr>
	</table>
	<table width = "650" border="1" style="background-color: transparent; background-position: top;margin-bottom: 30px;" id="TableKHTNS">
			<tr style="background-color: transparent;">
				<th colspan="1" rowspan="2" style="width:30px;"><div class = "div_txtintable1">Stt</div></th>
				<th colspan="1" rowspan="2" style="width:100px;"><div class = "div_txtintable1">Chức danh tuyển dụng</div></th>
				<th colspan="1" rowspan="2" style="width:100px;"><div class = "div_txtintable1">Bộ Phận</div></th>
				<th colspan="12" rowspan="1" style="width:240px;"><div class = "div_txtintable1">Thời gian tuyển dụng</div></th>
				<th colspan="1" rowspan="2" style="width:100px;"><div class = "div_txtintable1">Ghi chú</div></th>
			</tr>
			<tr style="background-color: transparent;">
				<c:forEach begin="1" end="12" var="i">
					<td style="width: 20px;text-align: center;">${i }</td>	
				</c:forEach>
			</tr>
			<c:set var = "stt" value="1"></c:set>

			<c:forEach var="model" items="${listDeNghi}">
				<tr style="background-color: transparent;">
					<td style="text-align: center;">${stt}</td>
					<td style="text-align: left;padding-left: 5px;">${model.user2 }</td>
					<td style="text-align: left;padding-left: 5px;">${model.user1 }</td>
					<c:forEach begin="1" end="12" var="i">
						<c:set var="n" value="1"></c:set>
						<td style="text-align: center;">
							<c:forEach var="tg" items="${model.list_thoi_gian}">
								<c:if test="${i eq tg.thoi_gian}">
									<c:if test="${n==1}">
									x
									</c:if>
									<c:set var="n" value="n+1"></c:set>
								</c:if>
							</c:forEach>
							<br/>&nbsp;
						</td>
					</c:forEach>
					<td style="text-align: left;padding-left: 5px;">${model.ghi_chu }</td>
				</tr>
				<c:set var = "stt" value="${stt+1}"></c:set>
			</c:forEach>
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td>
				<c:if test="${not empty KeHoachTNS.ngay_duyet_dmy}">
					ngày ${sf:getElement(KeHoachTNS.ngay_duyet_dmy,0,sig)} tháng ${sf:getElement(KeHoachTNS.ngay_duyet_dmy,1,sig)} năm ${sf:getElement(KeHoachTNS.ngay_duyet_dmy,2,sig)}
				</c:if>
			</td>
			<td>Quận 5, ngày ${sf:getElement(KeHoachTNS.ngay_lap_ke_hoach_dmy,0,sig)} tháng ${sf:getElement(KeHoachTNS.ngay_lap_ke_hoach_dmy,1,sig)} năm ${sf:getElement(KeHoachTNS.ngay_lap_ke_hoach_dmy,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td><p style="font-weight: bold; font-size: 14px">HIỆU TRƯỞNG </p></td>
			<td><p style="font-weight: bold; font-size: 14px">NGƯỜI LẬP PHIẾU </p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td><p style="font-weight: bold; font-size: 14px">${KeHoachTNS.ten_nguoi_duyet } </p></td>
			<td><p style="font-weight: bold; font-size: 14px">${KeHoachTNS.ten_nguoi_lap_ke_hoach }</p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
	</table>
</td>
</tr>
</table>
</div>
</div>
</html>
</pd4ml:transform>