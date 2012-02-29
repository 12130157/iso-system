<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.BangDiemHocKiModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.model.HocKiTungLopModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.HocKiTungLopDAO"%><pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="0,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />

<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/mask_ngang.gif" 
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>

<pd4ml:footer 
       titleTemplate="     BM02-QT7.5.1/3 & 8.4                          Ngày hiệu lực: 15/9/2009"                 
       pageNumberTemplate="Trang $[page]/$[total]     "
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20" 
       watermarkOpacity="50"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif" 
	   watermarkBounds="0,580,500,20"	      
       fontSize="12">       
</pd4ml:footer>

<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Print Điểm Học Kỳ</title> 
</head>
<%
	ArrayList<BangDiemHocKiModel> bangDiemHocKiList = (ArrayList<BangDiemHocKiModel>) request.getSession().getAttribute("BangDiemHocKiList");
	ArrayList<ThanhVienModel> thanhVienList = (ArrayList<ThanhVienModel>) request.getSession().getAttribute("BangDiemHocVienList");
	HocKiTungLopModel hocKiTungLop = HocKiTungLopDAO.getHocKiTungLopByID(request.getParameter("MaHKTL"));
%>
<body onload="pageLoad()">
<div align="center">
<div class = "div_body">
	<c:set var = "BangDiemHocVienList" value = "<%=thanhVienList %>" scope="session"/>
	<c:set var = "BangDiemHocKiList" value = "<%=bangDiemHocKiList %>" scope="session"/>
	<c:set var = "HocKiTungLop" value = "<%=hocKiTungLop %>"/>
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">	
	<tr>
		<td>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 15px;">
					<td><p style="font-weight: bold">TRƯỜNG TCN KTCN HÙNG VƯƠNG<br/>Khoa: </p></td>
					<td><p style="font-weight: bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
													 Độc lập - Tự do - Hạnh phúc</p></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 18px">BẢNG TỔNG KẾT KẾT QUẢ HỌC TẬP HỌC KỲ ${HocKiTungLop.hocKi } NĂM HỌC ${HocKiTungLop.namHoc }</p><br /></th>
				</tr>
				<tr align="right" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td colspan="2">
						Ngành: ${HocKiTungLop.tenChuyenNganh }
						Lớp: ${HocKiTungLop.kiHieuLop }
					</td>
				</tr>
			</table>
			<c:set var = "MonHocList" value = "${sf:getAllMonHoc(BangDiemHocVienList)}"/>
			<c:set var = "TongSoMonHoc" value = "${sf:getTongSoMonHoc(MonHocList)}"/>
			<c:set var = "Count" value = "1"/>
			<table width = "900" border = "1" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td width="9%" colspan="2"><strong>STT</strong></td>
					<td width="13%" colspan="2"><strong>MSHV</strong></td>
					<td width="13%" colspan="2"><strong>Họ và tên</strong></td>
					<td width="13%" colspan="2"><strong>ĐTB</strong></td>
					<td width="13%" colspan="2"><strong>ĐRL</strong></td>
					<td width="13%" colspan="2"><strong>ĐTBC</strong></td>
					<td width="13%" colspan="2"><strong>Xếp loại</strong></td>
					<td width="13%" rowspan="2"><strong>Xếp loại hạnh kiểm</strong></td>
					<td width="13%" rowspan="2"><strong>Số ngày nghỉ</strong></td>
					<td width="13%" rowspan="2"><strong>Ghi chú</strong></td>
					<c:forEach var = "CountMonHoc" begin = "1" end="${TongSoMonHoc}">
						<td></td>
					</c:forEach>
				</tr>
				
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<c:forEach var = "CountMonHoc" begin = "1" end="${TongSoMonHoc}">
						<td></td>
					</c:forEach>
				</tr>
				
				<c:forEach var = "ThanhVien" items="${BangDiemHocVienList}">
					<tr>
						<td>${Count }</td>
						<td></td>
						<td>${ThanhVien.tenThanhVien}</td>
						<td>${BangDiemHocKi[Count-1].diemTrungBinh }</td>
						<td>${BangDiemHocKi[Count-1].diemRenLuyen }</td>
						<td>${BangDiemHocKi[Count-1].diemTBHocKi }</td>
						<td>${BangDiemHocKi[Count-1].hocLuc }</td>
						<td>${BangDiemHocKi[Count-1].hanhKiem }</td>
						<td>-</td>
						<td>${BangDiemHocKi[Count-1].ghiChu }</td>
						<c:forEach var = "DangKyMonHoc" items="${ThanhVien.dangKyMonHocList}">
							<td>${DangKyMonHoc.diemTrungBinh }<input type = "hidden" value = "${DangKyMonHoc.diemTrungBinh }" id = "txtDiemTB${DangKyMonHoc.maHocVien}_${DangKyMonHoc.maMonHoc}"/></td>
						</c:forEach>
					</tr>
					<c:set var = "Count" value = "${Count + 1}"/>
				</c:forEach>
			</table>
			<c:set var = "Count" value = "0"/>
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr style="background-color: transparent; font-size: 16px;">
					<td>
						<table>
							<tr>
								<td>Số học sinh đạt loại Trung bình</td>
								<td><c:if test = "${not empty MonHocList[count]}">${MonHocList}<c:set var = "Count" value = "${Count + 1}"/></c:if></td>
							</tr>
							
							<tr>
								<td>Số học sinh đạt loại Trung bình khá </td>
								<td><c:if test = "${not empty MonHocList[count]}">${MonHocList}<c:set var = "Count" value = "${Count + 1}"/></c:if></td>
							</tr>
							
							<tr>
								<td>Số học sinh đạt loại Xuất sắc</td>
								<td><c:if test = "${not empty MonHocList[count]}">${MonHocList}<c:set var = "Count" value = "${Count + 1}"/></c:if></td>
							</tr>
							
							<tr>
								<td>Số học sinh đạt loại Yếu </td>
								<td><c:if test = "${not empty MonHocList[count]}">${MonHocList}<c:set var = "Count" value = "${Count + 1}"/></c:if></td>
							</tr>
							
							<tr>
								<td>Số học sinh đạt loại Giỏi </td>
								<td><c:if test = "${not empty MonHocList[count]}">${MonHocList}<c:set var = "Count" value = "${Count + 1}"/></c:if></td>
							</tr>
							
							<tr>
								<td>Số học sinh đạt loại Kém </td>
								<td><c:if test = "${not empty MonHocList[count]}">${MonHocList}<c:set var = "Count" value = "${Count + 1}"/></c:if></td>
							</tr>
							
							<tr>
								<td>Số học sinh đạt loại Khá </td>
								<td><c:if test = "${not empty MonHocList[count]}">${MonHocList}<c:set var = "Count" value = "${Count + 1}"/></c:if></td>
							</tr>
							<c:if test = "${Count lt TongSoMonHoc}">
								<c:forEach var = "CountMonHoc" begin="${Count}" end = "${TongSoMonHoc - 1}">
									<td><p></p></td>
									<td>${MonHocList[CountMonHoc]}</td>
								</c:forEach>
							</c:if>
						</table>
					</td>
					
					<td>
						<table>
							<tr>
								<td>Ghi chú môn học</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table width = "900" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td><p style="font-weight: bold">KT.Hiệu trưởng </td>
					<td><p style="font-weight: bold">Trưởng/Phó Khoa/TT</td>
					<td><p style="font-weight: bold">Giáo vụ khoa/TT tổng hợp</td>
				</tr>
				<tr>
					<td><p style="font-weight: bold">Phó Hiệu trưởng </td>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
					<td><p style="font-weight: bold"></td>
					<td><p style="font-weight: bold"></td>
				</tr>
			</table>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</td>
	</tr>	
</table>
</div>
</div>
</body>
</html>
</pd4ml:transform>