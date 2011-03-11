<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="java.sql.Connection"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.taglib.ChangeStringTaglib"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachThangDAO"%><html>
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

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<script type="text/javascript" language="JavaScript">
function checkRadio() {
	document.BangKeHoachThang.checkReject.checked = false;
	document.BangKeHoachThang.checkApprove.checked = false;
}	
function submitFormSearch(){		
	document.forms["FilerForm"].submit();
}
function submitFormSave(){		
	document.forms["BangkeHoachThang"].submit();
}
</script> 
<title>Xem Kế hoạch tháng</title>
</head>
<body>
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->	
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	
	<c:set var = "NEW" value = '<%= Constant.TINHTRANG_NEW %>'></c:set>
	<c:set var = "SEND" value = '<%= Constant.TINHTRANG_SEND %>'> </c:set>
	<c:set var = "APPROVE" value = '<%= Constant.TINHTRANG_APPROVE %>'> </c:set>
	<c:set var = "REJECT" value = '<%= Constant.TINHTRANG_REJECT %>'> </c:set>
	<c:set var = "PENDING" value = '<%= Constant.TINHTRANG_PENDING %>'> </c:set>
	<c:choose>			
		<c:when test = "${empty param.msg}">
			<c:set var = "PhanLoai" value = "All" ></c:set>
		</c:when>
		<c:otherwise>
			<c:set var = "PhanLoai" value = "${param.msg}" ></c:set>		
		</c:otherwise>
	</c:choose>	
	
	<strong><font size="5">Kế hoạch tháng</font></strong><br /><br />
	<form action = "<%=request.getContextPath()%>/keHoachThangController?phanloai=yes" method = "post" name = "FilerForm">
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan = "6">
					<div class = "div_tinhtrang"><p>Tình trạng : 	
					<select style="background-color: transparent;" name = "selectTinhTrang">	
						<option value = "All" <c:if test = "${PhanLoai eq 'All'}">selected</c:if>>All</option>
					<c:if test="${MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN}">
						<option value = "0" <c:if test = "${param.msg eq '0'}">selected</c:if> >New</option>
					</c:if>
						<option value = "1" <c:if test = "${PhanLoai eq '1'}">selected</c:if>>Pending</option>
						<option value = "2" <c:if test = "${PhanLoai eq '2'}">selected</c:if>>Approve</option>
						<option value = "3" <c:if test = "${PhanLoai eq '3'}">selected</c:if>>Reject</option>
					</select>
					<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
					</div>
				</td>	
			</tr>
		</table>
	</form>	 	
	<form action="<%=request.getContextPath()%>/keHoachThangController?duyet=yes" method="post" name="BangKeHoachThang" >	
		<table border="1" style="background-color: transparent;">	
			<tr style="background-color: transparent;">
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Tên chương trình</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Người lập</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Ngày lập</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Approve<br />
					<input type = "checkbox" name = "checkApprove"
					<c:if test="${(MaBoPhan ne BO_PHAN_PHC and MaBoPhan ne BO_PHAN_ADMIN) or PhanLoai ne SEND}">
						disabled
					</c:if>
						onclick="checkApproveAll();"/></div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Reject<br />
					<input type = "checkbox" name = "checkReject" 
					<c:if test="${(MaBoPhan ne BO_PHAN_PHC and MaBoPhan ne BO_PHAN_ADMIN) or PhanLoai ne SEND}">
						disabled
					</c:if> 
						onclick="checkRejectAll();"/></div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Lý do Reject</div></th>
			</tr>
	<% 	String currentPage = "", tinhTrang = "", maBoPhan = "", check = "0"; 
		int totalRows = 0;
	%>	
	<c:choose>
		<c:when test="${PhanLoai eq NEW}">
			<%tinhTrang = "0"; %>
		</c:when>
		<c:when test="${PhanLoai eq SEND}">
			<%tinhTrang = "1"; %>
		</c:when>
		<c:when test="${PhanLoai eq APPROVE}">
			<%tinhTrang = "2"; %>
		</c:when>
		<c:when test="${PhanLoai eq REJECT}">
			<%tinhTrang = "3"; %>
		</c:when>
	</c:choose>	
	
	<c:choose>			
		<c:when test = "${empty param.page}">
			<%currentPage = "1"; %>
		</c:when>
		<c:otherwise>
			<%currentPage = request.getParameter("page"); %>		
		</c:otherwise>
	</c:choose>		
	<c:set var="CurrentPage" value="<%=currentPage %>"></c:set>
	<c:if test = "${MaBoPhan ne BO_PHAN_ADMIN}">
		<%maBoPhan = (String) session.getAttribute("maBoPhan"); %>
	</c:if>
	<% totalRows = KeHoachThangDAO.getCountKeHoachThang(tinhTrang, maBoPhan);  %>	
	<c:set 	var = "ListKeHoachThang" 
					value = '<%= KeHoachThangDAO.getKeHoachThang(totalRows, currentPage, tinhTrang, maBoPhan) %>'></c:set>		
	<% Integer count = 0; %>
<c:forEach var = "KeHoachThang" items="${ListKeHoachThang}">	
	<c:set var = "iterator" value = "<%=count %>"></c:set>	
					  <tr style="background-color: transparent;">
						<td bgcolor = "#99bff9"><a href = "KeHoachCongTacThang.jsp?maID=${KeHoachThang.maKeHoachThang}">${KeHoachThang.tenKeHoach }</a></td>
						<td bgcolor = "#99bff9">${KeHoachThang.tenNguoiTao}</td>
						<td bgcolor = "#99bff9">${KeHoachThang.ngayCapNhatCuoi}</td>
		<!-- Trường hợp 'Truong_Khoa', kế hoạch bị 'approve', 'reject' thi disable radio  -->
						<th bgcolor = "#009fb2">
							<input type = "radio" name = "tinhtrang${iterator}" 
							<c:if test="${KeHoachThang.tinhTrang eq APPROVE}">checked</c:if> 
							<c:if test="${(MaBoPhan ne BO_PHAN_PHC and MaBoPhan ne BO_PHAN_ADMIN) 
											or KeHoachThang.tinhTrang eq REJECT 
												or KeHoachThang.tinhTrang eq APPROVE
													or (MaBoPhan eq BO_PHAN_PHC and KeHoachThang.tinhTrang eq SEND)}">disabled</c:if>
													onclick="checkRadio()" value = "Approve-${KeHoachThang.maKeHoachThang}"/></th>
		<!-- Trường hợp 'Truong_Khoa', kế hoạch bị 'approve', 'reject' thi disable radio  -->
						<th bgcolor = "#FF0000">
						<input type = "radio" name = "tinhtrang${iterator}" 
						<c:if test="${KeHoachThang.tinhTrang eq REJECT}">checked</c:if> 
						<c:if test="${(MaBoPhan ne BO_PHAN_PHC and MaBoPhan ne BO_PHAN_ADMIN)
											or	KeHoachThang.tinhTrang eq REJECT 
												or KeHoachThang.tinhTrang eq APPROVE
													or (MaBoPhan eq BO_PHAN_PHC and KeHoachThang.tinhTrang eq SEND)}">disabled</c:if>
												onclick="checkRadio()" value = "Reject-${KeHoachThang.maKeHoachThang}"/>
						</th>																																									
						<td bgcolor = "#99bff9"><textarea  rows="2" cols="13" name = "Ly_do_reject${iterator}" id = "Ly_do_reject${iterator}" style="background-color: transparent;"
										<c:if test="${(MaBoPhan ne BO_PHAN_PHC and MaBoPhan ne BO_PHAN_ADMIN) or
											KeHoachThang.tinhTrang eq REJECT 
												or KeHoachThang.tinhTrang eq APPROVE
													or (MaBoPhan eq BO_PHAN_PHC and KeHoachThang.tinhTrang eq SEND)}">readonly</c:if>>${KeHoachThang.lyDoReject}</textarea></td>
					  </tr>
					  <input type = "hidden" value = "${KeHoachThang.tenKeHoach }" id = "ten${iterator}"/>	
					  <% count++; %>				
</c:forEach>
<script type="text/javascript" language="JavaScript">
	function confirmDuyet(x) {
		var line = '\n';
		var msgApprove = "";
		var msgReject = "";
		<% for(Integer i=0;i<count;i++)
		{
			out.print("if(document.BangKeHoachThang.tinhtrang" + i.toString() + "[0].checked == true && document.BangKeHoachThang.tinhtrang" + i.toString() + "[0].disabled == false)");
			out.print("msgApprove += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangKeHoachThang.tinhtrang" + i.toString() + "[1].checked == true && document.BangKeHoachThang.tinhtrang" + i.toString() + "[1].disabled == false) {");
			out.print("msgReject += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangKeHoachThang.Ly_do_reject" + i.toString() + ".value.trim() == '') {alert('Xin nhập lý do reject cho các chương trình');return;}}");
		}
		%> 
		if(msgApprove != '' || msgReject != '')
		{
			if(msgApprove != '') {
				if(x == 1)
					msgApprove = 'Bạn approve \n ' + msgApprove;
				else
					msgApprove = 'Bạn gửi Ban giám hiệu \n ' + msgApprove;
			}
			if( msgReject != '')
				msgReject = 'Bạn reject \n ' + msgReject;
			if(confirm(msgApprove + '\n' + msgReject)) {
				if(x == 1) 
					document.getElementById('Type').value = "1";
				else
					document.getElementById('Type').value = "2";
				submitFormSave();	
			}
		}
		else
			alert("Không có chương trình nào được chọn");
	}

	function checkApproveAll() {
		if(document.BangkeHoachThang.checkApprove.checked == true)
		{					
			document.BangkeHoachThang.checkReject.checked = false;	
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangkeHoachThang.tinhtrang" + i.toString() +"[0].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangKeHoachThang.tinhtrang" + i.toString() +"[0].checked = false;\n");
				}
			%>
		}
	}	
	function checkRejectAll() {
		if(document.BangKeHoachThang.checkReject.checked == true)
		{		
			document.BangKeHoachThang.checkApprove.checked = false;				
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangKeHoachThang.tinhtrang" + i.toString() +"[1].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangKeHoachThang.tinhtrang" + i.toString() +"[1].checked = false;\n");
				}
			%>
		}
	}
</script> 
	<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRows) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		 <tr style="background-color: transparent;">
			<td colspan="6">
				<c:if test = "${CurrentPage gt 1}">
					<a href="<%=Constant.PATH_RES.getString("iso.XemKeHoachThangPath")%>?page=${CurrentPage - 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
				</c:if>	
				<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
					<a href="<%=Constant.PATH_RES.getString("iso.XemKeHoachThangPath")%>?page=${PageCount}&msg=${PhanLoai}">${PageCount}</a>
				</c:forEach>
				<c:if test = "${CurrentPage lt TotalPage}">
					<a href="<%=Constant.PATH_RES.getString("iso.XemKeHoachThangPath")%>?page=${CurrentPage + 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
				</c:if>	
			</td>
		</tr> 
		<tr style="background-color: transparent;">
			<td colspan="6">
				<c:if test="${MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN}">
					<a href="<%=request.getContextPath()%>/ISO/KeHoachCongTacThang/KeHoachCongTacThang.jsp?Them=yes"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" border = 0px/> </a>
				</c:if>		
				<c:if test="${MaBoPhan eq BO_PHAN_ADMIN or MaBoPhan eq BO_PHAN_BGH}">
					<a href = "javascript: confirmDuyet()"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="lưu" border = "0"/></a>
				</c:if>
			</td>
		</tr>		
	</table>
	<input type="hidden" value = "" name = "Type" id = "Type"/>
</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>