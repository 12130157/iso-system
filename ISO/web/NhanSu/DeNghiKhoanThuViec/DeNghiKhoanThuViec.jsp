<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.SysParamsModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%><html>
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
	<title>Đề Nghị Khoán Thử Việc</title>
	<%
		SysParamsModel TGHT = SysParamsDAO.getNgayGioHeThong();
	 %>
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "BO_PHAN_PDT" value = '<%= Constant.BO_PHAN_PDT %>'></c:set>
	
	
	
	<c:if test="${not empty param.nguoidutuyen}">
		<c:set var="HoSoDuTuyen" scope="session" value='<%=HoSoDuTuyenDAO.getHoSoByID(request.getParameter("nguoidutuyen").toString().trim()) %>'></c:set>
	</c:if>
	<c:if test="${not empty param.vitridutuyen}">
		<c:set var="ViTriDuTuyen" scope="session" value='<%=ChiTietKHTNSDAO.getCTKHTNSByID(request.getParameter("vitridutuyen").toString().trim()) %>'></c:set>
	</c:if>
	<c:if test="${not empty param.id}">
		<c:set var="DeNghiKTV" scope="session" value='<%=DeNghiKhoanThuViecDAO.getDeNghiKTVByID(request.getParameter("id").toString().trim()) %>'></c:set>
		<c:set var="TruongKhoa" value='<%=DeNghiKhoanThuViecDAO.getTK(Integer.parseInt(request.getParameter("id"))) %>' ></c:set>
		<c:if test="${DeNghiKTV.tinh_trang ne '0' and DeNghiKTV.tinh_trang ne '6' or maThanhVien ne TruongKhoa}">
			<c:set var="locktext" value="readonly"></c:set>
			<c:set var="lockbtn" value="disabled"></c:set>				
		</c:if> 
	</c:if>
	
	
	<script language="javascript">
		function submitForm(ac){
			var ThoiGian = document.getElementById("txtThoiGian").value;
			var Luong = document.getElementById("txtLuong").value;
			var KetThuc = document.getElementById("txtKetThuc").value;
			var BatDau = document.getElementById("txtBatDau").value;
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
			} else if(Luong == ""){
				alert("Hãy nhập lương thử việc !!!");
			} else {
				
				if(ac=='L'){
					document.getElementById('action').value = "new";
					document.forms['DeNghiKTV'].submit();
				}else if(ac=='G'){
					if(confirm("Bạn có chắc chắn muốn Gửi Đề Nghị Khoán Thử Việc này ?")){
						document.getElementById('action').value = "send";
						document.forms['DeNghiKTV'].submit();
					} else{
						return;
					}
				}else if(ac=='A'){
					if(confirm("Bạn có chắc chắn muốn đồng ý (duyệt) Đề Nghị này ?")){
						document.getElementById('action').value = "approve";
						document.forms['DeNghiKTV'].submit();
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
						if(confirm("Bạn có chắc chắn muốn từ chối Đề Nghị này ?")){
							document.getElementById('txtLyDoReject').value = value;
							document.getElementById('action').value = "reject";
							document.forms['DeNghiKTV'].submit();
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
				}else if((value_batdau-value_TGHT)<5){
					alert("Khoảng cách giữa ngày hiện tại và ngày bắt đầu làm ít nhất phải lớn hơn 5 !!!");
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
					year = parseInt(year)-1;
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
		
		function formatLuong(){
			var value = document.getElementById("txtLuong").value;
			var test = /\s/g;
			var Luong = value.replace(test,"");
			var cut = Luong.split(".");
			for(var i=0;i<cut.length;i++){
				if(i==0){
					Luong = "";
				}
				Luong = Luong+cut[i];
			}
			if(isNaN(Luong)){
				alert("Lương phải nhập số");
				document.getElementById("txtLuong").value = "";
				return;
			}else if(parseInt(Luong)<=0){
				alert("Lương phải lớn hơn 0 và là 1 số nguyên không âm");
				document.getElementById("txtLuong").value = "";
				return;
			}
			var leng = Luong.length;
			var text = "";
			var des = leng%3;
			for(var n = 0; n < leng; n++){
				if(des==0){
					if(n==leng-1){
						text = text+Luong.charAt(n);
					} else if((n+1)%3==0){
						text = text+Luong.charAt(n)+".";
					} else{
						text = text+Luong.charAt(n);
					}
				} else{
					if(n==leng-1){
						text = text+Luong.charAt(n);
					} else if((n-(des-1))%3==0 && n>2 || n<2 && n==des-1){
						text = text+Luong.charAt(n)+".";
					} else{
						text = text+Luong.charAt(n);
					}
				}
			}
			document.getElementById("txtLuong").value = text;
		}
			
		function checkChucDanh(){
			<%
				String chucDanh = ChiTietKHTNSDAO.getMaChucDanhByMaCTKHTNS(request.getParameter("vitridutuyen").toString().trim());
				if(!chucDanh.equals("8")){
					out.print("document.getElementById('pdt').style.display = 'none';");
				}
			%>
		}
	</script>
</head>
<body onload="formatLuong(),checkChucDanh()">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	<form name="DeNghiKTV" action="<%=request.getContextPath() %>/deNghiKTVController" method="post" >
	<table style="background-color: transparent;margin-bottom: 50px;">
		<tr style="background-color: transparent;">
			<td>
				TRƯỞNG TCN KTCN HÙNG VƯƠNG<br/>
				<b>P/K/BM ${HoSoDuTuyen.ten_bo_phan }</b><br/>
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
			<td><strong style="font-size: 17px;">ĐỀ NGHỊ KHOÁN THỬ VIỆC NHÂN SỰ</strong></td>
		</tr>
		<c:if test="${not empty requestScope.mes}">
			<tr style="background-color: transparent;"><td><font color="red">${requestScope.mes }</font></td></tr>
		</c:if>
	</table>
	<table style="background-color: transparent;margin: 0 0 10px 80px;">
		<tr style="background-color: transparent;">
			<td>Kính Gửi :<br/><br/><br/></td>
			<td style="text-align: left">
				- Hiệu Trưởng Trường Trung Cấp Nghề KTCN Hùng Vương<br/>
				- Trưởng Phòng Tổ Chức Hành Chánh Quản Trị<br/>
				- Trưởng Phòng Đào Tạo
			</td>
		</tr>
	</table>	
	<table style="background-color: transparent;margin: 0 0 10px 50px;">
		<tr style="background-color: transparent;">
			<td style="margin-left: 50px; text-align: right">
				Căn cứ Giấy đề xuất tuyển dụng nhân sự ngày 
					<b>${ViTriDuTuyen.ngay_cap_nhat_cuoi }</b>
				đã được Hiệu trưởng phê duyệt, sau thời gian
			</td>
		</tr>		
		<tr style="background-color: transparent;">
			<td colspan="2" style="text-align: left; margin-left: 50px;">
				<p>
				tìm kiếm nhân sự làm việc cho chức danh 	
					<b>${ViTriDuTuyen.vaiTro }</b>
				Nay Phòng/Khoa/Bộ môn 
					<b>${ViTriDuTuyen.boPhan }</b>
				đề nghị Hiệu trưởng khoán thử việc theo chức danh trên, đối với : 
				</p>
			</td>
		</tr>
	</table>	
	<table style="background-color: transparent;padding-left: 50px;">
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;">-	Anh (Chị) : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.ho_ten }</b></td>		
		</tr>		
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;">-	Ngày sinh : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.ngay_sinh_mdy }</b></td>		
		</tr>
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;">-	Địa chỉ tường chú : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.dia_chi }</b></td>		
		</tr>
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;">-	Nơi ở hiện nay :</td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.dia_chi }</b></td>		
		</tr>
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;">-	Trình độ :</td>		
		</tr>		
	</table>	
	
	<table style="background-color: transparent; padding-left: 80px;">
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;width: 200px;">* 	Học vấn : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.trinh_do_van_hoa }</b></td>		
		</tr>		
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;">* 	Chuyên môn, nghiệp vụ  : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.chuyen_mon }</b></td>		
		</tr>
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;">* 	Tin học :  </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.tin_hoc }</b></td>		
		</tr>
		<tr style="background-color: transparent;padding-bottom: 5px;">
			<td style="text-align: left;">*  	Ngoại ngữ : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.ngoai_ngu }</b></td>		
		</tr>
		<tr style="background-color: transparent;padding-bottom: 5px;min-height: 50px;">
			<td style="text-align: left;vertical-align: top;">*  	Kinh nghiệm thực tiễn (nếu có) : </td>
			<td style="text-align: left;"><b>${HoSoDuTuyen.tom_tat_ban_than }</b></td>		
		</tr>		
	</table>	
	<table style="background-color: transparent;padding-left: 50px;">
		<tr style="background-color: transparent;">
			<td colspan="2" style="text-align: left;">	
			-	Thời gian làm việc : 
					<input type="text" value="${DeNghiKTV.thoi_gian }" maxlength="3" onchange="resetNgay()" ${locktext} name="txtThoiGian" id="txtThoiGian" style="width: 80px; background-color: transparent;text-align: center" /> Tháng (từ ngày  
					<input type="text" value="${DeNghiKTV.bat_dau_mdy }" onchange="layNgayKetThuc()" ${lockbtn} name="txtBatDau" id="txtBatDau" size = 10 readonly="readonly" style="background-color: transparent;"/>
				đến ngày : 
					<input type="text" value="${DeNghiKTV.ket_thuc_mdy }" name="txtKetThuc" id="txtKetThuc" ${lockbtn} size = 10 readonly="readonly" style="background-color: transparent;"/>
					<br/>
			-	Lương khoán : <input type="text" ${locktext} onchange="formatLuong()" value="${DeNghiKTV.luong_khoan }" name="txtLuong" id="txtLuong" style="width: 80px; background-color: transparent;text-align: center" /> đồng/ tháng.
			</td>
		</tr>
	</table>
	
	<table style="background-color: transparent;margin: 0 0 30px 50px;">
		<tr style="background-color: transparent;">
			<td style="margin-left: 50px; text-align: left">
				Phòng/Khoa/Bộ môn  
					<b>${HoSoDuTuyen.ten_bo_phan }</b>
				sẽ hướng dẫn, theo dõi anh(chị) <b>${HoSoDuTuyen.ho_ten }</b>
				làm việc và sẽ đề nghị ký hợp đồng nếu thích ứng công việc.<br/>
			</td>
		</tr>
	</table>
	
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;padding-bottom: 20px;">
			<td style="padding-bottom: 50px;">
				ngày <input type="text" size = 10 readonly="readonly" value="${DeNghiKTV.ngay_HC_duyet_mdy }" style="background-color: transparent;"/> 
				<br /><strong>TRƯỞNG PHÒNG TCHCQT</strong><br />
				<br />${DeNghiKTV.ten_phong_HC }
			</td>
			<td style="padding-bottom: 50px;" id="pdt">
				ngày <input type="text" size = 10 readonly="readonly" value="${DeNghiKTV.ngay_DT_duyet_mdy }" style="background-color: transparent;"/> 
				<br /><strong>TRƯỞNG PHÒNG ĐÀO TẠO</strong><br />
				<br />${DeNghiKTV.ten_phong_DT }
			</td>
			<td style="padding-bottom: 50px;">
				Quận5,ngày <input type="text" size = 10 readonly="readonly" value="${DeNghiKTV.ngay_TK_duyet_mdy }" style="background-color: transparent;"/> 
				<br /><strong> TRƯỞNG P/K/BM </strong><b> ${boPhan.tenKhoa } </b><br />
				<br />
				<c:if test="${DeNghiKTV.tinh_trang ne '0'}">
				${DeNghiKTV.ten_truong_khoa }
				</c:if>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="3"  style="padding-bottom: 50px;">
				ngày <input type="text" size = 10 readonly="readonly" value="${DeNghiKTV.ngay_HT_duyet_mdy }" style="background-color: transparent;"/> 
				<br /><strong>HIỆU TRƯỞNG</strong><br />
				<br />${DeNghiKTV.ten_hieu_truong }
			</td>
		</tr>
	</table>
				<c:choose>
					<c:when test="${DeNghiKTV.tinh_trang eq '0' and maThanhVien eq TruongKhoa or DeNghiKTV.tinh_trang eq '6' and maThanhVien eq TruongKhoa}">
						<a href = "javascript: submitForm('L')"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('G')"><img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="Gửi HT" /> </a>
					</c:when>
					<c:when test="${ViTriDuTuyen.maVaiTro ne '8' and MaBoPhan eq BO_PHAN_PDT}">
						<a href = "<%=request.getContextPath() %>/NhanSu/HopDongLaoDongLanDau/PrintHopDongLaoDongLanDau.jsp">								 
							<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
						</a>
					</c:when>
					<c:when test="${(DeNghiKTV.tinh_trang eq '2' or DeNghiKTV.tinh_trang eq '3') and (MaBoPhan eq BO_PHAN_PDT and empty DeNghiKTV.phong_DT or MaBoPhan eq BO_PHAN_PHC and empty DeNghiKTV.phong_HC) or DeNghiKTV.tinh_trang eq '4' and MaBoPhan eq BO_PHAN_BGH}">
						<a href = "javascript: submitForm('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Lưu" /> </a>
					</c:when>
					<c:otherwise>
						<c:if test="${MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN or maThanhVien eq TruongKhoa}">
							<a href = "<%=request.getContextPath() %>/NhanSu/DeNghiKhoanThuViec/PrintDeNghiKhoanThuViec.jsp">								 
								<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
							</a>
						</c:if>
					</c:otherwise>
				</c:choose>
				<input type="hidden" id="action" name="action"/>
				<input type="hidden" id="txtLyDoReject" name="txtLyDoReject"/>
				<input type="hidden" name="txtMaDeNghi" value="${DeNghiKTV.id }" />
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