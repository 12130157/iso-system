<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="javax.mail.Session"%><pd4ml:transform
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
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Kế Hoạch Giảng Dạy</title> 
</head>
<div align="center">
<div class = "div_body">

<c:set var="KHGD" value="${sessionScope.objKHGD}"></c:set>
<c:set var="tuanKHGDList" value = '<%= ChiTietKHGDDAO.getChiTietKHGDByMaKHGDGroupByTuan(request.getParameter("maKHGD"))%>'></c:set>
<c:set var="chiTietList" value = "${sessionScope.chiTietKHGDList}"></c:set>

<table width="100%" height="100%" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">
	<tr><td>
	<table width = "900" align="center" style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td align="center">ỦY BAN NHÂN DÂN QUẬN 5<br />TRƯỜNG TCN KTCN HÙNG VƯƠNG </td>
			<td align="center">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />Độc lập – Tự do – Hạnh phúc</td>
		</tr>
	</table>
	<table width = "900" align="center" style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td colspan="3" align="center">
				<strong>KẾ HOẠCH GIẢNG DẠY HỆ TRUNG CẤP NGHỀ/CAO ĐẲNG NGHỀ</strong>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td>
				<div class = "div_textleft">Học kỳ : ${KHGD.hocKi}</div>
			</td>
			<td>
				<div class = "div_textleft">Số giờ  môn học : ${KHGD.soGioLT + KHGD.soGioTH}</div>
			</td>
			<td>
				<div class = "div_textleft">Môn học : ${KHGD.tenMonHoc}</div>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td>
				<div class = "div_textleft">Năm học : ${KHGD.namHoc}</div>
			</td>
			<td>
				<div class = "div_textleft">Số giờ lý thuyết : ${KHGD.soGioLT}</div>
			</td>
			<td>
				<div class = "div_textleft">Giáo viên : ${KHGD.tenGiaoVien}</div>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td></td>
			<td>
				<div class = "div_textleft">Số giờ thực hành : ${KHGD.soGioTH}</div>
			</td>
			<td>
				<div class = "div_textleft">Số ca thực hành : ${KHGD.soCaThucHanh}.   Lớp : ${KHGD.kiHieuLop}</div>
			</td>
		</tr>
	</table>
	<table width = "900" border = "1" align="center" style="background-color: transparent;" id="TableNoiDung">
		<tr style="background-color: transparent;">
			<td rowspan="2" align="center">Tuần lễ</td>
			<td colspan="2" align="center">Thời gian giảng dạy</td>
			<td colspan="3" align="center">Số giờ</td>
			<td rowspan="2" align="center">Nội dung giảng dạy (Tên chương, bài. đề mục theo chương trình đã qui định)</td>
			<td rowspan="2" align="center">Tên sản phẩm ứng dụng trong bài tập</td>
			<td rowspan="2" align="center">Công việc chuẩn bị trước khi giảng dạy</td>
		</tr>
		<tr style="background-color: transparent;">
			<td align="center" style="width: 80px">Từ</td>
			<td align="center" style="width: 80px">Đến</td>
			<td align="center">LT</td>
			<td align="center">BT</td>
			<td align="center">TH</td>
		</tr>
		
			<c:forEach var="objTuanChiTietKHGD" items="${tuanKHGDList}">
			<tr style="background-color: transparent;">
				<c:if test="${objTuanChiTietKHGD.maKHGD eq KHGD.maKHGD}">
						<c:set var="LT" value="0"></c:set>
						<c:set var="TH" value="0"></c:set>
						<c:set var="noiDungLT" value=""></c:set>
						<c:set var="noiDungTH" value=""></c:set>
						<c:set var="chuanBi" value=""></c:set>
						<td align="center">${objTuanChiTietKHGD.tuan}</td>
						<td align="center">${objTuanChiTietKHGD.ngayBD}</td>
						<td align="center">${objTuanChiTietKHGD.ngayKT}</td>
						<c:forEach var="objChiTietKHGD" items="${chiTietList}">
							<c:if test="${objChiTietKHGD.tuan eq objTuanChiTietKHGD.tuan}">
								<c:if test="${objChiTietKHGD.coHieu eq '1'}"><c:set var="LT" value="${LT + KHGD.soTietMoiBuoi}"></c:set></c:if>
								<c:if test="${objChiTietKHGD.coHieu eq '2'}"><c:set var="TH" value="${TH + KHGD.soTietMoiBuoi}"></c:set></c:if>
								<c:set var="noiDungLT" value="${noiDungLT} ${objChiTietKHGD.tenChuong} <br/>"></c:set>
								<c:set var="noiDungTH" value="${noiDungTH} ${objChiTietKHGD.noiDungTH} <br/>"></c:set>
								<c:set var="chuanBi" value="${objChiTietKHGD.congViecChuanBi} <br/>"></c:set>
							</c:if>
						</c:forEach>
						<td align="right">${LT}</td>
						<td align="right"><p></p></td>
						<td align="right">${TH}</td>
						<td align="center">
							<c:choose>
								<c:when test="${noiDungLT eq ''}">
									<p></p>
								</c:when>
								<c:otherwise>
									${sf:appendBrTag(noiDungLT)}
								</c:otherwise>
							</c:choose>
						</td>
						<td align="center">
							<c:choose>
								<c:when test="${noiDungTH ne ''}">
									${sf:appendBrTag(noiDungTH)}
								</c:when>
								<c:otherwise>
									<p></p>
								</c:otherwise>
							</c:choose>
						</td>
						<td align="center">
							<c:choose>
								<c:when test="${chuanBi eq ''}">
									<p></p>
								</c:when>
								<c:otherwise>
									${sf:appendBrTag(chuanBi)}
								</c:otherwise>
							</c:choose>
						</td>
				</c:if>
			</tr>
			</c:forEach>
	</table>
		
	<table width = "900" align="center" style="background-color: transparent;"> 
		<tr style="background-color: transparent;"><td colspan="3"><div class = "div_tr">
			<br />
		Ghi chú:<br />
		- Nếu dạy nhiều lớp cùng tiến độ giảng dạy thì ghi chung kế hoạch.<br />
		- Giáo viên lập thành 3 bản: 1 bản nộp P.Đào Tạo, 1 bản nộp Trưởng Khoa, 1 bản giáo viên lưu.<br />
		</div></td></tr>
		
		<tr style="background-color: transparent;">
			<td></td>
			<td></td>
			<td>Quận 5, ngày </td>
		</tr>
		<tr style="background-color: transparent;">
			<td>Hiệu trưởng</td>
			<td>Trưởng khoa</td>
			<td>Giáo viên biên soạn</td>
		</tr>
		<tr style="background-color: transparent;">
			<td><br/><br/><br/>${KHGD.tenNguoiDuyet}</td>
			<td><br/><br/><br/>${KHGD.tenTruongKhoa}</td>
			<td><br/><br/><br/>${KHGD.tenNguoiTao}</td>
		</tr>
	</table>
</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>