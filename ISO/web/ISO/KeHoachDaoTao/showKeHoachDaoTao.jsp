<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="org.zefer.html.doc.t"%><html xmlns="http://www.w3.org/1999/xhtml">
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
		document.BangKeHoachDaoTao.checkReject.checked = false;
		document.BangKeHoachDaoTao.checkApprove.checked = false;
	}	
	function submitFormSearch(){		
		document.forms["FilerForm"].submit();
	}
	function submitFormSave(){		
		document.forms["BangKeHoachDaoTao"].submit();
	}
</script>

<title>Xem Kế Hoạch Đào Tạo</title>
</head>
<body>
<div class = "div_pagebody">	
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<font>
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "admin" value = '<%= Constant.ADMIN %>'></c:set>
	<c:set var = "PHONG_DAO_TAO" value = '<%= Constant.PHONG_DAO_TAO %>'> </c:set>
	<c:set var = "Hieu_Truong" value = '<%= Constant.HIEU_TRUONG %>'></c:set>
	
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_PDT" value = '<%= Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	
	<c:set var = "NEW" value = '<%= Constant.TINHTRANG_NEW %>'></c:set>
	<c:set var = "SEND" value = '<%= Constant.TINHTRANG_SEND %>'> </c:set>
	<c:set var = "APPROVE" value = '<%= Constant.TINHTRANG_APPROVE %>'> </c:set>
	<c:set var = "REJECT" value = '<%= Constant.TINHTRANG_REJECT %>'> </c:set>
	<c:set var = "BOSUNG" value = '<%= Constant.TINHTRANG_BO_SUNG %>'></c:set>
	<c:choose>			
		<c:when test = "${empty param.msg}">
			<c:set var = "PhanLoai" value = "All" ></c:set>
		</c:when>
		<c:otherwise>
			<c:set var = "PhanLoai" value = "${param.msg}" ></c:set>		
		</c:otherwise>
	</c:choose>	
	<br /><strong><font size="5">Kế Hoạch Đào Tạo</font></strong><br /><br />
		<form name="FilerForm" action="<%=request.getContextPath()%>/keHoachDaoTaoController?phanloai=yes" method="post">
			<table border = "1" style="background-color: transparent;">
				<tr style="background-color: transparent;">	
					<td colspan = "6">	
						<div class = "div_tinhtrang">Tình trạng :	
							<select name = "selectTinhTrang">	
								<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if> >All</option>
							<c:if test="${MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_ADMIN}">
								<option value = "0" <c:if test = "${param.msg eq '0'}">selected</c:if> >New</option>
							</c:if>	
								<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Pending</option>
								<option value = "2" <c:if test = "${param.msg eq '2'}">selected</c:if>>Approve</option>
								<option value = "3" <c:if test = "${param.msg eq '3'}">selected</c:if>>Reject</option>
							</select>
							<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
						</div>
					</td>				
				</tr>
			</table>
		</form>
		<form name = "BangKeHoachDaoTao" action = "<%=request.getContextPath()%>/keHoachDaoTaoController?duyet=yes" method = "post">
			<table border="1" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Tên kế hoạch</div></th>
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
	<% totalRows = KeHoachDaoTaoDao.getCountKeHoachDaoTao(tinhTrang, maBoPhan);  %>	
	<c:set 	var = "ListKeHoachDaoTao" 
					value = '<%= KeHoachDaoTaoDao.getKeHoachDaoTao(totalRows, currentPage, tinhTrang, maBoPhan) %>'></c:set>		
		<% Integer count = 0; %>	
		<c:forEach  var="ObjKeHoachDaoTao" 
					items = "${ListKeHoachDaoTao}">
			<c:set var="iterator" value="<%=count %>"></c:set>			
					  <tr style="background-color: transparent;">
						<td bgcolor = "#99bff9">
							<a href = "keHoachDaoTao.jsp?ID=${ObjKeHoachDaoTao.maKeHoachDaoTao}">${ObjKeHoachDaoTao.tenKeHoachDaoTao}</a>
							<c:if test="${(ObjKeHoachDaoTao.tinhTrang eq APPROVE or ObjKeHoachDaoTao.tinhTrang eq BOSUNG) and (MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN)}">
								<a href="<%=Constant.PATH_RES.getString("iso.BoSungCongTacPath")%>?maKHDT=${ObjKeHoachDaoTao.maKeHoachDaoTao}">	
									<img src="<%=request.getContextPath()%>/images/buttom/phancttuan.png" alt="Phân công tác tuần" border = "0" />
								</a>			
							</c:if>
						</td>
						<td bgcolor = "#99bff9">${ObjKeHoachDaoTao.tenNguoiLap}</td>
						<td bgcolor = "#99bff9">${ObjKeHoachDaoTao.ngayCapNhatCuoi}</td>
		<!-- Trường hợp 'PHONG_DAO_TAO', kế hoạch bị 'approve', 'reject' thi daisable radio  -->
						<th bgcolor = "#009fb2">
							<input type = "radio" name = "tinhtrang${iterator}" 
							<c:if test="${ObjKeHoachDaoTao.tinhTrang eq APPROVE or ObjKeHoachDaoTao.tinhTrang eq BOSUNG}">checked</c:if> 
							<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN
											or ObjKeHoachDaoTao.tinhTrang eq REJECT 
												or ObjKeHoachDaoTao.tinhTrang eq APPROVE}">disabled</c:if>
													onclick="checkRadio()" value = "Approve-${ObjKeHoachDaoTao.maKeHoachDaoTao}"/></th>
		<!-- Trường hợp 'PHONG_DAO_TAO', kế hoạch bị 'approve', 'reject' thi disable radio  -->
						<th bgcolor = "#FF0000">
						<input type = "radio" name = "tinhtrang${iterator}" 
						<c:if test="${ObjKeHoachDaoTao.tinhTrang eq REJECT}">checked</c:if> 
						<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN
											or	ObjKeHoachDaoTao.tinhTrang eq REJECT 
												or ObjKeHoachDaoTao.tinhTrang eq APPROVE}">disabled</c:if>
												onclick="checkRadio()" value = "Reject-${ObjKeHoachDaoTao.maKeHoachDaoTao}"/>
						</th>																																									
						<td bgcolor = "#99bff9"><textarea rows="2" cols="13" name = "Ly_do_reject${iterator}" id = "Ly_do_reject${iterator}" style="background-color: transparent;"
										<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN or
											ObjKeHoachDaoTao.tinhTrang eq REJECT 
												or ObjKeHoachDaoTao.tinhTrang eq APPROVE}">readonly</c:if>>${ObjKeHoachDaoTao.lyDoReject}</textarea></td>
					  </tr>
					  <% count++; %>
					  	<input type = "hidden" value = "${ObjKeHoachDaoTao.tenKeHoachDaoTao}" id = "ten${iterator}"/>						
		</c:forEach>	
<script type="text/javascript" language="JavaScript">
	function confirmDuyet() {
		var line = '\n';
		var msgApprove = "";
		var msgReject = "";
		<% for(Integer i=0;i<count;i++)
		{
			out.print("if(document.BangKeHoachDaoTao.tinhtrang" + i.toString() + "[0].checked == true && document.BangKeHoachDaoTao.tinhtrang" + i.toString() + "[0].disabled == false)");
			out.print("msgApprove += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangKeHoachDaoTao.tinhtrang" + i.toString() + "[1].checked == true && document.BangKeHoachDaoTao.tinhtrang" + i.toString() + "[1].disabled == false) {");
			out.print("msgReject += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangKeHoachDaoTao.Ly_do_reject" + i.toString() + ".value.trim() == '') {alert('Xin nhập lý do reject cho các kế hoạch');return;}}");
		}
		%> 
		if(msgApprove != '' || msgReject != '')
		{
			if(msgApprove != '')
				msgApprove = 'Bạn approve \n' + msgApprove;
			if( msgReject != '')
				msgReject = 'Bạn reject \n' + msgReject;
			if(confirm(msgApprove + '\n' + msgReject))
				submitFormSave();	
			
		}
		else
			alert("Không có kế hoạch nào được chọn");
	}

	function checkApproveAll() {
		if(document.BangKeHoachDaoTao.checkApprove.checked == true)
		{					
			document.BangKeHoachDaoTao.checkReject.checked = false;	
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangKeHoachDaoTao.tinhtrang" + i.toString() +"[0].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangKeHoachDaoTao.tinhtrang" + i.toString() +"[0].checked = false;\n");
				}
			%>
		}
	}
		
	function checkRejectAll() {
		if(document.BangKeHoachDaoTao.checkReject.checked == true)
		{		
			document.BangKeHoachDaoTao.checkApprove.checked = false;				
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangKeHoachDaoTao.tinhtrang" + i.toString() +"[1].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangKeHoachDaoTao.tinhtrang" + i.toString() +"[1].checked = false;\n");
				}
			%>
		}
	}
</script>
	<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRows) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		 	<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoPath")%>?page=${CurrentPage - 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoPath")%>?page=${PageCount}&msg=${PhanLoai}">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoPath")%>?page=${CurrentPage + 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr> 
			<tr style="background-color: transparent;">
				<td colspan="6">
				<c:if test="${MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_ADMIN}">
					<a href="<%=request.getContextPath()%>/ISO/KeHoachDaoTao/keHoachDaoTao.jsp?Them=yes"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
				</c:if>		
				<c:if test="${MaBoPhan eq BO_PHAN_ADMIN or MaBoPhan eq BO_PHAN_BGH}">
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