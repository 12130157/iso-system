<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<pd4ml:transform
	screenWidth="700"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="10,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"   
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM05-QT7.3/1                     Ngày hiệu lực: 15/9/2009"
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
       fontSize="14">       
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
<c:set var="CTDT" value="${sessionScope.ChuongTrinhDaoTao}"></c:set>
<c:set var = "CTDTSoSanh" value='<%=ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTaoByID(request.getParameter("SoSanhChuongTrinh")) %>'></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">ỦY BAN NHÂN DÂN QUẬN 5<br/>TRƯỜNG TCN KTCN HÙNG VƯƠNG</p></td>
			<td><p style="font-weight: bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
											 Độc lập - Tự do - Hạnh phúc<br/>--o0o--</p></td>					 
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 20px">SO SÁNH CHƯƠNG TRÌNH ĐÀO TẠO
													<br/> HỆ ${sf:upperString(CTDT.tenTrinhDo)}</p><br /></th>
		</tr>
		<tr align="right">
			<td colspan="2">${CTDT.tenChuongTrinhDaoTao }</td>
		</tr>
		<tr align="right">
			<td colspan="2"><p style="background-color: yellow;">${CTDT.tenChuongTrinhDaoTao }</p></td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2">
				<br/><p style="font-weight: bold">Tên Nghề : ${sf:upperString(CTDT.tenNghe)}</p>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
			<td colspan = "2">
				<p style="font-weight: bold">Mã Nghề : ${sf:upperString(CTDT.kiHieu)}</p>
			</td>	
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
			<td colspan = "2">	
				<p style="font-weight: bold">Trình độ đào tạo : ${CTDT.tenTrinhDo}</p>
			</td>	
		</tr>
	</table>	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-weight: bold">Đối tượng tuyển sinh:</p>${sf:appendPTag(CTDT.doiTuong1)} ${sf:appendPTagWithColor(CTDTSoSanh.doiTuong1)}
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p><font style="font-weight: bold;">Số lượng môn học, mô đun đào tạo :</font> ${CTDT.soLuongMonHoc}</p>
					<p style="background-color: yellow;">${CTDTSoSanh.soLuongMonHoc}</p>
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p><font style="font-weight: bold;">Bằng cấp sau khi tốt nghiệp :</font> ${CTDT.bangCap}</p>
					<p style="background-color: yellow;">${CTDTSoSanh.bangCap}</p>
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">I./ MỤC TIÊU ĐÀO TẠO :</p></div>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-style: italic">1.Kiến thức nghề:</p>${sf:appendPTag(CTDT.mucTieu1)} ${sf:appendPTagWithColor(CTDTSoSanh.mucTieu1)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-style: italic">2.Kỹ năng nghề:</p>${sf:appendPTag(CTDT.mucTieu2)} ${sf:appendPTagWithColor(CTDTSoSanh.mucTieu2)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-style: italic">3.Chính trị, đạo đức:</p>${sf:appendPTag(CTDT.mucTieu3)} ${sf:appendPTagWithColor(CTDTSoSanh.mucTieu3)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-style: italic">4.Kỹ năng khác:</p>${sf:appendPTag(CTDT.mucTieu4)} ${sf:appendPTagWithColor(CTDTSoSanh.mucTieu4)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-style: italic">5.Cơ hội việc làm:</p>${sf:appendPTag(CTDT.mucTieu5)} ${sf:appendPTagWithColor(CTDTSoSanh.mucTieu5)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">II./PHƯƠNG PHÁP GIẢNG DẠY: :</p></div>
			</td>
		</tr>	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-style: italic">II.1.Phương pháp giảng dạy:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>1/Lý thuyết:</u>${sf:appendPTag(CTDT.phuongPhap1)} ${sf:appendPTagWithColor(CTDTSoSanh.phuongPhap1)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>2/Thực hành:</u>${sf:appendPTag(CTDT.phuongPhap2)} ${sf:appendPTagWithColor(CTDTSoSanh.phuongPhap2)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-style: italic">II.2.Phương pháp học tập:</p>${sf:appendPTag(CTDT.phuongPhap3)} ${sf:appendPTagWithColor(CTDTSoSanh.phuongPhap3)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">III./THỜI GIAN HỌC TẬP :</p></div>
			</td>
		</tr>	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-weight: bold;">III.1 Thời gian của khóa học và thời gian thực học tối thiểu:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p>- Thời gian đào tạo : ${CTDT.thoiGian1} năm</p>
					<p style="background-color: yellow;">- Thời gian đào tạo : ${CTDTSoSanh.thoiGian1} năm</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p>- Thời gian học tập : ${CTDT.thoiGian2} tuần</p>
					<p style="background-color: yellow;">- Thời gian học tập : ${CTDTSoSanh.thoiGian2} tuần</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p>- Thời gian thực học tối thiểu : ${CTDT.thoiGian3} tuần (${CTDT.thoiGian4} giờ) </p>
					<p style="background-color: yellow;">- Thời gian thực học tối thiểu : ${CTDTSoSanh.thoiGian3} tuần (${CTDTSoSanh.thoiGian4} giờ) </p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p>- Thời gian ôn, kiểm tra hết môn và thi : ${CTDT.thoiGian5} tuần ${CTDT.thoiGian6} giờ, trong đó ôn và thi tốt nghiệp : ${CTDT.thoiGian7} tuần ${CTDT.thoiGian8} giờ </p>
					<p style="background-color: yellow;">- Thời gian ôn, kiểm tra hết môn và thi : ${CTDTSoSanh.thoiGian5} tuần ${CTDTSoSanh.thoiGian6} giờ, trong đó ôn và thi tốt nghiệp : ${CTDTSoSanh.thoiGian7} tuần ${CTDTSoSanh.thoiGian8} giờ </p>
		</tr>
	</table>	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p style="font-weight: bold;">III.2.Phân bố thời gian thực học tối thiểu:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p>- Thời gian học các môn học chung bắt buộc : ${CTDT.phanBo1} giờ </p>
					<p style="background-color: yellow;">- Thời gian học các môn học chung bắt buộc : ${CTDTSoSanh.phanBo1} giờ </p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p>- Thời gian học các môn học, modun đào tạo nghề : ${CTDT.phanBo2} giờ </p>
					<p style="background-color: yellow;">- Thời gian học các môn học, modun đào tạo nghề : ${CTDTSoSanh.phanBo2} giờ </p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<p>- Thời gian học lý thuyết : ${CTDT.phanBo3} giờ, thời gian học thực hành : ${CTDT.phanBo4} giờ </p>
					<p style="background-color: yellow;">- Thời gian học lý thuyết : ${CTDTSoSanh.phanBo3} giờ, thời gian học thực hành : ${CTDTSoSanh.phanBo4} giờ </p>
				</td>
		</tr>
	</table>
	
	<c:set var="count1" value="0"></c:set>
	<c:set var="count2" value="0"></c:set>
	<c:set var="count3" value="0"></c:set>
	<c:set var="count1SoSanh" value="0"></c:set>
	<c:set var="count2SoSanh" value="0"></c:set>
	<c:set var="count3SoSanh" value="0"></c:set>
	<c:forEach var="iterator" items="${CTDT.chiTietMonHocCTDTModelList}">
		<c:if test="${iterator.maHocPhan eq 1}">
			<c:set var="count1" value="${count1 + 1}"></c:set>
		</c:if>
		<c:if test="${iterator.maHocPhan eq 2}">
			<c:set var="count2" value="${count2 + 1}"></c:set>
		</c:if>
		<c:if test="${iterator.maHocPhan eq 3}">
			<c:set var="count3" value="${count3 + 1}"></c:set>
		</c:if>
	</c:forEach>
	<c:forEach var="iterator" items="${CTDTSoSanh.chiTietMonHocCTDTModelList}">
		<c:if test="${iterator.maHocPhan eq 1}">
			<c:set var="count1SoSanh" value="${count1SoSanh + 1}"></c:set>
		</c:if>
		<c:if test="${iterator.maHocPhan eq 2}">
			<c:set var="count2SoSanh" value="${count2SoSanh + 1}"></c:set>
		</c:if>
		<c:if test="${iterator.maHocPhan eq 3}">
			<c:set var="count3SoSanh" value="${count3SoSanh + 1}"></c:set>
		</c:if>
	</c:forEach>
	
	<c:choose>
			<c:when test="${count1 ge count1SoSanh}">
				<c:set var="end1" value = "${count1}"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="end1" value = "${count1SoSanh}"></c:set>
			</c:otherwise>
	</c:choose>
	<c:choose>
			<c:when test="${count2 ge count2SoSanh}">
				<c:set var="end2" value = "${count2}"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="end2" value = "${count2SoSanh}"></c:set>
			</c:otherwise>
	</c:choose>	
	
	<c:choose>
			<c:when test="${count3 ge count3SoSanh}">
				<c:set var="end3" value = "${count3}"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="end3" value = "${count3SoSanh}"></c:set>
			</c:otherwise>
		</c:choose>
		
	<c:forEach var = "count" begin = "1" end ="${count1}">
		<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList[count-1]}"></c:set>
		<c:set var = "TongSoLyThuyet_PhanI" value = "${TongSoLyThuyet_PhanI + ChiTietList.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanI" value = "${TongSoThucHanh_PhanI + ChiTietList.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanI" value = "${TongSoLyThuyet_PhanI + TongSoThucHanh_PhanI}"></c:set>
	<c:forEach var = "count" begin = "${count1 + 1}" end ="${count1 + count2}">
		<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList[count-1]}"></c:set>
		<c:set var = "TongSoLyThuyet_PhanII" value = "${TongSoLyThuyet_PhanII + ChiTietList.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanII" value = "${TongSoThucHanh_PhanII + ChiTietList.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanII" value = "${TongSoLyThuyet_PhanII + TongSoThucHanh_PhanII}"></c:set>
	<c:forEach var = "count" begin = "${count1+count2+ 1}" end = "${count1+count2+count3}">
		<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList[count-1]}"></c:set>
		<c:set var = "TongSoLyThuyet_PhanIII" value = "${TongSoLyThuyet_PhanIII + ChiTietList.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanIII" value = "${TongSoThucHanh_PhanIII + ChiTietList.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanIII" value = "${TongSoLyThuyet_PhanIII + TongSoThucHanh_PhanIII}"></c:set>
	
	<c:forEach var = "count" begin = "1" end ="${count1SoSanh}">
		<c:set var = "ChiTietListSoSanh" value = "${CTDTSoSanh.chiTietMonHocCTDTModelList[count-1]}"></c:set>
		<c:set var = "TongSoLyThuyet_PhanI_SoSanh" value = "${TongSoLyThuyet_PhanI_SoSanh + ChiTietListSoSanh.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanI_SoSanh" value = "${TongSoThucHanh_PhanI_SoSanh + ChiTietListSoSanh.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanI_SoSanh" value = "${TongSoLyThuyet_PhanI_SoSanh + TongSoThucHanh_PhanI_SoSanh}"></c:set>
	<c:forEach var = "count" begin = "${count1 + 1}" end ="${count1 + count2}">
		<c:set var = "ChiTietListSoSanh" value = "${CTDTSoSanh.chiTietMonHocCTDTModelList[count-1]}"></c:set>
		<c:set var = "TongSoLyThuyet_PhanII_SoSanh" value = "${TongSoLyThuyet_PhanII_SoSanh + ChiTietListSoSanh.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanII_SoSanh" value = "${TongSoThucHanh_PhanII_SoSanh + ChiTietListSoSanh.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanII_SoSanh" value = "${TongSoLyThuyet_PhanII_SoSanh + TongSoThucHanh_PhanII_SoSanh}"></c:set>
	<c:forEach var = "count" begin = "${count1+count2+ 1}" end = "${count1+count2+count3}">
		<c:set var = "ChiTietListSoSanh" value = "${CTDT.chiTietMonHocCTDTModelList[count-1]}"></c:set>
		<c:set var = "TongSoLyThuyet_PhanIII_SoSanh" value = "${TongSoLyThuyet_PhanIII_SoSanh + ChiTietListSoSanh.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanIII_SoSanh" value = "${TongSoThucHanh_PhanIII_SoSanh + ChiTietListSoSanh.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanIII_SoSanh" value = "${TongSoLyThuyet_PhanIII_SoSanh + TongSoThucHanh_PhanIII_SoSanh}"></c:set>
	
	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">IV./DANH MỤC CÁC MÔN HỌC :</p></div>
			</td>
		</tr>
	</table>
	<c:set var="sum" value = "0"></c:set>
	<br /><div style="">
	<table width = "650" align="center" style="background-color: transparent; background-position: top;" border = "1">
	<tr style="background-color: transparent;">
		<td rowspan = "2">STT</td>
		<td rowspan = "2">Tên môn học, module</td>
		<td colspan = "2">Thời gian  đào tạo</td>
		<td colspan = "6">Thời gian của môn học, module (giờ)</td>
	</tr> 
	<tr style="background-color: transparent;">
		<td>Năm học</td>
		<td>Học kì</td>
		<td>Tổng số</td>
		<td>Lý thuyết</td>
		<td>Thực hành</td>
		<td>Kiểm tra</td>
	</tr>
	<tr style="background-color: transparent; background-position: center; background-color: aqua;">
		<td><p></td>
		<td>CÁC MÔN HỌC CHUNG</td>
		<td><p></td>
		<td><p></td>
		<td>${TongSo_PhanI}</td>
		<td>${TongSoLyThuyet_PhanI}</td>
		<td>${TongSoThucHanh_PhanI}</td>
		<td><p></td>
	</tr>
	<tr style="background-color: transparent; background-position: center; background-color: green;">
		<td><p></td>
		<td>CÁC MÔN HỌC CHUNG</td>
		<td><p></td>
		<td><p></td>
		<td>${TongSo_PhanI_SoSanh}</td>
		<td>${TongSoLyThuyet_PhanI_SoSanh}</td>
		<td>${TongSoThucHanh_PhanI_SoSanh}</td>
		<td><p></td>
	</tr>
		<c:forEach var = "count" begin = "1" end="${end1}">
			<c:if test="${not empty CTDT.chiTietMonHocCTDTModelList[count-1]}">
				<c:set var="iterator" value = "${CTDT.chiTietMonHocCTDTModelList[count-1]}"></c:set>
				<tr align="left" style="background-color: transparent; background-position: center; ">
					<td>${count}</td>
					<td>${iterator.tenMonHoc}</td>
					<td>${iterator.namHoc}</td>
					<td>${iterator.hocKi}</td>
					<td>${iterator.lyThuyet + iterator.thucHanh}</td>
					<td>${iterator.lyThuyet}</td>
					<td>${iterator.thucHanh}</td>
					<td>${iterator.tinhChat}</td>
				</tr>
			</c:if>
			<c:if test="${not empty CTDTSoSanh.chiTietMonHocCTDTModelList[count-1]}">
				<c:set var="iterator" value = "${CTDTSoSanh.chiTietMonHocCTDTModelList[count-1]}"></c:set>
				<tr align="left" style="background-color: transparent; background-position: center; background-color: yellow;">
					<td>${count}</td>
					<td>${iterator.tenMonHoc}</td>
					<td>${iterator.namHoc}</td>
					<td>${iterator.hocKi}</td>
					<td>${iterator.lyThuyet + iterator.thucHanh}</td>
					<td>${iterator.lyThuyet}</td>
					<td>${iterator.thucHanh}</td>
					<td>${iterator.tinhChat}</td>
				</tr>
			</c:if>
		</c:forEach>
		<tr style="background-color: transparent; background-color: aqua;">
			<td><p></td>
			<td>CÁC MÔN HỌC CƠ SỞ</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanII}</td>
			<td>${TongSoLyThuyet_PhanII}</td>
			<td>${TongSoThucHanh_PhanII}</td>
			<td><p></td>
		</tr>
		<tr style="background-color: transparent; background-color: green;">
			<td><p></td>
			<td>CÁC MÔN HỌC CƠ SỞ</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanIISoSanh}</td>
			<td>${TongSoLyThuyet_PhanIISoSanh}</td>
			<td>${TongSoThucHanh_PhanIISoSanh}</td>
			<td><p></td>
		</tr>
		<c:forEach var = "count" begin = "1" end="${end2}">
			<c:if test="${not empty CTDT.chiTietMonHocCTDTModelList[count+count1-1]}">
				<c:set var="iterator" value = "${CTDT.chiTietMonHocCTDTModelList[count+count1-1]}"></c:set>			
				<tr align="left" style="background-color: transparent; background-position: center;">
					<td>${count}</td>
					<td>${iterator.tenMonHoc}</td>
					<td>${iterator.namHoc}</td>
					<td>${iterator.hocKi}</td>
					<td>${iterator.lyThuyet + iterator.thucHanh}</td>
					<td>${iterator.lyThuyet}</td>
					<td>${iterator.thucHanh}</td>
					<td>${iterator.tinhChat}</td>
				</tr>
			</c:if>	
			<c:if test="${not empty CTDTSoSanh.chiTietMonHocCTDTModelList[count+count1SoSanh-1]}">
				<c:set var="iterator" value = "${CTDT.chiTietMonHocCTDTModelList[count+count1SoSanh-1]}"></c:set>			
				<tr align="left" style="background-color: transparent; background-position: center; background-color: yellow;">
					<td>${count}</td>
					<td>${iterator.tenMonHoc}</td>
					<td>${iterator.namHoc}</td>
					<td>${iterator.hocKi}</td>
					<td>${iterator.lyThuyet + iterator.thucHanh}</td>
					<td>${iterator.lyThuyet}</td>
					<td>${iterator.thucHanh}</td>
					<td>${iterator.tinhChat}</td>
				</tr>
			</c:if>	
		</c:forEach>	
		<tr style="background-color: transparent; background-color: aqua;">
				<td><p></td>
			<td>CÁC MÔN HỌC CHUYÊN NGÀNH</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanIII}</td>
			<td>${TongSoLyThuyet_PhanIII}</td>
			<td>${TongSoThucHanh_PhanIII}</td>
			<td><p></td>
		</tr>
		<tr style="background-color: transparent; background-color: green;">
				<td><p></td>
			<td>CÁC MÔN HỌC CHUYÊN NGÀNH</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanIIISoSanh}</td>
			<td>${TongSoLyThuyet_PhanIIISoSanh}</td>
			<td>${TongSoThucHanh_PhanIIISoSanh}</td>
			<td><p></td>
		</tr>
		
		<c:forEach var = "count" begin = "1" end="${end3}">
			<c:if test="${not empty CTDT.chiTietMonHocCTDTModelList[count+count1+count2-1]}">
				<c:set var="iterator" value = "${CTDT.chiTietMonHocCTDTModelList[count+count1+count2-1]}"></c:set>			
				<tr align="left" style="background-color: transparent; background-position: center;">
					<td>${count}</td>
					<td>${iterator.tenMonHoc}</td>
					<td>${iterator.namHoc}</td>
					<td>${iterator.hocKi}</td>
					<td>${iterator.lyThuyet + iterator.thucHanh}</td>
					<td>${iterator.lyThuyet}</td>
					<td>${iterator.thucHanh}</td>
					<td>${iterator.tinhChat}</td>
				</tr>
			</c:if>
			<c:if test="${not empty CTDTSoSanh.chiTietMonHocCTDTModelList[count+count1SoSanh+count2SoSanh-1]}">
				<c:set var="iterator" value = "${CTDTSoSanh.chiTietMonHocCTDTModelList[count+count1SoSanh+count2SoSanh-1]}"></c:set>			
				<tr align="left" style="background-color: transparent; background-position: center; background-color: yellow;">
					<td>${count}</td>
					<td>${iterator.tenMonHoc}</td>
					<td>${iterator.namHoc}</td>
					<td>${iterator.hocKi}</td>
					<td>${iterator.lyThuyet + iterator.thucHanh}</td>
					<td>${iterator.lyThuyet}</td>
					<td>${iterator.thucHanh}</td>
					<td>${iterator.tinhChat}</td>
				</tr>
			</c:if>
		</c:forEach>
		<tr style="background-color: transparent; background-color: green;"> 
			<td><p></td>
			<td>TỔNG CỘNG</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanI + TongSo_PhanII + TongSo_PhanIII}</td>
			<td>${TongSoLyThuyet_PhanI + TongSoLyThuyet_PhanII + TongSoLyThuyet_PhanIII}</td>
			<td>${TongSoThucHanh_PhanI + TongSoThucHanh_PhanII + TongSoThucHanh_PhanIII}</td>
			<td><p></td>
		</tr>
		<tr style="background-color: transparent; background-color: aqua;"> 
			<td><p></td>
			<td>TỔNG CỘNG</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanISoSanh + TongSo_PhanIISoSanh + TongSo_PhanIIISoSanh}</td>
			<td>${TongSoLyThuyet_PhanISoSanh + TongSoLyThuyet_PhanIISoSanh + TongSoLyThuyet_PhanIIISoSanh}</td>
			<td>${TongSoThucHanh_PhanISoSanh + TongSoThucHanh_PhanIISoSanh + TongSoThucHanh_PhanIIISoSanh}</td>
			<td><p></td>
		</tr>		
	</table>
	</div>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">V./CÔNG TÁC THI, KIỂM TRA :</p></div>
			</td>
		</tr>	
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>1/Thi học kì:</u>${sf:appendPTag(CTDT.thiHocKi)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>1/Thi tốt nghiệp:</u>${sf:appendPTag(CTDT.thiTotNghiep)}
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">VI.THỰC TẬP SẢN XUẤT :${sf:appendPTag(CTDT.thucTap)} </p></div>
			</td>
		</tr>	
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">VII.NHỮNG Ý KIẾN ĐỀ XUẤT : ${sf:appendPTag(CTDT.yKienDeXuat)} </p></div>
			</td>
		</tr>	
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<c:set var="sig" value="-"></c:set>
			<td>Tháng ${sf:getElement(CTDT.ngayCapNhatCuoi,0,sig)} ngày ${sf:getElement(CTDT.ngayCapNhatCuoi,1,sig)} năm ${sf:getElement(CTDT.ngayCapNhatCuoi,2,sig)}</td>
			<td>Quận 5, Tháng ${sf:getElement(CTDT.ngayDuyet,0,sig)} ngày ${sf:getElement(CTDT.ngayDuyet,1,sig)} năm ${sf:getElement(CTDT.ngayDuyet,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">TRƯỞNG KHOA </p></td>
			<td><p style="font-weight: bold">HIỆU TRƯỞNG</p></td>
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
			<td><p>${CTDT.tenNguoiTao}</p></td>
			<td><p>${CTDT.tenNguoiDuyet}</p></td>
		</tr>
	</table>
</table>
</div>
</div>
</html>
</pd4ml:transform>