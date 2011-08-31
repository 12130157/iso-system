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
       titleTemplate="     BM07-QT6.2/1               Ngày hiệu lực: 15/9/2009"
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Đề Nghị Nhân Sự</title> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="DonXinThoiViec" value="${sessionScope.DonXinThoiViec }"></c:set>
<c:set var="HopDongLaoDong" value="${sessionScope.HopDongLaoDong }"></c:set>
<c:set var="space" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td style="text-align: center;">
				<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
				<b>Độc Lập - Tự Do - Hạnh Phúc</b><br/>
				--------------------------
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="text-align: center;">
				<strong style="font-size: 25px;"><br/><br/>ĐƠN XIN THÔI VIỆC<br/>(CHẤM DỨT HỢP ĐỒNG LÀM VIỆC)<br/><br/></strong>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td valign="top">Kính Gửi :</td>
			<td style="text-align: left">
				- Hiệu Trưởng Trường Trung Cấp Nghề KTCN Hùng Vương<br/>
				- Trưởng Phòng Tổ Chức Hành Chánh Quản Trị<br/>
				<c:if test="${DonXinThoiViec.maVaiTro eq '8'}">- Trưởng Phòng Đào Tạo<br/></c:if>
				- Trưởng Bộ Phận ${DonXinThoiViec.tenBoPhan }<br/><br/>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2" style="text-align: left;">
				${space }Tôi tên là : ${DonXinThoiViec.tenNguoiDuTuyen }<br/><br/>
				${space }Giới Tính : ${DonXinThoiViec.gioiTinh }<br/><br/>
				${space }Ngày tháng năm sinh : ${DonXinThoiViec.ngaySinh }<br/><br/>
				${space }Là viên chức chức danh , đang ký hợp đồng làm việc có thời hạn(${HopDongLaoDong.thoi_gian } tháng) 
				với nhà trường (từ ngày ${HopDongLaoDong.bat_dau_mdy } đến ngày ${HopDongLaoDong.ket_thuc_mdy }) tại bộ phận ${DonXinThoiViec.tenBoPhan }. <br/><br/>
				${space }Nay tôi làm đơn này kính đề nghị Ban Giám Hiệu, Phòng Tổ Chức Hành Chánh Quản Trị,
				Phòng Đạo Tạo, Bộ Phận ${DonXinThoiViec.tenBoPhan } cho tôi được thôi việc (hoặc chấm dứt hợp đồng làm việc) 
				kể từ ngày ${DonXinThoiViec.ngayThoiViecDMY }<br/><br/>
				${space }Lý do : <br/>
				${space }<textarea rows="2" cols="60" id="txtLyDo" name="txtLyDo">${DonXinThoiViec.lyDo }</textarea><br/>
				${space }Rất mong được sự chấp thuận của Ban Giám Hiệu.
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2" style="text-align: center;padding-left: 400px;">
				<c:if test="${not empty DonXinThoiViec.ngayLap}">
					Ngày ${sf:getElement(DonXinThoiViec.ngayLapDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayLapDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayLapDMY,2,'-')}<br/>
				</c:if>
				Kính đơn<br/><br/><br/>
				<c:if test="${DonXinThoiViec.tinhTrang ne '0' and DonXinThoiViec.tinhTrang ne '6'}">
					${DonXinThoiViec.tenNguoiDuTuyen }
				</c:if>
				<br/><br/>
			</td>
		</tr>
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: center;">
		<tr style="background-color: transparent;padding-bottom: 20px;">
			<td style="padding-bottom: 50px;text-align: center;">
				<c:if test="${not empty DonXinThoiViec.ngayHCduyet}">
				ngày ${sf:getElement(DonXinThoiViec.ngayHCduyetDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayHCduyetDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayHCduyetDMY,2,'-')}<br/>
				</c:if> 
				<br />TRƯỞNG PHÒNG TCHCQT<br />
				<br /><b>${DonXinThoiViec.tenPhongHC }</b>	
			</td>
			<c:if test="${DonXinThoiViec.maVaiTro eq '8'}">
				<td style="padding-bottom: 50px;text-align: center;">
					<c:if test="${not empty DonXinThoiViec.ngayDTduyet}">
					ngày ${sf:getElement(DonXinThoiViec.ngayDTduyetDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayDTduyetDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayDTduyetDMY,2,'-')}<br/>
					</c:if>  
					<br />TRƯỞNG PHÒNG ĐÀO TẠO<br />
					<br /><b>${DonXinThoiViec.tenPhongDT }</b>
				</td>
			</c:if>
			<td style="padding-bottom: 50px;text-align: center;">
				<c:if test="${not empty DonXinThoiViec.ngayTKduyet}">
				Quận 5, ngày ${sf:getElement(DonXinThoiViec.ngayTKduyetDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayTKduyetDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayTKduyetDMY,2,'-')}<br/>
				</c:if>
				<br />TRƯỞNG P/K/BM ${boPhan.tenKhoa }<br />
				<br /><b>${DonXinThoiViec.tenTruongKhoa }</b>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="3"  style="padding-bottom: 50px;text-align: center;">
				<c:if test="${not empty DonXinThoiViec.ngayHTduyet}">
				ngày ${sf:getElement(DonXinThoiViec.ngayHTduyetDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayHTduyetDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayHTduyetDMY,2,'-')}<br/>
				</c:if>  
				<br />HIỆU TRƯỞNG<br />
				<br /><b>${DonXinThoiViec.tenHieuTruong }</b>
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