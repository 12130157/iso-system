<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/nhansu.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<c:set var="boPhan" value='<%=session.getAttribute("maBoPhan").toString() %>'></c:set>
<c:set var="BO_PHAN_PHC" value='<%=Constant.BO_PHAN_PHC %>'></c:set>
<c:set var="vaiTro" value='<%=session.getAttribute("maVaiTro").toString() %>'></c:set>
<title>Chi Tiết Nhân Sự</title>
<c:if test="${not empty param.maThanhVien}">
	<c:set var="ChiTietThanhVien" value = '<%= ThanhVienDAO.getThongTinByMaThanhVien(request.getParameter("maThanhVien")) %>' scope="session"></c:set>
</c:if>
<script language="javascript">
	function openBoSung(){
		var TV = new Object;
		var top = screen.height/2 - 200;
		var left = screen.width/2 - 350;
		TV = window.showModalDialog('boSungKhenThuongKyLuat.jsp?maThanhVien=<%=request.getParameter("maThanhVien") %>',this,"dialogHeight: 400px; dialogWidth: 700px; dialogTop: "+top+"px; dialogLeft: "+left+"px; edge: Raised; center: Yes; help: No; scroll: Yes; status: No;");
		if(TV == null){
			location.href = '<%=request.getContextPath() %>/NhanSu/TimKiemNhanSu/ChiTietNhanSu.jsp?maThanhVien=<%=request.getParameter("maThanhVien") %>';
		}
	}
</script>
</head>
<body>
	<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
		<table>
			<tr style="background-color: transparent;"><td style="text-align: center;font-size: 16px;font-weight: bold;font-style: italic;"><br/>Bạn Đang Xem Thông Tin Chi Tiết Của ${ChiTietThanhVien.hoTen }<br/></td></tr>
		</table>
		<table border="1">
			<tr style="background-color: #696565;font-size: 16px;font-weight: bold;font-style: italic;">
				<td colspan="2" style="text-align: left;padding-left: 20px;">Chi Tiết</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px" style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Họ và Tên</td>
				<td style="text-align: left;padding-left: 10px;">${ChiTietThanhVien.hoTen}</td>
			</tr>
			<tr style="background-color: transparent;">
				<td height="30px" style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">Địa Chỉ</td>
				<td style="text-align: left;padding-left: 10px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.soNha}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
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
						<c:when test="${empty ChiTietThanhVien.ngaySinh}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
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
						<c:when test="${empty ChiTietThanhVien.email}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
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
						<c:when test="${empty ChiTietThanhVien.chungMinhNhanDan}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
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
				<td colspan="2" style="text-align: left;padding-left: 20px;font-weight: bold;">Lương</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2">
					<table border="1">
						<tr style="background-color: transparent;">
							<td style="width: 150px;text-align: center;font-weight: bold;">Loại Viên Chức</td>
							<td style="width: 100px;text-align: center;font-weight: bold;">Mã Ngạch</td>
							<td style="width: 50px;text-align: center;font-weight: bold;">Bậc Lương</td>
							<td style="width: 50px;text-align: center;font-weight: bold;">Hệ Số Lương</td>
							<td style="width: 100px;text-align: center;font-weight: bold;">Ngày Xếp Lương</td>
						</tr>
						<c:set var="n" value="1"></c:set>
						<c:forEach var="model" items="${ChiTietThanhVien.listLuong}">
						<c:choose>
							<c:when test="${n eq 1}">
								<tr style="background-color: red;">
							</c:when>
							<c:otherwise>
								<tr style="background-color: transparent;">
							</c:otherwise>
						</c:choose>
							<td style="text-align: center;">
								<c:choose>
									<c:when test="${empty model.loaiVienChuc}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.loaiVienChuc}
									</c:otherwise>
								</c:choose>
							</td>
							<td style="text-align: left;padding-left: 5px;">
								<c:choose>
									<c:when test="${empty model.maNgach}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.maNgach}
									</c:otherwise>
								</c:choose>
							</td>
							<td style="text-align: left;padding-left: 5px;">
								<c:choose>
									<c:when test="${empty model.bacLuong}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.bacLuong}
									</c:otherwise>
								</c:choose>
							</td>
							<td style="text-align: center;">
								<c:choose>
									<c:when test="${empty model.heSoLuong}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.heSoLuong}
									</c:otherwise>
								</c:choose>
							</td>
							<td style="text-align: center;">
								<c:choose>
									<c:when test="${empty model.ngayXepLuong}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.ngayXepLuong}
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<c:set var="n" value="${n+1}"></c:set>
						</c:forEach>
					</table>
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
							<td style="width: 300px;text-align: center;font-weight: bold;">Trường Cấp</td>
							<td style="width: 100px;text-align: center;font-weight: bold;">Chuyên Ngành</td>
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
							<td style="text-align: left;padding-left: 5px;">
								<c:choose>
									<c:when test="${empty model.chuyenNganh}"><p style="font-style: italic;color: red;">Chưa có</p></c:when>
									<c:otherwise>
										${model.chuyenNganh}
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
				<td valign="top"  style="width: 120px;text-align: right;padding-right: 5px;font-weight: bold;">
				<c:choose>
					<c:when test="${boPhan eq BO_PHAN_PHC}">
						<a style="text-decoration:none;color: red;" href="javascript: openBoSung();">Khen Thưởng/ Kỷ Luật</a> 		
					</c:when>
					<c:otherwise>
						Khen Thưởng/ Kỷ Luật 
					</c:otherwise>
				</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.listKhenThuongKyLuat}">
							<p style="font-style: italic;color: red;padding-left: 10px;" align="left">Chưa có</p>
						</c:when>
						<c:otherwise>
							<table border="1" style="width: 580px;">
								<tr style="background-color: transparent;">
									<td style="width: 100px;max-width:100px;font-weight: bold;">Năm</td>
									<td style="width: 240px;max-width:240px;font-weight: bold;">Khen Thưởng</td>
									<td style="width: 240px;max-width:240px;font-weight: bold;">Kỹ Luật</td>
								</tr>
								<c:set var="n" value="1"></c:set>
								<c:set var="khenthuong" value=""></c:set>
								<c:set var="kyluat" value=""></c:set>
								<c:set var="listKTKLlength" value="${fn:length(ChiTietThanhVien.listKhenThuongKyLuat)}"></c:set>
								<c:forEach var="listKhenThuongKyLuat" items="${ChiTietThanhVien.listKhenThuongKyLuat}">
									
									<c:if test="${n eq '1'}">
										<c:set var="Nam1" value="${listKhenThuongKyLuat.namHoc}"></c:set>
										<c:set var="Nam2" value="${listKhenThuongKyLuat.namHoc}"></c:set>
									</c:if>
									<c:choose>
										<c:when test="${Nam1 ne Nam2}">
											<tr style="background-color: transparent;">
												<td width="100px" valign="top" style="max-width:100px;text-align: center;">${Nam1}</td>
												<td width="240px" valign="top" style="max-width:240px;text-align: left;padding-left: 5px;">${khenthuong }</td>
												<td width="240px" valign="top" style="max-width:240px;text-align: left;padding-left: 5px;">${kyluat }</td>
											</tr>
											<c:set var="khenthuong" value=""></c:set>
											<c:set var="kyluat" value=""></c:set>
											<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '1'}">
												<c:set var="khenthuong" value="${listKhenThuongKyLuat.ghiChu}-<b>${listKhenThuongKyLuat.tenChucVu }</b><br/><br/>"></c:set>
											</c:if>
											<c:if test="${listKhenThuongKyLuat.loaiGhiChu eq '0'}">
												<c:set var="kyluat" value="${listKhenThuongKyLuat.ghiChu}-<b>${listKhenThuongKyLuat.tenChucVu }</b><br/><br/>"></c:set>
											</c:if>
											<c:set var="Nam1" value="${listKhenThuongKyLuat.namHoc}"></c:set>
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
											<td width="100px" valign="top" style="max-width:100px;text-align: center;">${Nam1 }</td>
											<td width="240px" valign="top" style="max-width:240px;text-align: left;padding-left: 5px;">${khenthuong }</td>
											<td width="240px" valign="top" style="max-width:240px;text-align: left;padding-left: 5px;">${kyluat }</td>
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
				<td style="width: 580px;">
					<c:choose>
						<c:when test="${empty ChiTietThanhVien.listLopHocGiangDay}"><p style="font-style: italic;color: red;padding-left: 10px;" align="left">Chưa có</p></c:when>
						<c:otherwise>
								<table border="1"  style="width: 580px;">
									<tr style="background-color: transparent;">
										<td style="width: 120px;font-weight: bold;">Năm Học</td>
										<td style="width: 240px;font-weight: bold;">Tên Môn Học</td>
										<td style="width: 70px;font-weight: bold;">Tên Lớp</td>
										<td style="width: 70px;font-weight: bold;">Học Kì</td>
										<td style="width: 80px;font-weight: bold;">Số Tiết</td>
									</tr>
									<c:set var="total" value="0"></c:set>
									<c:forEach var="LopHocGiangDay" items="${ChiTietThanhVien.listLopHocGiangDay}">
										<c:set var="tongtiet" value="0"></c:set>
										<c:set var="tongtiet" value="${tongtiet+LopHocGiangDay.soGioLT}"></c:set>
										<c:set var="tongtiet" value="${tongtiet+LopHocGiangDay.soGioTH}"></c:set>
										<tr style="background-color: transparent;">
											<td>${LopHocGiangDay.namHoc }</td>
											<td style="text-align: left;padding-left: 5px;">${LopHocGiangDay.tenMonHoc }</td>
											<td>${LopHocGiangDay.kiHieuLop }</td>
											<td>${LopHocGiangDay.hocKi }</td>
											<td>${tongtiet }</td>
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
		
		<c:if test="${boPhan eq BO_PHAN_PHC}">
			<a style="text-decoration: none;" href="<%=request.getContextPath() %>/NhanSu/HoSoDuTuyen/NhapThongTin.jsp?maThanhVien=${ChiTietThanhVien.maThanhVien}">
				<img src="<%=request.getContextPath()%>/images/buttom/capnhatthongtin.png" alt="Xuất File" border = "0" />
			</a>
		</c:if>
		
		<c:if test="${not empty param.maThanhVien}">
			<br/>
			<a href = "<%=request.getContextPath() %>/NhanSu/TimKiemNhanSu/PrintChiTietNhanSu.jsp">								 
				<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
			<br/>
		</c:if>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
	</div>
</body>
</html>