<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="javax.swing.SpringLayout.Constraints"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.IntroDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhongBanDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.PhongBanModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.DiChuyenThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%><html xmlns="http://www.w3.org/1999/xhtml">
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
	function validateForm()
	{
		var stt=true;
		var objKhoa=document.getElementById("cboKhoa");
		var khoa=objKhoa.options[objKhoa.selectedIndex].text;
		
		var objNguoiMuon=document.getElementById("cboNguoiMuon");
		var nguoiMuon=objNguoiMuon.options[objNguoiMuon.selectedIndex].text;
		
		var thoiGianTra = document.getElementById("txtThoiGianTra").value;
		
		var mydate=new Date(); 
		var year=mydate.getFullYear();
		var day=mydate.getDay(); 
		var month=mydate.getMonth() ;
		var daym=mydate.getDate() ;
		var montharray=new Array("1","2","3","4","5","6","7","8","9","10","11","12");
		var cdate=daym+montharray[month]+year;
		
		if(khoa=="Chọn"){
			document.getElementById("alertKhoa").innerHTML="*";
			stt=false;
		}
		else
			document.getElementById("alertKhoa").innerHTML="";
		
		if(nguoiMuon=="All"){
			document.getElementById("alertNguoiMuon").innerHTML="*";
			stt=false;
		}
		else
			document.getElementById("alertNguoiMuon").innerHTML="";
		
		if(rightSpace(thoiGianTra)==""){
			document.getElementById("alertThoiGianTra").innerHTML="*";
			stt=false;
		}
		else{
			document.getElementById("alertThoiGianTra").innerHTML="";
			if(thoiGianTra > cdate){
				document.getElementById("alertThoiGianTra").innerHTML="*";
				stt=false;
			}
			else
				document.getElementById("alertThoiGianTra").innerHTML="";
		}
		
		var resultValidate=document.getElementById("alertValidate");
		if(!stt)
			resultValidate.innerHTML="Bạn phải nhập vào nơi có dấu *";
		else 
			resultValidate.innerHTML=""; 
		
		return stt;
	}
	
	function rightSpace(str)
	{
		var length=str.length-1;
		while(length>=0&&str.charAt(length)==' ')
		{
			length--;
		}
		return str.substr(0,length+1);
	}	
	
	function ChooseKhoa()
	{		
		var	temp1="";
		if(document.getElementById("cboKhoa").value!=null&&document.getElementById("cboKhoa").value!="")
			temp1="maKhoa="+document.getElementById("cboKhoa").value;
		
		var strPath=<% out.print("'"+request.getContextPath()+"/QuanLyThietBi/ThietBi/MuonThietBi.jsp"+"?'"); %>+temp1;
		location.href=strPath;	

	}	
	
	function submitFormSearch()
	{
		document.getElementById('actionType').value = 'timThietBiMuon';
		document.forms['formMuonThietBi'].submit();
	}	
	function xyLyComboboxLoaiTB(){
		document.getElementById('actionType').value = 'searchLoaiTBByMuonTB';
		document.forms['formMuonThietBi'].submit();
	}
	function submitForm(){		
		document.forms["formMuonThietBi"].submit();
	}
</script>
<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Hệ Thống Quản Lý Thiết Bị</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	
	<a id="aFocus"></a>
	<font color='red' id='alertValidate'></font>
		
	<% int rows = 1; 
				ArrayList<ThanhVienModel> thanhVienList;
				if(request.getSession().getAttribute("thanhVienModelList") != null)
					thanhVienList = (ArrayList<ThanhVienModel>)request.getSession().getAttribute("thanhVienModelList");
				else
					thanhVienList = PhieuMuonThietBiDAO.timAllThanhVienByMaKhoa();
	%>
	<!-- khoa-->	
	<c:if test="${not empty param.maKhoa}">
		<c:set var="listThanhVien" value='<%=PhieuMuonThietBiDAO.getAllThanhVienMuonThietBi(request.getParameter("maKhoa")) %>'></c:set>
	</c:if>
	<c:if test="${empty param.maKhoa or param.maKhoa eq -1}">
		<c:set var="listThanhVien" value='<%=ThanhVienDAO.timAllThanhVien() %>'></c:set>
	</c:if>
	<!-- End -->
	<c:set var="listLoaiThietBi" value="<%= LoaiThietBiDAO.getAllLoaiThietBi() %>"></c:set>
	
	<c:if test="${ not empty param.errInsert }">
			<c:if test="${param.errInsert eq 'true'}">
					<font color='red'>Lỗi thêm mới</font>
			</c:if>
			<c:if test="${param.errInsert eq 'false'}">
					<font color='blue'>Thêm mới thành công</font>
			</c:if>
	</c:if>
		
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formMuonThietBi" id = "formMuonThietBi" method="post">
		
	<div>			
		<c:set var="listKhoa" value="<%= ThietBiDAO.showAllKhoa() %>" ></c:set>
		<c:set var="listThanhVien" value="<%= thanhVienList %>" scope = "session"></c:set>
		<input type="hidden" id="actionType" value="muonTB" name = "actionType"/>
			
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Mượn Thiết Bị</div>
				</td>
			</tr>
		</table>
		
		<table style="background-color: transparent;" border=1>	
			<tr style="background-color: transparent;">							
				<td><div class="div_txright">Khoa :</div></td>
				<td colspan="3">
			 		<div class="div_txleft">
 
						<select id="cboKhoa" name="cboKhoa" onchange="ChooseKhoa()">	
							<option 
								<c:if test="${param.maKhoa eq -1}"> selected</c:if>
									value = "-1" >Chọn</option>											
								<c:forEach var="tt" items="${listKhoa}">
									<option 
										<c:if test="${param.maKhoa eq tt.maKhoa}">selected</c:if>
										value="${tt.maKhoa}">${tt.tenKhoa}
									</option> 
								</c:forEach>
						</select>
						<font id='alertKhoa' color='red'></font>
						</div>
					</td>
					
				<td>
			 		<div class="div_txright">Người mượn :</div>
			 	</td>
			 	<td colspan="3">				
					<select name="cboNguoiMuon" id="cboNguoiMuon">
						<option	value = "-1" >All</option>					
						<c:forEach var="ThanhVien" items="${listThanhVien}">
							<option value="">${ThanhVien.hoThanhVien } ${ThanhVien.tenLot } ${ThanhVien.tenThanhVien }</option>			
								<%rows++; %>				
						</c:forEach>
					</select>
					<font id='alertNguoiMuon' color='red'></font>
				</td>			
			</tr>	
		
		<tr>
				<td><div class="div_txright">Ngày lập :</div></td>
				<td>
				<script src="<%=request.getContextPath()%>/QuanLyThietBi/js/MuonThietBi_Script.js" type="text/javascript"></script>							
				</td> 
				<td><div class="div_txright">Thời gian trả :</div></td>
				<td>
					<div class="div_txleft">
						<input type="text" id="txtThoiGianTra" value="${requestScope.ThoiGianTra}" size = 15 readonly="readonly" name="txtThoiGianTra" style="background-color: transparent;"/>
						<font id='alertThoiGianTra' color='red'></font>						
					</div>
				</td>			 	
			 	<td><div class="div_txright">Giờ :
				 		<select name="cboGio${c}">
							<c:forEach var="Gio" begin="01" end="24">
								<option value="${Gio}">${Gio}</option>
							</c:forEach>
						</select>
			 		</div>
			 	</td>
			 	<td><div class="div_txleft">Phút :
			 			<select name="cboPhut${c}">
							<c:forEach var="Phut" begin="00" end="60">
								<option value="${Phut}">${Phut }</option>
							</c:forEach>
						</select>
			 		</div>
			 	</td>
			 	<td>
			 		<a href = "<%=request.getContextPath()%>/QuanLyThietBi/ThietBi/DanhSachMuonThietBi.jsp">
						<img src="<%=request.getContextPath()%>/images/buttom/danhsachmuon.png" alt="danh sách mượn" border = "0" />
					</a>
			 	</td>
			</tr>
		</table>		
	
			<table border="1">
				<tr>
					<td>Loại TB :</td>
					<td>
						<select id="cboLoaiThietBi" name="cboLoaiThietBi" onchange="submitFormSearch();">
								<option 
									<c:if test="${param.maLoaiThietBi eq -1}"> selected</c:if>
									value = "-1" >Chọn</option>	
												
									<c:forEach var="loaiThietBi" items="${listLoaiThietBi}">
										<option 
											<c:if test="${param.maLoaiThietBi eq loaiThietBi.maLoaiThietBi}">selected</c:if>
											value="${loaiThietBi.maLoaiThietBi}">${loaiThietBi.tenLoaiThietBi}
										</option>
									</c:forEach>
						</select>
					</td>
					
					<td>Tên thiết bị</td><td><input type="text" name="txtTimThietBiMuon" id="txtTimThietBiMuon" value="${requestScope.tenThietBi }"/>
					
					<td>Kí hiệu :</td><td><input type="text" name="txtTimKiHieu" id="txtTimKiHieu" value="${requestScope.kiHieu }" style="background-color: transparent; width: 77px"/></td>
						<td><a href = "javascript: submitFormSearch();">
							<img src="<%=request.getContextPath()%>/images/buttom/timkiem.png" border = "0" />
						</a>
					</td>
				</tr>
			</table>
			
			<table border="1">
				<tr>
					<th bgcolor = "#186fb2">
								<div class = "div_textWhite">
									<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"></input>
								</div>
					</th>
					<td style='background-color: #186fb2;color:white'>STT</td>
					<td style='background-color: #186fb2;color:white'>Loại thiết bị</td>
					<td style='background-color: #186fb2;color:white'>Số thiết bị</td>
					<td style='background-color: #186fb2;color:white'>Tên thiết bị</td>
					<td style='background-color: #186fb2;color:white'>Phòng</td>
				</tr>	
				
				<%  int c = 1;
					ArrayList<ThietBiModel> thietBiList;
					if(request.getSession().getAttribute("thietBiModelList") != null)
						thietBiList = (ArrayList<ThietBiModel>)request.getSession().getAttribute("thietBiModelList");
					else
						thietBiList = ThietBiDAO.showAllMuonThietBi();
				%>
				<c:set var="listThietBi" value="<%= thietBiList %>" scope = "session"></c:set>
				
				<c:forEach var="ThietBi" items="${listThietBi}">
					<tr>
						<td><input type="checkbox" name="chk<%=c %>" id="chk<%=c %>" onclick="checkRow();"/></td>
						<td><%=c %></td>
						<td>${ThietBi.tenLoaiThietBi }</td>	
						<td>${ThietBi.kiHieu }</td>	
						<td>${ThietBi.tenThietBi }</td>				
						<td>${ThietBi.tenPhongBan }</td>					
					</tr>
					<%c++; %>
				
				</c:forEach>		
			</table>
			<br/>
			<a href = "javascript: muonTB()" name="ThemMoi">
				<img src="<%=request.getContextPath()%>/images/buttom/muon.png" border = "0" />				
			</a>
			<input type = "hidden" name="xuly" id = "xuly" />
		</div>
		
		<script language="JavaScript" type="text/javascript">
				function submit()
				{
					document.getElementById("formMuonThietBi").submit();
				}
			
				function checkAll()
				{		
					if (document.getElementById("chkAll").checked == true) {
						<%
							for(int i = 1; i< c; i++) {
								out.print("document.getElementById('chk" + i + "').checked = true;\n");
							}
						%>	
					}else {
						<%
							for(int i = 1; i< c; i++) {
								out.print("document.getElementById('chk" + i + "').checked = false;\n");
							}
						%>
					}
				}
				
				function checkRow(){
					if(document.getElementById('chkAll').checked == true)
						document.getElementById('chkAll').checked = false;
				}
			</script>		
	<br/>
	<script type="text/javascript">
			//<![CDATA[
			  Zapatec.Calendar.setup({
				firstDay          : 1,
				weekNumbers       : false,
				range             : [2010.01, 2020.12],
				electric          : false,
				inputField        : "txtThoiGianTra",
				button            : "Calendar1",
				ifFormat          : "%m-%d-%Y"
			  });
			//]]>
			
		function muonTB()
		{					
			if(validateForm())
		  	{	
			  	var check = false;
			<%
				for(int i=1;i<c;i++)
				{
					out.print("if(document.getElementById('chk" + i + "').checked == true)");
					out.print("check = true;");
				}
			%>
				if(check == false)
				{
					alert("Bạn chưa chọn thiết bị nào!");
				}
				
				else if(check == true)
				{
					if(confirm("Bạn có chắc muốn mượn thiết bị này không???"))
					{
						document.getElementById('xuly').value = 'muon';
						document.forms["formMuonThietBi"].submit();
					}
				}
		  	}
		  	else
		  	{
		  		document.getElementById("aFocus").innerHTML="<input type='text' style='background-color: transparent;border:none' id='txtAlertFocus'/>";
		  		document.getElementById("txtAlertFocus").focus();
		  		document.getElementById("aFocus").innerHTML="";
		  	}
		  	
		}
	</script>
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</form>	
</body>
</html>
