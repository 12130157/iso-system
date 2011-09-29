<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.util.StringUtil"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.HocKyDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%><html>
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
		document.KeHoachGiangDay.checkReject.checked = false;
		document.KeHoachGiangDay.checkApprove.checked = false;
	}
	function submitFormSearch(){		
		document.forms["FilerForm"].submit();
	}
	function submitFormSave(){
		document.forms["KeHoachGiangDay"].submit();
	}
	function SoTayGiaoVien(x){
		document.getElementById("MaKHGD").value = x;
		document.forms["SoTayGiaoVien"].submit();
	}
	function showPopUp(x)
	{
		 var myObject = new Object();
		 myObject.valueContent = document.getElementById(x).value;
		 myObject.titleContent ="Lý do reject"; 
		 if(document.getElementById(x).readOnly!=true)
		   myObject.quyen="true"; 
		 else
		   myObject.quyen="false";
		 

		height=200;
		width=300;			
		y=(window.screen.height-height)/2;
		x=(window.screen.width-width)/2;
		value= window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: "+height+"px; dialogWidth: "+width+"px; dialogTop:"+y+"px; dialogLeft:"+x+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");

		 if(document.getElementById(x).readOnly!=true)
			if(value!=false&&value!=undefined)
				document.getElementById(x).innerHTML=value;	
		
	}

	
</script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Xem Kế Hoạch</title>
</head>
<body>

<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
<!--load variable from common packed-->
	<c:set var = "vaiTro" value = '<%=(String) request.getSession().getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "admin" value = '<%=Constant.ADMIN%>'></c:set>
	<c:set var = "nguoiLap" value = '<%=Constant.FULLNAME_ATT%>'></c:set>
	<c:set var = "giaoVien" value = '<%=Constant.GIAO_VIEN%>'> </c:set>
	<c:set var = "truongBoMon" value = '<%=Constant.TRUONG_BO_MON%>'> </c:set>
	<c:set var = "truongKhoa" value = '<%=Constant.TRUONG_KHOA%>'> </c:set>
	<c:set var = "Hieu_Truong" value = '<%=Constant.HIEU_TRUONG%>'></c:set>
	<c:set var = "NEW" value = '<%=Constant.TINHTRANG_NEW%>'> </c:set>
	<c:set var = "SEND" value = '<%=Constant.TINHTRANG_SEND%>'> </c:set>
	<c:set var = "APPROVE" value = '<%=Constant.TINHTRANG_APPROVE%>'> </c:set>
	<c:set var = "REJECT" value = '<%=Constant.TINHTRANG_REJECT%>'> </c:set>
	<c:set var = "TK_APPROVE" value = '<%=Constant.TINHTRANG_TK_APPROVE%>'> </c:set>
	<c:set var = "TK_REJECT" value = '<%=Constant.TINHTRANG_TK_REJECT%>'> </c:set>
	<c:set var = "TK_SEND" value = '<%=Constant.TINHTRANG_TK_SEND%>'> </c:set>
	<c:set var = "HT_APPROVE" value = '<%=Constant.TINHTRANG_HT_APPROVE%>'> </c:set>
	<c:set var = "HT_REJECT" value = '<%=Constant.TINHTRANG_HT_REJECT%>'> </c:set>
	<c:set var = "HT_NEW" value = '<%=Constant.TINHTRANG_HT_NEW%>'> </c:set>
	<c:set var = "HT_SEND" value = '<%=Constant.TINHTRANG_HT_SEND%>'> </c:set>
	<c:set var ="tenMonHocTemp" value='<%=StringUtil.toUTF8(request.getParameter("txtTenMonHocFind")) %>'></c:set>
	<c:set var="khoaList" value='<%=KhoaDAO.getKhoaByBoPhan(Integer.parseInt((String) request.getSession().getAttribute("maBoPhan"))) %>'></c:set>
	<c:set var="namHocList" value='<%=NamHocDAO.getAllNamHoc()%>'></c:set>
	<c:set var="maKhoa" value='<%=(String) request.getSession().getAttribute("maBoPhan") %>'></c:set>
	
	<c:set var="boPhanHC" value='<%=Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var="boPhanKDCL" value='<%=Constant.BO_PHAN_PKID %>'></c:set>
	<c:set var="boPhanPDT" value='<%=Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var="boPhanBGH" value='<%=Constant.BO_PHAN_BGH %>'></c:set>
	
	
	<c:choose>			
		<c:when test = "${empty param.selectTinhTrang}">
			<c:set var = "PhanLoai" value = "All" ></c:set>
		</c:when>
		<c:otherwise>
			<c:set var = "PhanLoai" value = "${param.selectTinhTrang}" ></c:set>		
		</c:otherwise>
	</c:choose>	
	
	
	<!--Show details of QuyetDinh-->

	<%
		String path=""; 	
		String currentPage = "", tinhTrang = "", maNguoiTao = "", tenMonHocFind="",maHocKi="",maKhoa="",maNamHoc=""; 
		int totalRows = 0;
	%>
	<c:if test="${not empty param.txtTenMonHocFind}">
		<%tenMonHocFind=StringUtil.toUTF8(request.getParameter("txtTenMonHocFind")); %>
		<% path=path+"&txtTenMonHocFind="+ request.getParameter("txtTenMonHocFind");%>
	</c:if>
	<c:if test="${not empty param.selNamHoc}">
		<%maNamHoc=request.getParameter("selNamHoc"); %>
		<% path=path+"&selNamHoc="+ request.getParameter("selNamHoc");%>
	</c:if>
	<c:if test="${not empty param.selHocKi}">
		<%maHocKi=request.getParameter("selHocKi"); %>
		<% path=path+"&selHocKi="+ request.getParameter("selHocKi");%>
	</c:if>
	<c:if test="${not empty param.selKhoa}">
		<%maKhoa=request.getParameter("selKhoa"); %>
		<% path=path+"&selKhoa="+ request.getParameter("selKhoa");%>
	</c:if>
	
	
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
	
	
		<c:if test="${not empty param.errApproveThieu and not empty param.maKHGD}">
			<c:set var="tenKHGD" value='<%=KeHoachGiangDayDAO.getTenKHGDByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
			<font class="error">
				 ${tenKHGD} giáo án không đủ
			</font>
		</c:if>
		<br/>
	
	<strong><font size="5">Kế Hoạch Giảng Dạy</font></strong><br /><br />
	
<div class = "div_table">
<!--phan loai quyet dinh bang combobox-->

<!-- 	<form name="FilerForm" action="<%=request.getContextPath()%>/keHoachGiangDayController?phanloai=yes" method="post"> -->
	
	<form name="FilerForm" action="showKeHoachGiangDay.jsp?phanloai=yes" method="post">
		<table border = "1" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td>
				<div class = "div_tinhtrang">Tình trạng : 	
					<select name = "selectTinhTrang">	
						<option value = "All" <c:if test = "${param.selectTinhTrang eq 'All'}">selected</c:if> >All</option>
						<option value = "0" <c:if test = "${param.selectTinhTrang eq '0'}">selected</c:if>>New</option>
						<option value = "1" <c:if test = "${param.selectTinhTrang eq '1'}">selected</c:if>>Pending</option>
						<option value = "2" <c:if test = "${param.selectTinhTrang eq '2'}">selected</c:if>>Approve</option>
						<option value = "3" <c:if test = "${param.selectTinhTrang eq '3'}">selected</c:if>>Reject</option>
					</select>
				
					 Tên môn học : <input type='text' name='txtTenMonHocFind' id='txtTenMonHocFind' value="${tenMonHocTemp}"/>
					 
					<a href = "javascript: submitFormSearch()"><img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" alt="tìm kiếm" border = "0" /></a>
				
					
				</div>			
				<div class = "div_tinhtrang">
					Khoa : <select name='selKhoa' id='selKhoa'>
						<option value="">All</option>
						<c:forEach items="${khoaList}" var="objKhoa">
							<option value='${objKhoa.maKhoa}' <c:if test="${param.selKhoa eq objKhoa.maKhoa }">selected</c:if> >${objKhoa.tenKhoa}</option>
						</c:forEach>
					</select>
					
					Học kì : 
						<select id="selHocKi" name="selHocKi"><option value="">All</option>
							<option value='1' <c:if test="${param.selHocKi eq '1'}">selected</c:if>>I</option>
							<option value='2' <c:if test="${param.selHocKi eq '2'}">selected</c:if>>II</option>
						</select>
					
					Năm học : <select id="selNamHoc" name="selNamHoc"><option value="">All</option>
								<c:forEach items="${namHocList}" var="objNamHoc">
										<option value="${objNamHoc.maNamHoc}" <c:if test="${param.selNamHoc eq objNamHoc.maNamHoc }">selected</c:if> >${objNamHoc.namBatDau}-${objNamHoc.namKetThuc}</option>
								</c:forEach>		
							</select>
					</select>
				</div>			
				</td>
			</tr>
		</table>
	</form>
<p>

<a href="<%=request.getContextPath()%>/ISO/KeHoachGiangDay/TimKeHoachGiangDay.jsp"  border='none'><img border='none' src='<%=request.getContextPath() %>/images/buttom/baocaokehoachgiangdaythuchien.png'/ alt='Báo cáo tiến độ kế hoạch giảng dạy' ></a>


<a href="<%=request.getContextPath()%>/ISO/GiaoAn/TimGiaoAn.jsp" border='none'><img border='none' src='<%=request.getContextPath() %>/images/buttom/baocaogiaoanthuchien.png'/ ></a>

</p>
<br/>

<br/>
<div align="center">
	<form name="KeHoachGiangDay" action="<%=request.getContextPath()%>/keHoachGiangDayController?duyet=yes" method="post" >	
	<table border = "1" style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<th bgcolor= '#186fb2' width='300px'><div class = "div_txtintable1">Tên Kế Hoạch</div></th>
			<th bgcolor= '#186fb2' width='250px'><div class = "div_txtintable1">Người lập</div></th>
			<th bgcolor= '#186fb2' width='120px'><div class = "div_txtintable1">Ngày lập</div></th>
			<th bgcolor= '#186fb2' width='50px'><div class = "div_txtintable1">Approve<br /><br /><input type = "checkbox" id = "checkApprove" <c:if test = "${PhanLoai ne PENDING or vaiTro eq Giao_vien}">disabled="disabled"</c:if> onclick="checkApproveAll();"/></div></th>
			<th bgcolor= '#186fb2' width='50px'><div class = "div_txtintable1">Reject<br /><br /><input type = "checkbox" id = "checkReject" <c:if test = "${PhanLoai ne PENDING or vaiTro eq Giao_vien}">disabled="disabled"</c:if> onclick="checkRejectAll();"/></div></th>
			<th bgcolor= '#186fb2' width='150px'><div class = "div_txtintable1">Ghi chú</div></th>
		</tr>


	<c:set var="CurrentPage" value="<%=currentPage %>"></c:set>
	
	
	<c:if test = "${vaiTro ne admin and maKhoa ne boPhanHC and maKhoa ne boPhanKDCL and maKhoa ne boPhanPDT and maKhoa ne boPhanBGH}">
		<%maNguoiTao = (String) session.getAttribute("maThanhVien"); %>
	</c:if>
	<% totalRows = KeHoachGiangDayDAO.getCountKeHoachGiangDay(tinhTrang, maNguoiTao); %>
	<c:set 	var = "ListKHGD" value = '<%= KeHoachGiangDayDAO.getKeHoachGiangDay(totalRows, currentPage, tinhTrang, maNguoiTao,request.getSession().getAttribute("maBoPhan").toString(),tenMonHocFind,maKhoa,maHocKi,maNamHoc) %>'></c:set>
			<% int count = 0; %>	
			<% maNguoiTao = (String) session.getAttribute("maThanhVien"); %>
			<c:forEach var="objKHGD" items = "${ListKHGD}">
				
				<c:set var="iterator" value="<%=count%>"></c:set>
				
							<c:if test="${PhanLoai eq objKHGD.tinhTrang or PhanLoai eq 'All'}">
								<c:set var="tinhTrangHT" value="objKHGD.tinhTrangHT"></c:set>
								
								<!-- TRUONG HOP ADMIN LA NGUOI TAO -->
								<c:if test="${admin eq sessionScope.maThanhVien}">
									<tr style="background-color: transparent;">
										<td width="120">
											<a href = "KeHoachGiangDay.jsp?maKHGD=${objKHGD.maKHGD}">${objKHGD.tenKHGD}</a><br/>
											<c:if test="${objKHGD.maNguoiTao eq sessionScope.maThanhVien and objKHGD.tinhTrang eq APPROVE}">
												<a style="text-decoration: none;" href="javascript: SoTayGiaoVien(${objKHGD.maKHGD })">
													<input type="button" value="Sổ Tay Giáo Viên"/>
												</a>
											</c:if>
										</td>
										<td bgcolor = "#99bff9"><div class = "div_txtintable">${objKHGD.tenNguoiTao}</div></td>
										<td bgcolor = "#99bff9"><div class = "div_txtintable">${objKHGD.ngayTao}</div></td>
										<td bgcolor = "#009fb2">
											<input type = "radio" 
												<c:choose>
													<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq APPROVE}">checked disabled='disabled'</c:when>
													<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq SEND}">checked</c:when>			
													<c:otherwise></c:otherwise> 
												</c:choose>
											 name = "tinhtrang${iterator}" onclick="checkRadio()" value = "Approve-${objKHGD.maKHGD}" />
										</td>
										<td bgcolor = "#FF0000">
											<input type="radio" 
												<c:choose>
													<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq APPROVE}">disabled='disabled'</c:when>
													<c:when test="${objKHGD.tinhTrang eq REJECT}">checked</c:when>
													<c:when test="${objKHGD.tinhTrangHT eq REJECT}">checked</c:when>		
													<c:otherwise></c:otherwise> 
												</c:choose>
											name = "tinhtrang${iterator}" onclick="checkRadio()" value = "Reject-${objKHGD.maKHGD}"/>
										</td>
										<td>
											<textarea rows="2" cols="13" name="Ly_do_reject${iterator}" id="Ly_do_reject${iterator}" onclick="showPopUp(this.id)" >${objKHGD.lyDoReject}</textarea>					
										</td>
									</tr>
									<input type = "hidden" value = "${objKHGD.tenKHGD}" name="ten${iterator}" id="ten${iterator}"/>
									<input type="hidden" 
										<c:choose>
											<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq SEND}">
												value="ht"
											</c:when>
											<c:otherwise>
												value="tk"
											</c:otherwise>
										</c:choose>
									 name="role${iterator}" id="role${iterator}"/>
									<% count++; %>
								</c:if>
								
								<!-- TRUONG HOP ADMIN KHONG PHAI NGUOI TAO -->
								<c:if test="${admin ne sessionScope.maThanhVien and (objKHGD.maNguoiTao eq sessionScope.maThanhVien or (maKhoa eq boPhanBGH and(objKHGD.tinhTrangHT ne NEW) ) or (vaiTro eq truongKhoa and(objKHGD.tinhTrang ne NEW) ))}">
									
									<tr style="background-color: transparent;">
										<td width="120">
											<a href = "KeHoachGiangDay.jsp?maKHGD=${objKHGD.maKHGD}">${objKHGD.tenKHGD}</a><br/>
											<c:if test="${objKHGD.maNguoiTao eq sessionScope.maThanhVien and objKHGD.tinhTrang eq APPROVE}">
												<a style="text-decoration: none;" href="javascript: SoTayGiaoVien(${objKHGD.maKHGD })">
													<input type="button" value="Sổ Tay Giáo Viên"/>
												</a>
											</c:if>
										</td>
										<td bgcolor = "#99bff9"><div class = "div_txtintable">${objKHGD.tenNguoiTao}</div></td>
										<td bgcolor = "#99bff9"><div class = "div_txtintable">${objKHGD.ngayTao}</div></td>
										
										
						<!-- Trường hợp 'TRUONG_BO_MON', kế hoạch bị 'approve', 'reject' thi daisable radio  -->
										<td bgcolor = "#009fb2">
											
											<input type = "radio" name = "tinhtrang${iterator}"   
													<c:choose>
															<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq APPROVE}">checked disabled='disabled'</c:when> 
															<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq SEND and maKhoa ne boPhanBGH}">checked disabled='disabled'</c:when> 
															<c:when test="${objKHGD.tinhTrang eq REJECT}">											
																<c:if test="${maKhoa eq boPhanBGH and objKHGD.tinhTrangHT eq REJECT and objKHGD.maNguoiTao ne sessionScope.maThanhVien}">disabled='disabled'</c:if>
																<c:if test="${vaiTro eq truongKhoa and objKHGD.maNguoiTao ne sessionScope.maThanhVien}">disabled='disabled'</c:if>
																<c:if test="${objKHGD.maNguoiTao eq sessionScope.maThanhVien}"></c:if>
															</c:when> 
															
															<c:when test="${objKHGD.tinhTrangHT eq REJECT}">
																<c:if test="${maKhoa eq boPhanBGH and objKHGD.maNguoiTao ne sessionScope.maThanhVien}">disabled='disabled'</c:if>
																<c:if test="${vaiTro eq truongKhoa and objKHGD.maNguoiTao ne sessionScope.maThanhVien}"></c:if>
																<c:if test="${objKHGD.maNguoiTao eq sessionScope.maThanhVien and objKHGD.tinhTrang eq APPROVE }">
																	<c:if test="${vaiTro ne truongKhoa}">
																		<c:if test="${maKhoa ne boPhanBGH}">
																			checked disabled='disabled'
																		</c:if>
																		<c:if test="${maKhoa eq boPhanBGH}">
																			disabled='disabled'
																		</c:if>
																	</c:if>
																	<c:if test="${vaiTro eq truongKhoa}"></c:if>
																		
																</c:if>
															</c:when> 
															
															
															<c:otherwise>unchecked</c:otherwise>
													</c:choose>
														
											onclick="checkRadio()" value = "Approve-${objKHGD.maKHGD}"/>
										
										
										</td> 
						<!-- Trường hợp 'TRUONG_BO_MON', kế hoạch bị 'approve', 'reject' thi disable radio  -->
										<td bgcolor = "#FF0000">
										
											
										
											<input type="radio" name = "tinhtrang${iterator}"  
												<c:choose>
												<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq APPROVE}">disabled='disabled'</c:when> 
													<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq SEND and maKhoa ne boPhanBGH}">disabled='disabled'</c:when> 
													
													<c:when test="${objKHGD.tinhTrang eq REJECT}">
														<c:if test="${maKhoa eq boPhanBGH and objKHGD.tinhTrangHT eq REJECT and objKHGD.maNguoiTao ne sessionScope.maThanhVien }">checked disabled='disabled'</c:if>
														<c:if test="${vaiTro eq truongKhoa and objKHGD.maNguoiTao ne sessionScope.maThanhVien}">checked disabled='disabled'</c:if>
														<c:if test="${objKHGD.maNguoiTao eq sessionScope.maThanhVien}"></c:if>
													</c:when> 
													
													<c:when test="${objKHGD.tinhTrangHT eq REJECT}">
														<c:if test="${maKhoa eq boPhanBGH and objKHGD.maNguoiTao ne sessionScope.maThanhVien }">checked disabled='disabled'</c:if>
														<c:if test="${vaiTro eq truongKhoa and objKHGD.maNguoiTao ne sessionScope.maThanhVien}"></c:if>
														<c:if test="${objKHGD.maNguoiTao eq sessionScope.maThanhVien and objKHGD.tinhTrang eq APPROVE}">
															<c:if test="${vaiTro ne truongKhoa}">
																<c:if test="${maKhoa ne boPhanBGH}">
																	disabled='disabled'
																</c:if>
																<c:if test="${maKhoa eq boPhanBGH}">
																	checked disabled='disabled'
																</c:if>
															</c:if>
															<c:if test="${vaiTro eq truongKhoa}"></c:if>
															
														</c:if>
													</c:when> 
													
													<c:otherwise>unchecked</c:otherwise>
												</c:choose>
																				
													
											onclick="checkRadio()" value = "Reject-${objKHGD.maKHGD}"/>
										
										
										
										
										</td>
								 		<td>
								 
								 			<textarea onclick="showPopUp(this.id)"
									 				 <c:choose>
									 				 	<c:when test="${vaiTro eq truongKhoa and (objKHGD.tinhTrang eq SEND or (objKHGD.tinhTrangHT eq REJECT and objKHGD.tinhTrang eq APPROVE))}"></c:when>
									 				 	<c:when test="${maKhoa eq boPhanBGH and (objKHGD.tinhTrangHT eq SEND)}"></c:when>
									 				 	<c:otherwise>readonly='readonly'</c:otherwise>
									 				 </c:choose>
								 			rows="2" cols="13" id="Ly_do_reject${iterator}" name="Ly_do_reject${iterator}" ><c:if test="${objKHGD.maNguoiTao eq sessionScope.maThanhVien and ( objKHGD.tinhTrang eq REJECT or (objKHGD.tinhTrang eq SEND and (objKHGD.lyDoReject ne '' or  not empty objKHGD.lyDoReject))) }">${objKHGD.lyDoReject}</c:if><c:if test="${vaiTro eq truongKhoa and (objKHGD.tinhTrangHT eq REJECT or objKHGD.tinhTrang ne REJECT)}">${objKHGD.lyDoReject}</c:if><c:if test="${maKhoa eq boPhanBGH and objKHGD.tinhTrangHT eq REJECT and objKHGD.tinhTrang ne REJECT}">${objKHGD.lyDoReject}</c:if></textarea>
										</td>
									</tr>
									<input type = "hidden" value = "${objKHGD.tenKHGD}" name="ten${iterator}" id="ten${iterator}"/>
									<% count++; %>	
							</c:if>
							
							<c:if test="${objKHGD.maNguoiTao ne sessionScope.maThanhVien and ( maKhoa eq boPhanHC or maKhoa eq boPhanKDCL or maKhoa eq boPhanPDT) and (objKHGD.tinhTrang ne NEW) }">
								 	<tr>
								 		<td width="120">
								 			<a href = "KeHoachGiangDay.jsp?maKHGD=${objKHGD.maKHGD}">${objKHGD.tenKHGD}</a><br/>
								 			<c:if test="${objKHGD.maNguoiTao eq sessionScope.maThanhVien and objKHGD.tinhTrang eq APPROVE}">
								 				<a style="text-decoration: none;" href="javascript: SoTayGiaoVien(${objKHGD.maKHGD })">
													<input type="button" value="Sổ Tay Giáo Viên"/>
												</a>
											</c:if>
								 		</td>
										<td bgcolor = "#99bff9"><div class = "div_txtintable">${objKHGD.tenNguoiTao}</div></td>
										<td bgcolor = "#99bff9"><div class = "div_txtintable">${objKHGD.ngayTao}</div></td>
										<td>
											<input type = "radio" disabled='disabled' 
												<c:choose>
													<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq APPROVE}">checked </c:when>
													<c:when test="${objKHGD.tinhTrang eq APPROVE and objKHGD.tinhTrangHT eq SEND}">checked</c:when>			
													<c:otherwise></c:otherwise> 
												</c:choose>
											 name = "tinhtrang${iterator}" onclick="checkRadio()" value = "Approve-${objKHGD.maKHGD}" />
										</td>
										<td>
											<input type="radio" disabled='disabled'
												<c:choose>
													<c:when test="${objKHGD.tinhTrang eq REJECT}">checked</c:when>
													<c:when test="${objKHGD.tinhTrangHT eq REJECT}">checked</c:when>		
													<c:otherwise></c:otherwise> 
												</c:choose>
											name = "tinhtrang${iterator}" onclick="checkRadio()" value = "Reject-${objKHGD.maKHGD}"/>
										</td>
								 		<td>
								 			<textarea onclick="showPopUp(this.id)" disabled="disabled" rows="2" cols="13" id="Ly_do_reject${iterator}" name="Ly_do_reject${iterator}">${objKHGD.lyDoReject}</textarea>
										</td>
									</tr>
							</c:if>
						</c:if>
				</c:forEach>

<script type="text/javascript" language="JavaScript">

	function rightSpace(str)
	{
		var length=str.length-1;
		while(length>=0&&str.charAt(length)==' ')
		{
			length--;
		}
		return str.substr(0,length+1);
	}

	function confirmDuyet() {
		
		var line = '\n';
		var msgApprove = "";
		var msgReject = "";
		<% 
			for(Integer i=0;i<count;i++)
			{
				
				out.print("if(document.KeHoachGiangDay.tinhtrang" + i.toString() + "[0].checked == true && document.KeHoachGiangDay.tinhtrang" + i.toString() + "[0].disabled == false)");
				out.print("msgApprove += document.getElementById('ten" + i + "').value + line;");
				
				out.print("if(document.KeHoachGiangDay.tinhtrang" + i.toString() + "[1].checked == true && document.KeHoachGiangDay.tinhtrang" + i.toString() + "[1].disabled == false) {");
			
				out.print("msgReject += document.getElementById('ten" + i + "').value + line;");
				
				out.print("if(rightSpace(document.KeHoachGiangDay.Ly_do_reject" + i.toString() + ".value) == '') { alert('Xin nhập lý do reject cho các quyết định'); return;}}");
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
		if(document.KeHoachGiangDay.checkApprove.checked == true)
		{	
			document.KeHoachGiangDay.checkReject.checked = false;	
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.KeHoachGiangDay.tinhtrang" + i.toString() +"[0].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.KeHoachGiangDay.tinhtrang" + i.toString() +"[0].checked = false;\n");
				}
			%>
		}
	}	
	function checkRejectAll() {
		if(document.KeHoachGiangDay.checkReject.checked == true)
		{		
			document.KeHoachGiangDay.checkApprove.checked = false;				
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.KeHoachGiangDay.tinhtrang" + i.toString() +"[1].checked = true;\n");
				}
			%>
		}
		else
		{
			<%
				for (Integer i = 0; i < Constant.CHECK_ROWS; i++) {
					out.print("document.KeHoachGiangDay.tinhtrang" + i.toString() +"[1].checked = false;\n");
				}
			%>
		}
	}
</script>
  
<!--		Phân trang	-->
  

		
		<tr style="background-color: transparent;">
				<td colspan="6">
					<a href="<%=request.getContextPath()%>/ISO/KeHoachGiangDay/KeHoachGiangDay.jsp?Them=ok"><img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" border = 0px alt ="new" /></a>
					
							<c:if test="${vaiTro eq admin or maKhoa eq boPhanBGH or vaiTro eq truongKhoa}">
								<a href = "javascript: confirmDuyet()"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="lưu" border = "0"/></a>
							</c:if>
					
				</td>
			</tr>
 
	</table>
	</form>
	<form name="SoTayGiaoVien" id="SotayGiaoVien" method="post" action="<%=request.getContextPath() %>/keHoachGiangDayController">
		<input type="hidden" id="MaKHGD" name="MaKHGD" value="" />
		<input type="hidden" id="SoTayGiaoVien" name="SoTayGiaoVien" value="SoTayGiaoVien" />
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>