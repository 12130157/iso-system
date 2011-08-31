<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<c:set var="ChiTietThanhVien" value="${sessionScope.ChiTietThanhVien}"></c:set>
<c:set var="sig" value="-"></c:set>
<table width="700" height="700" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<th><br /> <p style="font-weight: bold;font-size: 18px;">Thông Tin Chi Tiết Của ${ChiTietThanhVien.hoTen}</p><br /></th>
		</tr>
	</table>
		<table width="650px" border="1" align="center" style="background-color: transparent; background-position: top;">
			<tr style="background-color: #696565;font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;">Thông Tin Chi Tiết</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px" style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Họ và Tên</td>
				<td style="text-align: left;padding-left: 10px;">${ChiTietThanhVien.hoTen}</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px" style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Địa Chỉ</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.soNha}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
						<c:otherwise>
							Số nhà ${ChiTietThanhVien.soNha}, đường ${ChiTietThanhVien.duong}, P.${ChiTietThanhVien.phuongXa}, Q.${ChiTietThanhVien.quanHuyen}, ${ChiTietThanhVien.thanhPho}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Ngày Sinh</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.ngaySinh}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
						<c:otherwise>
							${ChiTietThanhVien.ngaySinh}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Email</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.email}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
						<c:otherwise>
							${ChiTietThanhVien.email}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">CMND</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.chungMinhNhanDan}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
						<c:otherwise>
							${ChiTietThanhVien.chungMinhNhanDan}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Vai Trò</td>
				<td style="text-align: left;padding-left: 10px;">${ChiTietThanhVien.tenVaiTro}</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Bộ Phận</td>
				<td style="text-align: left;padding-left: 10px;">${ChiTietThanhVien.tenKhoa}</td>
			</tr>
			<tr style="background-color: #696565;font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;">Ngân Hàng</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Số Tài Khoản</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.soTaiKhoan}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.soTaiKhoan}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Ngân Hàng</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.nganHang}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.nganHang}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: #696565;font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;font-weight: bold;">Bằng Cấp</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2">
					<table border="1">
						<tr style="background-color: transparent;">
							<td style="width: 150px;text-align: center;font-weight: bold;">Loại Bằng</td>
							<td style="width: 400px;text-align: center;font-weight: bold;">Trường Cấp</td>
							<td style="width: 150px;text-align: center;font-weight: bold;">Loại Tốt Nghiệp</td>
						</tr>
						<c:forEach var="model" items="${ChiTietThanhVien.listBangCap}">
						<c:choose>
							<c:when test="${model.bangCapChinh eq 1}">
								<tr style="background-color: red;">
							</c:when>
							<c:otherwise>
								<tr style="background-color: transparent;">
							</c:otherwise>
						</c:choose>
							<td style="text-align: center;">
								<c:choose>
									<c:when test="${empty model.loaiBang}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.loaiBang}
									</c:otherwise>
								</c:choose>
							</td>
							<td style="text-align: left;padding-left: 5px;">
								<c:choose>
									<c:when test="${empty model.truongCap}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.truongCap}
									</c:otherwise>
								</c:choose>
							</td>
							<td style="text-align: center;">
								<c:choose>
									<c:when test="${empty model.loaiTotNghiep}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.loaiTotNghiep}
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr style="background-color: #696565;font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;font-weight: bold;">Thông Tin Khác</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Ngày Thử Việc</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.ngayThuViec}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.ngayThuViec}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Ngày Bắt Đầu Làm</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.ngayVaoLam}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${ChiTietThanhVien.ngayVaoLam}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Thâm Niên</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.listThamNien}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>
							${fn:length(ChiTietThanhVien.listThamNien) }
						<!-- 						
							<c:forEach var="listThamNien" items="${ChiTietThanhVien.listThamNien}">
								${listThamNien.namHoc} - ${listThamNien.tenChucVu }
							</c:forEach> 
						--> 
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td valign="top"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Khen Thưởng/ Kỷ Luật</td>
				<td>
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.listKhenThuongKyLuat}"><p style="font-style: italic;color: red;padding-left: 10px;" align="left">Chưa có</p></c:when>
						<c:otherwise>
							<table border="1" style="width: 530px;">
								<tr style="background-color: transparent;">
									<td style="width: 110px;font-weight: bold;text-align: center;">Năm</td>
									<td style="width: 210px;font-weight: bold;text-align: center;">Khen Thưởng</td>
									<td style="width: 210px;font-weight: bold;text-align: center;">Kỹ Luật</td>
								</tr>
								<c:set var="n" value="1"></c:set>
								<c:set var="khenthuong" value=""></c:set>
								<c:set var="kyluat" value=""></c:set>
								<c:set var="listKTKLlength" value="${fn:length(ChiTietThanhVien.listKhenThuongKyLuat)}"></c:set>
								<c:forEach var="listKhenThuongKyLuat" items="${ChiTietThanhVien.listKhenThuongKyLuat}">
									<c:set var="Nam1" value="${listKhenThuongKyLuat.namHoc}"></c:set>
									<c:if test="${n eq '1'}">
										<c:set var="Nam2" value="${listKhenThuongKyLuat.namHoc}"></c:set>
									</c:if>
									<c:choose>
										<c:when test="${Nam1 ne Nam2}">
											<tr style="background-color: transparent;">
												<td valign="top" style="text-align: center;width: 110px;">${Nam1}</td>
												<td valign="top" style="text-align: left;padding-left: 5px;width: 210px;">${khenthuong }</td>
												<td valign="top" style="text-align: left;padding-left: 5px;width: 210px;">${kyluat }</td>
											</tr>
											<c:set var="khenthuong" value=""></c:set>
											<c:set var="kyluat" value=""></c:set>
											<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '1'}">
												<c:set var="khenthuong" value="${listKhenThuongKyLuat.ghiChu}-<b>${listKhenThuongKyLuat.tenChucVu }</b><br/><br/>"></c:set>
											</c:if>
											<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '0'}">
												<c:set var="kyluat" value="${listKhenThuongKyLuat.ghiChu}-<b>${listKhenThuongKyLuat.tenChucVu }</b><br/><br/>"></c:set>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '1'}">
												<c:set var="khenthuong" value="${khenthuong}${listKhenThuongKyLuat.ghiChu}-<b>${listKhenThuongKyLuat.tenChucVu }</b><br/><br/>"></c:set>
											</c:if>
											<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '0'}">
												<c:set var="kyluat" value="${kyluat}${listKhenThuongKyLuat.ghiChu}-<b>${listKhenThuongKyLuat.tenChucVu }</b><br/><br/>"></c:set>
											</c:if>
										</c:otherwise>
									</c:choose>
									<c:if test="${n eq listKTKLlength}">
										<tr style="background-color: transparent;">
											<td valign="top" style="text-align: center;width: 110px;">${Nam1 }</td>
											<td valign="top" style="text-align: left;padding-left: 5px;width: 210px;">${khenthuong }</td>
											<td valign="top" style="text-align: left;padding-left: 5px;width: 210px;">${kyluat }</td>
										</tr>
									</c:if>
									
									<c:set var="Nam2" value="${listKhenThuongKyLuat.namHoc}"></c:set>
									<c:set var="n" value="${n+1}"></c:set>
								</c:forEach>
							</table> 
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Chủ Nhiệm</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.listLopHocChuNhiem}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
						<c:otherwise>				
							<c:forEach var="LopHocChuNhiem" items="${ChiTietThanhVien.listLopHocChuNhiem}">
								${LopHocChuNhiem.chuyenNganh } - ${LopHocChuNhiem.tenLopHoc} - ${LopHocChuNhiem.namHoc } <br/>
							</c:forEach> 
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td valign="top"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Thời Gian Giảng Dạy </td>
				<td>
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.listLopHocGiangDay}"><p style="font-style: italic;color: red;padding-left: 10px;" align="left">Chưa có</p></c:when>
						<c:otherwise>
								<table border="1"  style="width: 530px;">
									<tr style="background-color: transparent;">
										<td style="width: 120px;font-weight: bold;text-align: center;">Năm Học</td>
										<td style="width: 240px;font-weight: bold;text-align: center;">Tên Môn Học</td>
										<td style="width: 70px;font-weight: bold;text-align: center;">Tên Lớp</td>
										<td style="width: 70px;font-weight: bold;text-align: center;">Học Kì</td>
										<td style="width: 80px;font-weight: bold;text-align: center;">Số Tiết</td>
									</tr>
									<c:set var="total" value="0"></c:set>
									<c:forEach var="LopHocGiangDay" items="${ChiTietThanhVien.listLopHocGiangDay}">
										<c:set var="tongtiet" value="0"></c:set>
										<c:set var="tongtiet" value="${tongtiet+LopHocGiangDay.soGioLT}"></c:set>
										<c:set var="tongtiet" value="${tongtiet+LopHocGiangDay.soGioTH}"></c:set>
										<tr style="background-color: transparent;">
											<td style="text-align: center;">${LopHocGiangDay.namHoc }</td>
											<td style="text-align: left;padding-left: 5px;">${LopHocGiangDay.tenMonHoc }</td>
											<td style="text-align: center;">${LopHocGiangDay.kiHieuLop }</td>
											<td style="text-align: center;">${LopHocGiangDay.hocKi }</td>
											<td style="text-align: center;">${tongtiet }</td>
										</tr>
										<c:set var="total" value="${total+LopHocGiangDay.soGioLT}"></c:set>
										<c:set var="total" value="${total+LopHocGiangDay.soGioTH}"></c:set>
									</c:forEach>
									<tr style="background-color: transparent;">
										<td colspan="4" style="text-align: right;padding-right: 10px;font-weight: bold;">Tổng Số Tiết</td>
										<td style="text-align: center;">${total }</td>
									</tr>
								</table>
						</c:otherwise>
					</c:choose>
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