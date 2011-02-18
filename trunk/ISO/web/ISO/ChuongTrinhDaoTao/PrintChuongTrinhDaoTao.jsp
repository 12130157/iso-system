<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<pd4ml:transform
	screenWidth="700"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="10,20,0,20,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Times New Roman" monospace="Courier New" />
<pd4ml:header 
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
<pd4ml:footer 
	   fontFace="Times New Roman"
       titleTemplate="     BM05-QT7.3/1           		Ngày hiệu lực: 15/9/2009"
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
<c:set var="CTDT" value="${sessionScope.ChuongTrinhDaoTao}"></c:set>
<table width="700" height="930" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	<tr><td>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-size: 12">ỦY BAN NHÂN DÂN QUẬN 5<br/>TRƯỜNG TCN KTCN HÙNG VƯƠNG</p></td>
			<td><p style="font-size: 12">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM <br/>
											 Độc lập - Tự do - Hạnh phúc<br/>--o0o--</p></td>					 
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 15px">CHƯƠNG TRÌNH ĐÀO TẠO
													<br/> HỆ ${sf:upperString(CTDT.tenTrinhDo)}</p><br /></th>
		</tr>
		<tr align="right">
			<td colspan="2">${CTDT.tenChuongTrinhDaoTao }</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2">
				<br/><p style="font-weight: bold;">Tên Nghề : ${sf:upperString(CTDT.tenNghe)}</p>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2">
				<p style="font-weight: bold;">Mã Nghề : ${sf:upperString(CTDT.kiHieu)}</p>
			</td>	
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2">	
				<p style="font-weight: bold">Trình độ đào tạo : ${CTDT.tenTrinhDo}</p>
			</td>	
		</tr>
	</table>	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-weight: bold">Đối tượng tuyển sinh:</p><ul>${sf:appendPTag(CTDT.doiTuong1)}</ul>
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><font style="font-weight: bold">Số lượng môn học, mô đun đào tạo :</font> ${CTDT.soLuongMonHoc}</p>
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><font style="font-weight: bold;">Bằng cấp sau khi tốt nghiệp :</font> ${CTDT.bangCap}</p>
				</td>
			</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">I./ MỤC TIÊU ĐÀO TẠO :</p></div>
			</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	1.Kiến thức nghề:</p><ul>${sf:appendPTag(CTDT.mucTieu1)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	2.Kỹ năng nghề:</p><ul>${sf:appendPTag(CTDT.mucTieu2)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	3.Chính trị, đạo đức:</p><ul>${sf:appendPTag(CTDT.mucTieu3)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	4.Kỹ năng khác:</p><ul>${sf:appendPTag(CTDT.mucTieu4)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">	5.Cơ hội việc làm:</p><ul>${sf:appendPTag(CTDT.mucTieu5)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">II./PHƯƠNG PHÁP GIẢNG DẠY: :</p></div>
			</td>
		</tr>	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">II.1.Phương pháp giảng dạy:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<u style="font-weight: bold">	1/Lý thuyết:</u><ul>${sf:appendPTag(CTDT.phuongPhap1)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<u style="font-weight: bold">	2/Thực hành:</u><ul>${sf:appendPTag(CTDT.phuongPhap2)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-style: italic; font-weight: bold">II.2.Phương pháp học tập:</p><ul>${sf:appendPTag(CTDT.phuongPhap3)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">III./THỜI GIAN HỌC TẬP :</p></div>
			</td>
		</tr>	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-weight: bold;">III.1 Thời gian của khóa học và thời gian thực học tối thiểu:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><ul>- Thời gian đào tạo : ${CTDT.thoiGian1} năm</ul></p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><ul>- Thời gian học tập : ${CTDT.thoiGian2} tuần</ul></p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><ul>- Thời gian thực học tối thiểu : ${CTDT.thoiGian3} tuần (${CTDT.thoiGian4} giờ) </ul></p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><ul>- Thời gian ôn, kiểm tra hết môn và thi : ${CTDT.thoiGian5} tuần ${CTDT.thoiGian6} giờ, trong đó ôn và thi tốt nghiệp : ${CTDT.thoiGian7} tuần ${CTDT.thoiGian8} giờ </ul></p>
		</tr>
	</table>	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p style="font-weight: bold;">III.2.Phân bố thời gian thực học tối thiểu:</p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><ul>- Thời gian học các môn học chung bắt buộc : ${CTDT.phanBo1} giờ </ul></p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><ul>- Thời gian học các môn học, modun đào tạo nghề : ${CTDT.phanBo2} giờ </ul></p>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<p><ul>- Thời gian học lý thuyết : ${CTDT.phanBo3} giờ, thời gian học thực hành : ${CTDT.phanBo4} giờ </ul></p>
				</td>
		</tr>
	</table>
	<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList1}"></c:set>
	<c:forEach var = "ChiTiet" items="${ChiTietList}">
		
		<c:set var = "TongSoLyThuyet_PhanI" value = "${TongSoLyThuyet_PhanI + ChiTiet.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanI" value = "${TongSoThucHanh_PhanI + ChiTiet.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanI" value = "${TongSoLyThuyet_PhanI + TongSoThucHanh_PhanI}"></c:set>
	<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList2}"></c:set>
	<c:forEach var = "ChiTiet" items="${ChiTietList}">
		
		<c:set var = "TongSoLyThuyet_PhanII" value = "${TongSoLyThuyet_PhanII + ChiTiet.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanII" value = "${TongSoThucHanh_PhanII + ChiTiet.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanII" value = "${TongSoLyThuyet_PhanII + TongSoThucHanh_PhanII}"></c:set>
	<c:set var = "ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList3}"></c:set>
	<c:forEach var = "ChiTiet" items="${ChiTietList}">
		
		<c:set var = "TongSoLyThuyet_PhanIII" value = "${TongSoLyThuyet_PhanIII + ChiTiet.lyThuyet}"></c:set>
		<c:set var = "TongSoThucHanh_PhanIII" value = "${TongSoThucHanh_PhanIII + ChiTiet.thucHanh}"></c:set>
	</c:forEach>
	<c:set var = "TongSo_PhanIII" value = "${TongSoLyThuyet_PhanIII + TongSoThucHanh_PhanIII}"></c:set>
	
	
	
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">IV./DANH MỤC CÁC MÔN HỌC :</p></div>
			</td>
		</tr>
	</table>
	<%int count = 1; %>
	<br /><div style="">
	<table width = "650" align="center" style="background-color: transparent; background-position: top;" border = "1">
	<tr style="background-color: transparent; font-size: 15px;">
		<td rowspan = "2">STT</td>
		<td rowspan = "2">Tên môn học, module</td>
		<td colspan = "2">Thời gian  đào tạo</td>
		<td colspan = "4">Thời gian của môn học, module (giờ)</td>
	</tr> 
	<tr style="background-color: transparent; font-size: 15px;">
		<td>Năm học</td>
		<td>Học kì</td>
		<td>Tổng số</td>
		<td>Lý thuyết</td>
		<td>Thực hành</td>
		<td>Kiểm tra</td>
	</tr>
	<tr style="background-color: transparent; background-position: center; background-color: aqua; font-weight: bold; font-size: 15px">
		<td><p></td>
		<td>CÁC MÔN HỌC CHUNG</td>
		<td><p></td>
		<td><p></td>
		<td>${TongSo_PhanI}</td>
		<td>${TongSoLyThuyet_PhanI}</td>
		<td>${TongSoThucHanh_PhanI}</td>
		<td><p></td>
	</tr>
	<c:set var="ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList1}"></c:set>
		<c:forEach var = "iterator" items="${ChiTietList}">
			
			<tr align="left" style="background-color: transparent; background-position: center; font-size: 15px;">
				<td><%=count %></td>
				<td>${iterator.tenMonHoc}</td>
				<td>${iterator.namHoc}</td>
				<td>${iterator.hocKi}</td>
				<td>${iterator.lyThuyet + iterator.thucHanh}</td>
				<td>${iterator.lyThuyet}</td>
				<td>${iterator.thucHanh}</td>
				<td>${iterator.tinhChat}</td>
			</tr>
			<%count++; %>
		</c:forEach>
		<tr style="background-color: transparent; background-color: aqua; font-weight: bold; font-size: 15px">
			<td><p></td>
			<td>CÁC MÔN HỌC CƠ SỞ</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanII}</td>
			<td>${TongSoLyThuyet_PhanII}</td>
			<td>${TongSoThucHanh_PhanII}</td>
			<td><p></td>
		</tr>
		<%count = 1; %>
		<c:set var="ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList2}"></c:set>
		<c:forEach var = "iterator" items="${ChiTietList}">			
			<tr align="left" style="background-color: transparent; background-position: center; font-size: 15px;">
				<td><%=count %></td>
				<td>${iterator.tenMonHoc}</td>
				<td>${iterator.namHoc}</td>
				<td>${iterator.hocKi}</td>
				<td>${iterator.lyThuyet + iterator.thucHanh}</td>
				<td>${iterator.lyThuyet}</td>
				<td>${iterator.thucHanh}</td>
				<td>${iterator.tinhChat}</td>
			</tr>
			<%count++; %>
		</c:forEach>	
		<tr style="background-color: transparent; background-color: aqua; font-weight: bold; font-size: 15px">
				<td><p></td>
			<td>CÁC MÔN HỌC CHUYÊN NGÀNH</td>
			<td><p></td>
			<td><p></td>
			<td>${TongSo_PhanIII}</td>
			<td>${TongSoLyThuyet_PhanIII}</td>
			<td>${TongSoThucHanh_PhanIII}</td>
			<td><p></td>
		</tr>
		<%count = 1; %>
		<c:set var="ChiTietList" value = "${CTDT.chiTietMonHocCTDTModelList3}"></c:set>
		<c:forEach var = "iterator" items="${ChiTietList}">		
			<tr align="left" style="background-color: transparent; background-position: center; font-size: 15px;">
				<td><%=count %></td>
				<td>${iterator.tenMonHoc}</td>
				<td>${iterator.namHoc}</td>
				<td>${iterator.hocKi}</td>
				<td>${iterator.lyThuyet + iterator.thucHanh}</td>
				<td>${iterator.lyThuyet}</td>
				<td>${iterator.thucHanh}</td>
				<td>${iterator.tinhChat}</td>
			</tr>
			<%count++; %>
		</c:forEach>
		<tr style="background-color: transparent; background-color: aqua; font-weight: bold; font-size: 15px"> 
		<td><p></td>
		<td>TỔNG CỘNG</td>
		<td><p></td>
		<td><p></td>
		<td>${TongSo_PhanI + TongSo_PhanII + TongSo_PhanIII}</td>
		<td>${TongSoLyThuyet_PhanI + TongSoLyThuyet_PhanII + TongSoLyThuyet_PhanIII}</td>
		<td>${TongSoThucHanh_PhanI + TongSoThucHanh_PhanII + TongSoThucHanh_PhanIII}</td>
		<td><p></td>
	</tr>	
	</table>
	</div>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">V./CÔNG TÁC THI, KIỂM TRA :</p></div>
			</td>
		</tr>	
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<u style="font-weight: bold">1/Thi học kì:</u><ul>${sf:appendPTag(CTDT.thiHocKi)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">	
		<tr style="background-color: transparent; font-size: 15px;">
				<td colspan = "2">
					<u style="font-weight: bold">2/Thi tốt nghiệp:</u><ul>${sf:appendPTag(CTDT.thiTotNghiep)}</ul>
				</td>
		</tr>
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">VI.THỰC TẬP SẢN XUẤT :</p><ul>${sf:appendPTag(CTDT.thucTap)}</ul> </div>
			</td>
		</tr>	
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent; font-size: 15px;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold;">VII.NHỮNG Ý KIẾN ĐỀ XUẤT :</p> <ul>${sf:appendPTag(CTDT.yKienDeXuat)}</ul></div>
			</td>
		</tr>	
	</table>
	<table width = "650" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 15px;">
			<c:set var="sig" value="-"></c:set>
			<td>ngày ${sf:getElement(CTDT.ngayCapNhatCuoi,0,sig)} tháng ${sf:getElement(CTDT.ngayCapNhatCuoi,1,sig)} năm ${sf:getElement(CTDT.ngayCapNhatCuoi,2,sig)}</td>
			<td>Quận 5, ngày ${sf:getElement(CTDT.ngayDuyet,0,sig)} tháng ${sf:getElement(CTDT.ngayDuyet,1,sig)} năm ${sf:getElement(CTDT.ngayDuyet,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 15px;">
			<td><p style="font-weight: bold;">TRƯỞNG KHOA </p></td>
			<td><p style="font-weight: bold;">HIỆU TRƯỞNG</p></td>
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
		<tr align="center" style="background-color: transparent; background-position: center; font-size: 15px;">
			<td><p>${CTDT.tenNguoiTao}</p></td>
			<td><p>${CTDT.tenNguoiDuyet}</p></td>
		</tr>
	</table>
</table>
</div>
</div>
</html>
</pd4ml:transform>