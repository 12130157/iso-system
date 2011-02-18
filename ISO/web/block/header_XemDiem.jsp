<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="vn.edu.hungvuongaptech.dao.SysRoleMenuDAO"%>
<%@page import="vn.edu.hungvuongaptech.dao.SysRoleAppDAO"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/general.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/menu_files/cbcscbmenu.css" type="text/css">
<%@page import="vn.edu.hungvuongaptech.common.Constant"%>
	
<c:set var="sysRoleAppMenuList" value='<%= SysRoleMenuDAO.findSysRoleAppMenu(session.getAttribute("maBoPhan").toString(), Constant.APP_XEMDIEM) %>'></c:set>

<c:set var="sysRoleAppFirst" value='<%= SysRoleAppDAO.getFirstSysApp() %>'></c:set>

<div class = "header">
	<fmt:bundle basename="i18n">
	
	<div id="banner"></div>
		 <div class="div_welcome">
			<!--<div class = "div_rong">
				<ul id="ebul_cbmenu_1" class="ebul_cbmenu" style="display: none;">
				<li><img src="<%=request.getContextPath()%>/menu_files/cbsiicbmenu_1.png" alt=""><a href = "<%=request.getContextPath()%>/help/HuongDanSuDung.jsp" title="">Hướng dẩn sử dụng</a></li>
				<li><img src="<%=request.getContextPath()%>/menu_files/cbsiicbmenu_3.png" alt=""><a href = "<%=request.getContextPath()%>/help/NhomPhatTrien.jsp" title="">Nhóm phát triển</a></li>
				</ul>
				<ul id="cbmenuebul_table" class="cbmenuebul_menulist" style="width: 25px; height: 25px;">
	 				 <li><a><img id="cbi_cbmenu_1" src="<%=request.getContextPath()%>/menu_files/ebbtcbmenu1_0.png" name="ebbcbmenu_1" width="25" height="25" style="vertical-align: bottom;" border="0" alt="" title=""></a></li>
				</ul>
			</div> -->
			<c:if test="${not empty sessionScope.tenDangNhap}" >
				<fmt:message key="iso.loginWelcome">
					<fmt:param value="${ sessionScope.tenThanhVien }"/>
					<fmt:param value="${ sessionScope.tenVaiTro } (${ sessionScope.tenBoPhan})"/>
				</fmt:message>-<a class="link" href="<%= Constant.PATH_RES.getString("iso.changePasswordPath") %>">[<fmt:message key="iso.changePasswordLabel" />]</a> - <a class="link" href="javascript: if (confirm('Bạn có chắc muốn thoát ???')) { window.location.href='<%= Constant.PATH_RES.getString("iso.logoutPath") %>' } else { void('') }; ">[<fmt:message key="iso.logoutLabel" />]</a>
			</c:if>
		</div>

	<div class="dock" id="dock">
  <div class="dock-container">
	<c:set var="chucNangMenu" value='<%= Constant.APP_XEMDIEM %>'></c:set>
  			
			<c:choose>
				<c:when test="${not empty sessionScope.maVaiTro}">					
					<c:forEach var="obj" items="${sysRoleAppMenuList}">					
						<c:choose>
							<c:when test="${obj.menuID eq  chucNangMenu}">
								<a class="dock-item" href="${obj.menuLink}?appID=${sysRoleAppFirst.appID}"><img src="<%=request.getContextPath()%>/${obj.menuImage}" alt="${obj.menuName}" border="0"><span>${obj.menuName}</span></a>						
							</c:when>
							<c:otherwise>
								<a class="dock-item" href="${obj.menuLink}"><img src="<%=request.getContextPath()%>/${obj.menuImage}" alt="${obj.menuName}" border="0"><span>${obj.menuName}</span></a>						
							</c:otherwise>
						</c:choose>
					</c:forEach>					
				</c:when>				
			</c:choose>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/menu_files/cbjscbmenu.js"></script>
	<script type="text/javascript">
	    $(document).ready(
	    		function()
	    		{
	    			$('#dock').Fisheye(
	    				{
	    					maxWidth: 100,
	    					items: 'a',
	    					itemsText: 'span',
	    					container: '.dock-container',
	    					itemWidth: 40,
	    					proximity: 55,
	    					halign : 'center'
	    				}
	    			);
	    		}
	    	);
	    
	</script>
	</fmt:bundle>
</div>