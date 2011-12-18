<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.PhongBanModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.LoaiThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.TinhTrangThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%>
<%@page import="vn.edu.hungvuongaptech.dao.TinhTrangThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel"%>
<%@page import="com.sun.xml.internal.txw2.Document"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<title>Hệ Thống Quản Lý Thiết Bị</title>
<script language="javascript">
	var listBoPhan = new Array(); 
	<%
		ArrayList<KhoaModel> listBoPhan = ThietBiDAO.getComboBoxDanhSachThietBi();
		int n = 0;
		for(KhoaModel boPhan : listBoPhan){
			out.print("var objBoPhan = new Object();");
			out.print("objBoPhan.maBoPhan = '"+boPhan.getMaKhoa()+"'");
			out.print("objBoPhan.tenBoPhan = '"+boPhan.getTenKhoa()+"'");
			out.print("var listPhongBan = new Array();");
			int i = 0;
			for(PhongBanModel phongBan : boPhan.getListPhongBan()){
				out.print("var objPhongBan = new Object();");
				out.print("objPhongBan.maPhongBan = '"+phongBan.getMaPhongBan()+"'");
				out.print("objPhongBan.tenPhongBan = '"+phongBan.getKiHieu()+"'");
				out.print("var listLoaiThietBi = new Array();");
				int j = 0;
				for(LoaiThietBiModel loaiThietBi : phongBan.getListLoaiThietBi()){
					out.print("var objLoaiThietBi = new Object();");
					out.print("objLoaiThietBi.maLoaiThietBi = '"+loaiThietBi.getMaLoaiThietBi()+"'");
					out.print("objLoaiThietBi.tenLoaiThietBi = '"+loaiThietBi.getTenLoaiThietBi()+"'");
					out.print("listLoaiThietBi["+j+"] = objLoaiThietBi");
					j++;	
				}
				out.print("listPhongBan["+i+"] = objPhongBan");
				i++;
			}
			out.print("listBoPhan["+n+"] = objBoPhan");
			n++;
		}
	%>
	
	function loadData(){
		
	}
	
	function selectBoPhan(){
		var cbMaBoPhan = document.getElementById("cbBoPhan").value;
		for ( var obj in listBoPhan) {
			if(listBoPhan[obj].maBoPhan==cbMaBoPhan){
				document.getElementById("cbPhongBan").innerHTML = null;
				for ( var obj2 in listBoPhan[obj].listPhongBan) {
					var option = new Option(listBoPhan[obj].listPhongBan[obj2].maPhongBan,listBoPhan[obj].listPhongBan[obj2].tenPhongBan);
					document.getElementById("cbPhongBan").add(option);
				}
				selectPhongBan();
				break;
			}
		}
	}
	
	function selectPhongBan(){
		var cbMaPhongBan = document.getELementById("cbPhongBan").value;
		for (var obj in listBoPhan){
			for ( var obj2 in listBoPhan[obj]) {
				if(listBoPhan[obj].listPhongBan[obj2].maPhongBan==cbMaPhongBan){
					document.getElementById("cbLoaiThietBi").innerHTML = null;
					for ( var obj3 in listBoPhan[obj].listPhongBan[obj2].listLoaiThietBi) {
						var option = new Option(listBoPhan[obj].listPhongBan[obj2].listLoaiThietBi[obj3].maLoaiThietBi,listBoPhan[obj].listPhongBan[obj2].listLoaiThietBi[obj3].tenLoaiThietBi);
						document.getElementById("cbLoaiThietBi").add(option);
					}
					break;		
				}
			}
		}
	}
</script>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formThietBi" id = "formThietBi" method="post">
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách Các Thiết Bị</div>
				</td>
			</tr>
		</table>
	
		<table border='1' style="background-color: transparent;">
			<tr>
				<td>
					Khoa/TT
					<select id="cbBoPhan" name="cbBoPhan" onchange="selectBoPhan()">
						<option>Chọn</option>
						<option>Công Nghệ Thông Tin</option>
					</select> 
				</td>
				<td>
					Phòng 
					<select id="cbPhongBan" name="cbPhongBan" onchange="selectPhongBan()">
						<option>Chọn</option>
						<option>G2.1</option>
					</select>	
				</td>
				<td>
					Loại Thiết Bị
					<select id="cbLoaiThietBi" name="cbLoaiThietBi">
						<option>Chọn</option>
						<option>PC</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Tình Trạng
					<select>
						<option>Chọn</option>
						<option>Tốt</option>
					</select>
				</td>
				<td colspan="2">
					Vào lúc
					<select>
						<option>Chọn</option>
						<c:forEach var="n" begin="0" end="23" step="1">
							<option>${n}</option>
						</c:forEach>
					</select>
					:
					<select>
						<option>Chọn</option>
						<c:forEach var="n" begin="0" end="59" step="1">
							<option>${n}</option>
						</c:forEach>
					</select>
					đến
					<select>
						<option>Chọn</option>
						<c:forEach var="n" begin="0" end="23" step="1">
							<option>${n}</option>
						</c:forEach>
					</select>
					:
					<select>
						<option>Chọn</option>
						<c:forEach var="n" begin="0" end="59" step="1">
							<option>${n}</option>
						</c:forEach>
					</select> 
				</td>		
			</tr>
			<tr>				
				<td>Hiện Trạng
					<select>
						<option>Chọn</option>
						<option>Tốt</option>
					</select>
				</td>
				<td colspan="2">
					Từ ngày 
					<input type="text" />
					đến
					<input type="text" />
					<input type="button" value="Tìm Kiếm" />
				</td>
			</tr>
		</table>		
		
		<%
			String page = 1;
			if(request.getParameter("page")!=null){
				page = request.getParameter("page");
			}		
		 %>
			
		
		<c:set var="listThietBi" value='<%=ThietBiDAO.getDanhSachThietBi(request.getParameter("maPhongBan"),request.getParameter("maBoPhan"),request.getParameter("maLoaiThietBi"),request.getParameter("tinhTrang"),
		request.getParameter("hienTrang"),request.getParameter("gioBD"),request.getParameter("phutBD"),request.getParameter("gioKT"),request.getParameter("phutKT"),request.getParameter("ngayBD"),request.getParameter("ngayKT"),"10",Constant.NUM_RECORD_THIETBI) %>'></c:set>
		<c:set var="NUM_RECORD_THIETBI" value='<%=Constant.NUM_RECORD_THIETBI %>'></c:set>
		<table border="1">
			<tr>
				<th bgcolor = "#186fb2">
					<div class = "div_textWhite">
						<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"></input>
					</div>
				</th>
				<th style='background-color: #186fb2;color:white'>STT</th>
				<th style='background-color: #186fb2;color:white'>Loại thiết bị</th>
				<th style='background-color: #186fb2;color:white'>Mã</th>
				<th style='background-color: #186fb2;color:white'>Kí Hiệu</th>
				<th style='background-color: #186fb2;color:white'>Tên Thiết Bị</th>
				<th style='background-color: #186fb2;color:white'>Vị Trí Lắp Đặt</th>
				<th style='background-color: #186fb2;color:white'>Tình trạng</th>
				<th style='background-color: #186fb2;color:white'>Hiện trạng</th>
			</tr>
			<c:set var="stt" value="1"></c:set>
			<c:forEach var="thietBi" items="${listThietBi.danhSachThietBi}">
				<tr>
					<td><input type="checkbox" name="maThietBi${stt }" id="maThietBi${stt }"/></td>
					<td>${stt}</td>
					<td>${thietBi.tenLoaiThietBi }</td>
					<td>${thietBi.ma }</td>
					<td>${thietBi.kiHieu }</td>
					<td>${thietBi.tenThietBi }</td>
					<td>${thietBi.tenPhongBan }</td>
					<td>${thietBi.tinhTrang }</td>
					<td>${thietBi.hienTrang }</td>
				</tr>
			</c:forEach>	
		</table>
		
		<c:choose>
			<c:when test="${listThietBi.tongSoThietBi/NUM_RECORD_THIETBI gt 1}">
				<c:forEach var="i" begin="1" end="${listThietBi.tongSoThietBi/NUM_RECORD_THIETBI+1}" step="1">
					<a href="<%=request.getContextPath() %>/QuanLyThietBi/ThietBi/DanhSachThietBi.jsp?page=${i}
					&maBoPhan=${param.maBoPhan }&maPhongBan=${param.maPhongBan }&maLoaiThietBi=${param.maLoaiThietBi }
					&tinhtrang=${param.tinhTrang }&hienTrang=${param.hienTrang }&gioBD=${param.gioBD }&phutBD=${param.phutBD }
					&gioKT=${param.gioKT }&phutKT=${param.phutKT }&ngayBD=${param.ngayBD }&ngayKT=${param.ngayKT }">${i }</a>
				</c:forEach>
			</c:when>
		</c:choose>
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>