<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="vn.edu.hungvuongaptech.model.ToTrinhModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ToTrinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Ban Tuong Trinh</title>
<script type="text/javascript">
<%
	ToTrinhModel toTrinh = ToTrinhDAO.getToTrinhByID(request.getParameter("maID"));
%>
function confirmDuyet(x)
{
	var act = '';
	if(x == 'A')
	{
		act = 'Approve';
		document.getElementById('Duyet').value = act;
	}
	else
	{
		var value = false;
		value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: 150px; dialogWidth: 150px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value != false && value != null)
		{
			act = 'Reject';
			document.getElementById('Duyet').value = act;
			document.getElementById('LyDoReject').value = value;
		}
		else
			return;
	}
	if(confirm("Bạn có chắc muốn " + act + " tờ trình này không?"))
	{
		document.getElementById('actionType').value = "GuiLaiToTrinh";
		document.forms["ToTrinh"].submit();	
	}
}
function guiToTrinh()
{
	document.getElementById('actionType').value = "GuiLaiToTrinh";
	document.forms["ToTrinh"].submit();
}
</script>

</head>
<body>
<div align="center" background-color ="transparent;">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<table width = "800" style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td>
				TRƯỜNG TCN KTCN HÙNG VƯƠNG <br />KHOA 
				
			</td>
			<td>
				CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />Độc lập - Tự do - Hạnh phúc
			</td>
		</tr>
	</table>
	<table>	
		<tr style="background-color: transparent;">
			<td colspan = "3">
				<Strong>TỜ TRÌNH </Strong>
		</tr>
		<tr  style="background-color: transparent;">
			<td><u>Kính gửi :</u></td>		
			<td colspan="2">Ban giám hiệu – Trường TCN KTCN Hùng Vương</td>			
		</tr>
		<tr  style="background-color: transparent;">
			<td></td>		
			<td colspan="2">Phòng Tổ Chức Hành Chánh.</td>			
		</tr>
		<tr  style="background-color: transparent;">
			<td></td>		
			<td colspan="2">Phòng Đào Tạo.</td>			
		</tr>
	</table>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "TruongKhoa" value="<%=Constant.TRUONG_KHOA %>"></c:set>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "NEW" value = "<%= Constant.TINHTRANG_NEW %>"></c:set>
	<c:set var = "PENDING" value = "<%= Constant.TINHTRANG_SEND %>"></c:set>
	<c:set var = "REJECT" value = "<%= Constant.TINHTRANG_REJECT %>"></c:set>
	<c:set var = "APPROVE" value = "<%= Constant.TINHTRANG_APPROVE %>"></c:set>
	<form action="<%=request.getContextPath()%>/toTrinhController" method="post" name = "ToTrinh">
		<input type = "hidden" name = "actionType" value = "" id = "actionType"/>
		<c:set var = "Totrinh" value = "<%=toTrinh %>" scope="session"/>
		<c:set var = "ToTrinh" value = "<%=toTrinh %>"/>
		<table>
			<c:forEach var = "MonHocTKBThayDoi" items = "${ToTrinh.monHocTKBThayDoiList}">
				<tr style="background-color: transparent;">
					<td>Môn học ${MonHocTKBThayDoi.tenMonHoc } do giáo viên ${MonHocTKBThayDoi.tenGiaoVien } phân công lại cho giáo viên ${MonHocTKBThayDoi.tenGiaoVienThayDoi }</td>
				</tr>
			</c:forEach>
			<c:forEach var = "ChiTietTKBThayDoi" items = "${ToTrinh.chiTietTKBThayDoiList}">
				<tr style="background-color: transparent;">
					<td>Thay đổi buổi học ngày ${ChiTietTKBThayDoi.ngayHoc } buổi ${ChiTietTKBThayDoi.buoi } tại phòng ${ChiTietTKBThayDoi.kiHieuPhong} của môn ${ChiTietTKBThayDoi.tenMonHoc } thành ngày ${ChiTietTKBThayDoi.ngayHocThayDoi } buổi ${ChiTietTKBThayDoi.buoiThayDoi } tại phòng ${ChiTietTKBThayDoi.kiHieuPhongThayDoi}</td>
				</tr>
			</c:forEach>
		</table>
		<table>	
			<tr style="background-color: transparent;">
				<td>Ngày <input type = "text"  size = 8 style="background-color: transparent;" value = "${ToTrinh.ngayDuyet}" readonly="readonly" /></td>
				<td>Quận 5, ngày <input type = "text" id="txtCalendar" size = 8 name="txtCalendar"  style="background-color: transparent;" value = "${ToTrinh.ngayCapNhatCuoi}" readonly="readonly" />
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>Ban giám hiệu<br /><br /><input type="text" value="${ToTrinh.tenNguoiDuyet}" style="background-color: transparent;" readonly="readonly"/><br /><br /></td>
				<td>Trưởng khoa<br /><br /><input type="text" value="${ToTrinh.tenNguoiTao}" style="background-color: transparent;" readonly="readonly"/><br /><br /></td>
			</tr>
		</table>	
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and ToTrinh.tinhTrang eq PENDING}">
			<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Approve" border="0"/> </a>
		</c:if>	
		<c:if test="${ToTrinh.tinhTrang eq APPROVE and (ToTrinh.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN or ToTrinh.maNguoiDuyet eq maThanhVien)}">	
			<a href = "<%=Constant.PATH_RES.getString("iso.InToTrinhPath") %>">								 
				<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
		</c:if>	
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and ToTrinh.tinhTrang eq PENDING}">
			<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" border="0"/> </a>
		</c:if>
		<input type="hidden" name="Duyet" value = "" id="Duyet"/>
		<input type="hidden" name="LyDoReject" value="" id = "LyDoReject"/>
		<input type="hidden" name="txtMaToTrinh" value = "${ToTrinh.id }" id="txtMaToTrinh"/>
		<input type="hidden" name="txtMaNguoiTao" value="${ToTrinh.maNguoiTao }" id = "txtMaToTrinh"/>
	</form>	
	<c:if test = "${(maThanhVien eq ToTrinh.maNguoiTao or MaBoPhan eq BO_PHAN_ADMIN) and ToTrinh.tinhTrang eq REJECT}">
		<a href="javascript:guiToTrinh()"><img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="tạo mới" border = "0" /></a>
	</c:if>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>	
</body>
</html>