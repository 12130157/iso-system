<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%><pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="30,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"   
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM03b-QT7.1/2                     Ngày hiệu lực: 15/9/2009"
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
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Giáo án lý thuyết</title> 
</head>
<div align="center">
<div class = "div_body">
<c:set var="giaoAnLyThuyet" value="${sessionScope.giaoAnLyThuyet}"></c:set>
<table width="100%" height="100%" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">
	<tr><td>
		<table width = "900" align="center" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan = "2">Mẫu số 5<br />Ban hành theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>		
			</tr>
			<tr style="background-color: transparent;">
				<td>
					GIÁO ÁN SỐ : ${giaoAnLyThuyet.soGiaoAn}
				</td>
				<td>
					Thời gian thực hiện : 
					Tên chương :
					<br/>
					
					Ngày thực hiện : ${giaoAnLyThuyet.ngayThucHien}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					Tên bài :<br />
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">MỤC TIÊU CỦA BÀI : 
					</div>
					<br />
					${giaoAnLyThuyet.mucTieu}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">ĐỒ DÙNG VÀO PHƯƠNG TIỆN DẠY HỌC : 
					</div><br />
					${giaoAnLyThuyet.doDungPTDH}
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">I.ỔN ĐỊNH LỚP HỌC: </div>
				</td>
				<td>
					Thời gian : ${giaoAnLyThuyet.thoiGianOnDinh} phút
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">		
					${giaoAnLyThuyet.onDinhLH}
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">II.THỰC HIỆN BÀI HỌC:</div>
				</td>
				<td>
					Thời gian : ${giaoAnLyThuyet.thoiGianTHBH} phút
				</td>
			</tr>
		</table>
		<table border = "1" align="center" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td rowspan = "2" >STT</td>
				<td rowspan = "2">NỘI DUNG</td>
				<td colspan = "2">HOẠT ĐỘNG DẠY HỌC</td>
				<td rowspan = "2">THỜI GIAN</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>HOẠT ĐỘNG CỦA GIÁO VIÊN</td>
				<td>HOẠT ĐỘNG CỦA HỌC SINH</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>1</td>
				<td>Dẫn nhập : <br />
					${chiTietKHGD.congViecChuanBi}
				</td>
				<td>
					${giaoAnLyThuyet.HDDanNhapGV}
				</td>
				<td>
					${giaoAnLyThuyet.HDDanNhapHS}
				</td>
				<td>
					${giaoAnLyThuyet.thoiGianDanNhap}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>2</td>
				<td>Giảng bài mới : <br />
					${giaoAnLyThuyet.noiDungBaiGiang}
				</td>
				<td>
					${chiTietKHGD.tenChuong}
				</td>
				<td>
					${giaoAnLyThuyet.HDGiangBaiMoiHS}
				</td>
				<td>
					${giaoAnLyThuyet.thoiGianBaiGiang}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>3</td>
				<td>Củng cố kiến thức và kết thúc bài : <br />
					${giaoAnLyThuyet.cungCoKienThuc}
				</td>
				<td>
					${giaoAnLyThuyet.HDCungCoGV}
				</td>
				<td>
					${giaoAnLyThuyet.HDCungCoHS}
				</td>
				<td>
					${giaoAnLyThuyet.thoiGianCungCo}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>4</td>
				<td>Hướng dẫn tự học : <br />
					${giaoAnLyThuyet.huongDanTuHoc}
				</td>
				<td>
					${giaoAnLyThuyet.HDHDTHGV}
				</td>
				<td>
					${giaoAnLyThuyet.HDHDTHHS}
				</td>
				<td>
					${giaoAnLyThuyet.thoiGianHDTH}
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">Nguồn tài liệu tham khảo:  </td>
				<td colspan = "3">
					${giaoAnLyThuyet.taiLieuThamKhao}
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><br />TRƯỞNG KHOA/TRƯỞNG TỔ MÔN</td>
				<td>
					${giaoAnLyThuyet.ngayTao}
				<br />GIÁO VIÊN</td>
			</tr>
			<tr style="background-color: transparent;">
				<td></td>
				<td></td>
			</tr>
		</table>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>