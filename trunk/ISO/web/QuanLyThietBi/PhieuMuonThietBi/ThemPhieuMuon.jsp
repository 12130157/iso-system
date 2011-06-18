<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.model.ThanhVienModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThanhVienDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.LopHocModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.LopHocDAO"%>
<%@page import="vn.edu.hungvuongaptech.util.DateUtil"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<title>Thêm phiếu mượn</title>
<script type="text/javascript">
<%
	ArrayList<PhieuMuonThietBiModel> phieuMuonList = PhieuMuonThietBiDAO.getAllPhieuMuonHienTai();
%>
function pageLoad()
{
	<%
	 String ngay = DateUtil.setDate(SysParamsDAO.getNgayGioHeThong().getNgayHeThong());
		if(request.getParameter("ThemPhieuMuon") != null) {
			if(request.getParameter("ThemPhieuMuon").equals("ok")) {
				out.print("alert('Thêm phiếu mượn thành công');");
				out.print("window.returnValue = 'ok';");
				out.print("window.close();");
			}
			else
				out.print("alert('Thêm phiếu mượn thất bại');");
		}
	%>
}
function themThietBi()
{
	var check = true;

	if(document.getElementById('cboNguoiMuon').value == "")
		alert("Hãy chọn người mượn !!!");
	else 
	{
		<%
			for(int i=0;i<phieuMuonList.size();i++) {
				out.print("if(document.getElementById('cboNguoiMuon') == '" + phieuMuonList.get(i).getMaNguoiMuon() + "') {");
				out.print("alert('Giáo viên này hôm nay đã có phiếu mượn!!!');");
				out.print("check = false;}");
			}
		%>
		if(check == true)
		{
			document.getElementById('actionType').value = 'ThemPhieuMuon';
			document.getElementById('formThemPhieuMuon').submit();
		}
	}
}

</script>
</head>
<body onload="pageLoad()">
<form id = "formThemPhieuMuon" method="post" action="<%=request.getContextPath()%>/phieuMuonController">
<p align="center">
	<c:set var = "listNguoiMuon" value = "<%= ThanhVienDAO.getAllGiaoVienOrderByTen()%>"/>
	<c:set var = "listLop" value = "<%= LopHocDAO.getAllKiHieuLop()%>"/>
	
		<input type = "hidden" name = "actionType" id = "actionType"/>
		<table border="1">
			<tr style="background-color: transparent;">
				<td >
					<div style="font-weight: bold; font-style: inherit; color: blue;" align="center">Thêm phiếu mượn thiết bị</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>Người mượn :
					<select id = "cboNguoiMuon" name="cboNguoiMuon">
						<option value = "">  ---  Chọn tên  ---  </option>
						<c:forEach var = "NguoiMuon" items="${listNguoiMuon}">
							<option value = "${NguoiMuon.maThanhVien}" 
								<c:if test = "${param.nguoiMuon eq NguoiMuon.maThanhVien}">selected</c:if>>${NguoiMuon.hoThanhVien} ${NguoiMuon.tenLot} ${NguoiMuon.tenThanhVien }</option>
						</c:forEach>
					</select>
					Ngày mượn :
					<input type="text" id = "txtNgayMuon" name = "txtNgayMuon" value = "<%=ngay %>"/>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td >
					Ghi chú :<br/>
					<textarea rows="5" cols="50" name = "txtGhiChu" id = "txtGhiChu"></textarea>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align="center">
					<a href="javascript: themThietBi()">
						<img alt="Thêm phiếu mượn thiết bị" src=""/>
					</a>
				</td>
			</tr>
		</table>
		</p>
	</form>
<script>
	//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtNgayMuon",
	button            : "Calendar",
	ifFormat          : "%m-%d-%Y"
  });
//]]>
</script>	
</body>
</html>