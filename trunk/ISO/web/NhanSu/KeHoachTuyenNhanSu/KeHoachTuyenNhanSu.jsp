<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.DeNghiNhanSuDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.DeNghiNhanSuModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachTuyenNhanSuDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.ChiTietKHTNSModel"%>
<%@page import="vn.edu.hungvuongaptech.dao.ThoiGianTuyenDungDAO"%><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
	<title>Kế Hoạch Tuyển Nhân Sự</title>
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value='<%=Constant.BO_PHAN_BGH %>' ></c:set>
	
	<c:if test="${not empty param.Them}">
		<c:remove var="KeHoachTNS" scope="session"/>
		<c:remove var="listDeNghi" scope="session"/>
	</c:if>
	
	<c:if test="${not empty param.id}">
		<c:set var="KeHoachTNS" scope="session" value='<%=KeHoachTuyenNhanSuDAO.getKHByID(request.getParameter("id")) %>' ></c:set>
		<c:set var="listDeNghi" scope="session" value='<%=ChiTietKHTNSDAO.getAllCTKHTNSByMaKeHoach(request.getParameter("id")) %>' ></c:set>
		<c:if test="${KeHoachTNS.tinh_trang ne '0' and KeHoachTNS.tinh_trang ne '3' or KeHoachTNS.tinh_trang eq '3' and maThanhVien ne KeHoachTNS.nguoi_lap_ke_hoach}">
			<c:set var="locktext" value="disabled"></c:set>
			<c:set var="lockbtn" value="disabled"></c:set>
		</c:if>
	</c:if>
	
	
	<script language="javascript">
		function submitForm(ac){
			if(ac=='L'){
				var max = parseInt(document.getElementById("max").value);
				if(max==1){
					alert("Hãy chọn đề nghị cho Kế Hoạch !!!");
					return;
				}
				var soluong;
				for ( var i = 1; i < max; i++) {
					soluong = parseInt(document.getElementById("txtSoLuong"+i).value);
					for ( var j = 1; j <= soluong; j++) {
						var n = 0;
						for(var k = 1; k <= 12; k++) {
							if(document.getElementById("txtThoiGian"+i+j+k).checked==true) {
								n++;
							}
						}
						if(n==0){
							alert("Bạn chưa chọn tháng dự tuyển cho vị trí tuyển nhân sự "+i+", nhân sự thứ "+j+" !!!");
							return;
						}
					}
				}
				document.getElementById('action').value = "new";
				document.forms['KeHoachTNS'].submit();	
			}else if(ac=='G'){
				var max = parseInt(document.getElementById("max").value);
				if(max==1){
					alert("Hãy chọn đề nghị cho Kế Hoạch !!!");
					return;
				}
				var soluong;
				for ( var i = 1; i < max; i++) {
					
					soluong = parseInt(document.getElementById("txtSoLuong"+i).value);
					for ( var j = 1; j <= soluong; j++) {
						var n = 0;
						for(var k = 1; k <= 12; k++) {
							if(document.getElementById("txtThoiGian"+i+j+k).checked==true) {
								n++;
							}
						}
						if(n==0){
							alert("Bạn chưa chọn tháng dự tuyển cho vị trí tuyển nhân sự "+i+", nhân sự thứ "+j+" !!!");
							return;
						}
					}
				}
				
				if(confirm("Bạn có chắc chắn muốn Gửi Kế Hoạch Tuyển Nhân Sự lên Hiệu Trưởng ?")){
					document.getElementById('action').value = "send";
					document.forms['KeHoachTNS'].submit();	
				} else{
					return;
				}
				
			}else if(ac=='C'){
				document.getElementById('action').value = "create";
				document.forms['KeHoachTNS'].submit();
			}
		}
		
		function ThemDeNghi(){
			
			var obj = new Object;
			var chieucao = 300;
			var chieurong = 600;
			var top = screen.availHeight/2-chieucao/2;
			var left = screen.availWidth/2-chieurong/2;
			var id = document.getElementById("txtMaKeHoach").value;
			obj = window.showModalDialog("<%=request.getContextPath() %>/NhanSu/KeHoachTuyenNhanSu/danhsachdenghi.jsp?id="+id,this,"dialogHeight: "+chieucao+"px; dialogWidth: "+chieurong+"px; dialogTop: "+top+"px; dialogLeft: "+left+"px; edge: Raised; center: Yes; help: No; scroll: Yes; status: No;");
			if(obj == null){
				document.getElementById('action').value = "refresh";
				document.forms['KeHoachTNS'].submit();
			}
		}
	</script>
				
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	<form name="KeHoachTNS" action="<%=request.getContextPath() %>/keHoachTuyenNhanSuController" method="post">
		<table style="background-color: transparent;margin-bottom: 20px;">
			<tr style="background-color: transparent;" >
				<td><div class = "div_td">
					<b>ỦY BAN NHÂN DÂN QUẬN 5</b><br />
					<b>TRƯỜNG TRUNG CẤP NGHỀ KTCN HÙNG VƯƠNG</b></div>
				</td>
				<td><div class = "div_td">
					<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br />
					<b>Độc lập - Tự do - Hạnh phúc</b></div>
				</td>
			</tr></table>
		<table style="background-color: transparent;margin-bottom: 30px;">
			<tr  style="background-color: transparent;">
				<td colspan="2"><strong>KẾ HOẠCH TUYỂN DỤNG NHÂN SỰ MỚI</strong><br/>
					Năm : 
					<select <c:if test="${empty param.Them }">${lockbtn }</c:if> name="txtNam" id="txtNam" >
						<c:forEach begin="2011" end="2030" var="i">
							<option 
								<c:if test="${KeHoachTNS.nam eq i}">
									selected
								</c:if>
						 	value="${i }">${i }</option>
						</c:forEach>
					</select> 
				</td>
			</tr>
			<c:if test="${not empty requestScope.mes}">
				<tr style="background-color: transparent;"><td><font color="red">${requestScope.mes }</font></td></tr>
			</c:if>
		</table>
		
		<table border="1" style="background-color: transparent;margin-bottom: 30px;" id="TableKHTNS">
			<tr style="background-color: transparent;">
				<th bgcolor="#186fb2" style="width:30px;"><div class = "div_txtintable1">Stt</div></th>
				<th bgcolor="#186fb2" style="width:150px;"><div class = "div_txtintable1">Chức danh tuyển dụng</div></th>
				<th bgcolor="#186fb2" style="width:150px;"><div class = "div_txtintable1">Bộ Phận</div></th>
				<th bgcolor="#186fb2" colspan="12" style="width:500px;"><div class = "div_txtintable1">Thời gian tuyển dụng</div></th>
				<th bgcolor="#186fb2" style="width:150px;"><div class = "div_txtintable1">Ghi chú</div></th>
			</tr>
			<c:set var = "stt" value="1"></c:set>

			<c:forEach var="model" items="${listDeNghi}">
				<tr style="background-color: transparent;">
					<td>${stt}</td>
					<td>${model.user2 }</td>
					<td>${model.user1 }</td>
					<td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td>
								<td rowspan="${model.soLuong +1}">
									<textarea rows="${model.soLuong}" ${locktext }
								 	name="txtGhiChu${stt }" style="background-color: transparent;" id="txtGhiChu${stt }">${model.ghi_chu }</textarea>
								</td>
					<c:forEach begin="1" end="${model.soLuong}" var="n">
						<c:set var="slc" value="1"></c:set>
						<c:forEach var="tg" items="${model.list_thoi_gian}">
							<c:if test="${slc eq n}">
								<c:set var="thoigian" value="${tg.thoi_gian}"></c:set>
							</c:if>
							<c:set var="slc" value="${slc+1 }"></c:set>
						</c:forEach>
						<c:set var="listThoiGian" value='${fn:split(thoigian," ")}'></c:set>
						<tr style="background-color: transparent;">
							<c:if test="${n eq '1'}">
								<td colspan="3" rowspan="${model.soLuong }"></td>
							</c:if>
							<c:forEach begin="1" end="12" var="i">
								<td>
									<input type="checkbox" ${lockbtn }
										<c:forEach var="tg" items="${listThoiGian}">
											<c:if test="${tg eq i}">
												checked
											</c:if>
										</c:forEach>
									id="txtThoiGian${stt}${n}${i}" name="txtThoiGian${stt}${n}${i}" style="background-color: transparent;" value="${i }" />
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</tr>
				<input type="hidden" name="txtMaDeNghi${stt }" value="${model.id }"/>
				<input type="hidden" id="txtSoLuong${stt}" name="txtSoLuong${stt}" value="${model.soLuong }"/>
				<c:set var = "stt" value="${stt+1}"></c:set>
			</c:forEach>
		</table>
		
		<c:if test="${KeHoachTNS.tinh_trang eq '0' and maThanhVien eq KeHoachTNS.nguoi_lap_ke_hoach}">
			<a style="text-decoration: none;" href = "javascript: ThemDeNghi()">
				<img src="<%=request.getContextPath()%>/images/buttom/themdenghi.png" alt="Thêm Đề Nghị" border = "0" />
			</a>
		</c:if>
			
		<c:if test="${not empty param.id}">
			<table style="background-color: transparent;margin-bottom: 50px;">
				<tr style="background-color: transparent;">
					<td> 
						<br /><strong>HIỆU TRƯỞNG</strong><br />
						<br /><br />
						<c:if test="${KeHoachTNS.tinh_trang eq '1'}">
							<b>Trần Văn Hải</b>
						</c:if>
					</td>
					<td>
							<p>Quận5, <input value="${KeHoachTNS.ngay_lap_ke_hoach_dmy }" type="text" size = 10 readonly="readonly" style="background-color: transparent;"/></p> 
							<br /><strong>NGƯỜI LẬP PHIẾU</strong><br />
							<br />
							<c:if test="${KeHoachTNS.tinh_trang ne '0'}">
								<b>${KeHoachTNS.ten_nguoi_lap_ke_hoach}</b>
							</c:if>
					</td>
				</tr>				
			</table>
			<c:choose>
				<c:when test="${KeHoachTNS.tinh_trang eq '0' and maThanhVien eq KeHoachTNS.nguoi_lap_ke_hoach}">
						<a href = "javascript: submitForm('L')"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('G')"><img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="Gửi HT" /> </a>
				</c:when>
				<c:otherwise>
					<c:if test="${MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN}">
							<a href = "<%=request.getContextPath() %>/NhanSu/KeHoachTuyenNhanSu/PrintKeHoachTuyenNhanSu.jsp">								 
								<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
							</a>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${param.Them eq 'yes'}">
			<c:if test="${not empty requestScope.error}"><b style="color: red;font-style: italic;">${requestScope.error}</b><br/><br/><br/></c:if>
			<a href = "javascript: submitForm('C')">
				<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="Tạo Kế Hoạch" border = "0" />
			</a>
		</c:if>
		
		<input type="hidden" id="action" name="action"/>
		<input type="hidden" id="max" name="max" value="${stt }" />
		<input type="hidden" id="txtMaKeHoach" name="txtMaKeHoach" value="${KeHoachTNS.id}"/>
	</form>
	
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>