<%
	if(session.getAttribute("maVaiTro")!=null){
		String maVaiTro = session.getAttribute("maVaiTro").toString();
		if(maVaiTro.equals("9")){
%>
	<jsp:forward page="HocSinh/BaoCaoDiemDanhHS.jsp" />
<%
		}else{
%>
	<jsp:forward page="GiaoVien/BaoCaoDiemDanhGV.jsp" />
<%
		}
	}
%>