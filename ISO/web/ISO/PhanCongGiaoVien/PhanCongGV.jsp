<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.QuyetDinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MoChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.HeDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%>
<%@page import="vn.edu.hungvuongaptech.model.HeDaoTaoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel"%>

<%@page import="vn.edu.hungvuongaptech.dao.ReportDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SuDungDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietBangPhanCongModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.BangPhanCongDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.BangPhanCongModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
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
<title>Phan cong giao vien</title>

<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
<c:set var = "truongKhoa" value = "<%=Constant.TRUONG_KHOA %>"></c:set>

<script language="JavaScript" type="text/javascript">
	//Javascript validation functions		
	<%
		BangPhanCongModel bangPhanCong = new BangPhanCongModel();
		if(request.getAttribute("BangPhanCong") != null)
			bangPhanCong = (BangPhanCongModel) request.getAttribute("BangPhanCong");
		else if(request.getParameter("maID") != null)
			bangPhanCong = BangPhanCongDAO.getBangPhanCongByID(request.getParameter("maID"), "Xem");
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
		if(confirm("Bạn có chắc muốn " + act + " bảng phân công này không?"))
			document.forms["Duyet1BangPhanCong"].submit();	
	}
	function submitForm()
	{
		if(document.getElementById('cboKhoa').value == '')
			alert("Hãy chọn khoa !!!");
		else if(document.getElementById('cboHocKi').value == '')
			alert("Hãy chọn học kì !!!");
		else if(document.getElementById('cboNamHoc').value = '')
			alert("Hãy chọn năm học");
		else
			document.getElementById('FileForm').submit();
	}
</script>

</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set 	var = "BangPhanCongModel" value = '<%=bangPhanCong %>' scope="session"></c:set>
		<c:if test="${not empty param.Trung}">
			<b class="error"> Bảng phân công này đã tồn tại </b>
		</c:if>
		<c:if test="${not empty param.TaoMoiThanhCong and param.TaoMoiThanhCong eq 'ok'}">
			<b class="msg"> Thêm mới "BẢNG PHÂN CÔNG" thành công </b>
		</c:if>
		<c:if test="${not empty param.TaoMoiThatBai and param.TaoMoiThatBai eq 'fail'}">
			<b class="error"> Thêm mới "BẢNG PHÂN CÔNG" thất bại </b>
		</c:if>
		<c:if test="${(not empty param.UpdateThanhCong and param.UpdateThanhCong eq 'ok')}">
			<b class="msg"> Cập nhật "BẢNG PHÂN CÔNG" thành công </b>
		</c:if>	
		<c:if test="${(not empty param.UpdateThatBai and param.UpdateThatBai eq 'fail')}">
			<b class="msg"> Cập nhật "BẢNG PHÂN CÔNG" thất bại </b>
		</c:if>	
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
	<form name="FileForm" action="<%=request.getContextPath()%>/phanCongController?xuLy=ok" method="post" id = "FileForm">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				TRƯỜNG TCN KTCN HÙNG VƯƠNG
				    KHOA/BỘ MÔN/TT
				    <select name = "cboKhoa" id="cboKhoa" <c:if test = "${not empty BangPhanCong.id}">disbaled</c:if>>
						<option value = "">  ---  Chọn khoa  ---  </option>
						<c:forEach var="khoa" items="<%= KhoaDAO.showAllKhoa() %>">
							<option value="${khoa.maKhoa}" 
								<c:if test = "${khoa.maKhoa eq BangPhanCongModel.maKhoa}">selected</c:if>
									>${khoa.tenKhoa}</option>
						</c:forEach>
					</select>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><div class = "div_tieude"><strong>BẢNG PHÂN CÔNG GIÁO VIÊN GIẢNG DẠY</strong></div><br /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td>Hệ đào tạo : hệ Trung cấp nghề<br/>
					Học kỳ :
					<select name = "cboHocKi" id="cboHocKi" <c:if test = "${not empty BangPhanCong.id}">disbaled</c:if>>
						<option value = "">  ---  Chọn học kỳ  ---  </option>
						<option value = "1" <c:if test = "${BangPhanCongModel.hocKi eq 1}">selected</c:if>>1</option>
						<option value = "2" <c:if test = "${BangPhanCongModel.hocKi eq 2}">selected</c:if>>2</option>
						
					</select>
					<c:set var = "ListNamHoc" value="<%=NamHocDAO.getAllNamHoc() %>"/>
					Năm học : 
					<select name = "cboNamHoc" id="cboNamHoc" <c:if test = "${not empty BangPhanCong.id}">disbaled</c:if>>
						<option value = "">  ---  Chọn năm học  ---  </option>
						<c:forEach var = "NamHoc" items="${ListNamHoc}">
							<option value = "${NamHoc.maNamHoc}" <c:if test = "${BangPhanCongModel.maNamHoc eq NamHoc.maNamHoc}">selected</c:if>>${NamHoc.namBatDau}-${NamHoc.namKetThuc}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	
	<br/>
	
		<table style="background-color: transparent;" border="1">
			<tr align="center" style="background-color: transparent;">
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					STT
				</th>
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					Họ và tên GV
				</th>
				<th style="background-color: #778899; color: white;" width="80" rowspan="2">
					Lớp
				</th>
				<th style="background-color: #778899; color: white;" rowspan="2">
					Môn học
				</th>
				<th style="background-color: #778899; color: white;" width="80" colspan="2">
					Số giờ giảng dạy
				</th>
				<th style="background-color: #778899; color: white;" width="150" rowspan="2">
					Các nhiệm vụ khác
				</th>
				<th style="background-color: #778899; color: white;" rowspan="2" >
					Ghi chú
				</th>				
			</tr>
			<tr align="center" style="background-color: transparent;">
				<td style="background-color: #778899; color: white;">Lý thuyết</td>
				<td style="background-color: #778899; color: white;">Thực hành</td>
			</tr>
			<%
			int countLop = 0, soThuTu = 1;
			String[] listLop = new String[0];
			if(bangPhanCong.getSoDong() != null)
			listLop = bangPhanCong.getSoDong().split("-");
			
			%>
			
			<c:set var = "MaLop" value = "na"/>
			<c:set var = "CountLop" value = "1"/>
			<c:set var = "SoThuTu" value = "1"/>
			<c:forEach var="PhanCong" items = "${BangPhanCongModel.chiTietBangPhanCongList}">
				<c:set var = "SoThuTu" value = "<%=soThuTu %>"/>
				<tr style="background-color: transparent;">
					<td>${SoThuTu}</td>		
					<td>
							<select id = "cboGiaoVien${SoThuTu }" name = "cboGiaoVien${SoThuTu }">
								<option value = "">	---  Chọn giáo viên  --- </option>
								<c:forEach var = "GiaoVien" items="<%=ThanhVienDAO.getAllGiaoVienOrderByTen() %>">
									<option value = "${GiaoVien.maThanhVien }"
										<c:if test = "${GiaoVien.maThanhVien eq PhanCong.maGiaoVien }">selected</c:if>>${GiaoVien.hoThanhVien} ${GiaoVien.tenLot } ${GiaoVien.tenThanhVien }</option>
								</c:forEach>
							</select>
					</td>
					<c:choose>
						<c:when test = "${PhanCong.maLop ne MaLop}">				
							<td id = "tdLop${SoThuTu}">${PhanCong.kiHieuLop}</td>
							<c:set var = "MaLop" value = "${PhanCong.maLop}"/>
							<script language="JavaScript" type="text/javascript">
								document.getElementById('tdLop' + <%=(soThuTu-countLop)%>).rowSpan = <%=countLop%>;
							</script>
							<%countLop = 1; %>
						</c:when>	
						<c:otherwise>
							<%countLop++; %>
						</c:otherwise>
					</c:choose>
					<td>${PhanCong.tenMonHoc}</td>
					<td>${PhanCong.lyThuyet}</td>
					<td>${PhanCong.thucHanh}</td>
					<td><textarea cols="15" id = "txtNhiemVu${SoThuTu}" name = "txtNhiemVu${SoThuTu}">${PhanCong.nhiemVu}</textarea></td>
					<td><textarea cols="15" id = "txtGhiChu${SoThuTu}" name = "txtGhiChu${SoThuTu}">${PhanCong.ghiChu}</textarea></td>
				</tr>
				<%soThuTu++; %>
			</c:forEach>
			<script language="JavaScript" type="text/javascript">
				if(<%=soThuTu%> != 1)
				{
					document.getElementById('tdLop' + <%=(soThuTu-countLop)%>).rowSpan = <%=countLop%>;
				}
				function confirmSending() {
					var check = true;
					for(var i=1;i<<%=soThuTu%>;i++)
					{
						if(document.getElementById('cboGiaoVien' + i).value == '')
						{
							alert("Bạn chưa chọn hết giáo viên !!!");
							check = false;
							break;
						}
					}
					if(check)
					{
						if (confirm('Bạn có chắc muốn gửi bảng phân công này không ?')) {
							document.FileForm.GuiHieuTruong.value = 'GuiHieuTruong';
							submitForm();
						}
					}
					//return false;
				}					
			</script>
		</table>
	<br/>
	${SoThuTu }
	<input type = "hidden" name = "txtSoPhanCong" id = "txtSoPhanCong" value = "${SoThuTu}"/>
	<table width = "800" style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td>Ngày <input type = "text"  size = 8  style="background-color: transparent;" value = "${BangPhanCongModel.ngayDuyet}" readonly="readonly" /></td>
			<td>Ngày <input type = "text"  size = 8  style="background-color: transparent;" value = "${BangPhanCongModel.ngayCapNhatCuoi}" readonly="readonly" /></td>
		</tr>
		<tr style="background-color: transparent;">
			<td>Hiệu trưởng<br /><br /><inpu type = "text" value = "${BangPhanCongModel.tenNguoiDuyet}"/><br /><br /></td>
			<td>Trưởng khoa<br /><br /><inpu type = "text" value = "${BangPhanCongModel.tenNguoiTao}"/><br /><br /></td>
		</tr>
	</table>
	<input type="hidden" name="actionType" style="background-color: transparent;" id = "actionType"
			<c:choose>				
				<c:when test="${empty BangPhanCongModel.id}">
					value="ThemMoi"
				</c:when>
				<c:otherwise>
					value="CapNhat"
				</c:otherwise>	
			</c:choose>  
		/>	
		<c:if test = "${BangPhanCongModel.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN or BangPhanCongModel.tinhTrang eq null}"> 
			<c:choose>
				<c:when test="${BangPhanCongModel.tinhTrang eq NEW or BangPhanCongModel.tinhTrang eq REJECT or BangPhanCongModel.tinhTrang eq null}">
					<!--  <input type = "submit" name="TaoMoi" -->
					<a href = "javascript: submitForm()" name="TaoMoi"> 
					<c:choose>
						<c:when test="${empty BangPhanCongModel.id}">
							<img id="ButtonAction" src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Tạo mới" border = "0" />
						</c:when>
						<c:otherwise>							
							<img id="ButtonAction" src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập Nhật" border = "0" />
						</c:otherwise>
					</c:choose> </a>				
					<c:choose>
						<c:when test="${not empty BangPhanCongModel.id and empty param.AddRow and empty param.err}">							
							<a href = "javascript: confirmSending()">
								<input type="hidden" name="GuiHieuTruong" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/guihieutruong.png" alt="Gửi Hiệu Trưởng" border = "0" />
							</a>
						</c:when>				
					</c:choose>
				</c:when>
			</c:choose>
		</c:if>	
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and BangPhanCongModel.tinhTrang eq PENDING}">
			<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Approve" border="0"/> </a>
		</c:if>	
		<c:if test="${BangPhanCongModel.tinhTrang eq APPROVE and (BangPhanCongModel.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN or BangPhanCongModel.maNguoiDuyet eq maThanhVien)}">	
			<a href = "<%=Constant.PATH_RES.getString("iso.InBangPhanCongPath") %>">								 
				<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
		</c:if>	
		<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and BangPhanCongModel.tinhTrang eq PENDING}">
			<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" border="0"/> </a>
		</c:if>
	</form>	
	<form method="post" action="<%=request.getContextPath()%>/phanCongController?duyet1BangPhanCong=yes&maBangPhanCong=${BangPhanCongModel.id}" name="Duyet1BangPhanCong">	
		<input type="hidden" name="Duyet" value = "" id="Duyet"/>
		<input type="hidden" name="LyDoReject" value="" id = "LyDoReject"/>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

</div>
</body>
</html>