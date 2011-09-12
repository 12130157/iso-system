<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHGDModel"%>


<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.GiaoAnModel"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachGiangDayModel"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=;url=<%=request.getContextPath() %>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<script>
	function validateForm(stt)
	{
		document.getElementById("bAlert").innerHTML="";
		document.getElementById("point").innerHTML="<input type='text' style='background-color: transparent;border:none' id='txtFocus' />";
		document.getElementById("txtFocus").focus();
		document.getElementById("point").innerHTML="";
		thongbao="<font class='error'>(*)</font>";
		var status=1;
		if(isTextBoxNull("txtMucTieu","aMucTieu",thongbao))
		{
			status=0;		
		}
		
		if(isTextBoxNull("txtDoDungPTDH","aDoDungPTDH",thongbao))
		{
			status=0;
		}

		if(isTextBoxNull("txtODLH","aODLH",thongbao))
		{
			status=0;
		}

		if(isTextBoxNull("txtTGOD","aTGOD",thongbao))
		{			
			status=0;
		}
		
		if(isTextBoxNull("txtHDDNGV","aHDDNGV",thongbao))
		{
			status=0;
		}					

		if(isTextBoxNull("txtHDDNHS","aHDDNHS",thongbao))
		{
			status=0;
		}

		if(isTextBoxNull("txtTGDN","aTGDN",thongbao))
		{
			status=0;
		}							

		
		if(isTextBoxNull("txtGiangBaiMoi","aGiangBaiMoi",thongbao))
		{
			status=0;
		}								
		
		if(isTextBoxNull("txtGiangBaiMoiHS","aGiangBaiMoiHS",thongbao))
		{
			status=0;
		}									
		
		if(isTextBoxNull("txtTGGiangBaiMoi","aTGGiangBaiMoi",thongbao))
		{										
			status=0;
		}
		
		if(isTextBoxNull("txtCungCoKienThuc","aCungCoKienThuc",thongbao))
		{
			status=0;
		}

		
		if(isTextBoxNull("txtCungCoGV","aCungCoGV",thongbao))
		{
			status=0;
		}												

		if(isTextBoxNull("txtCungCoHS","aCungCoHS",thongbao))
		{
			status=0;
		}													


		if(isTextBoxNull("txtTGCungCo","aTGCungCo",thongbao))
		{
			status=0;			
		}														
		//
		if(isTextBoxNull("txtHDTH","aHDTH",thongbao))
		{
			status=0;
		}															

		if(isTextBoxNull("txtHDTHGV","aHDTHGV",thongbao))
		{
			status=0;
		}																	

		if(isTextBoxNull("txtHDTHHS","aHDTHHS",thongbao))
		{
			status=0;
		}																	

		if(isTextBoxNull("txtTGHDTH","aTGHDTH",thongbao))
		{
			status=0;
		}																		

		if(isTextBoxNull("txtTaiLieuThamKhao","aTaiLieuThamKhao",thongbao))
		{
			status=0;
		}

		if(isTextBoxNull("txtDanNhap","aDanNhap",thongbao))
		{
			status=0;
		}			
		if(status==0)
			document.getElementById("alert").innerHTML="Bạn phải nhập vào nơi có dấu (*)";															
		else
		{

			document.getElementById("alert").innerHTML="";															
			
			if(!isNumber(document.getElementById("txtTGOD").value))
			{
				thongBaoLoi("aTGOD",thongbao);
				status=2;
			}
			
			if(!isNumber(document.getElementById("txtTGTHBH").value))
			{
				thongBaoLoi("aTGTHBH",thongbao);
				status=2;
			}

			if(!isNumber(document.getElementById("txtTGDN").value))
			{
				thongBaoLoi("aTGDN",thongbao);
				status=2;
			}

			if(!isNumber(document.getElementById("txtTGGiangBaiMoi").value))
			{
				thongBaoLoi("aTGGiangBaiMoi",thongbao);
				status=2;
			}

			if(!isNumber(document.getElementById("txtTGCungCo").value))
			{
				thongBaoLoi("aTGCungCo",thongbao);
				status=2;			
			}

			if(!isNumber(document.getElementById("txtTGHDTH").value))
			{
				thongBaoLoi("aTGHDTH",thongbao);
				status=2;
			}
			
			if(status==2)
				document.getElementById("alert").innerHTML="Bạn chỉ nhập số vào nơi có dấu (*)";
			else
			{
				document.getElementById("alert").innerHTML="";
	
				thoiGianTH=parseInt(document.getElementById("soPhut").innerHTML,"10");
				thoiGianOD=parseInt(document.getElementById("txtTGOD").value,"10");
				thoiGianDN=parseInt(document.getElementById("txtTGDN").value,"10");
				thoiGianGBM=parseInt(document.getElementById("txtTGGiangBaiMoi").value,"10");
				thoiGianCC=parseInt(document.getElementById("txtTGCungCo").value,"10");
				thoiGianHDTH=parseInt(document.getElementById("txtTGHDTH").value,"10");
				tongTGTHBH=thoiGianDN+thoiGianGBM+thoiGianCC+thoiGianHDTH;
								
				if((tongTGTHBH+thoiGianOD)!=thoiGianTH){
					document.getElementById("alert").innerHTML="Các số thời gian thực hiện giáo án không phù hợp";															
					status=3;
				}
				else{
					document.getElementById("txtTGTHBH").value=tongTGTHBH+"";

				}	

			}	

			if(stt=="send")
				document.getElementById("actionType").value="SendLT";
			
			if(status==1){
				document.forms['GiaoAn'].submit();				
			}
		}
				
		


	}

	function calSoTGTHBH()
	{	
		if(document.getElementById("txtTGDN").value!="")
			thoiGianDN=parseInt(document.getElementById("txtTGDN").value,"10");
		else
			thoiGianDN=0;
		if(document.getElementById("txtTGGiangBaiMoi").value!="")
			thoiGianGBM=parseInt(document.getElementById("txtTGGiangBaiMoi").value,"10");
		else
			thoiGianGBM=0;
		if(document.getElementById("txtTGCungCo").value!="")
			thoiGianCC=parseInt(document.getElementById("txtTGCungCo").value,"10");
		else
			thoiGianCC=0;
		if(document.getElementById("txtTGHDTH").value!="")
			thoiGianHDTH=parseInt(document.getElementById("txtTGHDTH").value,"10");
		else
			thoiGianHDTH=0;
		
		if(!isNumber(document.getElementById("txtTGDN").value)||!isNumber(document.getElementById("txtTGGiangBaiMoi").value)||!isNumber(document.getElementById("txtTGCungCo").value)||!isNumber(document.getElementById("txtTGHDTH").value))
		{
			document.getElementById("txtTGTHBH").value="";
		}
		else{
			tongTGTHBH=thoiGianDN+thoiGianGBM+thoiGianCC+thoiGianHDTH;
								
			document.getElementById("txtTGTHBH").value=tongTGTHBH+"";
		}
		
	}
	
	function isTextBoxNull(idstr,idalert,alert)
	{
		str=document.getElementById(idstr).value;
		if(str.length==0||isAllSpace(str)){
			document.getElementById(idalert).innerHTML=alert;
			return true;
		}
		else{
			document.getElementById(idalert).innerHTML="";			
			return false;
		}
		
	}


	function isNumber(str)
	{
		num="0123456789";
		for(i=0;i<str.length;i++)
		{
			for(j=0;j<num.length;j++)
			{
				if(str.charAt(i)==num.charAt(j)){
					j=num.length;
				}
			}
			if(j!=num.length+1)
				return false;
		}
		return true;
	}


    function isAllSpace(str)
    {
        i=0;
        while(i<str.length&&str.charAt(i)==' ')
                i++;
                if(i==str.length)
                    return true;
                else
                    return false;
    }
    
	function showPopUp(x)
	{
		 var myObject = new Object();
		 myObject.valueContent = document.getElementById(x).innerHTML;
		 myObject.titleContent =mapTieuDeByID(x); 
		 var statusAlter="true";
	//	 if(x=="txtDanNhap"||x=="txtGiangBaiMoi")
	//	 	statusAlter="false";
	//	 else
			 statusAlter=document.getElementById("quyen").value;
		 myObject.quyen=statusAlter;
		 myObject.maLoai=mapMaLoaiByID(x);
		 height=450;

		 if(myObject.quyen=="false")
				width=450;
		 else
				width=650;	
		z=(window.screen.width-width)/2;
		y=(window.screen.height-height)/2;
		value = window.showModalDialog("NhapText.jsp",myObject,"dialogHeight: "+height+"px; dialogWidth: "+width+"px; dialogTop:"+y+"px; dialogLeft:"+z+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value!=false&&value!=undefined)
			document.getElementById(x).innerHTML=value;		
	}

	function mapTieuDeByID(id)
	{
		if(id=="txtDanNhap")
		{
			return "Dẫn nhập";	
		}
		else if(id=="txtHDDNGV")
		{
			return "Hướng dẫn dẫn nhập giáo viên";	
		}
		else if(id=="txtHDDNHS")
		{
			return "Hướng dẫn dẫn nhập học sinh";
		}	
		else if(id=="txtGiangBaiMoi")
		{
			return "Giảng bài mới";
		}
		else if(id=="txtGiangBaiMoiGV")
		{
			return "Giảng bài mới giáo viên";
		}
		else if(id=="txtGiangBaiMoiHS")
		{
			return "Giảng bài mới học sinh";
		}		
		else if(id=="txtCungCoKienThuc")
		{
			return "Củng cố kiến thức";	
		}
		else if(id=="txtCungCoGV")
		{
			return "Củng cố kiến thức giáo viên";
		}
		else if(id=="txtCungCoHS")
		{
			return "Củng cố kiến thức học sinh";
		}
		else if(id=="txtHDTH")
		{
			return "Hướng dẫn tự học";
		}
		else if(id=="txtHDTHGV")
		{
			return "Hướng dẫn tự học giáo viên";
		}
		else if(id=="txtHDTHHS")
		{
			return "Hướng dẫn tự học học sinh";
		}
		else
		{
			return "";
		}
	}


	function mapMaLoaiByID(id)
	{
		if(id=="txtDanNhap")
		{
			return "<%=Constant.MALOAI_DANNHAP %>";	
		}
		else if(id=="txtHDDNGV")
		{
			return "<%=Constant.MALOAI_HDDANNHAPCUAGV%>";	
		}
		else if(id=="txtHDDNHS")
		{
			return "<%=Constant.MALOAI_HDDANNHAPCUAHS%>";
		}	
		else if(id=="txtGiangBaiMoi")
		{
			return "<%=Constant.MALOAI_GIANGBAIMOI%>";
		}
		else if(id=="txtGiangBaiMoiGV")
		{
			return "<%=Constant.MALOAI_HDGIANGBAIMOIGV%>";
		}
		else if(id=="txtGiangBaiMoiHS")
		{
			return "<%=Constant.MALOAI_HDGIANGBAIMOIHS%>";
		}		
		else if(id=="txtCungCoKienThuc")
		{
			return "<%=Constant.MALOAI_CUNGCOKIENTHUCVAKETTHUCBAI%>";	
		}
		else if(id=="txtCungCoGV")
		{
			return "<%=Constant.MALOAI_HDCUNGCOKIENTHUCVAKETTHUCBAIGV%>";
		}
		else if(id=="txtCungCoHS")
		{
			return "<%=Constant.MALOAI_HDCUNGCOKIENTHUCVAKETTHUCBAIHS%>";
		}
		else if(id=="txtHDTH")
		{
			return "<%=Constant.MALOAI_HUONGDANTUHOC1%>";
		}
		else if(id=="txtHDTHGV")
		{
			return "<%=Constant.MALOAI_HDHUONGDANTUHOCGV1%>";
		}
		else if(id=="txtHDTHHS")
		{
			return "<%=Constant.MALOAI_HDHUONGDANTUHOCHS1%>";
		}
		else
		{
			return "";
		}
	}

	function thongBaoLoi(idstr,alert)
	{
		document.getElementById(idstr).innerHTML=alert;
	}

	function duyetForm(stt)
	{

		if(stt=="approve")
		{
			if(window.confirm("Bạn có chắc muốn approve giáo án này"))
			{
				document.getElementById("actionType").value="approveLT";
				document.forms['GiaoAn'].submit();	
			}		
		}
		else if(stt=="reject")
		{
			if(window.confirm("Bạn có chắc muốn reject giáo án này"))
			{
				x=(window.screen.width-300)/2;
				y=(window.screen.height-200)/2;
				value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: 200px; dialogWidth: 300px; dialogTop:"+y+"px; dialogLeft:"+x+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
	
				if(value!=null&&value!=""){
					document.getElementById("actionType").value="rejectLT";
					document.getElementById('LyDoReject').value = value;
					document.forms['GiaoAn'].submit();			
				}	
			}
		}		
	}
</script>



<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Thêm giáo án lý thuyết</title>
</head>
<body>

<div align="center">


<div class = "div_pagebody">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
	
	<a id="point"></a>
	
	<br/>
	
	<p id="alert" class="error"></p>
	<p id="alert2" class="error"></p>
	<c:if test="${empty param.err}"><b id="bAlert"></b></c:if>
	<c:if test="${not empty param.err}">
		<c:if test="${param.err eq 'insertTC'}">
			<b class="msg" id="bAlert">Thêm giáo án thành công</b>
		</c:if>		
	
		<c:if test="${param.err eq 'inserTB'}">
			<b class="error" id="bAlert">Thêm giáo án thất bại</b>
		</c:if>		
		
		<c:if test="${param.err eq 'sendTB'}">
			<b class="error" id="bAlert">Không gởi giáo án được</b>
		</c:if>		
		
		<c:if test="${param.err eq 'sendTC'}">
			<b class="msg" id="bAlert">Bạn đã gởi giáo án cho trưởng khoa</b>
		</c:if>		
		
		
		<c:if test="${param.err eq 'updateTC'}">
			<b class="msg" id="bAlert">Cập nhật giáo án thành công</b>
		</c:if>		
		
		<c:if test="${param.err eq 'updateTB'}">
			<b class="error" id="bAlert">Cập nhật giáo án thất bại</b>
		</c:if>
		
		<c:if test="${param.err eq 'rejectTB'}">
			<b class="error" id="bAlert">Reject giáo án thất bại</b>
		</c:if>
		<c:if test="${param.err eq 'rejectTC'}">
			<b class="msg" id="bAlert">Bạn đã reject một giáo án</b>
		</c:if>		
	</c:if>
	<br/>
	<br/>
	<br/>		
	<% 
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		KeHoachGiangDayModel keHoachGiangDayModel=new KeHoachGiangDayModel(); 
			ChiTietKHGDModel chiTietKHGDModel=new ChiTietKHGDModel();
	%>	
	<c:choose>
	<c:when test="${not empty param.maCTKHGD}">
		<c:set var="isMaCTKHGD" value='<%=ChiTietKHGDDAO.isMaCTKHGD(request.getParameter("maCTKHGD"))%>'></c:set>
	</c:when>
	<c:otherwise>
		<jsp:forward page=""/>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${isMaCTKHGD eq true}">
		<c:if test="${param.stt eq 'update'}">
			
			<% String maGA=ChiTietKHGDDAO.getMaGiaoAnByMaCTKHGD(request.getParameter("maCTKHGD"));%>
			<% giaoAnModel=GiaoAnDAO.getGiaoAnLyThuyetByMaGA(maGA); %>	
			<% String maKHGD=ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")); %>
			<% keHoachGiangDayModel=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);%>	
				<% chiTietKHGDModel=ChiTietKHGDDAO.getChiTietKHGDByByMaCTKHGD(request.getParameter("maCTKHGD")); %>
			<c:set var="giaoAnLyThuyet" value='<%=giaoAnModel%>' scope="session"></c:set>
			<c:set var="listTenChuong" value='<%=ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD"))%>' scope="session"></c:set>
			<c:set var="chiTietKHGD" value='<%=chiTietKHGDModel%>' scope="session"></c:set>
			<c:set var="soPhut" value='<%=KeHoachGiangDayDAO.calSoPhutDCMHByMaKHGD(maKHGD,Constant.phutQDLT)%>' scope="session"></c:set>
			<c:set var="objKHGD" value = '<%=keHoachGiangDayModel%>' scope="session"></c:set>
			<c:if test="${empty chiTietKHGD.maGiaoAn}">
				<jsp:forward page=""/>
			</c:if>
			<c:set var="TT_NEW" value='<%=Constant.TINHTRANG_NEW %>' ></c:set>
			<c:set var="TT_REJECT" value='<%=Constant.TINHTRANG_REJECT %>' ></c:set>
			<c:set var="TT_SEND" value='<%=Constant.TINHTRANG_SEND %>' ></c:set>
			<c:set var="HT_APPROVE" value='<%=Constant.TINHTRANG_HT_APPROVE %>' ></c:set>
			
			<c:set var="tinhTrangGA" value='<%=GiaoAnDAO.getTinhTrangGiaoAnByMaGA(maGA) %>' ></c:set>
			<c:set var="tinhTrangKHGD" value='${objKHGD.tinhTrang}'></c:set>
			<c:set var="tinhTrangHT" value='${objKHGD.tinhTrangHT}'></c:set>
		
			<c:set var="maNguoiTao" value='${objKHGD.maGiaoVien}'></c:set>
			<c:set var="vaiTro" value='<%= (String) session.getAttribute("maVaiTro") %>'></c:set>
			<c:set var="vaiTro_TK" value='<%= Constant.TRUONG_KHOA %>'></c:set>
			<c:set var="vaiTro_PK" value='<%= Constant.PHO_KHOA %>'></c:set>
			<c:set var="Admin" value='<%=Constant.ADMIN%>'></c:set>
			
		</c:if>
		
		<c:if test="${param.stt eq 'insert'}">
			<c:set var="listTenChuong" value='<%=ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD"))%>'></c:set>
			<c:set var="blockTenChuong" value='<%=ChiTietKHGDDAO.getBlockTenChuong(ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD")))%>'></c:set>
			
			<c:set var="maNguoiTao" value='${objKHGD.maGiaoVien}'></c:set>
			<c:set var="chiTietKHGD" value='<%=ChiTietKHGDDAO.getChiTietKHGDByByMaCTKHGD(request.getParameter("maCTKHGD"))%>'></c:set>
			<c:set var="soPhut" value='<%=KeHoachGiangDayDAO.calSoPhutDCMHByMaKHGD(ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")),Constant.phutQDLT)%>'></c:set>
			<c:set var="objKHGD" value = '<%=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")))%>' scope="session"></c:set>
			<c:if test="${not empty chiTietKHGD.maGiaoAn}">
				<jsp:forward page=""/>
			</c:if>
			<c:set var="tinhTrangHT" value='${objKHGD.tinhTrangHT}'></c:set>
		
		</c:if>
	
	</c:when>
	<c:otherwise>
		<jsp:forward page=""/>
	</c:otherwise>
	</c:choose>
	<b style='font-size:24px'>Giáo án lý thuyết</b>
	<form action="<%=request.getContextPath()%>/GiaoAnController" method="post" name="GiaoAn">
		
		<input type="hidden" id="LyDoReject" name="LyDoReject" value=""/>
		
		<input type="hidden" id="maKHGD" name="maKHGD" value="${chiTietKHGD.maKHGD}"/>
		
		<c:if test="${param.stt eq 'insert'}">
				<input type="hidden" id="actionType" name="actionType" value="insertlt"/>
		</c:if>
		
		<c:if test="${param.stt eq 'update'}">
				<input type="hidden" id="actionType" name="actionType" value="updatelt"/>	
				<input type="hidden" id="maGiaoAn" name="maGiaoAn" value="<%=ChiTietKHGDDAO.getMaGiaoAnByMaCTKHGD(request.getParameter("maCTKHGD"))%>"/>	
		</c:if>	
		
	
		<input type="hidden" id="txtMaCTKHGD" name="txtMaCTKHGD" value="${param.maCTKHGD}"/>
		
		<table width = "800" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan = "2">Mẫu số 5<br />Ban hành theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>		
			</tr>
			<tr style="background-color: transparent;">
				<td>
					GIÁO ÁN SỐ : <input type="text" id="txtSoGA" name="txtSoGA" size=2 style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.soGiaoAn}"</c:if> <c:if test="${param.stt eq 'insert'}">value="${param.soGA}"</c:if> readonly="readonly"/>
					<a id="aSoGA"></a>
				</td>
				<td>
					Thời gian thực hiện : <a id="soPhut">${soPhut}</a> phút<br />
					Tên chương :
					<br/>
					<div style="text-align:left">
					<%int count=1; %>
						<c:forEach items="${listTenChuong}" var="obj">
							<b><%=count%>/ ${obj}</b><br/>					
							<%count++; %>
						</c:forEach>				
					<input type='hidden' name='txtTenChuong' id='txtTenChuong' value='${blockTenChuong}'/>
					</div>
					Ngày thực hiện :	<input type = "text" id="txtCalendar" size = 8 name="txtCalendar" style="background-color: transparent;"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.ngayThucHien}"</c:if> readonly="readonly"/>
								<img id="Calendar" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar"height="20px" style="margin-bottom: -5px;" />
					<a id="aNgayTH"></a>			
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					Tên bài :<br />
					<div style="text-align:left">
						<%count=1; %>						
						<c:forEach items="${listTenChuong}" var="obj">
							<b><%=count%>/${obj}</b><br/>					
						<%count++;%>
						</c:forEach>			
					</div>	
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">MỤC TIÊU CỦA BÀI : 
												<a id="aMucTieu"></a>
					</div>
					<br />
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtMucTieu" id="txtMucTieu"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.mucTieu)}</c:if></textarea>
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">ĐỒ DÙNG VÀO PHƯƠNG TIỆN DẠY HỌC :
											<a id="aDoDungPTDH"></a>
					</div><br />
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtDoDungPTDH" id="txtDoDungPTDH"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.doDungPTDH)}</c:if></textarea>
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">I.ỔN ĐỊNH LỚP HỌC: <a id="aODLH"></a></div>
				</td>
				<td>
					Thời gian : <input type = "text" id ="txtTGOD" name="txtTGOD" size = "3" style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianOnDinh}"</c:if> /> phút
					<a id="aTGOD"></a>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">		
					<textarea  rows="2" name="txtODLH" id="txtODLH" cols="90" style="background-color: transparent;"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.onDinhLH)}</c:if></textarea>
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">II.THỰC HIỆN BÀI HỌC:</div>
				</td>
				<td>
					Thời gian : <input type = "text" id ="txtTGTHBH" name="txtTGTHBH" size = "3" style="background-color: transparent;" readonly="readonly" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianTHBH}"</c:if> /> phút
					<a id="aTGTHBH"></a>
				</td>
			</tr>
		</table>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td rowspan = "2" >STT</td>
				<td rowspan = "2">NỘI DUNG</td>
				<td colspan = "2">HOẠT ĐỘNG DẠY HỌC</td>
				<td rowspan = "2">THỜI GIAN</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>HOẠT ĐỘNG CỦA GIÁO VIÊN</td>
				<td>HOẠT ĐỘNG CỦA HỌC SINH</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>1</td>
				<td>Dẫn nhập : <a id="aDanNhap"></a><br />
					<textarea  cols="20" style="cursor:pointer; background-color: transparent;" id ="txtDanNhap" name="txtDanNhap" rows = "2" style="background-color: transparent;" readonly="readonly" onclick="showPopUp(this.id)">${sf:appendBrTag2(giaoAnLyThuyet.danNhap)}</textarea>
				
				</td>
				<td>
					<a id="aHDDNGV"></a>
					<textarea onclick="showPopUp(this.id)" rows="2" cols="20" style="cursor:pointer;background-color: transparent;" name="txtHDDNGV" id="txtHDDNGV" readonly="readonly"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDDanNhapGV)}</c:if></textarea>
					
				</td>
				<td>
					<a id="aHDDNHS"></a>
					<textarea onclick="showPopUp(this.id)" rows="2" cols="20"style="cursor:pointer;background-color: transparent;" name="txtHDDNHS" id="txtHDDNHS" readonly="readonly"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDDanNhapHS)}</c:if></textarea>
						
				</td>
				<td>
					<a id="aTGDN"></a>
					<input onkeyup="calSoTGTHBH()" type ="text" size="3" style="background-color: transparent;" name="txtTGDN" id="txtTGDN" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianDanNhap}"</c:if>/>
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>2</td>
				<td>Giảng bài mới : <a id="aGiangBaiMoi"></a><br />
					<textarea onclick="showPopUp(this.id)" cols="20" style="cursor:pointer;background-color: transparent;" id="txtGiangBaiMoi" name="txtGiangBaiMoi" readonly="readonly" style="background-color: transparent;"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.noiDungBaiGiang)}</c:if></textarea>
					
				</td>
				<td>
					<a id="aGiangBaiMoiGV"></a>
					<textarea onclick="showPopUp(this.id)" rows="2" cols="20" style="cursor:pointer;background-color: transparent;" name="txtGiangBaiMoiGV" id="txtGiangBaiMoiGV" readonly="readonly"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDGiangBaiMoiGV)}</c:if></textarea>	
					
				</td>
				<td>
					<a id="aGiangBaiMoiHS"></a>
					<textarea onclick="showPopUp(this.id)" rows="2" cols="20" style="cursor:pointer;background-color: transparent;" name="txtGiangBaiMoiHS" id="txtGiangBaiMoiHS" readonly="readonly" ><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDGiangBaiMoiHS)}</c:if></textarea>
					
				</td>
				<td>
					<a id="aTGGiangBaiMoi"></a>
					<input onkeyup="calSoTGTHBH()" type = "text" size = "3" style="background-color: transparent;" name="txtTGGiangBaiMoi" id="txtTGGiangBaiMoi"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianBaiGiang}"</c:if> />
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>3</td>
				<td>Củng cố kiến thức và kết thúc bài : <a id="aCungCoKienThuc"></a><br />
					<textarea onclick="showPopUp(this.id)" cols="20" readonly="readonly" <c:if test="${giaoAnLyThuyet.cungCoKienThuc ne ''}">style="background-color:transparent;"</c:if> <c:if test="${giaoAnLyThuyet.cungCoKienThuc eq ''}">style="background-color:red;cursor:pointer"</c:if> id="txtCungCoKienThuc" name="txtCungCoKienThuc" ><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.cungCoKienThuc)}</c:if></textarea>
				</td>
				<td>
					<a id="aCungCoGV"></a>
					<textarea onclick="showPopUp(this.id)" rows="2"  readonly="readonly" cols="20" style="cursor:pointer;background-color: transparent;" id="txtCungCoGV" name="txtCungCoGV"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDCungCoGV)}</c:if></textarea>
					
				</td>
				<td>
					<a id="aCungCoHS"></a>
					<textarea onclick="showPopUp(this.id)" rows="2" readonly="readonly" cols="20" style="cursor:pointer;background-color: transparent;" id="txtCungCoHS" name="txtCungCoHS"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDCungCoHS)}</c:if></textarea>
					
				</td>
				<td>
					<a id="aTGCungCo"></a>
					<input onkeyup="calSoTGTHBH()" type = "text"  size = "3" style="background-color:transparent;" id="txtTGCungCo" name="txtTGCungCo"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianCungCo}"</c:if>/>
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>4</td>
				<td>Hướng dẫn tự học : <a id="aHDTH"></a> <br />
					<textarea readonly="readonly" onclick="showPopUp(this.id)" cols="20" <c:if test="${giaoAnLyThuyet.huongDanTuHoc ne ''}">style="background-color:transparent;"</c:if> id ="txtHDTH" name="txtHDTH" rows = "2" <c:if test="${giaoAnLyThuyet.huongDanTuHoc eq ''}">style="background-color:red;cursor:pointer"</c:if>><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.huongDanTuHoc)}</c:if></textarea>
					
				</td>
				<td>
					<a id="aHDTHGV"></a>
					<textarea readonly="readonly" onclick="showPopUp(this.id)" cols="20" style="cursor:pointer;background-color: transparent;" id ="txtHDTHGV" name="txtHDTHGV" rows = "2"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDHDTHGV)}</c:if></textarea>
					
				</td>
				<td>
					<a id="aHDTHHS"></a>
					<textarea readonly="readonly" onclick="showPopUp(this.id)" cols="20" style="cursor:pointer;background-color: transparent;" id ="txtHDTHHS" name="txtHDTHHS" rows = "2"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDHDTHHS)}</c:if></textarea>
					
				</td>
				<td>
					<a id="aTGHDTH"></a>
					<input onkeyup="calSoTGTHBH()"  size="3" style="background-color: transparent;" id ="txtTGHDTH" name="txtTGHDTH"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianHDTH}"</c:if>/>
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">Nguồn tài liệu tham khảo:  <a id="aTaiLieuThamKhao"></a></td>
				<td colspan = "3">
					<textarea  rows="4" cols="55" <c:if test="${giaoAnLyThuyet.taiLieuThamKhao eq ''}">style="background-color:red;cursor:pointer"</c:if> <c:if test="${giaoAnLyThuyet.taiLieuThamKhao ne ''}">style="background-color:transparent;"</c:if> id ="txtTaiLieuThamKhao" name="txtTaiLieuThamKhao"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.taiLieuThamKhao)}</c:if></textarea>
					
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><br />TRƯỞNG KHOA/TRƯỞNG TỔ MÔN</td>
				<td>
					<input type = "hidden" id="txtCalendar1" size = 8 name="txtCalendar1"   <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.ngayThucHien}"</c:if> />
					<!-- ${giaoAnLyThuyet.ngayTao}-->
					${giaoAnLyThuyet.ngayThucHien}
				<br />GIÁO VIÊN</td>
			</tr>
			<tr style="background-color: transparent;">
				<td><input type = "text" id ="txtTruongKhoa" name="txtTruongKhoa" size = "20" style="background-color: transparent;" value="${objKHGD.tenTruongKhoa}" readonly="readonly"/></td>
				<td><input type = "text" id ="txtGiaoVien" name="txtGiaoVien" size = "20" style="background-color: transparent;"  value="${objKHGD.tenGiaoVien}"  readonly="readonly"/>
					<input type="hidden" name="txtMaNguoiTao" id="txtMaNguoiTao" value="${maNguoiTao}"/>
				</td>
			</tr>
			<tr style="background-color: transparent;">
					<td colspan="2" style='text-align:center'>
						<c:if test="${param.stt eq 'insert'}">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" style="cursor:pointer;"  onclick="validateForm('insert')" />
						</c:if>
						<c:if test="${(tinhTrangGA eq TT_NEW or tinhTrangGA eq TT_REJECT)}">
							<c:if test="${param.stt eq 'update' and (sessionScope.maThanhVien eq maNguoiTao or vaiTro eq Admin ) }">
								<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" style="cursor:pointer;"  onclick="validateForm('update')"/>
							<!-- Goi Truong Khoa  -->
								<img src="<%=request.getContextPath()%>/images/buttom/guitruongkhoa.png" style="cursor:pointer;"  onclick="validateForm('send')"/>					
							</c:if>
						</c:if>
						<c:if test="${param.stt ne 'insert' and (vaiTro eq vaiTro_TK or  vaiTro eq Admin or vaiTro eq vaiTro_PK) and tinhTrangGA eq TT_SEND }">
							<img src="<%=request.getContextPath()%>/images/buttom/approve.png" style="cursor:pointer;" onclick="duyetForm('approve')" />
						
							<img src="<%=request.getContextPath()%>/images/buttom/reject.png" style="cursor:pointer;" onclick="duyetForm('reject')" />
						
						</c:if>
						
						<c:if test="${(tinhTrangGA eq TT_SEND or tinhTrangGA eq TT_NEW or tinhTrangGA eq HT_APPROVE and not empty tinhTrangGA and (sessionScope.maThanhVien eq maNguoiTao or vaiTro eq Admin)) or (vaiTro eq vaiTro_TK and tinhTrangGA eq TT_SEND or tinhTrangGA eq TT_NEW or tinhTrangGA eq HT_APPROVE )}">
							<a href = "<%=Constant.PATH_RES.getString("iso.InGiaoAnLTPath") %>">								 
								<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
							</a>
						</c:if>
						
					</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="2" style='text-align:center'>
					<c:set var='lstSoSanhGA' value='<%=GiaoAnDAO.getGiaoAnSoSanhByCoHieuAndSoGiaoAn(chiTietKHGDModel.getCoHieu(),request.getParameter("soGA"),keHoachGiangDayModel.getMaMonHoc()) %>'></c:set>	
					<select id="selSoSanhGA" name="selSoSanhGA">
						<c:forEach var="soSanhGA" items="${lstSoSanhGA}">
								<option value="&maGA=${soSanhGA.maGiaoAn}&maCTKHGD=${soSanhGA.maCTKHGD}&maKHGD=${soSanhGA.maKHGD}" >Giáo án (HK ${soSanhGA.hocKi}/${soSanhGA.namBatDau}) của giáo viên ${soSanhGA.giaoVienTao} thuộc lớp ${soSanhGA.lopHoc } </option>
						</c:forEach>
					</select>
					<input type="button" value="So Sánh" onclick="clickSoSanh()"></input>
					<input type="hidden" value="<%=chiTietKHGDModel.getCoHieu()%>" name="txtCoHieuGiaoAn"></input>
			
				</td>
			</tr>
		</table>
		
		
		<c:choose>
			<c:when test="${param.stt eq 'update'}">
				<c:choose>
					<c:when test="${(sessionScope.maThanhVien eq maNguoiTao or  vaiTro eq Admin) and (tinhTrangGA eq TT_NEW or tinhTrangGA eq TT_REJECT)}">
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
	inputField        : "txtCalendar",
	button            : "Calendar",
	ifFormat          : "%d-%m-%Y"
  });
//]]>

 function clickSoSanh(){
 	
 	document.getElementById("actionType").value="soSanhGA";
	document.forms['GiaoAn'].submit();	
 
 }


 </script>

</body>
</html>