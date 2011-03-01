<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.SuDungDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%><pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="10,20,0,20,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"   
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
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
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Print Lich Su Dung Phong</title> 

</head>
<div align="center">
<div class = "div_body">
<c:set var="List" value="${sessionScope.ListSuDung}"></c:set>
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">	
	<tr>
		<td>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td><p style="font-weight: bold">TRƯỜNG TCN KTCN HÙNG VƯƠNG<br/>PHÒNG ĐÀO TẠO</p></td>
					<td></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 20px">THỜI KHÓA BIỂU</p><br /></th>
				</tr>
			</table>
			<%
				int count = 0, count1 = 0, count2 = 0; 
				String chuoi1 = "<td>", chuoi2 = "</td>", chuoi3 = "", chuoi4 = "</tr>", chuoi5 = "";
			%>
			<c:set var = "RowFooter" value = ""/>
			<c:set var = "Footer" value = ""/>
			<c:set var = "Chuoi1" value="<%=chuoi1 %>"/>
			<c:set var = "Chuoi2" value="<%=chuoi2 %>"/>
			<c:set var = "Chuoi3" value="<%=chuoi3 %>"/>
			<c:set var = "Chuoi4" value="<%=chuoi4 %>"/>
			<c:set var = "Check" value="1"/>
		<table width = "900" border = "1" align="center" style="background-color: transparent; background-position: top;">
				
			<tr align="center" style="background-color: transparent;">
				<th style="background-color: #778899; color: white;" width="80">
					Thứ
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Ngày
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Buổi
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Lớp
				</th>
				<th style="background-color: #778899; color: white;" width="80">
					Môn học
				</th>
				<th style="background-color: #778899; color: white;" width="150">
					Giáo viên
				</th>
				<th style="background-color: #778899; color: white;" >
					Phòng
				</th>
				
			</tr>
			<c:forEach var = "SuDungPhong" items="${List}">
				<%count++; count1++; count2++; %>
				<c:set var = "count" value = "<%=count %>"></c:set>			
				<c:set var = "RowFooter" value = "${RowFooter}${Chuoi3}${Chuoi1}${SuDungPhong.kiHieuLop}${Chuoi2}"/>
				<c:set var = "RowFooter" value = "${RowFooter}${Chuoi1}${SuDungPhong.tenMonHoc}${Chuoi2}"/>
				<c:set var = "RowFooter" value = "${RowFooter}${Chuoi1}${SuDungPhong.tenGiaoVien}${Chuoi2}"/>
				<c:set var = "RowFooter" value = "${RowFooter}${Chuoi1}${SuDungPhong.phong}${Chuoi2}${Chuoi4}"/>		
				<%chuoi3 = "<tr>"; %>
				<c:set var = "Chuoi3" value="<%=chuoi3 %>"/>
				<c:choose>	
					<c:when test="${(not empty List[count].thuTrongTuan and SuDungPhong.thuTrongTuan ne List[count].thuTrongTuan) || (not empty List[count].buoi and SuDungPhong.buoi ne List[count].buoi) || empty List[count]}">
						<%chuoi5 = "<tr><td rowSpan = \"" + count2 + "\">"; %>
						<c:if test="${Check eq 1}">
							<%chuoi5 = "<td rowSpan = \"" + count2 + "\">"; %>
							<c:set var = "Check" value="2"/>
						</c:if>
						<c:set var = "Chuoi5" value="<%=chuoi5 %>"/>
						<c:set var = "Footer" value = "${Footer}${Chuoi5}${SuDungPhong.buoi}${Chuoi2}${RowFooter}"/>
						<c:set var = "RowFooter" value = ""/>
						<c:if test = "${(not empty List[count].thuTrongTuan and SuDungPhong.thuTrongTuan ne List[count].thuTrongTuan) || empty List[count]}">
							<tr>
								<td rowspan="<%=count1 %>">
									<c:choose>
										<c:when test="${SuDungPhong.thuTrongTuan eq 1}">
											HAI
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 2}">
											BA
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 3}">
											TƯ
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 4}">
											NĂM
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 5}">
											SÁU
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 6}">
											BẢY
										</c:when>
									</c:choose>
								</td>	
								<td rowSpan = "<%=count1 %>">
									${SuDungPhong.ngayHoc}
								</td>
								${Footer}
								<c:set var = "Footer" value = ""/>
								<% count1 = 0;%>
								<c:set var = "Check" value="1"/>
						</c:if>
						<%count2 = 0; chuoi3 = "";%>
						<c:set var = "Chuoi3" value="<%=chuoi3 %>"/>
					</c:when>
				</c:choose>
			</c:forEach>
			</table>
		</td>
	</tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>

