<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>

<pd4ml:transform
	screenWidth="700"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="10,20,0,20,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Times New Roman" monospace="Courier New" />
<pd4ml:header 
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
<!-- <pd4ml:footer 
	   fontFace="Times New Roman"
       titleTemplate="     BM03b–QT7.1/2           		                                                           Ngày hiệu lực: 15/9/2009"
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
 </pd4ml:footer> -->
<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Giáo án lý thuyết</title> 
</head>
<div align="center" style='font-size:14px;'>
<div class = "div_body">
<c:set var="giaoAnLyThuyet" value="${sessionScope.giaoAnLyThuyet}"></c:set>
<c:set var="objKHGD" value="${sessionScope.objKHGD}"></c:set>
<table width="100%" height="100%" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');padding-left:15px;padding-right:15px">
	<tr>
		<td>
			<table border="0" width = "650px" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td></td>
					<td colspan = "2" style="text-align: center; padding-bottom: 10px">Mẫu số 5<br />Ban hành theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>		
				</tr>
				<tr style="background-color: transparent;">
					<td style="width: 300px;">
						GIÁO ÁN SỐ : ${giaoAnLyThuyet.soGiaoAn}
					</td>
					<td colspan="2" style="padding-left:40px">
						Thời gian thực hiện : ${soPhut} phút<br />
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td></td>
					<td colspan="2" style="padding-left:40px">Tên bài học trước :</td>
				</tr>
				<tr style="background-color: transparent;">
					<td></td>
					<td style="width: 50px;padding-left:20px"></td>
					<td style='padding-left:20px'>
						<div style="text-align:left;font-weight:bold">
						
							<% int count=1; %>
							<c:forEach items="${listTenChuong}" var="obj">
								<b><%=count%>/ ${obj}</b><br/>					
								<%count++; %>
							</c:forEach>
						
						</div>	
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td></td>
					<td colspan="2" style="padding-left:40px">
						Thực hiện :	${sf:setFormatDate(giaoAnLyThuyet.ngayThucHien)}
					</td>
				</tr>
		</table>
		
		<table width = "700px" align="center" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td>
					Tên bài : 
					<div style="text-align:left;font-weight:bold">
					
						<% count=1; %>
						<c:forEach items="${listTenChuong}" var="obj">
							<b><%=count%>/ ${obj}</b><br/>					
							<%count++; %>
						</c:forEach>	
					
					</div>	
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">MỤC TIÊU CỦA BÀI : 
					</div>
					<div style="padding-left:20px">${sf:appendBrTag3(giaoAnLyThuyet.mucTieu)} </div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">ĐỒ DÙNG VÀO PHƯƠNG TIỆN DẠY HỌC : 
					</div>
					<div style="padding-left:20px">${sf:appendBrTag3(giaoAnLyThuyet.doDungPTDH)}</div>
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">I.ỔN ĐỊNH LỚP HỌC: </div>
				</td>
				<td style='padding-right:40px'>
					Thời gian : ${giaoAnLyThuyet.thoiGianOnDinh} phút
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">		
					<div style="padding-left:20px">${sf:appendBrTag3(giaoAnLyThuyet.onDinhLH)}
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">II.THỰC HIỆN BÀI HỌC:</div>
				</td>
				<td style='padding-right:40px'>
					Thời gian : ${giaoAnLyThuyet.thoiGianTHBH} phút
				</td>
			</tr>
		</table>
		<br/>
		<div style='padding-right: 100px'>
			<table width="650px" border = "1" align="center" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td rowspan = "2" align="center" width="50px">STT</td>
					<td rowspan = "2" align="center" >NỘI DUNG</td>
					<td colspan = "2" align="center" >HOẠT ĐỘNG DẠY HỌC</td>
					<td rowspan = "2" align="center" width="50px">THỜI GIAN</td>
				</tr>
				<tr style="background-color: transparent;">
					<td align="center" width="175px">HOẠT ĐỘNG CỦA GIÁO VIÊN</td>
					<td align="center" width="175px">HOẠT ĐỘNG CỦA HỌC SINH</td>
				</tr>
				<tr style="background-color: transparent;">
				<td align="center">1</td>
				<td>Dẫn nhập: <br />
					${sf:appendBrTag3(giaoAnLyThuyet.danNhap)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDDanNhapGV)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDDanNhapHS)}
				</td>
				<td align="center">
					${giaoAnLyThuyet.thoiGianDanNhap}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align="center">2</td>
				<td>Giảng bài mới: <br />
					${sf:appendBrTag3(giaoAnLyThuyet.noiDungBaiGiang)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDGiangBaiMoiGV)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDGiangBaiMoiHS)}
				</td>
				<td align="center">
					${giaoAnLyThuyet.thoiGianBaiGiang}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align="center">3</td>
				<td>Củng cố và kết thúc bài: <br />
					${sf:appendBrTag3(giaoAnLyThuyet.cungCoKienThuc)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDCungCoGV)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDCungCoHS)}
				</td>
				<td align="center">
					${giaoAnLyThuyet.thoiGianCungCo}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align="center">4</td>
				<td>Hướng dẫn tự học: <br />
					${sf:appendBrTag3(giaoAnLyThuyet.huongDanTuHoc)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDHDTHGV)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDHDTHHS)}
				</td>
				<td align="center">
					${giaoAnLyThuyet.thoiGianHDTH}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">Nguồn tài liệu tham khảo:  </td>
				<td colspan = "3">
					${sf:appendBrTag3(giaoAnLyThuyet.taiLieuThamKhao)}
				</td>
			</tr>
			</table>
		</div>
		<table style="background-color:transparent;width:750px;padding-right:100px">
			<tr style="background-color: transparent;" >
				<td align="center" width="325px">
					<br />TRƯỞNG KHOA/TRƯỞNG TỔ MÔN
				</td>
				<td align="center" width="325px">
					${sf:setFormatDate(giaoAnLyThuyet.ngayTao)}
					<br />GIÁO VIÊN
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align="center"><br/><br/><br/><br/>${objKHGD.tenTruongKhoa}</td>
				<td align="center"><br/><br/><br/><br/>${objKHGD.tenGiaoVien}</td>
			</tr>
		</table>
	</td></tr>	
	</table>
</div>
</div>
</html>
</pd4ml:transform>