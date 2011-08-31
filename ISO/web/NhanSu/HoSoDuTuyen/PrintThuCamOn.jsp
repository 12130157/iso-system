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
       titleTemplate="     BM06-QT6.2/1               Ngày hiệu lực: 15/9/2009"
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
<title>Print Nhận Xét Kết Quả Thử Việc</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="HoSoDuTuyen" value="${sessionScope.HoSoDuTuyen}"></c:set>
<c:set var="sig" value="-"></c:set>
<table width="700" height="550" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');background-position: center;">
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center;">
			<td style="text-align: center;">
					<b style="font-weight: bold;font-size: 18px;">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
					<b style="font-weight: bold;font-size: 18px;">Độc Lập - Tự Do - Hạnh Phúc</b><br/>
					--------------------------
			</td>
		</tr>
		<tr style="background-color: transparent; background-position: center; font-size: 18px;">
			<td style="text-align: right;">
				Quận 5, ngày ${sf:getElement(HoSoDuTuyen.ngay_cap_nhat_cuoi,0,"-")} tháng ${sf:getElement(HoSoDuTuyen.ngay_cap_nhat_cuoi,1,"-")} năm ${sf:getElement(HoSoDuTuyen.ngay_cap_nhat_cuoi,2,"-")}
			</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td style="text-align: center;"><br /><br /><p style="font-weight: bold;font-size: 25px;">THƯ CÁM ƠN</p><br /><br /></td>
		</tr>
		<tr>
			<td style="text-align: center;">
				<b style="font-weight: bold;">Kính Gửi</b> : <b style="font-weight: bold;font-style: italic;">( <c:choose><c:when test="${HoSoDuTuyen.gioi_tinh eq 'Nam'}">Ông</c:when><c:otherwise>Bà</c:otherwise></c:choose> ${HoSoDuTuyen.ho_ten } )</b><br /><br />
			</td>
		</tr>
		<tr>
			<td style="text-align: left;padding-left: 10px;">
				<b style="font-weight: bold;">Khoa ${HoSoDuTuyen.ten_bo_phan }</b> chân thành cảm ơn sự cộng tác của quý <c:choose><c:when test="${HoSoDuTuyen.gioi_tinh eq 'Nam'}">Ông</c:when><c:otherwise>Bà</c:otherwise></c:choose>
				trong thời gian khoán thử việc tại trường.<br/>
				Hy vọng sẽ được cộng tác với quý <c:choose><c:when test="${HoSoDuTuyen.gioi_tinh eq 'Nam'}">Ông</c:when><c:otherwise>Bà</c:otherwise></c:choose> trong lĩnh vực khác.<br/>
				Trân trọng.  
			</td>
		</tr>
		<tr>
			<td style="padding-left: 300px;text-align: center">
					<b style="font-weight: bold;font-size: 16px;">Khoa ${HoSoDuTuyen.ten_bo_phan }</b><br/><br/><br/><br/><br/>
					<b style="font-weight: bold;font-size: 16px;">${HoSoDuTuyen.tenTruongKhoa }</b>
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
</div>
</div>
</html>
</pd4ml:transform>