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
       titleTemplate="     BM05-QT6.2/1               Ngày hiệu lực: 15/9/2009"
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
<c:set var="HopDongLaoDong" value="${sessionScope.HopDongLaoDong}"></c:set>
<c:set var="space" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></c:set>
<c:set var="sig" value="-"></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td style="text-align: center;">
				ỦY BAN NHÂN DÂN QUẬN 5<br/>
				<b>TRƯỞNG TCN KTCN HÙNG VƯƠNG</b><br/>
				--------------------------<br/>
				Số: /HĐLVLĐ 
			</td>
			<td style="text-align: center;">
				<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
				<b>Độc Lập - Tự Do - Hạnh Phúc</b><br/>
				--------------------------<br/>
				Quận 5, ngày ${sf:getElement(HopDongLaoDong.ngay_lap_mdy,0,"-")} tháng ${sf:getElement(HopDongLaoDong.ngay_lap_mdy,1,"-")} năm ${sf:getElement(HopDongLaoDong.ngay_lap_mdy,2,"-")}
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<br/><br/><br/>
			<td colspan="2" style="text-align: center;"><strong style="font-size: 25px;">HỢP ĐỒNG LÀM VIỆC <c:if test="${HopDongLaoDong.so_lan eq '0'}">LẦN ĐẦU</c:if></strong><br/>--------------------------</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
			<tr style="background-color: transparent;">
			<td style="text-align: left;">
				 ${space }
				 Căn cứ Nghị định số 116/2003/NĐ-CP ngày 10/10/2003 của Chính
				  phủ về tuyển dụng sử dụng và quản lý cán bộ, công chức trong các đơn vị sự
				  nghiệp Nhà nước.
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="text-align: left;">
				${space }Chúng tôi, một bên là ông : <b style="font-weight: bold;">Trần Văn Hải</b><br/>
				${space }Chức vụ : <b style="font-weight: bold;">Hiệu Trưởng</b><br/>
				${space }Đại diện cho Trường Trung cấp nghề Kỹ Thuật Công Nghệ Hùng Vương.<br/>
				${space }Địa chỉ : 161-165 Nguyễn Chí Thanh, phường 12, quận 5,TP HCM.<br/>
				${space }Điện thoại : 8.563.456, 8.558.016<br/>
				${space }Và một bên là <c:choose><c:when test="${HoSoDuTuyen.gioi_tinh eq 'Nam'}">Ông</c:when><c:otherwise>Bà</c:otherwise></c:choose> : <b style="font-weight: bold;">${HopDongLaoDong.ten_nguoi_du_tuyen }</b><br/>
				${space }Sinh ngày <b style="font-weight: bold;">${HoSoDuTuyen.ngay_sinh_mdy }</b> tại TP HCM<br/>
				${space }Nghề Nghiệp : <b style="font-weight: bold;">${HoSoDuTuyen.ten_vai_tro }</b><br/>
				${space }Địa chỉ thưởng trú tại : ${HoSoDuTuyen.dia_chi }<br/>
				${space }Nơi ở hiện nay : ${HoSoDuTuyen.dia_chi }<br/>
				${space }Số CMND : ${HoSoDuTuyen.cmnd }, cấp ngày ${HoSoDuTuyen.ngay_cap } tại ${HoSoDuTuyen.noi_cap  } <br/>
				${space }Thỏa thuận ký kết Hợp đồng làm việc <c:if test="${HopDongLaoDong.so_lan eq '0'}">lần đầu</c:if> và cam 
				kết làm đúng những điều khoản sau đây : <br/><br/>
				
 				${space }<b style="font-size: 18px;font-weight: bold;">Điều 1 : Thời hạn và nhiệm vụ hợp đồng.</b><br/><br/>
 				${space }- Thời gian thực hiện hợp đồng : ${HopDongLaoDong.thoi_gian } tháng<br/>
 				${space }- Từ ngày ${HopDongLaoDong.bat_dau_mdy } đến ngày ${HopDongLaoDong.ket_thuc_mdy }<br/>
 				${space }- Địa điểm làm việc : 161-165 Nguyễn Chí Thanh, phường 12, quận 5.<br/>
 				${space }- Chức danh chuyên môn: Thư ký <br/>
 				${space }- Nhiệm vụ : Theo bản mô tả công việc<br/><br/>
 				
 				${space }<b style="font-size: 18px;font-weight: bold;">Điều 2 : Chế độ làm việc.</b><br/><br/>
 				${space }- Thời gian làm việc : trong giờ hành chính theo nội qui cơ quan.<br/>
 				${space }- Được trang bị những phương tiện làm việc gồm : cơ sở vật chất phục 
 				vụ việc giảng dạy<br/><br/>
 				
 				${space }<b style="font-size: 18px;font-weight: bold;">Điều 3 : Nghĩa vụ và quyền lợi của người ký hợp đồng làm việc lần đầu.</b><br/><br/>
 				
 				${space }<b style="font-size: 18px;font-weight: bold;">1/ Nghĩa vụ : </b><br/><br/>
 				${space }- Hoàn thành các nhiệm vụ cam kết trong hợp đồng.<br/>
 				${space }- Chấp hành nội quy, quy chế của đơn vị, kỷ luật làm việc và các qui 
 				định của Pháp lệnh cán bộ, công chức.<br/>
 				${space }- Chấp hành việc xử lý kỹ luật và bồi thường thiệt hại theo qui định
 				của pháp luật.<br/><br/>
 				
 				${space }<b style="font-size: 18px;font-weight: bold;">2/ Quyền lợi : </b><br/><br/>
 				${space }- Được hưởng các quyền lợi qui định tại Pháp lệnh cán bộ công chức.<br/>
 				${space }- Phương tiện đi lại làm việc : giáo viên tự lo.<br/>
 				${space }- Thử việc của ngạch (mã số) : 
 				Viên chức loại ${HopDongLaoDong.loai_vien_chuc } mã số ${HopDongLaoDong.ma_ngach },
 				Bậc: ${HopDongLaoDong.bac }, Hệ số lương: ${HopDongLaoDong.he_so_luong } 
 				<c:if test="${HopDongLaoDong.so_lan eq '0'}">(được hưởng 85%)</c:if><br/>
 				${space }- Phụ cấp (nếu có) gồm : theo qui định của nhà nước. 
 				Được trả 1 lần vào các ngày 10 hàng tháng.<br/>
 				${space }- Khoản trả ngoài lương : theo qui định của nhà trường.<br/>
 				${space }- Được trang bị bảo hộ khi làm việc (nếu có) gồm : không.<br/>
 				${space }- Số ngày nghĩ hàng năm được hưởng lương (nghĩ lễ, phép, việc riêng) : 
 				theo qui định của pháp luật.<br/>
 				${space }- Bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp : cơ quan ký 
 				hợp đồng và người lao động đóng theo qui định hiện hành của nhà nước.<br/>
 				${space }- Được hưởng các phúc lợi : không<br/>
 				${space }- Được các khoảng thưởng, đào tạo, bồi dưỡng chuyên môn nghiệp vụ, thực
 				hiện nhiệm vụ hợp tác khoa học, công nghệ với các đơn vị trong hoặc ngoài 
 				nước theo qui định của pháp luật : được tham dự các lớp bồi dưỡng, đào tạo về 
 				chuyên môn, nghiệp vụ liên quan đến công tác giảng dạy do nhà trường tổ chức.<br/>
 				${space }- Được hưởng chế độ thôi việc, trợ cấp thôi việc, bồi thường theo qui 
 				định của Pháp lệnh cán bộ, công chức.<br/>
 				${space }- Có quyền, đề xuất, khiếu nại, thay đổi, đề nghị chấm dứt Hợp đồng 
 				theo qui định của pháp luật.<br/>
 				${space }- Những thỏa thuận khác : thực hiện theo Nghị quyết Hội nghị cán bộ 
 				công chức hàng năm.<br/><br/>
 				
 				${space }<b style="font-size: 18px;font-weight: bold;">Điều 4 : Nghĩa vụ và quyền hạn của người đứng đầu đơn vị sự nghiệp.</b><br/><br/>
 				
 				${space }<b style="font-size: 18px;font-weight: bold;">1/ Nghĩa vụ : </b><br/><br/>
 				
 				${space }- Bảo đảm việc làm và thực hiện đầy đủ những điều đã cam kết trong 
 				hợp đồng làm việc lần đầu.<br/>
 				${space }- Thanh toán đầu đủ, đúng thời hạn các chế độ và quyền lợi của người 
 				ký hợp đồng làm việc lần đầu.<br/><br/>
 				
 				${space }<b style="font-size: 18px;font-weight: bold;">2/ Quyền hạn : </b><br/><br/>
 				
 				${space }- Điều hành người ký hợp đồng làm việc lần đầu hoàn thành nhiệm vụ 
 				theo hợp đồng (Bố trí, điều động, tự điều chỉnh công tác ...)<br/>
 				${space }- Chấm dứt hợp đồng, kỷ luật người ký hợp đồng làm việc lần đầu theo 
 				qui định của Pháp lệnh cán bộ, công chức.<br/><br/>
 				
 				${space }<b style="font-size: 18px;font-weight: bold;">Điều 5 : Điều khoản thi hành </b><br/><br/>
 			
 				${space }- Hợp đồng này làm thành 3 bản có giá trị ngang nhau, mỗi bên giữ 
 				một bản, Phòng Nội Vụ quận 5 giữ một bản và có hiệu lực từ ngày ${HopDongLaoDong.ngay_HT_duyet_mdy }.<br/>
 				${space }- Hợp đồng này làm tại Trường Trung cấp nghề Kỹ thuật Công Nghệ 
 				Hùng Vương ngày ${HopDongLaoDong.ngay_lap_mdy }.<br/><br/>
			</td>
		</tr>
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: center;">
		<tr style="background-color: transparent;padding-bottom: 20px;">
			<td style="padding-bottom: 50px;text-align: center;"> 
				<br /><strong style="font-weight: bold">NGƯỜI KÝ HỢP ĐỒNG</strong><br />
				<br /><br /><br /><br /><br />
				<c:if test="${not empty HopDongLaoDong.ngay_NDT_duyet}">
					<b style="font-size: 18px;font-weight: bold;">${HopDongLaoDong.ten_nguoi_du_tuyen }</b>
				</c:if>
			</td>
			<td style="padding-bottom: 50px;text-align: center;"> 
				<br /><strong style="font-weight: bold">HIỆU TRƯỞNG</strong><br />
				<br /><br /><br /><br /><br />
				<b style="font-size: 18px;font-weight: bold;">${HopDongLaoDong.ten_hieu_truong }</b>
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
</div>
</div>
</html>
</pd4ml:transform>