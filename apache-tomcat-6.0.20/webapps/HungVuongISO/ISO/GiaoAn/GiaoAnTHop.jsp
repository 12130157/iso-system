<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>

<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>


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
<script>

function validateForm(stt)
{
	document.getElementById("point").innerHTML="<input type='text' style='background-color: transparent;border:none' id='txtFocus' />";
	document.getElementById("txtFocus").focus();
	document.getElementById("point").innerHTML="";
	thongbao="<font class='error'>(*)</font>";
	status=1;
	
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
	if(isTextBoxNull("txtHDBD","aHDBD",thongbao))
	{
		status=0;
	}

	if(isTextBoxNull("txtHDBDGV","aHDBDGV",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtHDBDHS","aHDBDHS",thongbao))
	{
		status=0;
	}											
	if(isTextBoxNull("txtTGHDBD","aTGHDBD",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtHDTX","aHDTX",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtHDTXGV","aHDTXGV",thongbao))
	{
		status=0;
	}														
	if(isTextBoxNull("txtHDTXHS","aHDTXHS",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtTGHDTX","aTGHDTX",thongbao))
	{
		status=0;	
	}

	if(isTextBoxNull("txtHDKT","aHDKT",thongbao))
	{
		status=0;
	}																		
	if(isTextBoxNull("txtHDKTGV","aHDKTGV",thongbao))
	{
		status=0;
	}
	if(isTextBoxNull("txtHDKTHS","aHDKTHS",thongbao))
	{
		status=0;
	}														
	if(isTextBoxNull("txtTGHDKT","aTGHDKT",thongbao))
	{
		status=0;
	}																				
	if(isTextBoxNull("txtHDRL","aHDRL",thongbao))
	{
		status=0;
	}																					
	if(isTextBoxNull("txtHDRLGV","aHDRLGV",thongbao))
	{
		status=0;
	}																						
	if(isTextBoxNull("txtTGHDRL","aTGHDRL",thongbao))
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
		if(!isNumber(document.getElementById("txtTGHDBD").value))
		{
			thongBaoLoi("aTGHDBD",thongbao);
			status=2;
		
		}																			
		if(!isNumber(document.getElementById("txtTGHDTX").value))
		{
			thongBaoLoi("aTGHDTX",thongbao);
			status=2;
		
		}																														
		if(!isNumber(document.getElementById("txtTGHDKT").value))
		{
			thongBaoLoi("aTGHDKT",thongbao);
			status=2;
		
		}													
		if(!isNumber(document.getElementById("txtTGHDRL").value))
		{
			thongBaoLoi("aTGHDRL",thongbao);
			status=2;
		
		}
		if(status==2)
			document.getElementById("alert").innerHTML="Bạn chỉ nhập số vào nơi có dấu (*)";
		else{
			document.getElementById("alert").innerHTML="";

			thoiGianTH=parseInt(document.getElementById("soPhut").innerHTML,"10");
			thoiGianOD=parseInt(document.getElementById("txtTGOD").value,"10");
			
			thoiGianDN=parseInt(document.getElementById("txtTGDN").value,"10");
			thoiGianHDBD=parseInt(document.getElementById("txtTGHDBD").value,"10");
			thoiGianHDTX=parseInt(document.getElementById("txtTGHDTX").value,"10");
			thoiGianHDKT=parseInt(document.getElementById("txtTGHDKT").value,"10");
			thoiGianHDRL=parseInt(document.getElementById("txtTGHDRL").value,"10");
			
			tongTGTHBH=thoiGianDN+thoiGianHDBD+thoiGianHDTX+thoiGianHDKT+thoiGianHDRL;
							
			if((tongTGTHBH+thoiGianOD)!=thoiGianTH){
				document.getElementById("alert").innerHTML="Các số thời gian thực hiện giáo án không phù hợp";															
				status=3;
			}
			else{
				document.getElementById("txtTGTHBH").value=tongTGTHBH+"";

			}	
		
		}	

		if(stt=="send")
			document.getElementById("actionType").value="SendTH";
		if(status==1)
			document.forms['GiaoAn'].submit();				
	
	}																												
	
}

function calSoTGTHBH()
{	
	if(document.getElementById("txtTGDN").value!="")
		thoiGianDN=parseInt(document.getElementById("txtTGDN").value,"10");
	else
		thoiGianDN=0;
	if(document.getElementById("txtTGHDBD").value!="")
		thoiGianHDBD=parseInt(document.getElementById("txtTGHDBD").value,"10");
	else
		thoiGianHDBD=0;
	
	if(document.getElementById("txtTGHDTX").value!="")
		thoiGianHDTX=parseInt(document.getElementById("txtTGHDTX").value,"10");
	else
		thoiGianHDTX=0;
	
	if(document.getElementById("txtTGHDKT").value!="")
		thoiGianHDKT=parseInt(document.getElementById("txtTGHDKT").value,"10");
	else
		thoiGianHDKT=0;

	if(document.getElementById("txtTGHDRL").value!="")
		thoiGianHDRL=parseInt(document.getElementById("txtTGHDRL").value,"10");
	else
		thoiGianHDRL=0;
	
	if(!isNumber(document.getElementById("txtTGDN").value)
			||!isNumber(document.getElementById("txtTGHDBD").value)
				||!isNumber(document.getElementById("txtTGHDKT").value)
					||!isNumber(document.getElementById("txtTGHDTX").value)
						||!isNumber(document.getElementById("txtTGHDRL").value))
	{
		document.getElementById("txtTGTHBH").value="";
	}
	else{
		tongTGTHBH=thoiGianDN+thoiGianHDBD+thoiGianHDTX+thoiGianHDKT+thoiGianHDRL;					
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
	 myObject.quyen=document.getElementById("quyen").value;
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
	else if(id=="txtHDBD")
		return "Hướng dẫn ban đầu";
	else if(id=="txtHDBDGV")
		return "Hướng dẫn ban đầu giáo viên";
	else if(id=="txtHDBDHS")
		return "Hướng dẫn ban đầu học sinh";
	else if(id=="txtHDTXGV")
		return "Hướng dẫn thường xuyên giáo viên";
	else if(id=="txtHDTXHS")
		return "Hướng dẫn thường xuyên học sinh";
	else if(id=="txtHDKT")
		return "Hướng dẫn kết thúc";
	else if(id=="txtHDKTGV")
		return "Hướng dẫn kết thúc giáo viên";
	else if(id=="txtHDKTHS")
		return "Hướng dẫn kết thúc học sinh";
	else if(id=="txtHDRL")
		return "Hướng dẫn rèn luyện";
	else if(id=="txtHDRLGV")
		return "Hướng dẫn rèn luyện chung";
	else
		return "";		
}

function duyetForm(stt)
{

	if(stt=="approve")
	{
		document.getElementById("actionType").value="approveTH";
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
				
				document.getElementById("actionType").value="rejectTH";
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
<title>Thêm Giáo Án Thực hành</title>
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
	<c:if test="${not empty param.err}">
		<c:if test="${param.err eq 'insertTC'}">
			<b class="msg">Thêm giáo án thành công</b>
		</c:if>		
	
		<c:if test="${param.err eq 'inserTB'}">
			<b class="error">Thêm giáo án thất bại</b>
		</c:if>		

		
		<c:if test="${param.err eq 'sendTB'}">
			<b class="error">Không gởi giáo án được</b>
		</c:if>		
		
		<c:if test="${param.err eq 'sendTC'}">
			<b class="msg">Bạn đã gởi giáo án cho trưởng khoa</b>
		</c:if>		
				
		<c:if test="${param.err eq 'updateTC'}">
			<b class="msg">Cập nhật giáo án thành công</b>
		</c:if>		
		
		<c:if test="${param.err eq 'updateTB'}">
			<b class="error">Cập nhật giáo án thất bại</b>
		</c:if>		
		
		<c:if test="${param.err eq 'rejectTB'}">
			<b class="error">Reject giáo án thất bại</b>
		</c:if>
		<c:if test="${param.err eq 'rejectTC'}">
			<b class="msg">Bạn đã reject một giáo án</b>
		</c:if>	
	</c:if>
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
		
			<c:set var="giaoAnLyThuyet" value='<%=GiaoAnDAO.getGiaoAnThucHanhByMaGA(ChiTietKHGDDAO.getMaGiaoAnByMaCTKHGD(request.getParameter("maCTKHGD")))%>' scope="session"></c:set>
			<c:set var="listTenChuong" value='<%=ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD"))%>' scope="session"></c:set>
			<c:set var="chiTietKHGD" value='<%=ChiTietKHGDDAO.getChiTietKHGDByByMaCTKHGD(request.getParameter("maCTKHGD"))%>' scope="session"></c:set>
			<c:set var="soPhut" value='<%=KeHoachGiangDayDAO.calSoPhutDCMHByMaKHGD(ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")),Constant.phutQD)%>' scope="session"></c:set>
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
		
			<c:set var="maNguoiTao" value='${objKHGD.maGiaoVien}'></c:set>
			<c:set var="vaiTro" value='<%= (String) session.getAttribute("maVaiTro") %>'></c:set>
			<c:set var="vaiTro_TK" value='<%= Constant.TRUONG_KHOA %>'></c:set>
			<c:set var="Admin" value='<%=Constant.ADMIN%>'></c:set>
						
						
		</c:if>
		
	
	
		<c:if test="${param.stt eq 'insert'}">
			<c:set var="listTenChuong" value='<%=ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD"))%>'></c:set>
			<c:set var="blockTenChuong" value='<%=ChiTietKHGDDAO.getBlockTenChuong(ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD")))%>'></c:set>
	
			<c:set var="maNguoiTao" value='${objKHGD.maGiaoVien}'></c:set>
			
			<c:set var="chiTietKHGD" value='<%=ChiTietKHGDDAO.getChiTietKHGDByByMaCTKHGD(request.getParameter("maCTKHGD"))%>'></c:set>
			<c:set var="soPhut" value='<%=KeHoachGiangDayDAO.calSoPhutDCMHByMaKHGD(ChiTietKHGDDAO.getMaKHGDByMaCTKHGD(request.getParameter("maCTKHGD")),Constant.phutQD)%>'></c:set>
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
	
	<b style='font-size:24px'>Giáo án thực hành</b>
	
	
	<form action="<%=request.getContextPath()%>/GiaoAnController" method="post" name="GiaoAn">
		<input type="hidden" id="LyDoReject" name="LyDoReject"/>
		
		<input type="hidden" id="maKHGD" name="maKHGD" value="${chiTietKHGD.maKHGD}"/>
		
		<c:if test="${param.stt eq 'insert'}">
				<input type="hidden" id="actionType" name="actionType" value="insertth"/>
		</c:if>
		
			
		<c:if test="${param.stt eq 'update'}">
				<input type="hidden" id="actionType" name="actionType" value="updateth"/>	
				<input type="hidden" id="maGiaoAn" name="maGiaoAn" value="<%=ChiTietKHGDDAO.getMaGiaoAnByMaCTKHGD(request.getParameter("maCTKHGD"))%>"/>	
		</c:if>	
	
		<input type="hidden" id="txtMaGiaoVien" name="txtMaGiaoVien" value="${objKHGD.maGiaoVien}"/>
		<input type="hidden" id="txtMaCTKHGD" name="txtMaCTKHGD" value="${param.maCTKHGD}"/>
	
		
		<table width = "800" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan = "2">Mẫu số 6<br />Ban hành theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>		
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
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtMucTieu" id="txtMucTieu" ><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.mucTieu}</c:if></textarea>
				</td>
			</tr>
			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">ĐỒ DÙNG VÀO PHƯƠNG TIỆN DẠY HỌC : <a class='error' id='aDoDungPTDH'></a>
			</div><br />
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtDoDungPTDH" id="txtDoDungPTDH"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.doDungPTDH}</c:if></textarea>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">HÌNH THỨC TỔ CHỨC DẠY HỌC : <a class='error' id='aHinhThucTCDH'></a>
			</div><br />
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtHinhThucTCDH" id="txtHinhThucTCDH"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.hinhThucTCDH}</c:if></textarea>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">I.ỔN ĐỊNH LỚP HỌC: 	<a class='error' id='aODLH'></a>
					</div>
				</td>
				<td>
					Thời gian : <input type = "text" size = "3" style="background-color: transparent;" name="txtTGOD" id="txtTGOD" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianOnDinh}"</c:if>/> phút
					<a class='error' id='aTGOD'></a>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">		
					<textarea  rows="2" cols="90" style="background-color: transparent;" name="txtODLH" id="txtODLH" ><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.onDinhLH}</c:if></textarea>
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
					<textarea  rows="2" cols="20" style="background-color: transparent;" id="txtDanNhap" name="txtDanNhap"  readonly="readonly" onclick="showPopUp(this.id)">${giaoAnLyThuyet.danNhap}</textarea>
				</td>
				<td>
					<a class='error' id='aHDDNGV'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" name="txtHDDNGV" id="txtHDDNGV" onclick="showPopUp(this.id)" readonly="readonly"> <c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDDanNhapGV}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aHDDNHS'></a>
					<textarea  rows="2" cols="20"style="background-color: transparent;cursor:pointer;" name="txtHDDNHS" id="txtHDDNHS" onclick="showPopUp(this.id)" readonly="readonly"> <c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDDanNhapHS}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGDN'></a>
					<input onkeyup="calSoTGTHBH()" type ="text" size = "3" style="background-color: transparent;" name="txtTGDN" id="txtTGDN"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianDanNhap}"</c:if>/>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Hướng Dẫn Ban Đầu : <a class='error' id='aHDBD'></a><br />
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id ="txtHDBD" name="txtHDBD" ><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.huongDanBanDau}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aHDBDGV'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id="txtHDBDGV" name="txtHDBDGV"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDHDBDGV}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aHDBDHS'></a>
					<textarea  rows="2" cols="20"style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id="txtHDBDHS" name="txtHDBDHS"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDHDBDHS}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGHDBD'></a>
					<input onkeyup="calSoTGTHBH()" type = "text" id ="txtTGHDBD" name="txtTGHDBD" size = "3" style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianHDBD}"</c:if>/>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>Hướng dẫn thường xuyên : <a class='error' id='aHDTX'></a><br />
					<textarea  rows="2" cols="20" id="txtHDTX" name="txtHDTX" style="background-color: transparent;" readonly="readonly">${chiTietKHGD.noiDungTH}</textarea>
				</td>
				<td>
					<a class='error' id='aHDTXGV'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id="txtHDTXGV" name="txtHDTXGV"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDHDTXGV}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aHDTXHS'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id="txtHDTXHS" name="txtHDTXHS"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDHDTXHS}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGHDTX'></a>
					<input onkeyup="calSoTGTHBH()" type = "text" id ="txtTGHDTX" name="txtTGHDTX" size = "3" style="background-color: transparent;"  <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianHDTX}"</c:if>/>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td>Hướng dẫn kết thúc : <a class='error' id='aHDKT'></a><br />
					<textarea  rows="2" cols="20" id ="txtHDKT" name="txtHDKT" onclick="showPopUp(this.id)" readonly="readonly" style="background-color: transparent;cursor:pointer;"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.huongDanKetThuc}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aHDKTGV'></a>
					<textarea  rows="2" cols="20" style="background-color: transparent;cursor:pointer;" id="txtHDKTGV" onclick="showPopUp(this.id)" readonly="readonly" name="txtHDKTGV"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDHDKTGV}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aHDKTHS'></a>
					<textarea  rows="2" cols="20"style="background-color: transparent;cursor:pointer;" id="txtHDKTHS" onclick="showPopUp(this.id)" readonly="readonly" name="txtHDKTHS" ><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDHDKTHS}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGHDKT'></a>
					<input onkeyup="calSoTGTHBH()" type = "text" id="txtTGHDKT" name="txtTGHDKT" size = "3" style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianHDKT}" </c:if>/>
				</td>
			</tr>
			<tr>
				<td>5</td>
				<td>Hướng dẫn rèn luyện : <a class='error' id='aHDRL'></a><br />
					<textarea onclick="showPopUp(this.id)" readonly="readonly" rows="2" cols="20" id ="txtHDRL" name="txtHDRL" style="background-color: transparent;cursor:pointer;"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.huongDanRenLuyen}</c:if></textarea></td>
				<td colspan="2">
					<a class='error' id='aHDRLGV'></a>
					<textarea  rows="2" cols="50" style="background-color: transparent;cursor:pointer;" onclick="showPopUp(this.id)" readonly="readonly" id ="txtHDRLGV" name="txtHDRLGV"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.HDHDRLGV}</c:if></textarea>
				</td>
				<td>
					<a class='error' id='aTGHDRL'></a>
					<input onkeyup="calSoTGTHBH()" type = "text" size = "3" style="background-color: transparent;" id ="txtTGHDRL" name="txtTGHDRL" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.thoiGianHDRL}"</c:if>/>
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
					<textarea  rows="2" cols="90" style="background-color: transparent;" id="txtRutKinhNghiem" name="txtRutKinhNghiem"><c:if test="${param.stt eq 'update'}">${giaoAnLyThuyet.rutKinhNghiem}</c:if></textarea>
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td><br />TRƯỞNG KHOA/TRƯỞNG TỔ MÔN</td>
				<td>
					<!-- <input type = "text" id="txtCalendar1" size = 8 name="txtCalendar1" style="background-color: transparent;" <c:if test="${param.stt eq 'update'}">value="${giaoAnLyThuyet.ngayTao}"</c:if> readonly="readonly" />-->
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
						<c:if test="${tinhTrangGA eq HT_APPROVE and not empty tinhTrangGA and (sessionScope.maThanhVien eq maNguoiTao or vaiTro eq Admin)}">
							<a href = "<%=Constant.PATH_RES.getString("iso.InGiaoAnTHPath") %>">								 
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