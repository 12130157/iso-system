<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
	<script src="<%=request.getContextPath()%>/js/jslightbox/prototype.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jslightbox/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jslightbox/lightbox.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/lightbox.css" type="text/css" media="screen" />
<title>Nhóm Phát Triển</title>
</head>
<body>
<div align="center">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../block/header_home.jsp" />
	<!-- E HEAD CONTENT -->

	<table style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_thanhvientieude">Dự án ISO</div></td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">Khách Hàng :</div></td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">- Trường TCN KTCN Hùng Vương, địa chỉ : 161-165 Nguyễn Chí Thanh Q.5 TpHCM</div></td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">Mô tả dự án :</div></td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">
				- Trường TCN KTCN Hùng Vương là 1 trường đào tạo nghề hàng đầu, trường xây dựng chất lượng đào tạo theo chuẩn ISO 9001-2000, và là trường được công nhận chuẩn ISO đi đầu trong các trường đào tạo nghề trong cả nước. Qui trinh ISO đòi hỏi công tác giảng dạy của thầy và công việc học tập trò phải tuan thủ theo 1 qui trinh nghiêm ngặc, được kiểm tra chất lượng hàng quí, hàng năm. Vì thế đầu ra của việc đào tạo cho học viên lành nghề, đáp ứng được công việc thực tế rất cao.
			</div></td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">
				- Việc quản lý theo qui trinh ISO cần rất nhiều giấy tờ và rất nhiều giai đoạn trong công tác dạy và học. Vì thế để quản lý toan bộ qui trinh theo tính nhất quán và đảm bảo các tiêu chí rất khó nếu vẫn theo cách quản lý thủ công như trước giờ. Nên trường đã đề xuất xây dựng 1 hệ thống quản ly ISO trên máy (sử dụng toàn bộ trên website), không làm giấy tờ thủ công như trước nay.
			</div></td>
		</tr> 
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">Kiến trúc hệ thống</div></td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">- Hệ thống được xây dựng trên nền tảng web, sử dụng công nghệ Java J2EE (JSP, Servlet, JSTL, EJB).</div></td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">- Webserver: Apache Tomcat 6x.</div></td>
		</tr>
		<tr style="background-color: transparent;">
			<td colspan="2"><div class = "div_textleft">- Database : SQL server 2008.</div></td>
		</tr>
		<tr style="background-color: transparent;"><td colspan="2"><div class = "div_thanhvientieude">Các Thành Viên Đội Dự Án</div></td></tr>
		<tr style="background-color: transparent;"><td colspan="2">
			<a href="<%=request.getContextPath()%>/images/ISO/IMG_2234.JPG" rel="lightbox[roadtrip]">
				<div id = "borderImages">
				<img src="<%=request.getContextPath()%>/images/ISO/IMG_2234.JPG" style="width:600px" border = "0" />
				</div>
			</a>
		</td></tr>
	</table>
	<table border = "1" style="background-color: transparent;">	
		<tr style="background: transparent;">
			<td>Project Manager (PM) – Thầy Võ Đức Thiện<br/><div id = "borderImages"><img src="<%=request.getContextPath()%>/images/ISO/IMG_2252.JPG" border = "0" /></div></td>
			<td>
				- Giảng viên trung tâm Aptech.<br/>
				- Kinh nghiệm làm việc  dự án  tại các CTy: FPT-Software HCM, Harvey Nash, Sopia.<br/>
				- Các dự án lớn đã làm qua:<br/><br/>
				   1. eClaim (KHàng : Unilerver VN)<br/>
				   2. Peajohn (KHàng peajohn – Japan)<br/>
				   3. ……………..<br/>		
			</td>
		</tr>
		<tr style="background: transparent;">
			<td>Team Leader (TL) –Trần Thanh Toàn<br/><div id = "borderImages"><img src="<%=request.getContextPath()%>/images/ISO/IMG_2246.JPG" border = "0" /></div></td>
			<td>
				- Semester 3 – Aptech<br/>
				- Nhiệm vụ : team leader + developer của dự án.
			</td>
		</tr>
		<tr style="background: transparent;">
			<td>Designer + Developer  – Huỳnh Quốc Tuấn<br/><div id = "borderImages"><img src="<%=request.getContextPath()%>/images/ISO/IMG_2250.JPG" border = "0" /></div></td>
			<td>
				- Cao đẳng đồ họa,<br/>
				- Semester 2 – Aptech<br/>
				- Nhiệm vụ : design giao diện + developer của dự án.<br/>
			</td>
		</tr>
		<tr style="background: transparent;">
			<td>Developer  – Phạm Hồng Tâm<br/><div id = "borderImages"><img src="<%=request.getContextPath()%>/images/ISO/IMG_2253.JPG" border = "0" /></div></td>
			<td>
				- Semester 3 – Aptech.<br/>
				- Giải 3 thi giỏi nghề cấp thanh phố 2010.<br/>
				- Nhiệm vụ : developer của dự án.<br/>
			</td>
		</tr>
		<tr style="background: transparent;">
			<td>Developer (dev) –Từ Quí Phượng<br/><div id = "borderImages"><img src="<%=request.getContextPath()%>/images/ISO/IMG_2255.JPG" border = "0" /></div></td>
			<td>
				- Semester 2 – Aptech.<br/>
				- Nhiệm vụ : developer chính  của dự án.<br/>
			</td>
		</tr>
		<tr style="background: transparent;">
			<td>Designer + Tester  – Lieou Y Huyền<br/><div id = "borderImages"><img src="<%=request.getContextPath()%>/images/ISO/IMG_2258.JPG" border = "0" /></div></td>
			<td>
				- Cao đẳng đồ họa.<br/>
				- Nhiệm vụ : design giao diện + tester của dự án.<br/>
			</td>
		</tr>
		<tr style="background: transparent;">
			<td>Designer + Tester  – Lieou Y Ân<br/><div id = "borderImages"><img src="<%=request.getContextPath()%>/images/ISO/IMG_2259.JPG" border = "0" /></div></td>
			<td>
				- Cao đẳng đồ họa.<br/>
				- Nhiệm vụ : design giao diện + tester của dự án.<br/>
			</td>
		</tr>
	</table>
	<table style="background-color: transparent;">
		<tr style="background-color: transparent;">
			<td>
				<a href = "<%=request.getContextPath()%>/home.jsp">
					<img src = "<%=request.getContextPath()%>/images/icon_action/back.png" border = "0"  />
				</a>
			</td>
		</tr>
	</table>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</body>
</html>