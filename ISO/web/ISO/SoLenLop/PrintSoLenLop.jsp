<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.SoLenLopModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThangTheoDoiModel"%><pd4ml:transform
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
       titleTemplate="     BM04-QT7.3/1               Ngày hiệu lực: 20/8/2010"
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
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>So len lop</title> 
<%
	SoLenLopModel soLenLop = (SoLenLopModel) request.getSession().getAttribute("SoLenLop"); 
	ArrayList<ThangTheoDoiModel> thangTheoDoiList = (ArrayList<ThangTheoDoiModel>)request.getSession().getAttribute("ThangTheoDoiList");
	int count = 0, count1 = 0;
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="DeCuongMonHoc" value="${sessionScope.DeCuongMonHoc}"></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center; font-size: 15px;">
			<td></td>
			<td>Mẫu số 3<br/>Ban hành kèm theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>
		</tr>
		<tr style="background-color: transparent; background-position: center; font-size: 15px;" align="center">
			<td colspan="2"><STRONG>ỦY BAN NHÂN DÂN QUẬN 5<BR/>TRƯỜNG TCN KTCN HÙNG VƯƠNG</STRONG></td>
		</tr>
		<tr style="background-color: transparent; background-position: center; font-size: 15px;" align="center">
			<td colspan="2"><BR/><BR/><BR/><BR/><BR/><BR/><BR/><STRONG>SỔ LÊN LỚP</STRONG></td>
		</tr>
		<tr style="background-color: transparent; background-position: center; font-size: 15px;" align="center">
			<td colspan="2"><BR/><BR/><BR/><BR/><BR/><BR/><BR/>
			<STRONG>Lớp : ${SoLenLop.kiHieuLop }<br/>
			Trình độ : ${SoLenLop.tenTrinhDo }<br/>
			Nghề : ${SoLenLop.tenNghe }<br/>
			Khóa : 
			</STRONG></td>
		</tr>
		<tr style="background-color: transparent; background-position: center; font-size: 15px;" align="center">
			<td colspan="2"><BR/><BR/><BR/><BR/><BR/><BR/><BR/><br/><bt/><br/><STRONG>Năm học ${SoLenLop.namBatDau }-${SoLenLop.namBatDau + 1 }</STRONG></td>
		</tr>
	</table>
	<c:forEach var = "TomTatNoiDung" items="<%=soLenLop.getMonHocTKBList() %>">
		<pd4ml:page_break pageCounter="1"></pd4ml:page_break>
		<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center; font-size: 15px;">
			<td></td>
			<td>Mẫu số 3<br/>Ban hành kèm theo quyết định số 62/2008/QĐ-BLĐTBXH</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 18px;">
			<th><strong>BẢNG GHI TÓM TẮT NỘI DUNG</strong></th>
			<td>HỌ VÀ TÊN GIÁO VIÊN ${TomTatNoiDung.tenGiaoVien}<br/>MÔN HỌC/MÔ ĐUN ${TomTatNoiDung.tenMonHoc }</td>
		</tr>
	</table>
	<%count = 0; %>
	<table border = "1" width = "650" align="center" style="background-color: transparent; background-position: center;">
			<tr style="background-color: transparent;" align="center">
				<td rowspan="2"><strong>NGÀY LÊN LỚP</strong></td>
				<td colspan="4"><strong>SỐ GIỜ</strong></td>
				<td rowspan="2"><strong>TÓM TẮT NỘI DUNG BÀI DẠY, KIỂM TRA</strong></td>
				<td rowspan="2"><strong>SỐ HỌC SINH/SINH VIÊN VẮNG MẶT</strong></td>
				<td rowspan="2"><strong>CHỮ KÝ GIÁO VIÊN</strong></td>
			</tr>
			<tr  style="background-color: transparent;" align="center">
				<td><strong>Lý thuyêt</strong></td>
				<td><strong>Thực hành</strong></td>
				<td><strong>Tích hợp</strong></td>
				<td><strong>Kiểm tra</strong></td>
			</tr>
			<c:forEach var = "ChiTietTKB" items = "${TomTatNoiDung.chiTietTKBModelList}">
				<tr style="background-color: transparent;" align="center">
					<td>${ChiTietTKB.ngayHoc }</td>
					<c:choose>
						<c:when test = "${ChiTietTKB.coHieu eq 0}"><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td><td>0</td><td>0</td></c:when>
						<c:when test = "${ChiTietTKB.coHieu eq 1}"><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td><td>0</td></c:when>
						<c:when test = "${ChiTietTKB.coHieu eq 5}"><td>0</td><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td><td>0</td></c:when>
						<c:otherwise><td>0</td><td>0</td><td>0</td><td>${ChiTietTKB.soTietHoc1Buoi}</td></c:otherwise>
					</c:choose>
					<td>${ChiTietTKB.noiDungBaiDay }</td>
					<td>${ChiTietTKB.soSVVangMat }</td>
					<td><p></p></td>
				</tr>
				<%count++; %>
			</c:forEach>
		</table>
	</c:forEach>
	<%int countThang = -1; %>
	<c:forEach var = "ThangTheoDoi" items="<%=thangTheoDoiList %>">
		<pd4ml:page_break pageCounter="1"></pd4ml:page_break>
		<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td></td>
			<td align="center"><div class = "div_tr">Mẫu số 3<br />Ban hành kèm theo Quyết định số 62/2008/QĐ-BLĐTBXH</div></td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan="3" align="center"><font size="5"><strong>THEO DÕI NGÀY HỌC TẬP</strong></font><br />
			Tháng ${ThangTheoDoi.thang } năm ${ThangTheoDoi.nam }
			</td>
		</tr>
	</table>
	<table border = "1" width = "650" align="center" style="background-color: transparent; background-position: center;">
			<tr style="background-color: transparent; font-size: 9px" align="center">
				<td rowspan="2"><strong>STT</strong></td>
				<td rowspan="2"><strong>Họ và tên học viên</strong></td>
				<td colspan="31"><strong>NGÀY</strong></td>
				<td rowspan="2"><strong>Số giờ nghỉ có phép</strong></td>
				<td rowspan="2"><strong>Số giờ nghỉ không phép</strong></td>
				<td rowspan="2"><strong>Ghi chú</strong></td>
			</tr>
			<tr  style="background-color: transparent; font-size: 7px" align="center">
				<c:forEach var = "Ngay" begin = "1" end = "31">
					<td>${Ngay}</td>
				</c:forEach>
			</tr>
			<%countThang++; count1 = 0;%>
			<c:forEach var = "ThanhVienDiemDanh" items = "${ThangTheoDoi.thanhVienDiemDanhModelList}">
				<%
					int size = thangTheoDoiList.get(countThang).getThanhVienDiemDanhModelList().get(count1).getChiTietDiemDanhList().size();
					count1++; 
				%>
				<c:set var = "dem" value = "0"/>
				<c:set var = "SoNgayNghi" value = "0"/>
				<tr style="background-color: transparent; font-size: 9px" align="center">
					<td><%=count1 %></td>
					<td>${ThanhVienDiemDanh.tenThanhVien}</td>
					<c:forEach var = "Ngay" begin = "1" end = "31">
						<c:set var = "check" value = "0"/><!-- kiem tra xem ngay do co hoc ko -->
						<c:set var = "check1" value = "0"/><!-- kiem tra xem ngay do co hoc nhieu buoi ko -->
						<c:set var = "TinhTrangDiHoc" value = "x"/>
						<td>
							<c:forEach var = "Count" begin = "${dem}" end = "<%=size %>">
								<c:if test = "${Ngay eq ThanhVienDiemDanh.chiTietDiemDanhList[Count].ngay}">
									<c:choose>
										<c:when test = "${ThanhVienDiemDanh.chiTietDiemDanhList[Count + 1].ngay eq ThanhVienDiemDanh.chiTietDiemDanhList[Count].ngay 
											and not empty ThanhVienDiemDanh.chiTietDiemDanhList[Count + 1].ngay}">
											<c:choose>
												<c:when test="${ChiTietDiemDanh[Count].tinhTrangDiHoc eq 4 and TinhTrangDiHoc eq 'x'}">
													<c:set var = "TinhTrangDiHoc" value = "x"/>
												</c:when>
												<c:otherwise>
													<c:set var = "TinhTrangDiHoc" value = "k"/>
												</c:otherwise>
											</c:choose>
											<c:set var = "check1" value = "${check1 + 1}"/>
										</c:when>
										<c:otherwise>
											<c:if test = "${check1 eq '0'}">
												<c:choose>
													<c:when test = "${ChiTietDiemDanh[Count].tinhTrangDiHoc eq 4}">
														<c:set var = "TinhTrangDiHoc" value = "x"/>
													</c:when>
													<c:otherwise>
														<c:set var = "TinhTrangDiHoc" value = "k"/>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:choose>
												<c:when test = "${TinhTrangDiHoc  eq 'x'}">&nbsp;&nbsp;&nbsp;</c:when>
												<c:otherwise>${TinhTrangDiHoc }&nbsp;<c:set var = "SoNgayNghi" value = "${SoNgayNghi + 1}"/></c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
									<!--<c:choose>
										<c:when test = "${ChiTietDiemDanh[Count].tinhTrangDiHoc eq 4}">x&nbsp;</c:when>
										<c:otherwise>k&nbsp;</c:otherwise>
									</c:choose>
									--><c:set var = "dem" value = "${Count + 1}"/>
									<c:set var = "check" value = "1"/>
								</c:if>
							</c:forEach>
							<c:if test = "${check eq '0'}">&nbsp;&nbsp;&nbsp;</c:if>
						</td>
					</c:forEach>
					<td><p></p></td>
					<td>${SoNgayNghi }</td>
					<td><p></p></td>
				</tr>
			</c:forEach>
		</table>
	</c:forEach>
	</td></tr>
</table>
</div>
</div>	
</html>
</pd4ml:transform>