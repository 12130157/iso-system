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
       titleTemplate="     BM06-QT7.3/1         Ngày hiệu lực: 15/9/2009"
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
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Thêm Quyết Định Mở Lớp</title> 
</head>
<div align="center">
<div class = "div_body">
<c:set var="QuyetDinh" value="${sessionScope.objQuyetDinh}"></c:set>
<table width="691" height="1000" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print2.jpg');">
	<tr style="background-color: transparent; height: auto;">
		<td>
			<table width = "650" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent;">
					<td>
						ỦY BAN NHÂN DÂN QUẬN 5<br />
						TRƯỜNG TCN KTCN HÙNG VƯƠNG<br />
						Số: ${objQuyetDinh.kiHieu} /QĐ-KTCNHV 
					</td>
					<td>
						CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />
						Độc lập – Tự do – Hạnh phúc<br />
						Quận 5, ${objQuyetDinh.ngayLap}
					</td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td><img src="<%=request.getContextPath()%>/images/HeaderIcon.gif"/></td>
					<td><img src="<%=request.getContextPath()%>/images/HeaderIcon.gif"/></td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 18px">QUYẾT ĐỊNH ĐÀO TẠO HỆ ${sf:upperString(objQuyetDinh.tenHeDaoTao)} CHÍNH QUI<br/> NĂM HỌC ${objQuyetDinh.namBatDau} - ${objQuyetDinh.namBatDau + objQuyetDinh.soNamDaoTao}</p></th>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						Khóa ${objQuyetDinh.maKhoa}
						Niên khóa ${objQuyetDinh.namBatDau} - ${objQuyetDinh.namBatDau + objQuyetDinh.soNamDaoTao}<br/>
						HIỆU TRƯỞNG TRƯỜNG TRUNG CẤP NGHỀ KỸ THUẬT CÔNG NGHỆ HÙNG VƯƠNG
					</td>
				</tr>
				<tr align="left" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						<br/>
						<div class="div_textleft">-	Căn cứ Quyết định số 2470/QĐ-UBND ngày 05/6/2007 của Ủy ban nhân dân Thành phố  Hồ Chí Minh v/v thành lập Trường Trung cấp nghề kỹ thuật công nghệ Hùng Vương trực thuộc Ủy ban Nhân dân Quận 5 trên cơ sở nâng cấp trường Trường Kỹ thuật công nghệ Hùng Vương.<br/>
						-	Căn cứ Quyết định số 03/2007/QĐ–BLĐTBXH ngày 04/1/2007 của Bộ Trưởng Bộ Lao động – Thương binh và Xã hội ban hành Điều lệ trường trung cấp nghề.<br/></div>
					</td>
				</tr>
				<tr align="left" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						<div class="div_textleft">-	Căn cứ Quyết định số ${objQuyetDinh.quyetDinhSo} /QĐ-UBND ngày ${objQuyetDinh.ngayRaQuyetDinh} của Ủy ban nhân dân thành phố Hồ Chí Minh v/v giao chỉ tiêu kế hoạch đào tạo hệ trung cấp nghề năm ${objQuyetDinh.namBatDau} cho Trường Trung cấp nghề kỹ thuật công nghệ Hùng Vương.</div>
					</td>
				</tr>
				<tr align="left" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						<div class="div_textleft">-	Theo đề nghị của trưởng phòng đào tạo <br/></div>
					</td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						<p style="font-weight: bold">QUYẾT ĐỊNH</p>
					</td>
				</tr>
				<tr align="left" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						<div class="div_textleft"><strong>Điều I</strong> : Nay mở lớp đào tạo hệ Trung cấp nghề chính qui khóa ${objQuyetDinh.maKhoa} niên khóa ${objQuyetDinh.namBatDau} - ${objQuyetDinh.namBatDau+objQuyetDinh.soNamDaoTao} tại Trường Trung cấp nghề kỹ thuật công nghệ Hùng Vương gồm ${objQuyetDinh.tongSoHocSinh} học sinh (danh sách đính kèm) <br/>
						 với ${objQuyetDinh.tongSoChuyenNganh} chuyên ngành :</div>
					</td>
				</tr>
			</table>
			<table width = "650" align="center" border="0" style="background-color: transparent; background-position: top;">
				<% int count = 1; %>
				<c:forEach var = "iterator" items="${objQuyetDinh.moChuyenNganhList}">			
					<tr align="left" style="background-color: transparent; background-position: center;">
						<td width="80px"></td>
						<td align="left"> - ${iterator.tenChuyenNganh}</td>
						<td align="left">${iterator.ghiChu} học sinh.</td>
						<% count++; %>
					</tr>
				</c:forEach>
			</table>
			<table width = "650" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						Thời gian đào tạo từ tháng ${objQuyetDinh.tuThang}/${objQuyetDinh.namBatDau} đến tháng ${objQuyetDinh.denThang}/${objQuyetDinh.namBatDau + objQuyetDinh.soNamDaoTao} (${objQuyetDinh.soNamDaoTao} năm).
					</td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						<div class="div_textleft"><strong>Điều II</strong> : Phòng Đào tạo lập kế hoạch tiến độ đào tạo, xây dựng chương trình đào tạo, phối hợp các Khoa bố trí giáo viên giảng dạy theo đúng chương trình đào tạo.</div>
					</td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td colspan="3">
						<div class="div_textleft"><strong>Điều III</strong> : Các Ông (Bà) Trưởng phòng Đào tạo, Phòng Tổ chức, Phòng Kế toán, các Khoa/Trung tâm và học sinh có tên trong danh sách chịu trách nhiệm thi hành quyết định này.</div>
					</td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td></td>
					<td>
						<strong>SỞ LĐ – TB XH TP.HCM</strong>
					</td>
					<td>
						<strong>HIỆU TRƯỞNG</strong>
					</td>
				</tr>
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td></td>
					<td></td>
					<td><br /><br /><br /><p style="font-weight: bold">${objQuyetDinh.tenNguoiDuyet}</p></td>
				</tr>
			</table>
			<table width = "650" align="center" style="background-color: transparent; background-position: top;">
				<tr align="center" style="background-color: transparent; background-position: center;">
					<td align="left">Nơi nhận: <br />
						${sf:appendPTag(objQuyetDinh.noiNhan)}
					</td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
</div>
</html>
</pd4ml:transform>