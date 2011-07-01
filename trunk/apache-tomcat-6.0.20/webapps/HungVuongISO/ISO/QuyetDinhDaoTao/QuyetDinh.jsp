<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.dao.QuyetDinhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.MoChuyenNganhDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.HeDaoTaoDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%>
<%@page import="vn.edu.hungvuongaptech.model.HeDaoTaoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="Utf-8">
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
<title>Quyet Dinh Dao Tao</title>
<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
<c:set var = "HieuTruong" value = "<%= Constant.HIEU_TRUONG %>"></c:set>
<c:set var = "PhongHanhChanh" value = "<%=Constant.PHONG_HANH_CHANH %>"></c:set>
<c:set var = "Admin" value = "<%=Constant.ADMIN %>"></c:set>
<c:set var = "vaiTro" value = '<%= (String) session.getAttribute("maVaiTro") %>'> </c:set>

<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	
<c:set var = "NEW" value = "<%= Constant.TINHTRANG_NEW %>"></c:set>
<c:set var = "SEND" value = "<%= Constant.TINHTRANG_SEND %>"></c:set>
<c:set var = "REJECT" value = "<%= Constant.TINHTRANG_REJECT %>"></c:set>
<c:set var = "APPROVE" value = "<%= Constant.TINHTRANG_APPROVE %>"></c:set>

<c:choose>
	<c:when test="${not empty param.maQuyetDinh and param.maQuyetDinh ne 'ThemDong'}">
		<c:set var="objQuyetDinh" value = '<%=QuyetDinhDAO.getQuyetDinhByMaQuyetDinh(request.getParameter("maQuyetDinh")) %>' scope="session"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="objQuyetDinh" value="${requestScope.quyetDinh}" scope="session" ></c:set>
	</c:otherwise>
</c:choose>

<c:set var="listChuyenNganh" value='<%= ChuyenNganhDAO.getAllChuyenNganh() %>'></c:set>	

<script language="JavaScript" type="text/javascript">
	//Javascript validation functions		
	
	function isEmpty() {
    	return true;
	}

	function confirmSending() {
		if (confirm('Bạn có chắc muốn gửi quyết định không ?')) {
			document.QuyetDinh.GuiHieuTruong.value = 'GuiHieuTruong';
			submitForm();
		}
	}
	
	function confirmDeleteRow() {		
		document.QuyetDinh.XuLyDong.value = 'XoaDong';
		<%		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter printWriter = response.getWriter();
		out.print("var msg='';\n");	 	
	 	for(Integer i = 1; i<= Constant.NUM_ROWS; i++) {
	 		out.write("if(document.QuyetDinh.chkRow" + i.toString() +".checked == true){\n");
	 		out.write("msg += ' " + i.toString() + " - '; } \n");
	 	}
	 	out.write("if(msg == '') {\n");
	 	out.write("alert('Hãy chọn dòng muốn xóa');\n");
	 	out.write("} else {\n");
	 	out.write("if (confirm('Bạn có chắc muốn xóa dòng ' + msg + ' không ?')) \n submitForm(); \n");
	 	out.write("}\n");	 	
		%>			 			 		
	}

	function changeCboKhoa(){
		document.getElementById("txtKhoa").value = parseInt(document.getElementById("cboKhoa").value);
	}

	function submitForm(){		
		document.forms["QuyetDinh"].submit();
	}
	
	function addRow(){		
		document.QuyetDinh.XuLyDong.value = 'ThemDong';
		submitForm();
	}

	function changeCboNienKhoa(){
		var maHeDaoTao = document.getElementById("cboHeDaoTao").value;
		var soNamDaoTao = 0;
		var khdtID = document.getElementById("cboKHDT").value;
		var namBatDau;
		<%
			ArrayList<HeDaoTaoModel> listHeDaoTao = HeDaoTaoDAO.getHeDaoTao();
			for(Integer i = 0; i<listHeDaoTao.size(); i++){
				out.print("if(maHeDaoTao=="+listHeDaoTao.get(i).getMaHeDaoTao()+"){");
				out.print("soNamDaoTao = "+listHeDaoTao.get(i).getSoNam()+";");
				out.print("}");
			}
			
			ArrayList<KeHoachDaoTaoModel> listKHDTModel = KeHoachDaoTaoDao.getAllKeHoachDaoTaoApproved();
			for(Integer i = 0; i<listKHDTModel.size(); i++){
				out.print("if(khdtID=="+listKHDTModel.get(i).getMaKeHoachDaoTao()+"){");
				out.print("namBatDau = "+listKHDTModel.get(i).getNam1()+";");
				out.print("}");
			}
		%>
		document.getElementById("txtNamBatDauNK").value = namBatDau;
		document.getElementById("txtNienKhoa").value = parseInt(document.getElementById("txtNamBatDauNK").value) + soNamDaoTao;
		document.getElementById("txtNienKhoa1").value = parseInt(document.getElementById("txtNamBatDauNK").value);
		document.getElementById("txtNienKhoa2").value = parseInt(document.getElementById("txtNamBatDauNK").value) + soNamDaoTao;
		document.getElementById("txtNam1").value = parseInt(document.getElementById("txtNamBatDauNK").value);
		document.getElementById("txtMaNienKhoa").value = parseInt(document.getElementById("txtNamBatDauNK").value) + " - " + (parseInt(document.getElementById("txtNamBatDauNK").value) + soNamDaoTao);
		document.getElementById("txtSoNam").value = parseInt(soNamDaoTao);
	}

	function submitFormSoSanh(){
		if(document.getElementById('SoSanh').value == '')
		{
			alert("Hãy chọn kế hoạch muốn so sánh");
			return;
		}
		document.forms["SoSanhQuyetDinh"].submit();
	}

	function changeSoSanh()
	{
		document.getElementById('SoSanh').value = document.getElementById('cboSoSanh').value;
	}

	function submitFormSave(){
		document.forms["QuyetDinh"].submit();
	}

	function confirmDuyet(x)
	{
		var act = '';
		if(x == 'A')
		{
			act = 'Approve';
			document.getElementById('Duyet').value = act;
		}
		else
		{
			var value = false;
			value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: 200px; dialogWidth: 300px; dialogTop: 250px; dialogLeft: 350px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
			if(value != false && value != null)
			{
				act = 'Reject';
				document.getElementById('Duyet').value = act;
				document.getElementById('LyDoReject').value = value;
			}
			else
				return;
		}
		if(confirm("Bạn có chắc muốn " + act + " chương trình này không?"))
			document.forms["Duyet1QD"].submit();	
	}
</script>
</head>
<body onload="changeCboNienKhoa(); changeCboKhoa(); totalStudent(); ">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->

	<form action="<%=request.getContextPath()%>/quyetDinhController?them=yes" method="post" name="QuyetDinh">
	
		<input type= "hidden" id="ID" name = "ID" value = "${param.ID}" /> 
	
		<c:set var="SysParamsObj" value="<%=SysParamsDAO.getSysParams()%>"></c:set>	
		<c:if test="${not empty param.Them}">
			<% Constant.NUM_ROWS = 1; %>
		</c:if>
		<c:if test="${not empty param.errNam}">
			<b class="error">Quyết định này đã có rồi</b>
		</c:if>
		<c:if test="${not empty param.err}">
			<b class="error"> Nhập liệu vào các ô bắt buộc (*) </b>
		</c:if>
		<c:if test="${not empty param.msg and param.msg eq 'ThemMoi'}">
			<b class="msg"> Thêm mới "QUYẾT ĐỊNH ĐÀO TẠO" thành công </b>
		</c:if>
		<c:if test="${(not empty param.msg and param.msg eq 'CapNhat')
							or (not empty requestScope.msgDeleteRow)}">
			<b class="msg"> Cập nhật "QUYẾT ĐỊNH ĐÀO TẠO" thành công </b>
		</c:if>	
	
		<table style="background-color: transparent;">
			<tr align="center" style="background-color: transparent;">
				<td>
					ỦY BAN NHÂN DÂN QUẬN 5<br />
					TRƯỜNG TCN KTCN HÙNG VƯƠNG<br />
					Số: <input type="text" size="2" name="txtKihieu" id="txtKihieu" maxlength="20" value="${objQuyetDinh.kiHieu}" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">readonly="readonly"</c:if> /><c:if test="${not empty param.err and objQuyetDinh.kiHieu eq ''}"><b class="error">(*)</b></c:if> /QĐ-KTCNHV 
				</td>
				<td>
					CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />
					Độc lập – Tự do – Hạnh phúc<br />
					Quận 5, ${objQuyetDinh.ngayLap}
				</td>
			</tr>
			<tr align="center" style="background-color: transparent;">
				<td colspan="2">
					<div class = "div_Title"><strong>QUYẾT ĐỊNH</strong></div><br />
					V/v mở lớp đào tạo hệ 
					<select name="cboHeDaoTao" id="cboHeDaoTao" onchange="changeCboNienKhoa();" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">disabled="disabled"</c:if>>
						<c:forEach var="objHeDaoTao" items="<%= HeDaoTaoDAO.getHeDaoTao() %>">
							<option value="${objHeDaoTao.maHeDaoTao}" <c:if test="${objQuyetDinh.maHeDaoTao eq objHeDaoTao.maHeDaoTao}">selected</c:if>>${objHeDaoTao.tenHeDaoTao}</option>
						</c:forEach>
					</select><br/>
					Thuộc kế hoạch 
					<select name="cboKHDT" id="cboKHDT" onchange="changeCboNienKhoa();" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">disabled="disabled"</c:if>>
						<c:forEach var="objKHDT" items="<%=KeHoachDaoTaoDao.getAllKeHoachDaoTaoApproved() %>">
							<option value="${objKHDT.maKeHoachDaoTao}" <c:if test="${objQuyetDinh.maKHDT eq objKHDT.maKeHoachDaoTao}">selected</c:if>>${objKHDT.tenKeHoachDaoTao}</option>
						</c:forEach>
					</select>
					<br />
					Khóa 
					<select name="cboKhoa" id="cboKhoa" onchange="changeCboKhoa();" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">disabled="disabled"</c:if>>
						<c:forEach var="iterater" begin="1" end="30" step="1">
							<option value="${iterater}" <c:if test="${objQuyetDinh.maKhoa eq iterater}">selected</c:if>>${iterater}</option>
						</c:forEach>
					</select> 
					Niên khóa
					<input type="text" size="2" name = "txtNamBatDauNK" id = "txtNamBatDauNK" readonly="readonly" value="${objQuyetDinh.namBatDau}"/>
					- 
					<input type="text" size="2" name = "txtNienKhoa" id = "txtNienKhoa" readonly="readonly" value="${objQuyetDinh.namBatDau+objQuyetDinh.soNamDaoTao}"/><br /><br />
					<br /><br />
					HIỆU TRƯỞNG TRƯỜNG TRUNG CẤP NGHỀ KỸ THUẬT CÔNG NGHỆ HÙNG VƯƠNG
				</td>
			</tr>
			<tr align="left" style="background-color: transparent;">
				<td colspan="2">
					<div class="div_textleft">- Căn cứ Quyết định số 2470/QĐ-UBND ngày 05/6/2007 của Ủy ban nhân dân Thành phố  Hồ Chí Minh v/v thành lập Trường Trung cấp nghề kỹ thuật công nghệ Hùng Vương trực thuộc Ủy ban Nhân dân Quận 5 trên cơ sở nâng cấp trường Trường Kỹ thuật công nghệ Hùng Vương ;</div>
				</td>
			</tr>
			<tr align="left" style="background-color: transparent;">
				<td colspan="2">
					<div class="div_textleft">-	Căn cứ Quyết định số 03/2007/QĐ–BLĐTBXH ngày 04/1/2007 của Bộ Trưởng Bộ Lao động – Thương binh và Xã hội ban hành Điều lệ trường trung cấp nghề;</div>
				</td>
			</tr>
			<tr align="left" style="background-color: transparent;">
				<td colspan="2">
					<div class="div_textleft">-	Căn cứ Quyết định số <input type="text" size="5" name = "txtQuyetDinhSo" id = "txtQuyetDinhSo" maxlength="30" value="${objQuyetDinh.quyetDinhSo}" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">readonly="readonly"</c:if>/><c:if test="${not empty param.err and objQuyetDinh.quyetDinhSo eq ''}"><b class="error">(*)</b></c:if>./QĐ-UBND ngày 
						<input type = "text" id="txtDate" name="txtDate" readonly="readonly" size = 6 value="${objQuyetDinh.ngayRaQuyetDinh}" />
						<c:if test="${objQuyetDinh.tinhTrang ne APPROVE}"><c:if test="${objQuyetDinh.tinhTrang ne SEND}"><img id="imgDate" src="<%=request.getContextPath()%>/images/icon_lich/3.png" alt="Calendar" height="20px" style="margin-bottom: -5px;"/>(dd-mm-yyyy)</c:if></c:if><c:if test="${not empty param.err and objQuyetDinh.ngayRaQuyetDinh eq ''}"><b class="error">(*)</b></c:if>
						. của Ủy ban nhân dân thành phố Hồ Chí Minh v/v giao chỉ tiêu kế hoạch đào tạo hệ trung cấp nghề năm <input name="txtNam1" id="txtNam1" size="2" readonly="readonly" value="${objQuyetDinh.namBatDau}"/>
					 cho Trường Trung cấp nghề kỹ thuật công nghệ Hùng Vương;</div>
				</td>
			</tr>
			<tr align="left" style="background-color: transparent;">
				<td colspan="2">
					<div class="div_textleft">-	Theo đề nghị của trưởng phòng đào tạo;</div>
				</td>
			</tr>
			<tr align="center" style="background-color: transparent;">
				<td colspan="2">
					<div class = "div_Title">QUYẾT ĐỊNH</div>
				</td>
			</tr>
			<tr align="left" style="background-color: transparent;">
				<td colspan="2">
					<div class="div_textleft"><strong>Điều I</strong> : Nay mở lớp đào tạo hệ Trung cấp nghề chính qui khóa <input type="text" size="4" name = "txtKhoa" id = "txtKhoa" readonly="readonly" value="${objQuyetDinh.maKhoa}"/> 
					niên khóa <input type="text" size="2" style="width: 80px" name = "txtMaNienKhoa" id = "txtMaNienKhoa" readonly="readonly" value="${objQuyetDinh.namBatDau} - ${objQuyetDinh.namBatDau+objQuyetDinh.soNamDaoTao}"/> 
					tại Trường Trung cấp nghề kỹ thuật công nghệ Hùng Vương gồm <input type="text" size="2" name = "txtSoHocSinh" id = "txtSoHocSinh" readonly="readonly" value="${objQuyetDinh.tongSoHocSinh}"/> học sinh (danh sách đính kèm) <br /> 
					với <input type="text" size="1" name = "txtSoChuyenNganh" id = "txtSoChuyenNganh" readonly="readonly" value="<%=Constant.NUM_ROWS%>"/>  chuyên ngành :</div>
				</td>
			</tr>
		</table>
			<table align="center" border="1" style="background-color: transparent;">
				<c:set var="numRows" value="<%=Constant.NUM_ROWS%>"></c:set>  		  
		 		<c:forEach var="iterator" begin="1" end="${numRows}" step="1">
					<c:set var="objMoChuyenNganh" value = "${objQuyetDinh.moChuyenNganhList[iterator-1]}"></c:set>
						<tr style="background-color: transparent;">
							<td>
								<input type="checkbox" name="chkRow${iterator}" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">readonly="readonly"</c:if> />
							</td>
							<td>
								<select name="cboChuyenNganh${iterator}" id="cboChuyenNganh${iterator}" onchange=""; <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">disabled="disabled"</c:if> >
									<c:forEach var="objChuyenNganh" items = "${listChuyenNganh}">
										<option value = "${objChuyenNganh.maChuyenNganh}" 
												<c:if test="${objMoChuyenNganh.maChuyenNganh eq objChuyenNganh.maChuyenNganh}">selected</c:if>>${objChuyenNganh.tenChuyenNganh}</option>
									</c:forEach>
								</select>
							</td>
							<td>
								<input type="text" size="30" name="txtGhiChu${iterator}" id="txtGhiChu${iterator}" onblur="totalStudent()" value="${objMoChuyenNganh.ghiChu}" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">readonly="readonly"</c:if> /><c:if test="${not empty param.err and objMoChuyenNganh.ghiChu eq ''}"><b class="error">(*)</b></c:if> học sinh
							</td>
						</tr>					
				</c:forEach>
			</table>
		<table style="background-color: transparent;" border="0">
				<tr style="background-color: transparent;">
					<c:if test="${((MaBoPhan eq BO_PHAN_PHC and (objQuyetDinh.maNguoiLap eq maThanhVien or empty objQuyetDinh.maQuyetDinh)) or MaBoPhan eq BO_PHAN_ADMIN) and objQuyetDinh.tinhTrang eq NEW or objQuyetDinh.tinhTrang eq REJECT or objQuyetDinh.tinhTrang eq null}">
						<td colspan = "3">							
							<a href = "javascript: addRow()">
								<input type="hidden" id="XuLyDong" name="XuLyDong" id="XuLyDong" /> 
								<img src="<%=request.getContextPath()%>/images/buttom/themdong.png" alt="Thêm Dòng" border = "0" />
							</a>						
							<a href = "javascript: confirmDeleteRow()">				
								<img src="<%=request.getContextPath()%>/images/buttom/xoadong.png" alt="Xóa Dòng" border = "0" />
							</a>
						</td>
					</c:if>
				</tr>
			<tr align="left" style="background-color: transparent;">
				<td colspan="3">
					Thời gian đào tạo từ tháng 
					<select name="cboTuThang" id="cboTuThang" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">disabled="disabled"</c:if>>
						<c:forEach var="iterator" begin="1" end="12" step="1">
							<option value = "${iterator}" 
								<c:if test="${objQuyetDinh.tuThang eq iterator}">selected</c:if>>${iterator}</option>
						</c:forEach>
					</select> - 
					<input type="text" size="2" name="txtNienKhoa1" id="txtNienKhoa1" readonly="readonly" value="${objQuyetDinh.namBatDau}"/>  
					đến tháng 
					<select name="cboDenThang" id="cboDenThang" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">disabled="disabled"</c:if>>
						<c:forEach var="iterator" begin="1" end="12" step="1">
							<option value = "${iterator}" 
								<c:if test="${objQuyetDinh.denThang eq iterator}">selected</c:if>>${iterator}</option>
						</c:forEach>
					</select> - 
					<input type="text" size="2" name = "txtNienKhoa2" id = "txtNienKhoa2" readonly="readonly" value="${objQuyetDinh.namBatDau + objQuyetDinh.soNamDaoTao}"/> (<input name="txtSoNam" id="txtSoNam" size="1" readonly="readonly" value="${objQuyetDinh.soNamDaoTao}"/> năm).
				</td>
			</tr>
			<tr align="left" style="background-color: transparent;">
				<td colspan="3"><br />
					<div class="div_textleft"><strong>Điều II</strong> : Phòng Đào tạo lập kế hoạch tiến độ đào tạo, xây dựng chương trình đào tạo, phối hợp các Khoa bố trí giáo viên giảng dạy theo đúng chương trình đào tạo.</div>
				</td>
			</tr>
			<tr align="left" style="background-color: transparent;">
				<td colspan="3"><br />
					<div class="div_textleft"><strong>Điều III</strong> : Các Ông (Bà) Trưởng phòng Đào tạo, Phòng Tổ chức, Phòng Kế toán, các Khoa/Trung tâm và học sinh có tên trong danh sách chịu trách nhiệm thi hành quyết định này.</div>
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;" border="0">
			<tr align="center" style="background-color: transparent;">
				<td align="left" width="100">
					<br/><br/>
					<div class="div_textleft">Nơi nhận:<c:if test="${not empty param.err and objQuyetDinh.noiNhan eq ''}"><b class="error">(*)</b></c:if></div>
					<br />
					<textarea id="txtNoiNhan" name="txtNoiNhan" rows="2" cols="20" style="background-color: transparent; background-position: left" <c:if test="${objQuyetDinh.tinhTrang eq APPROVE or objQuyetDinh.tinhTrang eq SEND}">disabled="disabled"</c:if>>${objQuyetDinh.noiNhan}</textarea>
				</td>
				<td>
					<strong>SỞ LĐ – TB XH TP.HCM</strong>
					<br/><br/><br/><br/><br/><br/>
				</td>
				<td>
					<strong>HIỆU TRƯỞNG</strong>
					<br/><br/><br/><br/><br/><br/>
					<strong>${objQuyetDinh.tenNguoiDuyet}</strong>
				</td>
			</tr>
		</table>
			<br /><br /><br /><br />
		<input type="hidden" id="actionType" name="actionType" style="background-color: transparent;"
			<c:choose>				
				<c:when test="${empty objQuyetDinh.maQuyetDinh}">
					value="ThemMoi"
				</c:when>
				<c:otherwise>
					value="CapNhat"
				</c:otherwise>	
			</c:choose>  
		/>
			<c:if test = "${(MaBoPhan eq BO_PHAN_PHC and (objQuyetDinh.maNguoiLap eq maThanhVien or empty objQuyetDinh.maQuyetDinh)) or MaBoPhan eq BO_PHAN_ADMIN}"> 
				<c:choose>
					<c:when test="${objQuyetDinh.tinhTrang eq NEW or objQuyetDinh.tinhTrang eq REJECT or objQuyetDinh.tinhTrang eq null}">
						<!--  <input type = "submit" name="TaoMoi" -->
						<a href = "javascript: submitForm()" name="TaoMoi"> 
						<c:choose>
							<c:when test="${empty objQuyetDinh.maQuyetDinh}">
								<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Tạo mới" border = "0" />
							</c:when>
							<c:otherwise>							
								<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" alt="Cập Nhật" border = "0" />
							</c:otherwise>
						</c:choose> </a>					
						<c:choose>
							<c:when test="${not empty objQuyetDinh.maQuyetDinh}">							
								<a href = "javascript: confirmSending()">
									<input type="hidden" id="GuiHieuTruong" name="GuiHieuTruong" /> 
									<img src="<%=request.getContextPath()%>/images/buttom/guihieutruong.png" alt="Gửi Hiệu Trưởng" border = "0" />
								</a>
							</c:when>				
						</c:choose>
					</c:when>
				</c:choose>
			</c:if>
			<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and objQuyetDinh.tinhTrang eq SEND}">
				<a href = "javascript: confirmDuyet('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Approve" border="0"/> </a>
			</c:if>
			<c:if test="${objQuyetDinh.tinhTrang eq APPROVE and (MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN)}">
				<a href = "javascript: submitForm()">	
					<input type="hidden" id="Copy" name="Copy" value = "Copy" />							 
					<img src="<%=request.getContextPath()%>/images/buttom/saochep.png" alt="Sao chép" border = "0" />
				</a>									
				<a href = "<%=Constant.PATH_RES.getString("iso.InQuyetDinhDaoTaoPath") %>">								 
					<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
				</a>
			</c:if>
			<c:if test = "${not empty objQuyetDinh.maQuyetDinh}">
				<c:set var = "ListQuyetDinhApproved" value='<%=QuyetDinhDAO.getAllQuyetDinhDaoTaoApproved()%>'></c:set>
					<select id="cboSoSanh" name="cboSoSanh" onclick="changeSoSanh();">
						<option value="">---Select---</option>
						<c:forEach var="QuyetDinhApproved" items="${ListQuyetDinhApproved}">
							<c:choose>
								<c:when test="${MaBoPhan eq BO_PHAN_PHC}">
									<c:if test="${maThanhVien eq QuyetDinhApproved.maNguoiLap}"><c:if test="${QuyetDinhApproved.maQuyetDinh ne objQuyetDinh.maQuyetDinh}"><option value="${QuyetDinhApproved.maQuyetDinh}">${QuyetDinhApproved.tenQuyetDinh}</option></c:if></c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${QuyetDinhApproved.maQuyetDinh ne objQuyetDinh.maQuyetDinh}"><option value="${QuyetDinhApproved.maQuyetDinh}">${QuyetDinhApproved.tenQuyetDinh}</option></c:if>
								</c:otherwise>
							</c:choose>	
						</c:forEach>
					</select>	
				<a href = "javascript: submitFormSoSanh()"><img src="<%=request.getContextPath()%>/images/buttom/sosanh.png" alt="So sánh" border = "0" /></a>
			</c:if>
		
			<c:if test="${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and objQuyetDinh.tinhTrang eq SEND}">
				<a href = "javascript: confirmDuyet('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Reject" border="0"/> </a>
			</c:if>
	</form>
	
	<form method="post" action="<%=request.getContextPath()%>/quyetDinhController?sosanh=yes" name="SoSanhQuyetDinh">	
		<input type="hidden" id="SoSanh" name="SoSanh" value = "" />	
	</form>
	<form method="post" action="<%=request.getContextPath()%>/quyetDinhController?duyet1quyetdinh=yes&maQuyetDinh=${objQuyetDinh.maQuyetDinh}" name="Duyet1QD">
		<input type="hidden" id="Duyet" name="Duyet" value = "" />
		<input type="hidden" id="LyDoReject" name="LyDoReject" value=""/>
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->

<script type="text/javascript">
//<![CDATA[  
  <%
  	for(int i=1; i<= 1 ; i++) {
  		String output = "";
  		output += "Zapatec.Calendar.setup({";
  		output += "firstDay          : 1,";
  		output += "weekNumbers       : false,";
  		output += "range             : [2000.01, 2030.12],";
  		output += "electric          : false,";
  		output += "inputField        : 'txtDate',";
  		output += "button            : 'imgDate',";
  		output += "ifFormat          : '%d-%m-%Y'";
  		output += "});";  		
  		out.println(output); 
  	}
  %>
//]]>

  function totalStudent(){
		var i = 1;
		var temp = 0;
		
		for(i; i <= <%=Constant.NUM_ROWS%>; i++){
			var num = document.getElementById('txtGhiChu' + i).value;
			if(num != '')
			{
				num = num.replace("-","");
				if((parseInt(num) - 0) + "" != document.getElementById('txtGhiChu' + i).value)
				{
					document.getElementById('txtGhiChu' + i).value = "";
					num = "0";
					alert("Vui lòng nhập số nguyên dương cho ô số học sinh!");
				}
			}
			if(num == ""){
				num = "0";
			}
			if(isNaN(num)){
				document.getElementById('txtGhiChu' + i).value = "";
				num = "0";
				alert("Vui lòng nhập số nguyên dương cho ô số học sinh!");
			}
			temp+= parseInt(num);
		}
		document.getElementById('txtSoHocSinh').value = temp;
	}
	
</script>

</div>
</body>
</html>