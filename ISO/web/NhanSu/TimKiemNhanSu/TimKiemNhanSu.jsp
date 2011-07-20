<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ taglib uri="http://weblib.kth.taglib" prefix="weblib" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.util.DateUtil"%>

<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HocPhanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.model.KetQuaTimGiaoAnModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.MonHocTKBDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>

<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8"/>
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/nhansu.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<c:set var="boPhan" value='<%=session.getAttribute("maBoPhan").toString() %>'></c:set>
<c:set var="vaiTro" value='<%=session.getAttribute("maVaiTro").toString() %>'></c:set>
<c:set var="vaiTroTK" value='<%=Constant.MA_VAI_TRO_TK%>'></c:set>
<c:set var="vaiTroHT" value='<%=Constant.HIEU_TRUONG %>'></c:set>
<c:set var="Admin" value='<%=Constant.ADMIN %>'></c:set>
<c:set var="boPhanBGH" value='<%=Constant.BO_PHAN_BGH %>'></c:set>
<c:set var="boPhanPDT" value='<%=Constant.BO_PHAN_PDT %>'></c:set>
<c:set var="boPhanPKD" value='<%=Constant.BO_PHAN_PKID %>'></c:set>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->


<title>Tìm Kiếm Nhân Sự</title>
<script language="javascript">
	function btnsearch(){
		document.getElementById('actionType').value = 'searchNS';
		document.forms['Search_NS'].submit();
    }
</script>

	<c:set var="listBP" value='<%=KhoaDAO.showAllKhoa() %>' ></c:set>
	
</head>
<body onload="loadData()">

<div align="center">


<div class = "div_pagebody">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form name="Search_NS" id="Search_NS" action="<%=request.getContextPath() %>/ThanhVienController" method="post">
		<%
					int x = 20;
					int pages = 1;
					if(request.getParameter("pages")!=null){
						pages = Integer.parseInt(request.getParameter("pages").trim().toString());
					}
					float totalRecord = ThanhVienDAO.getTotalNhanSu();
					int y = Math.round(totalRecord)-(x*(pages-1));
		%>
		<c:choose>
			<c:when test="${not empty requestScope.listNS || requestScope.listNS ne null}">
				<%
					totalRecord = 1;
				 %>
				<c:set var="listNS" value="${requestScope.listNS}" scope="session"/>	
			</c:when>
			<c:otherwise>
				<c:set var="listNS" value='<%=ThanhVienDAO.getAllNhanSu(x,y) %>'></c:set>
			</c:otherwise>
		</c:choose>
		<table class="div_table_TimKiem" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td colspan="4" style="background-color: transparent;" align="center" >
					<h3>Tìm kiếm nhân sự</h3>
				</td>			
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Họ : </td>
				<td><input style="background-color: transparent;" type="text" name="SHo" <c:if test="${not empty requestScope.SHo}"> value="${requestScope.SHo}" </c:if> /></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Số nhà : </td>
				<td><input style="background-color: transparent;" type="text" name="SSoNha" <c:if test="${not empty requestScope.SSoNha}"> value="${requestScope.SSoNha}" </c:if> /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Tên lót : </td>
				<td><input style="background-color: transparent;" type="text" name="STenLot" <c:if test="${not empty requestScope.STenLot}"> value="${requestScope.STenLot}" </c:if> /></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Tên đường : </td>
				<td><input style="background-color: transparent;" type="text" name="STenDuong" <c:if test="${not empty requestScope.STenDuong}"> value="${requestScope.STenDuong}" </c:if> /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Tên : </td>
				<td><input style="background-color: transparent;" type="text" name="STen" <c:if test="${not empty requestScope.STen}"> value="${requestScope.STen}" </c:if> /></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Phường/ xã : </td>
				<td><input style="background-color: transparent;" type="text" name="SPhuongXa" <c:if test="${not empty requestScope.SPhuongXa}"> value="${requestScope.SPhuongXa}" </c:if> /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Ngày sinh : </td>
				<td> <input style="background-color: transparent;" type="text" readonly="readonly" <c:if test="${not empty requestScope.SNgaySinh}"> value="${requestScope.SNgaySinh}" </c:if> id="SNgaySinh" name="SNgaySinh" /></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Quận/ huyện : </td>
				<td><input style="background-color: transparent;" type="text" name="SQuanHuyen" <c:if test="${not empty requestScope.SQuanHuyen}"> value="${requestScope.SQuanHuyen}" </c:if> /></td>				
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Ngày vào làm : </td>
				<td><input style="background-color: transparent;" type="text" readonly="readonly" <c:if test="${not empty requestScope.SNgayVaoLam}"> value="${requestScope.SNgayVaoLam}" </c:if> id="SNgayVaoLam" name="SNgayVaoLam" /></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Tỉnh/ thành phố : </td>
				<td><input style="background-color: transparent;" type="text" name="STinhTP" <c:if test="${not empty requestScope.STinhTP}"> value="${requestScope.STinhTP}" </c:if> /></td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Email : </td>
				<td><input style="background-color: transparent;" type="text" name="SEmail" <c:if test="${not empty requestScope.SEmail}"> value="${requestScope.SEmail}" </c:if> /></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Bộ phận : </td>
				<td>
					<select name="SBoPhan" style="width:150px;background-color: transparent;">
						<option value="All">Tất Cả</option>
						<c:forEach var="model" items="${listBP}">
							<option value="${model.maKhoa }" <c:if test="${model.maKhoa eq requestScope.SBoPhan}">selected</c:if>>${model.tenKhoa }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Bằng cấp : </td>
				<td><input style="background-color: transparent;" type="text" name="SBangCap" <c:if test="${not empty requestScope.SBangCap}"> value="${requestScope.SBangCap}" </c:if> /></td>
				<td style="background-color: transparent;text-align: right;padding-right: 5px;">Vai trò : </td>
				<td>
					<select name="SVaiTro" style="width:150px;background-color: transparent;">
						<option value="All">Tất Cả</option>
						<c:set var="listVT" value="<%=VaiTroDAO.showAllVaiTro() %>"/>
						<c:forEach items="${listVT}" var="model">		
							<option
								<c:choose>
									<c:when test="${empty requestScope.SVaiTro}"></c:when>
									<c:otherwise>
										<c:if test="${requestScope.SVaiTro eq model.maVaiTro}">
											selected
										</c:if>
									</c:otherwise>
								</c:choose>
							value="${model.maVaiTro}">${model.tenVaiTro }
							
							</option>
						</c:forEach>
					</select>
				
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan="4" style="background-color: transparent;" align="center">
					<a href="javascript: btnsearch();">
						<img src="<%=request.getContextPath()%>/images/buttom/timkiem2.png" alt="Thêm" border = "0"/>
					</a>
					<a href="<%=request.getContextPath() %>/NhanSu/Intro.jsp">
						<img src="<%=request.getContextPath()%>/images/buttom/reset2.png" alt="Thêm" border = "0"/>
					</a>
				</td>
			</tr>
			
		</table>	
		
		<div class = "div_tieude" style="width: 790px;">DANH SÁCH NHÂN SỰ</div>
		
		<table border="1" class="div_table_TimKiem" style="background-color: transparent; width: 790px; margin: 20px;" >

				<tr style="background-color: #186fb2; color: white; ">
					<th style="background-color: transparent;width: 50px;">Stt</th>
					<th style="background-color: transparent;width: 150px;">Họ tên</th>
					<th style="background-color: transparent;width: 100px;">Ngày sinh</th>
					<th style="background-color: transparent;width: 200px;">Email</th>
					<th style="background-color: transparent;width: 100px;">Bộ phận</th>
					<th style="background-color: transparent;width: 100px;">Vai trò</th>
				</tr>
				<c:set var="n" value="1" />
				<c:forEach items="${listNS}" var="model">
				<tr style="background-color: transparent;">
					<c:choose>
						<c:when test="${empty param.pages}">
							<c:set var="pages" value="1"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="pages" value="${param.pages}"></c:set>
						</c:otherwise>
					</c:choose>
					<td style="background-color: transparent;height: 50px;">${n+((pages-1)*20) }</td>
					<td style="background-color: transparent;text-align: left;padding-left: 5px;">
						<a href="<%=request.getContextPath() %>/NhanSu/TimKiemNhanSu/ChiTietNhanSu.jsp?maThanhVien=${model.maThanhVien}">
							${model.sHoTen }
						</a>
					</td>
					<td style="background-color: transparent;">${model.sNgaySinh }</td>
					<td style="background-color: transparent;text-align: left;padding-left: 5px;">${model.sEmail }</td>
					<td style="background-color: transparent;">${model.sBoPhan }</td>
					<td style="background-color: transparent;">${model.sVaiTro }</td>
				</tr>
				<c:set var="n" value="${n+1}" />
				</c:forEach>
		</table>
		
			<%
				double totalpage = (Math.ceil(totalRecord/x));
				if(totalpage > 1){
					for(int i = 1;i<=totalpage;i++){
						out.print("<a style='text-decoration:none;padding-left: 10px;' "
						+"href='"+request.getContextPath()+"/NhanSu/TimKiemNhanSu/TimKiemNhanSu.jsp?pages="+i+"'>"+i+"</a>");
					}
				}
			 %>
		
		<c:if test="${not empty requestScope.listNS || requestScope.listNS ne null}">
			<a href = "<%=request.getContextPath() %>/NhanSu/TimKiemNhanSu/PrintDanhSachNhanSu.jsp">								 
				<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
			</a>
		</c:if>
		<input type="hidden" id="actionType" name="actionType" />
		
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
	</form>
</div>

</div>
<script type="text/javascript">
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [1990.01, 2040.12],
	electric          : false,
	inputField        : "SNgaySinh",
	button            : "Calendar",
	ifFormat          : "%d-%m-%Y"
  });
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [1990.01, 2040.12],
	electric          : false,
	inputField        : "SNgayVaoLam",
	button            : "Calendar",
	ifFormat          : "%d-%m-%Y"
  });
//]]>
 </script>
</body>
</html>

