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
<%@page import="vn.edu.hungvuongaptech.util.DateUtil"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<title>Phiếu mượn thiết bị</title>
<script language="javascript">
function fnConfirmMuon()
{
	if(check() == true){
		if(confirm("Bạn có chắc muốn mượn không ?") == true)
		{
			document.getElementById("actionType").value = "MuonThietBi";
			document.forms["formPhieuMuonThietBi"].submit();
		}	
	}
}

function check()
{
	var ngayTra = document.getElementById("txtNgayTra");
	if(ngayTra.value == ""){
		alert("Vui lòng chọn ngày trả thiết bị.");
		return false;
	}
	else
		return true;
}

</script>
</head>
<body onload="loadData()">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_QuanLyThietBi.jsp" />
	<!-- E HEAD CONTENT -->
	<br/><br/><br/>

<%
//String[] a = ((String[])request.getAttribute("abc"));
//out.println(a[0]+","+a[1]);

//lay session dang nhap
//out.println(session.getAttribute("tenDangNhap"));

ArrayList<ThietBiModel> arrThietBi = new ArrayList();
ArrayList<ThietBiModel> arrThietBiLoadLenTable = new ArrayList();
String str = "";
String[] a = ((String[])request.getAttribute("arrThietBiDuocChon"));
for(int i = 0; i < a.length; i++)
{
	//out.println(a[i]);
 	str = str + String.valueOf(a[i])+",";
	ThietBiModel model = ThietBiDAO.getThietBiInfo(Integer.parseInt(a[i]));
	//out.println(model.getIdThietBi()+", "+model.getTenLoaiThietBi()+", "+model.getTenThietBi());
	arrThietBiLoadLenTable.add(model);	
}
%><br />

	<form action="<%=request.getContextPath() %>/ThietBiController" method="post" name="formPhieuMuonThietBi" id="formPhieuMuonThietBi">
	<div style="COLOR:blue; FONT-SIZE:20PX;">PHIẾU MƯỢN THIẾT BỊ</div>
	<br />
	<input type="hidden" name="txtArrIdThietBi" id="txtArrIdThietBi" value="<% out.println(str); %>" />
	<input type="hidden" name="actionType" id="actionType" />
	<table>
		<tr style="background-color: transparent;">
			<td style="background-color: transparent;">Số phiếu</td>
			<td style="background-color: transparent; text-align:left;  width:150px"><input readonly="readonly" type="text" id="txtSoPhieu" name="txtSoPhieu" style="WIDTH:100PX;" value="<% out.println(ThietBiDAO.getSoPhieu()); %>" /></td>
			<td style="background-color: transparent;">Người mượn</td>
			<td style="background-color: transparent; text-align:left; width:180px"><input readonly="readonly" type="text" id="txtNguoiMuon" name="txtNguoiMuon" style="WIDTH:100PX;" value="<% out.println(session.getAttribute("tenDangNhap"));%>" /></td>
			<td style="background-color: transparent;">Lớp</td>
			<td style="background-color: transparent;">	
					<select style="WIDTH:100PX;" name="txtLop" id="txtLop">
						<%
							ArrayList<LopHocModel> arr = ThietBiDAO.getAllLopHoc();
							for(int i = 0; i < arr.size(); i++)
								out.println("<option value='"+arr.get(i).getMaLopHoc()+"'>"+arr.get(i).getKiHieu()+"</option>")	;					
						%>
					</select>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="background-color: transparent;">Ngày mượn</td>
			<td style="background-color: transparent; text-align:left; width:150px"><input readonly="readonly" type="text" id="txtNgayMuon" name="txtNgayMuon" style="WIDTH:100PX;" value="<% SimpleDateFormat s = new SimpleDateFormat("dd-MM-yyyy"); out.println(s.format(new Date())); %>" /></td>
			<td style="background-color: transparent;">Ngày trả</td>
			<td style="background-color: transparent;text-align:left; width:150px"><input readonly="readonly" type="text" id="txtNgayTra" name="txtNgayTra" style="WIDTH:100PX;" /></td>
			<td style="background-color: transparent;">Lúc</td>
			<td style="background-color: transparent;">	<select id="txtGio" name="txtGio">
						<script language="javascript">
							for(var i = 0; i <= 24; i++)
								document.write("<option value='"+i+"'>"+i+"</option>");
						</script>
					</select>
			giờ
					<select id="txtPhut" name="txtPhut">
						<script language="javascript">
							for(var i = 0; i <= 60; i++)
								document.write("<option value='"+i+"'>"+i+"</option>");
						</script>
					</select>
			phút
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="background-color: transparent;">Phòng</td>
			<td style="background-color: transparent;">
				<%
					ArrayList<PhongBanModel> arrPhongBanModel = new ArrayList();
					arrPhongBanModel = ThietBiDAO.getAllPhongBan();
				%>				
				<select style="WIDTH:100PX;" name="txtPhongBan" id="txtPhongBan">
					<%
					for(int i = 0; i < arrPhongBanModel.size(); i++)
						out.println("<option value='"+arrPhongBanModel.get(i).getMaPhongBan()+"'>"+arrPhongBanModel.get(i).getKiHieu()+"</option>");
					%>
				</select>
			</td>
			<td style="background-color: transparent;"></td>
			<td style="background-color: transparent;"></td>
			<td style="background-color: transparent;"></td>
			<td style="background-color: transparent;"></td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="background-color: transparent;" colspan="6">
				<input type="button" value="Mượn" name="btnMuon" id="btnMuon" onclick="return fnConfirmMuon();" />
			</td>			
		</tr>	
		<tr style="background-color: transparent;">
			<td style="background-color: transparent;" colspan="6"><br /></td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="background-color: transparent;" colspan="6">
				<font style="color:black; font-size:14px; font-weight: bold">Danh sách thiết bị được mượn</font>
			</td>		
		</tr>
		<tr style="background-color: transparent;">
			<td style="background-color: transparent;" colspan="6"><br /></td>
		</tr>
	</table>
	
	<table border="2" cellpadding="0" cellspacing="0" width="850">
		<tr style="background-color: transparent;">
			<td style="background-color: transparent; color:black; font-weight: bold">Mã thiết bị</td>
			<td style="background-color: transparent; color:black; font-weight: bold">Tên thiết bị</td>
			<td style="background-color: transparent; color:black; font-weight: bold">Mã</td>
			<td style="background-color: transparent; color:black; font-weight: bold">Kí hiệu</td>
			<td style="background-color: transparent; color:black; font-weight: bold">Loại thiết bị</td>
			<td style="background-color: transparent; color:black; font-weight: bold">Phòng</td>
			<td style="background-color: transparent; color:black; font-weight: bold">Tình trạng</td>
			<td style="background-color: transparent; color:black; font-weight: bold">Hiện trạng</td>
		</tr>
		<%
			for(int i = 0; i < arrThietBiLoadLenTable.size(); i++)
			{
				%>
				<tr style="background-color: transparent;">
					<td style="background-color: transparent;"><% out.println(arrThietBiLoadLenTable.get(i).getIdThietBi()); %></td>
					<td style="background-color: transparent;"><% out.println(arrThietBiLoadLenTable.get(i).getTenThietBi()); %></td>
					<td style="background-color: transparent;"><% out.println(arrThietBiLoadLenTable.get(i).getMa()); %></td>
					<td style="background-color: transparent;"><% out.println(arrThietBiLoadLenTable.get(i).getKiHieu()); %></td>
					<td style="background-color: transparent;"><% out.println(arrThietBiLoadLenTable.get(i).getTenLoaiThietBi()); %></td>
					<td style="background-color: transparent;"><% out.println(arrThietBiLoadLenTable.get(i).getTenPhongBan()); %></td>
					<td style="background-color: transparent;"><% out.println(arrThietBiLoadLenTable.get(i).getTenTinhTrang()); %></td>
					<td style="background-color: transparent;"><% out.println(arrThietBiLoadLenTable.get(i).getTenHienTrang()); %></td>
				</tr>				
				<%
			}
		 %>
	</table>
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
	inputField        : "txtNgayTra",
	button            : "txtNgayTra",
	ifFormat          : "%d-%m-%Y"
  });
 </script>

</body>
</html>