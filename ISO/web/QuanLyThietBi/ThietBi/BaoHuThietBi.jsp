<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThietBiDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ThietBiModel"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BAO HU THIET BI</title>
<script type="text/javascript">
<%
	String[] listMaThietBi = ((String)request.getParameter("listMaThietBi")).split("-");
	ArrayList<ThietBiModel> thietBiList = new ArrayList<ThietBiModel>();
	for(int i=1;i<listMaThietBi.length;i++) {
		ThietBiModel thietBi = ThietBiDAO.getThietBiBaoHuByID(listMaThietBi[i]);
		thietBiList.add(thietBi);
	}
	int count = 0;
%>

</script>
</head>
<body>

	<c:set var = "ThietBiList" value = "<%=thietBiList %>"/>
	<table width="700">
			<tr style="background-color: transparent;">
				<td >
					<div style="font-weight: bold; font-style: inherit; color: blue;" align="center">Báo hư thiết bị</div>
				</td>
			</tr>
	</table>
	
	<table  border="1" width="700">		
			<tr style="background-color: transparent; background-color: blue">
				<td>STT</td>
				<td>Tên thiết bị/Kí hiệu thiết bị</td>
				<td>Tên linh kiện/Kí hiệu linh kiện</td>
				<td></td>
				<td></td>
			</tr>
		<c:forEach var = "ThietBi" items="${ThietBiList}">	
			<% 
				int count1 = 0; 
				count++;
			%>
			<tr style="background-color: transparent;">
				<c:set var = "LinhKienList" value = "${ThietBi.chiTietThietBiList}"/>
				<td rowspan="<%=count1 %>"><%=count %></td>
				<td rowspan="<%=count1 %>">
					${ThietBi.tenThietBi }/${ThietBi.kiHieu }
					<input type = "hidden" id = "txtMaThietBi<%=count%>" value = "${ThietBi.maThietBi }"/>
				</td>
				<td>
					<c:if test = "${not empty ThietBi.chiTietThietBiList[0].maChiTietThietBi}">
						${ThietBi.chiTietThietBiList[0].tenChiTietThietBi}/${ThietBi.chiTietThietBiList[0].kiHieu}
						<input type = "hidden" id = "txtMaLinhKien<%=count %>_1" value = "${ThietBi.chiTietThietBiList[0].maChiTietThietBi }"/>
					</c:if>
				</td>
				<td width="20"><input type = "checkbox" id = "chk<%=count %>_1" name = ""/></td>
				<td width="20" rowspan="<%=count1 %>"><input type = "checkbox" id = "chk<%=count %>" name = "" onclick="checkAll(<%=count%>, <%=count1 %>);"/></td>
			</tr>
			<c:forEach var = "count" begin = "2" end="<%=count1 %>">
				<td>
					${LinhKienList[count-1].tenChiTietThietBi}/${LinhKienList[count-1].kiHieu}
					<input type = "hidden" id = "txtMaLinhKien<%=count %>_${count}" value = "${LinhKien.maChiTietThietBi }"/>
				</td>
				<td width="20"><input type = "checkbox" id = "chk${ThietBi.maThietBi}_${count}" name = ""/></td>
			</c:forEach>
		</c:forEach>	
		</table>
		<p align="center">
			<input type = "button" value = "Xác nhận" onclick = "traVe();"/>
			<input type = "button" value = "Đóng" onclick = "closeWindow();"/>
		</p>
<script type="text/javascript">
function checkAll(x, countLinhKien)
{
	if(document.getElementById('chk' + x).checked == true)
	{
		for(var i=1;i<=countLinhKien;i++)
			document.getElementById('chk' + x + '_' + i).checked = true;
	}
	else
	{
		for(var i=1;i<=countLinhKien;i++)
			document.getElementById('chk' + x + '_' + i).checked = false;
	}
}
function traVe()
{
	var str = "";
	<%
		for(Integer i=1;i<=count;i++) {
			out.print("str += '</>' + document.getElementById('txtMaThietBi" + i.toString() + "').value;");
			for(Integer j=1; j<=thietBiList.get(i-1).getChiTietThietBiList().size();j++) {
				out.print("if(document.getElementById('txtMaLinhKien" + i.toString() + "_" + j.toString() + "').checked == true)");
					out.print("str += '<->' + document.getElementById('txtMaLinhKien" + i.toString() + "_" + j.toString() + "').value;");
			}
		}
	%>
	if(confirm("Bạn có chắc chắn muốn báo hư những thiết bị này không???"))
	{
		window.returnValue = str;
	}
}
function closeWindow()
{
	window.close();
}
</script>		
</body>
</html>