<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="java.sql.Connection"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.taglib.ChangeStringTaglib"%><html>
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
	document.BangChuongTrinhDaoTao.checkReject.checked = false;
	document.BangChuongTrinhDaoTao.checkApprove.checked = false;
}	
function submitFormSearch(){		
	document.forms["FilerForm"].submit();
}
function submitFormSave(){		
	document.forms["BangChuongTrinhDaoTao"].submit();
}
</script> 
<title>Xem Chương Trình Đào Tạo</title>
</head>
<body>
<div class = "div_pagebody">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->	
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "Truong_Khoa" value = '<%= Constant.TRUONG_KHOA %>'> </c:set>
	<c:set var = "Pho_Khoa" value = '<%= Constant.PHO_KHOA %>'> </c:set>
	
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
	<strong><font size="5">Chương Trình Đào Tạo</font></strong><br /><br />
	<form action = "<%=request.getContextPath()%>/chuongTrinhDaoTaoController?phanloai=yes" method = "post" name = "FilerForm">
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan = "6">
					<div class = "div_tinhtrang"><p>Tình trạng : 	
					<select style="background-color: transparent;" name = "selectTinhTrang">	
						<option value = "All" <c:if test = "${PhanLoai eq 'All'}">selected</c:if>>All</option>
					<c:if test="${vaiTro eq Truong_Khoa or vaiTro eq Pho_Khoa or MaBoPhan eq BO_PHAN_ADMIN}">
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
	<form action="<%=request.getContextPath()%>/chuongTrinhDaoTaoController?duyet=yes" method="post" name="BangChuongTrinhDaoTao" >	
		<table border="1" style="background-color: transparent;">	
			<tr style="background-color: transparent;">
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Tên chương trình</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Người lập</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Ngày lập</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Approve<br />
					<input type = "checkbox" name = "checkApprove"
					<c:if test="${(MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN) or PhanLoai ne SEND}">
						disabled
					</c:if>
						onclick="checkApproveAll();"/></div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Reject<br />
					<input type = "checkbox" name = "checkReject" 
					<c:if test="${(MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN) or PhanLoai ne SEND}">
						disabled
					</c:if> 
						onclick="checkRejectAll();"/></div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Lý do Reject</div></th>
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
	<% totalRows = ChuongTrinhDaoTaoDAO.getCountChuongTrinhDaoTao(tinhTrang, maBoPhan);  %>	
	<c:set 	var = "ListChuongTrinhDaoTao" 
					value = '<%= ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTao(totalRows, currentPage, tinhTrang, maBoPhan) %>'></c:set>		
	<% Integer count = 0; %>
<c:forEach var = "ObjChuongTrinh" items="${ListChuongTrinhDaoTao}">	
	<c:set var = "iterator" value = "<%=count %>"></c:set>	
					  <tr style="background-color: transparent;">
						<td bgcolor = "#99bff9"><a href = "ChuongTrinhDaoTao.jsp?maID=${ObjChuongTrinh.maChuongTrinhDaoTao}">CHƯƠNG TRÌNH ĐÀO TẠO <br/> HỆ ${sf:upperString(ObjChuongTrinh.tenTrinhDo)} NGÀNH ${sf:upperString(ObjChuongTrinh.tenNghe)} <br/>${ObjChuongTrinh.tenChuongTrinhDaoTao}</a></td>
						<td bgcolor = "#99bff9">${ObjChuongTrinh.tenNguoiTao}</td>
						<td bgcolor = "#99bff9">${ObjChuongTrinh.ngayCapNhatCuoi}</td>
		<!-- Trường hợp 'Truong_Khoa', kế hoạch bị 'approve', 'reject' thi daisable radio  -->
						<th bgcolor = "#009fb2">
							<input type = "radio" name = "tinhtrang${iterator}" 
							<c:if test="${ObjChuongTrinh.tinhTrang eq APPROVE}">checked</c:if> 
							<c:if test="${(MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN) 
											or ObjChuongTrinh.tinhTrang eq REJECT 
												or ObjChuongTrinh.tinhTrang eq APPROVE}">disabled</c:if>
													onclick="checkRadio()" value = "Approve-${ObjChuongTrinh.maChuongTrinhDaoTao}"/></th>
		<!-- Trường hợp 'Truong_Khoa', kế hoạch bị 'approve', 'reject' thi disable radio  -->
						<th bgcolor = "#FF0000">
						<input type = "radio" name = "tinhtrang${iterator}" 
						<c:if test="${ObjChuongTrinh.tinhTrang eq REJECT}">checked</c:if> 
						<c:if test="${(MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN)
											or	ObjChuongTrinh.tinhTrang eq REJECT 
												or ObjChuongTrinh.tinhTrang eq APPROVE}">disabled</c:if>
												onclick="checkRadio()" value = "Reject-${ObjChuongTrinh.maChuongTrinhDaoTao}"/>
						</th>																																									
						<td bgcolor = "#99bff9"><textarea  rows="2" cols="13" name = "Ly_do_reject${iterator}" id = "Ly_do_reject${iterator}" style="background-color: transparent;"
										<c:if test="${(MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN) or
											ObjChuongTrinh.tinhTrang eq REJECT 
												or ObjChuongTrinh.tinhTrang eq APPROVE}">readonly</c:if>>${ObjChuongTrinh.lyDoReject}</textarea></td>
					  </tr>
					  <input type = "hidden" value = "CTDT HỆ ${sf:upperString(ObjChuongTrinh.tenTrinhDo)} NGÀNH ${sf:upperString(ObjChuongTrinh.tenNghe)} ${ObjChuongTrinh.tenChuongTrinhDaoTao}" id = "ten${iterator}"/>	
					  <% count++; %>				
</c:forEach>
<script type="text/javascript" language="JavaScript">
	function confirmDuyet() {
		var line = '\n';
		var msgApprove = "";
		var msgReject = "";
		<% for(Integer i=0;i<count;i++)
		{
			out.print("if(document.BangChuongTrinhDaoTao.tinhtrang" + i.toString() + "[0].checked == true && document.BangChuongTrinhDaoTao.tinhtrang" + i.toString() + "[0].disabled == false)");
			out.print("msgApprove += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangChuongTrinhDaoTao.tinhtrang" + i.toString() + "[1].checked == true && document.BangChuongTrinhDaoTao.tinhtrang" + i.toString() + "[1].disabled == false) {");
			out.print("msgReject += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangChuongTrinhDaoTao.Ly_do_reject" + i.toString() + ".value.trim() == '') {alert('Xin nhập lý do reject cho các chương trình');return;}}");
		}
		%> 
		if(msgApprove != '' || msgReject != '')
		{
			if(msgApprove != '')
				msgApprove = 'Bạn approve \n ' + msgApprove;
			if( msgReject != '')
				msgReject = 'Bạn reject \n ' + msgReject;
			if(confirm(msgApprove + '\n' + msgReject))
				submitFormSave();	
			
		}
		else
			alert("Không có chương trình nào được chọn");
	}

	function checkApproveAll() {
		if(document.BangChuongTrinhDaoTao.checkApprove.checked == true)
		{					
			document.BangChuongTrinhDaoTao.checkReject.checked = false;	
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangChuongTrinhDaoTao.tinhtrang" + i.toString() +"[0].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangChuongTrinhDaoTao.tinhtrang" + i.toString() +"[0].checked = false;\n");
				}
			%>
		}
	}	
	function checkRejectAll() {
		if(document.BangChuongTrinhDaoTao.checkReject.checked == true)
		{		
			document.BangChuongTrinhDaoTao.checkApprove.checked = false;				
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangChuongTrinhDaoTao.tinhtrang" + i.toString() +"[1].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangChuongTrinhDaoTao.tinhtrang" + i.toString() +"[1].checked = false;\n");
				}
			%>
		}
	}
</script> 
	<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRows) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		 <tr style="background-color: transparent;">
			<td colspan="6">
				<c:if test = "${CurrentPage gt 1}">
					<a href="<%=Constant.PATH_RES.getString("iso.XemChuongTrinhDaoTaoPath")%>?page=${CurrentPage - 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
				</c:if>	
				<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
					<a href="<%=Constant.PATH_RES.getString("iso.XemChuongTrinhDaoTaoPath")%>?page=${PageCount}&msg=${PhanLoai}">${PageCount}</a>
				</c:forEach>
				<c:if test = "${CurrentPage lt TotalPage}">
					<a href="<%=Constant.PATH_RES.getString("iso.XemChuongTrinhDaoTaoPath")%>?page=${CurrentPage + 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
				</c:if>	
			</td>
		</tr> 
		<tr style="background-color: transparent;">
			<td colspan="6">
				<c:if test="${vaiTro eq Truong_Khoa or vaiTro eq Pho_Khoa or MaBoPhan eq BO_PHAN_ADMIN}">
					<a href="<%=request.getContextPath()%>/ISO/ChuongTrinhDaoTao/ChuongTrinhDaoTao.jsp?Them=yes"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" border = 0px/> </a>
				</c:if>		
				<c:if test="${MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN}">
					<a href = "javascript: confirmDuyet()"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="lưu" border = "0"/></a>
				</c:if>
					
			</td>
		</tr>		
	</table>
</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>
</body>
</html>