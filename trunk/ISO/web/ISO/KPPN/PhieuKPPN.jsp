<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=;url=<%=request.getContextPath() %>/Logout.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aqua.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/phieukppn_style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/General.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/zapatec.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar-en.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/interface.js" type="text/javascript"></script>
<title>Khắc phục phòng ngừa</title>
</head>
<body>

<div align="center">
<div class = "div_pagebody">
	<!-- S HEAD CONTENT -->
			<jsp:include page="../../block/header.jsp" />
	<!-- E HEAD CONTENT -->
	
<div class="page_content">

							<div class="title">PHIẾU ĐỀ XUẤT HÀNH ĐỘNG KHẮC PHỤC PHÒNG NGỪA</div>
										<div style='font-weight:bold' class="caption2">Số:.......</div>
	
	<div>
		<div class="sub_title">I/ PHẦN GHI NHẬN: </div>
		<div>
			<div class="caption1">
				<div class="caption3">Người lập phiếu: </div>
			</div>
			
			<div class="caption1">
				<div class="caption3">Ý kiến được ghi nhận từ: </div>
				<div class="caption3" style="padding-left:40px">
					<textarea rows="4" cols="70"></textarea>
				</div>
			</div>
			
			<div class="caption1">
				<div class="caption3">Nội dung vấn đề không phù hợp: </div>
				<div class="caption3" style="padding-left:40px">
					<textarea rows="4" cols="70"></textarea>
				</div>
			</div>
			
			<div class="caption1">
				<div class="caption3">Ý kiến của <b>ĐDLĐ/HT</b>: </div>
				<div class="caption3" style="padding-left:40px">
					<textarea rows="4" cols="70"></textarea>
				</div>
			</div>
		
			<div class="caption1">
				<div class="caption4">Ngày ... tháng ... năm ...
					<br/>
					<b>ĐDLĐ/HT</b>
				</div>
				<div class="caption4">Ngày ... tháng ... năm ...
					<br/>
					<b>Người lập phiếu</b>
				</div>
			</div>
			<div class="caption5"></div>
		</div>
	</div>
	
	
	<div>
		<div class="sub_title">II/ NGUYÊN NHÂN ĐỀ XUẤT: </div>
		<div>
			<div class="caption1">
				<div class="caption3">Nguyên nhân: </div>
				<div class="caption3" style="padding-left:40px">
					<textarea rows="4" cols="70"></textarea>
				</div>
			</div>
			
			<div class="caption1">
				<div class="caption3">Đề xuất giải pháp: </div>
				<div class="caption3" style="padding-left:40px">
					<textarea rows="4" cols="70"></textarea>
				</div>
			</div>
			
			<div class="caption1">
				<div class="caption3">Thời gian hoàn thành: </div>
				<div class="caption3" style="padding-left:40px">
					<textarea rows="4" cols="70"></textarea>
				</div>
			</div>
			<div class="caption1">
				<div class="caption4"></div>
				<div class="caption4">
					Ngày ... tháng ... năm ... <br/><br/>
					<b>	Người đề xuất </b>
				</div>
			</div>
			<div class="caption5"></div>
		</div>
		
	</div>
	
	<div>
		<div class="sub_title">III/ PHẦN XEM XÉT: </div>
		<div>
			<div class="caption1">
				<div class="caption3">
					<input type="checkbox"></input> Đồng ý
				</div>
			</div>
			<div class="caption1">
				<div class="caption6">
					<input type="checkbox"></input> Không đồng ý 
				</div>
				<div class="caption6">
					Ngày dự kiến hoàn thành: ...
				</div>
			</div>
			<div class="caption1">
					<div class="caption4"></div>
					<div class="caption4" style='font-weight:bold'>ĐDLĐ/HT</div>
			</div>
			<div class="caption5"></div>
		</div>
	</div>
	
	
	<div>
		<div class="sub_title">IV/ PHẦN KIỂM SOÁT KẾT QUẢ THỰC HIỆN: </div>
		<div>
			<div class="caption1">
				<div class="caption3" style="padding-left:50px">
					<input type="checkbox"></input> Đạt
				</div>
			</div>
			<div class="caption1">
				<div class="caption3" style="padding-left:50px">
					<input type="checkbox"></input> Không đạt
				</div>
				<div class="caption3" style="padding-left:40px">
					<textarea rows="4" cols="70"></textarea>
				</div>
			</div>
			<div  class="caption1">
				<div class="caption3" style="padding-left:50px">Đề xuất KPPN/PN mới số: ...</div>
			</div>
		
			<div class="caption1">
				<div class="caption4"></div>
				<div class="caption4">
					Ngày ... tháng ... năm ...<br/><br/>
					<b>
					Phòng Đảm Bảo Chất Lượng <br/><br/>
					Người kiểm soát 
					</b>
				</div>			
			</div>
			<div class="caption5"></div>
		</div>
	</div>

</div>
	<!-- S FOOT CONTENT -->
			<jsp:include page="../../block/footer.jsp" />
	<!-- E FOOT CONTENT -->
</div>
</div>

</body>
</html>