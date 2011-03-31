<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.DeCuongMonHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.MonHocTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietTKBModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.TuanLeModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.TuanLeDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.NoiDungDCMHModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NoiDungDCMHDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>

<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThoiKhoaBieuController"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.util.DateUtil"%>


<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHGDModel"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
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

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>KẾ HOẠCH GIẢNG DẠY</title>

<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
<c:set var = "HieuTruong" value = "<%= Constant.HIEU_TRUONG %>"></c:set>
<c:set var = "TruongKhoa" value = "<%= Constant.TRUONG_KHOA %>"></c:set>
<c:set var = "GiaoVien" value = "<%=Constant.GIAO_VIEN %>"></c:set>
<c:set var = "Admin" value = "<%=Constant.ADMIN %>"></c:set>
<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
<c:set var = "NEW" value = "<%= Constant.TINHTRANG_NEW %>"></c:set>
<c:set var = "SEND" value = "<%= Constant.TINHTRANG_SEND %>"></c:set>
<c:set var = "REJECT" value = "<%= Constant.TINHTRANG_REJECT %>"></c:set>
<c:set var = "APPROVE" value = "<%= Constant.TINHTRANG_APPROVE %>"></c:set>
<c:set var = "TK_APPROVE" value = '<%=Constant.TINHTRANG_TK_APPROVE%>'> </c:set>
<c:set var = "TK_REJECT" value = '<%=Constant.TINHTRANG_TK_REJECT%>'> </c:set>
<c:set var = "TK_SEND" value = '<%=Constant.TINHTRANG_TK_SEND%>'> </c:set>
<c:set var = "HT_APPROVE" value = '<%=Constant.TINHTRANG_HT_APPROVE%>'> </c:set>
<c:set var="coHieuLT" value='<%=Constant.COHIEULT %>'></c:set>
<c:set var="coHieuTH" value='<%=Constant.COHIEUTH %>'></c:set>
<c:set var="coHieuTHop" value='<%=Constant.COHIEUTHOP %>'></c:set>
<c:set var="coHieuKT" value='<%=Constant.COHIEUKT %>'></c:set>

	<c:set var="maKhoa" value='<%=(String) request.getSession().getAttribute("maBoPhan") %>'></c:set>	
	<c:set var="boPhanHC" value='<%=Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var="boPhanKDCL" value='<%=Constant.BO_PHAN_PKID %>'></c:set>
	<c:set var="boPhanPDT" value='<%=Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var="boPhanBGH" value='<%=Constant.BO_PHAN_BGH %>'></c:set>

	<c:set var="thuocCN" value="0"></c:set>
	<c:if test="${ maKhoa eq boPhanHC or maKhoa eq boPhanKDCL or maKhoa eq boPhanPDT or maKhoa eq boPhanBGH }">
		<c:set var="thuocCN" value="1"></c:set>
	</c:if>

<% ArrayList<ArrayList<ChiTietTKBModel>> chiTietTKBGroupSTTND=new ArrayList<ArrayList<ChiTietTKBModel>>(); %>
<% ArrayList<ArrayList<ArrayList<ChiTietTKBModel>>> chiTietTKBGroupNhom=new ArrayList<ArrayList<ArrayList<ChiTietTKBModel>>>(); %>
<% ArrayList<ArrayList<ChiTietKHGDModel>> chiTietKHGDGroupSTTND=new ArrayList<ArrayList<ChiTietKHGDModel>>(); %>
<% ArrayList<ArrayList<ArrayList<ChiTietKHGDModel>>> chiTietKHGDGroupNhom=new ArrayList<ArrayList<ArrayList<ChiTietKHGDModel>>>(); %>

	
	
<c:if test="${not empty param.maKHGD}">
	<c:set var="objKHGD" value = '<%=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(request.getParameter("maKHGD"))%>'></c:set>
	<c:set var="totalGiaoAnReject" value='<%=GiaoAnDAO.getTotalGiaoAnByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
	<c:set var="totalCTKHGD" value='<%=ChiTietKHGDDAO.getTotalChiTietKHGDByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
	<c:set var="totalGiaoAnNew" value='<%=GiaoAnDAO.getTotalGiaoAnNewByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
	<c:set var="maNguoiTao" value='${objKHGD.maNguoiTao}'></c:set>
	<c:set var="tuanLeKHGDList" value='<%=ChiTietKHGDDAO.getTuanByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
	<% chiTietKHGDGroupSTTND=ChiTietKHGDDAO.getGroupNoiDungChiTietKHGDByMaKHGD(request.getParameter("maKHGD")); %>
	<% chiTietKHGDGroupNhom=ChiTietKHGDDAO.getGroupNhomChiTietKHGDByMaKHGD(request.getParameter("maKHGD"));%>
</c:if>

<c:if test="${empty param.maKHGD and not empty param.maLop}">
		<c:set var="thoiKhoaBieuList" value = '<%=ThoiKhoaBieuDAO.getThoiKhoaBieuApproveByMaLop(request.getParameter("maLop").toString())%>'></c:set>
		<c:if test="${not empty param.maTKB}">
			<c:set var="thoiKhoaBieuModel" value = '<%=ThoiKhoaBieuDAO.getThoiKhoaBieuByID(request.getParameter("maTKB").toString())%>'></c:set>
			<c:if test="${ vaiTro ne Admin }">
				<c:set var="monHocTKBList" value = '<%=MonHocTKBDAO.getMonHocTKBByMaTKBAndMaGiaoVien(request.getParameter("maTKB").toString(),request.getSession().getAttribute("maThanhVien").toString())%>'></c:set>
			</c:if>
			<c:if test="${ vaiTro eq Admin}">
				<c:set var="monHocTKBList" value = '<%=MonHocTKBDAO.getMonHocTKBByMaTKB(request.getParameter("maTKB").toString())%>'></c:set>
			</c:if>
			<c:set var="keHoachGiangDayList" value='<%=KeHoachGiangDayDAO.getAllLopAndMonHocOfKHGD()%>'></c:set>			
			<c:if test="${not empty param.maMonHoc}">
				<% MonHocTKBModel monHocTKBModel=MonHocTKBDAO.getMonHocTKBByMaTKBAndMaMonHoc(request.getParameter("maTKB").toString(),request.getParameter("maMonHoc").toString()); %>
				<c:set var="monHocTKBModel" value='<%=monHocTKBModel%>'></c:set>
				<c:set var="chiTietTKBList" value='<%=ChiTietTKBDAO.getChiTietTKBByMaTKBAndMaMonHocTKB(request.getParameter("maTKB").toString(),monHocTKBModel.getMaMonHocTKB()) %>'></c:set>
				<c:set var="tuanLeTKBList" value='<%=ChiTietTKBDAO.getTuanByMaTKBAndMaMonHocTKB(request.getParameter("maTKB").toString(),monHocTKBModel.getMaMonHocTKB()) %>'></c:set>
				<c:set var="deCuongMonHocModel" value='<%=DeCuongMonHocDAO.getDCMHApproveByMaCTDTAndMaMonHoc(LopHocDAO.getMaChuongTrinhByMaLop(request.getParameter("maLop")),request.getParameter("maMonHoc"))%>'></c:set>
				<% chiTietTKBGroupSTTND=ChiTietTKBDAO.getGroupNoiDungChiTietTKBByMaTKBAndMaMonHocTKB(request.getParameter("maTKB").toString(),monHocTKBModel.getMaMonHocTKB()); %>
				<% chiTietTKBGroupNhom=ChiTietTKBDAO.getGroupNhomChiTietTKBByMaTKBAndMaMonHocTKB(request.getParameter("maTKB").toString(),monHocTKBModel.getMaMonHocTKB());%>
				<c:set var="objCVCB" value="<%=KeHoachGiangDayDAO.GetCongViecChuanBi() %>"></c:set>
			</c:if>			
		</c:if>
</c:if>

<c:if test="${not empty param.maKHGD and not empty param.cp and objKHGD.maNguoiTao eq sessionScope.maThanhVien}">
	<c:set var="thoiKhoaBieuListCopy" value = '<%=ThoiKhoaBieuDAO.getThoiKhoaBieuByMaGVAndMaMH(request.getSession().getAttribute("maThanhVien").toString(),request.getParameter("maMonHocCopy"))%>'></c:set>
	<c:if test="${ not empty param.maTKBCopy }">
		<c:set var="lopListCopy" value = '<%=MonHocTKBDAO.getLopByMaGVAndMaMHAndMaTKB(request.getSession().getAttribute("maThanhVien").toString(),request.getParameter("maMonHocCopy"),request.getParameter("maTKBCopy"))%>'></c:set>
		<c:set var="thoiKhoaBieuCopyModel" value = '<%=ThoiKhoaBieuDAO.getThoiKhoaBieuByID(request.getParameter("maTKBCopy").toString())%>'></c:set>
	</c:if>
</c:if>

<script language="JavaScript" type="text/javascript">
	var maChuongTrinhDaoTao;
	var maDCMH;
	var maTKB;
	var maMonHocTKB;
	var tuanBatDauLT;
	var tuanKetThucLT;
	var tuanBatDauTH;
	var tuanKetThucTH;
	var namBatDau;
	var namKetThuc;
	var soTuan = 0;
	var tuanBatDau;
	var tuanKetThuc;
	var ngayBatDau;
	var ngayKetThuc;
	
	function selectLop(){
		temp1="";
		if(document.getElementById("cboLop").value!=null&&document.getElementById("cboLop").value!="")
			temp1="&maLop="+document.getElementById("cboLop").value;
		
		var strPath=<% out.print("'"+request.getContextPath()+"/ISO/KeHoachGiangDay/KeHoachGiangDay.jsp"+"?Them=ok'"); %>+temp1;
		location.href=strPath;
	}

	function selectThoiKhoaBieu(){
		temp2="";
		if(document.getElementById("cboTKB").value!=null&&document.getElementById("cboTKB").value!="")
			temp2="&maTKB="+document.getElementById("cboTKB").value;
		var strPath=<% out.print("'"+request.getContextPath()+"/ISO/KeHoachGiangDay/KeHoachGiangDay.jsp"+"?Them=ok'"); %>+"&maLop="+document.getElementById("cboLop").value+temp2;
		location.href=strPath;
	}

	function selectMonHoc(){
		temp3="";
		if(document.getElementById("cboMonHoc").value!=null&&document.getElementById("cboMonHoc").value!="")
			temp3="&maMonHoc="+document.getElementById("cboMonHoc").value;
		var strPath=<% out.print("'"+request.getContextPath()+"/ISO/KeHoachGiangDay/KeHoachGiangDay.jsp"+"?Them=ok'"); %>+"&maLop="+document.getElementById("cboLop").value+"&maTKB="+document.getElementById("cboTKB").value+temp3
		location.href=strPath;
			
	}

	function validateForm(){
		
		var sttAlert=true;
		var count=parseInt(document.getElementById("countTemp2").value);
		var i;
		for(i=0;i<count;i++){
			var strTH=document.getElementById("areaTH_"+i);
			var strCVCB=document.getElementById("areaCVCB_"+i);
			if(rightSpace(strTH.value)==""&&strTH.readOnly==false){
				document.getElementById("ftAlertTH"+i).innerHTML="*";
				sttAlert=false;	
			}
			else
				document.getElementById("ftAlertTH"+i).innerHTML="";

			if(rightSpace(strCVCB.value)==""){
				document.getElementById("ftAlertCVCB"+i).innerHTML="*";
				sttAlert=false;
			}
			else
				document.getElementById("ftAlertCVCB"+i).innerHTML="";			
		}

		if(sttAlert==false){
			document.getElementById("bAlert").innerHTML="";
			document.getElementById("ftAlertShow").innerHTML="<input type='text' id='txtFocus'/>";
			document.getElementById("txtFocus").focus();
			document.getElementById("ftAlertShow").innerHTML="Nhập dữ liệu vào ô (*)";
		
		}
		
		return sttAlert;
	}
	

	function submitForm(){
		if(validateForm()){
			objMonHocChoose=document.getElementById("cboMonHoc");	
			document.getElementById("cboTenMonHoc").value=objMonHocChoose.options[objMonHocChoose.selectedIndex].text;
			document.forms["KeHoachGiangDay"].submit();
		}
	}
	
	function submitCopyForm(){
		if(validateForm()){
			document.getElementById("cboTenMonHoc").value=document.getElementById("aTenMonHocCopy").innerHTML;
			document.forms["KeHoachGiangDay"].submit();
		}
	}
	

	function confirmSending() {

		if(validateForm()){
			if (confirm('Bạn có chắc muốn gửi kế hoạch này không ?')) {
				document.KeHoachGiangDay.Gui.value = 'Gui';
				submitForm();
			}
		}
	
		
	}
	
	function rightSpace(str)
	{
		var length=str.length-1;
		while(length>=0&&str.charAt(length)==' ')
		{
			length--;
		}
		return str.substr(0,length+1);
	}

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
			height=200;
			width=300;
			x=(window.screen.width-width)/2;
			y=(window.screen.height-height)/2;
			value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: "+height+"px; dialogWidth: "+width+"px; dialogTop:"+y+"px; dialogLeft:"+x+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
			if(value != false && value != null)
			{
				act = 'Reject';
				document.getElementById('Duyet').value = act;
				document.getElementById('LyDoReject').value = value;
			}
			else
				return;
		}
		if(confirm("Bạn có chắc muốn " + act + " kế hoạch này không?"))
			document.forms["Duyet1KH"].submit();	
	}

	function showPopUp(x)
	{
		 var myObject = new Object();
		    myObject.valueContent = document.getElementById(x).innerHTML;
		    myObject.titleContent =mapTitleByID(x); 
		    myObject.quyen=document.getElementById("quyen").value;
		    myObject.maLoai=mapMaLoaiByID(x);
		    height=450;
		    if(myObject.quyen=="false")
				width=450;
		    else
				width=850;
			z=(window.screen.width-width)/2;
			y=(window.screen.height-height)/2;
			
		var value =window.showModalDialog(<% String path="'"+request.getContextPath()+"/ISO/GiaoAn/NhapText.jsp'"; out.print(path);%>,myObject,"dialogHeight: "+height+"px; dialogWidth: "+width+"px; dialogTop:"+y+"px; dialogLeft:"+z+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value!=false&&value!=undefined)
			document.getElementById(x).innerHTML=value;			
	}

	function mapTitleByID(x)
	{
		if(x.substr(0,8)=="areaCVCB")
			return "Công việc chuẩn bị";
		else if(x.substr(0,6)=="areaTH")
			return "Giáo án thực hành";
		else  if(x.substr(0,6)=="areaLT")
			return "Giáo án lý thuyết";		
		return "";
	}

	function mapMaLoaiByID(x)
	{
		if(x.substr(0,8)=="areaCVCB")
			return <%=Constant.MALOAI_CVCBTRUOCKHIGIANGDAY %>;		
		return "";
	}

	
	function showPopUpLT(areaId)
	{
		var objLT=document.getElementById(areaId);
		if(objLT.value!=''&&objLT.value!=null)
		{
			var myObject = new Object();
		    myObject.valueContent = objLT.innerHTML;
		    myObject.titleContent =mapTitleByID(areaId); 
		    myObject.quyen="false";
		    height=450;
			width=450;
		
			z=(window.screen.width-width)/2;
			y=(window.screen.height-height)/2;
			
			value =window.showModalDialog(<%String pathLT="'"+request.getContextPath()+"/ISO/GiaoAn/NhapText.jsp'"; out.print(pathLT);%>,myObject,"dialogHeight: "+height+"px; dialogWidth: "+width+"px; dialogTop:"+y+"px; dialogLeft:"+z+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
			if(value!=false&&value!=undefined)
				document.getElementById(x).innerHTML=value;						
		}
	}

	function showPopUpTH(areaId)
	{
		var objLT=document.getElementById(areaId);		
		
			
			var myObject = new Object();
		    myObject.valueContent = objLT.innerHTML;
		    myObject.titleContent =mapTitleByID(areaId); 
		    myObject.quyen=document.getElementById("quyen").value;
		    myObject.loai="TH";
		    
		    height=450;
			width=450;
		
			z=(window.screen.width-width)/2;
			y=(window.screen.height-height)/2;
			
			var value =window.showModalDialog(<%String pathTH="'"+request.getContextPath()+"/ISO/GiaoAn/NhapText.jsp'"; out.print(pathTH);%>,myObject,"dialogHeight: "+height+"px; dialogWidth: "+width+"px; dialogTop:"+y+"px; dialogLeft:"+z+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
			if(value!=false&&value!=undefined)
				document.getElementById(areaId).innerHTML=value;						
		
	}

	function change_ThoiKhoaBieuCopy(strID){
		var temp2="";
		if(document.getElementById(strID).value!=null&&document.getElementById(strID).value!="")
			temp2="&maTKBCopy="+document.getElementById(strID).value;
		var strPath=<%=("'"+request.getContextPath()+"/ISO/KeHoachGiangDay/KeHoachGiangDay.jsp"+"?cp=true&maKHGD="+request.getParameter("maKHGD")+"&maMonHocCopy="+request.getParameter("maMonHocCopy")+"'") %>+temp2;
	
		location.href=strPath;
		
	}
	
	

</script>
</head>

<body>

<div align="center";>
			<!-- S HEAD CONTENT -->
					<jsp:include page="../../block/header.jsp" />
			<!-- E HEAD CONTENT -->
			
			<font color='red' id="ftAlertShow"></font>
			<form action="<%=request.getContextPath()%>/keHoachGiangDayController?them=yes" method="post" name="KeHoachGiangDay">
			
				<c:if test="${param.cp eq 'true' and not empty param.maKHGD and not empty param.maTKBCopy and not empty param.maMonHocCopy  }">
					<input type='hidden' name='sttKHGDCopy' value='true' id='sttKHGDCopy'></input>
				</c:if>
				
				<input type='hidden' id='sttIsMaKHGD' value="<c:if test='${ empty param.maKHGD }'>false</c:if>"/>
				
				<input type="hidden" name="maKHGD" id="maKHGD" value="${objKHGD.maKHGD}" />
				<c:set var="SysParamsObj" value="<%=SysParamsDAO.getSysParams()%>"></c:set>	
				<c:if test="${not empty param.Them}">
					<% Constant.NUM_ROWS = 1; %>
				</c:if>
				
				<c:if test="${not empty param.msg and param.msg eq 'send'}">
					<b class="msg" id="bAlert">Đã gởi lên trưởng khoa</b>
				</c:if>
				
				<c:if test="${not empty param.errApproveThieu}">
					<b class="error" id="bAlert">Giáo án chưa đủ</b>
				</c:if>
				
				<c:if test="${not empty param.errMail}">
					<b class="error" id="bAlert">Giáo án không đủ</b>
				</c:if>
				
				<c:if test="${not empty param.errTrung}">
					<b class="error" id="bAlert">Kế hoạch giảng dạy này đã có rồi</b>
				</c:if>
				<c:if test="${not empty param.err}">
					<b class="error" id="bAlert"> Nhập liệu vào các ô bắt buộc (*) </b>
				</c:if>
				<c:if test="${not empty param.msg and param.msg eq 'ThemMoi'}">
					<b class="msg" id="bAlert"> Thêm mới "KẾ HOẠCH GIẢNG DẠY" thành công </b>
				</c:if>
				<c:if test="${(not empty param.msg and param.msg eq 'CapNhat')
									or (not empty requestScope.msgDeleteRow)}">
					<b class="msg" id="bAlert"> Cập nhật "KẾ HOẠCH GIẢNG DẠY" thành công </b>
				</c:if>	
				
				<c:if test="${ empty param.msg }">
					<b class="msg" id="bAlert"></b>
				</c:if>	
				
				
				
				<table width = "800" style="background-color: transparent;">
					<tr style="background-color: transparent;">
						<td>ỦY BAN NHÂN DÂN QUẬN 5<br />TRƯỜNG TCN KTCN HÙNG VƯƠNG </td>
						<td>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />Độc lập – Tự do – Hạnh phúc</td>
					</tr>
				</table>
				
				<table width = "800" style="background-color: transparent;">
					<tr style="background-color: transparent;">
						<td colspan="6">
							<strong>KẾ HOẠCH GIẢNG DẠY HỆ TRUNG CẤP NGHỀ/CAO ĐẲNG NGHỀ</strong>
						</td>
					</tr>
					<c:if test="${ empty param.cp}">
					<tr style="background-color: transparent;">
						<td width="90px">
							<div class="div_textleft">Lớp</div>
						</td>
						<td width="80px">
							<div class="div_textleft">
							<c:if test="${not empty param.maKHGD}">
								<input type="hidden" id="txtLopHoc" name="txtLopHoc" value="${objKHGD.maLop}"/>
								<input type="hidden" id="txtMonHoc" name="txtMonHoc" value="${objKHGD.maMonHoc }"/>
								<input type="hidden" id="txtTenMonHoc" name="txtTenMonHoc" value="${objKHGD.tenMonHoc }"/>
							</c:if>						
							<select  name="cboLop" id="cboLop" onchange="selectLop();"  <c:if test="${not empty param.maKHGD}">disabled="disabled"</c:if>>
								<option value = "">--Select--</option>
								<c:forEach var = "objLop" items="<%= LopHocDAO.getAllKiHieuLopAndMaChuongTrinh()%>">
										<option value="${objLop.maLopHoc}" <c:if test="${objKHGD.maLop eq objLop.maLopHoc and not empty param.maKHGD}">selected</c:if> <c:if test="${param.maLop eq objLop.maLopHoc and empty param.maKHGD}">selected</c:if>>${objLop.kiHieu}</option>
								</c:forEach>
							</select>
							<c:if test="${not empty param.err and objLop.maLopHoc eq ''}"><b class="error">(*)</b></c:if></div>
						</td>
						<c:if test="${empty param.maKHGD}">
						<td>
							<div class="div_textleft">Thời khoá biểu</div></td><td colspan="3"><div class="div_textleft">
							<select name="cboTKB" id="cboTKB" onchange="selectThoiKhoaBieu();">
								<option value = "">--Select--</option>
								<c:if test="${ not empty param.maLop}">
									
									<c:forEach var="objThoiKhoaBieu" items="${thoiKhoaBieuList}">
											<option <c:if test="${objThoiKhoaBieu.maThoiKhoaBieu eq param.maTKB}">selected</c:if> value='${objThoiKhoaBieu.maThoiKhoaBieu}'>${objThoiKhoaBieu.user1}</option>
									</c:forEach>
								</c:if>
							</select>
						<c:if test="${not empty param.err}"><b class="error">(*)</b></c:if></div></td></c:if>
					</tr>
					<tr style="background-color: transparent;">
						<td>
							<div class="div_textleft">Môn học</div>
						</td>
						<td colspan="5"><div class="div_textleft">
							<select name="cboMonHoc" id="cboMonHoc" onchange="selectMonHoc();" <c:if test="${not empty param.maKHGD}">disabled="disabled"</c:if>>
								<option value = "">--Select--</option>
								<c:if test="${not empty param.maKHGD}">
									<c:forEach var = "objMonHoc" items="<%= MonHocDAO.getMonHoc()%>">
										<option value="${objMonHoc.maMonHoc}" <c:if test="${objKHGD.maMonHoc eq objMonHoc.maMonHoc}">selected</c:if>>${objMonHoc.tenMonHoc}</option>
									</c:forEach>
								</c:if>
								<c:if test="${empty param.maKHGD}">
										<c:if test="${not empty param.maTKB}">
											
											<c:forEach var="objMonHocTKB" items="${monHocTKBList}">
												<c:set var="tempSTT" value="0"></c:set>
												<c:forEach var="objKHGDModel" items="${keHoachGiangDayList}">
													<c:if test="${objKHGDModel.maLop eq param.maLop and objKHGDModel.maMonHoc eq objMonHocTKB.maMonHoc}">
														<c:set var="tempSTT" value="1"></c:set>
													</c:if>
												</c:forEach>
												<c:if test="${tempSTT ne '1'}">
													<option <c:if test="${objMonHocTKB.maMonHoc eq param.maMonHoc}">selected</c:if> value='${objMonHocTKB.maMonHoc}'>
														${objMonHocTKB.tenMonHoc}
													</option>
												</c:if>
												
											</c:forEach>
										</c:if>
								</c:if>
							</select>
							 
							<c:if test="${not empty param.err and objMonHoc.maMonHoc eq ''}"><b class="error">(*)</b></c:if></div>
						</td>
					</tr>
					</c:if>
					
					<!-- FORM COPY ---- -->
					<c:if test="${not empty param.maKHGD and not empty param.cp and param.cp eq 'true'}">
					<tr style="background-color: transparent;">
						<td colspan="2">
							<div class="div_textleft">Thời khóa biểu</div>
						</td>
						<td  colspan="4">
							<div class="div_textleft">
								<select name="cboTKB" id="cboTKB" onchange="change_ThoiKhoaBieuCopy(this.id)">
								<option value = "">--Select--</option>
								<c:if test="${ not empty param.maMonHocCopy and not empty param.cp and param.cp eq 'true'}">
									<c:forEach var="objThoiKhoaBieuCopy" items="${thoiKhoaBieuListCopy}">
											<option <c:if test="${objThoiKhoaBieuCopy.maThoiKhoaBieu eq param.maTKBCopy}">selected</c:if> value='${objThoiKhoaBieuCopy.maThoiKhoaBieu}'>${objThoiKhoaBieuCopy.tenThoiKhoaBieu}</option>
									</c:forEach>
								</c:if>
								</select>
							</div>
						</td>	
					</tr>
					
					<tr style="background-color: transparent;">
						<td width="90px" colspan="1">
							<div class="div_textleft">Môn học: </div>
						</td>
						<td colspan="3">
							<div class="div_textleft" style="font-weight:bold">
								<input type='hidden' name="cboMonHoc" id="cboMonHoc" value="${param.maMonHocCopy}"/>
								<a id="aTenMonHocCopy" name="aTenMonHocCopy"><%=MonHocDAO.getMonHocByMaMonHoc(request.getParameter("maMonHocCopy")).getTenMonHoc() %></a>
							</div>
						</td>
						
						<td>
							<div class="div_textleft">Lớp</div>
				
						</td>
						<td>
							<div class="div_textleft">
									
									<select  name="cboLop" id="cboLop" >
										<option value = "">--Select--</option>
										<c:forEach var = "objLop" items="${lopListCopy}">
												<option value="${objLop.maLopHoc}">${objLop.kiHieu}</option>
										</c:forEach>
									</select>
								
							</div>
						</td>
					</tr>
					</c:if>
					<!-- ------------------ -->
					
					<tr style="background-color: transparent;">
						<td>
							<div class = "div_textleft">Học kỳ : </div> 
						</td>
						<td align="left" width="90px">
						<input type = "text" id="txtHocKi" name="txtHocKi" style="background-color: transparent;width:50px" readonly="readonly" value="<c:if test="${not empty param.maKHGD}">${objKHGD.hocKi}</c:if><c:if test="${empty param.maKHGD and not empty param.maTKB}">${thoiKhoaBieuModel.hocKi}</c:if>"/> 
						</td>
						<td  width="150px">
							<div class = "div_textleft">Số giờ  môn học :</div> 
						</td>
						<td>
							<input type = "text" id="txtSoGioMonHoc" name="txtSoGioMonHoc" style="background-color: transparent;width:50px" readonly="readonly" value="<c:if test="${not empty param.maKHGD}">${objKHGD.soGioLT + objKHGD.soGioTH}</c:if><c:if test="${empty param.maKHGD and not empty param.maMonHoc and not empty param.maLop}">${deCuongMonHocModel.lyThuyet+deCuongMonHocModel.thucHanh}</c:if>" /> 
						</td>
						<td width="100px">
							<div class = "div_textleft">Giáo viên :</div> 
						</td>
						<td>
							<input type = "text" id="txtGiaoVien" name="txtGiaoVien" style="background-color: transparent;" readonly="readonly" value="<c:if test="${not empty param.maKHGD}">${objKHGD.tenGiaoVien}</c:if><c:if test="${empty param.maKHGD and not empty param.maMonHoc}">${monHocTKBModel.tenGiaoVien}</c:if>"/>
						</td>
					</tr>
					<tr style="background-color: transparent;">
						<td>
							<div class = "div_textleft">Năm học :</div> 
						</td>
						<td width="90px" align="left">
							<input type = "text" id="txtNamHoc" name="txtNamHoc" style="background-color: transparent;width:80px" readonly="readonly" value="<c:if test="${not empty param.maKHGD and empty param.cp}">${objKHGD.namHoc}</c:if><c:if test="${not empty param.maKHGD and not empty param.cp and 'true' and not empty param.maTKBCopy}">${thoiKhoaBieuCopyModel.nam1} - ${thoiKhoaBieuCopyModel.nam1+1}</c:if><c:if test="${empty param.maKHGD and not empty param.maTKB}">${thoiKhoaBieuModel.nam1} - ${thoiKhoaBieuModel.nam1+1}</c:if>" /> 
						</td>
						<td>
							<div class = "div_textleft">Số giờ lý thuyết :</div> 
						</td>
						<td>
							<input type = "text" id="txtSoGioLT" name="txtSoGioLT" style="background-color: transparent;width:50px" readonly="readonly" value="<c:if test="${not empty param.maKHGD}">${objKHGD.soGioLT}</c:if><c:if test="${empty param.maKHGD and not empty param.maMonHoc and not empty param.maLop}">${deCuongMonHocModel.lyThuyet}</c:if>"/> 
						</td>
						<td width="150px" >
							<div class = "div_textleft">Số ca thực hành :</div> 
						</td>
						<td>
							<input type = "text" id="txtSoCaTH" name="txtSoCaTH" style="background-color: transparent;width:50px" readonly="readonly" value="<c:if test="${not empty param.maKHGD}">${objKHGD.soCaThucHanh}</c:if><c:if test="${empty param.maKHGD and not empty param.maMonHoc}">${monHocTKBModel.soCaThucHanh}</c:if>"/> 
						</td>
					</tr>
					<tr style="background-color: transparent;">
						<td></td>
						<td></td>
						<td align="left">
							 <div class = "div_textleft">Số giờ thực hành :</div>
						</td>
						<td>
							<input type = "text" id="txtSoGioTH" name="txtSoGioTH" style="background-color: transparent;width:50px" readonly="readonly" value="<c:if test="${not empty param.maKHGD}">${objKHGD.soGioTH}</c:if><c:if test="${empty param.maKHGD and not empty param.maMonHoc and not empty param.maLop}">${deCuongMonHocModel.thucHanh}</c:if>"/> 
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
				
							<input type="hidden"  name="cboTenMonHoc" id="cboTenMonHoc"/>
				<c:if test="${not empty param.maKHGD}">
					<input type='hidden' value='${objKHGD.tinhTrang }' name='txtTinhTrangTK'/>
					<input type='hidden' value='${objKHGD.tenKHGD}' name='txtTenKHGD'/>
					
				</c:if>
				
								<a href="<%=request.getContextPath()%>/ISO/GiaoAn/GiaoAnChuaThucHien.jsp?maKHGD=${param.maKHGD}">Giáo án chưa thực hiện</a>
				<br/>
				
				<table width = "800" border = "1" style="background-color: transparent;" id="TableNoiDung">
					<tr style="background-color: transparent;">
						<td style="width: 80px"><b>Tuần lễ</b></td>
						
						<td>
							<table border="1" style="border-bottom: none;border-top: none;background-color: transparent; width: 630px">
								<tr>
									<td style="width: 104px;font-weight:bold">Thời gian giảng dạy</td>
									<td style="width: 142px;font-weight:bold">Nội dung giảng dạy (Tên chương, bài, đề mục theo chương trình đã qui định)</td>
									<td style="width: 142px;font-weight:bold">Tên sản phẩm ứng dụng trong bài tập</td>
									<td style="width: 142px;font-weight:bold">Công việc chuẩn bị</td>
									<td><b>Giáo án</b></td>
									
								</tr>
							</table>
						
						</td>
					</tr>
					
				
					
					<%int count4=0; int count3=0; %>
					<!-- ------------------------------------------------------------------------------------------------------------- -->
					<c:if test="${empty param.maKHGD and not empty param.maLop and not empty param.maTKB and not empty param.maMonHoc}">
					
						<% int count1=0; %>
						<% count3=0; %>
						<% count4=0; %>
						<c:forEach items="${tuanLeTKBList}" var="tuanLeObj">
							<tr>
								<td style="width: 80px">Tuần ${tuanLeObj.maTuanLe} <br/> Từ ngày <br/> ${tuanLeObj.tuNgay} <br/> Đến ngày <br/> ${tuanLeObj.denNgay} </td>
								<td>
									<c:set var="cTTKBGroupSTTNDElement" value="<%=chiTietTKBGroupSTTND.get(count1) %>"></c:set>
									
									<%int count2=0; %>
									<c:forEach items="${cTTKBGroupSTTNDElement}" var="obj1">
										
										<table border="1" style="border-bottom: none;border-top: none;background-color: transparent; width: 630px">
											<tr>
												<td style="width:104px;" >
													<div id='col1_<%=count3%>' style="padding-top:10px;padding-bottom:10px;padding-left:10px;padding-right:10px" >
														<c:if test="${obj1.coHieu eq coHieuLT}">
															<font color='blue'>Lý thuyết</font>
														</c:if>
														<c:if test="${obj1.coHieu eq coHieuTH}">
															<font color='blue'>Thực hành</font>
														</c:if>
														<c:if test="${obj1.coHieu ne coHieuLT and obj1.coHieu ne coHieuTH}">
															<c:if test="${obj1.coHieu eq coHieuTHop}">
																<font color='blue'>Tích hợp</font>
															</c:if>
															<c:if test="${obj1.coHieu eq coHieuKT}">
																<font color='blue'>Kiểm tra</font>
															</c:if>
														</c:if>
														
														<c:set var="cTTKBGroupNhomElement" value="<%=chiTietTKBGroupNhom.get(count1).get(count2) %>"></c:set>
														<c:forEach items="${cTTKBGroupNhomElement}" var="obj2">
														<br/><br/><b> Ca ${ obj2.nhom } </b> 
															<br/> ${obj2.ngayHoc} 
															<br/> Buổi: ${obj2.buoi}<br/> 
															
															${sf:getThu(obj2.thuTrongTuan)}
														
															
															<br/> Phòng: ${obj2.phong}
														
															<input type='hidden' name='hdnCoHieu_<%=count4%>' value='${obj2.coHieu}'/>
															<input type='hidden' name='hdnNgayBD_<%=count4%>' value='${obj2.ngayHoc}'/>
															<input type='hidden' name='hdnTenChuong_<%=count4%>' value='${obj2.user2}'/>
															<input type='hidden' name='hdnTuan_<%=count4%>' value='${obj2.tuan}'/>
															<input type='hidden' name='hdnNhom_<%=count4%>' value='${obj2.nhom}'/>
															<input type='hidden' name='hdnSTTNoiDung_<%=count4%>' value='${obj2.sTTNoiDung}'/>
															<input type='hidden' name='hdnThu_<%=count4%>' value='${obj2.thuTrongTuan}'/>
															<input type='hidden' name='hdnBuoi_<%=count4%>' value='${obj2.buoi}'/>
															<input type='hidden' name='hdnTenPhong_<%=count4%>' value='${obj2.phong}'/>
															
															<% count4++; %>
														</c:forEach>					
													</div>																
												</td>
											
													<td style="width:142px;">
														<textarea  name='areaLT_<%=count3%>' rows='10' id='areaLT_<%=count3%>'  <c:if test="${obj1.coHieu ne coHieuTH}">style="cursor:pointer"</c:if> cols="15" readonly="readonly" onclick='showPopUpLT(this.id)'>${obj1.tenChuong}</textarea>
														<input type='hidden' name='txtMucTieuBaiHoc_<%=count3%>' id='txtMucTieuBaiHoc_<%=count3%>' value='${obj1.mucTieu}'></input>
													
													</td>
													<td style="width:142px;"><font color='red' style='font-weight:bold' id='ftAlertTH<%=count3%>'></font> 
														<textarea  name='areaTH_<%=count3%>' rows='10' id='areaTH_<%=count3%>' cols="15" style="cursor:pointer" onclick="showPopUpTH(this.id)"  ></textarea>
													</td>
												
												
											
												<td style="width:142px;"><font color='red' style='font-weight:bold' id='ftAlertCVCB<%=count3%>'></font><textarea  name='areaCVCB_<%=count3%>' rows='10' id='areaCVCB_<%=count3%>' cols="15" style="cursor:pointer" onclick='showPopUp(this.id)'>${objCVCB}</textarea></td>
												<td>
													<input type='hidden' value='${obj1.tuan}' name='hdnTuanTemp_<%=count3%>'/>
													
													<input type='hidden' value='${obj1.sTTNoiDung}' name='hdnSTTNoiDungTemp_<%=count3%>'/>
													
													<input type='hidden' value='${obj1.nhom}' name='hdnNhomTemp_<%=count3%>'/>
													
													<input type='hidden' value='${obj1.coHieu}' name='hdnCoHieuTemp_<%=count3%>'/>
												</td>
											</tr>
										</table>
										
										<%count2++;%>
										<%count3++;%>
									</c:forEach>
										
								
								
								</td>
								
							</tr>
							<% count1++; %>
						</c:forEach>
						
						
						<input type='hidden' id="SoTietMoiBuoi" name="SoTietMoiBuoi" value="${deCuongMonHocModel.soTietHocMotBuoi}"/>
					</c:if>

					<!-- ------------------------------------------------------------------------------------------------------------- -->
					
					<c:if test="${not empty param.maKHGD}">
					
					
						<input type='hidden' id="SoTietMoiBuoi" name="SoTietMoiBuoi" value="${objKHGD.soTietMoiBuoi}"/>
					
						<% int count1=0; %>
						<% count3=0; %>
						<% count4=0; %>
						<c:forEach items="${tuanLeKHGDList}" var="tuanLeObj">
							<tr>
								<td style="width: 80px">Tuần ${tuanLeObj.maTuanLe} <br/> Từ ngày <br/> ${tuanLeObj.tuNgay} <br/> Đến ngày <br/> ${tuanLeObj.denNgay} </td>
								<td>
									<c:set var="cTKHGDGroupSTTNDElement" value="<%=chiTietKHGDGroupSTTND.get(count1) %>"></c:set>
									
									<%int count2=0; %>
									<c:forEach items="${cTKHGDGroupSTTNDElement}" var="obj1">
										
										<table border="1" style="border-bottom: none;border-top: none;background-color: transparent; width: 630px">
											<tr>
												<td style="width:104px;" >
													<div id='col1_<%=count3%>' style="padding-top:10px;padding-bottom:10px;padding-left:10px;padding-right:10px" >
														<c:if test="${obj1.coHieu eq coHieuLT}">
															<font color='blue'>Lý thuyết</font>
														</c:if>
														<c:if test="${obj1.coHieu eq coHieuTH}">
															<font color='blue'>Thực hành</font>
														</c:if>
														<c:if test="${obj1.coHieu ne coHieuLT and obj1.coHieu ne coHieuTH}">
															<c:if test="${obj1.coHieu eq coHieuTHop}">
																<font color='blue'>Tích hợp</font>
															</c:if>
															<c:if test="${obj1.coHieu eq coHieuKT}">
																<font color='blue'>Kiểm tra</font>
															</c:if>
														</c:if>
														
														<c:set var="cTKHGDGroupNhomElement" value="<%=chiTietKHGDGroupNhom.get(count1).get(count2) %>"></c:set>
														<c:forEach items="${cTKHGDGroupNhomElement}" var="obj2">
														<br/><br/><b> Ca ${ obj2.nhom } </b> 
															<br/> ${obj2.ngayBD} 
															<br/> Buổi: ${obj2.buoi}<br/> 
															${sf:getThu(obj2.thu)}
														
															
															
															<br/> Phòng: ${obj2.phong}
															<input type='hidden' name='hdnCoHieu_<%=count4%>' value='${obj2.coHieu}'/>
															<input type='hidden' name='hdnNgayBD_<%=count4%>' value='${obj2.ngayBD}'/>
															<input type='hidden' name='hdnTuan_<%=count4%>' value='${obj2.tuan}'/>
															<input type='hidden' name='hdnNhom_<%=count4%>' value='${obj2.nhom}'/>
															<input type='hidden' name='hdnSTTNoiDung_<%=count4%>' value='${obj2.sTTNoiDung}'/>
															<input type='hidden' name='hdnThu_<%=count4%>' value='${obj2.thu}'/>
															<input type='hidden' name='hdnBuoi_<%=count4%>' value='${obj2.buoi}'/>
															<input type='hidden' name='hdnTenPhong_<%=count4%>' value='${obj2.phong}'/>
															<input type='hidden' name='hdnMaCTKHGD_<%=count4%>' value='${obj2.maChiTietKHGD }'/>
															
															
															<% count4++; %>
														</c:forEach>					
													</div>													
												</td>
												
											
													<td style="width:142px;">
														<textarea style="cursor:pointer" name='areaLT_<%=count3%>' rows='10' id='areaLT_<%=count3%>'  cols="15" readonly="readonly" onclick='showPopUpLT(this.id)'>${obj1.tenChuong}</textarea>
														<input type='hidden' name='txtMucTieuBaiHoc_<%=count3%>' id='txtMucTieuBaiHoc_<%=count3%>' value='${obj1.mucTieuBaiHoc}'></input>
													
													</td>
													<td style="width:142px;"><font color='red' style='font-weight:bold' id='ftAlertTH<%=count3%>'></font><textarea  name='areaTH_<%=count3%>' rows='10' id='areaTH_<%=count3%>' cols="15" style="cursor:pointer" onclick="showPopUpTH(this.id)" >${obj1.noiDungTH}</textarea></td>
											
												
												
												
												<td style="width:142px;"><font color='red' style='font-weight:bold' id='ftAlertCVCB<%=count3%>'></font><textarea  name='areaCVCB_<%=count3%>' rows='10' id='areaCVCB_<%=count3%>' cols="15" onclick='showPopUp(this.id)' style="cursor:pointer">${obj1.congViecChuanBi}</textarea></td>
												<td>
													<input type='hidden' value='${obj1.tuan}' name='hdnTuanTemp_<%=count3%>'/>
													
													<input type='hidden' value='${obj1.sTTNoiDung}' name='hdnSTTNoiDungTemp_<%=count3%>'/>
													
													<input type='hidden' value='${obj1.nhom}' name='hdnNhomTemp_<%=count3%>'/>
													
													<input type='hidden' value='${obj1.coHieu}' name='hdnCoHieuTemp_<%=count3%>'/>
													<c:if test="${empty param.cp}">				
													<!-- Ly thuyet -->
													<c:if test="${obj1.coHieu eq coHieuLT}">
														<c:choose>
															<c:when test="${ not empty obj1.maGiaoAn and (((obj1.tinhTrangGiaoAn ne '0' and not empty obj1.tinhTrangGiaoAn) and ( vaiTro eq HieuTruong or vaiTro eq TruongKhoa or thuocCN eq 1)) or  maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin) }">
																	<c:set var="statusGA" value="false"></c:set>
																	<c:if test="${maNguoiTao eq sessionScope.maThanhVien}">
																		<c:forEach var="maGA" items="${maGAList}" >
																			<c:if test="${maGA eq objChiTietKHGD.maGiaoAn}">
																					<c:set var="statusGA" value="true"></c:set>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	
																	<a style="border:none;" href="<%=request.getContextPath()%>/ISO/GiaoAn/GiaoAnLT.jsp?maCTKHGD=${obj1.maChiTietKHGD}&stt=update&soGA=<%=(count3+1) %>">
																		<c:choose>
																			<c:when test="${statusGA eq true}">
																				<img border="0" src="<%=request.getContextPath()%>/images/buttom/capnhat.png" width='55px'/>
																			</c:when>
																			<c:otherwise>
																		
																		
																				<c:if  test='${obj1.tinhTrangGiaoAn eq APPROVE or obj1.tinhTrangGiaoAn eq REJECT }'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/duyet.png" alt="duyet"/>
																				</c:if>
																				<c:if  test='${obj1.tinhTrangGiaoAn eq SEND }'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/dagui.png" alt="dagui"/>
																				</c:if>
																				<c:if  test='${obj1.tinhTrangGiaoAn ne APPROVE and obj1.tinhTrangGiaoAn ne REJECT and obj1.tinhTrangGiaoAn ne SEND}'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/xem.png" alt="xem"/>
																				</c:if>
																			</c:otherwise>
																		</c:choose>
																	</a>
															
															</c:when>
															<c:otherwise>
																<c:if test="${empty obj1.maGiaoAn and (maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin)}">
																	<a style="border:none;" href="<%=request.getContextPath()%>/ISO/GiaoAn/GiaoAnLT.jsp?maCTKHGD=${obj1.maChiTietKHGD}&stt=insert&soGA=<%=(count3+1) %>"><img border="0" src="<%=request.getContextPath()%>/images/buttom/them.png"/></a>
																</c:if> 
															</c:otherwise>		
														</c:choose>
													</c:if>
													
													<!-- Thuc hanh -->
													<c:if test="${obj1.coHieu eq coHieuTH}">
														<c:choose>
															<c:when test="${ not empty obj1.maGiaoAn and (((obj1.tinhTrangGiaoAn ne '0' and not empty obj1.tinhTrangGiaoAn) and ( vaiTro eq HieuTruong or vaiTro eq TruongKhoa or thuocCN eq 1 )) or  maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin)}">
																<c:set var="statusGA" value="false"></c:set>
																<c:if test="${maNguoiTao eq sessionScope.maThanhVien}">
																	
																	<c:forEach var="maGA" items="${maGAList}" >
																		<c:if test="${maGA eq obj1.maGiaoAn}">
																					<c:set var="statusGA" value="true"></c:set>
																		</c:if>
																	</c:forEach>
																</c:if>
																<a style="border:none;" href="<%=request.getContextPath()%>/ISO/GiaoAn/GiaoAnTH.jsp?maCTKHGD=${obj1.maChiTietKHGD}&stt=update&soGA=<%=(count3+1) %>">
																
																	<c:choose>
																		<c:when test="${statusGA eq true}">
																			<img border="0" src="<%=request.getContextPath()%>/images/buttom/capnhat.png" width='55px'/>
																		</c:when>
																		<c:otherwise>
																				<c:if  test='${obj1.tinhTrangGiaoAn eq APPROVE or obj1.tinhTrangGiaoAn eq REJECT }'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/duyet.png" alt="duyet"/>
																				</c:if>
																				<c:if  test='${obj1.tinhTrangGiaoAn eq SEND }'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/dagui.png" alt="dagui"/>
																				</c:if>
																				<c:if  test='${obj1.tinhTrangGiaoAn ne APPROVE and obj1.tinhTrangGiaoAn ne REJECT and obj1.tinhTrangGiaoAn ne SEND }'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/xem.png" alt="xem"/>
																				</c:if>
																		</c:otherwise>
																	</c:choose>
																	
																</a>
															
															</c:when>
															<c:otherwise>
																<c:if test="${empty obj1.maGiaoAn and (maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin)}">
																	<a style="border:none;" href="<%=request.getContextPath()%>/ISO/GiaoAn/GiaoAnTH.jsp?maCTKHGD=${obj1.maChiTietKHGD}&stt=insert&soGA=<%=(count3+1)%>"><img border="0" src="<%=request.getContextPath()%>/images/buttom/them.png"/></a>
																</c:if>
															</c:otherwise>
														</c:choose>		
														</c:if>
														
														<!-- Tich hop -->	
														<c:if test="${obj1.coHieu ne coHieuTH and obj1.coHieu ne coHieuLT}">
														<c:choose>
															<c:when test="${ not empty obj1.maGiaoAn and (((obj1.tinhTrangGiaoAn ne '0' and not empty obj1.tinhTrangGiaoAn) and ( vaiTro eq HieuTruong or vaiTro eq TruongKhoa or thuocCN eq 1)) or  maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin)}">
																<c:set var="statusGA" value="false"></c:set>
																<c:if test="${maNguoiTao eq sessionScope.maThanhVien}">
																	
																	<c:forEach var="maGA" items="${maGAList}" >
																		<c:if test="${maGA eq obj1.maGiaoAn}">
																					<c:set var="statusGA" value="true"></c:set>
																		</c:if>
																	</c:forEach>
																</c:if>
																<a style="border:none;" href="<%=request.getContextPath()%>/ISO/GiaoAn/GiaoAnTHop.jsp?maCTKHGD=${obj1.maChiTietKHGD}&stt=update&soGA=<%=(count3+1) %>">
																
																	<c:choose>
																		<c:when test="${statusGA eq true}">
																			<img border="0"  src="<%=request.getContextPath()%>/images/buttom/capnhat.png" width='55px'/>
																		</c:when>
																		<c:otherwise>
																		
																				<c:if  test='${obj1.tinhTrangGiaoAn eq APPROVE or obj1.tinhTrangGiaoAn eq REJECT }'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/duyet.png" alt="duyet"/>
																				</c:if>
																				<c:if  test='${obj1.tinhTrangGiaoAn eq SEND }'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/dagui.png" alt="dagui"/>
																				</c:if>
																				<c:if  test='${obj1.tinhTrangGiaoAn ne APPROVE and obj1.tinhTrangGiaoAn ne REJECT and obj1.tinhTrangGiaoAn ne SEND}'>
																					<img border="0" src="<%=request.getContextPath()%>/images/buttom/xem.png" alt="xem"/>
																				</c:if>
																		</c:otherwise>
																	</c:choose>
																	
																</a>
															
															</c:when>
															<c:otherwise>
																<c:if test="${empty obj1.maGiaoAn and (maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin)}">
																	<a style="border:none;" href="<%=request.getContextPath()%>/ISO/GiaoAn/GiaoAnTHop.jsp?maCTKHGD=${obj1.maChiTietKHGD}&stt=insert&soGA=<%=(count3+1)%>"><img border="0" src="<%=request.getContextPath()%>/images/buttom/them.png"/></a>
																</c:if>
															</c:otherwise>
														</c:choose>		
														</c:if>
								
													</c:if>
												
												</td>
											</tr>
										</table>
										
										<%count2++;%>
										<%count3++;%>
									</c:forEach>
											
								</td>
								
							</tr>
							
							<% count1++; %>
						</c:forEach>
							
					</c:if>
					
					
					<!-- ------------------------------------------------------------------------------------------------------------- -->
						
				</table>
				
				<input type='hidden' id='countTemp' name='countTemp' value='<%=count4 %>'/>
				<input type='hidden' id='countTemp2' name='countTemp2' value='<%=count3 %>'/>	
				
				<table id="TableHiddenNoiDung">
					<tr><td id="hiddenCol"></td></tr>
				</table>
			
			<table width = "800" style="background-color: transparent;"> 
				<tr style="background-color: transparent;"><td colspan="3"><div class = "div_tr">
				<br />
				Ghi chú:<br />
				- Nếu dạy nhiều lớp cùng tiến độ giảng dạy thì ghi chung kế hoạch.<br />
				- Giáo viên lập thành 3 bản: 1 bản nộp P.Đào Tạo, 1 bản nộp Trưởng Khoa, 1 bản giáo viên lưu.<br />
				</div><br /></td></tr>
				
				<tr style="background-color: transparent;">
					<td></td>
					<td></td>
					<td>Quận 5, ngày ${objKHGD.ngayTao} </td>
				</tr>
				<tr style="background-color: transparent;">
					<td>Hiệu trưởng</td>
					<td>Trưởng khoa</td>
					<td>Giáo viên biên soạn</td>
				</tr>
				<tr style="background-color: transparent;">
					<td><br/><br/><br/>
						<c:if test="${ not empty param.maKHGD and (objKHGD.tinhTrangHT eq APPROVE or objKHGD.tinhTrangHT eq REJECT) }">
							${objKHGD.tenNguoiDuyet}
						</c:if>
						
					</td>
					<td><br/><br/><br/>${objKHGD.tenTruongKhoa}</td>
					<td><br/><br/><br/>${objKHGD.tenNguoiTao}</td>
				</tr>
			</table>
			
			<input type="hidden" id="actionType" name="actionType" style="background-color: transparent;"
				<c:choose>				
					<c:when test="${empty param.maKHGD or ( not empty param.maKHGD and not empty param.cp and param.cp eq 'true' and not empty param.maTKBCopy)}">
						value="ThemMoi"
					</c:when>
					<c:otherwise>
						value="CapNhat"
					</c:otherwise>	
				</c:choose>  
			/>
			
			<br/>
			<br/>
			<br/>
					<input type="hidden" id="rowTable" value="<c:if test='${empty param.maKHGD }'>${count1}</c:if><c:if test='${not empty param.maKHGD }'>${countTemp}</c:if>"/>
		
					<a href = "javascript: submitForm()" name="TaoMoi" > 
					<c:choose>
						<c:when test="${empty param.maKHGD}">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" id="hinhTaoMoi" alt="Tạo mới" border = "0" />
						</c:when>
						<c:otherwise>
							<c:if test="${empty param.cp and (maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin)  and (objKHGD.tinhTrang eq NEW or objKHGD.tinhTrang eq REJECT)}">							
								<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập Nhật" border = "0" />
							</c:if>
							
							
						</c:otherwise>
					</c:choose> 
					</a>

						<c:if test="${empty param.cp}">
							<c:if test="${not empty param.maKHGD and (maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin) and (objKHGD.tinhTrang eq NEW or objKHGD.tinhTrang eq REJECT)}">							
								<a href = "javascript: confirmSending()">
									<input type="hidden" id="Gui" name="Gui"/> 
									<img src="<%=request.getContextPath()%>/images/buttom/guitruongkhoa.png"  alt="Gửi" border = "0" />
								</a>
							</c:if>	
						</c:if>			
					
			<c:if test="${not empty param.maKHGD}">
				<c:if test="${empty param.cp}">
					<c:if test="${(objKHGD.tinhTrangHT eq HT_APPROVE) or (vaiTro eq TruongKhoa and objKHGD.tinhTrangHT eq SEND)}">
						<a href = "<%=Constant.PATH_RES.getString("iso.InKeHoachGiangDayPath") %>?maKHGD=${objKHGD.maKHGD}">								 
							<img src="<%=request.getContextPath()%>/images/buttom/in.png?maKHGD=${param.maKHGD}" alt="Xuất File" border = "0" />
						</a>
					</c:if>
					<c:if test="${ (maKhoa eq boPhanBGH and objKHGD.tinhTrangHT eq SEND) or (vaiTro eq TruongKhoa and (objKHGD.tinhTrang eq SEND or objKHGD.tinhTrangHT eq REJECT)) or (vaiTro eq Admin and objKHGD.tinhTrang ne NEW and objKHGD.tinhTrang ne REJECT and objKHGD.tinhTrangHT ne APPROVE ) }">
						<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Approve" border="0"/> </a>
					</c:if>	
					<c:if test="${ (maKhoa eq boPhanBGH  and objKHGD.tinhTrangHT eq SEND) or (vaiTro eq TruongKhoa and (objKHGD.tinhTrang eq SEND or objKHGD.tinhTrangHT eq REJECT)) or (vaiTro eq Admin and objKHGD.tinhTrang ne NEW and objKHGD.tinhTrang ne REJECT and objKHGD.tinhTrangHT ne APPROVE) }">
						<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" border="0"/> </a>
					</c:if>
				</c:if>
				<c:if test="${( (maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin ) and empty param.cp)}">
					<a href = "KeHoachGiangDay.jsp?maKHGD=${objKHGD.maKHGD}&cp=true&maMonHocCopy=${objKHGD.maMonHoc}">								 
						<img src="<%=request.getContextPath()%>/images/buttom/saochep.png" alt="Sao chép" border = "0" />
					</a>
				</c:if>
				<c:if test="${(maNguoiTao eq sessionScope.maThanhVien or vaiTro eq Admin ) and not empty param.cp }">
					<a href = "javascript: submitCopyForm()" name="TaoMoi" > 
						<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" id="hinhTaoMoi" alt="Tạo mới" border = "0" />
					</a>
				</c:if>
				
				
			</c:if>
			
		</form>
		
		<form method="post" action="<%=request.getContextPath()%>/keHoachGiangDayController?duyet1kehoach=yes&maKHGD=${objKHGD.maKHGD}" name="Duyet1KH">
			<input type="hidden" id="Duyet" name="Duyet" value = "" />
			<input type="hidden" id="LyDoReject" name="LyDoReject" value=""/>
		</form>
		
		<c:choose>
			<c:when test="${not empty param.maKHGD}">
				<c:choose>
					<c:when test="${(sessionScope.maThanhVien eq maNguoiTao or vaiTro eq Admin)  and (objKHGD.tinhTrang eq NEW or objKHGD.tinhTrang eq REJECT)}">
						<input type="hidden" value="true" name="quyen" id="quyen" />
					</c:when>
					<c:otherwise>
						<input type="hidden" value="false" name="quyen" id="quyen" />
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
					<input type="hidden" value="true" name="quyen" id="quyen" />
			</c:otherwise>
		</c:choose>
	
	
	
			<!-- S FOOT CONTENT -->
					<jsp:include page="../../block/footer.jsp" />
			<!-- E FOOT CONTENT -->
			
			
	
	</div>
</body>
</html>