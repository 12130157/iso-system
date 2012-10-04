<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<pd4ml:transform
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
       titleTemplate="     BM03a-QT7.3/1               Ngày hiệu lực: 25/7/2012"
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Thêm Chương Trình Đào Tạo</title>
</head>
<div align="center">
<div class = "div_body">
<c:set var="CTDT" value='<%=ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTaoByID(request.getParameter("maID")) %>'></c:set>
<c:set var="soLuongMonHoc" value="0"></c:set>
<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList1}"></c:set>
	<c:forEach var = "ChiTiet" items="${ChiTietList}">
		<c:set var = "TongSoLyThuyet_PhanI" value = "${TongSoLyThuyet_PhanI + ChiTiet.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanI" value = "${TongSoThucHanh_PhanI + ChiTiet.thucHanh}"></c:set>
		<c:set var = "TongSoTichHop_PhanI" value = "${TongSoTichHop_PhanI + ChiTiet.user1}"></c:set>
		<c:set var="soLuongMonHoc" value="${soLuongMonHoc + 1}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanI" value = "${TongSoLyThuyet_PhanI + TongSoThucHanh_PhanI + TongSoTichHop_PhanI}"></c:set>
	<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList2}"></c:set>
	<c:forEach var = "ChiTiet" items="${ChiTietList}">
		
		<c:set var = "TongSoLyThuyet_PhanII" value = "${TongSoLyThuyet_PhanII + ChiTiet.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanII" value = "${TongSoThucHanh_PhanII + ChiTiet.thucHanh}"></c:set>
		<c:set var = "TongSoTichHop_PhanII" value = "${TongSoTichHop_PhanII + ChiTiet.user1}"></c:set>
		<c:set var="soLuongMonHoc" value="${soLuongMonHoc + 1}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanII" value = "${TongSoLyThuyet_PhanII + TongSoThucHanh_PhanII + TongSoTichHop_PhanII}"></c:set>
	<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList3}"></c:set>
	<c:forEach var = "ChiTiet" items="${ChiTietList}">
		
		<c:set var = "TongSoLyThuyet_PhanIII" value = "${TongSoLyThuyet_PhanIII + ChiTiet.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanIII" value = "${TongSoThucHanh_PhanIII + ChiTiet.thucHanh}"></c:set>
		<c:set var = "TongSoTichHop_PhanIII" value = "${TongSoTichHop_PhanIII + ChiTiet.user1}"></c:set>
		<c:set var="soLuongMonHoc" value="${soLuongMonHoc + 1}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanIII" value = "${TongSoLyThuyet_PhanIII + TongSoThucHanh_PhanIII + TongSoTichHop_PhanIII}"></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-size: 15"><font style="font-weight: bold;">TRƯỜNG TCN KTCN HÙNG VƯƠNG</font><br/>Khoa/TT: ${CTDT.tenKhoa}</p></td>
			<td><p style="font-size: 15; font-weight: bold;">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM <br/>
											 Độc lập - Tự do - Hạnh phúc<br/>--o0o--</p></td>					 
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 18px">CHƯƠNG TRÌNH ĐÀO TẠO
													<br/> HỆ ${sf:upperString(CTDT.tenTrinhDo)}</p><br /></th>
		</tr>
		<tr align="right">
			<td colspan="2"><font style="font-size: 15px; font-weight: bold">${CTDT.tenChuongTrinhDaoTao }</font></td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2">
				<br/><p style="font-weight: bold;">Tên Nghề : ${sf:upperString(CTDT.tenNghe)}</p>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2">
				<p style="font-weight: bold;">Mã Nghề : ${sf:upperString(CTDT.kiHieu)}</p>
			</td>	
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2">	
				<p style="font-weight: bold">Trình độ đào tạo : ${CTDT.tenTrinhDo}</p>
			</td>	
		</tr>
	</table>	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-weight: bold">Đối tượng tuyển sinh:</p>${sf:appendPTag(CTDT.doiTuong1)}
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p><font style="font-weight: bold">Số lượng môn học, mô đun đào tạo :</font> ${soLuongMonHoc}</p>
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p><font style="font-weight: bold;">Bằng cấp sau khi tốt nghiệp :</font> ${CTDT.bangCap}</p>
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">I./ MỤC TIÊU ĐÀO TẠO :</p></div>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	1.Kiến thức nghề:</p>${sf:appendPTag(CTDT.mucTieu1)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	2.Kỹ năng nghề:</p>${sf:appendPTag(CTDT.mucTieu2)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	3.Chính trị, đạo đức, thể chức quốc phòng:</p>${sf:appendPTag(CTDT.mucTieu3)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	4.Kỹ năng khác:</p>${sf:appendPTag(CTDT.mucTieu5)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	5.Cơ hội việc làm:</p>${sf:appendPTag(CTDT.mucTieu4)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">II./PHƯƠNG PHÁP GIẢNG DẠY: :</p></div>
			</td>
		</tr>	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">II.1.Phương pháp giảng dạy:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<u style="font-weight: bold">	1/Lý thuyết:</u>${sf:appendPTag(CTDT.phuongPhap1)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<u style="font-weight: bold">	2/Thực hành:</u>${sf:appendPTag(CTDT.phuongPhap2)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">II.2.Phương pháp học tập:</p>${sf:appendPTag(CTDT.phuongPhap3)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">III./THỜI GIAN CỦA KHÓA HỌC VÀ THỜI GIAN THỰC HỌC TỐI THIỂU:</p></div>
			</td>
		</tr>	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">III.1 Thời gian của khóa học và thời gian thực học tối thiểu:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p>&nbsp;&nbsp;&nbsp;- Thời gian đào tạo : ${CTDT.thoiGian1} năm</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p>&nbsp;&nbsp;&nbsp;- Thời gian học tập : ${CTDT.thoiGian2} tuần</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p>&nbsp;&nbsp;&nbsp;- Thời gian thực học : ${CTDT.thoiGian4} giờ </p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p>&nbsp;&nbsp;&nbsp;- Thời gian ôn và thi học kỳ : ${CTDT.thoiGian5} tuần (${CTDT.thoiGian6} giờ) </p>
					<p>&nbsp;&nbsp;&nbsp;- Thời gian ôn và thi tốt nghiệp : ${CTDT.thoiGian7} tuần (${CTDT.thoiGian8} giờ) </p>
		</tr>
	</table>	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">III.2.Phân bố thời gian thực học tối thiểu:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p>&nbsp;&nbsp;&nbsp;- Thời gian học các môn học chung bắt buộc : ${CTDT.phanBo1} giờ </p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p>&nbsp;&nbsp;&nbsp;- Thời gian học các môn học, modun đào tạo nghề : ${CTDT.phanBo2} giờ </p>
				</td>
		</tr>
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p>&nbsp;&nbsp;&nbsp;- Thời gian học lý thuyết : ${CTDT.phanBo3} giờ, thời gian học thực hành : ${CTDT.phanBo4} giờ, thời gian học tích hợp : ${TongSoTichHop_PhanI + TongSoTichHop_PhanII + TongSoTichHop_PhanIII} giờ</p>
				</td>
		</tr>
	</table>
	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">IV./PHÂN PHỐI CHƯƠNG TRÌNH CÁC MÔN HỌC:</p></div>
			</td>
		</tr>
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">IV.1 Danh mục môn học mô đun đào tạo nghề bắt buộc</p>
				</td>
		</tr>
	</table>
	<%int count = 1; %>
	<br /><div style="">
	<table width = "650" align="center" style="background-color: transparent; background-position: top;" border = "1">
	<tr style="background-color: transparent; font-size: 16px;">
		<td rowspan = "3">Mã số MH-MĐ</td>
		<td rowspan = "3">Tên môn học, module</td>
		<td colspan = "2">Thời gian  đào tạo</td>
		<td colspan = "4">Thời gian của môn học, module (giờ)</td>
	</tr> 
	<tr style="background-color: transparent; font-size: 16px;">
		<td rowspan="2">Năm học</td>
		<td rowspan="2">Học kì</td>
		<td rowspan="2">Tổng số</td>
		<td colspan="3">Trong đó</td>
	</tr>
	<tr style="background-color: transparent; font-size: 16px;">
		<td>Lý thuyết</td>
		<td>Thực hành</td>
		<td>Tích Hợp</td>
	</tr>
	<tr style="background-color: transparent; background-position: center; background-color: aqua; font-weight: bold; font-size: 16px">
		<td><p></td>
		<td>CÁC MÔN HỌC CHUNG</td>
		<td><p></td>
		<td><p></td>
		<td>${TongSo_PhanI}</td>
		<td>${TongSoLyThuyet_PhanI}</td>
		<td>${TongSoThucHanh_PhanI}</td>
		<td>${TongSoTichHop_PhanI}</td>
	</tr>
	<c:set var="ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList1}"></c:set>
		<c:forEach var = "iterator" items="${ChiTietList}">
			
			<tr align="left" style="background-color: transparent; background-position: center; font-size: 16px;">
				<td>MH<%=count %></td>
				<td>${iterator.tenMonHoc}</td>
				<td>${iterator.namHoc}</td>
				<td>${iterator.hocKi}</td>
				<td>${iterator.lyThuyet + iterator.thucHanh}</td>
				<td>${iterator.lyThuyet}</td>
				<td>${iterator.thucHanh}</td>
				<td>${iterator.user1}</td>
			</tr>
			<%count++; %>
		</c:forEach>
		<tr style="background-color: transparent; background-color: aqua; font-weight: bold; font-size: 16px">
			<td><p></td>
			<td>CÁC MÔN HỌC CƠ SỞ</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanII}</td>
			<td>${TongSoLyThuyet_PhanII}</td>
			<td>${TongSoThucHanh_PhanII}</td>
			<td>${TongSoTichHop_PhanII}</td>
		</tr>
		<c:set var="ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList2}"></c:set>
		<c:forEach var = "iterator" items="${ChiTietList}">			
			<tr align="left" style="background-color: transparent; background-position: center; font-size: 16px;">
				<td>MH<%=count %></td>
				<td>${iterator.tenMonHoc}</td>
				<td>${iterator.namHoc}</td>
				<td>${iterator.hocKi}</td>
				<td>${iterator.lyThuyet + iterator.thucHanh}</td>
				<td>${iterator.lyThuyet}</td>
				<td>${iterator.thucHanh}</td>
				<td>${iterator.user1}</td>
			</tr>
			<%count++; %>
		</c:forEach>	
		<tr style="background-color: transparent; background-color: aqua; font-weight: bold; font-size: 16px">
				<td><p></td>
			<td>CÁC MÔN HỌC CHUYÊN NGÀNH</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanIII}</td>
			<td>${TongSoLyThuyet_PhanIII}</td>
			<td>${TongSoThucHanh_PhanIII}</td>
			<td>${TongSoTichHop_PhanIII}</td>
		</tr>
		<c:set var="ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList3}"></c:set>
		<c:forEach var = "iterator" items="${ChiTietList}">		
			<tr align="left" style="background-color: transparent; background-position: center; font-size: 16px;">
				<td>MH<%=count %></td>
				<td>
					${iterator.tenMonHoc}
					<c:if test = "${CTDT.maNghe eq 16}">
						<c:choose>
							<c:when test="${iterator.maMonHoc eq 44}">
								(Tài liệu thiết kế)
							</c:when>
							<c:when test="${iterator.maMonHoc eq 45}">
								(Web php & MySQL)
							</c:when>
							<c:when test="${iterator.maMonHoc eq 46}">
								(Java SQL Server)
							</c:when>
						</c:choose>	
					</c:if>
				</td>
				<td>${iterator.namHoc}</td>
				<td>${iterator.hocKi}</td>
				<td>${iterator.lyThuyet + iterator.thucHanh}</td>
				<td>${iterator.lyThuyet}</td>
				<td>${iterator.thucHanh}</td>
				<td>${iterator.user1}</td>
			</tr>
			<%count++; %>
		</c:forEach>
		<tr style="background-color: transparent; background-color: aqua; font-weight: bold; font-size: 16px"> 
		<td><p></td>
		<td>TỔNG CỘNG</td>
		<td><p></td>
		<td><p></td>
		<td>${TongSo_PhanI + TongSo_PhanII + TongSo_PhanIII}</td>
		<td>${TongSoLyThuyet_PhanI + TongSoLyThuyet_PhanII + TongSoLyThuyet_PhanIII}</td>
		<td>${TongSoThucHanh_PhanI + TongSoThucHanh_PhanII + TongSoThucHanh_PhanIII}</td>
		<td>${TongSoTichHop_PhanI + TongSoTichHop_PhanII + TongSoTichHop_PhanIII}</td>
	</tr>	
	</table>
	</div><br />
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">IV.2 Đề cương chi tiết chương trình môn học mô-đun đào tạo nghề bắt buộc (đính kèm theo BM04-QT7.3/1).</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">V./CÔNG TÁC THI, KIỂM TRA :</p></div>
			</td>
		</tr>	
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<u style="font-weight: bold">1/Thi học kì, thi hết môn:</u>${sf:appendPTag(CTDT.thiHocKi)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 16px;">
				<td colspan = "2">
					<u style="font-weight: bold">2/Thi tốt nghiệp:</u>${sf:appendPTag(CTDT.thiTotNghiep)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">VI.THỰC TẬP SẢN XUẤT :</p>${sf:appendPTag(CTDT.thucTap)}</div>
			</td>
		</tr>	
	</table>
	<!-- 
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 16px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">VII.NHỮNG Ý KIẾN ĐỀ XUẤT :</p> ${sf:appendPTag(CTDT.yKienDeXuat)}</div>
			</td>
		</tr>	
	</table> -->
	<table width = "650" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
			<c:set var="sig" value="-"></c:set>
			<td>Ngày &nbsp;&nbsp;&nbsp; tháng &nbsp;&nbsp;&nbsp; năm &nbsp;&nbsp;&nbsp;</td>
			<td>Quận 5, ngày &nbsp;&nbsp;&nbsp; tháng &nbsp;&nbsp;&nbsp; năm &nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
			<td><p style="font-weight: bold;">HIỆU TRƯỞNG</p></td>
			<td><p style="font-weight: bold;">TRƯỞNG KHOA </p></td>
		</tr>
		<!--<tr>
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
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 16px;">
			<td><p>${CTDT.tenNguoiTao}</p></td>
			<td><p>${CTDT.tenNguoiDuyet}</p></td>
		</tr>
	--></table>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	</td></tr>
</table>
</div>
</div>
</html>
</pd4ml:transform>