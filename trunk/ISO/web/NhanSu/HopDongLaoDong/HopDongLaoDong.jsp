<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.SysParamsModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HopDongLaoDongDAO"%><html>
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
	<title>Hợp Đồng Lao Động</title>
	<%
		SysParamsModel TGHT = SysParamsDAO.getNgayGioHeThong();
	 %>
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "BO_PHAN_PDT" value = '<%= Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var="MaHoSoDuTuyen" value='<%=HoSoDuTuyenDAO.getMaHSDTByMaThanhVien(session.getAttribute("maThanhVien").toString()) %>'></c:set>
	<c:set var="space" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></c:set>
	
	
	<c:if test="${not empty param.nguoidutuyen}">
		<c:set var="HoSoDuTuyen" scope="session" value='<%=HoSoDuTuyenDAO.getHoSoByID(request.getParameter("nguoidutuyen").toString().trim()) %>'></c:set>
	</c:if>
	<c:if test="${not empty param.vitridutuyen}">
		<c:set var="ViTriDuTuyen" scope="session" value='<%=ChiTietKHTNSDAO.getCTKHTNSByID(request.getParameter("vitridutuyen").toString().trim()) %>'></c:set>
	</c:if>
	<c:if test="${not empty param.id}">
		<c:set var="HopDongLaoDong" scope="session" value='<%=HopDongLaoDongDAO.getHopDongLaoDongByID(request.getParameter("id").toString().trim()) %>'></c:set>
		<c:set var="TruongKhoa" value='<%=HopDongLaoDongDAO.getTK(Integer.parseInt(request.getParameter("id"))) %>' ></c:set>
		<c:if test="${HopDongLaoDong.tinh_trang ne '0' and HopDongLaoDong.tinh_trang ne '4' or maThanhVien ne HopDongLaoDong.nguoi_lap}">
			<c:set var="locktext" value="readonly"></c:set>
			<c:set var="lockbtn" value="disabled"></c:set>		
		</c:if> 
	</c:if>
	
	
	<script language="javascript">
		function submitForm(ac){
			var ThoiGian = document.getElementById("txtThoiGian").value;
			var KetThuc = document.getElementById("txtKetThuc").value;
			var BatDau = document.getElementById("txtBatDau").value;
			var LoaiVienChuc = document.getElementById("txtLoaiVienChuc").value;
			var Bac = document.getElementById("txtBac").value;
			var MaNgach = document.getElementById("txtMaNgach").value;
			var HeSoLuong = document.getElementById("txtHeSoLuong").value;
			
			if(LoaiVienChuc == ""){
				alert("Hãy nhập loại viên chức !!!");
				return;
			}
			
			if(Bac == ""){
				alert("Hãy nhập bậc lương !!!");
				return;
			}else if(!parseInt(Bac)){
				alert("Bậc phải là 1 số nguyên !!!");
				return;
			}else{
				document.getElementById("txtBac").value = parseInt(Bac);
			}
			
			if(MaNgach == ""){
				alert("Hãy nhập mã ngạch !!!");
				return;
			}
			
			if(HeSoLuong == ""){
				alert("Hãy nhập hệ số lương");
				document.getElementById("txtHeSoLuong").forcus();
				return;
			}else if(!parseFloat(HeSoLuong)){
				alert("Hệ số lương phải là 1 số thực");
				document.getElementById("txtLoaiVienChuc").forcus();
				return;
			}else{
				document.getElementById("txtHeSoLuong").value = parseFloat(HeSoLuong);
			}
			
			if(ThoiGian == ""){
				alert("Hãy nhập thời gian thử việc !!!");
				document.getElementById("txtThoiGian").value = "";
				document.getElementById("txtBatDau").value = "";
				document.getElementById("txtKetThuc").value = "";
			} else if(isNaN(ThoiGian)){
				alert("Thời gian phải nhập số !!!");
				document.getElementById("txtThoiGian").value = "";
				document.getElementById("txtBatDau").value = "";
				document.getElementById("txtKetThuc").value = "";
			} else if(ThoiGian<0){
				alert("Thời gian phải là 1 số không âm!!! ");
				document.getElementById("txtThoiGian").value = "";
				document.getElementById("txtBatDau").value = "";
				document.getElementById("txtKetThuc").value = "";
			} else if(BatDau == ""){
				alert("Hãy chọn ngày bắt đầu thử việc !!!");
			} else if(KetThuc == ""){
				alert("Hãy chọn lại ngày bắt đầu thử việc !!!");
			} else {
				
				if(ac=='L'){
					if(confirm("Bạn có chắc chắn muốn Lưu Hợp Đồng này ?")){
						document.getElementById('action').value = "save";
						document.forms['HopDongLaoDong'].submit();
					}else{
						return;
					}	
				}else if(ac=='G'){
					if(confirm("Bạn có chắc chắn muốn Gửi Hợp Đồng này ?")){
						document.getElementById('action').value = "send";
						document.forms['HopDongLaoDong'].submit();
					} else{
						return;
					}
				}else if(ac=='A'){
					if(confirm("Bạn có chắc chắn muốn đồng ý (duyệt) Hợp Đồng này ?")){
						document.getElementById('action').value = "approve";
						document.forms['HopDongLaoDong'].submit();
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
						if(confirm("Bạn có chắc chắn muốn từ chối Hợp Đồng này ?")){
							document.getElementById('txtLyDoReject').value = value;
							document.getElementById('action').value = "reject";
							document.forms['HopDongLaoDong'].submit();
						} else{
							return;
						}
					}
					else {
						return;
					}
				}
				
			}
		}
		
		function layNgayKetThuc(){
			var thoigian = document.getElementById("txtThoiGian").value;
			if(!parseInt(thoigian)){
				alert("Xin hãy nhập số tháng vào ô Thời Gian");
				document.getElementById("txtThoiGian").value = "";
				document.getElementById("txtBatDau").value = "";
				document.getElementById("txtKetThuc").value = "";
				return;
			}else{
				var batdau = document.getElementById("txtBatDau").value;
				var TGHT = "<%=TGHT.getNgayHeThong()  %>" ;
	
				var arr_batdau = batdau.split("-");
				var arr_TGHT = TGHT.split("-");
	
				var value_batdau = parseInt(arr_batdau[0],10)+parseInt(arr_batdau[1],10)*30+parseInt(arr_batdau[2])*365;
				var value_TGHT = parseInt(arr_TGHT[0],10)+parseInt(arr_TGHT[1],10)*30+parseInt(arr_TGHT[2])*365;
	
				if(value_batdau<value_TGHT){
					alert("Thời Gian Bắt Đầu Làm Việc phải sau "+TGHT+" !!!");
					document.getElementById("txtBatDau").value = "";
					return;
				}
				
				var n = batdau.split("-");
				var date = new Date(n[2],n[1],n[0]);
				var ketthuc = new Date(date.getFullYear(),date.getMonth()+parseInt(thoigian),date.getDate());
				var month = ketthuc.getMonth();
				var date = ketthuc.getDate();
				var year = ketthuc.getFullYear();
				
				if(month=="0"){
					month="12";
				}
				if(parseInt(month)<10){
					month = "0"+month;
				}
				if(parseInt(date)<10){
					date = "0"+date;
				}
				document.getElementById("txtKetThuc").value = date+"-"+month+"-"+year;
			}
		}
		
		function resetNgay(){
			var thoigian = document.getElementById("txtThoiGian").value;
			if(!parseInt(thoigian)){
				alert("Xin hãy nhập số tháng vào ô Thời Gian");
				document.getElementById("txtThoiGian").value = "";
				document.getElementById("txtBatDau").value = "";
				document.getElementById("txtKetThuc").value = "";
				return;
			}else{
				document.getElementById("txtBatDau").value = "";
				document.getElementById("txtKetThuc").value = "";
			}
		}
	
	</script>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	<form name="HopDongLaoDong" action="<%=request.getContextPath() %>/hopDongLaoDongController" method="post" >
	<table style="background-color: transparent;margin-bottom: 50px;">
		<tr style="background-color: transparent;">
			<td>
				ỦY BAN NHÂN DÂN QUẬN 5<br/>
				<b>TRƯỞNG TCN KTCN HÙNG VƯƠNG</b><br/>
				--------------------------<br/>
				Số: /HĐLVLĐ 
			</td>
			<td>
				<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>
				<b>Độc Lập - Tự Do - Hạnh Phúc</b><br/>
				--------------------------<br/>
				Quận 5, ngày ${sf:getElement(HopDongLaoDong.ngay_lap_mdy,0,"-")} tháng ${sf:getElement(HopDongLaoDong.ngay_lap_mdy,1,"-")} năm ${sf:getElement(HopDongLaoDong.ngay_HT_duyet_mdy,2,"-")}
			</td>
		</tr>
	</table>
	<table style="background-color: transparent;margin-bottom: 20px;">
		<tr style="background-color: transparent;">
			<td><strong style="font-size: 17px;">HỢP ĐỒNG LÀM VIỆC <c:if test="${HopDongLaoDong.so_lan eq '0'}">LẦN ĐẦU</c:if></strong><br/>--------------------------</td>
		</tr>
		<c:if test="${not empty requestScope.mes}">
			<tr style="background-color: transparent;"><td><font color="red">${requestScope.mes }</font></td></tr>
		</c:if>
		
	</table>	
	<table style="background-color: transparent;font-size: 15px;width: 600px;">		
		<tr style="background-color: transparent;">
			<td style="text-align: left;">
				 ${space }
				 Căn cứ Nghị định số 116/2003/NĐ-CP ngày 10/10/2003 của Chính
				  phủ về tuyển dụng sử dụng và quản lý cán bộ, công chức trong các đơn vị sự
				  nghiệp Nhà nước.
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="text-align: left;">
				${space }Chúng tôi, một bên là ông : Trần Văn Hải<br/>
				${space }Chức vụ : Hiệu Trưởng<br/>
				${space }Đại diện cho Trường Trung cấp nghề Kỹ Thuật Công Nghệ Hùng Vương.<br/>
				${space }Địa chỉ : 161-165 Nguyễn Chí Thanh, phường 12, quận 5,TP HCM.<br/>
				${space }Điện thoại : 8.563.456, 8.558.016<br/>
				${space }Và một bên là <c:choose><c:when test="${HoSoDuTuyen.gioi_tinh eq 'Nam'}">Ông</c:when><c:otherwise>Bà</c:otherwise></c:choose> : ${HopDongLaoDong.ten_nguoi_du_tuyen }<br/>
				${space }Sinh ngày ${HoSoDuTuyen.ngay_sinh_mdy } tại TP HCM<br/>
				${space }Nghề Nghiệp : ${HoSoDuTuyen.ten_vai_tro }<br/>
				${space }Địa chỉ thưởng trú tại : ${HoSoDuTuyen.dia_chi }<br/>
				${space }Nơi ở hiện nay : ${HoSoDuTuyen.dia_chi }<br/>
				${space }Số CMND : ${HoSoDuTuyen.cmnd }, cấp ngày ${HoSoDuTuyen.ngay_cap } tại ${HoSoDuTuyen.noi_cap  } <br/>
				${space }Thỏa thuận ký kết Hợp đồng làm việc <c:if test="${HopDongLaoDong.so_lan eq '0'}">lần đầu</c:if> và cam 
				kết làm đúng những điều khoản sau đây : <br/><br/>
				
 				${space }<b>Điều 1 : Thời hạn và nhiệm vụ hợp đồng.</b><br/><br/>
 				${space }- Thời gian thực hiện hợp đồng : <input type="text" onchange="resetNgay()" value="${HopDongLaoDong.thoi_gian }" maxlength="3" ${locktext} name="txtThoiGian" id="txtThoiGian" style="width: 30px; background-color: transparent;text-align: center" /> tháng<br/>
 				${space }- Từ ngày <input type="text" value="${HopDongLaoDong.bat_dau_mdy }" onchange="layNgayKetThuc()" ${lockbtn} name="txtBatDau" id="txtBatDau" size = 10 readonly="readonly" style="background-color: transparent;"/> 
 				đến ngày <input type="text" value="${HopDongLaoDong.ket_thuc_mdy }" name="txtKetThuc" id="txtKetThuc" ${lockbtn} size = 10 readonly="readonly" style="background-color: transparent;"/><br/>
 				${space }- Địa điểm làm việc : 161-165 Nguyễn Chí Thanh, phường 12, quận 5.<br/>
 				${space }- Chức danh chuyên môn: ${ViTriDuTuyen.vaiTro } <br/>
 				${space }- Nhiệm vụ : Theo bản mô tả công việc<br/><br/>
 				
 				${space }<b>Điều 2 : Chế độ làm việc.</b><br/><br/>
 				${space }- Thời gian làm việc : trong giờ hành chính theo nội qui cơ quan.<br/>
 				${space }- Được trang bị những phương tiện làm việc gồm : cơ sở vật chất phục 
 				${space }vụ việc giảng dạy<br/><br/>
 				
 				${space }<b>Điều 3 : Nghĩa vụ và quyền lợi của người ký hợp đồng làm việc lần đầu.</b><br/><br/>
 				
 				${space }<b>1/ Nghĩa vụ : </b><br/><br/>
 				${space }- Hoàn thành các nhiệm vụ cam kết trong hợp đồng.<br/>
 				${space }- Chấp hành nội quy, quy chế của đơn vị, kỷ luật làm việc và các qui 
 				định của Pháp lệnh cán bộ, công chức.<br/>
 				${space }- Chấp hành việc xử lý kỹ luật và bồi thường thiệt hại theo qui định
 				của pháp luật.<br/><br/>
 				
 				${space }<b>2/ Quyền lợi : </b><br/><br/>
 				${space }- Được hưởng các quyền lợi qui định tại Pháp lệnh cán bộ công chức.<br/>
 				${space }- Phương tiện đi lại làm việc : giáo viên tự lo.<br/>
 				${space }- Thử việc của ngạch (mã số) : 
 				Viên chức loại <input type="text" value="${HopDongLaoDong.loai_vien_chuc }" maxlength="10" ${locktext} name="txtLoaiVienChuc" id="txtLoaiVienChuc" style="width: 50px; background-color: transparent;text-align: center" /> 
 				mã số <input type="text" value="${HopDongLaoDong.ma_ngach }" maxlength="10" ${locktext} name="txtMaNgach" id="txtMaNgach" style="width: 50px; background-color: transparent;text-align: center" />, 
 				Bậc: <input type="text" value="${HopDongLaoDong.bac }" maxlength="10" ${locktext} name="txtBac" id="txtBac" style="width: 50px; background-color: transparent;text-align: center" />,
 				Hệ số lương: <input type="text" value="${HopDongLaoDong.he_so_luong }" maxlength="10" ${locktext} name="txtHeSoLuong" id="txtHeSoLuong" style="width: 50px; background-color: transparent;text-align: center" /> 
 				<c:if test="${HopDongLaoDong.so_lan eq '0'}">(được hưởng 85%)</c:if><br/>
 				${space }- Phụ cấp (nếu có) gồm : theo qui định của nhà nước. 
 				Được trả 1 lần vào các ngày 10 hàng tháng.<br/>
 				${space }- Khoản trả ngoài lương : theo qui định của nhà trường.<br/>
 				${space }- Được trang bị bảo hộ khi làm việc (nếu có) gồm : không.<br/>
 				${space }- Số ngày nghĩ hàng năm được hưởng lương (nghĩ lễ, phép, việc riêng) : 
 				theo qui định của pháp luật.<br/>
 				${space }- Bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp : cơ quan ký 
 				hợp đồng và người lao động đóng theo qui định hiện hành của nhà nước.<br/>
 				${space }- Được hưởng các phúc lợi : không<br/>
 				${space }- Được các khoảng thưởng, đào tạo, bồi dưỡng chuyên môn nghiệp vụ, thực
 				hiện nhiệm vụ hợp tác khoa học, công nghệ với các đơn vị trong hoặc ngoài 
 				nước theo qui định của pháp luật : được tham dự các lớp bồi dưỡng, đào tạo về 
 				chuyên môn, nghiệp vụ liên quan đến công tác giảng dạy do nhà trường tổ chức.<br/>
 				${space }- Được hưởng chế độ thôi việc, trợ cấp thôi việc, bồi thường theo qui 
 				định của Pháp lệnh cán bộ, công chức.<br/>
 				${space }- Có quyền, đề xuất, khiếu nại, thay đổi, đề nghị chấm dứt Hợp đồng 
 				theo qui định của pháp luật.<br/>
 				${space }- Những thỏa thuận khác : thực hiện theo Nghị quyết Hội nghị cán bộ 
 				công chức hàng năm.<br/><br/>
 				
 				${space }<b>Điều 4 : Nghĩa vụ và quyền hạn của người đứng đầu đơn vị sự nghiệp.</b><br/><br/>
 				
 				${space }<b>1/ Nghĩa vụ : </b><br/><br/>
 				
 				${space }- Bảo đảm việc làm và thực hiện đầy đủ những điều đã cam kết trong 
 				hợp đồng làm việc lần đầu.<br/>
 				${space }- Thanh toán đầu đủ, đúng thời hạn các chế độ và quyền lợi của người 
 				ký hợp đồng làm việc lần đầu.<br/><br/>
 				
 				${space }<b>2/ Quyền hạn : </b><br/><br/>
 				
 				${space }- Điều hành người ký hợp đồng làm việc lần đầu hoàn thành nhiệm vụ 
 				theo hợp đồng (Bố trí, điều động, tự điều chỉnh công tác ...)<br/>
 				${space }- Chấm dứt hợp đồng, kỷ luật người ký hợp đồng làm việc lần đầu theo 
 				qui định của Pháp lệnh cán bộ, công chức.<br/><br/>
 				
 				${space }<b>Điều 5 : Điều khoản thi hành </b><br/><br/>
 			
 				${space }- Hợp đồng này làm thành 3 bản có giá trị ngang nhau, mỗi bên giữ 
 				một bản, Phòng Nội Vụ quận 5 giữ một bản và có hiệu lực từ ngày ${HopDongLaoDong.ngay_HT_duyet_mdy }.<br/>
 				${space }- Hợp đồng này làm tại Trường Trung cấp nghề Kỹ thuật Công Nghệ 
 				Hùng Vương ngày ${HopDongLaoDong.ngay_lap_mdy }.<br/><br/>
			</td>
		</tr>
	</table>	
	
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;padding-bottom: 20px;">
			<td style="padding-bottom: 50px;"> 
				<br /><strong>NGƯỜI KÝ HỢP ĐỒNG</strong><br />
				<br /><br />
				<c:if test="${not empty HopDongLaoDong.ngay_NDT_duyet}">
					<b>${HopDongLaoDong.ten_nguoi_du_tuyen }</b>
				</c:if>
			</td>
			<td style="padding-bottom: 50px;"> 
				<br /><strong>HIỆU TRƯỞNG</strong><br />
				<br /><br /><b>${HopDongLaoDong.ten_hieu_truong }</b>
			</td>
		</tr>
	</table>
	
				<c:choose>
					<c:when test="${HopDongLaoDong.tinh_trang eq '0' and maThanhVien eq HopDongLaoDong.nguoi_lap or HopDongLaoDong.tinh_trang eq '4' and maThanhVien eq HopDongLaoDong.nguoi_lap}">
						<a href = "javascript: submitForm('L')"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('G')"><img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="Gửi HT" /> </a>
					</c:when>
					<c:when test="${(HopDongLaoDong.tinh_trang eq '1' or HopDongLaoDong.tinh_trang eq '2') and ((MaBoPhan eq BO_PHAN_BGH and empty HopDongLaoDong.ngay_HT_duyet) or (HopDongLaoDong.nguoi_du_tuyen eq MaHoSoDuTuyen and empty HopDongLaoDong.ngay_NDT_duyet))}">
						<a href = "javascript: submitForm('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Lưu" /> </a>
					</c:when>
					<c:otherwise>
						<c:if test="${HopDongLaoDong.tinh_trang eq '3'}">
							<a href = "<%=request.getContextPath() %>/NhanSu/HopDongLaoDong/PrintHopDongLaoDongTruong.jsp">								 
								<img src="<%=request.getContextPath()%>/images/buttom/intruong.png" alt="Xuất File" border = "0" />
							</a>
							<a href = "<%=request.getContextPath() %>/NhanSu/HopDongLaoDong/PrintHopDongLaoDongQuan5.jsp">								 
								<img src="<%=request.getContextPath()%>/images/buttom/inquan5.png" alt="Xuất File" border = "0" />
							</a> 
						</c:if>
					</c:otherwise>
				</c:choose>
				<input type="hidden" id="action" name="action"/>
				<input type="hidden" id="txtLyDoReject" name="txtLyDoReject"/>
				<input type="hidden" name="txtMaDeNghi" value="${HopDongLaoDong.id }" />
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
<script type="text/javascript">
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtBatDau",
	button            : "Calendar",
	ifFormat          : "%d-%m-%Y"
  });
//]]>
 </script>
</body>
</html>