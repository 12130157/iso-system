<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>


<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HocPhanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.model.KetQuaTimGiaoAnModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocTKBDAO"%><html>
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

<c:set var="khoaList" value='<%=KhoaDAO.getKhoaByBoPhan(Integer.parseInt((String) request.getSession().getAttribute("maBoPhan"))) %>'></c:set>
<c:set var="namHocList" value="<%=NamHocDAO.getAllNamHoc()%>"></c:set>

<%
	String gv="";
	String path="TimKeHoachGiangDay.jsp?view=true";
	if(request.getParameter("gv")!=null&&request.getParameter("gv")!="")
	{
		gv=request.getParameter("gv").toString();
		path=path+"&gv="+gv;
	}
	String nam="";
	if(request.getParameter("nam")!=null&&request.getParameter("nam")!="")
	{
		nam=request.getParameter("nam");
		path=path+"&nam="+nam;
	}
	String lop="";
	if(request.getParameter("lop")!=null&&request.getParameter("lop")!="")
	{
		lop=request.getParameter("lop");
		path=path+"&lop="+lop;
	}
	
	String mon="";
	if(request.getParameter("mon")!=null&&request.getParameter("mon")!="")
	{
		mon=request.getParameter("mon");
		path=path+"&mon="+mon;
	}
	
	String hk="";
	if(request.getParameter("hk")!=null&&request.getParameter("hk")!="")
	{
		hk=request.getParameter("hk");
		path=path+"&hk="+hk;
	}
	
	String tt="";
	if(request.getParameter("tt")!=null&&request.getParameter("tt")!="")
	{
		tt=request.getParameter("tt");
		path=path+"&tt="+tt;
	}
	
	String khoa="";
	if(request.getParameter("khoa")!=null&&request.getParameter("khoa")!="")
	{
		khoa=request.getParameter("khoa");
		path=path+"&khoa="+khoa;
	}
	
	int index=1;
	if(request.getParameter("index")!=null&&request.getParameter("index")!="")
		index=Integer.parseInt(request.getParameter("index"));

%>
<c:if test="${empty param.khoa}">
	<c:set var="giaoVienList" value="<%=ThanhVienDAO.getAllGiaoVienOrderByTen()%>"></c:set>
</c:if>
<c:if test="${not empty param.khoa}">
	<c:set var="giaoVienList" value="<%=ThanhVienDAO.getThanhVienByMaBoPhan(khoa)%>"></c:set>
</c:if>

<c:if test="${empty param.gv}">
	<c:set var="lopHocList" value="<%=LopHocDAO.getAllKiHieuLop()%>"></c:set>
</c:if>
<c:if test="${not empty param.gv}">
	<c:set var="lopHocList" value="<%=MonHocTKBDAO.getLopHocByMaGiaoVien(gv)%>"></c:set>
</c:if>

<c:if test="${empty param.lop}">
	<c:set var="monHocList" value="<%=MonHocDAO.getMonHoc() %>"></c:set>
</c:if>

<c:if test="${not empty param.lop}">
	<c:set var="monHocList" value="<%=MonHocTKBDAO.getMonHocByMaLopAndMaGiaoVien(lop,gv)%>"></c:set>
</c:if>



<c:set var="boPhan" value='<%=session.getAttribute("maBoPhan").toString() %>'></c:set>
<c:set var="vaiTro" value='<%=session.getAttribute("maVaiTro").toString() %>'></c:set>
<c:set var="vaiTroTK" value='<%=Constant.MA_VAI_TRO_TK%>'></c:set>
<c:set var="Admin" value='<%=Constant.ADMIN %>'></c:set>
<c:set var="boPhanBGH" value='<%=Constant.BO_PHAN_BGH %>'></c:set>
<c:set var="boPhanPDT" value='<%=Constant.BO_PHAN_PDT %>'></c:set>
<c:set var="boPhanPKD" value='<%=Constant.BO_PHAN_PKID %>'></c:set>

<c:if test="${ not empty param.view }">
	<c:set var="kqTimKiemList" value='<%=KeHoachGiangDayDAO.findKHGD(gv,nam,lop,mon,hk,tt,index,Constant.NUM_RECORD_TIMGIAOAN)%>'></c:set>
</c:if>



<c:set var="TT_SEND" value="<%=Constant.TINHTRANG_SEND %>"></c:set>
<c:set var="TT_CHUATHUCHIEN" value="<%=Constant.TINHTRANG_CHUATHUCHIEN %>"></c:set>
<c:set var="TT_NEW" value="<%=Constant.TINHTRANG_NEW %>"></c:set>
<c:set var="TT_APPROVE" value="<%=Constant.TINHTRANG_APPROVE %>"></c:set>
<c:set var="TT_REJECT" value="<%=Constant.TINHTRANG_REJECT %>"></c:set>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->


<title>Tìm kiếm kế hoạch giảng dạy</title>
<style>
	.tblTimKiem td{
		height:30px;
	}
	.tblTimKiem tr{
		height:30px;
	}
	

</style>
<script>
	function change_selLopHoc()
	{
		var strPath="";
		var objKhoa=document.getElementById("selKhoa");
		var objGiaoVien=document.getElementById("selGiaoVien");
		var objLopHoc=document.getElementById("selLopHoc");
		
		if(objKhoa.selectedIndex!=0)
			strPath=strPath+"&khoa="+objKhoa.value;


		if(objGiaoVien.selectedIndex!=0)
			strPath=strPath+"&gv="+objGiaoVien.value;

		if(objLopHoc.selectedIndex!=0)
			strPath=strPath+"&lop="+objLopHoc.value;
		
		location.href="TimKeHoachGiangDay.jsp?change=true"+strPath;		
	}

	function change_selGiaoVien()
	{
		var strPath="";
		var objKhoa=document.getElementById("selKhoa");
		var objGiaoVien=document.getElementById("selGiaoVien");
		
		if(objKhoa.selectedIndex!=0)
			strPath=strPath+"&khoa="+objKhoa.value;


		if(objGiaoVien.selectedIndex!=0)
			strPath=strPath+"&gv="+objGiaoVien.value;

		location.href="TimKeHoachGiangDay.jsp?change=true"+strPath;
	}

	function change_selKhoa()
	{
		var strPath="";
		var objKhoa=document.getElementById("selKhoa");
		
		if(objKhoa.selectedIndex!=0)
			strPath=strPath+"&khoa="+objKhoa.value;
		
		location.href="TimKeHoachGiangDay.jsp?change=true"+strPath;
	}

	function click_btnTim()
	{
		var strPath="TimGiaoAn.jsp?view=true";
		var objNamHoc=document.getElementById("selNamHoc");
		var objHocKi=document.getElementById("selHocKi");
		var objMonHoc=document.getElementById("selMonHoc");
		var objGiaoVien=document.getElementById("selGiaoVien");
		var objTinhTrang=document.getElementById("selTinhTrang");
		var objLopHoc=document.getElementById("selLopHoc");
		var objKhoa=document.getElementById("selKhoa");

		if(objNamHoc.selectedIndex!=0)
			strPath=strPath+"&nam="+objNamHoc.value;

		if(objHocKi.selectedIndex!=0)
			strPath=strPath+"&hk="+objHocKi.value;

		if(objMonHoc.selectedIndex!=0)
			strPath=strPath+"&mon="+objMonHoc.value;

		if(objGiaoVien.selectedIndex!=0)
			strPath=strPath+"&gv="+objGiaoVien.value;

		if(objTinhTrang.selectedIndex!=0)
			strPath=strPath+"&tt="+objTinhTrang.value;

		if(objLopHoc.selectedIndex!=0)
			strPath=strPath+"&lop="+objLopHoc.value;

		if(objKhoa.selectedIndex!=0)
			strPath=strPath+"&khoa="+objKhoa.value;
		

		
		location.href=strPath;
	}	

</script>

</head>
<body>

<div align="center">


<div class = "div_pagebody">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form name='frmSearchGiaoAn' id='frmSearchGiaoAn'>
		<p style="font-weight:bold;font-size:20px" >Báo cáo tiến độ thực hiện kế hoạch giảng dạy </p>
	
	<br/>
	
	<br/>
	
	<br/>
	<table class="tblTimKiem" style="background-color: transparent;">
		<tr style="background-color: transparent;"><td style='color:blue;text-align:left' colspan="7" >Thông tin tìm kiếm</td></tr>
		<tr style="background-color: transparent;">
			<td>Khoa</td>
			<td style='text-align:left'>
			

				<select id="selKhoa" name="selKhoa" onchange="change_selKhoa()" <c:if test="${ boPhan ne boPhanBGH and vaiTro ne Admin and boPhan ne boPhanPDT and boPhan ne boPhanPKD  }">disabled="disabled"</c:if> ><option>--All--</option>
					<c:forEach items="${khoaList}" var="objKhoa">
						<option value="${objKhoa.maKhoa}" <c:if test="${(objKhoa.maKhoa eq param.khoa) or (boPhan eq objKhoa.maKhoa and (boPhan ne boPhanBGH and vaiTro ne Admin and boPhan ne boPhanPDT and boPhan ne boPhanPKD)  )}">selected</c:if>>${objKhoa.tenKhoa}</option>
					</c:forEach>
				</select>
			</td>
			<td>Năm học</td>
			<td style='text-align:left'> 
				<select id="selNamHoc" name="selNamHoc"><option>--All--</option>
				<c:forEach items="${namHocList}" var="objNamHoc">
						<option value="${objNamHoc.maNamHoc}" <c:if test="${objNamHoc.maNamHoc eq param.nam }">selected</c:if> >${objNamHoc.namBatDau}-${objNamHoc.namKetThuc}</option>
				</c:forEach>
				
				</select>
			</td>
			<td>Học kì</td>
			<td style='text-align:left'>
				<select id="selHocKi" name="selHocKi"><option>--All--</option>
					<option value='1' <c:if test="${param.hk eq '1'}">selected</c:if>>I</option>
					<option value='2' <c:if test="${param.hk eq '2'}">selected</c:if>>II</option>
				</select>
			</td>
			<td></td>
		</tr>
		<tr style="background-color: transparent;">
			<td>Giáo viên</td>
			<td style='text-align:left'>
				<select name="selGiaoVien" id="selGiaoVien" onchange="change_selGiaoVien()" <c:if test="${ vaiTro ne vaiTroTK and boPhan ne boPhanBGH and vaiTro ne Admin and boPhan ne boPhanPDT and boPhan ne boPhanPKD }">disabled="disabled"</c:if>><option>--All--</option>
					<c:forEach items="${giaoVienList}" var="objGiaoVien">
						<option value="${objGiaoVien.maThanhVien}" <c:if test="${(objGiaoVien.maThanhVien eq param.gv ) or (sessionScope.maThanhVien eq objGiaoVien.maThanhVien and vaiTro ne Admin and vaiTro ne vaiTroTK and boPhan ne boPhanBGH and boPhan ne boPhanPDT and boPhan ne boPhanPKD) }">selected</c:if>>${objGiaoVien.hoThanhVien} ${objGiaoVien.tenLot} ${objGiaoVien.tenThanhVien}</option>
					</c:forEach>

				</select>
			
			</td>
			<td>Lớp học</td>
			<td style='text-align:left'>
				<select name="selLopHoc" id="selLopHoc" onchange='change_selLopHoc()'>
					<option>--All--</option>
					<c:forEach items="${lopHocList}" var="objLopHoc">
						<option value="${objLopHoc.maLopHoc}" <c:if test="${objLopHoc.maLopHoc eq param.lop }">selected</c:if>> ${objLopHoc.kiHieu}</option>
					</c:forEach>
						
				</select>
			
			
			</td>
			<td>Tình trạng</td>
			<td style='text-align:left'>
				<select id="selTinhTrang" name="selTinhTrang">
					<option>--All--</option>
					
					<option <c:if test="${param.tt eq TT_NEW}">selected</c:if> value="${TT_NEW}">Mới</option>
					
					<option <c:if test="${param.tt eq TT_SEND}">selected</c:if> value="${TT_SEND}">Pending</option>
					
					<option <c:if test="${param.tt eq TT_REJECT}">selected</c:if> value="${TT_REJECT}">Reject</option>
					
					<option <c:if test="${param.tt eq TT_APPROVE}">selected</c:if> value="${TT_APRROVE}">Approve</option>	
				</select>
			</td>
			<td>
				
			</td>
			
		</tr>
		<tr style="background-color: transparent;">
			<td>
			Môn học 
			</td>
			<td colspan="6" style="text-align:left">
				<select id="selMonHoc" name="selMonHoc"><option>--All--</option>
					<c:forEach items="${monHocList}" var="objMonHoc">
							<option value="${objMonHoc.maMonHoc}" <c:if test="${objMonHoc.maMonHoc eq param.mon }">selected</c:if>>${objMonHoc.tenMonHoc}</option>
					</c:forEach>
				</select>
				
			</td>
		</tr>
		<tr style="background-color: transparent;"><td colspan="7" style="text-align:right"><input type="button" value="Tìm kiếm" onclick="click_btnTim()"/></td></tr>	
		
	</table>
	
	<br/>
	<br/>
	<br/>
	
	<table border="1">
		<tr style="background-color: transparent;"><td style='color:black;text-align:center;font-weight:bold' colspan="9">Kết quả tìm kiếm</td></tr>
		<tr style="background-color: transparent;">
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Môn học</th>
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Lớp học</th>
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Tên giáo án</th>
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Giáo viên</th>
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Ngày dạy</th>
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Ngày gởi</th>
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Người duyệt</th>
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Ngày duyệt</th>
			<th style='font-weight:bold;color:white' bgcolor= '#186fb2'>Tình trạng</th>
		</tr>
		<c:if test="${ not empty param.view}">
			<c:forEach var="objKQTim" items="${kqTimKiemList}"> 
				<tr style="background-color: transparent;">
					<td>${objKQTim.tenMonHoc}</td>
					<td>${objKQTim.tenLopHoc}</td>
					<td>${objKQTim.soGiaoAn}</td>
					<td>${objKQTim.tenGiaoVien}</td>
					<td>${objKQTim.ngayDay}</td>
					<td>${objKQTim.ngayGui}</td>
					<td>${objKQTim.tenNguoiDuyet}</td>
					<td>${objKQTim.ngayDuyet}</td>
					<td>
					
					<c:if test="${objKQTim.tinhTrang eq TT_SEND}">
							Đã gởi
					</c:if>
					<c:if test="${objKQTim.tinhTrang eq TT_APPROVE}">
							Approve
					</c:if>
					<c:if test="${objKQTim.tinhTrang eq TT_REJECT}">
							REJECT
					</c:if>
					<c:if test="${objKQTim.tinhTrang eq TT_NEW}">
							Mới
					</c:if>
					
					
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
	</table>	
	<br/>
	<br/>
	<br/>
		Trang 
							<c:forEach var="numPage" items="${showNumPage}">
								${numPage} 
							</c:forEach>
	<br/>
	<br/>
	<br/>
		
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;"><td style="color:blue;text-align:left" >Chức năng</td></tr>
		<tr style="background-color: transparent;"><td><input type='button' value='In kết quả'/></td></tr>
	</table>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>

</div>

</body>
</html>