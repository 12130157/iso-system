<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.DangKyMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.BangDiemHocKiDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.model.BangDiemHocKiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HocKiTungLopDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.HocKiTungLopModel"%>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/interface.js"></script>
<script type="text/javascript" language="JavaScript">
	
</script> 
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title> Xem Điểm Học Kỳ</title>
<script type="text/javascript" language="JavaScript">
var namHocTC = "";
var hocKiTC = "";
var maHKTLTC = "";
	function pageLoad()
	{
		<%
		ArrayList<ThanhVienModel> thanhVienList = new ArrayList<ThanhVienModel>();
		
		ArrayList<BangDiemHocKiModel> bangDiemHocKiList = new ArrayList<BangDiemHocKiModel>();
		
		if(request.getParameter("MaNamHoc") != null) {
			out.print("namHocTC = '" + request.getParameter("MaNamHoc") + "';");
			out.print("hocKiTC = '" + request.getParameter("HocKi") + "';");
		}
		if(request.getParameter("MaHKTL") != null) {
			out.print("maHKTLTC = '" + request.getParameter("MaHKTL") + "';");
			if(request.getAttribute("BangDiemHocVienList") != null) {
				thanhVienList = (ArrayList<ThanhVienModel>) request.getAttribute("BangDiemHocVienList");
				out.print("path = 'ISO/XemDiem';");
			} else
				thanhVienList = DangKyMonHocDAO.getAllDangKyMonHocByMaHocKiTungLop(request.getParameter("MaHKTL"));
			if(request.getAttribute("BangDiemHocKiList") != null)
				bangDiemHocKiList = (ArrayList<BangDiemHocKiModel>) request.getAttribute("BangDiemHocKiList");
			else
				bangDiemHocKiList = BangDiemHocKiDAO.getAllBangDiemHocKiByMaHocKiTungLop(request.getParameter("MaHKTL"));
		}
		%>
		document.getElementById('cboNamHoc').value = namHocTC;
		document.getElementById('cboHocKy').value = hocKiTC;
		document.getElementById('cboLop').value = maHKTLTC + '-' + <%="'" + request.getParameter("TinhTrang") + "'"%>;
	}
	function timKiem()
	{
		document.getElementById('actionType').value = "TimKiemHocKy";
		document.getElementById('ShowDiemHocKy').submit();
	}
	function luu()
	{
		document.getElementById('actionType').value = "LuuBangDiemHocKi";
		document.getElementById('ShowDiemHocKy').submit();
	}
	function gui()
	{
		document.getElementById('actionType').value = "GuiBangDiemHocKi";
		document.getElementById('ShowDiemHocKy').submit();
	}
	function selectNamHoc()
	{
		var namHoc = document.getElementById('cboNamHoc').value;
		var hocKi = document.getElementById('cboHocKy').value;
		if(namHoc == '')
			alert("Năm học chọn sai !!!");
		else if(hocKi != '')
		{
			location.href = path + "/ShowDiemHocKy.jsp?MaNamHoc=" + namHoc + "&HocKi=" + hocKi;
		}
	}
	function selectHocKi()
	{
		var namHoc = document.getElementById('cboNamHoc').value;
		var hocKi = document.getElementById('cboHocKy').value;
		if(hocKi == '')
			alert("Học kỳ chọn sai !!!");
		else if(namHoc != '')
		{
			location.href = "ShowDiemHocKy.jsp?MaNamHoc=" + namHoc + "&HocKi=" + hocKi;
		}
	}
	function selectLop()
	{
		var namHoc = document.getElementById('cboNamHoc').value;
		var hocKi = document.getElementById('cboHocKy').value;
		var lop = document.getElementById('cboLop').value.split("-");
		if(lop != '')
		{
			location.href = "ShowDiemHocKy.jsp?MaNamHoc=" + namHoc + "&HocKi=" + hocKi + "&MaHKTL=" + lop[0] + "&TinhTrang=" + lop[1];
		}
		else
			alert("Lớp chọn sai !!!");
	}
	function getNamHoc(value)
	{
		namHocTC = value;	
	}
	function getHocKi(value)
	{
		hocKiTC = value;
	}
	function getLop(value)
	{
		maHKTLTC = value;
	}
</script>
</head>
<body onload="pageLoad();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_XemDiem.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var = "BangDiemHocVienList" value = "<%=thanhVienList %>" scope="session"/>
	<c:set var = "BangDiemHocKiList" value = "<%=bangDiemHocKiList %>" scope="session"/>
	<form action="<%=request.getContextPath()%>/XemDiemController" name = "ShowDiemHocKy" method="post" id = "ShowDiemHocKy">
		<input type = "hidden" name = "actionType" id = "actionType"/>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="5"><div class = "div_thanhvientieude">Bảng Điểm Học Kỳ</div></td></tr>
			
			<tr style="background-color: transparent;">
								
				<th style="background-color: #99bff9" align="left">Năm học</th>
				
				<th style="background-color: #99bff9" align="left">
					<select name="cboNamHoc" id="cboNamHoc" onchange="selectNamHoc();" onclick="getNamHoc(this.value);">
						<option value = "">		---		Chọn	---		</option>
						<c:forEach var = "NamHoc" items="<%=NamHocDAO.getAllNamHoc() %>">
							<option value = "${NamHoc.maNamHoc }">${NamHoc.namBatDau } - ${NamHoc.namKetThuc }</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Học kỳ
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboHocKy" id="cboHocKy" onchange="selectHocKi();" onclick="getHocKi(this.value)">
						<option value = "">		---		Chọn	---		</option>
						<c:forEach var="HocKy" begin="1" end="4">
							<option value = "${HocKy }">${HocKy }</option>
						</c:forEach>
					</select>
				</th>
				<th style="background-color: #99bff9" align="left">
					Lớp học
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboLop" id="cboLop" onchange="selectLop();" onclick="getLop(this.value)">
						<option value = "">		---		Chọn	---		</option>
						<c:if test = "${not empty param.MaNamHoc}">
							<c:forEach var = "Lop" items='<%=HocKiTungLopDAO.getHocKiTungLopByMaNamHocAndHocKi(request.getParameter("MaNamHoc"), request.getParameter("HocKi")) %>'>
								<option value = "${Lop.maHocKiTungLop }-${Lop.tinhTrang}">${Lop.kiHieuLop }</option>
							</c:forEach>
						</c:if>	
					</select>
				</th>
			</tr>
		</table>
		<c:if test = "${not empty BangDiemHocVienList}">
			<c:set var = "MonHocList" value = "${sf:getAllMonHoc(BangDiemHocVienList)}"/>
			<c:set var = "TongSoMonHoc" value = "${sf:getTongSoMonHoc(MonHocList)}"/>
			<c:set var = "Count" value = "1"/>
			<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">STT</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Tên sinh viên</div></th>
					<th bgcolor = "#186fb2" colspan="${TongSoMonHoc}"><div class = "div_textWhite">Môn học</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Điểm TB</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Điểm RL</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Điểm TBC</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Học lực</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Hạnh kiểm</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Số ngày nghỉ</div></th>
					<th bgcolor = "#186fb2" rowspan="2"><div class = "div_textWhite">Ghi chú</div></th>
				</tr>
				<tr style="background-color: transparent;">
					<c:forEach var = "MonHoc" items="${MonHocList}">
						<th bgcolor = "#186fb2"><div class = "div_textWhite">${MonHoc }</div></th>
					</c:forEach>
				</tr>
				<c:forEach var = "ThanhVien" items="${BangDiemHocVienList}">
					<tr>
						<td>${Count }<input type = "hidden" name = "txtMaBangDiemHocKi${Count }" value = "${BangDiemHocKiList[count-1].maBangDiemHocKi}"/></td>
						<td>${ThanhVien.tenThanhVien}</td>
						<c:forEach var = "DangKyMonHoc" items="${ThanhVien.dangKyMonHocList}">
							<td>${DangKyMonHoc.diemTrungBinh }<input type = "hidden" value = "${DangKyMonHoc.diemTrungBinh }" id = "txtDiemTB${DangKyMonHoc.maHocVien}_${DangKyMonHoc.maMonHoc}"/></td>
						</c:forEach>
						<td>${BangDiemHocKi[Count-1].diemTrungBinh }<input type = "hidden" value = "${BangDiemHocKi[Count-1].diemTrungBinh }" id = "txtDiemTB${Count }"/></td>
						<td><input type = "text" value = "${BangDiemHocKi[Count-1].diemRenLuyen }" id = "txtDiemRenLuyen${Count }" name="txtDiemRenLuyen${Count }" size="5"/></td>
						<td>${BangDiemHocKi[Count-1].diemTBHocKi }<input type = "hidden" value = "${BangDiemHocKi[Count-1].diemTBHocKi }" id = "txtDiemTBHocKi${Count }"/></td>
						<td>${BangDiemHocKi[Count-1].hocLuc }<input type = "hidden" value = "${BangDiemHocKi[Count-1].hocLuc }" id = "txtHocLuc${Count }"/></td>
						<td>${BangDiemHocKi[Count-1].hanhKiem }</td>
						<td>-</td>
						<td>${BangDiemHocKi[Count-1].ghiChu }</td>
					</tr>
					<c:set var = "Count" value = "${Count + 1}"/>
					<script language="JavaScript" type="text/javascript">
						
					</script>
				</c:forEach>
			</table>
			<input type = "hidden" name = "txtCount" value = "${Count-1}"/>
			<c:if test = "${not empty param.MaHKTL}">
				<a href = "javascript:luu();">
					<img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu"/>
				</a>
			</c:if>
			<c:if test = "${param.TinhTrang eq 1}">
				<a href = "javascript:gui();">
					<img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="Lưu"/>
				</a>
				<a href = "<%=request.getContextPath() + Constant.PATH_RES.getString("xemDiem.InDiemHocKyShortPath")%>?MaHKTL=${param.MaHKTL}">
					<img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="Lưu"/>
				</a>
			</c:if>
		</c:if>	
	</form>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>

</body>
</html>