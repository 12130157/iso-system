<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NoiDungChiTietKHDTDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.model.NguoiThucHienModel"%>
<%@page import="vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%>
<%
	KeHoachThangModel keHoachThang = (KeHoachThangModel)request.getSession().getAttribute("KeHoachThang");
	int soTuan = TuanLeDAO.getSoTuanByThangAndNam(keHoachThang.getThang(), keHoachThang.getNam());
%>


<%@page import="vn.edu.hungvuongaptech.model.KeHoachThangModel"%><pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="10,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"   
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM04-QT7.3/1                     Ngày hiệu lực: 15/9/2009"
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask1.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,580,500,20"	      
       fontSize="14">       
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
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Kế hoạch tháng</title> 
</head>
<div align="center">
<div class = "div_body">
<c:set var="KeHoachThang" value="<%=keHoachThang %>"></c:set>
<table border = "1px" width="100%" height="100%" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">
	
	<tr><td>
	<table width = "700" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;" align="center">
				<td>ỦY BAN NHÂN DÂN QUẬN 5<BR/> TRƯỜNG TCN CN HÙNG VƯƠNG<BR/>_______________</td>
				<td>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<BR/>Độc lập-Tự do-Hạnh phúc<BR/>_______________________</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><img src="<%=request.getContextPath()%>/images/HeaderIcon.gif"/></td>
			<td><img src="<%=request.getContextPath()%>/images/HeaderIcon.gif"/></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 20px">KẾ HOẠCH CÔNG TÁC THÁNG ${KeHoachThang.thang} NĂM ${KeHoachThang.nam}</p><br /></th>
		</tr>
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: center;" id="TableKHDT" border="1">
		<tr style="background-color: transparent;" align="center">
				<td rowspan="2">STT</td>
				<td width="400" rowspan="2">Nội dung thực hiện</td>
				<td rowspan="2">Bộ phận thực hiện</td>
				<td colspan="<%=soTuan %>">Thời gian thực hiện/tuần</td>
				<td rowspan="2">Ghi chú</td>
			</tr>
			<tr style="background-color: transparent;" align="center">
				<c:forEach var = "Tuan" begin="1" end="<%=soTuan %>">
					<td>${Tuan}</td>
				</c:forEach>
			</tr>
			<%int count = 0; %>
			<c:forEach var = "CongTacThang" items="${KeHoachThang.congTacThangList}">
				<tr style="background-color: transparent;" align="center">
					<%count++; %>
					<td><%=count %></td>
					<td>${CongTacThang.noiDungCongTac }</td>
					<td>${CongTacThang.boPhanThucHien }</td>
					<c:forEach var = "Tuan" begin="1" end="<%=soTuan %>">
						<td>
						<c:forEach var = "TinhTrangCongTac" items="${CongTacThang.tinhTrangCongTacList}">
							<c:if test="${TinhTrangCongTac.thuTuTuan eq Tuan}">
								X
							</c:if>
						</c:forEach>
						</td>
					</c:forEach>	
					<td>${CongTacThang.ghiChu }</td>
				</tr>
			</c:forEach>
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
		<tr style="background-color: transparent;">
			<td colspan = "2">
				<u>1. Nơi nhận : </u> <p> ${sf:appendPTag(KeHoachThang.noiNhan)} </p>
			</td>
		</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<c:set var="sig" value="-"></c:set>
			<td>Ngày ${sf:getElement(KHDT.ngayDuyet,0,sig)} tháng ${sf:getElement(KHDT.ngayDuyet,1,sig)} năm ${sf:getElement(KHDT.ngayDuyet,2,sig)}</td>
			<td>Quận 5, Ngày ${sf:getElement(KHDT.ngayTao,0,sig)} tháng ${sf:getElement(KHDT.ngayTao,1,sig)} năm ${sf:getElement(KHDT.ngayTao,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">BAN GIÁM HIỆU DUYỆT </p></td>
			<td><p style="font-weight: bold">PHÒNG HÀNH CHÁNH</p></td>
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
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">${KHDT.tenNguoiDuyet}</p></td>
			<td><p style="font-weight: bold">${KHDT.tenNguoiLap}</p></td>
		</tr>
	</table>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>