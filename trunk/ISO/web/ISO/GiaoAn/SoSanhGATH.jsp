<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO"%>

<%@page import="vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.GiaoAnDAO"%>

<pd4ml:transform
	screenWidth="700"
	pageFormat="A4"
	pageOrientation="portrait"	
	pageInsets="10,20,0,20,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Times New Roman" monospace="Courier New" />
<pd4ml:header 
       	watermarkOpacity="50"
	   	watermarkBounds="0,795,600,20">
</pd4ml:header>
 <pd4ml:footer 
	   fontFace="Times New Roman"
       titleTemplate=""
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask1.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,820,600,20"	      
       fontSize="12">       
 </pd4ml:footer> 
<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>Giáo án thực hành</title> 
</head>
<div align="center">
<div class = "div_body">

<c:set var="giaoAnLyThuyet" value="${sessionScope.giaoAnLyThuyet}"></c:set>
<c:set var="listTenChuong" value="${sessionScope.listTenChuong}"></c:set>
<c:set var="objKHGD" value="${sessionScope.objKHGD}"></c:set>
<c:set var="soPhut" value="${sessionScope.soPhut}"></c:set>
<c:set var="chiTietKHGD" value="${sessionScope.chiTietKHGD}"></c:set>


<c:set var="giaoAnSoSanh" value='<%=GiaoAnDAO.getGiaoAnThucHanhByMaGA(request.getParameter("maGA"))%>' ></c:set>		
<c:set var="listTenChuongSS" value='<%=ChiTietKHGDDAO.getListTenChuongByMaCTKHGD(request.getParameter("maCTKHGD"))%>' ></c:set>
<c:set var="soPhutSS" value='<%=KeHoachGiangDayDAO.calSoPhutDCMHByMaKHGD(request.getParameter("maKHGD"),Constant.phutQDLT)%>' ></c:set>
<c:set var="objKHGDSS" value='<%=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(request.getParameter("maKHGD"))%>'></c:set>
<c:set var="chiTietKHGDSS" value='<%=ChiTietKHGDDAO.getChiTietKHGDByByMaCTKHGD(request.getParameter("maCTKHGD")) %>'></c:set>


<table width="100%" height="100%" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">
	<tr><td>
		<table border="0" width = "650px" style="background-color: transparent;">
				<tr style="background-color: transparent;">
					<td></td>
					<td colspan = "2" style="text-align: center; padding-bottom: 10px">Mẫu số 6<br />Ban hành theo Quyết định số 62/2008/QĐ-BLĐTBXH</td>		
				</tr>
				<tr style="background-color: transparent;">
					<td style="width: 300px;">
						GIÁO ÁN SỐ : ${giaoAnLyThuyet.soGiaoAn}
					</td>
					<td colspan="2" style="padding-left:40px">
						Thời gian thực hiện : ${soPhut} phút <span style='background-color:yellow'>${soPhutSS} phút</span><br />
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td></td>
					<td colspan="2" style="padding-left:40px">Tên bài học trước :</td>
				</tr>
				<tr style="background-color: transparent;">
					<td></td>
					<td style="width: 50px;padding-left:20px"></td>
					<td style='padding-left:20px'>
						<div style="text-align:left;font-weight:bold">
						
							<% int count=1; %>
							<c:forEach items="${listTenChuong}" var="obj">
								<b><%=count%>/ ${obj}</b><br/>					
								<%count++; %>
							</c:forEach>
						
						</div>	
						<div style="text-align:left;font-weight:bold;background-color:yellow">
						
							<% count=1; %>
							<c:forEach items="${listTenChuongSS}" var="obj">
								<b><%=count%>/ ${obj}</b><br/>					
								<%count++; %>
							</c:forEach>
						
						</div>	
					</td>
				</tr>
				<tr style="background-color: transparent;">
					<td></td>
					<td colspan="2" style="padding-left:40px">
						Thực hiện :	<!-- ${sf:setFormatDate(giaoAnLyThuyet.ngayThucHien)}  -->
					</td>
				</tr>
		</table>
		<table width = "700px" align="center" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td>
					Tên bài : 
					<div style="text-align:left;font-weight:bold">
					
						<% count=1; %>
						<c:forEach items="${listTenChuong}" var="obj">
							<b><%=count%>/ ${obj}</b><br/>					
							<%count++; %>
						</c:forEach>	
					
					</div>	
					<div style="text-align:left;font-weight:bold;background-color:yellow">
					
						<% count=1; %>
						<c:forEach items="${listTenChuongSS}" var="obj">
							<b><%=count%>/ ${obj}</b><br/>					
							<%count++; %>
						</c:forEach>	
					
					</div>	
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">MỤC TIÊU CỦA BÀI : 
					</div>
					<div style="padding-left:20px">${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.mucTieu))} </div>
					
					<div style="padding-left:20px;background-color:yellow">${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.mucTieu))} </div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">ĐỒ DÙNG VÀO PHƯƠNG TIỆN DẠY HỌC : 
					</div>
					<div style="padding-left:20px">${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.doDungPTDH))}</div>
					<div style="padding-left:20px;background-color:yellow">${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.doDungPTDH))}</div>
					
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<div class = "div_textleft">HÌNH THỨC TỔ CHỨC VÀ DẠY HỌC : 
					</div>
					<div style="padding-left:20px">${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.hinhThucTCDH))}</div>
					<div style="padding-left:20px;background-color:yellow">${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.hinhThucTCDH))}</div>
						
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">I.ỔN ĐỊNH LỚP HỌC: </div>
				</td>
				<td style="padding-right:40px">
					Thời gian : ${giaoAnLyThuyet.thoiGianOnDinh} phút
					<span style="background-color:yellow">${giaoAnSoSanh.thoiGianOnDinh} phút</span>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td colspan = "2">		
					<div style="padding-left:20px">${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.onDinhLH))}
					</div>
					<div style="padding-left:20px;background-color:yellow">${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.onDinhLH))}
					</div>
				</td>
			</tr>
			<tr style="background-color: transparent;">
				<td>
					<div class = "div_textleft">II.THỰC HIỆN BÀI HỌC:</div>
				</td>
				<td style="padding-right:40px">
					Thời gian : ${giaoAnLyThuyet.thoiGianTHBH} phút
					
					<span style="background-color:yellow">${giaoAnSoSanh.thoiGianTHBH} phút</span>
				</td>
			</tr>
		</table>
<br/>
		<div style='padding-right: 100px'>
		
		<table border = "1" width="650px" style="background-color: transparent;">
			<tr style="background-color: transparent;">
				<td align='center' rowspan = "2" width="50px" >STT</td>
				<td align='center' rowspan = "2" >NỘI DUNG</td>
				<td align='center' colspan = "2" >HOẠT ĐỘNG DẠY HỌC</td>
				<td align='center' rowspan = "2" width="50px">THỜI GIAN</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align='center' width="175px">HOẠT ĐỘNG CỦA GIÁO VIÊN</td>
				<td align='center' width="175px">HOẠT ĐỘNG CỦA HỌC SINH</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align='center'>1</td>
				<td>Dẫn nhập : <a class='error' id='aDanNhap'></a>
				<br />
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.danNhap))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.danNhap))}
					</p>
					
				</td>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDDanNhapGV))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDDanNhapGV))}
					</p>
					
				</td>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDDanNhapHS))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDDanNhapHS))}</p>
					
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianDanNhap}
					<p style='background-color:yellow'>
					${giaoAnSoSanh.thoiGianDanNhap}</p>
					
				</td>
			</tr>
			<tr>
				<td align='center'>2</td>
				<td>Hướng Dẫn Ban Đầu : <br />
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.huongDanBanDau))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.huongDanBanDau))}
					</p>
					
				</td>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDHDBDGV))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDHDBDGV))}
					</p>
					
				</td>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDHDBDHS))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDHDBDHS))}
					</p>
					
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianHDBD}
					<p style='background-color:yellow'>
					${giaoAnSoSanh.thoiGianHDBD}</p>
					
				</td>
			</tr>
			<tr>
				<td align='center'>3</td>
				<td>Hướng dẫn thường xuyên : <br />
					${sf:appendBrTag3(sf:appendBrTag2(chiTietKHGD.noiDungTH))}
					<p style='background-color:yellow'>
					<!-- ChiTietKHGD lay ra noi dung thuc hanh chua lay ra duoc -->
					
					${sf:appendBrTag3(sf:appendBrTag2(chiTietKHGDSS.noiDungTH))}
					</p>
					
				</td>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDHDTXGV))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDHDTXGV))}</p>
					
				</td>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDHDTXHS))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDHDTXHS))}
					</p>
					
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianHDTX}
					<p style='background-color:yellow'>
					${giaoAnSoSanh.thoiGianHDTX}</p>
					
				</td>
			</tr>
			<tr>
				<td align='center'>4</td>
				<td>Hướng dẫn kết thúc : <br />
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.huongDanKetThuc))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.huongDanKetThuc))}</p>
					
				</td>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDHDKTGV))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDHDKTGV))}</p>
					
				</td>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDHDKTHS))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDHDKTHS))}</p>
					
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianHDKT}
					<p style='background-color:yellow'>
					${giaoAnSoSanh.thoiGianHDKT}</p>
					
				</td>
			</tr>
			<tr>
				<td align='center'>5</td>
				<td>Hướng dẫn rèn luyện : <br />
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.huongDanRenLuyen))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.huongDanRenLuyen))}</p>
					
				</td>
				<td colspan="2">
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.HDHDRLGV))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.HDHDRLGV))}</p>
					
				</td>
				<td align='center'>
					${giaoAnLyThuyet.thoiGianHDRL}
					<p style='background-color:yellow'>
					${giaoAnSoSanh.thoiGianHDRL}</p>
					
				</td>
			</tr>
		</table>
		<table style="background-color: transparent;">
			<tr>
				<td>
					<div class = "div_textleft">III. RÚT KINH NGHIỆM TỔ CHỨC THỰC HIỆN :</div>
				</td>
			</tr>	
			<tr>
				<td>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnLyThuyet.rutKinhNghiem))}
					<p style='background-color:yellow'>
					${sf:appendBrTag3(sf:appendBrTag2(giaoAnSoSanh.rutKinhNghiem))}
					</p>
					
				</td>
			</tr>
		</table>
		</div>
		<table style="background-color: transparent;;width:750px;padding-right:100px">
			<tr style="background-color: transparent;">
				<td align="center" width="325px"><br />TRƯỞNG KHOA/TRƯỞNG TỔ MÔN</td>
				<td align="center" width="325px"><!-- ${sf:setFormatDate(giaoAnLyThuyet.ngayTao)} -->
				<table>
					<tr>
						<td width="60">Ngày</td><td width="60">Tháng</td><td width="65">Năm</td>
					</tr>
				</table>
				<br />GIÁO VIÊN</td>
			</tr>
			<tr style="background-color: transparent;">
				<td align="center"><br/><br/><br/><br/><br/><br/>${objKHGD.tenTruongKhoa}
				<p style="background-color:yellow">
					${objKHGDSS.tenTruongKhoa}</p></td>
				<td align="center"><br/><br/><br/><br/><br/><br/>${objKHGD.tenGiaoVien}
				<p style="background-color:yellow">
					${objKHGDSS.tenGiaoVien}
				</p>
				</td>
			</tr>
		</table>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>