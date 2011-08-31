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
<c:set var="NXKQTV" value="${sessionScope.NXKQTV}"></c:set>
<c:set var="sig" value="-"></c:set>
<table width="700" height="550" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');background-position: center;">
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center; font-size: 12px;">
			<td>
				<div class = "div_td" style="text-align: center;">
					TRƯỞNG TCN KTCN HÙNG VƯƠNG<br/>
					<b>P/K/BM ${NXKQTV.ten_bo_phan}</b><br/>
					--------------------------
				</div>
			</td>
			<td>
				<div class = "div_td" style="text-align: center;">
					<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
					<b>Độc Lập - Tự Do - Hạnh Phúc</b><br/>
					--------------------------
				</div>
			</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td colspan = "2"><br /><p style="font-weight: bold">BẢN TỰ NHẬN XÉT KẾT QUẢ THỬ VIỆC</p><br /></td>
		</tr>
	</table>
	<table style="background-color: transparent;width: 650px;padding-left: 100px;">
		<tr style="background-color: transparent;">
			<td style="text-align: left;">
				1/ Họ và tên người thử việc : <b>${NXKQTV.ten_nguoi_nhan_xet }</b> <br/>
				2/ Chức danh : <b>${NXKQTV.ten_vai_tro }</b> <br/>
				3/ Bộ phận : <b>${NXKQTV.ten_bo_phan }</b> <br/>
				4/ Thời gian thử việc : <b>${NXKQTV.thoi_gian_thu_viec }</b> <br/>
				Nay, tôi viết bản tự nhận xét kết quả công việc với các nội dung sau : <br/>
			</td>
		</tr>
	</table>
	<table style="background-color: transparent;width: 650px;">
		<tr style="background-color: transparent;">
			<td colspan="2" style="text-align: left;">
				-	 Về phẩm chất đạo đức : <br/>
				<textarea rows="2" cols="70" ${locktext } style="background-color: transparent;" id="areaNoiDung1" name="areaNoiDung1">${NXKQTV.noidung1 }</textarea><br/>
				-	 Về năng lực, trình độ và kết quả làm việc, học tập trong thời gian thử việc :<br/> 
				<textarea rows="2" cols="70" ${locktext } style="background-color: transparent;" id="areaNoiDung2" name="areaNoiDung2">${NXKQTV.noidung2 }</textarea><br/>
				-	 Về ý thức tổ chức chấp hành kỷ luật, nội qui, qui chế của cơ quan : <br/>
				<textarea rows="2" cols="70" ${locktext } style="background-color: transparent;" id="areaNoiDung3" name="areaNoiDung3">${NXKQTV.noidung3 }</textarea><br/>
				-	 Về việc chấp hành chủ trương, đường lối, chính sách của Đảng và Nhà nước : <br/>
				<textarea rows="2" cols="70" ${locktext } style="background-color: transparent;" id="areaNoiDung4" name="areaNoiDung4">${NXKQTV.noidung4 }</textarea><br/>				
			</td>
		</tr>
	</table>
	<table style="background-color: transparent;width: 650px;">
		<tr style="background-color: transparent;">
			<td style="padding-bottom: 50px;text-align: center;">
				<b>Đánh giá, nhận xét và đề xuất<br/> ký hợp đồng của Trưởng Bộ phận</b><br/>
				<c:choose>
					<c:when test="${NXKQTV.ghi_chu eq '1'}">
						<br /><br/><br/><b>Đề Xuất Ký Hợp Đồng</b>
					</c:when>
					<c:when test="${NXKQTV.ghi_chu eq '2'}">
						<br /><br/><br/><b>Không Thích Hợp Với Công Việc</b>
					</c:when>
				</c:choose>
			</td>
			<td style="padding-bottom: 50px;text-align: center;">
				<c:if test="${not empty NXKQTV.ngay_nhan_xet_mdy}">
					Quận 5, ngày ${sf:getElement(NXKQTV.ngay_nhan_xet_mdy,0,sig)} tháng ${sf:getElement(NXKQTV.ngay_nhan_xet_mdy,1,sig)} năm ${sf:getElement(NXKQTV.ngay_nhan_xet_mdy,2,sig)}
					<br /><b>Người thử việc</b><br /><br/><br/>
				<c:if test="${NXKQTV.tinh_trang ne '0' }"><b>${NXKQTV.ten_nguoi_nhan_xet }</b></c:if>
				</c:if> 
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"  style="text-align: center;">				 
				<br /><b>Thủ trưởng đơn vị phê duyệt</b><br />
				<br />${NXKQTV.ten_nguoi_duyet }
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