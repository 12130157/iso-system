<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@taglib prefix="w" uri="http://weblib.kth.taglib" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>

<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.util.DateUtil" %>

<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
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
	String path="TimGiaoAn.jsp?view=true";
	String path2="";
	if(request.getParameter("gv")!=null&&request.getParameter("gv")!="")
	{
		gv=request.getParameter("gv").toString();
		path=path+"&gv="+gv;
		path2=path2+"&gv="+gv;
	}
	String nam="";
	if(request.getParameter("nam")!=null&&request.getParameter("nam")!="")
	{
		nam=request.getParameter("nam");
		path=path+"&nam="+nam;
		path2=path2+"&nam="+nam;
	}
	String lop="";
	if(request.getParameter("lop")!=null&&request.getParameter("lop")!="")
	{
		lop=request.getParameter("lop");
		path=path+"&lop="+lop;
		path2=path2+"&lop="+lop;
	}
	
	String mon="";
	if(request.getParameter("mon")!=null&&request.getParameter("mon")!="")
	{
		mon=request.getParameter("mon");
		path=path+"&mon="+mon;
		path2=path2+"&mon="+mon;
	}
	
	String hk="";
	if(request.getParameter("hk")!=null&&request.getParameter("hk")!="")
	{
		hk=request.getParameter("hk");
		path=path+"&hk="+hk;
		path2=path2+"&hk="+hk;
	}
	
	String tt="";
	if(request.getParameter("tt")!=null&&request.getParameter("tt")!="")
	{
		tt=request.getParameter("tt");
		path=path+"&tt="+tt;
		path2=path2+"&tt="+tt;
	
	}
	
	String khoa="";
	if(request.getParameter("khoa")!=null&&request.getParameter("khoa")!="")
	{
		khoa=request.getParameter("khoa");
		path=path+"&khoa="+khoa;
		path2=path2+"&khoa="+khoa;
	}
	
	String ngayBD="";
	if(request.getParameter("date1")!=null&&request.getParameter("date1")!="")
	{
		ngayBD=request.getParameter("date1");
		path=path+"&date1="+ngayBD;
		path2=path2+"&date1="+ngayBD;
	}
	
	String ngayKT="";
	if(request.getParameter("date2")!=null&&request.getParameter("date2")!="")
	{
		ngayKT=request.getParameter("date2");
		path=path+"&date2="+ngayKT;
		path2=path2+"&date2="+ngayKT;
	}
	
	int index=1;
	if(request.getParameter("pIndex")!=null&&request.getParameter("pIndex")!=""){
		index=Integer.parseInt(request.getParameter("pIndex"));
		path=path+"&pIndex="+index;
	}

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


<%
	String maBoPhan=(String) request.getSession().getAttribute("maBoPhan");
 %>
<c:if test="${ not empty param.view}">

	<c:set var="totalPage" value='<%=GiaoAnDAO.getLengthOfFindGiaoAn(gv,nam,lop,mon,hk,tt,ngayBD,ngayKT,maBoPhan,khoa) %>'></c:set>
	<c:set var="kqTimKiemList" value='<%=GiaoAnDAO.findGiaoAn(request.getParameter("pIndex"),Constant.NUM_RECORD_TIMGIAOAN,gv,nam,lop,mon,hk,tt,ngayBD,ngayKT,maBoPhan,khoa)%>' scope="session"></c:set>
</c:if>

<c:set var="TT_SEND" value="<%=Constant.TINHTRANG_SEND %>"></c:set>
<c:set var="TT_CHUATHUCHIEN" value="<%=Constant.TINHTRANG_CHUATHUCHIEN %>"></c:set>
<c:set var="TT_NEW" value="<%=Constant.TINHTRANG_NEW %>"></c:set>
<c:set var="TT_APPROVE" value="<%=Constant.TINHTRANG_APPROVE %>"></c:set>
<c:set var="TT_REJECT" value="<%=Constant.TINHTRANG_REJECT %>"></c:set>
<c:set var="COHIEU_LT" value="<%=Constant.COHIEULT %>"></c:set>
<c:set var="COHIEU_TH" value="<%=Constant.COHIEUTH %>"></c:set>
<c:set var='ngayHienTai' value='<%=DateUtil.setDate3(SysParamsDAO.getSysParams().getGioHeThong()) %>'></c:set>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->


<title>Tìm kiếm giáo án</title>
<style>
	.tblTimKiem td{
		height:30px;
	}
	.tblTimKiem tr{
		height:30px;
	}
	

</style>
<script>

	var namePage="TimGiaoAn.jsp";
	var pathGA=window.location;
	
	function loadData(){
		document.getElementById("pathPage").value=pathGA;	
	}
	
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
		
		location.href=namePage+"?change=true"+strPath;		
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

		location.href=namePage+"?change=true"+strPath;
	}

	function change_selKhoa()
	{
		var strPath="";
		var objKhoa=document.getElementById("selKhoa");
		
		if(objKhoa.selectedIndex!=0)
			strPath=strPath+"&khoa="+objKhoa.value;
		
		location.href=namePage+"?change=true"+strPath;
	}

	function click_btnTim()
	{
		var strPath=namePage+"?view=true";
		var objNamHoc=document.getElementById("selNamHoc");
		var objHocKi=document.getElementById("selHocKi");
		var objMonHoc=document.getElementById("selMonHoc");
		var objGiaoVien=document.getElementById("selGiaoVien");
		var objTinhTrang=document.getElementById("selTinhTrang");
		var objLopHoc=document.getElementById("selLopHoc");
		var objKhoa=document.getElementById("selKhoa");
		var objNgayDayBD=document.getElementById("txtNgayDayBD");
		var objNgayDayKT=document.getElementById("txtNgayDayKT");
		

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
		
		if(objNgayDayBD.value!="")
			strPath=strPath+"&date1="+objNgayDayBD.value;
		if(objNgayDayKT.value!="")	
			strPath=strPath+"&date2="+objNgayDayKT.value;
		
		location.href=strPath;
	}	
	
	function click_TinhTrang(maKHGD,maGA,maNguoiTao,ngayGui,soGA){		
		if (confirm('Bạn có chắc muốn approve giáo án này không ?')) {

				document.getElementById("actionType").value="approveTimGA";
				document.getElementById("txtCalendar1").value=ngayGui;
				document.getElementById("txtSoGA").value=soGA;
				document.getElementById("maKHGD").value=maKHGD;
				document.getElementById("maGiaoAn").value=maGA;
				document.getElementById("pathPage").value=pathGA;	
				document.getElementById("txtMaNguoiTao").value=maNguoiTao;		
				document.forms["frmSearchGiaoAn2"].submit();
		}
	}
	
	function click_SendMail(){
			if (confirm('Bạn có chắc muốn email cho các giáo viên này không ?')) {
				document.getElementById("actionType").value="emailNhacNho";
				document.forms["frmSearchGiaoAn2"].submit();
			}
	}
	


</script>

</head>
<body onload="loadData()">

<div align="center">


<div class = "div_pagebody">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form name='frmSearchGiaoAn' id='frmSearchGiaoAn'>
		<p style="font-weight:bold;font-size:20px" >Báo cáo tiến độ thực hiện giáo án </p>
	
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
					
					<option <c:if test="${param.tt eq TT_SEND}">selected</c:if> value="${TT_SEND}">Đã gởi</option>
					
					<option <c:if test="${param.tt eq TT_REJECT}">selected</c:if> value="${TT_REJECT}">Reject</option>
					
					<option <c:if test="${param.tt eq TT_APPROVE}">selected</c:if> value="${TT_APPROVE}">Approve</option>	
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
			<td>
			
			</td>
		</tr>
		<tr style="background-color: transparent;" >
			<td>
			</td>
			<td style="text-align:left">
				<input type='hidden'  id="txtNgayDayBD" size = 8 name="txtNgayDayBD"  value='${param.date1 }' ></input>
			</td>
			<td>
			</td>
			<td colspan='5' style="text-align:left">
				<input type='hidden' id='txtNgayDayKT' size = 8 value='${param.date2 }'  name='txtNgayDayKT'></input>
			</td>

			
		</tr>
		<tr style="background-color: transparent;"><td colspan="7" style="text-align:right"><input type="button" value="Tìm kiếm" onclick="click_btnTim()"/></td></tr>	
		<tr style="background-color: transparent;"><td colspan="7" style="text-align:right">
			
			<a href = "<%=Constant.PATH_RES.getString("iso.InKetQuaTimGiaoAn") %>">								 
						<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
		</td></tr>	

		
	</table>
	
	<br/>
	<br/>
	<br/>
	</form>
	<form name='frmSearchGiaoAn2' id='frmSearchGiaoAn2' method="post" action="<%=request.getContextPath()%>/GiaoAnController">
		<input type="hidden" name="txtSoGA" id="txtSoGA"></input>
		<input type="hidden" name="maGiaoAn" id="maGiaoAn"></input>
		<input type="hidden" name="maKHGD" id="maKHGD"></input>
		<input type="hidden" name="txtMaNguoiTao" id="txtMaNguoiTao"></input>
		<input type="hidden" name="txtCalendar1" id="txtCalendar1"></input>
		<input type="hidden" name="pathPage" id="pathPage" value=""></input>
		<input type="hidden" name="actionType" id="actionType"></input>
		
		<p style='color:black;text-align:center;font-weight:bold'>Kết quả tìm kiếm</p>
	<w:table  id="tbl2" border="1" nameForm="frmSearchGiaoAn2" idForm="frmSearchGiaoAn2" linkTo="TimGiaoAn.jsp">
		<w:init_param_table nameSortType="sortType" nameColSort="colSort" nameIDTableSort="tbl2"></w:init_param_table>
		<w:query_string>
			<w:parameter name="view">true<%=path%></w:parameter>
		</w:query_string>
		<w:row_header style="background-color: transparent;">
			<w:cell_header enableSort="true" style='font-weight:bold;color:white;background-color:#186fb2;cursor:pointer' >Môn học</w:cell_header>
			<w:cell_header enableSort="true" style='font-weight:bold;color:white;background-color:#186fb2;cursor:pointer' >Giáo viên</w:cell_header>
			<w:cell_header enableSort="true" style='font-weight:bold;color:white;background-color:#186fb2;cursor:pointer' >Lớp học</w:cell_header>
			<w:cell_header enableSort="true" type="java.lang.Integer" style='font-weight:bold;color:white;cursor:pointer;background-color:#186fb2' >Tên giáo án</w:cell_header>
			<w:cell_header enableSort="true" style='font-weight:bold;color:white;background-color:#186fb2;cursor:pointer' >Ngày gởi</w:cell_header>
			<w:cell_header enableSort="true" style='font-weight:bold;color:white;background-color:#186fb2;cursor:pointer' >Người duyệt</w:cell_header>
			<w:cell_header enableSort="true" style='font-weight:bold;color:white;background-color:#186fb2;cursor:pointer' >Ngày duyệt</w:cell_header>
		</w:row_header>
		
		<c:if test="${ not empty param.view}">
			<% int countEmail=0; %>
			
			<c:set var='color' value=''></c:set>
			<c:set var='ngayHienTai' value='<%=DateUtil.setDate3(SysParamsDAO.getSysParams().getGioHeThong()) %>'></c:set>
		
			<c:forEach var="objKQTim" items="${kqTimKiemList}"> 
				<c:if test="${ empty objKQTim.tinhTrang}">
					<c:set var='color' value=';background-color:red'></c:set>
				</c:if>
				<c:if test="${ not empty objKQTim.tinhTrang}"> 
					<c:set var='color' value=''></c:set>
					<c:if test="${ sf:compareDate(ngayHienTai,objKQTim.ngayDay) eq true  and objKQTim.tinhTrang eq TT_NEW }">
						<c:set var='color' value=';background-color:red'></c:set>
					</c:if>
					<c:if test="${ sf:compareDate(ngayHienTai,objKQTim.ngayDay) eq false and objKQTim.tinhTrang eq TT_NEW }">
						<c:set var='color' value=''></c:set>
					</c:if>
				</c:if>

				<w:row style="background-color: transparent;">		
				
				
					<w:cell>
						<c:if test="${objKQTim.coHieu eq COHIEU_LT}">
							<a href='GiaoAnLT.jsp?maCTKHGD=${objKQTim.maCTKHGD}&stt=update&soGA=${objKQTim.soGiaoAn}'>${objKQTim.tenMonHoc}</a>
						</c:if>
						<c:if test="${objKQTim.coHieu eq COHIEU_TH}">
							<a href='GiaoAnTH.jsp?maCTKHGD=${objKQTim.maCTKHGD}&stt=update&soGA=${objKQTim.soGiaoAn}'>${objKQTim.tenMonHoc}</a>
						</c:if>
						<c:if test="${objKQTim.coHieu ne COHIEU_LT and objKQTim.coHieu ne COHIEU_TH}">
							<a href='GiaoAnTHop.jsp?maCTKHGD=${objKQTim.maCTKHGD}&stt=update&soGA=${objKQTim.soGiaoAn}'>${objKQTim.tenMonHoc}</a>
						</c:if>
					
					</w:cell>	
					<w:cell>${objKQTim.tenGiaoVien}</w:cell>
					<w:cell>${objKQTim.tenLopHoc}</w:cell>
					<w:cell>${objKQTim.soGiaoAn}</w:cell>
					<w:cell>${objKQTim.ngayGui}</w:cell>
					<w:cell>${objKQTim.tenNguoiDuyet}</w:cell>
					<w:cell>${objKQTim.ngayDuyet}
					
						<c:if test="${ sf:compareDate(ngayHienTai,objKQTim.ngayDay) eq true  and objKQTim.tinhTrang eq TT_NEW }">
							<input type="hidden" value="${objKQTim.maGiaoVien}" name="txtMaGiaoVien_<%=countEmail %>" id="txtMaGiaoVien_<%=countEmail %>"></input>
							<input type="hidden" value="${objKQTim.soGiaoAn}" name="txtSoGiaoAn_<%=countEmail %>" id="txtSoGiaoAn_<%=countEmail %>"></input>
							<input type="hidden" value="${objKQTim.tenGiaoVien}" name="txtTenGiaoVien_<%=countEmail %>" id="txtTenGiaoVien_<%=countEmail %>"></input>
							<input type="hidden" value="${objKQTim.tenLopHoc}" name="txtTenLopHoc_<%=countEmail %>" id="txtTenLopHoc_<%=countEmail %>"></input>
							<input type="hidden" value="${objKQTim.ngayDay}" name="txtNgayDay_<%=countEmail %>" id="txtNgayDay_<%=countEmail %>"></input>
							<input type="hidden" value="${objKQTim.tenMonHoc}" name="txtTenMonHoc_<%=countEmail %>" id="txtTenMonHoc_<%=countEmail %>"></input>
							<% countEmail++; %>
						</c:if>
					
					</w:cell>
			
						
						
				</w:row>
			</c:forEach>
			<input type="hidden" name="totalEmail" id="totalEmail" value="<%=countEmail %>"></input>
		</c:if>
		
	</w:table>	
	<br/>
	<br/>
	<br/>		 
	<c:if test ="${vaiTro eq Admin or vaiTro eq vaiTroTK}">
	<div style='text-align:center'>
			<img style="cursor:pointer;" src="<%=request.getContextPath()%>/images/buttom/emailnhacnho.png" alt="Email nhắc nhở" border = "0" onclick="click_SendMail()"/>
	</div>
	
	</c:if>
<br/>
	<br/>
	<br/>
	
<div>
<c:set var="TOTAL_RECORD_SHOW" value='<%=Constant.NUM_RECORD_TIMGIAOAN %>'></c:set>

		<c:if test="${totalPage ge TOTAL_RECORD_SHOW}">
			<w:paging style="color:blue;cursor:pointer" styleIndexChoose="color:red;pointer:cursor" pathName="TimGiaoAn.jsp" pageName="pIndex" enableFirstPage="true" enableLastPage="true" index="<%=index %>" enableSubmit="true" enableIndexChoose="true"
					idForm="frmSearchGiaoAn" nameForm="frmSearchGiaoAn" numRecordDivide="${TOTAL_RECORD_SHOW}" numPageDivide="5" totalRecord="${totalPage}">
				<w:parameter name="view">true<%=path2%></w:parameter>
			</w:paging>
		</c:if>
	</div>

	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>

</div>
<script type="text/javascript">
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtNgayDayBD",
	button            : "Calendar",
	ifFormat          : "%d-%m-%Y"
  });
//]]>
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtNgayDayKT",
	button            : "Calendar",
	ifFormat          : "%d-%m-%Y"
  });
//]]>
 </script>

</body>
</html>