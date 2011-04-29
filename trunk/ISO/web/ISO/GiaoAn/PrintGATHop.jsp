<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>

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
<pd4ml:footer 
	   fontFace="Times New Roman"
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
	   watermarkBounds="0,820,600,20"	      
       fontSize="12">       
 </pd4ml:footer>

 
<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Giáo án tích hợp</title> 
</head>
<div align="center">
<div class = "div_body">

<c:set var="GATichHop" value="${sessionScope.giaoAnLyThuyet}"></c:set>
<c:set var="TenChuongList" value="${sessionScope.listTenChuong}"></c:set>
<c:set var="chiTietKeHoachGiangDay" value="${sessionScope.chiTietKHGD}"></c:set>
<c:set var="KHGD" value="${sessionScope.objKHGD}"></c:set>
<c:set var="Phut" value="${sessionScope.soPhut}"></c:set>

<table width="100%" height="100%" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');padding-left : 15px;padding-right : 15px;">
	<tr><td>
				<table border="0" width = "650px" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td></td>
					<td colspan = "2" style="text-align: center; padding-bottom: 10px">Mẫu số 7<br />Ban hành theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>		
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
					<div style="padding-left:20px">- ${sf:appendBrTag3(giaoAnLyThuyet.mucTieu)} </div>
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
				<td colspan = "2">
					<div class = "div_textleft">HÌNH THỨC TỔ CHỨC VÀ DẠY HỌC : 
					</div>
					<div style="padding-left:20px">${sf:appendBrTag3(giaoAnLyThuyet.hinhThucTCDH)}</div>
					
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
					<div style="padding-left:40px">${sf:appendBrTag3(giaoAnLyThuyet.onDinhLH)}
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">II.THỰC HIỆN BÀI HỌC:</div>
				</td>
				<td style='padding-right:4px'>
					Thời gian : ${giaoAnLyThuyet.thoiGianTHBH} phút
				</td>
			</tr>
		</table>
		<div style='padding-right: 100px'>
		
		<table border = "1" width="650px" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td align='center' rowspan = "2" width="50px" >STT</td>
				<td align='center' rowspan = "2" >NỘI DUNG</td>
				<td align='center' colspan = "2" >HOẠT ĐỘNG DẠY HỌC</td>
				<td align='center' rowspan = "2" width="50px">THỜI GIAN</td>
			</tr>
			<tr style="background-color: transparent;">
				
				<td align='center' width="175px">HOẠT ĐỘNG CỦA GIÁO VIÊN</td>
				<td align='center' width="175px">HOẠT ĐỘNG CỦA HỌC SINH</td>
				
			</tr>
			<tr style="background-color: transparent;">
				<td align='center'>1</td>
				<td>Dẫn nhập : <a class='error' id='aDanNhap'></a>
				<br />
					${sf:appendBrTag3(giaoAnLyThuyet.danNhap)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDDanNhapGV)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDDanNhapHS)}
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianDanNhap}
				</td>
			</tr>
			<tr>
				<td align='center'>2</td>
				<td>Giới thiệu chủ đề : <br />
					${sf:appendBrTag3(giaoAnLyThuyet.gioiThieuChuDe)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDGTCDGV)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDGTCDHS)}
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianGTCD}
				</td>
			</tr>
			<tr>
				<td align='center'>3</td>
				<td>Giải quyết vấn đề : <br />
					${sf:appendBrTag3(giaoAnLyThuyet.giaiQuyetVanDe)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDGQVDGV)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDGQVDHS)}
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianGTVD}
				</td>
			</tr>
			<tr>
				<td align='center'>4</td>
				<td>Kết thúc vấn đề: <br />
					${sf:appendBrTag3(giaoAnLyThuyet.huongDanKetThuc)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDHDKTGV)}
				</td>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.HDHDKTHS)}
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianHDKT}
				</td>
			</tr>
			<tr>
				<td align='center'>5</td>
				<td>Hướng dẫn tự học : <br />
					${sf:appendBrTag3(giaoAnLyThuyet.huongDanTuHoc)}
				</td>
				<td colspan="2">
					${sf:appendBrTag3(giaoAnLyThuyet.HDHDTHGV)}
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianHDTH}
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr>
				<td>
					<div class = "div_textleft">III. RÚT KINH NGHIỆM TỔ CHỨC THỰC HIỆN :</div>
				</td>
			</tr>	
			<tr>
				<td>
					${sf:appendBrTag3(giaoAnLyThuyet.rutKinhNghiem)}
				</td>
			</tr>
		</table>
		</div>
		<table style="background-color: transparent;width:750px;padding-right:100px">
			<tr style="background-color: transparent;">
				<td align='center' width="325px"><br />TRƯỞNG KHOA/TRƯỞNG TỔ MÔN</td>
				<td align='center' width="325px">${giaoAnLyThuyet.ngayTao}
				<br />GIÁO VIÊN</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align='center'><br/><br/><br/><br/><br/><br/>${objKHGD.tenTruongKhoa}</td>
				<td align='center'><br/><br/><br/><br/><br/><br/>${objKHGD.tenGiaoVien}</td>
			</tr>
		</table>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>