<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.DeCuongMonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TuanLeModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungDCMHModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NoiDungDCMHDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>

<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThoiKhoaBieuController"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.util.DateUtil"%>


<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHGDModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SoTayGiaoVienDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>SỔ TAY GIÁO VIÊN</title>

	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "HieuTruong" value = "<%= Constant.HIEU_TRUONG %>"></c:set>
	<c:set var = "TruongKhoa" value = "<%= Constant.TRUONG_KHOA %>"></c:set>
	<c:set var = "PhoKhoa" value = "<%= Constant.PHO_KHOA %>"></c:set>
	<c:set var = "GiaoVien" value = "<%=Constant.GIAO_VIEN %>"></c:set>
	<c:set var = "Admin" value = "<%=Constant.ADMIN %>"></c:set>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "NEW" value = "<%= Constant.TINHTRANG_NEW %>"></c:set>
	<c:set var = "SEND" value = "<%= Constant.TINHTRANG_SEND %>"></c:set>
	<c:set var = "REJECT" value = "<%= Constant.TINHTRANG_REJECT %>"></c:set>
	<c:set var = "APPROVE" value = "<%= Constant.TINHTRANG_APPROVE %>"></c:set>
	<c:set var = "TK_APPROVE" value = '<%=Constant.TINHTRANG_TK_APPROVE%>'> </c:set>
	<c:set var = "TK_REJECT" value = '<%=Constant.TINHTRANG_TK_REJECT%>'> </c:set>
	<c:set var = "TK_SEND" value = '<%=Constant.TINHTRANG_TK_SEND%>'> </c:set>
	<c:set var = "HT_APPROVE" value = '<%=Constant.TINHTRANG_HT_APPROVE%>'> </c:set>
	<c:set var = "coHieuLT" value = '<%=Constant.COHIEULT %>'></c:set>
	<c:set var = "coHieuTH" value = '<%=Constant.COHIEUTH %>'></c:set>
	<c:set var = "coHieuTHop" value = '<%=Constant.COHIEUTHOP %>'></c:set>
	<c:set var = "coHieuKT" value = '<%=Constant.COHIEUKT %>'></c:set>

	<c:set var = "maKhoa" value = '<%=(String) request.getSession().getAttribute("maBoPhan") %>'></c:set>	
	<c:set var = "boPhanHC" value = '<%=Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "boPhanKDCL" value = '<%=Constant.BO_PHAN_PKID %>'></c:set>
	<c:set var = "boPhanPDT" value = '<%=Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var = "boPhanBGH" value = '<%=Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "space" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></c:set>
	<c:if test="${not empty param.id}">
		<c:set var="SoTayGiaoVien" value='<%=SoTayGiaoVienDAO.getSoTayGiaoVienById(request.getParameter("id")) %>' scope="session"></c:set>
	</c:if>
	<script language="javascript">
		function submitForm(ac){
			if(ac=='U'){
				document.getElementById("action").value = "update";
			} else if(ac=='S'){
				document.getElementById("action").value = "send";
			}
			document.forms["SoTayGiaoVien"].submit();
		}
		
	</script>
</head>

<body>
	<div align="center";>
		<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
		<!-- E HEAD CONTENT -->
				
		<form action="<%=request.getContextPath() %>/soTayGiaoVienController" id="SoTayGiaoVien" name="SoTayGiaoVien" method="post">
			<table style="background-color: transparent;width: 300px;">
				<tr style="background-color: transparent;">
					<td colspan="2">
						<strong>SỔ TAY GIÁO VIÊN</strong>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="2" style="text-align: left">Môn Học/Modul : ${SoTayGiaoVien.tenMonHoc }</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left">Lớp : ${SoTayGiaoVien.tenLopHoc }</td>
					<td style="text-align: left;width: 150px;">Khóa : ${SoTayGiaoVien.khoa }</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="2" style="text-align: left">Giáo Viên : ${SoTayGiaoVien.tenGiaoVien }</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="2" style="text-align: left">Năm Học : ${SoTayGiaoVien.namHoc }</td>
				</tr>
				<tr style="background-color: transparent;">
					<td colspan="2" style="text-align: left">Trình độ đào tạo : ${SoTayGiaoVien.tenHeDaoTao }</td>
				</tr>
			</table>
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td style="text-align: center;">
						<strong>Thông tin về lớp học/khóa</strong>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td style="text-align: left;">
						1. Nghề đào tạo : ${SoTayGiaoVien.tenChuyenNganh }<br/>
						2. Trình độ đào tạo nghề : ${SoTayGiaoVien.tenHeDaoTao }<br/> 
						3. Trình độ đầu vào và hình thức đánh gía đầu vào : <br/>
						${space }- Trình độ đầu vào : <br/>
						${space }- Hình thức đánh giá đầu vào :<br/> 
						4. Quyết định thành lập lớp học : ${SoTayGiaoVien.tenQuyetDinh }<br/>
						5. Tổ chức lớp học : <br/>
						a) Sĩ số lớp học :<br/>
						b) Bộ máy quản lý lớp :<br/> 
						${space }- Giáo viên chủ nhiệm :<br/> 
						${space }- Lớp trưởng : <br/>
						${space }- Lớp phó học tập/Lớp phó phong trào : <br/> 
						${space }Lớp phó học tập : <br/>
						${space }Thủ quỹ : <br/>
						${space }- Tổ trưởng tổ 1 : <br/>
						${space }- Tổ trưởng tổ 2 : <br/>
						${space }- Tổ trưởng tổ 3 : <br/>
						${space }- Tổ trưởng tổ 4 : <br/>
						c) Phương thức tổ chức đào tạo : <br/>   
					</td>
				</tr>
			</table>
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td style="text-align: center;">
						<strong>Kết quả học tập</strong>
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td>
						<table style="background-color: transparent;width: 800px;margin-bottom: 20px;" border="1">
							<tr style="background-color: transparent;">
								<th rowspan="3" style="width: 50px;">Stt</th>
								<th rowspan="3" style="width: 190px;">Họ và tên học sinh</th>
								<th colspan="5" style="width: 350px;">Kiểm tra định kỳ</th>
								<th rowspan="2" colspan="2" style="width: 140px;">Kiểm tra kết thúc môn học/module</th>
								<th rowspan="3" style="width: 70px;">Điểm tổng kết</th>
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
									<td>${m }</td>
									<td style="text-align: left;padding-left: 5px;">${HocSinh.hoThanhVien } ${HocSinh.tenLot } ${HocSinh.tenThanhVien }</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>${HocSinh.user1 }</td>
								</tr>
								<c:set var="m" value="${m+1}"></c:set>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
			<table style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td>
						<Strong>Quản Lý Học Sinh Cá Biệt : <br/></Strong>
						<textarea <c:if test="${SoTayGiaoVien.tinhTrang ne 0}">readonly</c:if> rows="3" cols="80" id="QuanLyHocSinhCaBiet" name="QuanLyHocSinhCaBiet">${SoTayGiaoVien.quanLyHocSinhCaBiet }</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<Strong>Đánh Giá Qui Trình Giảng Dạy : <br/></Strong>
						<textarea <c:if test="${SoTayGiaoVien.tinhTrang ne 0}">readonly</c:if> rows="3" cols="80" id="DanhGiaQuiTrinhGiangDay" name="DanhGiaQuiTrinhGiangDay">${SoTayGiaoVien.danhGiaQuiTrinhGiangDay }</textarea>
					</td>
				</tr>
			</table>
			<c:forEach var="listThang" items="${SoTayGiaoVien.listThang}">
				<c:set var="stt" value="1"></c:set>
				<strong>Tháng ${listThang.thang }-${listThang.nam }</strong>
				<table style="background-color: transparent;width: 800px;margin-bottom: 20px;" id="${listThang }" border="1">
					<tr style="background-color: transparent;">
						<th rowspan="2" style="width: 20px;">Stt</th>
						<th rowspan="2" style="width: 100px;">Họ và tên học sinh</th>
						<th colspan="31" style="width: 620px;">Ngày học</th>
						<th rowspan="2" style="width: 60px;">Tổng cộng</th>
					</tr>
					<tr>
						<c:forEach begin="1" end="31" step="1" var="i">
							<td style="width: 20px;font-size: 10px;">
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
								<td>
									<c:forEach var="listDiemDanh" items="${listHocSinh.diemDanhList}">
										<c:if test="${listDiemDanh.ngayHoc eq NgayHoc}">
											<c:if test="${listDiemDanh.tinhTrang eq '1' or listDiemDanh.tinhTrang eq '2' or listDiemDanh.tinhTrang eq '3'}">
												<c:if test="${count eq 1}">
												K
												<c:set var="songaynghi" value="${songaynghi+1}"></c:set>
												</c:if>
												<c:set var="count" value="${count+1}"></c:set>
											</c:if>
										</c:if>
									</c:forEach>
								</td>
							</c:forEach>
							<td>${songaynghi }</td>
						</tr>
						<c:set var="stt" value="${stt + 1}"></c:set>
					</c:forEach>
				</table>
			</c:forEach>
			<strong>Tổng số giờ nghỉ của môn học/module</strong>
			<table style="background-color: transparent;width: 800px;" border="1">
					<tr style="background-color: transparent;">
						<th rowspan="2" style="width: 20px;">Stt</th>
						<th rowspan="2" style="width: 200px;">Họ và tên học sinh</th>
						<th colspan="${fn:length(SoTayGiaoVien.listThang)}" style="width: 530px;">Tháng</th>
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
							<td>${stt }</td>
							<td>${listHocSinh.hoThanhVien} ${listHocSinh.tenLot } ${listHocSinh.tenThanhVien }</td>
							<c:forEach var="thangList" items="${listHocSinh.thangList}">
								<td>${thangList.tongNgayNghi }</td>
								<c:set var="songaynghi" value="${songaynghi+thangList.tongNgayNghi}"></c:set>
							</c:forEach>
							<td>${songaynghi }</td>
						</tr>
						<c:set var="stt" value="${stt + 1}"></c:set>
					</c:forEach>
				</table>
			<c:choose>
				<c:when test="${SoTayGiaoVien.tinhTrang eq 0}">
					<a href = "javascript: submitForm('U')">								 
						<img src="<%=request.getContextPath()%>/images/buttom/capnhat2.png" alt="Cập Nhật" border = "0" />
					</a>
					<a href = "javascript: submitForm('S')">								 
						<img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="Gửi" border = "0" />
					</a>
				</c:when>
				<c:otherwise>
					<a href = "<%=request.getContextPath() %>/ISO/KeHoachGiangDay/PrintSoTayGiaoVien.jsp">								 
						<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
					</a>
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="action" id="action"/>
			<input type="hidden" name="id" id="id" value="${SoTayGiaoVien.id }"/>
		</form>
		
		
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
		<!-- E FOOT CONTENT -->
	</div>
</body>
</html>