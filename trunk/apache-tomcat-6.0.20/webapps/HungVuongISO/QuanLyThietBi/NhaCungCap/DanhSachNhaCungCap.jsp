<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.NhaCungCapDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TaiKhoanDAO"%><html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/QuanLyThietBi/css/NhaCungCap_Style.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/QuanLyThietBi/js/NhaCungCap_Script.js" type="text/javascript"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Hệ Thống Quản Lý Thiết Bị</title>
<%String tenNCC=""; %>
<%int indexPage=1; %>
<c:if test="${ not empty param.tenNCC }">
	<% tenNCC=request.getParameter("tenNCC"); %>
</c:if>
<c:if test="${ not empty param.index}">
	<% indexPage=Integer.parseInt(request.getParameter("index")); %>
</c:if>



<c:set var='nhaCungCapList' value='<%=NhaCungCapDAO.getAllNhaCungCapByTen(indexPage,Constant.NUM_RECORD_QLTB,tenNCC)%>'></c:set>	
<c:set var='showNumPage' value='<%=NhaCungCapDAO.showNumPage(indexPage,NhaCungCapDAO.getTotalNhaCungCapByTen(tenNCC),"")%>'></c:set>
<c:set var='taiKhoanList' value='<%=TaiKhoanDAO.getAllTaiKhoan()%>'></c:set>	
</head>
<body onload=" selectTuan();selectNam();">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
		<c:if test="${ not empty param.errUpdate}">
			<c:if test="${param.errUpdate eq 'false'}">
					<font color='blue' style='font-weight:bold'>Cập nhật thành công</font>
					<br/>
					<br/>
			</c:if>
			<c:if test="${param.errUpdate eq 'true'}">
					<font color='red' style='font-weight:bold'>Cập nhật thất bại</font>
					<br/>
					<br/>
			</c:if>
		</c:if>
		<c:if test="${ not empty param.errInsert}">
			<c:if test="${param.errInsert eq 'false'}">
					<font color='blue' style='font-weight:bold'>Tạo mới thành công</font>
					<br/>
					<br/>
			</c:if>
			<c:if test="${param.errInsert eq 'true'}">
					<font color='red' style='font-weight:bold'>Tạo mới thất bại</font>
					<br/>
					<br/>
			</c:if>
		</c:if>
			
			
		<form name="frmNhaCungCap" id="frmNhaCungCap" method="post" action="<%=request.getContextPath()%>/NhaCungCapController" >
			<input type="hidden" value="" name="actionType" id="actionType"/>
			<div>
				<table>
					<tr style="background-color: transparent;">
						<td colspan="9">
							<div class = "div_thanhvientieude">Danh Sách Các Nhà Cung Cấp
							</div>
						</td>
					</tr>
				</table>
				
					
				<table border="1" >
					<tr><td colspan=7>Tên nhà cung cấp <input type="text" name="txtTimTenNhaCungCap" id="txtTimTenNhaCungCap"/> <input type='button' value='Tìm' onclick="click_btnTimTen()"/></td></tr>
					<tr>
						<td colspan="7" style="text-align:right">	
							Trang 
							<c:forEach var="numPage" items="${showNumPage}">
								${numPage} 
							</c:forEach>									
						
						</td>
					</tr>
					<tr>
						<th style='background-color: #186fb2;color:white'>Check</th>
						<th style='background-color: #186fb2;color:white'>STT</th>
						<th style='background-color: #186fb2;color:white'>Tên nhà cung cấp</th>
						<th style='background-color: #186fb2;color:white'>Điện thoại</th>
						<th style='background-color: #186fb2;color:white'>Ghi chú</th>
						<th style='background-color: #186fb2;color:white' colspan="2"></th>
					</tr>
					<c:if test="${param.stt eq 'insert'}">
						<tr>
							<td colspan='7'>
								<br/>
								<br/>
								<font style='font-weight:bold'>Thêm mới nhà cung cấp</font>
								<br/>
								<br/>
								<table class="tableNhaCungCap">
										<tr><td colspan="7"><font color='red' id="alertValidate"></font></td></tr>
										<tr>
											<td width="30%" style='font-weight:bold'>Tên nhà cung cấp</td><td width="70%"><input type='text' name="txtTenNhaCungCap" id="txtTenNhaCungCap" /><font color='red' id='alertTenNhaCungCap'></font></td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Địa chỉ</td><td><input  type='text' name="txtDiaChi" id="txtDiaChi"/><font color='red' id='alertDiaChi'></font></td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Email</td><td><input type='text'  name="txtEmail" id="txtEmail"/><font color='red' id='alertEmail'></font></td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Số điện thoại</td><td><input type='text'  name="txtDienThoai" id="txtDienThoai"/><font color='red' id='alertDienThoai'></font></td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Số tài khoản</td><td>
												<select name="selSoTaiKhoan" id="selSoTaiKhoan">
													<c:forEach var="objTaiKhoan" items="${taiKhoanList}">
														<option value='${objTaiKhoan.maTaiKhoan}'>${objTaiKhoan.soTaiKhoan}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Ghi chú</td><td><textarea rows="4" cols="30" name="txtGhiChu" id="txtGhiChu"></textarea></td>
										</tr>
										<tr>	
											<td colspan="7" style="text-align:center"><input type="button" value="Chấp nhận" name="btnThemMoi" id="btnThemMoi" onclick="click_btnThemMoi()"/> <input type="button" value="Thoát" onclick="click_btnThoat('<%=request.getParameter("index")%>')"/></td>
										</tr>
									</table>
								
							</td>
						</tr>
					
					</c:if>
					<c:forEach var="objNhaCungCap" items="${nhaCungCapList}">
						<c:choose>
							<c:when test="${param.stt eq 'view' and objNhaCungCap.maNhaCungCap eq param.id}">
								<tr><td  colspan="7">
									<table class="tableNhaCungCap">
										<tr>
											<td width="30%" style='font-weight:bold'>Tên nhà cung cấp</td><td width="70%">${objNhaCungCap.ten }</td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Địa chỉ</td><td>${objNhaCungCap.diaChi }</td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Email</td><td>${objNhaCungCap.email }</td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Số điện thoại</td><td>${objNhaCungCap.dienThoai }</td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Số tài khoản</td><td>${objNhaCungCap.taiKhoan.soTaiKhoan}</td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Ghi chú</td><td>${objNhaCungCap.ghiChu }</td>
										</tr>
									</table>
								
								
								</td></tr>
							</c:when>
							<c:when test="${param.stt eq 'edit' and objNhaCungCap.maNhaCungCap eq param.id}">
								<input type='hidden' value='${objNhaCungCap.maNhaCungCap}' name='txtMaNhaCungCap'></input>
								<tr><td colspan="7">
									<table class="tableNhaCungCap">
										<tr><td colspan="7"><font color='red' id="alertValidate"></font></td></tr>
										<tr>
											<td width="30%" style='font-weight:bold'>Tên nhà cung cấp</td><td width="70%"><input type='text' name="txtTenNhaCungCap" id="txtTenNhaCungCap" value="${objNhaCungCap.ten }"/><font color='red' id='alertTenNhaCungCap'></font></td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Địa chỉ</td><td><input  type='text' value='${objNhaCungCap.diaChi}' name="txtDiaChi" id="txtDiaChi"/><font color='red' id='alertDiaChi'></font></td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Email</td><td><input type='text' value='${objNhaCungCap.email}' name="txtEmail" id="txtEmail"/><font color='red' id='alertEmail'></font></td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Số điện thoại</td><td><input type='text' value='${objNhaCungCap.dienThoai}' name="txtDienThoai" id="txtDienThoai"/><font color='red' id='alertDienThoai'></font></td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Số tài khoản</td><td>
												<select name="selSoTaiKhoan" id="selSoTaiKhoan">
													<c:forEach var="objTaiKhoan" items="${taiKhoanList}">
														<option value='${objTaiKhoan.maTaiKhoan}' <c:if test="${objTaiKhoan.maTaiKhoan eq  objNhaCungCap.taiKhoan.maTaiKhoan}">selected</c:if> >${objTaiKhoan.soTaiKhoan}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td style='font-weight:bold'>Ghi chú</td><td><textarea rows="4" cols="30" name="txtGhiChu" id="txtGhiChu">${objNhaCungCap.ghiChu }</textarea></td>
										</tr>
										<tr>	
											<td colspan="7" style="text-align:center"><input type="button" value="Cập nhật" name="btnCapNhat" id="btnCapNhat" onclick="click_btnCapNhat()"/> <input type="button" value="Thoát" onclick="click_btnThoat('<%=request.getParameter("index")%>')"/></td>
										</tr>
									</table>
								
								</td></tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td><input type="checkbox"/></td>
									<td>${objNhaCungCap.STT}</td>
									<td>${objNhaCungCap.ten }</td>
									<td>${objNhaCungCap.dienThoai }</td>
									<td>${objNhaCungCap.ghiChu }</td>
									<td><a href='DanhSachNhaCungCap.jsp?stt=edit&tenNCC=<%=tenNCC %>&index=<%=indexPage %>&id=${objNhaCungCap.maNhaCungCap}'>Edit</a></td>
									<td><a href='DanhSachNhaCungCap.jsp?stt=view&tenNCC=<%=tenNCC %>&index=<%=indexPage %>&id=${objNhaCungCap.maNhaCungCap}'>View</a></td>
								</tr>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
					<tr>
						<td colspan="7" style="text-align:right">
						Trang 
							<c:forEach var="numPage" items="${showNumPage}">
								${numPage} 
							</c:forEach>									
						
						</td>
					</tr>
				</table>
				<br/>
					<input type="button" value="Xóa tin" onclick="location.href=''"/>
					<input type="button" value="Tạo mới" onclick="location.href='DanhSachNhaCungCap.jsp?stt=insert&tenNCC=<%=tenNCC %>&index=<%=indexPage %>'"/>
			</div>
			<!-- Lay duong cac properties cua  link  -->
				<% String proLink=""; %>
				<c:if test="${not empty param.tenNCC}"><% proLink="&tenNCC="+request.getParameter("tenNCC"); %> </c:if>
				<c:if test="${not empty param.index}"><% proLink=proLink+"&index="+request.getParameter("index"); %> </c:if>
				
				<input type='hidden' value="<%=proLink%>" name="txtProLink" id="txtProLink"/>
			<!-- End -->
		</form>

	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>