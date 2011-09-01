<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.SuDungDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%><pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="30,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/mask_ngang.gif" 
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
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,580,500,20"	      
       fontSize="12">       
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
<c:set var = "NamHoc" value='<%=NamHocDAO.getNamHocByMaNamHoc(request.getParameter("maNamHoc")) %>'/>
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">	
	<tr>
		<td>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 15px;">
					<td><p style="font-weight: bold">TRƯỜNG TCN KTCN HÙNG VƯƠNG<br/>PHÒNG ĐÀO TẠO</p></td>
					<td></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 18px">
						LỊCH SỬ DỤNG PHÒNG
						
					</p><br /></th>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<th colspan = "2"><font style="font-weight: bold;">
						<c:choose>
							<c:when test="${param.tuan eq '' or param.tuan le 54}">
								Tuần ${List[0].soThuTuTuan} - Từ ngày : ${List[0].ngayBatDauTuan } Đến ngày : ${List[0].ngayKetThucTuan }
							</c:when>
							<c:when test = "${param.tuan le 72}">
								Tháng ${param.tuan - 60} Năm học ${NamHoc.namBatDau } - ${NamHoc.namKetThuc}
							</c:when>
							<c:otherwise>
								Học kì ${param.tuan - 80} Năm học ${NamHoc.namBatDau } - ${NamHoc.namKetThuc}
							</c:otherwise>
						</c:choose>		
						<c:if test = "${param.khoa ne ''}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa : ${List[0].khoa }
						</c:if>				
						</font>
					</th>
				</tr>
			</table>
			<%
				int count = 0, count1 = 0, count2 = 0, count3 = 0; 
				String chuoi1 = "<td>", chuoi2 = "</td>", chuoi3 = "", chuoi4 = "</tr>", chuoi5 = "", chuoi6 = "";
			%>
			<c:set var = "RowFooter" value = ""/>
			<c:set var = "Footer" value = ""/>
			<c:set var = "Chuoi1" value="<%=chuoi1 %>"/>
			<c:set var = "Chuoi2" value="<%=chuoi2 %>"/>
			<c:set var = "Chuoi3" value="<%=chuoi3 %>"/>
			<c:set var = "Chuoi4" value="<%=chuoi4 %>"/>
			<c:set var = "Check" value="1"/>
		<table width = "900" border = "1" align="center" style="background-color: transparent; background-position: top; font-size: 16px;">
				
			<tr align="center" style="background-color: transparent;">
				<th style="background-color: #778899; color: white;" width="80">
					Tuần
				</th>
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
				<%count++; count1++; count2++; count3++;%>
				<c:set var = "count" value = "<%=count %>"></c:set>			
				<c:set var = "RowFooter" value = "${RowFooter}${Chuoi3}${Chuoi1}${SuDungPhong.kiHieuLop}${Chuoi2}"/>
				<c:set var = "RowFooter" value = "${RowFooter}${Chuoi1}${SuDungPhong.tenMonHoc}${Chuoi2}"/>
				<c:set var = "RowFooter" value = "${RowFooter}${Chuoi1}${SuDungPhong.tenGiaoVien}${Chuoi2}"/>
				<c:set var = "RowFooter" value = "${RowFooter}${Chuoi1}${SuDungPhong.phong}${Chuoi2}${Chuoi4}"/>		
				<%chuoi3 = "<tr>"; %>
				<c:set var = "Chuoi3" value="<%=chuoi3 %>"/>
				<c:choose>	
					<c:when test="${(not empty List[count].soThuTuTuan and SuDungPhong.soThuTuTuan ne List[count].soThuTuTuan) ||
						(not empty List[count].thuTrongTuan and SuDungPhong.thuTrongTuan ne List[count].thuTrongTuan) 
							|| (not empty List[count].buoi and SuDungPhong.buoi ne List[count].buoi) || empty List[count]}">
						<%chuoi5 = "<tr><td rowSpan = \"" + count2 + "\">"; %>
						<c:if test="${Check le 2}">
							<%chuoi5 = "<td rowSpan = \"" + count2 + "\">"; %>
							<c:if test = "${Check ne 1}">
								<c:set var = "Check" value="3"/>
							</c:if>
						</c:if>
						<c:set var = "Chuoi5" value="<%=chuoi5 %>"/>
						<c:set var = "Footer1" value = "${Footer1}${Chuoi5}${SuDungPhong.buoi}${Chuoi2}${RowFooter}"/>
						<c:set var = "RowFooter" value = ""/>
						<c:if test = "${(not empty List[count].soThuTuTuan and SuDungPhong.soThuTuTuan ne List[count].soThuTuTuan) ||
							(not empty List[count].thuTrongTuan and SuDungPhong.thuTrongTuan ne List[count].thuTrongTuan) 
								|| empty List[count]}">
							<%chuoi6 = "<tr><td rowSpan = \"" + count1 + "\">"; %>	
							<c:if test="${Check eq 1}">
								<%chuoi6 = "<td rowSpan = \"" + count1 + "\">"; %>
							</c:if>
							<c:set var = "Check" value="2"/>
									<c:choose>
										<c:when test="${SuDungPhong.thuTrongTuan eq 1}">
											<%chuoi6 = chuoi6 + "HAI"; %>
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 2}">
											<%chuoi6 = chuoi6 + "BA"; %>
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 3}">
											<%chuoi6 = chuoi6 + "TƯ"; %>
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 4}">
											<%chuoi6 = chuoi6 + "NĂM"; %>
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 5}">
											<%chuoi6 = chuoi6 + "SÁU"; %>
										</c:when>
										<c:when test="${SuDungPhong.thuTrongTuan eq 6}">
											<%chuoi6 = chuoi6 + "BẢY"; %>
										</c:when>
									</c:choose>
									<%chuoi6 += "</td><td rowSpan = \"" + count1 + "\">"; %>
									<c:set var = "Chuoi6" value="<%=chuoi6 %>"/>
									<c:set var = "Footer" value = "${Footer}${Chuoi6}${SuDungPhong.ngayHoc}${Chuoi2}${Footer1}"/>	
									<c:set var = "Footer1" value = ""/>
									<c:if test = "${(not empty List[count].soThuTuTuan and SuDungPhong.soThuTuTuan ne List[count].soThuTuTuan) 
										|| empty List[count]}">
										<tr>
											<td rowspan="<%=count3 %>">${SuDungPhong.soThuTuTuan}<br/>
												(${SuDungPhong.ngayBatDauTuan}-${SuDungPhong.ngayKetThucTuan })</td>
											${Footer}
											
										<c:set var = "Footer" value = ""/>
										<% count3 = 0;%>
										<c:set var = "Check" value="1"/>
									</c:if>
								<%count1 = 0; %>
								
						</c:if>
						<%count2 = 0; chuoi3 = "";%>
						<c:set var = "Chuoi3" value="<%=chuoi3 %>"/>
					</c:when>
				</c:choose>
			</c:forEach>
			</table>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</td>
	</tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>

