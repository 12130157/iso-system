<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>

<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>

<!--[if lt IE 7]>
 <style type="text/css">
 div, img { behavior: url("<%=request.getContextPath()%>/css/iepngfix.htc") }
 </style>
<![endif]-->
<title>Giáo án chưa thực hiện</title>
<script>
	function showPopUp(x)
	{
		 var myObject = new Object();
		 myObject.valueContent = document.getElementById(x).innerHTML;
		 myObject.titleContent =mapTieuDeByID(x); 
		 myObject.quyen="true";
		 myObject.maLoai=mapMaLoaiByID(x);
		height=450;
		width=650;	
		z=(window.screen.width-width)/2;
		y=(window.screen.height-height)/2;
		value = window.showModalDialog("NhapText.jsp",myObject,"dialogHeight: "+height+"px; dialogWidth: "+width+"px; dialogTop:"+y+"px; dialogLeft:"+z+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
		if(value!=false&&value!=undefined)
			document.getElementById(x).innerHTML=value;		
	}

	function submitForm(){
		document.getElementById("actionType").value="GAChuaTH";		
		document.forms['GiaoAn'].submit();	
	}

	function mapTieuDeByID(x){
		if(x.substr(0,10)=="txtLT_CCKT")
		{
			return "Củng cố kiến thức";	
		}
		else if(x.substr(0,10)=="txtLT_HDTH")
		{
			return "Hướng dẫn tự học";	
		}
		else if(x.substr(0,10)=="txtLT_TLTK")
		{
			return "Tài liệu tham khảo";	
		}
		else if(x.substr(0,13)=="txtLT_DanNhap"){
			return "Dẫn nhập";
		}
		else if(x.substr(0,10)=="txtTH_HDBD")
		{
			return "Hướng dẫn ban đầu";	
		}
		else if(x.substr(0,13)=="txtTH_DanNhap")
		{
			return "Dẫn nhập";	
		}
		else if(x.substr(0,10)=="txtTH_HDRL")
		{
			return "Hướng dẫn rèn luyện";	
		}
		else if(x.substr(0,10)=="txtTH_HDKT")
		{
			return "Hướng dẫn kết thúc";	
		}
		else if(x.substr(0,12)=="txtTHop_HDKT")
		{
			return "Hướng dẫn kết thúc";	
		}
		else if(x.substr(0,15)=="txtTHop_DanNhap")
		{
			return "Dẫn nhập";	
		}
		else if(x.substr(0,12)=="txtTHop_HDTH")
		{
			return "Hướng dẫn tự học";	
		}
		else
			return "";
	}
	function mapMaLoaiByID(x){
		if(x.substr(0,10)=="txtLT_CCKT")
		{
			return "<%=Constant.MALOAI_CUNGCOKIENTHUCVAKETTHUCBAI%>";	
		}
		else if(x.substr(0,10)=="txtLT_HDTH")
		{
			return "<%=Constant.MALOAI_HUONGDANTUHOC1%>";	
		}
		else if(x.substr(0,10)=="txtLT_TLTK")
		{
			return "<%=Constant.MALOAI_TAILIEUTHAMKHAO%>";	
		}
		else if(x.substr(0,10)=="txtTH_HDBD")
		{
			return "<%=Constant.MALOAI_HUONGDANBANDAU%>";	
		}
		else if(x.substr(0,10)=="txtTH_HDRL")
		{
			return "<%=Constant.MALOAI_HUONGDANRENLUYEN%>";	
		}
		else if(x.substr(0,10)=="txtTH_HDKT")
		{
			return "<%=Constant.MALOAI_HUONGDANKETTHUC%>";	
		}
		else if(x.substr(0,12)=="txtTHop_HDKT")
		{
			return "<%=Constant.MALOAI_HUONGDANKETTHUC%>";	
		}
		else if(x.substr(0,12)=="txtTHop_HDTH")
		{
			return "<%=Constant.MALOAI_HUONGDANTUHOC1%>";	
		}
		else
			return "";
		
	}

</script>


</head>

<body>
<c:set var="objKHGD" value='<%=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(request.getParameter("maKHGD")) %>'></c:set>
<c:set var="listGALT" value='<%=GiaoAnDAO.getGiaoAnLTByMaKHGDChuaXong(request.getParameter("maKHGD")) %>'></c:set>
<c:set var="listGATH" value='<%=GiaoAnDAO.getGiaoAnThucHanhByMaKHGDChuaXong(request.getParameter("maKHGD")) %>'></c:set>
<c:set var="listGATHop" value='<%=GiaoAnDAO.getGiaoAnTichHopByMaKHGDChuaXong(request.getParameter("maKHGD")) %>'></c:set>


<div align="center";>
			<!-- S HEAD CONTENT -->
					<jsp:include page="../../block/header.jsp" />
			<!-- E HEAD CONTENT -->
			 <b style='font-size:15px'>${objKHGD.tenKHGD }</b><br/><br/>
			<b style='font-size:18px'>GIÁO ÁN CHƯA THỰC HIỆN:</b> <br/><br/>
			
		<c:if test="${param.err eq 'updateTC'}">
			<b class="msg" id="bAlert">Cập nhật giáo án thành công</b>
		</c:if>		
		<br/>
		<br/>
<form action="<%=request.getContextPath()%>/GiaoAnController" method="post" name="GiaoAn">
		<input type='hidden' id='actionType' name='actionType'/>
		<input type='hidden' id='maKHGD' name='maKHGD' value="${param.maKHGD }"/>
				<%int count=0;%>
			<table width="600px" border="1" style="background-color:transparent;">
				<tr align="left"><th  align="left" colspan="5" style="padding-left:20px;padding-bottom:10px;padding-top:10px">Giáo án lý thuyết</th></tr>
				<tr style="background-color: transparent;color:white">
					<th width="100px" bgcolor="#186fb2">Giáo án số</th>
					<th bgcolor="#186fb2" >Dẫn nhập</th>
					<th bgcolor="#186fb2" >Củng cố kiến thức và kết thúc bài</th>
					<th bgcolor="#186fb2" >Hướng dẫn tự học</th>
					<th bgcolor="#186fb2" >Nguồn tài liệu tham khảo</th>
				</tr>
				<c:forEach items="${listGALT}" var="objLT">
					<tr>
						<td>${objLT.soGiaoAn} <input type='hidden' value='${objLT.maGiaoAn }' name='txtLT_MaGA_<%=count %>' id='txtLT_MaGA_<%=count %>'/>
								<br/>Tên bài: <br/>
								<b>${objLT.tenChuong}</b> 
								
						</td>
						<td><textarea onclick="showPopUp(this.id)" id="txtLT_DanNhap_<%=count %>" name="txtLT_DanNhap_<%=count %>" rows="2" cols="10" <c:if test="${objLT.danNhap ne ''}">style="background-color:transparent;"</c:if> <c:if test="${objLT.danNhap eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objLT.danNhap)}</textarea></td>
						<td><textarea onclick="showPopUp(this.id)" id="txtLT_CCKT_<%=count %>" name="txtLT_CCKT_<%=count %>" rows="2" cols="10" <c:if test="${objLT.cungCoKienThuc ne ''}">style="background-color:transparent;"</c:if> <c:if test="${objLT.cungCoKienThuc eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objLT.cungCoKienThuc)}</textarea></td>
						<td><textarea onclick="showPopUp(this.id)" id="txtLT_HDTH_<%=count %>" name="txtLT_HDTH_<%=count %>" rows="2" cols="10" <c:if test="${objLT.huongDanTuHoc ne ''}">style="background-color:transparent;"</c:if> <c:if test="${objLT.huongDanTuHoc eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objLT.huongDanTuHoc)}</textarea></td>
						<td><textarea onclick="showPopUp(this.id)" id="txtLT_TLTK_<%=count %>" name="txtLT_TLTK_<%=count %>" rows="2" cols="10" <c:if test="${objLT.taiLieuThamKhao ne ''}">style="background-color:transparent;"</c:if> <c:if test="${objLT.taiLieuThamKhao eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objLT.taiLieuThamKhao)}</textarea></td>
						
					</tr>
					<%count++; %>
				</c:forEach>
			</table>
				<input type='hidden' name='lengthLT' value='<%=count %>'/>
			
			<table width="600px" border="1" style="background-color:transparent;">
				<tr align="left"><th align="left" colspan="5" style="padding-left:20px;padding-bottom:10px;padding-top:10px">Giáo án thực hành</th></tr>
				<tr style="background-color: transparent;color:white">
					<th width="100px" bgcolor="#186fb2">Giáo án số</th>
					<th bgcolor="#186fb2" >Dẫn nhập</th>
					<th bgcolor="#186fb2" >Hướng dẫn ban đầu</th>
					<th bgcolor="#186fb2" >Hướng dẫn kết thúc</th>
					<th bgcolor="#186fb2" >Hướng dẫn rèn luyện</th>
				</tr>		
				<%count=0; %>
				<c:forEach items="${listGATH}" var="objTH">
					<tr>
						<td>${objTH.soGiaoAn} <input type='hidden' value='${objTH.maGiaoAn }' name='txtTH_MaGA_<%=count %>' id='txtTH_MaGA_<%=count %>'/>
							<br/>Tên bài: <br/>
								
								<b>${objTH.tenChuong}</b>
						</td>
						<td><textarea onclick="showPopUp(this.id)" rows="2" cols="10" name="txtTH_DanNhap_<%=count %>" id="txtTH_DanNhap_<%=count %>" <c:if test="${objTH.danNhap ne ''}">style="background-color:transparent;"</c:if> <c:if test="${objTH.danNhap eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objTH.danNhap)}</textarea></td>
						
						<td><textarea onclick="showPopUp(this.id)" rows="2" cols="10" name="txtTH_HDBD_<%=count %>" id="txtTH_HDBD_<%=count %>" <c:if test="${objTH.huongDanBanDau ne ''}">style="background-color:transparent;"</c:if> <c:if test="${objTH.huongDanBanDau eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objTH.huongDanBanDau)}</textarea></td>
						<td><textarea onclick="showPopUp(this.id)" rows="2" cols="10" name="txtTH_HDKT_<%=count %>" id="txtTH_HDKT_<%=count %>" <c:if test="${objTH.huongDanKetThuc ne ''}">style="background-color:transparent;"</c:if> <c:if test="${objTH.huongDanKetThuc eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objTH.huongDanKetThuc)}</textarea></td>
						<td><textarea onclick="showPopUp(this.id)" rows="2" cols="10" name="txtTH_HDRL_<%=count %>" id="txtTH_HDRL_<%=count %>" <c:if test="${objTH.huongDanRenLuyen ne ''}">style="background-color:transparent;"</c:if> <c:if test="${objTH.huongDanRenLuyen eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objTH.huongDanRenLuyen)}</textarea></td>
					</tr>
					<% count++; %>
				</c:forEach>
			</table>
				<input type='hidden' name='lengthTH' value='<%=count %>'/>
			
			<table width="600px" border="1" style="background-color:transparent;">
				<tr align="left"><th align="left" colspan="4" style="padding-left:20px;padding-bottom:10px;padding-top:10px">Giáo án tích hợp</th></tr>
				<tr  style="background-color: transparent;color:white">
					<th width="100px" bgcolor="#186fb2" >Giáo án số</th>
					<th bgcolor="#186fb2" >Dẫn nhập</th>
					<th bgcolor="#186fb2" >Kết thúc vấn đề</th>
					<th bgcolor="#186fb2" >Hướng dẫn tự học</th>
				</tr>
				<%count=0; %>
				<c:forEach items="${listGATHop}" var="objTHop">
					<tr>
						<td>${objTHop.soGiaoAn} <input type='hidden' value='${objTHop.maGiaoAn }' name='txtTHop_MaGA_<%=count %>' id='txtTHop_MaGA_<%=count %>'/>
							<br/> Tên bài: <br/>
								<b>${objTHop.tenChuong}</b>
						</td>
						<td><textarea onclick="showPopUp(this.id)" rows="2" cols="10" name="txtTHop_DanNhap_<%=count %>" id="txtTHop_DanNhap_<%=count %>" <c:if test="${objTHop.danNhap ne ''}">style="background-color:transparent;"</c:if><c:if test="${objTHop.danNhap eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objTHop.danNhap)}</textarea></td>
					
						<td><textarea onclick="showPopUp(this.id)" rows="2" cols="10" name="txtTHop_HDKT_<%=count %>" id="txtTHop_HDKT_<%=count %>" <c:if test="${objTHop.huongDanKetThuc ne ''}">style="background-color:transparent;"</c:if><c:if test="${objTHop.huongDanKetThuc eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objTHop.huongDanKetThuc)}</textarea></td>
						<td><textarea onclick="showPopUp(this.id)" rows="2" cols="10" name="txtTHop_HDTH_<%=count %>" id="txtTHop_HDTH_<%=count %>" <c:if test="${objTHop.huongDanTuHoc ne ''}">style="background-color:transparent;"</c:if><c:if test="${objTHop.huongDanTuHoc eq ''}">style="background-color:red;cursor:pointer"</c:if>>${sf:appendBrTag2(objTHop.huongDanTuHoc)}</textarea></td>
					</tr>
					<%count++; %>
				</c:forEach>
			</table>
				<input type='hidden' name='lengthTHop' value='<%=count %>'/>
			
			<br/>
				<img src="<%=request.getContextPath()%>/images/buttom/capnhat.png" style="cursor:pointer;"  onclick="submitForm()"/>
							
			
</form>


<br/>
			<!-- S FOOT CONTENT -->
					<jsp:include page="../../block/footer.jsp" />
			<!-- E FOOT CONTENT -->
			
			
	
	</div>
</body>
</html>