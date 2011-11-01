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
       titleTemplate="     BM02-QT6.2/1               Ngày hiệu lực: 15/9/2009"
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
<title>Đề Nghị Nhân Sự</title> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="DeNghiNhanSu" value="${sessionScope.DeNghiNhanSu}"></c:set>
<c:set var="listTieuChuan" value="${sessionScope.listTieuChuan }"></c:set>
<c:set var="sig" value="-"></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center; font-size: 12px;">
			<td><p style="font-weight: bold;text-align: center">Trường TCNKTCN Hùng Vương<br/>
			P/K/BM ${DeNghiNhanSu.ten_bo_phan}
			</p></td>
			<td><p style="font-weight: bold;text-align: center">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
			Độc Lập - Tự Do - Hạnh Phúc
			</p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<th colspan = "2"><br /> <p style="font-weight: bold">ĐỀ XUẤT TUYỂN DỤNG NHÂN SỰ</p><br /></th>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
			<tr style="background-color: transparent;">
				<td valign="top">Kính Gửi :</td>
				<td style="text-align: left">
					- Hiệu Trưởng Trường Trung Cấp Nghề KTCN Hùng Vương<br/>
					- Trưởng Phòng Tổ Chức Hành Chánh Quản Trị<br/>
					- Trưởng Phòng Đào Tạo (nếu là giáo viên)
				</td>
			</tr>
	</table>
	<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan="2" style="text-align: left;">
					<p>
					Căn cứ hoạt động năm ${DeNghiNhanSu.nam} và nhu cầu thực tế về viên chức làm việc theo chức danh.
					Phòng/Khoa/Bộ Môn <b>${DeNghiNhanSu.ten_bo_phan }</b> đề nghị Hiệu Trưởng Trường Trung Cấp Nghề
					 Kỹ Thuật Công Nghệ Hùng Vương tuyển dụng nhân sự cho bộ phận để đáp ứng nhu cầu trên.
					</p>
				</td>
			</tr>
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 14px;">
				<td colspan = "2">
					<p>*Chức danh : ${DeNghiNhanSu.ten_chuc_danh }</p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 14px;">
				<td colspan = "2">
					<p>*Dự kiến phân công nhiệm vụ : ${DeNghiNhanSu.cong_viec }</p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 14px;">
				<td colspan = "2">
					<p>*Số lượng : ${DeNghiNhanSu.so_luong }</p>
				</td>
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 14px;">
				<td colspan = "2">
					*Tiêu chuẩn tuyển dụng : ( theo qui định tuyển dụng với từng chức danh )
				</td>
			</tr>
			<c:set var="stt" value="1"></c:set>
			<c:forEach var="TieuChuan" items="${listTieuChuan}">			
				<tr style="background-color: transparent; font-size: 14px;">
					<td style="text-align: right;width: 40px;">${stt }.</td>
					<td>
						${TieuChuan.tieu_chuan }
					</td>
				</tr>
				<c:set var="stt" value="${stt+1}"></c:set>
			</c:forEach>				
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 14px;">
				<td colspan = "2">
					<p>*Thời gian bắt đầu làm : ${DeNghiNhanSu.thoi_gian_bat_dau_lam_mdy }</p>
				</td>
			</tr>						
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td>
				<c:if test="${not empty DeNghiNhanSu.ngay_HC_duyet_mdy}">
					Ngày ${sf:getElement(DeNghiNhanSu.ngay_HC_duyet_mdy,0,sig)} tháng ${sf:getElement(DeNghiNhanSu.ngay_HC_duyet_mdy,1,sig)} năm ${sf:getElement(DeNghiNhanSu.ngay_HC_duyet_mdy,2,sig)}
				</c:if>
			</td>
			<c:if test="${DeNghiNhanSu.chuc_danh eq '8'}">
				<td>
					<c:if test="${not empty DeNghiNhanSu.ngay_DT_duyet_mdy}">
						Ngày ${sf:getElement(DeNghiNhanSu.ngay_DT_duyet_mdy,0,sig)} tháng ${sf:getElement(DeNghiNhanSu.ngay_DT_duyet_mdy,1,sig)} năm ${sf:getElement(DeNghiNhanSu.ngay_DT_duyet_mdy,2,sig)}
					</c:if>
				</td>
			</c:if>
			<td>Quận 5, ngày ${sf:getElement(DeNghiNhanSu.ngay_TK_duyet_mdy,0,sig)} tháng ${sf:getElement(DeNghiNhanSu.ngay_TK_duyet_mdy,1,sig)} năm ${sf:getElement(DeNghiNhanSu.ngay_TK_duyet_mdy,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td><p style="font-weight: bold; font-size: 14px">TRƯỞNG PHÒNG TCHCQT </p></td>
			<c:if test="${DeNghiNhanSu.chuc_danh eq '8'}">
				<td><p style="font-weight: bold; font-size: 14px">TRƯỞNG PHÒNG ĐÀO TẠO </p></td>
			</c:if>
			<td><p style="font-weight: bold; font-size: 14px">TRƯỞNG P/K/BM</p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td><p style="font-weight: bold; font-size: 14px">${DeNghiNhanSu.ten_phong_HC } </p></td>
			<c:if test="${DeNghiNhanSu.chuc_danh eq '8'}">
				<td><p style="font-weight: bold; font-size: 14px">${DeNghiNhanSu.ten_phong_DT } </p></td>
			</c:if>
			<td><p style="font-weight: bold; font-size: 14px">${DeNghiNhanSu.ten_truong_khoa }</p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td></td>
			<td>
				<c:if test="${not empty DeNghiNhanSu.ngay_HT_duyet_mdy}">
					Ngày ${sf:getElement(DeNghiNhanSu.ngay_HT_duyet_mdy,0,sig)} tháng ${sf:getElement(DeNghiNhanSu.ngay_HT_duyet_mdy,1,sig)} năm ${sf:getElement(DeNghiNhanSu.ngay_HT_duyet_mdy,2,sig)}
				</c:if>
			</td>
			<td></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td colspan="3"><p style="font-weight: bold; font-size: 14px">HIỆU TRƯỞNG </p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td colspan="3"><p style="font-weight: bold; font-size: 14px">${DeNghiNhanSu.ten_hieu_truong } </p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
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