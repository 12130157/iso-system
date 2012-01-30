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
<%@page import="vn.edu.hungvuongaptech.dao.LoaiThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.LoaiThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.NamHocDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.NamHocModel"%>
<%@page import="vn.edu.hungvuongaptech.model.TinhTrangThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.controller.ThietBiController"%>
<%@page import="vn.edu.hungvuongaptech.dao.TinhTrangThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.KhoaModel"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="vn.edu.hungvuongaptech.util.DataUtil"%>
<%@page import="vn.edu.hungvuongaptech.util.DateUtil"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->

<title>Hệ Thống Quản Lý Thiết Bị</title>
<script language="javascript">
	var listBoPhan = new Array(); 
	<%
		ArrayList<KhoaModel> listBoPhan = ThietBiDAO.getComboBoxDanhSachThietBi();
		int n = 0;
		int k = 0;
		String outT = "";
		for(KhoaModel boPhan : listBoPhan){
			out.print("var objBoPhan = new Object();\n");
			out.print("objBoPhan.maBoPhan = '"+boPhan.getMaKhoa()+"';\n");
			out.print("objBoPhan.tenBoPhan = '"+boPhan.getTenKhoa()+"';\n");
			out.print("var listPhongBan = new Array();\n");
			int i = 0;
			for(PhongBanModel phongBan : boPhan.getListPhongBan()){
				out.print("var objPhongBan = new Object();\n");
				out.print("objPhongBan.maPhongBan = '"+phongBan.getMaPhongBan()+"';\n");
				out.print("objPhongBan.tenPhongBan = '"+phongBan.getKiHieu()+"';\n");
				out.print("var listLoaiThietBi = new Array();\n");
				int j = 0;
				for(LoaiThietBiModel loaiThietBi : phongBan.getListLoaiThietBi()){
					out.print("var objLoaiThietBi = new Object();\n");
					out.print("objLoaiThietBi.maLoaiThietBi = '"+loaiThietBi.getMaLoaiThietBi()+"';\n");
					out.print("objLoaiThietBi.tenLoaiThietBi = '"+loaiThietBi.getTenLoaiThietBi()+"';\n");
					out.print("listLoaiThietBi["+j+"] = objLoaiThietBi;\n");
					j++;	
				}
				out.print("objPhongBan.listLoaiThietBi = listLoaiThietBi;\n");
				out.print("listPhongBan["+i+"] = objPhongBan;\n");
				i++;
			}
			out.print("objBoPhan.listPhongBan = listPhongBan;\n");
			out.print("listBoPhan["+n+"] = objBoPhan;\n");
			n++;
		}
	%>
	
	function loadData(){
		document.getElementById("cbBoPhan").innerHTML = null;
		document.getElementById("cbPhongBan").innerHTML = null;
		document.getElementById("cbLoaiThietBi").innerHTML = null;
		document.getElementById("cbBoPhan").add(new Option("Chọn",""));
		for (var obj in listBoPhan){
			var option = new Option(listBoPhan[obj].tenBoPhan,listBoPhan[obj].maBoPhan);
			document.getElementById("cbBoPhan").add(option,null);
		}
		document.getElementById("cbPhongBan").add(new Option("Chọn",""));
		/*for ( var obj2 in listBoPhan[0].listPhongBan) {
			var option = new Option(listBoPhan[0].listPhongBan[obj2].tenPhongBan,listBoPhan[0].listPhongBan[obj2].maPhongBan);
			document.getElementById("cbPhongBan").add(option,null);
		}*/
		document.getElementById("cbLoaiThietBi").add(new Option("Chọn",""));
		/*for ( var obj3 in listBoPhan[0].listPhongBan[0].listLoaiThietBi) {
			var option = new Option(listBoPhan[0].listPhongBan[0].listLoaiThietBi[obj3].tenLoaiThietBi,listBoPhan[0].listPhongBan[0].listLoaiThietBi[obj3].maLoaiThietBi);
			document.getElementById("cbLoaiThietBi").add(option,null);
		}*/
		<%
			if(request.getParameter("maBoPhan")!=null && request.getParameter("maBoPhan")!=""){
				out.print("var maBoPhan='"+request.getParameter("maBoPhan")+"';\n");
				out.print("for(var obj in listBoPhan){\n");
				out.print("if(listBoPhan[obj].maBoPhan==maBoPhan){document.getElementById('cbBoPhan').selectedIndex=obj+1;}}");
			}
			
			k = 0;
			for(PhongBanModel model : PhongBanDAO.getAllPhongBan()){
				if(request.getParameter("maPhongBan")!=null && request.getParameter("maPhongBan")!=""){
					if(model.getMaPhongBan().equals(request.getParameter("maPhongBan"))){
						outT = "document.getElementById('cbPhongBan').selectedIndex = "+ ++k +";";
					}	
				}
				out.print("var option= new Option('"+model.getKiHieu()+"','"+model.getMaPhongBan()+"');");
				out.print("document.getElementById('cbPhongBan').add(option,null);");
				k++;
			}
			out.print(outT);
			
			k = 0;
			outT = "";
			for(LoaiThietBiModel model : LoaiThietBiDAO.getAllLoaiThietBi()){
				if(request.getParameter("maLoaiThietBi")!=null && request.getParameter("maLoaiThietBi")!=""){
					if(model.getMaLoaiThietBi().equals(request.getParameter("maLoaiThietBi"))){
						outT = "document.getElementById('cbLoaiThietBi').selectedIndex = "+ ++k +";"; 		
					}
				}
				out.print("var option= new Option('"+model.getTenLoaiThietBi()+"','"+model.getMaLoaiThietBi()+"');");
				out.print("document.getElementById('cbLoaiThietBi').add(option,null);");
				k++;
			}
			out.print(outT);
		%>
		
	}
	
	function selectBoPhan(){
		var cbMaBoPhan = document.getElementById("cbBoPhan").value;
		document.getElementById("cbPhongBan").innerHTML = null;

		if(cbMaBoPhan==""){
			var option = new Option("Chọn","");
			document.getElementById("cbPhongBan").add(option,null);
			<%
				for(PhongBanModel model : PhongBanDAO.getAllPhongBan()){
					out.print("var option= new Option('"+model.getKiHieu()+"','"+model.getMaPhongBan()+"');");
					out.print("document.getElementById('cbPhongBan').add(option,null);");
				}
			%>
			document.getElementById("cbLoaiThietBi").innerHTML = null;
			var option = new Option("Chọn","");
			document.getElementById("cbLoaiThietBi").add(option,null);
			<%
				for(LoaiThietBiModel model : LoaiThietBiDAO.getAllLoaiThietBi()){
					out.print("var option= new Option('"+model.getTenLoaiThietBi()+"','"+model.getMaLoaiThietBi()+"');");
					out.print("document.getElementById('cbLoaiThietBi').add(option,null);");
				}
			%>
			return;
		}
		document.getElementById("cbPhongBan").innerHTML = null;
		for ( var obj in listBoPhan) {
			if(listBoPhan[obj].maBoPhan==cbMaBoPhan){
				document.getElementById("cbPhongBan").add(new Option("Chọn",""));
				for ( var obj2 in listBoPhan[obj].listPhongBan) {
					var option = new Option(listBoPhan[obj].listPhongBan[obj2].tenPhongBan,listBoPhan[obj].listPhongBan[obj2].maPhongBan);
					document.getElementById("cbPhongBan").add(option,null);
				}
				selectPhongBan();
				break;
			}
		}
	}
	
	function selectPhongBan(){
		var cbMaPhongBan = document.getElementById("cbPhongBan").value;
		var cbMaBoPhan = document.getElementById("cbBoPhan").value;
		if(cbMaBoPhan=="" && cbMaPhongBan!="") return;
		document.getElementById("cbLoaiThietBi").innerHTML = null;
		if(cbMaPhongBan=="") {
			var option = new Option("Chọn","");
			document.getElementById("cbLoaiThietBi").add(option,null);
			<%
				for(LoaiThietBiModel model : LoaiThietBiDAO.getAllLoaiThietBi()){
					out.print("var option= new Option('"+model.getTenLoaiThietBi()+"','"+model.getMaLoaiThietBi()+"');");
					out.print("document.getElementById('cbLoaiThietBi').add(option,null);");
				}
			%>
			return;
		}
		for (var obj in listBoPhan){
			if(listBoPhan[obj].maBoPhan==cbMaBoPhan){
				for ( var obj2 in listBoPhan[obj].listPhongBan) {
					if(listBoPhan[obj].listPhongBan[obj2].maPhongBan==cbMaPhongBan){
						document.getElementById("cbLoaiThietBi").add(new Option("Chọn",""));
						for ( var obj3 in listBoPhan[obj].listPhongBan[obj2].listLoaiThietBi) {
							var option = new Option(listBoPhan[obj].listPhongBan[obj2].listLoaiThietBi[obj3].tenLoaiThietBi,listBoPhan[obj].listPhongBan[obj2].listLoaiThietBi[obj3].maLoaiThietBi);
							document.getElementById("cbLoaiThietBi").add(option,null);
						}
						break;		
					}
				}
				break;
			}
			
		}
	}
	
	function timKiem(){
		var maBoPhan = document.getElementById("cbBoPhan").value;
		var maPhongBan = document.getElementById("cbPhongBan").value;
		var maLoaiThietBi = document.getElementById("cbLoaiThietBi").value;
		var maTinhTrang = document.getElementById("cbTinhTrang").value;
		var maHienTrang = document.getElementById("cbHienTrang").value;
		var gioBD = document.getElementById("cbGioBD").value;
		var phutBD = document.getElementById("cbPhutBD").value;
		var gioKT = document.getElementById("cbGioKT").value;
		var phutKT = document.getElementById("cbPhutKT").value;
		var ngayBD = document.getElementById("txtNgayBD").value;
		var ngayKT = document.getElementById("txtNgayKT").value;
		location.href="<%=request.getContextPath() %>/QuanLyThietBi/ThietBi/DanhSachThietBi.jsp?maBoPhan="+maBoPhan
		+"&maPhongBan="+maPhongBan
		+"&maLoaiThietBi="+maLoaiThietBi
		+"&maTinhTrang="+maTinhTrang
		+"&maHienTrang="+maHienTrang
		+"&gioBD="+gioBD
		+"&phutBD="+phutBD
		+"&gioKT="+gioKT
		+"&phutKT="+phutKT
		+"&ngayBD="+ngayBD
		+"&ngayKT="+ngayKT;
	}
	
	function reSet(){
		document.getElementById("cbBoPhan").value = "";
		document.getElementById("cbPhongBan").value = "";
		document.getElementById("cbLoaiThietBi").value = "";
		document.getElementById("cbTinhTrang").value = "";
		document.getElementById("cbHienTrang").value = "";
		document.getElementById("cbGioBD").value = "";
		document.getElementById("cbPhutBD").value = "";
		document.getElementById("cbGioKT").value = "";
		document.getElementById("cbPhutKT").value = "";
		document.getElementById("txtNgayBD").value = "";
		document.getElementById("txtNgayKT").value = "";
	}

	function btnMuon()
	{
		document.getElementById("actionType").value = "DanhSachMuonThietBi";
		document.forms["formThietBi"].submit();
	}
</script>
</head>
<body onload="loadData()">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>
	<form action="<%=request.getContextPath()%>/ThietBiController" name  = "formThietBi" id = "formThietBi" method="post">
		<input name="actionType" id="actionType" value="actionType" type="hidden" />
		<%			
			if(String.valueOf(request.getAttribute("error")).equals("1"))
			{
				out.println("<font style='color:red; font-size:13px; font-weight:bold;'>Vui lòng check chọn các thiết bị cần mượn.</font>");
			}
			if(String.valueOf(request.getAttribute("FlagMuonThietBi")).equals("1"))
			{
				%>
				<script language="javascript">
					alert("Bạn đã mượn thiết bị thành công");
					window.location = "QuanLyThietBi/ThietBi/DanhSachThietBi.jsp";
				</script>
				<%				
			}
		%>
		<table>
			<tr style="background-color: transparent;">
				<td colspan="9">
					<div class = "div_thanhvientieude">Danh Sách Các Thiết Bị</div>
				</td>
			</tr>
		</table>
	
		<table border='1' style="background-color: transparent;">
			<tr>
				<td>
					Khoa/TT
					<select id="cbBoPhan" name="cbBoPhan" onchange="selectBoPhan()"></select> 
				</td>
				<td>
					Phòng 
					<select id="cbPhongBan" name="cbPhongBan" onchange="selectPhongBan()"></select>	
				</td>
				<td>
					Loại Thiết Bị
					<select id="cbLoaiThietBi" name="cbLoaiThietBi"></select>
				</td>
			</tr>
			<tr>
				<td>Tình Trạng
					<select id="cbTinhTrang" name="cbTinhTrang">
						<option value="">Chọn</option>
						<option value="0" <c:if test="${param.maTinhTrang eq '0'}">selected</c:if>>Tốt</option>
						<option value="1" <c:if test="${param.maTinhTrang eq '1'}">selected</c:if>>Hỏng</option>
						<option value="2" <c:if test="${param.maTinhTrang eq '2'}">selected</c:if>>Bảo Trì</option>
						<option value="3" <c:if test="${param.maTinhTrang eq '3'}">selected</c:if>>Bảo Hành</option>
					</select>
				</td>
				<td colspan="2">
					Vào lúc
					<select id="cbGioBD" name="cbGioBD">
						<option value="">Chọn</option>
						<c:forEach var="n" begin="0" end="23" step="1">
							<option <c:if test="${param.gioBD eq n}">selected</c:if> value="${n }">${n}</option>
						</c:forEach>
					</select>
					:
					<select id="cbPhutBD" name="cbPhutBD">
						<option value="">Chọn</option>
						<c:forEach var="n" begin="0" end="59" step="1">
							<option <c:if test="${param.phutBD eq n}">selected</c:if> value="${n }">${n}</option>
						</c:forEach>
					</select>
					đến
					<select id="cbGioKT" name="cbGioKT">
						<option value="">Chọn</option>
						<c:forEach var="n" begin="0" end="23" step="1">
							<option <c:if test="${param.gioKT eq n}">selected</c:if> value="${n }">${n}</option>
						</c:forEach>
					</select>
					:
					<select id="cbPhutKT" name="cbPhutKT">
						<option value="">Chọn</option>
						<c:forEach var="n" begin="0" end="59" step="1">
							<option <c:if test="${param.phutKT eq n}">selected</c:if> value="${n }">${n}</option>
						</c:forEach>
					</select>
					<input type="button" value="Reset" onclick="reSet();"/> 
				</td>		
			</tr>
			<tr>				
				<td>Hiện Trạng
					<select id="cbHienTrang" name="cbHienTrang">
						<option value="">Chọn</option>
						<option value="0" <c:if test="${param.maHienTrang eq '0'}">selected</c:if>>Rãnh</option>
						<option value="1" <c:if test="${param.maHienTrang eq '1'}">selected</c:if>>Bận</option>
					</select>
				</td>
				<td colspan="2">
					Từ ngày 
					<input type="text" id="txtNgayBD" name="txtNgayBD" value="${param.ngayBD }"/>
					đến
					<input type="text" id="txtNgayKT" name="txtNgayKT" value="${param.ngayKT }"/>
					<input type="button" value="Tìm Kiếm" onclick="timKiem();"/>
				</td>
			</tr>
		</table>		
		
		<%
			String pages = "1";
			if(request.getParameter("page")!=null){
				pages = request.getParameter("page");
			}		
		 %>
			
		
		<c:set var="listThietBi" value='<%=ThietBiDAO.getDanhSachThietBi(request.getParameter("maPhongBan"),request.getParameter("maBoPhan"),request.getParameter("maLoaiThietBi"),request.getParameter("maTinhTrang"),
		request.getParameter("maHienTrang"),request.getParameter("gioBD"),request.getParameter("phutBD"),request.getParameter("gioKT"),request.getParameter("phutKT"),DateUtil.changeDMYtoMDY(request.getParameter("ngayBD")),DateUtil.changeDMYtoMDY(request.getParameter("ngayKT")),pages,Constant.NUM_RECORD_THIETBI) %>'></c:set>
		<c:set var="NUM_RECORD_THIETBI" value='<%=Constant.NUM_RECORD_THIETBI %>'></c:set>
		<table border="1">
			<tr>
				<th bgcolor = "#186fb2">
					<div class = "div_textWhite">
						<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"></input>
					</div>
				</th>
				<th style='background-color: #186fb2;color:white'>STT</th>
				<th style='background-color: #186fb2;color:white'>Loại thiết bị</th>
				<th style='background-color: #186fb2;color:white'>Mã</th>
				<th style='background-color: #186fb2;color:white'>Kí Hiệu</th>
				<th style='background-color: #186fb2;color:white'>Tên Thiết Bị</th>
				<th style='background-color: #186fb2;color:white'>Vị Trí Lắp Đặt</th>
				<th style='background-color: #186fb2;color:white'>Tình trạng</th>
				<th style='background-color: #186fb2;color:white'>Hiện trạng</th>
			</tr>
			<c:set var="stt" value="1"></c:set>
			<c:forEach var="thietBi" items="${listThietBi.danhSachThietBi}">
				<tr>
					<td><!--<input type="checkbox" name="maThietBi${stt }" id="maThietBi${stt }"/>--><input type="checkbox" value="${thietBi.maThietBi}" name="ckbox" id="ckbox" /></td>

					<td>${stt}</td>
					<td>${thietBi.tenLoaiThietBi }</td>
					<td>${thietBi.ma }</td>
					<td>${thietBi.kiHieu }</td>
					<td>${thietBi.tenThietBi }</td>
					<td>${thietBi.tenPhongBan }</td>
					<td>${thietBi.tenTinhTrang }</td>
					<td>${thietBi.tenHienTrang }</td>
				</tr>
				<c:set var="stt" value="${stt+1}"></c:set>
			</c:forEach>	
		</table>
		
		<c:choose>
			<c:when test="${listThietBi.tongSoThietBi/NUM_RECORD_THIETBI gt 1}">
				<c:forEach var="i" begin="1" end="${listThietBi.tongSoThietBi/NUM_RECORD_THIETBI}" step="1">
					<a href="<%=request.getContextPath() %>/QuanLyThietBi/ThietBi/DanhSachThietBi.jsp?page=${i}
					&maBoPhan=${param.maBoPhan }&maPhongBan=${param.maPhongBan }&maLoaiThietBi=${param.maLoaiThietBi }
					&tinhTrang=${param.tinhTrang }&hienTrang=${param.hienTrang }&gioBD=${param.gioBD }&phutBD=${param.phutBD }
					&gioKT=${param.gioKT }&phutKT=${param.phutKT }&ngayBD=${param.ngayBD }&ngayKT=${param.ngayKT }">${i }</a>
				</c:forEach>
			</c:when>
		</c:choose>
		<br />
		<input type="button" value="Mượn" onclick="return btnMuon();" />
	</form>	
	<br/>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
<script type="text/javascript">
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtNgayBD",
	button            : "txtNgayBD",
	ifFormat          : "%d-%m-%Y"
  });
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtNgayKT",
	button            : "txtNgayKT",
	ifFormat          : "%d-%m-%Y"
  });
 </script>

</body>
</html>