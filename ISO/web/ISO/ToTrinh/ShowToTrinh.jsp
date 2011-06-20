<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="org.zefer.html.doc.t"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ToTrinhDAO"%><html xmlns="http://www.w3.org/1999/xhtml">
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
	var duongDan = "";
	function checkRadio() {
		document.BangToTrinh.checkReject.checked = false;
		document.BangToTrinh.checkApprove.checked = false;
	}	
	function submitFormSearch(){		
		document.forms["FilerForm"].submit();
	}
	function submitFormSave(){		
		document.forms["BangToTrinh"].submit();
	}
	<%
		int countThayDoi = ToTrinhDAO.getCountThayDoi();
	%>
	function showThayDoi()
	{
		value = window.showModalDialog(duongDan + "ShowThayDoi.jsp","","dialogHeight: 650px; dialogWidth: 800px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;");
	}
</script>

<title>Thời Khóa Biểu</title>
</head>
<body>
<div class = "div_pagebody">	
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<font>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "TRUONG_KHOA" value = '<%= Constant.TRUONG_KHOA %>'> </c:set>
	<c:set var = "PHO_KHOA" value = '<%= Constant.PHO_KHOA %>'> </c:set>
	
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	
	<c:set var = "NEW" value = '<%= Constant.TINHTRANG_NEW %>'></c:set>
	<c:set var = "SEND" value = '<%= Constant.TINHTRANG_SEND %>'> </c:set>
	<c:set var = "APPROVE" value = '<%= Constant.TINHTRANG_APPROVE %>'> </c:set>
	<c:set var = "REJECT" value = '<%= Constant.TINHTRANG_REJECT %>'> </c:set>
	<c:choose>			
		<c:when test = "${empty param.msg}">
			<c:set var = "PhanLoai" value = "All" ></c:set>
		</c:when>
		<c:otherwise>
			<c:set var = "PhanLoai" value = "${param.msg}" ></c:set>		
		</c:otherwise>
	</c:choose>	
	<br /><strong><font size="5">Tờ Trình</font></strong><br /><br />
		<form name="FilerForm" action="<%=request.getContextPath()%>/toTrinhController" method="post">
			<input type = "hidden" value = "PhanLoai" name = "actionType"/>
			<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">	
					<td colspan = "6">	
						<div class = "div_tinhtrang">Tình trạng :	
							<select name = "selectTinhTrang">	
								<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if> >All</option>
							<c:if test="${vaiTro eq TRUONG_KHOA or MaBoPhan eq BO_PHAN_ADMIN}">
								<option value = "0" <c:if test = "${param.msg eq '0'}">selected</c:if> >New</option>
							</c:if>	
								<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Pending</option>
								<option value = "2" <c:if test = "${param.msg eq '2'}">selected</c:if>>Approve</option>
								<option value = "3" <c:if test = "${param.msg eq '3'}">selected</c:if>>Reject</option>
							</select>
							<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
							<a href = "javascript: showThayDoi()"><img src="<%=request.getContextPath()%>/images/buttom/showthaydoi.png" alt="Thay đổi" border = "0" /></a>
						</div>
					</td>				
				</tr>
			</table>
		</form>
		<form name = "BangToTrinh" action = "<%=request.getContextPath()%>/toTrinhController" method = "post">
			<input type = "hidden" value = "" name = "actionType"/>
			<table border="1" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Tờ trình</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Người lập</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Ngày lập</div></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Approve</div>
	<!-- Trường hợp 'All', 'Approve', 'Reject' thì diasble checkbox Approve -->
					<input type = "checkbox" name = "checkApprove" 
							<c:if test = "${PhanLoai ne SEND or (MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN)}">disabled</c:if> 
							onclick="checkApproveAll();"/></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Reject</div>
	<!-- Trường hợp 'All', 'Approve', 'Reject' thì diasble checkbox Approve -->
					<input type = "checkbox" name = "checkReject"
							<c:if test = "${PhanLoai ne SEND or (MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN)}">disabled</c:if>
							 onclick="checkRejectAll();"/></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Lý do Reject</div></th>
				</tr>
	<% 	String currentPage = "", tinhTrang = "", maBoPhan = ""; 
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
		<% totalRows = ToTrinhDAO.getCountToTrinh(tinhTrang, maBoPhan);  %>	
	<c:set 	var = "ListToTrinh" 
					value = '<%= ToTrinhDAO.getToTrinh(totalRows, currentPage, tinhTrang, maBoPhan) %>'></c:set>			
		<% Integer count = 0; %>	
		<c:forEach  var="ToTrinh" 
					items = "${ListToTrinh}">
			<c:set var="iterator" value="<%=count %>"></c:set>			
					  <tr style="background-color: transparent;">
						<td bgcolor = "#99bff9"><a href = "ToTrinh.jsp?maID=${ToTrinh.id}">${ToTrinh.ten}</a></td>
						<td bgcolor = "#99bff9">${ToTrinh.tenNguoiTao}</td>
						<td bgcolor = "#99bff9">${ToTrinh.ngayCapNhatCuoi}</td>
		<!-- Trường hợp 'TRUONG_KHOA', kế hoạch bị 'approve', 'reject' thi daisable radio  -->
						<th bgcolor = "#009fb2">
							<input type = "radio" name = "tinhtrang${iterator}" 
							<c:if test="${ToTrinh.tinhTrang eq APPROVE}">checked</c:if> 
							<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN 
											or ToTrinh.tinhTrang eq REJECT 
												or ToTrinh.tinhTrang eq APPROVE}">disabled</c:if>
													onclick="checkRadio()" value = "Approve-${ToTrinh.id}-${ToTrinh.maNguoiTao}"/></th>
		<!-- Trường hợp 'TRUONG_KHOA', kế hoạch bị 'approve', 'reject' thi disable radio  -->
						<th bgcolor = "#FF0000">
						<input type = "radio" name = "tinhtrang${iterator}" 
						<c:if test="${ToTrinh.tinhTrang eq REJECT}">checked</c:if> 
						<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN 
											or	ToTrinh.tinhTrang eq REJECT 
												or ToTrinh.tinhTrang eq APPROVE}">disabled</c:if>
												onclick="checkRadio()" value = "Reject-${ToTrinh.id}-${ToTrinh.maNguoiTao}"/>
						</th>																																									
						<td bgcolor = "#99bff9"><textarea  rows="2" cols="13" name = "Ly_do_reject${iterator}" id = "Ly_do_reject${iterator}" style="background-color: transparent;"
										<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN or
											ToTrinh.tinhTrang eq REJECT 
												or ToTrinh.tinhTrang eq APPROVE}">readonly</c:if>>${ToTrinh.lyDoReject}</textarea></td>
					  </tr>
					  <% count++; %>
					  <input type = "hidden" value = "${ToTrinh.ten}" id = "ten${iterator}"/>							
		</c:forEach>	
<script type="text/javascript" language="JavaScript">
	function confirmDuyet() {
		var msgApprove = "";
		var msgReject = "";
		var line = '\n';
		<% for(Integer i=0;i<count;i++)
		{
			out.print("if(document.BangToTrinh.tinhtrang" + i.toString() + "[0].checked == true && document.BangToTrinh.tinhtrang" + i.toString() + "[0].disabled == false)");
			out.print("msgApprove += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangToTrinh.tinhtrang" + i.toString() + "[1].checked == true && document.BangToTrinh.tinhtrang" + i.toString() + "[1].disabled == false) {");
			out.print("msgReject += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangToTrinh.Ly_do_reject" + i.toString() + ".value.trim() == '') {alert('Xin nhập lý do reject cho các thời khóa biểu');return;}}");
		}
		%> 
		if(msgApprove != '' || msgReject != '')
		{
			document.BangToTrinh.actionType.value = "DuyetToTrinh";
			if(msgApprove != '')
				msgApprove = 'Bạn approve \n ' + msgApprove;
			if( msgReject != '')
				msgReject = 'Bạn reject \n ' + msgReject;
			if(confirm(msgApprove + '\n' + msgReject))
				submitFormSave();	
			
		}
		else
			alert("Không có tờ trình nào được chọn");
	}

	function checkApproveAll() {
		if(document.BangToTrinh.checkApprove.checked == true)
		{					
			document.BangToTrinh.checkReject.checked = false;	
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangToTrinh.tinhtrang" + i.toString() +"[0].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangToTrinh.tinhtrang" + i.toString() +"[0].checked = false;\n");
				}
			%>
		}
	}	
	function checkRejectAll() {
		if(document.BangToTrinh.checkReject.checked == true)
		{		
			document.BangToTrinh.checkApprove.checked = false;				
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangToTrinh.tinhtrang" + i.toString() +"[1].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangToTrinh.tinhtrang" + i.toString() +"[1].checked = false;\n");
				}
			%>
		}
	}
	function guiToTrinh()
	{
		if(<%=countThayDoi%> == 0)
			alert("Không có thay đổi nào !!!");
		else
		{
			if(confirm("Bạn có chắc muốn gửi tờ trình không???"))
			{
				document.BangToTrinh.actionType.value = "GuiToTrinh";
				submitFormSave();
			}
		}
	}
</script>
	<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRows) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		 	<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemToTrinhPath")%>?page=${CurrentPage - 1}&msg=${PhanLoai}" >Previous</a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemToTrinhPath")%>?page=${PageCount}&msg=${PhanLoai}">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemToTrinhPath")%>?page=${CurrentPage + 1}&msg=${PhanLoai}" >Next</a>
					</c:if>	
				</td>
			</tr> 
			<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test="${vaiTro eq TRUONG_KHOA or vaiTro eq PHO_KHOA or MaBoPhan eq BO_PHAN_ADMIN}">
						<a href="javascript:guiToTrinh()"><img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="tạo mới" border = "0" /></a>
					</c:if>		
					<c:if test="${MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN}">
						<a href = "javascript: confirmDuyet()"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="lưu" border = "0"/></a>
					</c:if>		
				</td>
			</tr>
		</table>
	</form>		
</font>
		<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>