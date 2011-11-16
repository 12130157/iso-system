<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
       titleTemplate="     BM04-QT6.2/1               Ngày hiệu lực: 15/9/2009"
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
<c:set var="SoTayGiaoVien" value="${sessionScope.SoTayGiaoVien}"></c:set>
<table width="700" height="800" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
<tr>
<td>
			<table style="background-color: transparent;width: 700px;margin-bottom: 270px 0;font-size: 20px;font-weight: bold;" align="center">
				<tr style="background-color: transparent;">
					<td style="text-align: center;">
						ỦY BAN NHÂN DÂN QUẬN 5<br/>
						TRƯỜNG TCN KTCN HÙNG VƯƠNG
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="font-weight: bold;font-size: 30px;text-align: center;padding: 240px 0;">
						SỔ TAY GIÁO VIÊN
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left;padding-left: 200px;">Môn Học/mô - đun : ${SoTayGiaoVien.tenMonHoc }</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left;padding-left: 200px;">Lớp : ${SoTayGiaoVien.tenLopHoc }                 Khóa : ${SoTayGiaoVien.khoa }</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left;padding-left: 200px;">Giáo Viên : ${SoTayGiaoVien.tenGiaoVien }</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left;padding-left: 200px;">Năm Học : ${SoTayGiaoVien.namHoc }</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left;padding-left: 200px;">Trình độ đào tạo : ${SoTayGiaoVien.tenHeDaoTao }</td>
				</tr>
			</table>
			<pd4ml:page_break pageCounter="1"></pd4ml:page_break>
			<table style="background-color: transparent;font-size: 20px;" align="center">
				<tr style="background-color: transparent;">
					<td style="text-align: center;font-weight: bold;">
						Thông tin về lớp học/khóa
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left;">
						<p style="padding-left: 50px;">1. Nghề đào tạo : ${SoTayGiaoVien.tenChuyenNganh }</p>
						<p style="padding-left: 50px;">2. Trình độ đào tạo nghề : ${SoTayGiaoVien.tenHeDaoTao }</p>
						<p style="padding-left: 50px;">3. Trình độ đầu vào và hình thức đánh gía đầu vào : </p>
						<p style="padding-left: 100px;">- Trình độ đầu vào : </p>
						<p style="padding-left: 100px;">- Hình thức đánh giá đầu vào :</p>
						<p style="padding-left: 50px;">4. Quyết định thành lập lớp học : ${SoTayGiaoVien.tenQuyetDinh }</p>
						<p style="padding-left: 50px;">5. Tổ chức lớp học : </p>
						<p style="padding-left: 50px;">a) Sĩ số lớp học :</p>
						<p style="padding-left: 50px;">b) Bộ máy quản lý lớp :</p>
						<p style="padding-left: 100px;">- Giáo viên chủ nhiệm :</p>
						<p style="padding-left: 100px;">- Lớp trưởng : </p>
						<p style="padding-left: 100px;">- Lớp phó học tập/Lớp phó phong trào : </p>
						<p style="padding-left: 50px;">Lớp phó học tập : </p>
						<p style="padding-left: 50px;">Thủ quỹ : </p>
						<p style="padding-left: 100px;">- Tổ trưởng tổ 1 : </p>
						<p style="padding-left: 100px;">- Tổ trưởng tổ 2 : </p>
						<p style="padding-left: 100px;">- Tổ trưởng tổ 3 : </p>
						<p style="padding-left: 100px;">- Tổ trưởng tổ 4 : </p>
						<p style="padding-left: 50px;">c) Phương thức tổ chức đào tạo :  </p>
					</td>
				</tr>
			</table>
			<pd4ml:page_break pageCounter="1"></pd4ml:page_break>
			<table style="background-color: transparent;width: 700px"  align="center">
				<tr style="background-color: transparent;">
					<td style="text-align: center;">
						<strong>Kết quả học tập</strong>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td>
						<table style="background-color: transparent;width: 680px;margin-bottom: 20px;" border="1">
							<tr style="background-color: transparent;">
								<th rowspan="3" style="width: 50px;">Stt</th>
								<th rowspan="3" style="width: 180px;">Họ và tên học sinh</th>
								<th colspan="5" style="width: 300px;">Kiểm tra định kỳ</th>
								<th rowspan="2" colspan="2" style="width: 100px;">Kiểm tra kết thúc môn học/module</th>
								<th rowspan="3" style="width: 50px;">Điểm tổng kết</th>
							</tr>
							<tr style="background-color: transparent;">
								<th colspan="5">Hệ Số 2</th>
							</tr>
							<tr style="background-color: transparent;">
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
								<th>5</th>
								<th>Lần 1</th>
								<th>Lần 2</th>
							</tr>
							<c:set var="m" value="1"></c:set>
							<c:forEach var="HocSinh" items="${SoTayGiaoVien.listHocSinh}">
								<tr style="background-color: transparent;">
									<td style="text-align: center;">${m }</td>
									<td style="text-align: left;padding-left: 5px;">${HocSinh.hoThanhVien } ${HocSinh.tenLot } ${HocSinh.tenThanhVien }</td>
									<td style="text-align: center;">&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
									<td style="text-align: center;">${HocSinh.user1 }</td>
								</tr>
								<c:set var="m" value="${m+1}"></c:set>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
			
			<c:forEach var="listThang" items="${SoTayGiaoVien.listThang}">
				<c:set var="stt" value="1"></c:set>
				<pd4ml:page_break pageCounter="1"></pd4ml:page_break>
				<p align="center" style="font-weight: bold;">Tháng ${listThang.thang }-${listThang.nam }</p>
				<table align="center" border="1" style=";text-align: center; background-color: transparent;width: 680px;margin-bottom: 20px;font-size: 10px;" id="${listThang }">
					<tr style="background-color: transparent;">
						<th rowspan="2" style="width: 10px;">Stt</th>
						<th rowspan="2" style="width: 129px;">Họ và tên học sinh</th>
						<th colspan="31" style="width: 496px;">Ngày học</th>
						<th rowspan="2" style="width: 25px;">Tổng cộng</th>
					</tr>
					<tr>
						<c:forEach begin="1" end="31" step="1" var="i">
							<td style="width: 16px;">
								<c:choose>
									<c:when test="${i lt 10}">
										0${i }
									</c:when>
									<c:otherwise>
										${i }
									</c:otherwise>
								</c:choose>
							</td>
						</c:forEach>
					</tr>
					<c:forEach var="listHocSinh" items="${listThang.listHocSinh}">
						<c:set var="songaynghi" value="0"></c:set>
						<tr style="background-color: transparent;height: 30px;">
							<td>${stt }</td>
							<td>${listHocSinh.hoThanhVien} ${listHocSinh.tenLot } ${listHocSinh.tenThanhVien }</td>						
							<c:forEach begin="1" end="31" step="1" var="i">
								<c:choose>
									<c:when test="${i lt 10}">
										<c:set var="NgayHoc" value="0${i}-${listThang.thang }-${listThang.nam }"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="NgayHoc" value="${i}-${listThang.thang }-${listThang.nam }"></c:set>
									</c:otherwise>	
								</c:choose>
								
								<c:set var="count" value="1"></c:set>
								<c:set var="n" value="0"></c:set>
								<td style="text-align: center;">
									
									<c:forEach var="listDiemDanh" items="${listHocSinh.diemDanhList}">
											<c:if test="${listDiemDanh.ngayHoc eq NgayHoc}">
												<c:set var="n" value="1"></c:set>
												<c:choose>
													<c:when test="${listDiemDanh.tinhTrang eq '1' or listDiemDanh.tinhTrang eq '2' or listDiemDanh.tinhTrang eq '3'}">
														<c:if test="${count eq 1}">
														k
														<c:set var="songaynghi" value="${songaynghi+1}"></c:set>
														</c:if>
														<c:set var="count" value="${count+1}"></c:set>
													</c:when>
													<c:otherwise>&nbsp;</c:otherwise>
												</c:choose>
											</c:if>
									</c:forEach>
									<c:if test="${n eq 0}">&nbsp;</c:if>
								</td>
							</c:forEach>
							<td style="text-align: center;">${songaynghi }</td>
						</tr>
						<c:set var="stt" value="${stt + 1}"></c:set>
					</c:forEach>
				</table>
			</c:forEach>
			<pd4ml:page_break pageCounter="1"></pd4ml:page_break>
			<p align="center" style="font-weight: bold;">Tổng số giờ nghỉ của môn học/module</p>
			<table style="background-color: transparent;width: 680px;" border="1">
					<c:set var="stt" value="1"></c:set>
					<tr style="background-color: transparent;">
						<th rowspan="2" style="width: 20px;">Stt</th>
						<th rowspan="2" style="width: 200px;">Họ và tên học sinh</th>
						<th colspan="${fn:length(SoTayGiaoVien.listThang)}" style="width: 360px;">Tháng</th>
						<th rowspan="2" style="width: 100px;">Tổng cộng</th>
					</tr>
					<tr style="background-color: transparent;">
						<c:forEach var="thangModel" items="${SoTayGiaoVien.listThang}">
							<th>${thangModel.thang }</th>
						</c:forEach>
					</tr>
					<c:forEach var="listHocSinh" items="${SoTayGiaoVien.listHocSinh}">
						<c:set var="songaynghi" value="0"></c:set>
						<tr style="background-color: transparent;height: 30px;">
							<td style="text-align: center;">${stt }</td>
							<td>${listHocSinh.hoThanhVien} ${listHocSinh.tenLot } ${listHocSinh.tenThanhVien }</td>
							<c:forEach var="thangList" items="${listHocSinh.thangList}">
								<td style="text-align: center;">${thangList.tongNgayNghi }</td>
								<c:set var="songaynghi" value="${songaynghi+thangList.tongNgayNghi}"></c:set>
							</c:forEach>
							<td style="text-align: center;">${songaynghi }</td>
						</tr>
						<c:set var="stt" value="${stt + 1}"></c:set>
					</c:forEach>
				</table>
			<pd4ml:page_break pageCounter="1"></pd4ml:page_break>
			<table style="background-color: transparent;width: 680px;" align="center">
				<tr style="background-color: transparent;">
					<td>
						<p align="center" style="font-weight: bold;">Quản Lý Học Sinh Cá Biệt<br/>
						(Tên học sinh, đặc điểm, hình thức quản lý giáo dục, đánh giá phát triển)</p>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td>
						${SoTayGiaoVien.quanLyHocSinhCaBiet }
					</td>
				</tr>
			</table>
			<pd4ml:page_break pageCounter="1"></pd4ml:page_break>
			<table style="background-color: transparent;width: 680px;" align="center">
				<tr style="background-color: transparent;">
					<td>
						<p align="center" style="font-weight: bold;">Đánh Giá Qui Trình Giảng Dạy<br/>
						(đánh giá chung quá trình tổ chức đào tạo, quản lý lớp học và kết quả học tập của lớp học, kinh nghiệm giảng dạy môn học/mô-đun)</p>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td>
						${SoTayGiaoVien.danhGiaQuiTrinhGiangDay }
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