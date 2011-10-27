<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
       titleTemplate="     BM05-QT7.3/1           		Ngày hiệu lực: 15/9/2009"
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<title>Print Sơ Lược Lý Lịch</title>
</head>
<body>
<div align="center">	
<table border="1" bgcolor="transparent" cellspacing="2" cellpadding="3" style="width: 670px; border-style:none">
		<tr>
			<td colspan="4" style="height:50px; vertical-align: middle;"><center><font size="4" style="font-weight: bold; font-family: tahoma">SƠ LƯỢC LÝ LỊCH</font></center></td>			
		</tr>
		<tr style="border:1px">
			<td style="text-align: left"><p style="width:150px">Họ và tên khai sinh</p></td>
			<td style="text-align: left"><p style="width:10px"><input type="text" style="width:150px"  /></p></td>
			<td style="text-align: right"><p style="width:85px">Giới tính</p></td>
			<td><p style="width:50px"><input type="text" style="width:100px"  /></p></td>
		</tr>
		<tr>
			<td style="text-align: left"><p style="width:150px">Tên thường gọi</p></td>
			<td style="text-align: left"><p style="width:10px"><input type="text" style="width:150px"  /></p></td>
			<td style="text-align: right"><p style="width:85px"></p></td>
			<td style="text-align: left"><p style="width:10px"></p></td>
		</tr>
		<tr>
			<td style="text-align: left"><p style="width:150px">Ngày sinh</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: right"><p style="width:85px"></p></td>
			<td style="text-align: left"><p style="width:10px"></p></td>
		</tr>		
		<tr>
			<td style="text-align: left"><p style="width:150px">Nơi sinh</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: right"><p style="width:85px"></p></td>
			<td style="text-align: left"><p style="width:10px"></p></td>
		</tr>
		<tr>
			<td style="text-align: left"><p style="width:150px">Quê quán</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: left"><p style="width:85px"></p></td>
			<td style="text-align: left"><p style="width:10px"></p></td>
		</tr>
		<tr>
			<td style="text-align: left; vertical-align: top"><p style="width:150px">Nơi đăng ký thường trú</p></td>
			<td colspan="3" style="text-align: left">
				<textarea name="NoiDangKyThuongTru" rows="6" cols="30" style="font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea>
			</td>
		</tr>
		<tr>
			<td style="text-align: left"><p style="width:150px">Dân tộc</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: right"><p style="width:85px">Tôn giáo</td>
			<td style="text-align: left"><input type="text" style="width:130px"  /></td>
		</tr>
		<tr>
			<td style="text-align: left"><p style="width:150px">Trình độ học vấn trước khi vào học</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: left"><p style="width:85px"></p></td>
			<td style="text-align: left"><p style="width:10px"></p></td>
		</tr>
		<tr>
			<td style="text-align: left"><p style="width:150px">Ngày tham gia vào Đảng CSVN</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: right"><p style="width:85px">Ngày chính thức</p></td>
			<td style="text-align: left"><input type="text" style="width:130px" /></td>
		</tr>		
		<tr>
			<td style="text-align: left"><p style="width:150px">Ngày kết nạp vào Đoàn TNCS Hồ Chí Minh</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: left"><p style="width:85px"></p></td>
			<td style="text-align: left"><p style="width:10px"></p></td>
		</tr>		
		<tr>
			<td style="text-align: left"><p style="width:150px">Họ và tên bố</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: right"><p style="width:85px">Nghề nghiệp</p></td>
			<td style="text-align: left"><input type="text" style="width:130px"  /></td>
		</tr>
		<tr>
			<td style="text-align: left"><p style="width:150px">Họ và tên mẹ</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: right"><p style="width:85px">Nghề nghiệp</p></td>
			<td style="text-align: left"><input type="text" style="width:130px"  /></td>
		</tr>
		<tr>
			<td style="text-align: left"><p style="width:150px">Họ và tên vợ (chồng)</p></td>
			<td style="text-align: left"><input type="text" style="width:150px"  /></td>
			<td style="text-align: right"><p style="width:85px">Nghề nghiệp</p></td>
			<td style="text-align: left"><input type="text" style="width:130px"  /></td>
		</tr>
		<tr>
			<td style="text-align: left; vertical-align: top"><p style="width:150px">Đối tượng thuộc diện chính sách</p></td>
			<td colspan="3" style="text-align: left">
				<textarea name="DoiTuongThuocDienChinhSach" rows="6" cols="30" style="font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea>
			</td>
		</tr>
		<tr>
			<td style="text-align: left; vertical-align: top"><p style="width:150px">Nghề nghiệp làm trước khi vào học</p></td>
			<td colspan="3" style="text-align: left">
				<textarea name="NgheNghiepLamTruocKhiVaoHoc" rows="6" cols="30" style="font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea>
			</td>
		</tr>
		<tr>
			<td style="text-align: left; vertical-align: top"><p style="width:150px">Địa chỉ liên lạc</p></td>
			<td style="text-align: left">
				<textarea name="DiaChiLienLac" rows="6" cols="13" style="font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea>
			</td>
			<td style="text-align: right; vertical-align:top"><p style="width:85px">Điện thoại</p></td>
			<td style="text-align: left; vertical-align:top"><input type="text" style="width:130px"  /></td>
		</tr>
		<tr>
			<td style="text-align: left; vertical-align: top"><p style="width:150px">Nguyện vọng làm việc sau khi kết thúc khóa học</p></td>
			<td colspan="3" style="text-align: left">
				<textarea name="NguyenVong" rows="6" cols="30" style="font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea>
			</td>			
		</tr>
	</table>
	
	<br />
	<br />
	<br />
	<br />
	
	<!-- NĂM THỨ 1 - NIÊN KHÓA 2010 - 2012 -->
<center><div  style="font-size: 17px; margin-top: 50px; font-weight: bold">II. KẾT QUẢ HỌC TẬP TỪNG NĂM</div></center>
<br />
<table border="1" cellspacing="1" cellpadding="1"  style="width: 670px;">
	<tr>		
		<th colspan="8" style="width:300px; height:80px; vertical-align: middle">NĂM THỨ NHẤT - NIÊN KHÓA 2010-2012</th>
		<th colspan="8" style="width:300px; height:80px; vertical-align: middle">NĂM THỨ NHẤT - NIÊN KHÓA 2010-2012</th>
	</tr>
	<tr>
		<td rowspan="3" style="vertical-align: middle; text-align: center"><p style="width:80px;">Môn học/Mô-đun</p></td>
		<td colspan="7" style="vertical-align: middle; text-align: center"><p style="width:200px;">Kết quả học tập Môn học/Mô-đun</p></td>
		<td rowspan="3" style="vertical-align: middle; text-align: center"><p style="width:80px;">Môn học/Mô-đun</p></td>
		<td colspan="7" style="vertical-align: middle; text-align: center"><p style="width:200px;">Kết quả học tập Môn học/Mô-đun</p></td>		
	</tr>
	<tr>
		<td rowspan="2" colspan="4" style="vertical-align: middle; text-align: center"><p style="width:80px;">Kiểm tra định kỳ</p></td>
		<td colspan="2" style="vertical-align: middle; text-align: center"><p style="width:80px;">Kiểm tra hết MH/MĐ</p></td>	
		<td rowspan="2" style="vertical-align: middle; text-align: center"><p style="width:70px;">Tổng kết</p></td>	
		<td rowspan="2" colspan="4" style="vertical-align: middle; text-align: center"><p style="width:80px;">Kiểm tra định kỳ</p></td>
		<td colspan="2" style="vertical-align: middle; text-align: center"><p style="width:80px;">Kiểm tra hết MH/MĐ</p></td>	
		<td rowspan="2" style="vertical-align: middle; text-align: center"><p style="width:70px;">Tổng kết</p></td>	
	</tr>
	<tr>
		<td style="vertical-align: middle">Lần 1</td>
		<td style="vertical-align: middle">Lần 2</td>
		<td style="vertical-align: middle">Lần 1</td>
		<td style="vertical-align: middle">Lần 2</td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Anh văn 1</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Anh văn 2</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Tin học đại cương</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Giáo dục quốc phòng</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Vẽ kĩ thuật 1</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Vẽ kĩ thuật 2</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Dung sai - kỹ thuật đo</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">CAD</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Nguội cơ bản</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Cơ kỹ thuật</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Kỹ thuật Tiện 1</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Vật liệu học</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Chi tiết máy</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Điện kỹ thuật</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Kỹ thuật Hàn</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Kỹ thuật Phay 1</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td colspan="8" class="a" style="text-align: left">Xếp loại học tập: </td>		
		<td colspan="8" style="text-align: left" >Xếp loại học tập: </td>		
	</tr>
	<tr>
		<td colspan="8" class="a" style="text-align: left">Xếp loại rèn luyện: </td>		
		<td colspan="8" style="text-align: left">Xếp loại rèn luyện: </td>
	</tr>
	<tr>
		<td colspan="8" rowspan="2" class="a" style="text-align: left">Khen thưởng kỹ luật: </td>		
		<td colspan="8" rowspan="2" class="a" style="text-align: left">Khen thưởng kỹ luật: </td>
	</tr>	
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />

<!-- NĂM THỨ 2 - NIÊN KHÓA 2010 - 2012 -->

<table style="margin-top: 50px; width: 670px" border="1" cellspacing="1" cellpadding="1" >
	<tr>		
		<th colspan="8" style="width:300px; height:80px; vertical-align: middle">NĂM THỨ HAI - NIÊN KHÓA 2010-2012</th>
		<th colspan="8" style="width:300px; height:80px; vertical-align: middle">NĂM THỨ HAI - NIÊN KHÓA 2010-2012</th>
	</tr>
	<tr>
		<td rowspan="3" style="vertical-align: middle; text-align: center"><p style="width:80px;">Môn học/Mô-đun</p></td>
		<td colspan="7" style="vertical-align: middle; text-align: center"><p style="width:200px;">Kết quả học tập Môn học/Mô-đun</p></td>
		<td rowspan="3" style="vertical-align: middle; text-align: center"><p style="width:80px;">Môn học/Mô-đun</p></td>
		<td colspan="7" style="vertical-align: middle; text-align: center"><p style="width:200px;">Kết quả học tập Môn học/Mô-đun</p></td>		
	</tr>
	<tr>
		<td rowspan="2" colspan="4" style="vertical-align: middle; text-align: center"><p style="width:80px;">Kiểm tra định kỳ</p></td>
		<td colspan="2" style="vertical-align: middle; text-align: center"><p style="width:80px;">Kiểm tra hết MH/MĐ</p></td>	
		<td rowspan="2" style="vertical-align: middle; text-align: center"><p style="width:70px;">Tổng kết</p></td>	
		<td rowspan="2" colspan="4" style="vertical-align: middle; text-align: center"><p style="width:80px;">Kiểm tra định kỳ</p></td>
		<td colspan="2" style="vertical-align: middle; text-align: center"><p style="width:80px;">Kiểm tra hết MH/MĐ</p></td>	
		<td rowspan="2" style="vertical-align: middle; text-align: center"><p style="width:70px;">Tổng kết</p></td>	
	</tr>
	<tr>
		<td style="vertical-align: middle">Lần 1</td>
		<td style="vertical-align: middle">Lần 2</td>
		<td style="vertical-align: middle">Lần 1</td>
		<td style="vertical-align: middle">Lần 2</td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Anh văn kỹ thuật</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Chính trị</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Pháp luật</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Đồ gá</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Giáo dục thể chất</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Kỹ thuật Phay 2</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Công nghệ chế tạo máy</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">CAD/CAM-CNC</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Nguyên lý máy</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a">Thực tập xí nghiệp</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Máy cắt</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Máy cắt - Thủy lực</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Kỹ thuật bảo trì thiết bị</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px">Kỹ thuật Tiện 2</td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td class="a" style="height:30px"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td class="a"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td colspan="8" class="a" style="text-align: left">Xếp loại học tập: </td>		
		<td colspan="8"  style="text-align: left">Xếp loại học tập: </td>		
	</tr>
	<tr>
		<td colspan="8" class="a" style="text-align: left">Xếp loại rèn luyện: </td>		
		<td colspan="8" style="text-align: left">Xếp loại rèn luyện: </td>
	</tr>
	<tr>
		<td colspan="8" rowspan="2" class="a" style="text-align: left">Khen thưởng kỹ luật: </td>		
		<td colspan="8" rowspan="2" class="a" style="text-align: left">Khen thưởng kỹ luật: </td>
	</tr>	
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />

<!-- KẾT QUẢ TỐT NGHIÊP -->
<center><div  style="font-size: 17px; margin-top: 50px; font-weight: bold">III. KẾT QUẢ TỐT NGHIỆP</div></center>
<br />
<table border="1" cellspacing="1" cellpadding="1"  style="width: 680px">
	<tr>
		<td rowspan="3" width="50px">Số TT</td>
		<th colspan="3">THI TỐT NGHIỆP</th>
		<td rowspan="4" width="100px" height="100px" style="vertical-align: top">Nhận xét tóm tắt quá trình học tập, rèn luyện:<br /> 
			<textarea rows="6" cols="25" style="width:200px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea>
		</td>
	</tr>
	<tr>
		<td rowspan="2" style="vertical-align: middle">Nội dung thi</td>
		<td colspan="2" width="60px" height="60px" style="vertical-align: middle">Kết quả thi</td>		
	</tr>
	<tr>
		<td style="vertical-align: middle">Lần 1</td>
		<td style="vertical-align: middle">Lần 2</td>
	</tr>
	<tr>
		<td style="height:60px"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td style="height:60px"><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td rowspan="3" width="100px" height="100px" style="vertical-align: top">
		Quyết định công nhận tốt nghiệp: <br />
			<textarea   rows="6" cols="25" style="width:200px; font-family:tahoma; resize:none; font-size: 12px" wrap="HARD"></textarea>
		Cấp ngày  .......   tháng   .......   năm  ........
		</td>
	</tr>
	<tr>
		<td style="height:60px"><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td style="height:50px"><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td style="height:60px"><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td rowspan="3" width="100px" height="100px" style="vertical-align: top">
		Bằng tốt nghiệp số:   .................<br />
		Xếp loại tốt nghiệp:  .................<br />
		Ngày cấp:   ........../............/.............
		</td>
	</tr>
	<tr>
		<td style="height:60px"><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td style="height:60px"><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
	</tr>
	<tr>
		<td style="height: 60px;"><p style="width:10px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td><p style="width:20px"></p></td>
		<td rowspan="4" width="100px" height="100px" style="vertical-align: top">
		<center>Người tổng hợp<br />(Ký, ghi rõ họ tên)</center>
		</td>
	</tr>
	<tr>
		<td colspan="4" style="text-align: left">Điểm trung bình chung:  .................................		
		</td>		
	</tr>
	<tr>
		<td colspan="4" style="text-align: left">Điểm xếp loại tốt nghiệp:  .................................		
		</td>		
	</tr>
	<tr>
		<td colspan="4" style="text-align: left">Điểm xếp loại rèn luyện:  .................................		
		</td>		
	</tr>
</table>
</div>
</body>
</html>
</pd4ml:transform>