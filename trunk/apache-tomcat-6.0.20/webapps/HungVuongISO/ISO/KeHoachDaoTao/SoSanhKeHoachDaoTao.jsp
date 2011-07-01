<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@ taglib uri="/WEB-INF/tlds/StringFunction" prefix="sf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<pd4ml:transform
	screenWidth="1000"
	pageFormat="A4"
	pageOrientation="landscape"	
	pageInsets="30,0,20,0,points"
	enableImageSplit="false"
	encoding="UTF-8">
<pd4ml:usettf from="java:fonts" serif="Times New Roman" sansserif="Arial" monospace="Courier New" />
<pd4ml:header
		watermarkUrl="http://localhost:8080/HungVuongISO/images/footer.gif"   
       	watermarkOpacity="50"
	   	watermarkBounds="0,547,850,20">
</pd4ml:header>
<pd4ml:footer 
       titleTemplate="     BM04-QT7.3/1                     Ngày hiệu lực: 15/9/2009"
       pageNumberTemplate="Trang $[page]/$[total]"
       titleAlignment="left"
       pageNumberAlignment="right"       
       color="#000000"             
       initialPageNumber="1"       
       pagesToSkip="0"
       areaHeight="20"
       watermarkUrl="http://localhost:8080/HungVuongISO/images/mask.gif"   
       watermarkOpacity="50"
	   watermarkBounds="0,580,500,20"	      
       fontSize="14">       
 </pd4ml:footer>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysParamsDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>;url=<%=request.getContextPath()%>/Logout.jsp">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<title>So sánh Kế Hoach Đào Tạo</title> 
</head>
<div align="center">
<div class = "div_body">
<c:set var="KHDT" value="${sessionScope.KHDTObj}"></c:set>
<c:set var = "KHDTSoSanh" value='<%=KeHoachDaoTaoDao.getKeHoachDaoTaoByID(request.getParameter("SoSanhKeHoach")) %>'></c:set>
<table width="1000" height="691" bgcolor="#808080" align="center" style="background-image: url('<%=request.getContextPath()%>/images/background_print.jpg');">
	
	<tr><td>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">TRƯỜNG TCN KTCN HÙNG VƯƠNG<br/>PHÒNG ĐÀO TẠO</p></td>
			<td><p style="font-weight: bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br/>
											 Độc lập - Tự do - Hạnh phúc</p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><img src="<%=request.getContextPath()%>/images/HeaderIcon.gif"/></td>
			<td><img src="<%=request.getContextPath()%>/images/HeaderIcon.gif"/></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<th colspan = "2"><br /> <p style="font-weight: bold; font-size: 20px"> SO SÁNH KẾ HOẠCH ĐÀO TẠO HỆ CHÍNH QUI DÀI HẠN NĂM HỌC ${KHDT.nam1} -  ${KHDT.nam2}</p>
																<p style="background-color: yellow; font-size: 20px; font-weight: bold">VÀ NĂM HỌC ${KHDTSoSanh.nam1} -  ${KHDTSoSanh.nam2}</p><br /></th>
		</tr>
	<!-- 	<tr align="center" style="background-color: transparent; background-position: center;">
			<td colspan = "2">
			Phát huy hiệu quả đào tạo trong năm ${KHDT.nam3}-${KHDT.nam4}, nhằm không ngừng ổn định và nâng cao chất lượng đào tạo, hoàn thiện công tác quản lý, Trường Trung cấp nghề Kỹ thuật Công nghệ Hùng Vương xác định nhiệm vụ trọng tâm năm học ${KHDT.nam1} -  ${KHDT.nam2} với một số chủ điểm sau :
			</td>
		</tr>  -->
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<br/><p style="font-weight: bold">I./ NHIỆM VỤ NĂM HỌC :</p></div>
			</td>
		</tr>
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">			
			<tr style="background-color: transparent;">
				<td colspan = "2">
					<u>Công tác quản lý:</u> <p> ${sf:appendPTag(KHDT.nhiemVu1)} </p>${sf:appendPTagWithColor(KHDTSoSanh.nhiemVu1)}
				</td>
			</tr>						
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;" height="300">
			<td colspan = "2">
				<u>Đội ngũ giáo viên: </u> <p> ${sf:appendPTag(KHDT.nhiemVu2)}</p>${sf:appendPTagWithColor(KHDTSoSanh.nhiemVu2)}
			</td>
		</tr>	
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">				
		<tr style="background-color: transparent;" height="300">
			<td colspan = "2">
				<u>Chương trình, giáo trình:</u> <p> ${sf:appendPTag(KHDT.nhiemVu3)}</p>${sf:appendPTagWithColor(KHDTSoSanh.nhiemVu3)}
			</td>
		</tr>
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">		
		<tr style="background-color: transparent;" height="300">
			<td colspan = "2">
				<u>Một số giải pháp nâng cao động cơ học tập của học sinh:</u> <p> ${sf:appendPTag(KHDT.nhiemVu4)}</p>${sf:appendPTagWithColor(KHDTSoSanh.nhiemVu4)}
			</td>
		</tr>	
	</table>
	<table width = "900" align="center" style="background-color: transparent; background-position: top;">
		<tr style="background-color: transparent;">
			<td colspan = "2"><div class = "div_textleft">
				<p style="font-weight: bold">II./ KẾ HOẠCH CÔNG TÁC :</p></div>
			</td>
		</tr>
	</table>
	
	<br /><div style="">
	<table border = "1" width = "900" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td rowspan = "2">TUẦN</td>
			<td rowspan = "2">THỜI GIAN<br />(Từ ngày - đến ngày) <br />(mm-dd-yyyy)</td>
			<td colspan = "2">KHÓA ${KHDT.user1}<p style="background-color: yellow;">${KHDTSoSanh.user1}</p></td>
			<td colspan = "2">KHÓA ${KHDT.user2}<p style="background-color: yellow;">${KHDTSoSanh.user2}</p></td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td>Nội dung công tác</td>
			<td>Bộ phận thực hiện</td>
			<td>Nội dung công tác</td>
			<td>Bộ phận thực hiện</td>
		</tr>
		<c:set var = "count1" value="0"></c:set>
		<c:set var = "count2" value="0"></c:set>
		<%int countChinh = 0, countSoSanh = 0; %>
		
			
			<c:set var = "Status1" value = "0"	/>
			<c:set var = "Status2" value = "0"	/>
		<c:forEach var = "iterator" begin = "1" end = "${sf:getSizeOfListChiTietKHDT(KHDT.chiTietKHDTList) + sf:getSizeOfListChiTietKHDT(KHDTSoSanh.chiTietKHDTList)}">	
			
			
			<c:set var = "countChinh" value = "<%=countChinh %>"/>
			<c:set var = "countSoSanh" value = "<%=countSoSanh %>"/>
			<c:set var = "ThuTuTuan1" value = "${KHDT.chiTietKHDTList[countChinh].thuTuTuan}"/>
			<c:set var = "ThuTuTuan2" value = "${KHDTSoSanh.chiTietKHDTList[countSoSanh].thuTuTuan}"	/>
			
			<c:if test="${ThuTuTuan1 eq 1}">
				<c:set var = "Status1" value = "1"	/>
			</c:if>
			<c:if test="${ThuTuTuan2 eq 1}">
				<c:set var = "Status2" value = "1"	/>
			</c:if>
			<c:choose>
				<c:when test="${Status1 eq 0 and Status2 eq 0}">
					<c:choose>
						<c:when test="${ThuTuTuan1 ge ThuTuTuan2}">
							<c:set var = "ThuTuTuan" value = "${ThuTuTuan2}"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var = "ThuTuTuan" value = "${ThuTuTuan1}"></c:set>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${Status1 eq 0}">
					<c:set var = "ThuTuTuan" value = "${ThuTuTuan1}"></c:set>
				</c:when>
				<c:when test="${Status2 eq 0}">
					<c:set var = "ThuTuTuan" value = "${ThuTuTuan2}"></c:set>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${ThuTuTuan1 ge ThuTuTuan2}">
							<c:set var = "ThuTuTuan" value = "${ThuTuTuan2}"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var = "ThuTuTuan" value = "${ThuTuTuan1}"></c:set>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			
			
			
		<c:choose>
			<c:when test="${ThuTuTuan1 eq ThuTuTuan and not empty KHDT.chiTietKHDTList[countChinh]}">
				<c:set var = "list" value = "${sf:getListNoiDungByKhoa(KHDT.chiTietKHDTList[countChinh])}"/>
				<c:set var = "count1" value = "${sf:getSizeOfList(list[0])}"/>
				<c:set var = "count2" value = "${sf:getSizeOfList(list[1])}"/>
				<c:choose>
					<c:when test="${count1 ge count2}">
						<c:set var = "count" value = "${count1}"/>
					</c:when>
					<c:otherwise>
						<c:set var = "count" value = "${count2}"/>
					</c:otherwise>
				</c:choose>
				<c:forEach var = "i" begin = "1" end="${count}">
					<tr align="center" style="background-color: transparent; background-position: center;">
						
						<c:if test = "${i eq 1}">
							<td rowspan="${count}">${KHDT.chiTietKHDTList[countChinh].thuTuTuan}</td>
							<td rowspan="${count}">${KHDT.chiTietKHDTList[countChinh].tuNgay} <b>-</b> ${KHDT.chiTietKHDTList[countChinh].denNgay}</td>
						</c:if>
						<td>
							<c:choose>
								<c:when test = "${not empty list[0][i-1].noiDungCongTac}">
									${list[0][i-1].noiDungCongTac}
								</c:when>
								<c:otherwise>
									<p></p>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test = "${not empty list[0][i-1].boPhanThucHienKHDTModelList}">
									<c:forEach var = "boPhan" items="${list[0][i-1].boPhanThucHienKHDTModelList}">
										<c:choose>
											<c:when test="${boPhan.maKhoa eq -1}">
												-${sf:replaceString(boPhan.tenBoPhan)}<br/>
											</c:when>
											<c:otherwise>
												-${boPhan.tenBoPhan}<br/>
											</c:otherwise>
									</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p></p>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test = "${not empty list[1][i-1].noiDungCongTac}">
									${list[1][i-1].noiDungCongTac}
								</c:when>
								<c:otherwise>
									<p></p>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test = "${not empty list[1][i-1].boPhanThucHienKHDTModelList}">
									<c:forEach var = "boPhan" items="${list[1][i-1].boPhanThucHienKHDTModelList}">
										<c:choose>
											<c:when test="${boPhan.maKhoa eq -1}">
												-${sf:replaceString(boPhan.tenBoPhan)}<br/>
											</c:when>
											<c:otherwise>
												-${boPhan.tenBoPhan}<br/>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p></p>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				<% countChinh++; %>
			</c:when>
			<c:otherwise>
				<c:if test="${not empty KHDTSoSanh.chiTietKHDTList[countSoSanh]}">
					<c:set var = "list" value = "${sf:getListNoiDungByKhoa(KHDTSoSanh.chiTietKHDTList[countSoSanh])}"/>
					<c:set var = "count1" value = "${sf:getSizeOfList(list[0])}"/>
					<c:set var = "count2" value = "${sf:getSizeOfList(list[1])}"/>
					<c:choose>
						<c:when test="${count1 ge count2}">
							<c:set var = "count" value = "${count1}"/>
						</c:when>
						<c:otherwise>
							<c:set var = "count" value = "${count2}"/>
						</c:otherwise>
					</c:choose>
					<c:forEach var = "i" begin = "1" end="${count}">
						<tr align="center" style="background-color: transparent; background-position: center; background-color: yellow;">
							
							<c:if test = "${i eq 1}">
								<td rowspan="${count}">${KHDTSoSanh.chiTietKHDTList[countSoSanh].thuTuTuan}</td>
								<td rowspan="${count}">${KHDTSoSanh.chiTietKHDTList[countSoSanh].tuNgay} <b>-</b> ${KHDTSoSanh.chiTietKHDTList[countSoSanh].denNgay}</td>
							</c:if>
							<td>
								<c:choose>
									<c:when test = "${not empty list[0][i-1].noiDungCongTac}">
										${list[0][i-1].noiDungCongTac}
									</c:when>
									<c:otherwise>
										<p></p>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test = "${not empty list[0][i-1].boPhanThucHienKHDTModelList}">
										<c:forEach var = "boPhan" items="${list[0][i-1].boPhanThucHienKHDTModelList}">
											<c:choose>
												<c:when test="${boPhan.maKhoa eq -1}">
													-${sf:replaceString(boPhan.tenBoPhan)}<br/>
												</c:when>
												<c:otherwise>
													-${boPhan.tenBoPhan}<br/>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p></p>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test = "${not empty list[1][i-1].noiDungCongTac}">
										${list[1][i-1].noiDungCongTac}
									</c:when>
									<c:otherwise>
										<p></p>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test = "${not empty list[1][i-1].boPhanThucHienKHDTModelList}">
										<c:forEach var = "boPhan" items="${list[1][i-1].boPhanThucHienKHDTModelList}">
											<c:choose>
												<c:when test="${boPhan.maKhoa eq -1}">
													-${sf:replaceString(boPhan.tenBoPhan)}<br/>
												</c:when>
												<c:otherwise>
													-${boPhan.tenBoPhan}<br/>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p></p>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
					<% countSoSanh++; %>
				</c:if>	
			</c:otherwise>
		</c:choose>		
		</c:forEach>
	</table></div>
	<br />	
	<table width = "900" align="center" style="background-color: transparent; background-position: center;">
		<tr align="center" style="background-color: transparent; background-position: center;">
			<c:set var="sig" value="-"></c:set>
			<td>Ngày ${sf:getElement(KHDT.ngayDuyet,0,sig)} tháng ${sf:getElement(KHDT.ngayDuyet,1,sig)} năm ${sf:getElement(KHDT.ngayDuyet,2,sig)}</td>
			<td>Quận 5, ngày ${sf:getElement(KHDT.ngayLap,0,sig)} tháng ${sf:getElement(KHDT.ngayLap,1,sig)} năm ${sf:getElement(KHDT.ngayLap,2,sig)}</td>
		</tr>
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">BAN GIÁM HIỆU DUYỆT </p></td>
			<td><p style="font-weight: bold">PHÒNG ĐÀO TẠO</p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>
		<tr>
			<td><p></p></td>
			<td><p></p></td>
		</tr>		
		<tr align="center" style="background-color: transparent; background-position: center;">
			<td><p style="font-weight: bold">${KHDT.tenNguoiDuyet}</p></td>
			<td><p style="font-weight: bold">${KHDT.tenNguoiLap}</p></td>
		</tr>
	</table>
	</td></tr>	
</table>
</div>
</div>
</html>
</pd4ml:transform>