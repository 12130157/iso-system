<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="vn.edu.hungvuongaptech.dao.KhoaDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.VaiTroDAO"%><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
	<title>Chấm Dứt Hợp Đồng Làm Việc</title>
	<script language="javascript" >
		function confirmSending(){
			if(confirm("Bạn có chắc muốn gửi chấm dứt hợp đồng làm việc đến Hiệu trưởng không?")){
				document.CDHPLV.GuiHieuTruong.value = 'GuiHieuTruong';
				submitForm(0);
			}
		}
	</script>
	
	<c:set var = "vaiTro" value = '<%=(String) session.getAttribute("maVaiTro")%>'> </c:set>
	<c:set var = "maThanhVien" value='<%= (String) session.getAttribute("maThanhVien") %>'></c:set>
	<c:set var = "MaBoPhan" value = '<%= (String) session.getAttribute("maBoPhan") %>'></c:set>
	<c:set var = "BO_PHAN_ADMIN" value = '<%= Constant.BO_PHAN_ADMIN %>'></c:set>
	<c:set var = "BO_PHAN_PHC" value = '<%= Constant.BO_PHAN_PHC %>'></c:set>
	<c:set var="boPhan" value='<%=KhoaDAO.getKhoaByMaBoPhan(session.getAttribute("maBoPhan").toString()) %>' ></c:set>
	<c:set var="dsVaiTro" value='<%=VaiTroDAO.showAllVaiTro() %>' ></c:set>	
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header_NhanSu.jsp" />
	<!-- E HEAD CONTENT -->
	
<table  name="CDHPLV" style="background-color: transparent;">
	<tr style="background-color: transparent;"><td style="background-color: transparent;">
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td>
				<strong style="font-size: 13px;">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</strong><br/>
				<strong style="font-size: 12px;">Độc Lập - Tự Do - Hạnh Phúc</strong><br/>
				-----------------------------
			</td>
		</tr>
	</table>
	<table style="background-color: transparent;">
		<tr  style="background-color: transparent;">
			<td>
				<strong style="font-size: 17px; ">
					ĐƠN XIN THÔI VIỆC<br/> ( CHẤM DỨT HỢP ĐỒNG LÀM VIỆC )
				</strong>
			</td>
		</tr>
	</table>
	<table style="background-color: transparent;margin: 0 0 10px 80px;">
		<tr style="background-color: transparent;">
			<td>Kính Gửi :<br/><br/><br/></td>
			<td style="text-align: left">
				- Hiệu Trưởng Trường Trung Cấp Nghề KTCN Hùng Vương<br/>
				- Trưởng Phòng Tổ Chức Hành Chánh Quản Trị<br/>
				- Trưởng Phòng Đào Tạo (nếu là giáo viên)<br/>
				- Trưởng bộ phận : ${boPhan.tenKhoa }
			</td>
		</tr>
	</table>	
	<table style="background-color: transparent;margin: 0 0 10px 50px; width: 700px">
		<tr style="background-color: transparent;">
			<td style="padding-left: 60px; text-align: left;">
				Tôi tên là : 
					<input style="background-color: transparent; width: 330px;" value=""  type="text" />
				Nam, nữ : 
					<select name="txtGioiTinh" >
							<option value="1" selected="selected">Nam</option>
							<option value="0">Nữ</option>
					</select> <br/>
				Ngày tháng năm sinh  : 
					<input style="background-color: transparent; width: 400px;" value=""  type="text" /> <br/>
				Là viên chức chức danh : 
					<input style="background-color: transparent; width: 200px;" value=""  type="text" />,
				đang ký hợp đồng có thời hạn
			</td>
		</tr>		
		<tr style="background-color: transparent;">
			<td style="text-align: left;">
				<p>(
				<input style="background-color: transparent; width: 20px;" value=""  type="text" />
				 tháng)với nhà trường 
				(từ ngày <input style="background-color: transparent; width: 60px;" value=""  type="text" />
				 đến ngày <input style="background-color: transparent; width: 60px" value=""  type="text" />)
				tại bộ phận <input style="background-color: transparent; width: 150px" value=""  type="text" />
				</p>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="padding-left: 60px; text-align: left;">
				<p>
				Nay tôi làm đơn kính đề nghị Ban Giám Hiệu, Phòng Tổ chức Hành 
				chánh Quản trị, Phòng Đào Tạo
				</p>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="text-align: left;">
				<p>
				(nếu là giáo viên), bộ phận 
				<input style="background-color: transparent; width: 150px" value=""  type="text" />
				cho tôi được thôi việc (chấm dứt hợp đồng làm việc) kể từ ngày 
				<input style="background-color: transparent; width: 60px" value=""  type="text" /> <br/>
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td style="padding-left: 60px; text-align: left;">
				Lý do :<br/>
				<textarea rows="2" cols="70" style="background-color: transparent;"></textarea>
				<br/>
				<p align="center">Rất mong được sự chấp thuận của Ban Giám Hiệu.</p>
			</td>
		</tr>
		
	</table>
	<table style="background-color: transparent; width: 500px; margin: 0 200px 80px 0;" align="right">
		<tr style="background-color: transparent;">
			<td style="text-align: center;  margin-bottom: 50px;"> 
				Ngày <input size="2" style="background-color: transparent;" value=""  type="text" />
				Tháng <input size="2" style="background-color: transparent;" value=""  type="text" />
				Năm <input size="2" style="background-color: transparent;" value=""  type="text" />
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td>
				Kính đơn
			</td>
		</tr>		
	</table>
	<table style="background-color: transparent;" border="0">
		<tr style="background-color: transparent;padding-bottom: 20px;">
			<td style="padding-bottom: 50px;">
				ngày <input type="text" name="txtCalendar9" id="txtCalendar9" size = 10  style="background-color: transparent;"/> 
				<br /><strong>TRƯỞNG PHÒNG TCHCQT</strong><br />
				<br />
			</td>
			<td style="padding-bottom: 50px;">
				ngày <input type="text" name="txtCalendar9" id="txtCalendar9" size = 10  style="background-color: transparent;"/> 
				<br /><strong>TRƯỞNG PHÒNG ĐÀO TẠO</strong><br />
				<br />
			</td>
			<td style="padding-bottom: 50px;">
				Quận5,ngày <input type="text" name="txtCalendar9" id="txtCalendar9" size = 10  style="background-color: transparent;"/> 
				<br /><strong>TRƯỞNG P/K/BM</strong><input type="text" style="width: 100px;"/><br />
				<br />
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="3"  style="padding-bottom: 50px;" align="center">
				ngày <input type="text" name="txtCalendar9" id="txtCalendar9" size = 10  style="background-color: transparent;"/> 
				<br /><strong>HIỆU TRƯỞNG</strong><br />
				<br />
			</td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="3">  								
				<a href = "javascript: confirmSending()">
					<input type="hidden" name="GuiHieuTruong" /> 
					<img src="<%=request.getContextPath()%>/images/buttom/guihieutruong.png" alt="Gửi Hiệu Trưởng" border = "0" />
				</a>
				<a href = "javascript: xuLyFile(2);">	
					<input type="hidden" name="Copy" value = "Copy" />							 
					<img src="<%=request.getContextPath()%>/images/buttom/saochep.png" alt="Sao chép" border = "0" />
				</a>	
				<a href = "<%=Constant.PATH_RES.getString("iso.InDeCuongMonHocPath") %>">								 
					<img src="<%=request.getContextPath()%>/images/buttom/in.png" alt="Xuất File" border = "0" />
				</a>
			</td>
		</tr>
	</table>
</td></tr></table>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>