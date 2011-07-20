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
<c:set var="ChiTietThanhVien" value="${sessionScope.ChiTietThanhVien}"></c:set>
<c:set var="sig" value="-"></c:set>
<table width="700" height="700" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 14px;">
			<th><br /> <p style="font-weight: bold;font-size: 18px;">Thông Tin Chi Tiết Của ${ChiTietThanhVien.hoThanhVien} ${ChiTietThanhVien.tenLot} ${ChiTietThanhVien.tenThanhVien}</p><br /></th>
		</tr>
	</table>
		<table width="650px" border="1" align="center" style="background-color: transparent; background-position: top;">
			<tr style="font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;">Thông Tin Chi Tiết</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px" style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Họ và Tên</td>
				<td style="text-align: left;padding-left: 10px;">${ChiTietThanhVien.hoThanhVien} ${ChiTietThanhVien.tenLot} ${ChiTietThanhVien.tenThanhVien}</td>
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
			<tr style="font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;">Ngân Hàng</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Số Tài Khoản</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.soTaiKhoan}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
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
						<c:when test="${empty ChiTietThanhVien.nganHang}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
						<c:otherwise>
							${ChiTietThanhVien.nganHang}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;font-weight: bold;">Bằng Cấp</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Loại Bằng</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.loaiBang}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
						<c:otherwise>
							${ChiTietThanhVien.loaiBang}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Trường Cấp</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.truongCap}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
						<c:otherwise>
							${ChiTietThanhVien.truongCap}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Loại Tốt Nghiệp</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.loaiTotNghiep}"><font style="font-style: italic;color: red;">Chưa có</font></c:when>
						<c:otherwise>
							${ChiTietThanhVien.loaiTotNghiep}
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