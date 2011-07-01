<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>

<%@page import="vn.edu.hungvuongaptech.dao.HocKyDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TuanLeModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.XemDiemDAO"%><html>
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
<script type="text/javascript" language="JavaScript">
	
</script> 
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<script type="text/javascript" language="JavaScript">

var duongDan = '';
<%
	int size1 = 0, size2 = 0;
	ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
	if(request.getParameter("maID") != null) {
		thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuByID(request.getParameter("maID"));
	}
	if(request.getAttribute("thoiKhoaBieu") != null)
	{
		thoiKhoaBieuModel = (ThoiKhoaBieuModel) request.getAttribute("thoiKhoaBieu");
		//thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuByID(thoiKhoaBieuModel.getMaThoiKhoaBieu());
		out.print("duongDan = 'ISO/XemDiem/';");
	}	
	ArrayList<TuanLeModel> tuanLeModelList = TuanLeDAO.getAllTuanLe();
	ArrayList<NamHocModel> namHocModelList = NamHocDAO.getAllNamHoc();
	
%>
var maChuongTrinh = '';
var hocKi = '';
var rowSang = 0, rowChieu = 0;
var soNam;
var namBatDau;
var obj = new Object();
var monHocList = new Array(); // mang chua cac mon hoc da tao tkb
var tuanLe = new Array(); 
var addTKB = new Array(); // mang chua toan bo chi tiet ve cac mon hoc
var ngay = new Array();
var maNamHoc, maTKB;
	function pageLoad()
	{
		<%
			String str[];
			out.print("if('" + request.getParameter("Them") + "' == 'null' || " + request.getParameter("maID") + " != null){");
			out.print("if('" + thoiKhoaBieuModel.getMaLop() + "' != '') {");
			out.print("document.getElementById('Lop').value = '" + thoiKhoaBieuModel.getMaLop() + "';");
			out.print("selectLop(); ");
			out.print("if('" + thoiKhoaBieuModel.getHocKi() + "' != '') ");
			out.print("document.getElementById('HocKi').value = '" + thoiKhoaBieuModel.getHocKi() + "';");
			out.print("if('" + thoiKhoaBieuModel.getNam1() + "' != '') {");
			out.print("document.getElementById('Nam1').value = '" + thoiKhoaBieuModel.getNam1() + "';");
			out.print("selectNam1();}");
			out.print("if('" + thoiKhoaBieuModel.getTuanBatDau() +"' != '') {");
			out.print("document.getElementById('TuanBatDau').value = '" + thoiKhoaBieuModel.getTuanBatDau() + "';");
			out.print("document.getElementById('TuNgay').value = '" + thoiKhoaBieuModel.getNgayBatDau() + "';");
			out.print("tuanLe[0] = document.getElementById('TuanBatDau').value;}");
			out.print("if('" + thoiKhoaBieuModel.getTuanKetThuc() +"' != '') {");
			out.print("document.getElementById('TuanKetThuc').value = '" + thoiKhoaBieuModel.getTuanKetThuc() + "';");
			out.print("document.getElementById('DenNgay').value = '" + thoiKhoaBieuModel.getNgayKetThuc() + "';");
			out.print("tuanLe[1] = document.getElementById('TuanKetThuc').value;} }");
			if(thoiKhoaBieuModel.getMonHocTKBModelList() != null) {
				for(int i=0;i<thoiKhoaBieuModel.getMonHocTKBModelList().size();i++) {
					out.print("var monHoc = new Object();");// tao obj chua ten mon hoc va ma mon hoc
					out.print("var objTKB = new Object();");
					out.print("monHoc.maMonHoc = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getMaMonHoc() + "';");
					out.print("monHoc.tenMonHoc = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTenMonHoc() + "';");
					out.print("monHocList[monHocList.length] = monHoc;");
					out.print("objTKB.tenMonHoc = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTenMonHoc() + "';");
					out.print("objTKB.tenGiaoVien = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTenGiaoVien() + "';");
					if(thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauLT() != null)
						out.print("objTKB.ngayBatDauLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauLT().replace("-","/") + "';");
					else
						out.print("objTKB.ngayBatDauLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauLT() + "';");
					if(thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauTH() != null )
						out.print("objTKB.ngayBatDauTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauTH().replace("-","/") + "';");
					else
						out.print("objTKB.ngayBatDauTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauTH() + "';");	
					if(thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucLT() != null)
						out.print("objTKB.ngayKetThucLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucLT().replace("-","/") + "';");
					else
						out.print("objTKB.ngayKetThucLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucLT() + "';");
					if(thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucTH() != null)
						out.print("objTKB.ngayKetThucTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucTH().replace("-","/") + "';");
					else
						out.print("objTKB.ngayKetThucTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucTH() + "';");
					out.print("objTKB.ghiChu = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getGhiChu() + "';");
					
					out.print("objTKB.maMonHoc = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getMaMonHoc() + "';");
					out.print("objTKB.maGiaoVien = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getMaGiaoVien() + "';");
					out.print("objTKB.maMonHocTKB = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getMaMonHocTKB() + "';");
					out.print("objTKB.chuoiThuTrongTuan = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChuoiThuTrongTuan() + "';");
					out.print("objTKB.phongLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChuoiPhongLT() + "';");
					out.print("objTKB.phongTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChuoiPhongTH() + "';");
					out.print("objTKB.soNoiDung = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getSoNoiDung() + "';");
					out.print("objTKB.soCaThucHanh = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getSoCaThucHanh() + "';");
					out.print("objTKB.kieuBienSoan = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getKieuBienSoan() + "';");
					out.print("objTKB.soTietLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getLyThuyetCTMH() + "';");
					out.print("objTKB.soTietTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getThucHanhCTMH() + "';");
					out.print("objTKB.tuanBatDauLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTuanBatDauLT() + "';");
					out.print("objTKB.tuanBatDauTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTuanBatDauTH() + "';");
					out.print("objTKB.maPhongLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getUser1() + "';");
					out.print("objTKB.maPhongTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getUser2() + "';");
					out.print("var arrChiTiet = new Array();");
					
					
					for(int j=0;j<thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().size();j++) {
						out.print("var chiTiet = new Object();");
						out.print("chiTiet.maChiTietTKB = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getMaChiTietTKB() + "';");
						out.print("chiTiet.buoi = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getBuoi() + "';");
						out.print("chiTiet.sTTNoiDung = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getsTTNoiDung() + "';");
						out.print("chiTiet.coHieu = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getCoHieu() + "';");
						out.print("chiTiet.hinhThucDay = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getHinhThucDay() + "';");
						out.print("chiTiet.thuTrongTuan = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getThuTrongTuan() + "';");
						out.print("chiTiet.phong = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getMaPhong() + "';");
						out.print("chiTiet.tuan = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getTuan() + "';");
						out.print("chiTiet.soThuTu = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getSoThuTu() + "';");
						out.print("chiTiet.nhom = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getNhom() + "';");
						//out.print("chiTiet.maSuDung = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getSuDungModelList().get(j).getMaSuDung() + "';");
						out.print("arrChiTiet[" + j + "] = chiTiet;");
						
					}	
					out.print("objTKB.chiTietTKBList = arrChiTiet;");
					out.print("addTKB[" + i + "] = objTKB;");
					out.print("createRow(objTKB, 0);");
				}
			}
			out.print("maTKB = '" + thoiKhoaBieuModel.getMaThoiKhoaBieu() + "'; }");

			if(thoiKhoaBieuModel.getMaThoiKhoaBieu() != null && thoiKhoaBieuModel.getMaThoiKhoaBieu() != "") {
				out.print("document.getElementById('Lop').disabled = true;");
				out.print("document.getElementById('HocKi').disabled = true;");
				out.print("document.getElementById('Nam1').disabled = true; ");
			}
		%>	
	}

</script>

<title>Thời Khóa Biểu</title>
</head>
<body onload="pageload();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_XemDiem.jsp" />
	<!-- E HEAD CONTENT -->
	
<form action="">
	<c:if test="${sessionScope.maVaiTro eq '9'}">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="8"><div class = "div_thanhvientieude">Thời Khóa Biểu</div></td></tr>
		</table>
		
		<table border = "1" style="background-color: transparent;">
			
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Hai</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Ba</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tư</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Năm</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Sáu</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Bảy</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Chủ nhật</div></th>	
			</tr>
			
			<tr style="background-color: transparent;">
				
			</tr>
		</table>
	</c:if>
	
	<c:if test="${sessionScope.maVaiTro ne '9'}">
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;"><td colspan="8"><div class = "div_thanhvientieude">Thời Khóa Biểu</div></td></tr>
			
			<tr style="background-color: transparent;">
				<th style="background-color: #99bff9" align="right">
					Lớp : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboLopHoc" id="cboLopHoc">
							<option>Lớp</option>
					</select>
				</th>
				
				<th style="background-color: #99bff9" align="right">
					Học Kỳ : 
				</th>
				<th style="background-color: #99bff9" align="left">
					<select name="cboHocKy" id="cboHocKy">
							<option>Học kỳ</option>
					</select>
				</th>
			</tr>
		</table>
		
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan="8">
					<div class="div_textleft">
						<font color="#0000FF" size="4" style="Buổi Sáng">Buổi Sáng</font>
					</div>
				</td>
			</tr>
		</table>
		
		<table border = "1" style="background-color: transparent;" id="tableSang">
			
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Hai</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Ba</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tư</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Năm</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Sáu</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Bảy</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Chủ nhật</div></th>			
			</tr>	
		</table>
		
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan="8">
					<div class="div_textleft">
						<font color="#0000FF" size="4" style="Buổi Sáng">Buổi Chiều</font>
					</div>
				</td>
			</tr>
		</table>
		
		<table border = "1" style="background-color: transparent;" id="tableChieu">
			
			<tr style="background-color: transparent;">
				<th bgcolor = "#186fb2"><div class = "div_textWhite"></div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Hai</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Ba</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Tư</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Năm</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Sáu</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Bảy</div></th>
				<th bgcolor = "#186fb2"><div class = "div_textWhite">Chủ nhật</div></th>			
			</tr>	
		</table>
	</c:if>

	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>

</body>
</html>