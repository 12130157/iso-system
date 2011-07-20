<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NhanXetKetQuaThuViecDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO"%><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
	<title>Tự Nhận Xét Kết Qủa Thử Việc</title>
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "nguoiNhanXet" value = '<%=HoSoDuTuyenDAO.getHoSoByTenDangNhap(session.getAttribute("tenDangNhap").toString()) %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var="boPhan" value='<%=KhoaDAO.getKhoaByMaBoPhan(session.getAttribute("maBoPhan").toString()) %>' ></c:set>
	<c:set var="dsVaiTro" value='<%=VaiTroDAO.showAllVaiTro() %>' ></c:set>
	<script language="javascript">
		function submitForm(ac){
			if(ac=='L'){
				if(confirm("Bạn có chắc chắn muốn Lưu Nhận Xét Kết Quả Thử Việc này ?")){
					document.getElementById('action').value = "save";
					document.forms['NhanXetKetQuaThuViec'].submit();
				}else{
					return;
				}	
			}else if(ac=='G'){
				var rong = /\s/g;
				
				var nd1 = document.getElementById("areaNoiDung1").value;
				var val_1 = nd1.replace(rong,"");

				var nd2 = document.getElementById("areaNoiDung2").value;
				var val_2 = nd2.replace(rong,"");

				var nd3 = document.getElementById("areaNoiDung3").value;
				var val_3 = nd3.replace(rong,"");

				var nd4 = document.getElementById("areaNoiDung4").value;
				var val_4 = nd4.replace(rong,"");

				if(val_1==""){
					alert("Hãy nhập nhận xét về phẩm chất đạo đức !!!");
				} else if(val_2==""){
					alert("Hãy nhập nhận xét về năng lực, trình độ và kết quả làm việc, học tập trong thời gian thử việc !!!");
				} else if(val_3==""){
					alert("Hãy nhập nhận xét về ý thức tổ chức chấp hành kỷ luật, nội qui, qui chế của cơ quan !!!");
				} else if(val_4==""){
					alert("Hãy nhập nhận xét về việc chấp hành chủ trương, đường lối, chính sách của Đảng và Nhà nước !!!");
				} else {
					if(confirm("Bạn có chắc chắn muốn Gửi Nhận Xét Kết Quả Thử Việc này ?")){
						document.getElementById('action').value = "send";
						document.forms['NhanXetKetQuaThuViec'].submit();
					} else{
						return;
					}
				}
			}else if(ac=='A'){
				if(confirm("Bạn có chắc chắn muốn đồng ý (duyệt) Nhận Xét Kết Quả Thử Việc này ?")){
					document.getElementById('action').value = "approve";
					document.forms['NhanXetKetQuaThuViec'].submit();
				} else{
					return;
				}	
			}else if(ac=='R'){
				var value = false;
				var chieucao = 200;
				var chieurong = 340;
				var top = screen.availHeight/2-chieucao/2;
				var left = screen.availWidth/2-chieurong/2;
				value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: "+chieucao+"px; dialogWidth: "+chieurong+"px; dialogTop: "+top+"px; dialogLeft: "+left+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
				if(value != false && value != null){
					if(confirm("Bạn có chắc chắn muốn từ chối Nhận Xét Kết Quả Thử Việc này ? ?")){
						document.getElementById('txtLyDoReject').value = value;
						document.getElementById('action').value = "reject";
						document.forms['NhanXetKetQuaThuViec'].submit();
					} else{
						return;
					}
				}
				else {
					return;
				}	
			}
		}
	</script>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	
	<c:choose>
		<c:when test="${not empty param.id}">
		
			<c:set var="NXKQTV" value='<%=NhanXetKetQuaThuViecDAO.getNhanXetById(request.getParameter("id").toString().trim()) %>'></c:set>
			<c:if test="${NXKQTV.tinh_trang ne '0' and NXKQTV.tinh_trang ne '3' or NXKQTV.ma_thanh_vien ne maThanhVien}">
				<c:set var="locktext" value="readonly"></c:set>
			</c:if>
			<form action="<%=request.getContextPath() %>/nhanXetKetQuaThuViecController" method="post" name="NhanXetKetQuaThuViec">
				<table style="background-color: transparent;margin-bottom: 50px;">
					<tr style="background-color: transparent;">
						<td>
							TRƯỞNG TCN KTCN HÙNG VƯƠNG<br/>
							<b>P/K/BM ${NXKQTV.ten_bo_phan}</b><br/>
							--------------------------
						</td>
						<td>
							<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
							<b>Độc Lập - Tự Do - Hạnh Phúc</b><br/>
							--------------------------
						</td>
					</tr>
				</table>
				<table style="background-color: transparent;margin-bottom: 20px;">
					<tr style="background-color: transparent;">
						<td><strong style="font-size: 17px;">BẢN TỰ NHẬN XÉT KẾT QUẢ THỬ VIỆC</strong></td>
					</tr>
					<c:if test="${not empty requestScope.mes}">
						<tr style="background-color: transparent;"><td><font color="red">${requestScope.mes }</font></td></tr>
					</c:if>
				</table>
				<table style="background-color: transparent;margin: 0 0 10px 100px; ">
					<tr style="background-color: transparent;">
						<td style="text-align: left;">
							1/ Họ và tên người thử việc : <b>${NXKQTV.ten_nguoi_nhan_xet }</b> <br/>
							2/ Chức danh : <b>${NXKQTV.ten_vai_tro }</b> <br/>
							3/ Bộ phận : <b>${NXKQTV.ten_bo_phan }</b> <br/>
							4/ Thời gian thử việc : <b>${NXKQTV.thoi_gian_thu_viec }</b> <br/>
							Nay, tôi viết bản tự nhận xét kết quả công việc với các nội dung sau : <br/>
						</td>
					</tr>
				</table>		
				<table style="background-color: transparent;margin-left: 200px;">
					<tr style="background-color: transparent;padding-bottom: 30px;">
						<td colspan="2" style="text-align: left;">
							-	 Về phẩm chất đạo đức : <br/>
									<textarea rows="2" cols="70" ${locktext } style="background-color: transparent;" id="areaNoiDung1" name="areaNoiDung1">${NXKQTV.noidung1 }</textarea><br/>
							-	 Về năng lực, trình độ và kết quả làm việc, học tập trong thời gian thử việc :<br/> 
									<textarea rows="2" cols="70" ${locktext } style="background-color: transparent;" id="areaNoiDung2" name="areaNoiDung2">${NXKQTV.noidung2 }</textarea><br/>
							-	 Về ý thức tổ chức chấp hành kỷ luật, nội qui, qui chế của cơ quan : <br/>
									<textarea rows="2" cols="70" ${locktext } style="background-color: transparent;" id="areaNoiDung3" name="areaNoiDung3">${NXKQTV.noidung3 }</textarea><br/>
							-	 Về việc chấp hành chủ trương, đường lối, chính sách của Đảng và Nhà nước : <br/>
									<textarea rows="2" cols="70" ${locktext } style="background-color: transparent;" id="areaNoiDung4" name="areaNoiDung4">${NXKQTV.noidung4 }</textarea><br/>				
						</td>
					</tr>
				</table>		
				<table style="background-color: transparent;">
					<tr style="background-color: transparent;padding-bottom: 20px;">
						<td style="padding-bottom: 50px;">
							<b>Đánh giá, nhận xét và đề xuất<br/> ký hợp đồng của Trưởng Bộ phận</b><br/>
							<c:if test="${NXKQTV.tinh_trang eq '1' and maThanhVien eq NXKQTV.ma_truong_khoa}">
								<select name="txtGhiChu" id="txtGhiChu">
									<option value="1" >Đề Xuất Ký Hợp Đồng</option>
									<option value="2" >Không Thích Hợp Với Công Việc</option>
								</select>
							</c:if>
							<c:choose>
								<c:when test="${NXKQTV.ghi_chu eq '1'}">
									<br /><br/><br/><b>Đề Xuất Ký Hợp Đồng</b>
								</c:when>
								<c:when test="${NXKQTV.ghi_chu eq '2'}">
									<br /><br/><br/><b>Không Thích Hợp Với Công Việc</b>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</td>
						<td style="padding-bottom: 50px;">
							Quận 5, ngày <input type="text" <c:if test="${NXKQTV.tinh_trang ne '0' }">value="${NXKQTV.ngay_nhan_xet_mdy }"</c:if> name="txtCalendar9" id="txtCalendar9" size = 10 readonly="readonly" style="background-color: transparent;"/> 
							<br /><b>Người thử việc</b><br /><br/><br/>
							<c:if test="${NXKQTV.tinh_trang ne '0' }"><b>${NXKQTV.ten_nguoi_nhan_xet }</b></c:if>
						</td>
					</tr>
					<tr style="background-color: transparent;">
						<td colspan="2"  style="padding-bottom: 50px;">				 
							<br /><b>Thủ trưởng đơn vị phê duyệt</b><br />
							<br />${NXKQTV.ten_nguoi_duyet }
						</td>
					</tr>
				</table>
				<c:choose>
					<c:when test="${NXKQTV.tinh_trang eq '0' and NXKQTV.ma_thanh_vien eq maThanhVien or NXKQTV.tinh_trang eq '3' and NXKQTV.ma_thanh_vien eq maThanhVien}">
						<a href = "javascript: submitForm('L')"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('G')"> 
							<img src="<%=request.getContextPath()%>/images/buttom/guitruongkhoa.png" alt="Gửi Trưởng Khoa" border = "0" />
						</a>
					</c:when>
					<c:when test="${NXKQTV.tinh_trang eq '1' and maThanhVien eq NXKQTV.ma_truong_khoa}">
						<a href = "javascript: submitForm('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Lưu" /> </a>
					</c:when>
					<c:otherwise>
						<c:if test="${MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN or maThanhVien eq TruongKhoa}">
							<a href = "<%=request.getContextPath() %>/NhanSu/Intro.jsp">								 
								<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
							</a>
						</c:if>
					</c:otherwise>
				</c:choose>
				<input type="hidden" id="MaNhanXet" name="MaNhanXet" value="${param.id }"></input>
				<input type="hidden" id="action" name="action"></input>
				<input type="hidden" id="txtLyDoReject" name="txtLyDoReject" ></input>
			</form>
		</c:when>
		<c:when test="${not empty param.error}">
			<c:choose>
				<c:when test="${param.error eq 'DNKTV'}">
					<div style="height: 350px;font-size: 25px;font-weight: bold;text-align: center;padding-top: 50px;" >
						Bạn chưa phải là Nhân Viên Thử Việc<br/>
						Hãy quay lại sau !!!
					</div>
				</c:when>
				<c:when test="${param.error eq 'KetThuc'}">
					<c:set var="KetThuc" value="${requestScope.KetThuc}"></c:set>
					<div style="height: 350px;font-size: 25px;font-weight: bold;text-align: center;padding-top: 50px;" >Bạn chưa thử việc xong<br/> Hãy quay lại sau ${KetThuc}.</div>
				</c:when>
			</c:choose>
		</c:when>
	</c:choose>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>