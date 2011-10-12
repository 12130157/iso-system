<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%>


<%@page import="vn.edu.hungvuongaptech.dao.DeNghiNhanSuDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.TieuChuanDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.model.SysParamsModel"%><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp"></meta>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
	<title>GIẤY ĐỀ XUẤT TUYỂN DỤNG NHÂN SỰ</title>
	<c:if test="${not empty param.Them}">
		<c:remove var="DeNghiNhanSu" scope="session"/>
		<c:remove var="listTieuChuan" scope="session"/>
	</c:if>
	
	<c:if test="${not empty param.id}">
		<c:set var="DeNghiNhanSu" value='<%=DeNghiNhanSuDAO.getDNNSByID(request.getParameter("id")) %>' scope="session"></c:set>
		<c:set var="listTieuChuan" value='<%=TieuChuanDAO.getTieuChuanByMaDeNghi(request.getParameter("id")) %>' scope="session" ></c:set>
		<c:if test="${DeNghiNhanSu.tinh_trang ne '0' and DeNghiNhanSu.tinh_trang ne '6' or maThanhVien ne DeNghiNhanSu.ma_truong_khoa}">
			<c:set var="locktext" value="readonly"></c:set>
			<c:set var="lockbtn" value="disabled"></c:set>	
		</c:if>
	</c:if>
	<c:set var = "row" value="1"></c:set>
	<%
		SysParamsModel TGHT = SysParamsDAO.getNgayGioHeThong();
	 %>
	<script language="javascript">
		function submitForm(ac){
			if(ac=='B'){
				if(confirm("Bạn có chắc chắn muốn Bổ Sung Đề Nghị Nhân Sự này ?")){
					document.getElementById('action').value = "boSung";
					document.forms['DeNghi'].submit();	
				} else{
					return;
				}
			}
			
			var SoLuong = document.getElementById("txtSoLuong").value;
			var TGBDL = document.getElementById("txtCalendar").value;
			var CongViec = document.getElementById("txtCongViec").value;
			var rong = /\s/g;
			var CongViec_test = CongViec.replace(rong,"");
			
			if(CongViec_test =="" && TGBDL=="" && SoLuong==""){
				alert("Hãy điền đầy đủ thông tin !!!");
			} else if(CongViec_test == ""){
				alert("Hãy nhập dự kiến phân công nhiệm vụ !!! ");
			} else if(TGBDL == ""){
				alert("Hãy nhập thời gian bắt đầu làm !!! ");
			} else if(SoLuong == ""){
				alert("Hãy nhập số lượng người cần đề nghị !!! ");
			} else if(isNaN(SoLuong)){
				alert("Số Lượng phải nhập số !!! !!! ");
			} else if(SoLuong<=0){
				alert("Số Lượng phải là 1 số không âm và lớn hơn 0!!! ");
			}else{
				if(ac=='L'){
					document.getElementById('action').value = "new";
					document.forms['DeNghi'].submit();
				} else if(ac=='G'){
					var max = parseInt(document.getElementById("row").value);
					if(max==1){
						alert("Hãy click vào Thêm Dòng Tiêu Chuẩn , để nhập tiêu chuẩn !!!");
						return;
					}

					for ( var i = 1; i < max; i++) {
						var TieuChuan = document.getElementById("txtTieuChuan"+i).value;
						var test = /\s/g;
						var checkTieuChuan = TieuChuan.replace(test,"");
						if(checkTieuChuan == ""){
							alert("Hãy nhập đầy đủ tiêu chuẩn !!!(Tiêu Chuẩn "+i+")");
							document.getElementById("txtTieuChuan"+i).value = "";
							return;
						}
					}
					if(confirm("Bạn có chắc chắn muốn Gửi Đề Nghị Nhân Sự này ?")){
						document.getElementById('action').value = "send";
						document.forms['DeNghi'].submit();
					} else{
						return;
					}
				} else if(ac=='C'){
					document.getElementById('action').value = "create";
					document.forms['DeNghi'].submit();	
				} else if(ac=='A'){
					if(confirm("Bạn có chắc chắn muốn Đồng ý ( Duyệt ) Đề Nghị Nhân Sự này  ?")){
						document.getElementById('action').value = "approve";
						document.forms['DeNghi'].submit();	
					} else{
						return;
					}
					
				}else if(ac=='R'){
					var value = false;
					var chieucao = 200;
					var chieurong = 340;
					var top = screen.availHeight/2-chieucao/2;
					var left = screen.availWidth/2-chieurong/2;
					
					value = window.showModalDialog("LyDoRejectBox.jsp","Arg1","dialogHeight: "+chieucao+"px; dialogWidth: "+chieurong+"px; dialogTop: "+top+"px; dialogLeft: "+left+"px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;");
					if(value != false && value != null){
						if(confirm("Bạn có chắc chắn muốn Từ chối Đề Nghị Nhân Sự này ?")){
							document.getElementById('txtLyDoReject').value = value;
							document.getElementById('action').value = "reject";
							document.forms['DeNghi'].submit();
						} else{
							return;
						}
					}
					else {
						return;
					}		
				}
				
			}
		}
		
		function ThemTieuChuan(){
			var i = parseInt(document.getElementById('row').value);
			var table = document.getElementById('TableTC');
			table.insertRow(i).style.backgroundColor = "transparent";
			table.rows[i].insertCell(0).innerHTML = i+".";
			table.rows[i].insertCell(1).innerHTML = "<input type='text' name='txtTieuChuan"+i+"' id='txtTieuChuan"+i+"' style='width: 400px;height: 18px;background-color:transparent;' /><a style='text-decoration:none;' href='javascript: deleteRow("+i+")' ><img src='<%=request.getContextPath()%>/images/buttom/xoa2.png' style='vertical-align: bottom;' alt='Thêm' border = '0'/></a>";
			table.rows[i].cells[0].style.textAlign = "right";
			table.rows[i].cells[0].style.paddingRight = "5px";
			table.rows[i].cells[1].style.textAlign = "left";
			document.getElementById('row').value = i+1;
		}
		
		function deleteRow(n){
			var i = parseInt(document.getElementById('row').value);
			var table = document.getElementById('TableTC');
			if(n==(i-1)){
				table.deleteRow(n);
				i--;
			}else{
				alert("Chỉ có thể xóa từ Tiêu Chuẩn "+(i-1)+" lên !!!");
			}
			document.getElementById('row').value = i;
		}
		
		function deleteTieuChuan(id){
			document.getElementById("txtMaTieuChuan").value=id;
			document.getElementById('action').value = "deleteTC";
			document.forms['DeNghi'].submit();
		}
		
		
		function checkDate(){
			var TGBDL = document.getElementById("txtCalendar").value;
			var TGHT = "<%=TGHT.getNgayHeThong()  %>" ;
			
			var arr_TGBDL = TGBDL.split("-");
			var arr_TGHT = TGHT.split("-");

			var value_TGBDL = parseInt(arr_TGBDL[0],10)+parseInt(arr_TGBDL[1],10)*30+parseInt(arr_TGBDL[2])*365;
			var value_TGHT = parseInt(arr_TGHT[0],10)+parseInt(arr_TGHT[1],10)*30+parseInt(arr_TGHT[2])*365;

			if(value_TGBDL<value_TGHT){
				alert("Thời Gian Bắt Đầu Làm Việc phải sau "+TGHT+" !!!");
				document.getElementById("txtCalendar").value = "";
			}else if((value_TGBDL-value_TGHT)<5){
				alert("Khoảng cách giữa ngày hiện tại và ngày bắt đầu làm ít nhất phải lớn hơn 5 !!!");
				document.getElementById("txtCalendar").value = "";
			}
		}
		
		function checkChucDanh(){
			var chucDanh = document.getElementById("txtChucDanh").value;
			<% 
				if(request.getParameter("id")!="" && request.getParameter("id")!=null){
			%>
				var maBoPhan = ${DeNghiNhanSu.ma_bo_phan};
			<%
				}else{
			%>
				var maBoPhan = "";
			<%
				}
			%>
			if(maBoPhan!=""){
				if(maBoPhan!="1" && maBoPhan!="2"){
					alert(maBoPhan);
					if(chucDanh=="8"){
						document.getElementById("pdt").style.display = "inline";
						
					}else{
						document.getElementById("pdt").style.display = "none";
					}
				}else{
					alert("ok");
					document.getElementById("tk").style.display = "none";
				}
			}
		}
	</script>
	
	
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var = "BO_PHAN_PDT" value = '<%= Constant.BO_PHAN_PDT %>'></c:set>
	<c:set var = "BO_PHAN_BGH" value = '<%= Constant.BO_PHAN_BGH %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%=Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "dsVaiTro" value = '<%=VaiTroDAO.getVaiTroDeNghiNhanSu() %>'></c:set>
	<c:set var="Khoa" value='<%=KhoaDAO.getKhoaByMaBoPhan(session.getAttribute("maBoPhan").toString()) %>'></c:set>
	
</head>
<body onload="checkChucDanh()">
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	
	<form name="DeNghi" id="DeNghi" action="<%=request.getContextPath() %>/deNghiNhanSuController" method="post">
		<table style="background-color: transparent;margin-bottom: 50px;">
			<tr style="background-color: transparent;">
				<td>
					TRƯỞNG TCN KTCN HÙNG VƯƠNG<br/>
					<b>P/K/BM
					<c:choose>
						<c:when test="${not empty param.id}">
							${DeNghiNhanSu.ten_bo_phan }
							
						</c:when>
						<c:otherwise>
							${Khoa.tenKhoa }
						</c:otherwise>
					</c:choose> 
					</b><br/>
					
					--------------------------
				</td>
				<td>
					<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b></br>
					<b>Độc Lập - Tự Do - Hạnh Phúc</b></br>
					--------------------------
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;margin-bottom: 50px;">
			<tr style="background-color: transparent;">
				<td><strong style="font-size: 25px;">GIẤY ĐỀ XUẤT TUYỂN DỤNG NHÂN SỰ</strong></td>
			</tr>
			<c:if test="${not empty requestScope.error}">
				<tr style="background-color: transparent;"><td><b style="color: red;font-style: italic;">${requestScope.error }</b></td></tr>
			</c:if>
			<c:if test="${not empty requestScope.mes}">
				<tr style="background-color: transparent;"><td><font color="red">${requestScope.mes }</font></td></tr>
			</c:if>	
		</table>
		<table style="background-color: transparent;margin: 0 0 30px 50px;">
			<tr style="background-color: transparent;">
				<td valign="top">Kính Gửi :</td>
				<td style="text-align: left">
					- Hiệu Trưởng Trường Trung Cấp Nghề KTCN Hùng Vương<br/>
					- Trưởng Phòng Tổ Chức Hành Chánh Quản Trị<br/>
					- Trưởng Phòng Đào Tạo
				</td>
			</tr>
		</table>
		
		<table style="background-color: transparent;margin: 0 0 30px 50px;">
			<tr style="background-color: transparent;">
				<td colspan="2" style="text-align: left;">
					<p>
					Căn cứ hoạt động năm
					
					
					<select name="txtNam" id="txtNam" <c:if test="${not empty param.id }">disabled</c:if> style=" background-color: transparent;">
						<c:forEach var="i" begin="2011" end="2030" step="1">
							<option value="${i}" 
								<c:if test="${DeNghiNhanSu.nam eq i}">
									selected
								</c:if>
							 >${i}
							</option>
						</c:forEach>
					</select>
					
					và nhu cầu thực tế về viên chức làm việc theo chức danh. Phòng/Khoa/Bộ Môn
					<b>${boPhan.tenKhoa }</b>
					
					đề nghị Hiệu Trưởng Trường Trung Cấp Nghề Kỹ Thuật Công Nghệ Hùng Vương tuyển dụng nhân sự cho bộ phận để đáp ứng nhu cầu trên
					</p>
				</td>
			</tr>
		</table>
		
		<table style="background-color: transparent;margin: 0 0 30px 50px;">
			<tr style="background-color: transparent; padding-bottom: 30px;">
				<td colspan="2" style="text-align: left; background-color: transparent;">
					* Chức Danh : 
					<select id="txtChucDanh" name="txtChucDanh" onchange="checkChucDanh()" ${lockbtn } style=" background-color: transparent;">
						<c:forEach var="model" items="${dsVaiTro}">
							<option value="${model.maVaiTro }" 
								<c:if test="${model.maVaiTro eq DeNghiNhanSu.chuc_danh}">
									selected
								</c:if>
							>${model.tenVaiTro }</option>
						</c:forEach>
						<option>Khác</option>
					</select>
					 <br/>
					 
					* Dự Kiến Phân Công Nhiệm Vụ :
						<input value="${DeNghiNhanSu.cong_viec}" type="text" ${locktext } style=" background-color: transparent; text-align: left;width: 300px;" name="txtCongViec" id="txtCongViec" />
					<br/>
					
					* Số Lượng : 
						<input type="text" ${locktext } maxlength="4" name="txtSoLuong" id="txtSoLuong" style="background-color: transparent; text-align:center ;width: 50px;height: 14px;" value="${DeNghiNhanSu.so_luong }" />
					<br/>
					
					
					
					<table id="TableTC" style="background-color: transparent;">
						<tr style="background-color: transparent;">
							<td colspan="2" style=" background-color: transparent; text-align: left; ">* Tiêu Chuẩn Tuyển Dụng : ( theo qui định tuyển dụng nhân sự với từng chức danh )</td>
						</tr>
						<c:forEach var="model" items="${listTieuChuan}">
							<tr style="background-color: transparent;">
								<td style="text-align: right; padding-right: 5px; width:50px;">${row }.</td>
								<td style="text-align: left;">
									<input type="text" ${locktext } name="txtTieuChuan${row}" id="txtTieuChuan${row}" value="${model.tieu_chuan }" style="background-color: transparent;width: 400px;height: 18px;"/>
									<c:if test="${DeNghiNhanSu.tinh_trang eq '0' or DeNghiNhanSu.tinh_trang eq '6' and maThanhVien eq DeNghiNhanSu.nguoi_de_nghi}">
										<a style="text-decoration:none;" href="javascript: deleteTieuChuan(${model.id })" >
											<img src="<%=request.getContextPath()%>/images/buttom/xoa2.png" alt="Thêm" style="vertical-align: bottom;" border = "0"/>
										</a>
									</c:if>
									<input type="hidden" name="txtMaTieuChuan${row }" id="txtMaTieuChuan${row }" value="${model.id }" ></input>
								</td>
							</tr>
							
							<c:set var="row" value="${row + 1}"></c:set>
						</c:forEach>
					</table>
					<c:if test="${not empty param.id}">
						<c:if test="${DeNghiNhanSu.tinh_trang eq '0' or DeNghiNhanSu.tinh_trang eq '6' and maThanhVien eq DeNghiNhanSu.nguoi_de_nghi}">
							<a href = "javascript: ThemTieuChuan()">
								<img src="<%=request.getContextPath()%>/images/buttom/themtieuchuan.png" alt="Thêm" border = "0"/>
							</a>
						</c:if>
					</c:if>
					<br/>
					
					* Thời Gian Bắt Đầu Làm Việc :
					<input type = "text" id="txtCalendar" ${lockbtn } onchange="checkDate()" size = 8 name="txtCalendar" value="${DeNghiNhanSu.thoi_gian_bat_dau_lam_mdy }" style="background-color: transparent;"/>
					<br/>
				</td>
			</tr>
		</table>
			<c:if test="${param.Them eq 'yes'}">

				<a href = "javascript: submitForm('C')">
					<img src="<%=request.getContextPath()%>/images/buttom/taomoi.png" alt="tạo mới" border = "0" />
				</a>
			</c:if>
			<c:if test="${not empty param.id}">
				<table style="background-color: transparent;">
					<tr style="background-color: transparent;padding-bottom: 20px;">
						<td style="padding-bottom: 50px;">
							ngày <input type="text" size = "10" value="${DeNghiNhanSu.ngay_HC_duyet_mdy }" readonly="readonly" style="background-color: transparent;"/> 
							<br /><strong>TRƯỞNG PHÒNG TCHCQT</strong><br />
							<br /><b>${DeNghiNhanSu.ten_phong_HC }</b>
							
						</td>
						<td style="padding-bottom: 50px;display: inline;" id="pdt">
							ngày <input type="text" size = 10 value="${DeNghiNhanSu.ngay_DT_duyet_mdy }" readonly="readonly" style="background-color: transparent;"/> 
							<br /><strong>TRƯỞNG PHÒNG ĐÀO TẠO</strong><br />
							<br /><b>${DeNghiNhanSu.ten_phong_DT }</b>
						</td>
						<td style="padding-bottom: 50px;display: inline;" id="tk">
							Quận5,ngày <input type="text" size = 10 value="${DeNghiNhanSu.ngay_lap_mdy }" readonly="readonly" style="background-color: transparent;"/> 
							<br /><strong>TRƯỞNG P/K/BM ${boPhan.tenKhoa }</strong><br />
							<br /><b>${DeNghiNhanSu.ten_truong_khoa }</b>
						</td>
					</tr>
					<tr style="background-color: transparent;">
						<td colspan="3"  style="padding-bottom: 50px;">
							ngày <input type="text" size = 10 value="${DeNghiNhanSu.ngay_HT_duyet_mdy }" readonly="readonly" style="background-color: transparent;"/> 
							<br /><strong>HIỆU TRƯỞNG</strong><br />
							<br /><b>${DeNghiNhanSu.ten_hieu_truong }</b>
						</td>
					</tr>
				</table>
				<c:choose>
					<c:when test="${DeNghiNhanSu.tinh_trang eq '0' and maThanhVien eq DeNghiNhanSu.nguoi_de_nghi or DeNghiNhanSu.tinh_trang eq '6' and maThanhVien eq DeNghiNhanSu.nguoi_de_nghi}">
						<a href = "javascript: submitForm('L')"><img src="<%=request.getContextPath()%>/images/buttom/luu.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('G')"><img src="<%=request.getContextPath()%>/images/buttom/gui.png" alt="Gửi HT" /> </a>
					</c:when>
					<c:when test="${DeNghiNhanSu.chuc_danh ne '8' and MaBoPhan eq BO_PHAN_PDT }">
						<c:if test="${MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN or maThanhVien eq DeNghiNhanSu.nguoi_de_nghi or maThanhVien eq DeNghiNhanSu.ma_truong_khoa}">
							<a href = "<%=request.getContextPath() %>/NhanSu/DeNghiTuyenNhanSu/PrintDeNghiNhanSu.jsp">								 
								<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
							</a>
						</c:if>
					</c:when>
					<c:when test="${(DeNghiNhanSu.tinh_trang eq '2' or DeNghiNhanSu.tinh_trang eq '3') and (MaBoPhan eq BO_PHAN_PDT and empty DeNghiNhanSu.phong_DT or MaBoPhan eq BO_PHAN_PHC and empty DeNghiNhanSu.phong_HC) or DeNghiNhanSu.tinh_trang eq '4' and MaBoPhan eq BO_PHAN_BGH}">
						<a href = "javascript: submitForm('A')"><img src="<%=request.getContextPath()%>/images/buttom/approve.png" alt="Lưu" /> </a>
						<a href = "javascript: submitForm('R')"><img src="<%=request.getContextPath()%>/images/buttom/reject.png" alt="Lưu" /> </a>
					</c:when>
					<c:otherwise>
						<c:if test="${MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_PDT or MaBoPhan eq BO_PHAN_PHC or MaBoPhan eq BO_PHAN_ADMIN or maThanhVien eq DeNghiNhanSu.nguoi_de_nghi or maThanhVien eq DeNghiNhanSu.ma_truong_khoa}">
							<a href = "<%=request.getContextPath() %>/NhanSu/DeNghiTuyenNhanSu/PrintDeNghiNhanSu.jsp">								 
								<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
							</a>
						</c:if>
						<c:if test="${DeNghiNhanSu.tinh_trang eq '5' and maThanhVien eq DeNghiNhanSu.nguoi_de_nghi}">
							<a href = "javascript: submitForm('B')">
								<input type="button" value="Bổ Sung" />
							</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:if>
		<input type="hidden" name="row" id="row" value="${row }" />
		<input type="hidden" id="action" name="action"/>
		<input type="hidden" id="txtLyDoReject" name="txtLyDoReject"/>
		<input type="hidden" id="txtMaTieuChuan" name="txtMaTieuChuan"/>
		<input type="hidden" name="txtMaDeNghi" value="${DeNghiNhanSu.id }" />
		
	</form>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
<script type="text/javascript">
//<![CDATA[
  Zapatec.Calendar.setup({
	firstDay          : 1,
	weekNumbers       : false,
	range             : [2010.01, 2020.12],
	electric          : false,
	inputField        : "txtCalendar",
	button            : "Calendar",
	ifFormat          : "%d-%m-%Y"
  });
//]]>
 </script>
</body>
</html>