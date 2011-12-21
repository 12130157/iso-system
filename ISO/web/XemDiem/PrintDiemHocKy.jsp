<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="0,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />

<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/mask_ngang.gif" 
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>

<pd4ml:footer 
       titleTemplate="     BM02-QT7.5.1/3 & 8.4                          Ngày hiệu lực: 15/9/2009"                 
       pageNumberTemplate="Trang $[page]/$[total]     "
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20" 
       watermarkOpacity="50"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif" 
	   watermarkBounds="0,580,500,20"	      
       fontSize="12">       
</pd4ml:footer>

<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Print Điểm Học Kỳ</title> 
</head>
<body onload="pageLoad()">
<div align="center">
<div class = "div_body">

<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">	
	<tr>
		<td>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 15px;">
					<td><p style="font-weight: bold">TRƯỜNG TCN KTCN HÙNG VƯƠNG<br/>Khoa: </p></td>
					<td><p style="font-weight: bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
													 Độc lập - Tự do - Hạnh phúc</p></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 18px">BẢNG ĐIỂM HỌC KỲ</p><br /></th>
				</tr>
				<tr align="right" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td colspan="2">
						Lớp :  - Chuyên ngành : <br/>
						Năm học:  - Học kỳ: <br/>
					</td>
				</tr>
			</table>
				
			<table width = "900" border = "1" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td width="9%" rowspan="2"><strong>STT</strong></td>
					<td width="13%" rowspan="2"><strong>Tên học viên</strong></td>
					<td width="13%" colspan="6"><strong>Môn học</strong></td>
					<td width="13%" rowspan="2"><strong>TBHK</strong></td>
					<td width="13%" rowspan="2"><strong>Điểm RL</strong></td>
					<td width="13%" rowspan="2"><strong>TBC</strong></td>
					<td width="13%" colspan="2"><strong>Số ngày nghỉ</strong></td>
					<td width="13%" rowspan="2"><strong>Hạnh kiểm</strong></td>
					<td width="13%" rowspan="2"><strong>Xếp loại</strong></td>
					<td width="13%" rowspan="2"><strong>Ghi chú</strong></td>
				</tr>
				
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td width="13%"><strong>A35</strong></td>
					<td width="13%"><strong>B6</strong></td>
					<td width="13%"><strong>B8</strong></td>
					<td width="13%"><strong>A12</strong></td>
					<td width="13%"><strong>C1</strong></td>
					<td width="13%"><strong>A8</strong></td>
					<td width="13%"><strong>Phép</strong></td>
					<td width="13%"><strong>Ko P</strong></td>
				</tr>
				
				<tr align="center" style="background-color: transparent; background-position: center;  font-size: 16px;" valign="top">
					
				</tr>
				
			</table>
			
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr style="background-color: transparent; font-size: 16px;">
					<td>
						<table>
							<tr>
								<td>Số HV đạt loại Kém: </td>
							</tr>
							
							<tr>
								<td>Số HV đạt loại Yếu: </td>
							</tr>
							
							<tr>
								<td>Số HV đạt loại Trung Bình: </td>
							</tr>
							
							<tr>
								<td>Số HV đạt loại TB Khá: </td>
							</tr>
							
							<tr>
								<td>Số HV đạt loại Khá: </td>
							</tr>
							
							<tr>
								<td>Số HV đạt loại Giỏi: </td>
							</tr>
							
							<tr>
								<td>Số HV đạt loại Xuất sắc: </td>
							</tr>
						</table>
					</td>
					
					<td>
						<table>
							<tr>
								<td>Ghi chú môn học</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td><p style="font-weight: bold">Ban Giám hiệu </td>
					<td><p style="font-weight: bold">Trưởng khoa CNTT</td>
				</tr>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td><p style="font-weight: bold"></td>
					<td><p style="font-weight: bold"></td>
				</tr>
			</table>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</td>
	</tr>	
</table>
</div>
</div>
</body>
</html>
</pd4ml:transform>