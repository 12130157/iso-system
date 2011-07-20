<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><pd4ml:transform
	screenWidth="700"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="30,20,0,20,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Times New Roman" monospace="Courier New" />
<pd4ml:header 
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM05-QT7.3/1               Ngày hiệu lực: 15/9/2009"
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
<%@page import="java.io.PrintWriter"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Đề Nghị Nhân Sự</title> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="HoSoDuTuyen" value="${sessionScope.HoSoDuTuyen}"></c:set>
<c:set var="ViTriDuTuyen" value="${sessionScope.ViTriDuTuyen }"></c:set>
<c:set var="DeNghiKTV" value="${sessionScope.DeNghiKTV}"></c:set>
<c:set var="sig" value="-"></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center; font-size: 12px;">
			<td><p style="font-weight: bold;text-align: center">Trường TCNKTCN Hùng Vương<br/>
			P/K/BM ${HoSoDuTuyen.ten_bo_phan}
			</p></td>
			<td><p style="font-weight: bold;text-align: center">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
			Độc Lập - Tự Do - Hạnh Phúc
			</p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<th colspan = "2"><br /> <p style="font-weight: bold">ĐỀ NGHỊ KHOÁN THỬ VIỆC NHÂN SỰ</p><br /></th>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
			<tr style="background-color: transparent;">
				<td valign="top">Kính Gửi :</td>
				<td style="text-align: left">
					- Hiệu Trưởng Trường Trung Cấp Nghề KTCN Hùng Vương<br/>
					- Trưởng Phòng Tổ Chức Hành Chánh Quản Trị<br/>
					- Trưởng Phòng Đào Tạo (nếu là giáo viên)
				</td>
			</tr>
	</table>
	<table style="background-color: transparent;margin: 0 0 30px 50px;">
			<tr style="background-color: transparent;">
				<td colspan="2" style="text-align: left;">
					<p>
					Căn cứ Giấy đề xuất tuyển dụng nhân sự ngày 
					<b>${ViTriDuTuyen.ngay_cap_nhat_cuoi }</b>
					đã được Hiệu trưởng phê duyệt, sau thời gian
					tìm kiếm nhân sự làm việc cho chức danh 	
					<b>${ViTriDuTuyen.vaiTro }</b>
					Nay Phòng/Khoa/Bộ môn 
					<b>${ViTriDuTuyen.boPhan }</b>
					đề nghị Hiệu trưởng khoán thử việc theo chức danh trên, đối với : 
					</p>
				</td>
			</tr>
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
		<tr style="background-color: transparent; font-size: 14px;">
			<td style="text-align: left;">-	Anh (Chị) : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.ho_ten }</b></td>		
		</tr>		
		<tr style="background-color: transparent; font-size: 14px;">
			<td style="text-align: left;">-	Ngày sinh : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.ngay_sinh_mdy }</b></td>		
		</tr>
		<tr style="background-color: transparent; font-size: 14px;">
			<td style="text-align: left;">-	Địa chỉ tường chú : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.dia_chi }</b></td>		
		</tr>
		<tr style="background-color: transparent; font-size: 14px;">
			<td style="text-align: left;">-	Nơi ở hiện nay :</td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.dia_chi }</b></td>		
		</tr>
		<tr style="background-color: transparent; font-size: 14px;">
			<td style="text-align: left;">-	Trình độ :</td>		
		</tr>							
	</table>
	
	
	
	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent; font-size: 14px;">
				<td style="text-align: left;width: 220px;padding-left: 50px;">*Học vấn : </td>
				<td style="text-align: left;width: 430px;"><b>${HoSoDuTuyen.trinh_do_van_hoa }</b></td>		
			</tr>		
			<tr style="background-color: transparent; font-size: 14px;">
				<td style="text-align: left;padding-left: 50px;">*Chuyên môn, nghiệp vụ  : </td>
				<td style="text-align: left;"><b>${HoSoDuTuyen.chuyen_mon }</b></td>		
			</tr>
			<tr style="background-color: transparent; font-size: 14px;">
				<td style="text-align: left;padding-left: 50px;">*Tin học :  </td>
				<td style="text-align: left;"><b>${HoSoDuTuyen.tin_hoc }</b></td>		
			</tr>
			<tr style="background-color: transparent; font-size: 14px;">
				<td style="text-align: left;padding-left: 50px;">*Ngoại ngữ : </td>
				<td style="text-align: left;"><b>${HoSoDuTuyen.ngoai_ngu }</b></td>		
			</tr>
			<tr style="background-color: transparent; font-size: 14px;">
				<td style="text-align: left;padding-left: 50px;">*Kinh nghiệm thực tiễn <br/>(nếu có) : </td>
				<td style="text-align: left;"><b>${HoSoDuTuyen.tom_tat_ban_than }</b></td>		
			</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
		<tr style="background-color: transparent; font-size: 14px;">
			<td colspan="2" style="text-align: left;">	
			-	Thời gian làm việc : ${DeNghiKTV.thoi_gian } Tháng ( từ ngày :  
					${DeNghiKTV.bat_dau_mdy }
				đến ngày : 
					${DeNghiKTV.ket_thuc_mdy } )
					<br/>
			-	Lương khoán : ${DeNghiKTV.luong_khoan } đồng/tháng .
			</td>
		</tr>						
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">			
		<tr style="background-color: transparent; font-size: 14px;">
			<td style="margin-left: 50px; text-align: left">
				Phòng/Khoa/Bộ môn  
					<b>${HoSoDuTuyen.ten_bo_phan }</b>
				sẽ hướng dẫn, theo dõi anh(chị) <b>${HoSoDuTuyen.ho_ten }</b>
				làm việc và sẽ đề nghị ký hợp đồng nếu thích ứng công việc.<br/>
			</td>
		</tr>						
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: center;margin-top: 100px;">
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td>
				<c:if test="${not empty DeNghiKTV.ngay_HC_duyet_mdy}">
					ngày ${sf:getElement(DeNghiKTV.ngay_HC_duyet_mdy,0,sig)} tháng ${sf:getElement(DeNghiKTV.ngay_HC_duyet_mdy,1,sig)} năm ${sf:getElement(DeNghiKTV.ngay_HC_duyet_mdy,2,sig)}
				</c:if>
			</td>
			<td>
				<c:if test="${not empty DeNghiKTV.ngay_DT_duyet_mdy}">
					ngày ${sf:getElement(DeNghiKTV.ngay_DT_duyet_mdy,0,sig)} tháng ${sf:getElement(DeNghiKTV.ngay_DT_duyet_mdy,1,sig)} năm ${sf:getElement(DeNghiKTV.ngay_DT_duyet_mdy,2,sig)}
				</c:if>
			</td>
			<td>Quận 5, ngày ${sf:getElement(DeNghiKTV.ngay_TK_duyet_mdy,0,sig)} tháng ${sf:getElement(DeNghiKTV.ngay_TK_duyet_mdy,1,sig)} năm ${sf:getElement(DeNghiKTV.ngay_TK_duyet_mdy,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td><p style="font-weight: bold; font-size: 14px">TRƯỞNG PHÒNG TCHCQT </p></td>
			<td><p style="font-weight: bold; font-size: 14px">TRƯỞNG PHÒNG ĐÀO TẠO </p></td>
			<td><p style="font-weight: bold; font-size: 14px">TRƯỞNG P/K/BM</p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td><p style="font-weight: bold; font-size: 14px">${DeNghiKTV.ten_phong_HC } </p></td>
			<td><p style="font-weight: bold; font-size: 14px">${DeNghiKTV.ten_phong_DT } </p></td>
			<td><p style="font-weight: bold; font-size: 14px">${DeNghiKTV.ten_truong_khoa }</p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td></td>
			<td>
				<c:if test="${not empty DeNghiKTV.ngay_HT_duyet_mdy}">
					ngày ${sf:getElement(DeNghiKTV.ngay_HT_duyet_mdy,0,sig)} tháng ${sf:getElement(DeNghiKTV.ngay_HT_duyet_mdy,1,sig)} năm ${sf:getElement(DeNghiKTV.ngay_HT_duyet_mdy,2,sig)}
				</c:if>
			</td>
			<td></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td></td>
			<td><p style="font-weight: bold; font-size: 14px">HIỆU TRƯỞNG </p></td>
			<td></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<td></td>
			<td><p style="font-weight: bold; font-size: 14px">${DeNghiKTV.ten_hieu_truong } </p></td>
			<td></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
	</table>
</td>
</tr>
</table>
</div>
</div>
</html>
</pd4ml:transform>