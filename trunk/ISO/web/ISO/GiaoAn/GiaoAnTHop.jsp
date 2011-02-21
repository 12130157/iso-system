<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>

<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>


<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath() %>/Logout.jsp">
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
	//document.getElementById("thongBaoChung").innerHTML="";
	
	var status=1;
	
	if(isTextBoxNull("txtMucTieu","aMucTieu",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtDoDungPTDH","aDoDungPTDH",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtHinhThucTCDH","aHinhThucTCDH",thongbao))
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


	if(isTextBoxNull("txtGTCD","aGTCD",thongbao))
	{
		status=0;
	}

	if(isTextBoxNull("txtGTCDGV","aGTCDGV",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtGTCDHS","aGTCDHS",thongbao))
	{
		status=0;
	}											
	if(isTextBoxNull("txtTGGTCD","aTGGTCD",thongbao))
	{
		status=0;
	}
	
	if(isTextBoxNull("txtGQVD","aGQVD",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtGQVDGV","aGQVDGV",thongbao))
	{
		status=0;
	}														
	if(isTextBoxNull("txtGQVDHS","aGQVDHS",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtTGGQVD","aTGGQVD",thongbao))
	{
		status=0;	
	}

	if(isTextBoxNull("txtKTVD","aKTVD",thongbao))
	{
		status=0;
	}																		
	if(isTextBoxNull("txtKTVDGV","aKTVDGV",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtKTVDHS","aKTVDHS",thongbao))
	{
		status=0;
	}														
	if(isTextBoxNull("txtTGKTVD","aTGKTVD",thongbao))
	{
		status=0;
	}																				
	if(isTextBoxNull("txtHDTH","aHDTH",thongbao))
	{
		status=0;
	}																					
	if(isTextBoxNull("txtHDTHGV","aHDTHGV",thongbao))
	{
		status=0;
	}
																							
	if(isTextBoxNull("txtTGHDTH","aTGHDTH",thongbao))
	{
		status=0;
	}									
															
	if(isTextBoxNull("txtRutKinhNghiem","aRutKinhNghiem",thongbao))
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
		if(!isNumber(document.getElementById("txtTGGTCD").value))
		{
			thongBaoLoi("aTGGTCD",thongbao);
			status=2;
		
		}																			
		if(!isNumber(document.getElementById("txtTGGQVD").value))
		{
			thongBaoLoi("aTGGQVD",thongbao);
			status=2;
		
		}																														
		if(!isNumber(document.getElementById("txtTGKTVD").value))
		{
			thongBaoLoi("aTGKTVD",thongbao);
			status=2;
		
		}													
		if(!isNumber(document.getElementById("txtTGHDTH").value))
		{
			thongBaoLoi("aTGHDTH",thongbao);
			status=2;
		
		}
		if(status==2)
			document.getElementById("alert").innerHTML="Bạn chỉ nhập số vào nơi có dấu (*)";
		else{
			document.getElementById("alert").innerHTML="";

			thoiGianTH=parseInt(document.getElementById("soPhut").innerHTML,"10");
			thoiGianOD=parseInt(document.getElementById("txtTGOD").value,"10");
			
			thoiGianDN=parseInt(document.getElementById("txtTGDN").value,"10");
			thoiGianGTCD=parseInt(document.getElementById("txtTGGTCD").value,"10");
			thoiGianGQVD=parseInt(document.getElementById("txtTGGQVD").value,"10");
			thoiGianKTVD=parseInt(document.getElementById("txtTGKTVD").value,"10");
			thoiGianHDTH=parseInt(document.getElementById("txtTGHDTH").value,"10");
			
			tongTGTHBH=thoiGianDN+thoiGianGTCD+thoiGianGQVD+thoiGianKTVD+thoiGianHDTH;
							
			if((tongTGTHBH+thoiGianOD)!=thoiGianTH){
				document.getElementById("alert").innerHTML="Các số thời gian thực hiện giáo án không phù hợp";															
				status=3;
			}
			else{
				document.getElementById("txtTGTHBH").value=tongTGTHBH+"";

			}	
		
		}	

		if(stt=="send")
			document.getElementById("actionType").value="SendTHop";
		if(status==1)
			document.forms['GiaoAn'].submit();				
	
	}																											
	
}

function calSoTGTHBH()
{	

	var thoiGianDN;
	var thoiGianGTCD;
	var thoiGianGQVD;
	var thoiGianKTVD;
	var thoiGianHDTH;
	
	if(document.getElementById("txtTGDN").value!="")
		thoiGianDN=parseInt(document.getElementById("txtTGDN").value,"10");
	else
		thoiGianDN=0;
	if(document.getElementById("txtTGGTCD").value!="")
		thoiGianGTCD=parseInt(document.getElementById("txtTGGTCD").value,"10");
	else
		thoiGianGTCD=0;
	
	if(document.getElementById("txtTGGQVD").value!="")
		thoiGianGQVD=parseInt(document.getElementById("txtTGGQVD").value,"10");
	else
		thoiGianGQVD=0;
	
	if(document.getElementById("txtTGKTVD").value!="")
		thoiGianKTVD=parseInt(document.getElementById("txtTGKTVD").value,"10");
	else
		thoiGianKTVD=0;

	if(document.getElementById("txtTGHDTH").value!="")
		thoiGianHDTH=parseInt(document.getElementById("txtTGHDTH").value,"10");
	else
		thoiGianHDTH=0;
	
	if(!isNumber(document.getElementById("txtTGDN").value)
			||!isNumber(document.getElementById("txtTGGTCD").value)
				||!isNumber(document.getElementById("txtTGGQVD").value)
					||!isNumber(document.getElementById("txtTGKTVD").value)
						||!isNumber(document.getElementById("txtTGHDTH").value))
	{
		document.getElementById("txtTGTHBH").value="";
	}
	else{
		tongTGTHBH=thoiGianDN+thoiGianGTCD+thoiGianGQVD+thoiGianKTVD+thoiGianHDTH;					
		document.getElementById("txtTGTHBH").value=tongTGTHBH+"";
	}	
}


function thongBaoLoi(id,alert)
{
	document.getElementById(id).innerHTML=alert;
}


function isTextBoxNull(id,idalert,alert)
{
		str=document.getElementById(id).value;
		if(str.length==0||isAllSpace(str)){
			document.getElementById(idalert).innerHTML=alert;
			return true;
		}
		else{
			document.getElementById(idalert).innerHTML="";
			return false;
		}
		
}

function isTextAreaNull(id,idalert,alert)
{
	str=document.getElementById(id).innerHTML;
	if(str.length==0){
		document.getElementById(idalert).innerHTML=alert;
		return true;
	}
	else{
		document.getElementById(idalert).innerHTML="";
		return false;
	}
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

function showPopUp(x)
{
	 var myObject = new Object();
	 myObject.valueContent = document.getElementById(x).innerHTML;
	 myObject.titleContent =mapTieuDeByID(x); 
	var statusAlert="true";
//	if(x=="txtGTCD"||x=="txtGQVD"||x=="txtDanNhap")
//		statusAlert="false";
//	else
		statusAlert=document.getElementById("quyen").value;
	 myObject.quyen=statusAlert;
	 myObject.maLoai=mapMaLoaiByID(x);
	   height=450;
	   if(myObject.quyen=="false")
			width=450;
	    else
			width=650;
	   
		z=(window.screen.width-width)/2;
		y=(window.screen.height-height)/2;

		value = window.showModalDialog("NhapText.jsp",myObject,"dialogHeight: "+height+"px; dialogWidth:" +width+"px; dialogTop:"+y+"px; dialogLeft:"+z+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");

	if(value!=false&&value!=undefined)
		document.getElementById(x).innerHTML=value;		

}

function mapTieuDeByID(id)
{
	if(id=="txtDanNhap")
		return "Dẫn nhập";
	else if(id=="txtHDDNGV")
		return "Hướng dẫn dẫn nhập giáo viên";
	else if(id=="txtHDDNHS")
		return "Hướng dẫn dẫn nhập học sinh";
	
	else if(id=="txtGTCD")
		return "Giới thiệu chủ đề";
	else if(id=="txtGTCDGV")
		return "Giới thiệu chủ đề giáo viên";
	else if(id=="txtGTCDHS")
		return "Giới thiệu chủ đề học sinh";


	else if(id=="txtGQVD")
		return "Giải quyết vấn đề";		
	else if(id=="txtGQVDGV")
		return "Giải quyết vấn đề giáo viên";
	else if(id=="txtGQVDHS")
		return "Giải quyết vấn đề học sinh";
	
	else if(id=="txtKTVD")
		return "Kết thúc vấn đề";
	else if(id=="txtKTVDGV")
		return "Kết thúc vấn đề giáo viên";
	else if(id=="txtKTVDHS")
		return "Kết thúc vấn đề học sinh";
	
	else if(id=="txtHDTH")
		return "Hướng dẫn tự học";
	else if(id=="txtHDTHGV")
		return "Hướng dẫn tự học chung";
	else
		return "";		
}

function mapMaLoaiByID(id)
{
	if(id=="txtDanNhap")
		return "<%=Constant.MALOAI_DANNHAP%>";
	else if(id=="txtHDDNGV")
		return "<%=Constant.MALOAI_HDDANNHAPCUAGV%>";
	else if(id=="txtHDDNHS")
		return "<%=Constant.MALOAI_HDDANNHAPCUAHS%>";
	else if(id=="txtGTCD")
		return "<%=Constant.MALOAI_GIOITHIEUCHUDE%>";
	else if(id=="txtGTCDGV")
		return "<%=Constant.MALOAI_HDGIOITHIEUCHUDEGV%>";
	else if(id=="txtGTCDHS")
		return "<%=Constant.MALOAI_HDGIOITHIEUCHUDEHS%>";
	else if(id=="txtGQVD")
		return "<%=Constant.MALOAI_GIAIQUYETVANDE%>";		
	else if(id=="txtGQVDGV")
		return "<%=Constant.MALOAI_HDGIAIQUYETVANDEGV%>";
	else if(id=="txtGQVDHS")
		return "<%=Constant.MALOAI_HDGIAIQUYETVANDEHS%>";
	else if(id=="txtKTVD")
		return "<%=Constant.MALOAI_KETTHUCVANDE%>";
	else if(id=="txtKTVDGV")
		return "<%=Constant.MALOAI_HDKETTHUCVANDEGV%>";
	else if(id=="txtKTVDHS")
		return "<%=Constant.MALOAI_HDKETTHUCVANDEHS%>";
	else if(id=="txtHDTH")
		return "<%=Constant.MALOAI_HUONGDANTUHOC1%>";
	else if(id=="txtHDTHGV")
		return "<%=Constant.MALOAI_HDHUONGDANTUHOCGV1%>";
	else
		return "";		
}

function duyetForm(stt)
{

	if(stt=="approve")
	{
		document.getElementById("actionType").value="approveTHop";
		document.forms['GiaoAn'].submit();			
	}
	else if(stt=="reject")
	{
		if(window.confirm("Bạn có chắc muốn reject giáo án này"))
		{	
			x=(window.screen.width-300)/2;
			y=(window.screen.height-200)/2;
			value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: 200px; dialogWidth: 300px; dialogTop:"+y+"px; dialogLeft:"+x+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		
			if(value!=null&&value!=""){
				
				document.getElementById("actionType").value="rejectTHop";
				document.getElementById('LyDoReject').value = value;
				
				document.forms['GiaoAn'].submit();				
			}
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

function capNhatRKN(str)
{

	if(rightSpace(str)!="")
	{
		document.getElementById("actionType").value="capnhatRKNTichHop";
		document.forms['GiaoAn'].submit();	
		
	}
	else
	{
		alert("Bạn phải nhập dữ liệu cho 'Rút kinh nghiệm'");
	}
}




</script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Thêm Giáo Án Tích Hợp</title>
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
	<a id='thongBaoChung'>
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
	</a>
		<br/>
		<br/>
	 	<br/>	
	
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
		
			<c:set var="giaoAnLyThuyet" value='<%=GiaoAnDAO.getGiaoAnTichHopByMaGA(ChiTietKHGDDAO.getMaGiaoAnByMaCTKHGD(request.getParameter("maCTKHGD")))%>' scope="session"></c:set>
			<c:set var="listTenChuong" value='<%=ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD"))%>' scope="session"></c:set>
			<c:set var="chiTietKHGD" value='<%=ChiTietKHGDDAO.getChiTietKHGDByByMaCTKHGD(request.getParameter("maCTKHGD"))%>' scope="session"></c:set>
			<c:set var="soPhut" value='<%=KeHoachGiangDayDAO.calSoPhutDCMHByMaKHGD(ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")),Constant.phutQDTHop)%>' scope="session"></c:set>
			<c:set var="objKHGD" value = '<%=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")))%>' scope="session"></c:set>
			<c:if test="${empty chiTietKHGD.maGiaoAn}">
				<jsp:forward page=""/>
			</c:if>
			<c:set var="tinhTrangGA" value='<%=GiaoAnDAO.getTinhTrangGiaoAnByMaGA(maGA) %>' ></c:set>
			<c:set var="tinhTrangKHGD" value='${objKHGD.tinhTrang}'></c:set>
			<c:set var="tinhTrangHT" value='${objKHGD.tinhTrangHT}'></c:set>
		
			
			<c:set var="TT_NEW" value='<%=Constant.TINHTRANG_NEW %>' ></c:set>
			<c:set var="TT_REJECT" value='<%=Constant.TINHTRANG_REJECT %>' ></c:set>
			<c:set var="TT_SEND" value='<%=Constant.TINHTRANG_SEND %>' ></c:set>
			<c:set var="HT_APPROVE" value='<%=Constant.TINHTRANG_HT_APPROVE %>' ></c:set>
			<c:set var="maNguoiTao" value='${objKHGD.maGiaoVien}'></c:set>
			<c:set var="vaiTro" value='<%= (String) session.getAttribute("maVaiTro") %>'></c:set>
			<c:set var="vaiTro_TK" value='<%= Constant.TRUONG_KHOA %>'></c:set>
			<c:set var="Admin" value='<%=Constant.ADMIN%>'></c:set>
						
						
		</c:if>
		
	
	
		<c:if test="${param.stt eq 'insert'}">
			<c:set var="listTenChuong" value='<%=ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD"))%>' scope="session"></c:set>
			<c:set var="blockTenChuong" value='<%=ChiTietKHGDDAO.getBlockTenChuong(ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD")))%>'></c:set>
	
			<c:set var="maNguoiTao" value='${objKHGD.maGiaoVien}'></c:set>
			
			<c:set var="chiTietKHGD" value='<%=ChiTietKHGDDAO.getChiTietKHGDByByMaCTKHGD(request.getParameter("maCTKHGD"))%>'></c:set>
			<c:set var="soPhut" value='<%=KeHoachGiangDayDAO.calSoPhutDCMHByMaKHGD(ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")),Constant.phutQDTHop)%>'></c:set>
			<c:set var="objKHGD" value = '<%=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")))%>'></c:set>
			<c:set var="tinhTrangHT" value='${objKHGD.tinhTrangHT}'></c:set>
			
			<c:if test="${not empty chiTietKHGD.maGiaoAn}">
				<jsp:forward page=""/>
			</c:if>
		</c:if>
	</c:when>
	<c:otherwise>
		<jsp:forward page=""/>	
	</c:otherwise>	
	</c:choose>
	
	<b style='font-size:24px'>Giáo án tích hợp</b>
	
	
	<form action="<%=request.getContextPath()%>/GiaoAnController" method="post" name="GiaoAn">
		<input type="hidden" id="LyDoReject" name="LyDoReject"/>
		
		<input type="hidden" id="maKHGD" name="maKHGD" value="${chiTietKHGD.maKHGD}"/>
		
		<c:if test="${param.stt eq 'insert'}">
				<input type="hidden" id="actionType" name="actionType" value="insertthop"/>
		</c:if>
		
			
		<c:if test="${param.stt eq 'update'}">
				<input type="hidden" id="actionType" name="actionType" value="updatethop"/>	
				<input type="hidden" id="maGiaoAn" name="maGiaoAn" value="<%=ChiTietKHGDDAO.getMaGiaoAnByMaCTKHGD(request.getParameter("maCTKHGD"))%>"/>	
		</c:if>	
	
		<input type="hidden" id="txtMaGiaoVien" name="txtMaGiaoVien" value="${objKHGD.maGiaoVien}"/>
		<input type="hidden" id="txtMaCTKHGD" name="txtMaCTKHGD" value="${param.maCTKHGD}"/>
	
		
		<table width = "800" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan = "2">Mẫu số 7<br />Ban hành theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>		
			</tr>
			<tr style="background-color: transparent;">
				<td>
					GIÁO ÁN SỐ : <input type = "text" id ="txtSoGA" name="txtSoGA" size="2" style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.soGiaoAn}"</c:if> <c:if test="${param.stt eq 'insert'}">value="${param.soGA}"</c:if> readonly="readonly"/>
					<a class='error' id='aSoGA'></a>
				</td>
				<td>
				
					Thời gian thực hiện : <a id="soPhut">${soPhut}</a>  phút<br />
					Tên chương :<br/> 
					<div style="text-align:left">
				
						<%int count=1; %>
						
						<c:forEach  items="${listTenChuong}" var="obj">
							<b><%=count%>/ ${obj}</b><br/>					
							<%count++; %>
						</c:forEach>				
					<input type='hidden' name='txtTenChuong' id='txtTenChuong' value='${blockTenChuong}'/>
		
					</div>	
					Thực hiện :	<input type = "text" id="txtCalendar" size = 8 name="txtCalendar" style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.ngayThucHien}"</c:if> readonly="readonly"/>
								<img id="Calendar" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar"height="20px" style="margin-bottom: -5px;" />
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					Tên bài :<br />	
					<div style="text-align:left">
			
						<%count=1; %>
						<c:forEach items="${listTenChuong}" var="obj">
							<b><%=count%>/ ${obj}</b><br/>					
							<%count++; %>
						</c:forEach>				
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">MỤC TIÊU CỦA BÀI : 	<a class='error' id='aMucTieu'></a>
			</div><br />
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtMucTieu" id="txtMucTieu" ><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.mucTieu)}</c:if></textarea>
				</td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">ĐỒ DÙNG VÀO PHƯƠNG TIỆN DẠY HỌC : <a class='error' id='aDoDungPTDH'></a>
			</div><br />
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtDoDungPTDH" id="txtDoDungPTDH"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.doDungPTDH)}</c:if></textarea>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">HÌNH THỨC TỔ CHỨC DẠY HỌC : <a class='error' id='aHinhThucTCDH'></a>
			</div><br />
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtHinhThucTCDH" id="txtHinhThucTCDH"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.hinhThucTCDH)}</c:if></textarea>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">I.ỔN ĐỊNH LỚP HỌC: 	<a class='error' id='aODLH'></a>
					</div>
				</td>
				<td>
					Thời gian : <input type = "text" size = "3" style="background-color: transparent;" name="txtTGOD" id="txtTGOD" <c:if test="${param.stt eq 'update'}">value="${sf:appendBrTag2(giaoAnLyThuyet.thoiGianOnDinh)}"</c:if>/> phút
					<a class='error' id='aTGOD'></a>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">		
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtODLH" id="txtODLH" ><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.onDinhLH)}</c:if></textarea>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">II.THỰC HIỆN BÀI HỌC:</div>
				</td>
				<td>
					Thời gian : <input type = "text" size = "3" style="background-color: transparent;" readonly="readonly" name="txtTGTHBH"  id="txtTGTHBH" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianTHBH}"</c:if>/> phút
					<a class='error' id='aTGTHBH'></a>
			
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
				<td>Dẫn nhập : <a class='error' id='aDanNhap'></a>
				<br />
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" id="txtDanNhap" name="txtDanNhap"  readonly="readonly" onclick="showPopUp(this.id)">${sf:appendBrTag2(giaoAnLyThuyet.danNhap)}</textarea>
				</td>
				<td>
					<a class='error' id='aHDDNGV'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" name="txtHDDNGV" id="txtHDDNGV" onclick="showPopUp(this.id)" readonly="readonly"> <c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDDanNhapGV)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aHDDNHS'></a>
					<textarea  rows="2" cols="20"style="background-color: transparent;cursor:pointer;" name="txtHDDNHS" id="txtHDDNHS" onclick="showPopUp(this.id)" readonly="readonly"> <c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDDanNhapHS)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGDN'></a>
					<input onkeyup="calSoTGTHBH()" type ="text" size = "3" style="background-color: transparent;" name="txtTGDN" id="txtTGDN"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianDanNhap}"</c:if>/>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Giới thiệu chủ đề : <a class='error' id='aGTCD'></a><br />
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id ="txtGTCD" name="txtGTCD" ><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.gioiThieuChuDe)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aGTCDGV'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id="txtGTCDGV" name="txtGTCDGV"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDGTCDGV)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aGTCDHS'></a>
					<textarea  rows="2" cols="20"style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id="txtGTCDHS" name="txtGTCDHS"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDGTCDHS)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGGTCD'></a>
					<input onkeyup="calSoTGTHBH()" type = "text" id ="txtTGGTCD" name="txtTGGTCD" size = "3" style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianGTCD}"</c:if>/>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>Giải quyết vấn đề : <a class='error' id='aGQVD'></a><br />
					<textarea  rows="2" cols="20" id="txtGQVD" name="txtGQVD" style="background-color: transparent;cursor:pointer" onclick="showPopUp(this.id)" readonly="readonly">${sf:appendBrTag2(giaoAnLyThuyet.giaiQuyetVanDe)}</textarea>
				</td>
				<td>
					<a class='error' id='aGQVDGV'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id="txtGQVDGV" name="txtGQVDGV"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDGQVDGV)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aGQVDHS'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id="txtGQVDHS" name="txtGQVDHS"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDGQVDHS)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGGQVD'></a>
					<input onkeyup="calSoTGTHBH()" type = "text" id ="txtTGGQVD" name="txtTGGQVD" size = "3" style="background-color: transparent;"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianGTVD}"</c:if>/>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td>Kết thúc vấn đề : <a class='error' id='aKTVD'></a><br />
					<textarea  rows="2" cols="20" id ="txtKTVD" name="txtKTVD" onclick="showPopUp(this.id)" readonly="readonly" <c:if test="${giaoAnLyThuyet.huongDanKetThuc ne ''}">style="background-color: transparent;cursor:pointer;"</c:if> <c:if test="${giaoAnLyThuyet.huongDanKetThuc eq ''}">style="background-color: red;cursor:pointer;"</c:if>><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.huongDanKetThuc)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aKTVDGV'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" id="txtKTVDGV" onclick="showPopUp(this.id)" readonly="readonly" name="txtKTVDGV"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDHDKTGV)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aKTVDHS'></a>
					<textarea  rows="2" cols="20"style="background-color: transparent;cursor:pointer;" id="txtKTVDHS" onclick="showPopUp(this.id)" readonly="readonly" name="txtKTVDHS" ><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDHDKTHS)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGKTVD'></a>
					<input onkeyup="calSoTGTHBH()" type = "text" id="txtTGKTVD" name="txtTGKTVD" size = "3" style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianHDKT}" </c:if>/>
				</td>
			</tr>
			<tr>
				<td>5</td>
				<td>Hướng dẫn tự học : <a class='error' id='aHDTH'></a><br />
					<textarea onclick="showPopUp(this.id)" readonly="readonly" rows="2" cols="20" id ="txtHDTH" name="txtHDTH" <c:if test="${giaoAnLyThuyet.huongDanTuHoc ne ''}">style="background-color: transparent;cursor:pointer;"</c:if> <c:if test="${giaoAnLyThuyet.huongDanTuHoc eq ''}">style="background-color: red;cursor:pointer;"</c:if>><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.huongDanTuHoc)}</c:if></textarea></td>
				<td colspan="2">
					<a class='error' id='aHDTHGV'></a>
					<textarea  rows="2" cols="50" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id ="txtHDTHGV" name="txtHDTHGV"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.HDHDTHGV)}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGHDTH'></a>
					<input onkeyup="calSoTGTHBH()" type = "text" size = "3" style="background-color: transparent;" id ="txtTGHDTH" name="txtTGHDTH" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianHDTH}"</c:if>/>
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr>
				<td>
					<div class = "div_textleft">III. RÚT KINH NGHIỆM TỔ CHỨC THỰC HIỆN :<a class='error' id='aRutKinhNghiem'></a></div>
				</td>
			</tr>	
			<tr>
				<td>
					<textarea  rows="2" cols="90" style="background-color: transparent;" id="txtRutKinhNghiem" name="txtRutKinhNghiem"><c:if test="${param.stt eq 'update'}">${sf:appendBrTag2(giaoAnLyThuyet.rutKinhNghiem)}</c:if></textarea>
					<br/>
					<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" style="cursor:pointer;" onclick="capNhatRKN(document.getElementById('txtRutKinhNghiem').value)"/>
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><br />TRƯỞNG KHOA/TRƯỞNG TỔ MÔN</td>
				<td>
					 <input type = "text" id="txtCalendar1" size = 8 name="txtCalendar1"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.ngayTao}"</c:if> readonly="readonly" />
					${giaoAnLyThuyet.ngayTao}
				<br />GIÁO VIÊN</td>
			</tr>
			<tr style="background-color: transparent;">
				<td><input type = "text" id="" size = "20" style="background-color: transparent;" value="${objKHGD.tenTruongKhoa}" readonly="readonly"/></td>
				<td><input type="hidden" name="txtMaNguoiTao"  id="txtMaNguoiTao" value="${maNguoiTao}"/>
					<input type = "text" id="txtGiaoVien" name="txtGiaoVien" size = "20" style="background-color: transparent;" value="${objKHGD.tenGiaoVien}" readonly="readonly"/></td>
			
			</tr>
			<tr style="background-color: transparent;">
				<td style="text-align:center" colspan="2">
						<c:if test="${param.stt eq 'insert'}">
							<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" style="cursor:pointer;"  onclick="validateForm('insert')" />
						</c:if>
								
						<c:if test="${tinhTrangGA eq TT_NEW or tinhTrangGA eq TT_REJECT}">
							<c:if test="${param.stt eq 'update' and (sessionScope.maThanhVien eq maNguoiTao or  vaiTro eq Admin)}">							
								<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" style="cursor:pointer;"  onclick="validateForm('update')"/>
								<img src="<%=request.getContextPath()%>/images/buttom/guitruongkhoa.png" style="cursor:pointer;"  onclick="validateForm('send')"/>					
						
							</c:if>
							
						</c:if>	
						<c:if test="${param.stt ne 'insert' and  (vaiTro eq vaiTro_TK or  vaiTro eq Admin) and tinhTrangGA eq TT_SEND }">
							<img src="<%=request.getContextPath()%>/images/buttom/approve.png" style="cursor:pointer;" onclick="duyetForm('approve')" />
						
							<img src="<%=request.getContextPath()%>/images/buttom/reject.png" style="cursor:pointer;" onclick="duyetForm('reject')"   />
						
						</c:if>
						
						<c:if test="${(tinhTrangGA eq HT_APPROVE and not empty tinhTrangGA and (sessionScope.maThanhVien eq maNguoiTao or vaiTro eq Admin)) or (vaiTro eq vaiTro_TK and tinhTrangGA eq HT_APPROVE )}">
							<a href = "<%=Constant.PATH_RES.getString("iso.InGiaoAnTHopPath") %>">								 
								<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
							</a>
						</c:if>
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

 </script>

</body>
</html>