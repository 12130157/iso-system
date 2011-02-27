<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KetQuaTimGiaoAnModel"%>

<%@page import="javax.mail.Session"%>

<pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="30,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Times New Roman" monospace="Courier New" />
<pd4ml:header 
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>
<pd4ml:footer 
	   fontFace="Times New Roman"
       titleTemplate="     BM03b–QT7.1/2           		                                          Ngày hiệu lực: 15/9/2009"
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif"   
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
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Kết quả tìm giáo án</title> 
</head>
<c:set var = "kqTimKiemList" value ="${sessionScope.kqTimKiemList}" ></c:set>
<c:set var="TT_SEND" value="<%=Constant.TINHTRANG_SEND %>"></c:set>
<c:set var="TT_CHUATHUCHIEN" value="<%=Constant.TINHTRANG_CHUATHUCHIEN %>"></c:set>
<c:set var="TT_NEW" value="<%=Constant.TINHTRANG_NEW %>"></c:set>
<c:set var="TT_APPROVE" value="<%=Constant.TINHTRANG_APPROVE %>"></c:set>
<c:set var="TT_REJECT" value="<%=Constant.TINHTRANG_REJECT %>"></c:set>
<div align="center">
<div class="div_body">
<table width="100%" height="100%" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');padding-right:15px;padding-left:40px">
	<tr><td>
	<table width = "950px" align="center" style="background-color: transparent;padding-right:30px">
		<tr style="background-color: transparent;">
			<td align="center">ỦY BAN NHÂN DÂN QUẬN 5<br />TRƯỜNG TCN KTCN HÙNG VƯƠNG </td>
			<td align="center">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />Độc lập – Tự do – Hạnh phúc</td>
		</tr>
	</table>
	<br/>
	<div style='padding-left:300px;font-weight:bold'>
		<strong>BÁO CÁO TIẾN ĐỘ THỰC HIỆN GIÁO ÁN</strong>
	</div>			
	<br/><br/>
	<div style="padding-left:40px">
	<table border="1" width="860px">
		<tr style="background-color: transparent;">
			<th style='font-weight:bold;width:140px' >Môn học</th>
			<th style='font-weight:bold;width:140px' >Giáo viên</th>
			<th style='font-weight:bold;width:70px' >Lớp học</th>
			<th style='font-weight:bold;width:60px' >Số giáo án</th>
			<th style='font-weight:bold;width:80px' >Ngày dạy</th>
			<th style='font-weight:bold;width:80px' >Ngày gởi</th>
			<th style='font-weight:bold;width:140px'>Người duyệt</th>
			<th style='font-weight:bold;width:80px' >Ngày duyệt</th>
			<th style='font-weight:bold;width:50px' >Tình trạng</th>
		</tr>
		

			
			<c:forEach var="objKQTim" items="${kqTimKiemList}"> 

				<tr style="background-color: transparent;">		
				
				
					<td>${objKQTim.tenMonHoc}</td>	
					<td>${objKQTim.tenGiaoVien}</td>
					<td>${objKQTim.tenLopHoc}</td>
					<td style="text-align:center">${objKQTim.soGiaoAn}</td>
					<td>${objKQTim.ngayDay}</td>
					<td>${objKQTim.ngayGui}</td>
					<td>${objKQTim.tenNguoiDuyet}</td>
					<td>${objKQTim.ngayDuyet}</td>
					<td style="text-align:center">
			
					<c:if test="${objKQTim.tinhTrang eq TT_SEND}">
							Đã gởi						
					</c:if>
					<c:if test="${objKQTim.tinhTrang eq TT_APPROVE}">
							Approve
					</c:if>
					<c:if test="${objKQTim.tinhTrang eq TT_REJECT}">
							REJECT
					</c:if>
					<c:if test="${objKQTim.tinhTrang eq TT_NEW}">
							Mới
					</c:if>

					</td>
				</tr>
			</c:forEach>

	</table>	
	</div>
	
	</td>
	</tr>
	
</table>	
	</div>
</div>

</html>
</pd4ml:transform>