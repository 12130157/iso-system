<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DonXinThoiViecDAO"%><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp"></meta>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
	<title>ĐƠN XIN THÔI VIỆC</title>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "BO_PHAN_PDT" value = '<%= Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var="space" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></c:set>
	<c:set var="DonXinThoiViec" value='<%=DonXinThoiViecDAO.getDonXinThoiViecByMaDonXinThoiViec(request.getParameter("id")) %>' scope="session"></c:set>
	<c:set var="HopDongLaoDong" value="${DonXinThoiViec.hopDongLaoDong}" scope="session"></c:set>
	<script language="javascript">
		function submitForm(ac){
			if(ac=='L'){
				document.getElementById("action").value = "save";
				document.forms["DonXinThoiViec"].submit();
			}
			
			var lyDo = document.getElementById("txtLyDo").value;
			var ngayThoiViec = document.getElementById("txtNgayThoiViec").value;
			
			var rong = /\s/g;
			
			if(lyDo.replace(rong,"")==""){
				alert("Hãy nhập lý do thôi việc !!!");
				return;
			}
			
			if(ngayThoiViec==""){
				alert("Hãy chọn ngày thôi việc !!!");
				return;
			}
			
			if(ac=='G'){
				document.getElementById("action").value = "send";
				document.forms["DonXinThoiViec"].submit();
			}
			
			if(ac=='A'){
				document.getElementById("action").value = "approve";
				document.forms["DonXinThoiViec"].submit();
			}
			
			if(ac=='R'){
				var value = false;
				var chieucao = 200;
				var chieurong = 340;
				var top = screen.availHeight/2-chieucao/2;
				var left = screen.availWidth/2-chieurong/2;
					
				value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: "+chieucao+"px; dialogWidth: "+chieurong+"px; dialogTop: "+top+"px; dialogLeft: "+left+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
				if(value != false && value != null){
					if(confirm("Bạn có chắc chắn muốn Từ chối Đề Nghị Nhân Sự này ?")){
						document.getElementById('txtLyDoReject').value = value;
						document.getElementById('action').value = "reject";
						document.forms['DonXinThoiViec'].submit();
					} else{
						return;
					}
				}
				else {
					return;
				}		
			}
		}
		
		function checkChucDanh(){
			var chucDanh = ${DonXinThoiViec.maVaiTro};
			if(chucDanh=="8"){
				document.getElementById("pdt").style.display = "inline";
			}else{
				document.getElementById("pdt").style.display = "none";
			}
		}
	</script>
</head>
<body onload="checkChucDanh()">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form action="<%=request.getContextPath() %>/donXinThoiViecController" method="post" name="DonXinThoiViec">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td>
					<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b></br>
					<b>Độc Lập - Tự Do - Hạnh Phúc</b></br>
					--------------------------
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td>
					<strong style="font-size: 25px;"><br/><br/>ĐƠN XIN THÔI VIỆC<br/>(CHẤM DỨT HỢP ĐỒNG LÀM VIỆC)<br/><br/></strong>
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;width: 600px;">
			<tr style="background-color: transparent;">
				<td valign="top">Kính Gửi :</td>
				<td style="text-align: left">
					- Hiệu Trưởng Trường Trung Cấp Nghề KTCN Hùng Vương<br/>
					- Trưởng Phòng Tổ Chức Hành Chánh Quản Trị<br/>
					<c:if test="${DonXinThoiViec.maVaiTro eq '8'}">- Trưởng Phòng Đào Tạo<br/></c:if>
					- Trưởng Bộ Phận ${DonXinThoiViec.tenBoPhan }<br/><br/>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2" style="text-align: left;">
					${space }Tôi tên là : ${DonXinThoiViec.tenNguoiDuTuyen }<br/><br/>
					${space }Giới Tính : ${DonXinThoiViec.gioiTinh }<br/><br/>
					${space }Ngày tháng năm sinh : ${DonXinThoiViec.ngaySinh }<br/><br/>
					${space }Là viên chức chức danh , đang ký hợp đồng làm việc có thời hạn(${HopDongLaoDong.thoi_gian } tháng) 
					với nhà trường (từ ngày ${HopDongLaoDong.bat_dau_mdy } đến ngày ${HopDongLaoDong.ket_thuc_mdy }) tại bộ phận ${DonXinThoiViec.tenBoPhan }. <br/><br/>
					${space }Nay tôi làm đơn này kính đề nghị Ban Giám Hiệu, Phòng Tổ Chức Hành Chánh Quản Trị,
					Phòng Đạo Tạo, Bộ Phận ${DonXinThoiViec.tenBoPhan } cho tôi được thôi việc (hoặc chấm dứt hợp đồng làm việc) 
					kể từ ngày <input type="text" name="txtNgayThoiViec" id="txtNgayThoiViec" value="${DonXinThoiViec.ngayThoiViecDMY }" /><br/><br/>
					${space }Lý do : <br/>
					${space }<textarea rows="2" cols="60" id="txtLyDo" name="txtLyDo">${DonXinThoiViec.lyDo }</textarea><br/>
					${space }Rất mong được sự chấp thuận của Ban Giám Hiệu.
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2" style="text-align: center;padding-left: 400px;">
					<c:if test="${not empty DonXinThoiViec.ngayLap}">
					Ngày ${sf:getElement(DonXinThoiViec.ngayLapDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayLapDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayLapDMY,2,'-')}<br/>
					</c:if>
					Kính đơn<br/><br/><br/>
					<c:if test="${DonXinThoiViec.tinhTrang ne '0' and DonXinThoiViec.tinhTrang ne '6'}">
						${DonXinThoiViec.tenNguoiDuTuyen }
					</c:if>
					<br/><br/>
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;padding-bottom: 20px;">
				<td style="padding-bottom: 50px;">
					<c:if test="${not empty DonXinThoiViec.ngayHCduyet}">
					ngày ${sf:getElement(DonXinThoiViec.ngayHCduyetDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayHCduyetDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayHCduyetDMY,2,'-')}<br/>
					</c:if> 
					<br /><strong>TRƯỞNG PHÒNG TCHCQT</strong><br />
					<br /><b>${DonXinThoiViec.tenPhongHC }</b>	
				</td>
				<td style="padding-bottom: 50px;display: none;" id="pdt">
					<c:if test="${not empty DonXinThoiViec.ngayDTduyet}">
					ngày ${sf:getElement(DonXinThoiViec.ngayDTduyetDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayDTduyetDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayDTduyetDMY,2,'-')}<br/>
					</c:if>  
					<br /><strong>TRƯỞNG PHÒNG ĐÀO TẠO</strong><br />
					<br /><b>${DonXinThoiViec.tenPhongDT }</b>
				</td>
				<td style="padding-bottom: 50px;">
					<c:if test="${not empty DonXinThoiViec.ngayTKduyet}">
					Quận 5, ngày ${sf:getElement(DonXinThoiViec.ngayTKduyetDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayTKduyetDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayTKduyetDMY,2,'-')}<br/>
					</c:if> 
					<br /><strong>TRƯỞNG P/K/BM ${boPhan.tenKhoa }</strong><br />
					<br /><b>${DonXinThoiViec.tenTruongKhoa }</b>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="3"  style="padding-bottom: 50px;">
					<c:if test="${not empty DonXinThoiViec.ngayHTduyet}">
					ngày ${sf:getElement(DonXinThoiViec.ngayHTduyetDMY,0,'-')} tháng ${sf:getElement(DonXinThoiViec.ngayHTduyetDMY,1,'-')} năm ${sf:getElement(DonXinThoiViec.ngayHTduyetDMY,2,'-')}<br/>
					</c:if>  
					<br /><strong>HIỆU TRƯỞNG</strong><br />
					<br /><b>${DonXinThoiViec.tenHieuTruong }</b>
				</td>
			</tr>
		</table>
		
		<c:choose>
			<c:when test="${DonXinThoiViec.tinhTrang eq '0' and maThanhVien eq DonXinThoiViec.maThanhVien or DonXinThoiViec.tinhTrang eq '6' and maThanhVien eq DonXinThoiViec.maThanhVien}">
				<a href = "javascript: submitForm('L')"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu" /> </a>
				<a href = "javascript: submitForm('G')"><img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="Gửi HT" /> </a>
			</c:when>
			<c:when test="${DonXinThoiViec.maVaiTro ne '8' and MaBoPhan eq BO_PHAN_PDT }">
				<a href = "<%=request.getContextPath() %>/NhanSu/DeNghiTuyenNhanSu/PrintDonXinThoiViec.jsp">								 
					<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
				</a>
			</c:when>
			<c:when test="${((DonXinThoiViec.tinhTrang eq '2' or DonXinThoiViec.tinhTrang eq '3') and ((MaBoPhan eq BO_PHAN_PDT and empty DonXinThoiViec.phongDT) or (MaBoPhan eq BO_PHAN_PHC and empty DonXinThoiViec.phongHC))) or (DonXinThoiViec.tinhTrang eq '4' and MaBoPhan eq BO_PHAN_BGH) or (DonXinThoiViec.tinhTrang eq '1' and maThanhVien eq DonXinThoiViec.maTruongKhoa)}">
				<a href = "javascript: submitForm('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Lưu" /> </a>
				<a href = "javascript: submitForm('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Lưu" /> </a>
			</c:when>
			<c:otherwise>
				<a href = "<%=request.getContextPath() %>/NhanSu/DonXinThoiViec/PrintDonXinThoiViec.jsp">								 
					<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
				</a>
			</c:otherwise>
		</c:choose>
		<input type="hidden" name="txtLyDoReject" id="txtLyDoReject" />
		<input type="hidden" name="action" id="action" />
		<input type="hidden" name="id" id="id" value="${DonXinThoiViec.maDonXinThoiViec }" />
	</form>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
<script type="text/javascript">
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtNgayThoiViec",
	button            : "txtNgayThoiViec",
	ifFormat          : "%d-%m-%Y"
  });
 </script>
</body>
</html>