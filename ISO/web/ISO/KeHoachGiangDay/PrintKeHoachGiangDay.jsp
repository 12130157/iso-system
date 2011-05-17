 
<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHGDModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="javax.mail.Session"%>

<pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="30,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Times New Roman" monospace="Courier New" />
<pd4ml:header 
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"   
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>
<pd4ml:footer 
	   fontFace="Times New Roman"
       titleTemplate="     BM03b–QT7.1/2           		                                          Ngày hiệu lực: 15/9/2009"
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,580,500,20"	      
       fontSize="14">       
 </pd4ml:footer>

 
<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Kế Hoạch Giảng Dạy</title> 

</head>
<% ArrayList<ArrayList<ChiTietKHGDModel>> chiTietKHGDGroupSTTND=new ArrayList<ArrayList<ChiTietKHGDModel>>(); %>
<% ArrayList<ArrayList<ArrayList<ChiTietKHGDModel>>> chiTietKHGDGroupNhom=new ArrayList<ArrayList<ArrayList<ChiTietKHGDModel>>>(); %>
<div align="center">
<div class = "div_body">
<c:set var="coHieuLT" value='<%=Constant.COHIEULT %>'></c:set>
<c:set var="coHieuTH" value='<%=Constant.COHIEUTH %>'></c:set>

<c:if test="${not empty param.maKHGD}">
	<c:set var="KHGD" value = '<%=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(request.getParameter("maKHGD"))%>'></c:set>
	<c:set var="tuanKHGDList" value = '<%= ChiTietKHGDDAO.getChiTietKHGDByMaKHGDGroupByTuan(request.getParameter("maKHGD"))%>'></c:set>
	<c:set var="chiTietList" value = "${sessionScope.chiTietKHGDList}"></c:set>
	<c:set var="totalGiaoAnReject" value='<%=GiaoAnDAO.getTotalGiaoAnByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
	<c:set var="totalCTKHGD" value='<%=ChiTietKHGDDAO.getTotalChiTietKHGDByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
	<c:set var="totalGiaoAnNew" value='<%=GiaoAnDAO.getTotalGiaoAnNewByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
	<c:set var="maNguoiTao" value='${objKHGD.maNguoiTao}'></c:set>
	<c:set var="tuanLeKHGDList" value='<%=ChiTietKHGDDAO.getTuanByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
	<% chiTietKHGDGroupSTTND=ChiTietKHGDDAO.getGroupNoiDungChiTietKHGDByMaKHGD(request.getParameter("maKHGD")); %>
	<% chiTietKHGDGroupNhom=ChiTietKHGDDAO.getGroupNhomChiTietKHGDByMaKHGD(request.getParameter("maKHGD"));%>	
</c:if>

<table width="100%" height="100%" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');padding-right:15px;padding-left:40px">
	<tr><td>
	<table width = "950px" align="center" style="background-color: transparent;padding-right:30px">
		<tr style="background-color: transparent;">
			<td align="center">ỦY BAN NHÂN DÂN QUẬN 5<br />TRƯỜNG TCN KTCN HÙNG VƯƠNG </td>
			<td align="center">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />Độc lập – Tự do – Hạnh phúc</td>
		</tr>
	</table>
	<div style='padding-left:230px'>
		<strong>KẾ HOẠCH GIẢNG DẠY HỆ TRUNG CẤP NGHỀ/CAO ĐẲNG NGHỀ</strong>
	</div>
	<div style='padding-left:85px'>
	<table width = "850px" align="center" style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td>
				<div class = "div_textleft">Học kỳ : ${KHGD.hocKi}</div>
			</td>
			<td>
				<div class = "div_textleft">Số giờ  môn học : ${KHGD.soGioLT + KHGD.soGioTH}</div>
			</td>
			<td>
				<div class = "div_textleft">Môn học : ${KHGD.tenMonHoc}</div>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td>
				<div class = "div_textleft">Năm học : ${KHGD.namHoc}</div>
			</td>
			<td>
				<div class = "div_textleft">Số giờ lý thuyết : ${KHGD.soGioLT}</div>
			</td>
			<td>
				<div class = "div_textleft">Giáo viên : ${KHGD.tenGiaoVien}</div>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td></td>
			<td>
				<div class = "div_textleft">Số giờ thực hành : ${KHGD.soGioTH}</div>
			</td>
			<td>
				<div class = "div_textleft">Số ca thực hành : ${KHGD.soCaThucHanh}.   Lớp : ${KHGD.kiHieuLop}</div>
			</td>
		</tr>
	</table>
	</div>
	<div style='padding-left:40px'>
	<table width = "860px" border = "1" style="background-color: transparent;" id="TableNoiDung">
					<tr style="background-color: transparent;">
						<td style="width: 50px;font-weight:bold" align="center"><b>Tuần lễ</b></td>
						
						<td>
							<table border="1" style="border-bottom: none;border-top: none;background-color: transparent; width: 810px">
								<tr>
									<td style="width: 150px;font-weight:bold;text-align:center">Thời gian giảng dạy</td>
									<td style="width: 120px;font-weight:bold;text-align:center" colspan="3">Số giờ</td>
									<td style="width: 190px;font-weight:bold;text-align:center" rowspan="2">Nội dung giảng dạy (Tên chương, bài, đề mục theo chương trình đã qui định)</td>
									<td style="width: 160px;font-weight:bold;text-align:center" rowspan="2">Tên sản phẩm ứng dụng trong bài tập</td>
									<td style="width: 190px;font-weight:bold;text-align:center" rowspan="2">Công việc chuẩn bị trước khi giảng dạy</td>					
								</tr>
									<tr>
										<td style="text-align:center;width:150px">Từ ngày đến ngày</td>
										<td style="text-align:center;width:40px">LT</td>
										<td style="text-align:center;width:40px">BT</td>
										<td style="text-align:center;width:40px">TH</td>			
												
												
								</tr>
							</table>
						</td>
					</tr>
					<c:if test="${not empty param.maKHGD}">
						<% int count1=0; %>
						<% int count3=0; %>
						<% int count4=0; %>
						<c:forEach items="${tuanLeKHGDList}" var="tuanLeObj">
							<tr>
								<td style="width: 50px" align="center">${tuanLeObj.maTuanLe}</td>
								<td>
									<c:set var="cTKHGDGroupSTTNDElement" value="<%=chiTietKHGDGroupSTTND.get(count1) %>"></c:set>
									
									<%int count2=0; %>
									<c:forEach items="${cTKHGDGroupSTTNDElement}" var="obj1">
										
										<table border="1" style="border-bottom: none;border-top: none;background-color: transparent; width: 810px">
											<tr>
																									
												<td style="text-align:center;width:150px"> Từ ${tuanLeObj.tuNgay} đến ${tuanLeObj.denNgay}
												<td style="text-align:center;width:40px">
														<c:if test="${obj1.coHieu eq coHieuLT}">
															${KHGD.soTietMoiBuoi}
														</c:if>
														<c:if test="${obj1.coHieu eq coHieuTH}">
															0
														</c:if>
														<c:if test="${obj1.coHieu ne coHieuLT and obj1.coHieu ne coHieuTH}">
															0
														</c:if>
												</td>
												<td style="text-align:center;width:40px">0</td>
												<td style="text-align:center;width:40px">
												
												<c:if test="${obj1.coHieu eq coHieuLT}">
															0
														</c:if>
														<c:if test="${obj1.coHieu eq coHieuTH}">
															${KHGD.soTietMoiBuoi}
														</c:if>
														<c:if test="${obj1.coHieu ne coHieuLT and obj1.coHieu ne coHieuTH}">
															${KHGD.soTietMoiBuoi}
														</c:if>
												</td>
												
												<td style="width:190px;">
													<c:if test="${not empty obj1.tenChuong}">${sf:appendBrTag3(obj1.tenChuong)}</c:if>
												</td>
												<td style="width:160px;">
													<c:if test="${not empty obj1.noiDungTH }">${sf:appendBrTag3(obj1.noiDungTH)}</c:if>
												</td>
												<td style="width:190px;">${sf:appendBrTag3(obj1.congViecChuanBi)}</td>
											
											</tr>
											
										</table>
										
										<%count2++;%>
										<%count3++;%>
									</c:forEach>
											
								</td>
								
							</tr>
							
							<% count1++; %>
						</c:forEach>
							
					</c:if>
				
				
	</table>
	</div>
	<div style='padding-left:70px'>
	<table width = "900" align="center" style="background-color: transparent;padding-right:30px"> 
		<tr style="background-color: transparent;">
			<td colspan="3"><div class = "div_tr">
			<br />
		Ghi chú:<br />
		- Nếu dạy nhiều lớp cùng tiến độ giảng dạy thì ghi chung kế hoạch.<br />
		- Giáo viên lập thành 3 bản: 1 bản nộp P.Đào Tạo, 1 bản nộp Trưởng Khoa, 1 bản giáo viên lưu.<br />
		</div>
			</td>
		</tr>
		
		<tr style="background-color: transparent;">
			<td></td>
			<td></td>
			<td align="center">${sf:setFormatDate(KHGD.ngayTao)}</td>
		</tr>
		<tr style="background-color: transparent;">
			<td align="center">Hiệu trưởng</td>
			<td align="center">Trưởng khoa</td>
			<td align="center">Giáo viên biên soạn</td>
		</tr>
		<tr style="background-color: transparent;">
			<td align="center"><br/><br/><br/><br/><br/>
			<c:if test="${ not empty param.maKHGD and (KHGD.tinhTrangHT eq APPROVE or KHGD.tinhTrangHT eq REJECT) }">
				${KHGD.tenNguoiDuyet}
			</c:if>
			</td>
			<td align="center"><br/><br/><br/><br/><br/>${KHGD.tenTruongKhoa}</td>
			<td align="center"><br/><br/><br/><br/><br/>${KHGD.tenNguoiTao}</td>
		</tr>
	</table>
	</div>
</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>