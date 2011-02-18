<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%><pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="30,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"   
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM05-QT7.3/1                Ngày hiệu lực: 15/9/2009"
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif"   
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
<title>Đề Cương Môn Học</title> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<title>Insert title here</title>

</head>
<div align="center">
<div class = "div_body">
<c:set var="DeCuongMonHoc" value="${sessionScope.DeCuongMonHoc}"></c:set>
<c:set var="DeCuongMonHocSoSanh" value='<%=DeCuongMonHocDAO.getDeCuongMonHocByID(request.getParameter("SoSanhDeCuong")) %>'></c:set>
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">
	
	<tr><td>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">Trường TCNKTCN Hùng Vương<br/>
			Khoa ${DeCuongMonHoc.tenKhoa}
			</p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 20px">SO SÁNH ĐỀ CƯƠNG CHI TIẾT CHƯƠNG TRÌNH MÔN HỌC</p><br /></th>
		</tr>
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					Tên môn học:${DeCuongMonHoc.tenMonHoc}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					Thời gian môn học:${DeCuongMonHoc.lyThuyet + DeCuongMonHoc.thucHanh + DeCuongMonHoc.kiemTra}
					<p style="background-color: yellow;">Thời gian môn học:${DeCuongMonHocSoSanh.lyThuyet + DeCuongMonHocSoSanh.thucHanh + DeCuongMonHocSoSanh.kiemTra}</p>
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					Lý thuyết:${DeCuongMonHoc.lyThuyet}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Thực hành:${DeCuongMonHoc.thucHanh}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Kiểm tra:${DeCuongMonHoc.kiemTra}
					<p style="background-color: yellow;">
						Lý thuyết:${DeCuongMonHocSoSanh.lyThuyet}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						Thực hành:${DeCuongMonHocSoSanh.thucHanh}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						Kiểm tra:${DeCuongMonHocSoSanh.kiemTra}
					</p>
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>Vị trí môn học:</u> <p>${sf:appendPTag(DeCuongMonHoc.viTriMonHoc)}</p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.viTriMonHoc)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					Tính chất môn học:${DeCuongMonHoc.tinhChatMonHoc}
					<p style="background-color: yellow;">Tính chất môn học:${DeCuongMonHocSoSanh.tinhChatMonHoc}</p> 
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<p style="font-weight: bold">I./ MỤC TIÊU ĐÀO TẠO MÔN HỌC :</p></div>
			</td>
		</tr>
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>Kiến thức chuyên môn:</u> <p>${sf:appendPTag(DeCuongMonHoc.mucTieu1)}</p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.mucTieu1)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>Kỹ năng nghề:</u> <p> ${sf:appendPTag(DeCuongMonHoc.mucTieu2)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.mucTieu2)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>Thái độ lao động:</u> <p> ${sf:appendPTag(DeCuongMonHoc.mucTieu3)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.mucTieu3)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>Các kỹ năng cần thiết khác: </u> <p> ${sf:appendPTag(DeCuongMonHoc.mucTieu4)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.mucTieu4)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<p style="font-weight: bold">II./ TỔNG QUÁT VỀ CHƯƠNG TRÌNH :</p></div>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<u>Điều kiện thực hiện môn học</u></div>
			</td>
		</tr>
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>- Máy móc, trang thiết bị, công cụ :</u> <p> ${sf:appendPTag(DeCuongMonHoc.dieuKien1)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.dieuKien1)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>- Nguyên vật liệu thực hành :</u> <p> ${sf:appendPTag(DeCuongMonHoc.dieuKien2)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.dieuKien2)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>- Phương tiện giảng dạy :</u> <p> ${sf:appendPTag(DeCuongMonHoc.dieuKien3)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.dieuKien3)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>- Phiếu hướng dẫn thực hiện (môn thực hành) :</u> <p> ${sf:appendPTag(DeCuongMonHoc.dieuKien4)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.dieuKien4)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>Phương pháp và nội dung đánh giá :</u>
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>- Lý thuyết :</u> <p> ${sf:appendPTag(DeCuongMonHoc.phuongPhap1)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.phuongPhap1)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>- Thực hành :</u> <p> ${sf:appendPTag(DeCuongMonHoc.phuongPhap2)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.phuongPhap2)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>- Nội dung :</u> <p> ${sf:appendPTag(DeCuongMonHoc.phuongPhap3)} </p>
					${sf:appendPTagWithColor(DeCuongMonHocSoSanh.phuongPhap3)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<p style="font-weight: bold">III./ PHÂN PHỐI CHƯƠNG TRÌNH MÔN HỌC:</p></div>
			</td>
		</tr>
	</table>
	<table border = "1" width = "900" align="center" style="background-color: transparent; background-position: center;" > 
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td rowspan = "2">TT</td>
					<td rowspan = "2">Nội dung<br />(chương trình, bài học)</td>
					<td colspan = "7">Số tiết</td>
				</tr>
				<tr style="background-color: transparent;">
					<td>Lý thuyết</td>
					<td>thực hành</td>
					<td>Tích hợp</td>
					<td>Thực nghiệm</td>
					<td>Bài tập</td>
					<td>Kiểm tra</td>
					<td>Cộng</td>
				</tr>
		<c:set var="size1" value="0"></c:set>
		<c:set var="size2" value="0"></c:set>
		<c:forEach var="NoiDungDCMH" items="${DeCuongMonHoc.noiDungDCMHModelsList}">
			<c:set var = "dong1" value="${NoiDungDCMH.soBuoi}"></c:set><!-- dong1 : tong so buoi cua decuongmonhoc -->
			<c:if test="${NoiDungDCMH.soBuoi eq '1'}">
				<c:set var = "size1" value = "${NoiDungDCMH.soThuTu}"></c:set><!-- size1 : tong so dong trong 1 buoi cua decuonmonhoc-->
			</c:if>
		</c:forEach>
		<c:forEach var="NoiDungDCMHSoSanh" items="${DeCuongMonHocSoSanh.noiDungDCMHModelsList}">
			<c:set var = "dong2" value="${NoiDungDCMHSoSanh.soBuoi}"></c:set><!-- dong2 : tong so buoi cua decuongmonhoc so sanh -->
			<c:if test="${NoiDungDCMHSoSanh.soBuoi eq '1'}">
				<c:set var = "size2" value="${NoiDungDCMHSoSanh.soThuTu}"></c:set><!-- size1 : tong so dong trong 1 buoi cua decuonmonhoc so sanh-->
			</c:if>
		</c:forEach>
		<c:choose>
			<c:when test="${dong1 ge dong2}">
				<c:set var="end" value = "${dong1}"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="end" value = "${dong2}"></c:set>
			</c:otherwise>
		</c:choose>			
			<%int count = 1, a = 0, b = 0;%>
			<!-- a : dem so dong de cuong mon hoc
				 b : dem so dong de cuong mon hoc so sanh
				 count : so buoi
			-->	
			<c:set var="ThoiGianMonHoc" value="${DeCuongMonHoc.lyThuyet + DeCuongMonHoc.thucHanh + DeCuongMonHoc.kiemTra}"></c:set>
			<c:set var="ThucHanh" value="0"></c:set>
			<c:set var="LyThuyet" value="0"></c:set>
			<c:set var="KiemTra" value="0"></c:set>
			<c:set var="TichHop" value="0"></c:set>
			<c:set var ="tenChuong" value = ""></c:set>
			<c:set var = "count1" value = "0"></c:set>
			<c:set var = "count2" value = "0"></c:set>
			<c:forEach var = "i" begin = "1" end = "${end}">
				<c:if test="${i le dong1}">
					<c:forEach var = "j" begin = "1" end="${size1}">
						<c:if test="${DeCuongMonHoc.noiDungDCMHModelsList[count1 + j - 1].soThuTu eq '1'}">
							<c:set var="tenChuong" value="${DeCuongMonHoc.noiDungDCMHModelsList[count1 + j - 1].tenChuong}"></c:set>
						</c:if>
						<c:choose>
							<c:when test="${DeCuongMonHoc.noiDungDCMHModelsList[count1 + j - 1].coHieu eq '0'}">
								<c:set var = "LyThuyet" value = "${LyThuyet + DeCuongMonHoc.noiDungDCMHModelsList[count1].soTiet}"></c:set>
							</c:when>
							<c:when test="${DeCuongMonHoc.noiDungDCMHModelsList[count1 + j - 1].coHieu eq '1'}">
								<c:set var = "ThucHanh" value = "${ThucHanh + DeCuongMonHoc.noiDungDCMHModelsList[count1].soTiet}"></c:set>
							</c:when>
							<c:when test="${DeCuongMonHoc.noiDungDCMHModelsList[count1 + j - 1].coHieu eq '4'}">
								<c:set var = "KiemTra" value = "${KiemTra + DeCuongMonHoc.noiDungDCMHModelsList[count1].soTiet}"></c:set>
							</c:when>
							<c:when test="${DeCuongMonHoc.noiDungDCMHModelsList[count1 + j - 1].coHieu eq '5'}">
								<c:set var = "TichHop" value = "${TichHop + DeCuongMonHoc.noiDungDCMHModelsList[count1].soTiet}"></c:set>
							</c:when>
						</c:choose>	
							<c:if test="${j eq size1}">
								<tr style="background-color: transparent;" align="center">
									<td><%=count %></td>
									<td>${sf:appendBrTag(tenChuong)}</td>	
								<c:choose>		
									<c:when test="${LyThuyet gt '0'}">	
										<td>${LyThuyet}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>	
								</c:choose>
								<c:choose>		
									<c:when test="${ThucHanh gt '0'}">	
										<td>${ThucHanh}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								<c:choose>		
									<c:when test="${TichHop gt '0'}">	
										<td>${TichHop}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
									<td>-</td>
									<td>-</td>
								<c:choose>		
									<c:when test="${KiemTra gt '0'}">	
										<td>${KiemTra}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								<td>${LyThuyet + ThucHanh + TichHop + KiemTra}</td>
							</tr>
						</c:if>
						<%=a++ %>
					</c:forEach>
					<c:set var = "count1" value = "<%=a %>"></c:set>
				</c:if>	
					<c:set var="ThucHanh" value="0"></c:set>
					<c:set var="LyThuyet" value="0"></c:set>
					<c:set var="KiemTra" value="0"></c:set>
					<c:set var="TichHop" value="0"></c:set>
					<c:set var ="tenChuong" value = ""></c:set>
				<c:if test="${i le dong2}">	
					<c:forEach var = "j" begin = "1" end="${size2}">
						<c:if test="${DeCuongMonHocSoSanh.noiDungDCMHModelsList[count2 + j - 1].soThuTu eq '1'}">
							<c:set var="tenChuong" value="${DeCuongMonHocSoSanh.noiDungDCMHModelsList[count2 + j - 1].tenChuong}"></c:set>
						</c:if>
						<c:choose>
							<c:when test="${DeCuongMonHocSoSanh.noiDungDCMHModelsList[count2 + j - 1].coHieu eq '0'}">
								<c:set var = "LyThuyet" value = "${LyThuyet + DeCuongMonHocSoSanh.noiDungDCMHModelsList[count1].soTiet}"></c:set>
							</c:when>
							<c:when test="${DeCuongMonHocSoSanh.noiDungDCMHModelsList[count2 + j - 1].coHieu eq '1'}">
								<c:set var = "ThucHanh" value = "${ThucHanh + DeCuongMonHocSoSanh.noiDungDCMHModelsList[count1].soTiet}"></c:set>
							</c:when>
							<c:when test="${DeCuongMonHocSoSanh.noiDungDCMHModelsList[count2 + j - 1].coHieu eq '4'}">
								<c:set var = "KiemTra" value = "${KiemTra + DeCuongMonHocSoSanh.noiDungDCMHModelsList[count1].soTiet}"></c:set>
							</c:when>
							<c:when test="${DeCuongMonHocSoSanh.noiDungDCMHModelsList[count2 + j - 1].coHieu eq '5'}">
								<c:set var = "TichHop" value = "${TichHop + DeCuongMonHocSoSanh.noiDungDCMHModelsList[count1].soTiet}"></c:set>
							</c:when>
						</c:choose>	
							<c:if test="${j eq size2}">
								<tr style="background-color: transparent; background-color: yellow;" align="center" >
									<td><%=count %></td>
									<td>${sf:appendBrTag(tenChuong)}</td>	
								<c:choose>		
									<c:when test="${LyThuyet gt '0'}">	
										<td>${LyThuyet}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>	
								</c:choose>
								<c:choose>		
									<c:when test="${ThucHanh gt '0'}">	
										<td>${ThucHanh}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								<c:choose>		
									<c:when test="${TichHop gt '0'}">	
										<td>${TichHop}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
									<td>-</td>
									<td>-</td>
								<c:choose>		
									<c:when test="${KiemTra gt '0'}">	
										<td>${KiemTra}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								<td>${LyThuyet + ThucHanh + TichHop + KiemTra}</td>
							</tr>
						</c:if>
						<%=b++ %>
						
					</c:forEach>
					<c:set var = "count2" value = "<%=b %>"></c:set>
				</c:if>	
				<%count++; %>
					<c:set var="ThucHanh" value="0"></c:set>
					<c:set var="LyThuyet" value="0"></c:set>
					<c:set var="KiemTra" value="0"></c:set>
					<c:set var="TichHop" value="0"></c:set>
					<c:set var ="tenChuong" value = ""></c:set>
			</c:forEach>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td>&nbsp;</td>
					<td widtd="160">TỔNG CỘNG</td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHoc.kieuBienSoan ne '2'}">
								${DeCuongMonHoc.lyThuyet}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose></td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHoc.kieuBienSoan ne '2'}">
							${DeCuongMonHoc.thucHanh}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHoc.kieuBienSoan eq '2'}">
								${DeCuongMonHoc.lyThuyet + DeCuongMonHoc.thucHanh}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose>	
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>${DeCuongMonHoc.kiemTra}</td>
					<td>${DeCuongMonHoc.lyThuyet + DeCuongMonHoc.thucHanh + DeCuongMonHoc.kiemTra}</td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center; background-color: yellow;">
					<td>&nbsp;</td>
					<td widtd="160">TỔNG CỘNG</td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHocSoSanh.kieuBienSoan ne '2'}">
								${DeCuongMonHocSoSanh.lyThuyet}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose></td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHocSoSanh.kieuBienSoan ne '2'}">
								${DeCuongMonHocSoSanh.thucHanh}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${DeCuongMonHocSoSanh.kieuBienSoan eq '2'}">
								${DeCuongMonHocSoSanh.lyThuyet + DeCuongMonHocSoSanh.thucHanh}
							</c:when>
							<c:otherwise>
								<p></p>
							</c:otherwise>
						</c:choose>	
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>${DeCuongMonHocSoSanh.kiemTra}</td>
					<td>${DeCuongMonHocSoSanh.lyThuyet + DeCuongMonHocSoSanh.thucHanh + DeCuongMonHocSoSanh.kiemTra}</td>
				</tr>
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<c:set var="sig" value="-"></c:set>
			<td></td>
			<td></td>
			<td>Quận 5, ngày ${sf:getElement(DeCuongMonHoc.ngayTao,0,sig)} tháng ${sf:getElement(DeCuongMonHoc.ngayTao,1,sig)} năm ${sf:getElement(DeCuongMonHoc.ngayTao,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">Hiệu Trưởng </p></td>
			<td><p style="font-weight: bold">Trưởng Khoa </p></td>
			<td><p style="font-weight: bold">Giáo viên biên soạn</p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>		
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td></td>
			<td><p style="font-weight: bold">${DeCuongMonHoc.tenNguoiDuyet}</p></td>
			<td><p style="font-weight: bold">${DeCuongMonHoc.tenNguoiTao}</p></td>
		</tr>
	</table>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>