<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.QuyetDinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<script type="text/javascript" language="JavaScript">
	function checkRadio() {
		document.QuyetDinh.checkReject.checked = false;
		document.QuyetDinh.checkApprove.checked = false;
	}
	function submitFormSearch(){		
		document.forms["FilerForm"].submit();
	}
	function submitFormSave(){
		document.forms["QuyetDinh"].submit();
	}
</script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Tạo Mới QUYẾT ĐỊNH</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
<!--load variable from common packed-->
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "admin" value = '<%=Constant.ADMIN%>'></c:set>
	<c:set var = "nguoiLap" value = '<%=Constant.FULLNAME_ATT%>'></c:set>
	<c:set var = "Hieu_Truong" value = '<%=Constant.HIEU_TRUONG%>'></c:set>
	
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	
	<c:set var = "NEW" value = '<%=Constant.TINHTRANG_NEW%>'> </c:set>
	<c:set var = "SEND" value = '<%=Constant.TINHTRANG_SEND%>'> </c:set>
	<c:set var = "APPROVE" value = '<%=Constant.TINHTRANG_APPROVE%>'> </c:set>
	<c:set var = "REJECT" value = '<%=Constant.TINHTRANG_REJECT%>'> </c:set>
	
	<c:choose>			
		<c:when test = "${empty param.msg}">
			<c:set var = "PhanLoai" value = "All" ></c:set>
		</c:when>
		<c:otherwise>
			<c:set var = "PhanLoai" value = "${param.msg}" ></c:set>		
		</c:otherwise>
	</c:choose>	
	<strong><font size="5">Quyết Định Đào Tạo</font></strong><br /><br />
	


<!--phan loai quyet dinh bang combobox-->
	<form name="FilerForm" action="<%=request.getContextPath()%>/quyetDinhController?phanloai=yes" method="post">
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<div class = "div_tinhtrang"><p>Tình trạng :</p> 	
					<select name = "selectTinhTrang">	
						<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if> >All</option>
						<c:if test="${MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN}">
							<option value = "0" <c:if test = "${param.msg eq '0'}">selected</c:if>>New</option>
						</c:if>
						<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Pending</option>
						<option value = "2" <c:if test = "${param.msg eq '2'}">selected</c:if>>Approve</option>
						<option value = "3" <c:if test = "${param.msg eq '3'}">selected</c:if>>Reject</option>
					</select>
					<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				</div>			
			</tr>
		</table>
	</form>
	<form name="QuyetDinh" action="<%=request.getContextPath()%>/quyetDinhController?duyet=yes" method="post" >	
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Quyết định</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Người lập</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Ngày lập</div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Approve<br /><input type = "checkbox" id = "checkApprove"  <c:if test = "${PhanLoai ne SEND or (MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN)}">disabled="disabled"</c:if> onclick="checkApproveAll();"/></div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Reject<br /><input type = "checkbox" id = "checkReject" <c:if test = "${PhanLoai ne SEND or (MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN)}">disabled="disabled"</c:if> onclick="checkRejectAll();"/></div></th>
				<th bgcolor= '#186fb2'><div class = "div_txtintable1">Lý do reject</div></th>
			</tr>

	<% 	String currentPage = "", tinhTrang = "",  maBoPhan = ""; 
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
	<% totalRows = QuyetDinhDAO.getCountQuyetDinhDaoTao(tinhTrang, maBoPhan); %>
	<c:set 	var = "ListQuyetDinh" 
					value = '<%= QuyetDinhDAO.getQuyetDinhDaoTao(totalRows, currentPage, tinhTrang, maBoPhan) %>'></c:set>
					
			<% int count = 0; %>	
			<c:forEach var="objQuyetDinh" items = "${ListQuyetDinh}">
				<c:set var="iterator" value="<%=count%>"></c:set>
						<tr style="background-color: transparent;">
							<th width="120"><a href = "QuyetDinh.jsp?maQuyetDinh=${objQuyetDinh.maQuyetDinh}">${objQuyetDinh.tenQuyetDinh}</a></th>
							<td bgcolor = "#99bff9"><div class = "div_txtintable">${objQuyetDinh.tenNguoiLap}</div></td>
							<td bgcolor = "#99bff9"><div class = "div_txtintable">${objQuyetDinh.ngayLap}</div></td>
			<!-- Trường hợp kế hoạch bị 'approve', 'reject' thi daisable radio  -->
							<th bgcolor = "#009fb2">
								<input type = "radio" name = "tinhtrang${iterator}" 
								<c:if test="${objQuyetDinh.tinhTrang eq APPROVE}">checked</c:if> 
								<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN 
												or objQuyetDinh.tinhTrang eq REJECT 
													or objQuyetDinh.tinhTrang eq APPROVE}">disabled</c:if>
														onclick="checkRadio()" value = "Approve-${objQuyetDinh.maQuyetDinh}"/></th>
			<!-- Trường hợp kế hoạch bị 'approve', 'reject' thi disable radio  -->
							<th bgcolor = "#FF0000">
								<input type = "radio" name = "tinhtrang${iterator}" 
								<c:if test="${objQuyetDinh.tinhTrang eq REJECT}">checked</c:if> 
								<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN
												or	objQuyetDinh.tinhTrang eq REJECT 
													or objQuyetDinh.tinhTrang eq APPROVE}">disabled</c:if>
														onclick="checkRadio()" value = "Reject-${objQuyetDinh.maQuyetDinh}"/>
							</th>
					 		<td>
					 			<textarea  rows="2" cols="13" name="Ly_do_reject${iterator}" 
					 				<c:if test="${MaBoPhan ne BO_PHAN_BGH and MaBoPhan ne BO_PHAN_ADMIN
												or	objQuyetDinh.tinhTrang eq REJECT 
													or objQuyetDinh.tinhTrang eq APPROVE}">readonly</c:if>>${objQuyetDinh.lyDoReject}</textarea>
							</td>
						</tr>
					<input type = "hidden" value = "${objQuyetDinh.tenQuyetDinh}" name="ten${iterator}" id="ten${iterator}"/>
					<% count++; %>
			</c:forEach>
<script type="text/javascript" language="JavaScript">
	function confirmDuyet() {
		var line = '\n';
		var msgApprove = "";
		var msgReject = "";
		<% for(Integer i=0;i<count;i++)
		{
			out.print("if(document.QuyetDinh.tinhtrang" + i.toString() + "[0].checked == true && document.QuyetDinh.tinhtrang" + i.toString() + "[0].disabled == false)");
			out.print("msgApprove += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.QuyetDinh.tinhtrang" + i.toString() + "[1].checked == true && document.QuyetDinh.tinhtrang" + i.toString() + "[1].disabled == false) {");
			out.print("msgReject += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.QuyetDinh.Ly_do_reject" + i.toString() + ".value.trim() == '') {alert('Xin nhập lý do reject cho các quyết định');return;}}");
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
			alert("Không có kế hoạch nào được chọn");
	}

	function checkApproveAll() {
		if(document.QuyetDinh.checkApprove.checked == true)
		{	
			document.QuyetDinh.checkReject.checked = false;	
			<%for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.QuyetDinh.tinhtrang" + i.toString() +"[0].checked = true;\n");
				}%>
		}
		else
		{
			<%for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.QuyetDinh.tinhtrang" + i.toString() +"[0].checked = false;\n");
				}%>
		}
	}	
	function checkRejectAll() {
		if(document.QuyetDinh.checkReject.checked == true)
		{		
			document.QuyetDinh.checkApprove.checked = false;				
			<%for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.QuyetDinh.tinhtrang" + i.toString() +"[1].checked = true;\n");
				}%>
		}
		else
		{
			<%for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.QuyetDinh.tinhtrang" + i.toString() +"[1].checked = false;\n");
				}%>
		}
	}
</script>
<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRows) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		 	<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemQuyetDinhDaoTaoPath")%>?page=${CurrentPage - 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemQuyetDinhDaoTaoPath")%>?page=${PageCount}&msg=${PhanLoai}">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemQuyetDinhDaoTaoPath")%>?page=${CurrentPage + 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr> 
			<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test="${MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN}">
						<a href="<%=request.getContextPath()%>/ISO/QuyetDinhDaoTao/QuyetDinh.jsp?Them=ok"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" border = 0px alt ="new" /></a>
					</c:if>		
						
					<c:if test="${MaBoPhan eq BO_PHAN_ADMIN or MaBoPhan eq BO_PHAN_BGH}">
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
</body>
</html>