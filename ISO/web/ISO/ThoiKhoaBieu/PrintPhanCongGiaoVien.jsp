<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.SuDungDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%ArrayList<LopHocModel> list = (ArrayList<LopHocModel>)request.getSession().getAttribute("ListPhanCongTheoLopHoc");%>
<pd4ml:transform
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
<title>Print Phân công tác tuần</title> 

</head>
<div align="center">
<div class = "div_body">
<c:set var="List" value="<%=list %>"></c:set>
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">	
	<tr>
		<td>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td><p style="font-weight: bold">TRƯỜNG TCN KTCN HÙNG VƯƠNG<br/>KHOA ${List[0].khoa}</p></td>
					<td></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 20px">BẢNG PHÂN CÔNG GIÁO VIÊN GIẢNG DẠY</p><br /></th>
				</tr>
			</table>
		<table width = "900" border = "1" align="center" style="background-color: transparent; background-position: top;">
				
			<tr align="center" style="background-color: transparent;">
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					STT
				</th>
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					Họ và tên GV
				</th>
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					Lớp
				</th>
				<th style="background-color: #778899; color: white;" rowspan="2">
					Môn học
				</th>
				<th style="background-color: #778899; color: white;" width="80" colspan="2">
					Số giờ giảng dạy
				</th>
				<th style="background-color: #778899; color: white;" width="150" rowspan="2">
					Các nhiệm vụ khác
				</th>
				<th style="background-color: #778899; color: white;" rowspan="2" >
					Ghi chú
				</th>				
			</tr>
			<tr align="center" style="background-color: transparent;">
				<td style="background-color: #778899; color: white;">Lý thuyết</td>
				<td style="background-color: #778899; color: white;">Thực hành</td>
			</tr>
			<%int count = -1, soThuTu = 1; %>
			
		
			<c:forEach var="PhanCongList" items = "${List}">
				<%soThuTu = 1; count++;%>
				
				<c:forEach var = "SoThuTu" begin="1" end="<%=list.get(count).getPhanCongGiaoVienList().size() %>">
					<tr style="background-color: transparent;">
						<td>${SoThuTu}</td>		
						<td>${PhanCongList.phanCongGiaoVienList[SoThuTu-1].tenGiaoVien}</td>
						<c:if test = "${SoThuTu eq 1}">				
							<td rowspan="<%=list.get(count).getPhanCongGiaoVienList().size() %>">${PhanCongList.kiHieu}</td>
						</c:if>	
						<td>${PhanCongList.phanCongGiaoVienList[SoThuTu-1].tenMonHoc}</td>
						<td>${PhanCongList.phanCongGiaoVienList[SoThuTu-1].lyThuyet}</td>
						<td>${PhanCongList.phanCongGiaoVienList[SoThuTu-1].thucHanh}</td>
						<td><p></p></td>
						<td><p></p></td>
					</tr>
					<%soThuTu++; %>
				</c:forEach>
			</c:forEach>
		</table>
		</td>
	</tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>

