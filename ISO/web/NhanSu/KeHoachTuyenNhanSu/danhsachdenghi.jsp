<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import="vn.edu.hungvuongaptech.dao.DeNghiNhanSuDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm Đề Nghị Vào Kế Hoạch</title>
<c:set var="listDeNghi" value='<%=DeNghiNhanSuDAO.getDanhSachDeNghi(request.getParameter("id")) %>' ></c:set>
<c:set var="n" value="1"></c:set>
<c:set var="maKeHoach" value="${param.id}"></c:set>

<script language="javascript" type="text/javascript">
	<%
		if(request.getAttribute("close")!=null){
			out.print(request.getAttribute("close"));
		}
	%>
	function checkall(){
		var max = document.getElementById("max").value;
		if(document.getElementById("allcheck").checked==true){
			for(var n=1;n<=max;n++){
				document.getElementById("txtMaDeNghi"+n).checked = true;
			}
		}
		else{
			for(var n=1;n<=max;n++){
				document.getElementById("txtMaDeNghi"+n).checked = false;
			}
		}
		
	}
	
	function submitForm(){
		document.getElementById("action").value = 'insert';
		document.forms["dsDeNghi"].submit();
	}
	
</script>
</head>
<body>
<div align="center">
	<form action="<%=request.getContextPath() %>/chiTietKHTNSController" method="post" name="dsDeNghi">
		<table border="1">
			<tr>
				<th><input type="checkbox" id="allcheck" name="allcheck" onchange="checkall()"/></th>
				<th style="width: 150px;">Chức Danh</th>
				<th style="width: 100px;">Số Lượng</th>
				<th style="width: 200px;">Bộ Phận</th>
				<th style="width: 200px;">Người Lập</th>
				<th style="width: 120px;">Ngày Lập</th>
			</tr>
			<c:forEach var="model" items="${listDeNghi}"> 
				<tr>
					<td><input type="checkbox" id="txtMaDeNghi${n }" name="txtMaDeNghi${n }" value="${model.id }" /></td>
					<td style="text-align: left;padding-left: 5px;">${model.chuc_danh }
						<c:if test="${model.bo_sung ne '0'}">
							( ${model.bo_sung } )
						</c:if>
					</td>
					<td style="text-align: center;">${model.so_luong }</td>
					<td style="text-align: left;padding-left: 5px;">${model.ma_bo_phan }</td>
					<td style="text-align: left;padding-left: 5px;">${model.nguoi_de_nghi }</td>
					<td style="text-align: center;">${model.ngay_lap }</td>
				</tr>
				<c:set var="n" value="${n+1}"></c:set>
			</c:forEach>
		</table>
		<input type="hidden" id="max" name="max" value="${fn:length(listDeNghi)}" />
		<input type="hidden" name="txtMaKeHoach" value="${maKeHoach }">
		<input type="hidden" id="action" name="action" />
		<a style="text-decoration: none;" href="javascript: submitForm();" ><img src="<%=request.getContextPath()%>/images/buttom/capnhat2.png" alt="Thêm" border = "0"/></a>
	</form>
</div>
</body>
</html>