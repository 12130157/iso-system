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
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHDTDAO"%><pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="30,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"   
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate=""
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,820,600,20"	      
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
<title>Lịch phân công tác tuần</title> 
</head>
<div align="center">
<div class = "div_body">
<c:set var="ChiTietKHDT" value='<%=ChiTietKHDTDAO.timChiTietKHDTByID(request.getParameter("maChiTiet")) %>'></c:set>
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">ỦY BAN NHÂN DÂN QUẬN 5<br/>TRƯỜNG TCN KTCN HÙNG VƯƠNG</p></td>
			<td><p style="font-weight: bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
											 Độc lập - Tự do - Hạnh phúc</p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td>----------------------</td>
			<td>----------------------</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<th colspan = "2"><br /><p style="font-weight: bold; font-size: 20px">LỊCH CÔNG TÁC TUẦN</p>
							<p><i>(Từ ngày ${ChiTietKHDT.tuNgay} đến ngày ${ChiTietKHDT.denNgay}</i></p></th>
		</tr>
	</table>
	<c:set var = "value" value="0"></c:set>
	<c:set var = "buoi" value="0"></c:set>
	<table border="1" width="950">
		<c:forEach var = "iterator" items="${ChiTietKHDT.noiDungChiTietKHDTModelList}">
			<c:if test="${iterator.tinhTrangPhanCong eq 1}">
				<c:if test = "${iterator.thu ne value}">
					<tr style="background-color: transparent; background-position: center;">
						<td colspan="2">
							<c:choose>
								<c:when test="${iterator.thu eq 1}">
									<u><b>THỨ HAI ${iterator.ngay}</b></u>
									<c:set var = "value" value="${iterator.thu}"></c:set>
								</c:when>
								<c:when test="${iterator.thu eq 2}">
									<u><b>THỨ BA ${iterator.ngay}</b></u>
									<c:set var = "value" value="${iterator.thu}"></c:set>
								</c:when>
								<c:when test="${iterator.thu eq 3}">
									<u><b>THỨ TƯ ${iterator.ngay}</b></u>
									<c:set var = "value" value="${iterator.thu}"></c:set>
								</c:when>
								<c:when test="${iterator.thu eq 4}">
									<u><b>THỨ NĂM ${iterator.ngay}</b></u>
									<c:set var = "value" value="${iterator.thu}"></c:set>
								</c:when>
								<c:when test="${iterator.thu eq 5}">
									<u><b>THỨ SÁU ${iterator.ngay}</b></u>
									<c:set var = "value" value="${iterator.thu}"></c:set>
								</c:when>
								<c:when test="${iterator.thu eq 6}">
									<u><b>THỨ BẢY ${iterator.ngay}</b></u>
									<c:set var = "value" value="${iterator.thu}"></c:set>
								</c:when>
								<c:when test="${iterator.thu eq 7}">
									<u><b>CHỦ NHẬT ${iterator.ngay}</b></u>
									<c:set var = "value" value="${iterator.thu}"></c:set>
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:if>
				<c:if test="${iterator.buoi ne buoi or iterator.thu ne value}">
							<tr style="background-color: transparent; background-position: center;">
								<td colspan="2">
									<c:choose>
										<c:when test="${iterator.buoi eq 1}">
											<u><i>Sáng</i></u>
										</c:when>
										<c:otherwise>
											<u><i>Chiều</i></u>
										</c:otherwise>
									</c:choose>
								</td>	
								<c:set var = "buoi" value="${iterator.buoi}"></c:set>
							</tr>	
						</c:if>
					<tr style="background-color: transparent; background-position: center;">
						<td>
							- ${iterator.gio} giờ ${iterator.phut} phút	 
						</td>
						<td>
							${iterator.noiDungCongTac}
							<c:if test="${iterator.ghiChu ne null and iterator.ghiChu ne ''}">
								(${iterator.ghiChu})
							</c:if>
						</td>
					</tr>
				</c:if>	
		</c:forEach>
	</table>	
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>Ghi chú</u> <p> ${sf:appendPTag(ChiTietKHDT.ghiChu)} </p>
				</td>
			</tr>						
	</table>
</table>
</div>
</div>
</html>
</pd4ml:transform>