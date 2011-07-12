<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%><html>
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
<script type="text/javascript" language="JavaScript">

function checkRadio() {
	document.BangDeCuongMonHoc.checkReject.checked = false;
	document.BangDeCuongMonHoc.checkApprove.checked = false;
}	
function submitFormSearch(){		
	document.forms["FilerForm"].submit();
}
function submitFormSave(){		
	document.forms["BangDeCuongMonHoc"].submit();
}
</script> 
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Xem Đề Cương Môn Học</title>
</head>
<body>

<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>
	<c:set var = "Truong_Bo_Mon" value = '<%= Constant.TRUONG_BO_MON %>'></c:set>	
	<c:set var = "Truong_Khoa" value = '<%= Constant.TRUONG_KHOA %>'> </c:set>
	<c:set var = "Pho_Khoa" value = '<%= Constant.PHO_KHOA %>'> </c:set>
	<c:set var = "Giao_Vien" value = '<%= Constant.GIAO_VIEN %>'> </c:set>
	
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	
	<c:set var = "NEW" value = '<%= Constant.TINHTRANG_NEW %>'></c:set>
	<c:set var = "SEND" value = '<%= Constant.TINHTRANG_SEND %>'> </c:set>
	<c:set var = "APPROVE" value = '<%= Constant.TINHTRANG_APPROVE %>'> </c:set>
	<c:set var = "REJECT" value = '<%= Constant.TINHTRANG_REJECT %>'> </c:set>
<% 	String currentPage = "", tinhTrang = "", maNguoiTao = "", maBoPhan = "", maVaiTro = "", tenMonHoc = ""; 
		int totalRows = 0;
		maVaiTro = (String) session.getAttribute("maVaiTro");
		if(request.getAttribute("tenMonHocTimKiem") != null) {
			tenMonHoc = (String) request.getAttribute("tenMonHocTimKiem");
		} else if(session.getAttribute("TenMonHoc") != null) {
			tenMonHoc = (String) session.getAttribute("TenMonHoc");
		}
	%>
	<c:if test="${empty param.msg}">
		<%tenMonHoc = ""; %>
	</c:if>
	<c:set var = "TenMonHoc" value = "<%=tenMonHoc %>" scope = "session"></c:set>
	<c:choose>			
		<c:when test = "${empty param.msg}">
			<c:set var = "PhanLoai" value = "All" ></c:set>
		</c:when>
		<c:otherwise>
			<c:set var = "PhanLoai" value = "${param.msg}" ></c:set>
		</c:otherwise>
	</c:choose>	
	<form action="<%=request.getContextPath()%>/deCuongMonHocController?phanloai=yes" method="post" name = "FilerForm">	
		<strong><font size="5"> Đề Cương Môn Học</font></strong>
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan = "6">
					<div class = "div_tinhtrang">
						<p>Tình trạng : 
							<select style="border-color: transparent;" name = "selectTinhTrang">	
								<option value = "All" <c:if test = "${param.msg eq 'All'}">selected</c:if>>All</option>
							<c:if test="${vaiTro eq Truong_Bo_Mon or MaBoPhan eq BO_PHAN_ADMIN}">
								<option value = "0" <c:if test = "${param.msg eq '0'}">selected</c:if> >New</option>
							</c:if>		
								<option value = "1" <c:if test = "${param.msg eq '1'}">selected</c:if>>Pending</option>
								<option value = "2" <c:if test = "${param.msg eq '2'}">selected</c:if>>Approve</option>
								<option value = "3" <c:if test = "${param.msg eq '3'}">selected</c:if>>Reject</option>
							</select>
							<c:set var="khoaList" value='<%=KhoaDAO.getKhoaByBoPhan(Integer.parseInt((String) request.getSession().getAttribute("maBoPhan"))) %>'></c:set>
						<c:if test="${vaiTro ne Truong_Bo_Mon and vaiTro ne Truong_Khoa and vaiTro ne Pho_Khoa and vaiTro ne Giao_Vien}">	
						Khoa : 
							<select id = "cboKhoa" name="cboKhoa">
								<option value="">All</option>
								<c:forEach items="${khoaList}" var="objKhoa">
									<option value='${objKhoa.maKhoa}' <c:if test="${param.khoa eq objKhoa.maKhoa }">selected</c:if> >${objKhoa.tenKhoa}</option>
								</c:forEach>
							</select>
						</c:if>	
						Tên môn học : 
							<input type = "text" value = "${TenMonHoc}" id = "txtTenMonHoc" name = "txtTenMonHoc"/>
						<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
					</div>
					
				</td>
			</tr>
	</form>
	<form action="<%=request.getContextPath()%>/deCuongMonHocController?duyet=yes" method="post" name="BangDeCuongMonHoc">
		<tr style="background-color: transparent;">
			<th bgcolor="#186fb2"><div class = "div_txtintable1">Tên Môn Học</div></th>
			<th bgcolor="#186fb2"><div class = "div_txtintable1">Người lập</div></th>
			<th bgcolor="#186fb2"><div class = "div_txtintable1">Ngày lập</div></th>
			<th bgcolor = '#186fb2'><div class = "div_txtintable1">Approve</div>
			<!-- Trường hợp 'All', 'Approve', 'Reject' thì diasble checkbox Approve -->
					<input type = "checkbox" name = "checkApprove" 
							<c:if test = "${PhanLoai ne SEND or (vaiTro ne Truong_Khoa and MaBoPhan ne BO_PHAN_ADMIN)}">disabled</c:if> 
							onclick="checkApproveAll();"/></th>
					<th bgcolor = '#186fb2'><div class = "div_txtintable1">Reject</div>
	<!-- Trường hợp 'All', 'Approve', 'Reject' thì diasble checkbox Approve -->
					<input type = "checkbox" name = "checkReject"
							<c:if test = "${PhanLoai ne SEND or (vaiTro ne Truong_Khoa and MaBoPhan ne BO_PHAN_ADMIN)}">disabled</c:if>
							 onclick="checkRejectAll();"/></th>
			<th bgcolor="#186fb2"><div class = "div_txtintable1">Lý do reject</div></th>
		</tr>
	
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
	
	<!-- xu ly ma nguoi tao khi admin dang nhap thi ma nguoi tao = "" con lai thi khac ""-->
	<c:if test = "${MaBoPhan ne BO_PHAN_ADMIN}"><%maNguoiTao = (String) session.getAttribute("maThanhVien"); %></c:if>
	<!--<c:if test = "${vaiTro eq Truong_Bo_Mon || vaiTro eq Truong_Khoa || vaiTro eq Pho_Khoa}">
		
	</c:if>
	-->
	
	
	<c:if test = "${MaBoPhan ne BO_PHAN_ADMIN}">
		<%maBoPhan = (String) session.getAttribute("maBoPhan"); %>
	</c:if>
	<c:if test="${not empty param.khoa}">
		<%maBoPhan = request.getParameter("khoa"); %>
	</c:if>
	<% totalRows = DeCuongMonHocDAO.getCountDeCuongMonHoc(tinhTrang, maNguoiTao, maBoPhan, maVaiTro, tenMonHoc);  %>	
	<c:set 	var = "ListDeCuongMonHoc" 
					value = '<%= DeCuongMonHocDAO.getDeCuongMonHoc(totalRows, currentPage, tinhTrang, maNguoiTao, maBoPhan, maVaiTro, tenMonHoc) %>'></c:set>		
		<% Integer count = 0; %>	
		<c:forEach  var="DeCuongMonHoc" 
					items = "${ListDeCuongMonHoc}">
			<c:set var="iterator" value="<%=count %>"></c:set>		
					  <tr style="background-color: transparent;">
						<td bgcolor = "#99bff9"><a href = "<%=request.getContextPath()%>/ISO/DeCuongMonHoc/DeCuong.jsp?maID=${DeCuongMonHoc.maDeCuongMonHoc}">${DeCuongMonHoc.tenDeCuongMonHoc}</a></td>
						<td bgcolor = "#99bff9">${DeCuongMonHoc.tenNguoiTao}</td>
						<td bgcolor = "#99bff9">${DeCuongMonHoc.ngayCapNhatCuoi}</td>
		<!-- Trường hợp 'Truong_Bo_Mon', Đề cương bị 'approve', 'reject' thi disable radio  -->
						<th bgcolor = "#009fb2">
							<input type = "radio" name = "tinhtrang${iterator}" 
							<c:if test="${DeCuongMonHoc.tinhTrang eq APPROVE}">checked</c:if> 
							<c:if test="${vaiTro ne Truong_Khoa and MaBoPhan ne BO_PHAN_ADMIN and vaiTro ne Pho_Khoa or DeCuongMonHoc.status eq APPROVE}">disabled</c:if>
													onclick="checkRadio()" value = "Approve-${DeCuongMonHoc.maDeCuongMonHoc}"/></th>
		<!-- Trường hợp 'Truong_Bo_Mon', Đề cương bị 'approve', 'reject' thi disable radio  -->
						<th bgcolor = "#FF0000">
						<input type = "radio" name = "tinhtrang${iterator}" 
						<c:if test="${DeCuongMonHoc.tinhTrang eq REJECT}">checked</c:if> 
						<c:if test="${vaiTro ne Truong_Khoa and vaiTro ne Pho_Khoa and MaBoPhan ne BO_PHAN_ADMIN or DeCuongMonHoc.status eq APPROVE}">disabled</c:if>
												onclick="checkRadio()" value = "Reject-${DeCuongMonHoc.maDeCuongMonHoc}"/>
						</th>																																									
						<td bgcolor = "#99bff9"><textarea  rows="2" cols="13" name = "Ly_do_reject${iterator}" id = "Ly_do_reject${iterator}" style="background-color: transparent;"
										<c:if test="${vaiTro ne Truong_Khoa and vaiTro ne Pho_Khoa and MaBoPhan ne BO_PHAN_ADMIN or DeCuongMonHoc.status eq APPROVE}">readonly</c:if>>${DeCuongMonHoc.lyDoReject}</textarea></td>
					  </tr>
					  <input type = "hidden" value = "${DeCuongMonHoc.tenDeCuongMonHoc}" id = "ten${iterator}"/>
					  <input type="hidden" value="${DeCuongMonHoc.tinhTrang}" id = "status${iterator}" name="status${iterator}"/>
					  <% count++; %>					
		</c:forEach>	
<script type="text/javascript" language="JavaScript">
	function confirmDuyet() {
		var line = '\n';
		var msgApprove = "";
		var msgReject = "";
		<% for(Integer i=0;i<count;i++)
		{
			out.print("if(document.BangDeCuongMonHoc.tinhtrang" + i.toString() + "[0].checked == true && document.BangDeCuongMonHoc.tinhtrang" + i.toString() + "[0].disabled == false) {");
			out.print("if(document.getElementById('status" + i.toString() + "').value != 2) {");
			out.print("msgApprove += document.getElementById('ten" + i + "').value + line; } }");
			out.print("if(document.BangDeCuongMonHoc.tinhtrang" + i.toString() + "[1].checked == true && document.BangDeCuongMonHoc.tinhtrang" + i.toString() + "[1].disabled == false) {");
			out.print("if(document.getElementById('status" + i.toString() + "').value != 3) {");
			out.print("msgReject += document.getElementById('ten" + i + "').value + line;");
			out.print("if(document.BangDeCuongMonHoc.Ly_do_reject" + i.toString() + ".value.trim() == '') {alert('Xin nhập lý do reject cho các đề cương');return;}} }");
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
			alert("Không có đề cương môn học nào được chọn");
	}

	function checkApproveAll() {
		if(document.BangDeCuongMonHoc.checkApprove.checked == true)
		{					
			document.BangDeCuongMonHoc.checkReject.checked = false;	
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangDeCuongMonHoc.tinhtrang" + i.toString() +"[0].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangDeCuongMonHoc.tinhtrang" + i.toString() +"[0].checked = false;\n");
				}
			%>
		}
	}	
	function checkRejectAll() {
		if(document.BangDeCuongMonHoc.checkReject.checked == true)
		{		
			document.BangDeCuongMonHoc.checkApprove.checked = false;				
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangDeCuongMonHoc.tinhtrang" + i.toString() +"[1].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.BangDeCuongMonHoc.tinhtrang" + i.toString() +"[1].checked = false;\n");
				}
			%>
		}
	}
</script>
	<c:set var = "TotalPage" value="<%= (int) Math.round( ((float)totalRows) /Constant.RECORDS_PER_PAGE + 0.4)%>"></c:set>	
		 	<tr style="background-color: transparent;">
				<td colspan="6">
					<c:if test = "${CurrentPage gt 1}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemDeCuongMonHocPath")%>?page=${CurrentPage - 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/lui.png" border="0" /></a>
					</c:if>	
					<c:forEach var = "PageCount" begin = "1" end = "${TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemDeCuongMonHocPath")%>?page=${PageCount}&msg=${PhanLoai}">${PageCount}</a>
					</c:forEach>
					<c:if test = "${CurrentPage lt TotalPage}">
						<a href="<%=Constant.PATH_RES.getString("iso.XemDeCuongMonHocPath")%>?page=${CurrentPage + 1}&msg=${PhanLoai}" ><img src="<%=request.getContextPath()%>/images/icon_action/toi.png" border="0"/></a>
					</c:if>	
				</td>
			</tr> 	
			<tr style="background-color: transparent;">
				<td colspan="6">
					<a href="<%=request.getContextPath()%>/ISO/DeCuongMonHoc/DeCuong.jsp?Them=yes"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" /></a>
				<!--<c:if test="${vaiTro eq Truong_Bo_Mon or vaiTro eq Truong_Khoa or MaBoPhan eq BO_PHAN_ADMIN or vaiTro eq Pho_Khoa}">
					
				</c:if>		
				--><c:if test="${MaBoPhan eq BO_PHAN_ADMIN or vaiTro eq Truong_Khoa or vaiTro eq Pho_Khoa}">
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