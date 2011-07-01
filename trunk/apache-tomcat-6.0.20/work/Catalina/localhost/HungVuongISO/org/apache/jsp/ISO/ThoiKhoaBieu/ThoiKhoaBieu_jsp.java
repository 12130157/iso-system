package org.apache.jsp.ISO.ThoiKhoaBieu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import vn.edu.hungvuongaptech.model.HeDaoTaoModel;
import vn.edu.hungvuongaptech.dao.HeDaoTaoDAO;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.dao.LopHocDAO;
import vn.edu.hungvuongaptech.model.TuanLeModel;
import vn.edu.hungvuongaptech.dao.TuanLeDAO;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO;
import vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel;
import vn.edu.hungvuongaptech.model.NamHocModel;
import vn.edu.hungvuongaptech.dao.NamHocDAO;
import vn.edu.hungvuongaptech.model.SuDungModel;
import vn.edu.hungvuongaptech.dao.SuDungDAO;

public final class ThoiKhoaBieu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fend_005fbegin;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fchoose;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fotherwise;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fend_005fbegin = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fchoose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fotherwise = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue.release();
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fend_005fbegin.release();
    _005fjspx_005ftagPool_005fc_005fchoose.release();
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.release();
    _005fjspx_005ftagPool_005fc_005fotherwise.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<meta http-equiv=\"refresh\" content=\"");
      out.print( session.getMaxInactiveInterval() );
      out.write(";url=");
      out.print(request.getContextPath());
      out.write("/Logout.jsp\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/general.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/aqua.css\" />\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/js/General.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery-1.3.2.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/js/zapatec.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/js/calendar.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/js/calendar-en.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/interface.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("<!--[if lt IE 7]>\r\n");
      out.write(" <style type=\"text/css\">\r\n");
      out.write(" div, img { behavior: url(\"");
      out.print(request.getContextPath());
      out.write("/css/iepngfix.htc\") }\r\n");
      out.write(" </style>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("<script type=\"text/javascript\" language=\"JavaScript\">\r\n");
      out.write("var duongDan = '';\r\n");
      out.write("var arrSuDungKhongThuocTKB = new Array();\r\n");
      out.write("var arrSuDungThuocTKB = new Array();\r\n");

	int size1 = 0, size2 = 0;
	ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
	if(request.getParameter("maID") != null) {
		thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuByID(request.getParameter("maID"));
	}
	if(request.getAttribute("thoiKhoaBieu") != null)
	{
		thoiKhoaBieuModel = (ThoiKhoaBieuModel) request.getAttribute("thoiKhoaBieu");
		//thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuByID(thoiKhoaBieuModel.getMaThoiKhoaBieu());
		out.print("duongDan = 'ISO/ThoiKhoaBieu/';");
	}	
	ArrayList<TuanLeModel> tuanLeModelList = TuanLeDAO.getAllTuanLe();
	ArrayList<NamHocModel> namHocModelList = NamHocDAO.getAllNamHoc();
	

      out.write("\r\n");
      out.write("var maChuongTrinh = '';\r\n");
      out.write("var hocKi = '';\r\n");
      out.write("var rowSang = 0, rowChieu = 0;\r\n");
      out.write("var soNam;\r\n");
      out.write("var namBatDau;\r\n");
      out.write("var obj = new Object();\r\n");
      out.write("var monHocList = new Array(); // mang chua cac mon hoc da tao tkb\r\n");
      out.write("var tuanLe = new Array(); \r\n");
      out.write("var soHocSinh = \"\";\r\n");
      out.write("var addTKB = new Array(); // mang chua toan bo chi tiet ve cac mon hoc\r\n");
      out.write("var ngay = new Array();\r\n");
      out.write("var maNamHoc, maTKB;\r\n");
      out.write("function pageLoad()\r\n");
      out.write("{\r\n");
      out.write("\t");

	String str = "";
	out.print("if('" + request.getParameter("Them") + "' == 'null' || " + request.getParameter("maID") + " != null){");
	out.print("if('" + thoiKhoaBieuModel.getMaLop() + "' != '') {");
	out.print("document.getElementById('Lop').value = '" + thoiKhoaBieuModel.getMaLop() + "';");
	out.print("selectLop(); ");
	out.print("if('" + thoiKhoaBieuModel.getHocKi() + "' != '') ");
	out.print("document.getElementById('HocKi').value = '" + thoiKhoaBieuModel.getHocKi() + "';");
	out.print("if('" + thoiKhoaBieuModel.getNam1() + "' != '') {");
	out.print("document.getElementById('Nam1').value = '" + thoiKhoaBieuModel.getNam1() + "';");
	out.print("selectNam1();}");
	out.print("if('" + thoiKhoaBieuModel.getTuanBatDau() +"' != '') {");
	out.print("document.getElementById('TuanBatDau').value = '" + thoiKhoaBieuModel.getTuanBatDau() + "';");
	out.print("document.getElementById('TuNgay').value = '" + thoiKhoaBieuModel.getNgayBatDau() + "';");
	out.print("tuanLe[0] = document.getElementById('TuanBatDau').value;}");
	out.print("if('" + thoiKhoaBieuModel.getTuanKetThuc() +"' != '') {");
	out.print("document.getElementById('TuanKetThuc').value = '" + thoiKhoaBieuModel.getTuanKetThuc() + "';");
	out.print("document.getElementById('DenNgay').value = '" + thoiKhoaBieuModel.getNgayKetThuc() + "';");
	out.print("tuanLe[1] = document.getElementById('TuanKetThuc').value;} }");
	if(thoiKhoaBieuModel.getMonHocTKBModelList() != null) {
		for(int i=0;i<thoiKhoaBieuModel.getMonHocTKBModelList().size();i++) {
			out.print("var monHoc = new Object();");// tao obj chua ten mon hoc va ma mon hoc
			out.print("var objTKB = new Object();");
			out.print("monHoc.maMonHoc = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getMaMonHoc() + "';");
			out.print("monHoc.tenMonHoc = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTenMonHoc() + "';");
			out.print("monHocList[monHocList.length] = monHoc;");
			out.print("objTKB.tenMonHoc = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTenMonHoc() + "';");
			out.print("objTKB.tenGiaoVien = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTenGiaoVien() + "';");
			if(thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauLT() != null)
				out.print("objTKB.ngayBatDauLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauLT().replace("-","/") + "';");
			else
				out.print("objTKB.ngayBatDauLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauLT() + "';");
			if(thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauTH() != null )
				out.print("objTKB.ngayBatDauTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauTH().replace("-","/") + "';");
			else
				out.print("objTKB.ngayBatDauTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayBatDauTH() + "';");	
			if(thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucLT() != null)
				out.print("objTKB.ngayKetThucLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucLT().replace("-","/") + "';");
			else
				out.print("objTKB.ngayKetThucLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucLT() + "';");
			if(thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucTH() != null)
				out.print("objTKB.ngayKetThucTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucTH().replace("-","/") + "';");
			else
				out.print("objTKB.ngayKetThucTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getNgayKetThucTH() + "';");
			out.print("objTKB.ghiChu = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getGhiChu() + "';");
			
			out.print("objTKB.maMonHoc = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getMaMonHoc() + "';");
			out.print("objTKB.maGiaoVien = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getMaGiaoVien() + "';");
			out.print("objTKB.maMonHocTKB = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getMaMonHocTKB() + "';");
			out.print("objTKB.chuoiThuTrongTuan = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChuoiThuTrongTuan() + "';");
			out.print("objTKB.phongLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChuoiPhongLT() + "';");
			out.print("objTKB.phongTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChuoiPhongTH() + "';");
			out.print("objTKB.soNoiDung = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getSoNoiDung() + "';");
			out.print("objTKB.soCaThucHanh = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getSoCaThucHanh() + "';");
			out.print("objTKB.kieuBienSoan = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getKieuBienSoan() + "';");
			out.print("objTKB.soTietLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getLyThuyetCTMH() + "';");
			out.print("objTKB.soTietTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getThucHanhCTMH() + "';");
			out.print("objTKB.tuanBatDauLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTuanBatDauLT() + "';");
			out.print("objTKB.tuanBatDauTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getTuanBatDauTH() + "';");
			out.print("objTKB.maPhongLT = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getUser1() + "';");
			out.print("objTKB.maPhongTH = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getUser2() + "';");
			out.print("var arrChiTiet = new Array();");
			
			
			for(int j=0;j<thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().size();j++) {
				out.print("var chiTiet = new Object();");
				out.print("chiTiet.maChiTietTKB = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getMaChiTietTKB() + "';");
				out.print("chiTiet.buoi = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getBuoi() + "';");
				out.print("chiTiet.sTTNoiDung = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getsTTNoiDung() + "';");
				out.print("chiTiet.coHieu = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getCoHieu() + "';");
				out.print("chiTiet.hinhThucDay = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getHinhThucDay() + "';");
				out.print("chiTiet.thuTrongTuan = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getThuTrongTuan() + "';");
				out.print("chiTiet.phong = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getMaPhong() + "';");
				out.print("chiTiet.tuan = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getTuan() + "';");
				out.print("chiTiet.soThuTu = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getSoThuTu() + "';");
				out.print("chiTiet.nhom = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getNhom() + "';");
				
				out.print("chiTiet.tenChuong = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getChiTietTKBModelList().get(j).getTenChuong() + "';");
				//out.print("chiTiet.maSuDung = '" + thoiKhoaBieuModel.getMonHocTKBModelList().get(i).getSuDungModelList().get(j).getMaSuDung() + "';");
				out.print("arrChiTiet[" + j + "] = chiTiet;");
				
			}	
			out.print("objTKB.chiTietTKBList = arrChiTiet;");
			out.print("addTKB[" + i + "] = objTKB;");
			out.print("createRow(objTKB, 0);");
		}
	}
	out.print("maTKB = '" + thoiKhoaBieuModel.getMaThoiKhoaBieu() + "'; }");
	//out.print("tuanLe[0] = document.getElementById('TuanBatDau').value;");
	//out.print("tuanLe[1] = document.getElementById('TuanKetThuc').value;");
	//out.print("changeButton();}");
	if(thoiKhoaBieuModel.getMaThoiKhoaBieu() != null && thoiKhoaBieuModel.getMaThoiKhoaBieu() != "") {
		out.print("document.getElementById('Lop').disabled = true;");
		out.print("document.getElementById('HocKi').disabled = true;");
		out.print("document.getElementById('Nam1').disabled = true; ");
	}
	
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function selectLop()\r\n");
      out.write("{\r\n");
      out.write("\tif(document.getElementById('Lop').value != '')\r\n");
      out.write("\t{\r\n");
      out.write("\t\t");

			ArrayList<LopHocModel> lopHocModelList = LopHocDAO.getAllLopByMaChuongTrinhApproved();
			for(int i=0;i<lopHocModelList.size();i++) {
				out.print("if(document.getElementById('Lop').value == " + lopHocModelList.get(i).getMaLopHoc() + ") {");
				out.print("document.getElementById('ChuyenNganh').value = '" + lopHocModelList.get(i).getTenChuyenNganh() + "';");
				out.print("namBatDau = " + lopHocModelList.get(i).getNamBatDau() + ";");
				out.print("soHocSinh = '" + lopHocModelList.get(i).getSoHocSinh() + "';");
				out.print("maChuongTrinh = " + lopHocModelList.get(i).getMaChuongtrinh() + "; }");
			}
			ArrayList<HeDaoTaoModel> heDaoTaoModelList = HeDaoTaoDAO.getSoNamHeDaoTao();
			for(int i=0;i<heDaoTaoModelList.size();i++) {
				out.print("if(maChuongTrinh == " + heDaoTaoModelList.get(i).getMaChuongtrinh() + ")");
				out.print("soNam = " + heDaoTaoModelList.get(i).getSoNam() + ";");
			}
		
      out.write("\r\n");
      out.write("\t\tdocument.getElementById('Nam1').innerHTML = null;\r\n");
      out.write("\t\tvar nam = namBatDau;\r\n");
      out.write("\t\tfor(var i=1;i<=soNam;i++)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tvar Opt = new Option(nam, nam);\r\n");
      out.write("\t\t\tdocument.getElementById('Nam1').add(Opt, undefined);\r\n");
      out.write("\t\t\tnam += 1;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tselectNam1();\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.getElementById('ChuyenNganh').value = \"\";\r\n");
      out.write("\t\tdocument.getElementById('TuanBatDau').value = \"\";\r\n");
      out.write("\t\tdocument.getElementById('TuNgay').value = \"\";\r\n");
      out.write("\t\tdocument.getElementById('TuanKetThuc').value = \"\";\r\n");
      out.write("\t\tdocument.getElementById('DenNgay').value = \"\";\r\n");
      out.write("\t\tdocument.getElementById('HocKi').value = '1';\r\n");
      out.write("\t\tdocument.getElementById('Nam1').innerHTML = '';\r\n");
      out.write("\t\tdocument.getElementById('Nam1').add(new Option('--Select--', ''),undefined);\r\n");
      out.write("\t\tdocument.getElementById('Nam2').value = '';\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function selectNam1()\r\n");
      out.write("{\r\n");
      out.write("\tdocument.getElementById('Nam2').value = parseInt(document.getElementById('Nam1').value) + 1;\r\n");
      out.write("\t");

	if(namHocModelList != null) {
		for(int i=0;i<namHocModelList.size();i++) {
			out.print("if(document.getElementById('Nam1').value == '" + namHocModelList.get(i).getNamBatDau() + "')");
			out.print("maNamHoc = " + namHocModelList.get(i).getMaNamHoc() + ";");
		}
	}
	
      out.write("\r\n");
      out.write("\tkiemTraHocKi();\r\n");
      out.write("}\r\n");
      out.write("function selectTuanBatDau() \r\n");
      out.write("{\r\n");
      out.write("\ttuanLe[0] = document.getElementById('TuanBatDau').value;\r\n");
      out.write("\t");

	for(int i=0;i<tuanLeModelList.size();i++) {
		out.print("if(document.getElementById('Nam1').value == " + tuanLeModelList.get(i).getNamBatDau() + ") {");
		out.print("if(document.getElementById('TuanBatDau').value == " + tuanLeModelList.get(i).getSoThuTu() + ") {");
		out.print("document.getElementById('TuNgay').value = '" + tuanLeModelList.get(i).getTuNgay() + "'; } }");
	}
	
      out.write("\r\n");
      out.write("}\r\n");
      out.write("function selectTuanKetThuc()\r\n");
      out.write("{\r\n");
      out.write("\ttuanLe[1] = document.getElementById('TuanKetThuc').value;\r\n");
      out.write("\t");

	for(int i=0;i<tuanLeModelList.size();i++) {
		out.print("if(document.getElementById('Nam1').value == " + tuanLeModelList.get(i).getNamBatDau() + ") {");
		out.print("if(document.getElementById('TuanKetThuc').value == " + tuanLeModelList.get(i).getSoThuTu() + ") {");
		out.print("document.getElementById('DenNgay').value = '" + tuanLeModelList.get(i).getDenNgay() + "'; } }");
	}
	
      out.write("\r\n");
      out.write("}\r\n");
      out.write("function kiemTraHocKi()\r\n");
      out.write("{\r\n");
      out.write("\tif(document.getElementById('HocKi').value == '1')\r\n");
      out.write("\t\thocKi = (parseInt(document.getElementById('Nam1').value) - namBatDau) * 2 + 1;\r\n");
      out.write("\telse\r\n");
      out.write("\t\thocKi = (parseInt(document.getElementById('Nam1').value) - namBatDau) * 2 + 2;\r\n");
      out.write("}\r\n");
      out.write("function openAdd() \r\n");
      out.write("{\t\r\n");
      out.write("\tvar checkCapNhat = false;\r\n");
      out.write("\t");

	out.print("if('" + request.getParameter("Them") + "' == 'null' || " + request.getParameter("maID") + " != null){");
		out.print("if(monHocList.length == 0) {");
			out.print("if(confirm('Bạn có muốn cập nhật không, nếu không những thay đổi trong thời khóa biểu này sẽ không được lưu lại khi bạn thêm môn học???')) {");
				out.print("submitForm();");
				out.print("checkCapNhat = true; }");
			out.print("else {");
				out.print("tuanLe[0] = '" + thoiKhoaBieuModel.getTuanBatDau() + "';");
				out.print("tuanLe[1] = '" + thoiKhoaBieuModel.getTuanKetThuc() + "';");
				out.print("document.getElementById('TuNgay').value = '" + thoiKhoaBieuModel.getNgayBatDau() + "';");
				out.print("document.getElementById('DenNgay').value = '" + thoiKhoaBieuModel.getNgayKetThuc() + "';");
				out.print("document.getElementById('TuanBatDau').value = '" + thoiKhoaBieuModel.getTuanBatDau() + "';");
				out.print("document.getElementById('TuanKetThuc').value = '" + thoiKhoaBieuModel.getTuanKetThuc() + "'; } } }");
	
      out.write("\r\n");
      out.write("\tif(checkCapNhat == false)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar value = new Object;\r\n");
      out.write("\t\tobj.soHocSinh = soHocSinh;\r\n");
      out.write("\t\tobj.tuanLe = tuanLe;\r\n");
      out.write("\t\tobj.monHocList = monHocList;\r\n");
      out.write("\t\tvalue = window.showModalDialog(duongDan + \"AddThoiKhoaBieu.jsp?maChuongTrinh=\"+maChuongTrinh+\"&hocKi=\"+hocKi+\"&maNamHoc=\"+maNamHoc+\"&maTKB=\"+maTKB,obj,\"dialogHeight: 650px; dialogWidth: 750px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;\");\r\n");
      out.write("\t\tif(value != null)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\t\taddTKB[addTKB.length] = value;\r\n");
      out.write("\t\t\t\tvar monHoc = new Object();\r\n");
      out.write("\t\t\t\tmonHoc.maMonHoc = addTKB[addTKB.length-1].maMonHoc;\r\n");
      out.write("\t\t\t\tmonHoc.tenMonHoc = addTKB[addTKB.length-1].tenMonHoc;\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\tmonHocList[monHocList.length] = monHoc;\r\n");
      out.write("\t\t\t\tcreateRow(addTKB[addTKB.length-1], 0);\r\n");
      out.write("\t\t\t\t//changeButton();\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function openUpdate(x)\r\n");
      out.write("{\r\n");
      out.write("\tvar value = new Object;\r\n");
      out.write("\tobj.soHocSinh = soHocSinh;\r\n");
      out.write("\tobj.tuanLe = tuanLe;\r\n");
      out.write("\tvar maMonHocTKB = document.getElementById('cboXoaMonHoc').value;\r\n");
      out.write("\tvar index = 0;\r\n");
      out.write("\tfor(var i=0;i<addTKB.length;i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(addTKB[i].maMonHocTKB == maMonHocTKB)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tindex = i;\r\n");
      out.write("\t\t\tobj.monHocTKB = addTKB[i];\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tvar tableSang = document.getElementById('tableSang');\r\n");
      out.write("\tvar tableChieu = document.getElementById('tableChieu');\r\n");
      out.write("\tvalue = window.showModalDialog(duongDan + \"UpdateThoiKhoaBieu.jsp?maTKB=\"+maTKB+\"&maNamHoc=\"+maNamHoc+\"&maMonHocTKB=\"+maMonHocTKB + \"&capNhat=\" + x,obj,\"dialogHeight: 650px; dialogWidth: 750px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: Yes; status: Yes;\");\r\n");
      out.write("\tif(value != null)\r\n");
      out.write("\t{\r\n");
      out.write("\t\taddTKB[index] = value;\r\n");
      out.write("\t\tcreateRow(value,1);\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function createRow(monHocTkb, action)\r\n");
      out.write("{\r\n");
      out.write("\tif(action == 0)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar opt = new Option(monHocTkb.tenMonHoc, monHocTkb.maMonHocTKB);\r\n");
      out.write("\t\tdocument.getElementById('cboXoaMonHoc').add(opt, undefined);\r\n");
      out.write("\t}\r\n");
      out.write("\tvar checkBuoiSang = true, checkBuoiChieu = true;\r\n");
      out.write("\tvar chuoiLT = \"\", chuoiTH = \"\";\r\n");
      out.write("\tvar trSang, trChieu;\r\n");
      out.write("\tvar tableSang = document.getElementById('tableSang');\r\n");
      out.write("\tvar tableChieu = document.getElementById('tableChieu');\r\n");
      out.write("\tvar thu = monHocTkb.chuoiThuTrongTuan.split(\"-\");\r\n");
      out.write("\t\r\n");
      out.write("\tfor(var i=0;i<thu.length;i++)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif((thu[i].split(\"/\"))[2] == 'LT')\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(chuoiLT == \"\")\r\n");
      out.write("\t\t\t\tchuoiLT += \"Lý thuyết \" + monHocTkb.ngayBatDauLT + \"-\" + monHocTkb.ngayKetThucLT + \"<br/>\" + \"Phòng : \" + monHocTkb.phongLT + \"<br/>\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(chuoiTH == \"\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif((thu[i].split(\"/\"))[2] == 'TH')\r\n");
      out.write("\t\t\t\t\tchuoiTH += \"Thực hành \" + monHocTkb.ngayBatDauTH + \"-\" + monHocTkb.ngayKetThucTH + \"<br/>\" + \"Phòng : \" + monHocTkb.phongTH + \"<br/>\";\r\n");
      out.write("\t\t\t\telse\r\n");
      out.write("\t\t\t\t\tchuoiTH += \"Kiểu dạy : tích hợp<br/>\" + monHocTkb.ngayBatDauTH + \"-\" + monHocTkb.ngayKetThucTH + \"<br/>\" + \"Phòng : \" + monHocTkb.phongTH + \"<br/>\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif((thu[i].split(\"/\"))[0] == 'Sáng' && checkBuoiSang == true)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang') == null)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\trowSang++;\r\n");
      out.write("\t\t\t\ttrSang = tableSang.insertRow(rowSang + 1);\r\n");
      out.write("\t\t\t\ttrSang.insertCell(0).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.insertCell(1).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.insertCell(2).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.insertCell(3).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.insertCell(4).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.insertCell(5).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.insertCell(6).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.insertCell(7).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ttrSang = document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang');\r\n");
      out.write("\t\t\t\ttrSang.cells[0].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.cells[1].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.cells[2].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.cells[3].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.cells[4].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.cells[5].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.cells[6].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrSang.cells[7].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\ttrSang.id = 'MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang';\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\ttrSang.cells[0].width = \"200px\";\r\n");
      out.write("\t\t\ttrSang.cells[1].width = \"50px\";\r\n");
      out.write("\t\t\ttrSang.cells[2].width = \"50px\";\r\n");
      out.write("\t\t\ttrSang.cells[3].width = \"50px\";\r\n");
      out.write("\t\t\ttrSang.cells[4].width = \"50px\";\r\n");
      out.write("\t\t\ttrSang.cells[5].width = \"50px\";\r\n");
      out.write("\t\t\ttrSang.cells[6].width = \"50px\";\r\n");
      out.write("\t\t\ttrSang.cells[7].width = \"50px\";\r\n");
      out.write("\t\t\tcheckBuoiSang = false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif((thu[i].split(\"/\"))[0] == 'Sáng' && checkBuoiSang == false)\r\n");
      out.write("\t\t{\t\r\n");
      out.write("\t\t\ttrSang.cells[(thu[i].split(\"/\"))[1]].innerHTML = trSang.cells[(thu[i].split(\"/\"))[1]].innerHTML + \"<br/>\" + (thu[i].split(\"/\"))[2];\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif((thu[i].split(\"/\"))[0] == 'Chiều' && checkBuoiChieu == true)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu') == null)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\trowChieu++;\r\n");
      out.write("\t\t\t\ttrChieu = tableChieu.insertRow(rowChieu + 1);\r\n");
      out.write("\t\t\t\ttrChieu.id = 'MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu';\r\n");
      out.write("\t\t\t\ttrChieu.insertCell(0).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.insertCell(1).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.insertCell(2).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.insertCell(3).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.insertCell(4).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.insertCell(5).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.insertCell(6).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.insertCell(7).innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ttrChieu = document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu');\r\n");
      out.write("\t\t\t\ttrChieu.cells[0].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.cells[1].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.cells[2].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.cells[3].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.cells[4].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.cells[5].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.cells[6].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t\ttrChieu.cells[7].innerHTML = \"&nbsp;\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\ttrChieu.cells[0].width = \"200px\";\r\n");
      out.write("\t\t\ttrChieu.cells[1].width = \"50px\";\r\n");
      out.write("\t\t\ttrChieu.cells[2].width = \"50px\";\r\n");
      out.write("\t\t\ttrChieu.cells[3].width = \"50px\";\r\n");
      out.write("\t\t\ttrChieu.cells[4].width = \"50px\";\r\n");
      out.write("\t\t\ttrChieu.cells[5].width = \"50px\";\r\n");
      out.write("\t\t\ttrChieu.cells[6].width = \"50px\";\r\n");
      out.write("\t\t\ttrChieu.cells[7].width = \"50px\";\r\n");
      out.write("\t\t\tcheckBuoiChieu = false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif((thu[i].split(\"/\"))[0] == 'Chiều' && checkBuoiChieu == false)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\ttrChieu.cells[(thu[i].split(\"/\"))[1]].innerHTML = trChieu.cells[(thu[i].split(\"/\"))[1]].innerHTML + \"<br/>\" + (thu[i].split(\"/\"))[2];\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif(checkBuoiSang == false)\r\n");
      out.write("\t\ttrSang.cells[0].innerHTML = \"<font color = 'blue'><b>\" + monHocTkb.tenMonHoc + \"</b></font><br/><b>\" + monHocTkb.tenGiaoVien + \"</b><br/>\" + chuoiLT + chuoiTH + monHocTkb.ghiChu;\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang') != null)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\trowSang--;\r\n");
      out.write("\t\t\ttableSang.deleteRow(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Sang').rowIndex);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif(checkBuoiChieu == false)\r\n");
      out.write("\t\ttrChieu.cells[0].innerHTML = \"<font color = 'blue'><b>\" + monHocTkb.tenMonHoc + \"</b></font><br/><b>\" + monHocTkb.tenGiaoVien + \"</b><br/>\" + chuoiLT + chuoiTH + monHocTkb.ghiChu;\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu') != null)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\trowChieu--;\r\n");
      out.write("\t\t\ttableChieu.deleteRow(document.getElementById('MaMonHocTKB-' + monHocTkb.maMonHocTKB + '-MaMonHocTKB-Chieu').rowIndex);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function deleteRow()\r\n");
      out.write("{\r\n");
      out.write("\tif(document.getElementById('cboXoaMonHoc').value != \"\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(confirm(\"Bạn có chắc muốn xóa môn học này không???\"))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tdocument.getElementById('XoaMonHoc').value = 'XoaMonHoc';\r\n");
      out.write("\t\t\tsubmitForm();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t\talert(\"Hãy chọn môn học cần xóa\");\r\n");
      out.write("}\r\n");
      out.write("function submitForm(){\t\r\n");
      out.write("\tdocument.getElementById('txtTongSoMonHoc').value = document.getElementById('cboXoaMonHoc').options.length;\r\n");
      out.write("\tif(parseInt(document.getElementById('TuanBatDau').value) >= parseInt(document.getElementById('TuanKetThuc').value))\r\n");
      out.write("\t\talert(\"Tuần kết thúc phải lớn hơn tuần bắt đầu\");\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif(document.getElementById('actionType').value == 'CapNhat')\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tfor(var i=0;i<addTKB.length;i++) // map tung obj trong mang addTKB vao tung hidden field\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tvar strMonHoc = \"\", strChiTiet = \"\";\r\n");
      out.write("\t\t\t\tvar obj = new Object();\r\n");
      out.write("\t\t\t\tobj = addTKB[i];\r\n");
      out.write("\t\t\t\tstrMonHoc =  obj.ghiChu  + \"<->\" + obj.soNoiDung + \"<->\" + obj.soCaThucHanh + \"<->\" + obj.maMonHoc + \"<->\" + obj.tenMonHoc + \"<->\" + obj.maGiaoVien + \"<->\" + obj.tenGiaoVien + \"<->\" + obj.maMonHocTKB + \"<->\" + obj.phongLT + \"<->\" + obj.phongTH + \"<->\" + obj.ngayBatDauLT  + \"<->\" + obj.ngayBatDauTH + \"<->\" + obj.ngayKetThucLT  + \"<->\" + obj.ngayKetThucTH + \"<->\" + obj.chuoiThuTrongTuan + \"<->\" + obj.kieuBienSoan + \"<->\" + obj.soTietLT + \"<->\" + obj.soTietTH + \"<->\" + obj.tuanBatDauLT + \"<->\" + obj.tuanBatDauTH;\r\n");
      out.write("\t\t\t\tvar arr = new Array();\r\n");
      out.write("\t\t\t\tarr = obj.chiTietTKBList;\r\n");
      out.write("\t\t\t\tfor(var j=0;j<arr.length;j++)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\tvar chiTiet = new Object();\r\n");
      out.write("\t\t\t\t\tchiTiet = arr[j];\r\n");
      out.write("\t\t\t\t\tif(j == 0)\r\n");
      out.write("\t\t\t\t\t\tstrChiTiet += chiTiet.maChiTietTKB + \"<->\" + chiTiet.buoi + \"<->\" + chiTiet.sTTNoiDung + \"<->\" + chiTiet.coHieu + \"<->\" + chiTiet.hinhThucDay + \"<->\" + chiTiet.thuTrongTuan + \"<->\" + chiTiet.phong + \"<->\" + chiTiet.tuan + \"<->\" + chiTiet.soThuTu + \"<->\" + chiTiet.nhom + \"<->\" + chiTiet.tenChuong;\r\n");
      out.write("\t\t\t\t\telse\r\n");
      out.write("\t\t\t\t\t\tstrChiTiet += \"</>\" + chiTiet.maChiTietTKB + \"<->\" + chiTiet.buoi + \"<->\" + chiTiet.sTTNoiDung + \"<->\" + chiTiet.coHieu + \"<->\" + chiTiet.hinhThucDay + \"<->\" + chiTiet.thuTrongTuan + \"<->\" + chiTiet.phong + \"<->\" + chiTiet.tuan + \"<->\" + chiTiet.soThuTu + \"<->\" + chiTiet.nhom + \"<->\" + chiTiet.tenChuong;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tdocument.getElementById('td').innerHTML += \"<input type = 'hidden' name = 'MonHoc\" + (i+1) + \"' value = '\" + strMonHoc + \"'/><input type = 'hidden' name = 'ChiTiet\" + (i+1) + \"' value = '\" + strChiTiet + \"'/>\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tdocument.getElementById('txtTongSoMonHoc').value = addTKB.length;\r\n");
      out.write("\t\tdocument.getElementById('txtMaNamHoc').value = maNamHoc;\r\n");
      out.write("\t\tdocument.forms[\"TKB\"].submit();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("function confirmSending() {\r\n");
      out.write("\tif (confirm('Bạn có chắc muốn gửi thời khóa biểu này không ?')) {\r\n");
      out.write("\t\tdocument.TKB.GuiHieuTruong.value = 'GuiHieuTruong';\r\n");
      out.write("\t\tsubmitForm();\r\n");
      out.write("\t}\r\n");
      out.write("\t//return false;\r\n");
      out.write("}\r\n");
      out.write("function confirmDuyet(x)\r\n");
      out.write("{\r\n");
      out.write("\tvar act = '';\r\n");
      out.write("\tif(x == 'A')\r\n");
      out.write("\t{\r\n");
      out.write("\t\tact = 'Approve';\r\n");
      out.write("\t\tdocument.getElementById('Duyet').value = act;\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar value = false;\r\n");
      out.write("\t\tvalue = window.showModalDialog(\"LyDoRejectBox.jsp\",\"Arg1\",\"dialogHeight: 150px; dialogWidth: 150px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: No; scroll: No; status: Yes;\");\r\n");
      out.write("\t\tif(value != false && value != null)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tact = 'Reject';\r\n");
      out.write("\t\t\tdocument.getElementById('Duyet').value = act;\r\n");
      out.write("\t\t\tdocument.getElementById('LyDoReject').value = value;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(confirm(\"Bạn có chắc muốn \" + act + \" thời khóa biểu này không?\"))\r\n");
      out.write("\t\tdocument.forms[\"Duyet1TKB\"].submit();\t\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<title>Thêm Thời Khóa Biểu</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"pageLoad();\">\r\n");
      out.write("<div align=\"center\" >\r\n");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f0.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(547,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setVar("ThoiKhoaBieu");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(547,0) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setValue( thoiKhoaBieuModel );
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(547,0) name = scope type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setScope("session");
      int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
      if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody.reuse(_jspx_th_c_005fset_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      out.write("\r\n");
      out.write("\t<!-- S HEAD CONTENT -->\r\n");
      out.write("\t\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../../block/header.jsp", out, false);
      out.write("\r\n");
      out.write("\t<!-- E HEAD CONTENT -->\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- ");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("  -->\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f3(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f4(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f5(_jspx_page_context))
        return;
      out.write("\t\r\n");
      out.write("\t");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f1 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f1.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(572,1) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f1.setVar("maThanhVien");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(572,1) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f1.setValue( (String) session.getAttribute("maThanhVien") );
      int _jspx_eval_c_005fset_005f1 = _jspx_th_c_005fset_005f1.doStartTag();
      if (_jspx_th_c_005fset_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
      out.write('\r');
      out.write('\n');
      out.write('	');
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f2 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f2.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f2.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(573,1) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f2.setVar("MaBoPhan");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(573,1) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f2.setValue( (String) session.getAttribute("maBoPhan") );
      int _jspx_eval_c_005fset_005f2 = _jspx_th_c_005fset_005f2.doStartTag();
      if (_jspx_th_c_005fset_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f2);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f2);
      out.write('\r');
      out.write('\n');
      out.write('	');
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f3 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f3.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f3.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(574,1) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f3.setVar("BO_PHAN_ADMIN");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(574,1) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f3.setValue( Constant.BO_PHAN_ADMIN );
      int _jspx_eval_c_005fset_005f3 = _jspx_th_c_005fset_005f3.doStartTag();
      if (_jspx_th_c_005fset_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f3);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f3);
      out.write('\r');
      out.write('\n');
      out.write('	');
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f4 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f4.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f4.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(575,1) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f4.setVar("BO_PHAN_BGH");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(575,1) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f4.setValue( Constant.BO_PHAN_BGH );
      int _jspx_eval_c_005fset_005f4 = _jspx_th_c_005fset_005f4.doStartTag();
      if (_jspx_th_c_005fset_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f4);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f4);
      out.write("\r\n");
      out.write("\t\t");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f5 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f5.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f5.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(576,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f5.setVar("TruongKhoa");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(576,2) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f5.setValue(Constant.TRUONG_KHOA );
      int _jspx_eval_c_005fset_005f5 = _jspx_th_c_005fset_005f5.doStartTag();
      if (_jspx_th_c_005fset_005f5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f5);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f5);
      out.write("\r\n");
      out.write("\t\t");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f6 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f6.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f6.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(577,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f6.setVar("vaiTro");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(577,2) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f6.setValue( (String) session.getAttribute("maVaiTro") );
      int _jspx_eval_c_005fset_005f6 = _jspx_th_c_005fset_005f6.doStartTag();
      if (_jspx_eval_c_005fset_005f6 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        if (_jspx_eval_c_005fset_005f6 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.pushBody();
          _jspx_th_c_005fset_005f6.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
          _jspx_th_c_005fset_005f6.doInitBody();
        }
        do {
          out.write(' ');
          int evalDoAfterBody = _jspx_th_c_005fset_005f6.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
        if (_jspx_eval_c_005fset_005f6 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.popBody();
        }
      }
      if (_jspx_th_c_005fset_005f6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue.reuse(_jspx_th_c_005fset_005f6);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue.reuse(_jspx_th_c_005fset_005f6);
      out.write("\r\n");
      out.write("\t\t");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f7 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f7.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f7.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(578,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f7.setVar("NEW");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(578,2) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f7.setValue( Constant.TINHTRANG_NEW );
      int _jspx_eval_c_005fset_005f7 = _jspx_th_c_005fset_005f7.doStartTag();
      if (_jspx_th_c_005fset_005f7.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f7);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f7);
      out.write("\r\n");
      out.write("\t\t");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f8 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f8.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f8.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(579,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f8.setVar("PENDING");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(579,2) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f8.setValue( Constant.TINHTRANG_SEND );
      int _jspx_eval_c_005fset_005f8 = _jspx_th_c_005fset_005f8.doStartTag();
      if (_jspx_th_c_005fset_005f8.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f8);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f8);
      out.write("\r\n");
      out.write("\t\t");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f9 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f9.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f9.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(580,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f9.setVar("REJECT");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(580,2) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f9.setValue( Constant.TINHTRANG_REJECT );
      int _jspx_eval_c_005fset_005f9 = _jspx_th_c_005fset_005f9.doStartTag();
      if (_jspx_th_c_005fset_005f9.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f9);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f9);
      out.write("\r\n");
      out.write("\t\t");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f10 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f10.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f10.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(581,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f10.setVar("APPROVE");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(581,2) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f10.setValue( Constant.TINHTRANG_APPROVE );
      int _jspx_eval_c_005fset_005f10 = _jspx_th_c_005fset_005f10.doStartTag();
      if (_jspx_th_c_005fset_005f10.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f10);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f10);
      out.write("\r\n");
      out.write("\t<form action=\"");
      out.print(request.getContextPath());
      out.write("/thoiKhoaBieuController?them=yes\" method=\"post\" name = \"TKB\">\t\r\n");
      out.write("\t\r\n");
      out.write("\t<table width = \"800\" style=\"background-color: transparent;\">\r\n");
      out.write("\t<tr style=\"background-color: transparent;\">\r\n");
      out.write("\t\t<td>Trường Trung cấp nghề KTCN Hùng Vương<br />Khoa Công Nghệ Thông Tin </td>\r\n");
      out.write("\t\t<td>Cộng hòa Xã hội Chủ nghĩa Việt Nam <br />Độc lập - Tự do - Hạnh phúc </td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr style=\"background-color: transparent;\">\r\n");
      out.write("\t\t<td colspan = \"2\">\r\n");
      out.write("\t\t\t<strong>THỜI KHÓA BIỂU HỌC KỲ \r\n");
      out.write("\t\t\t<select id=\"HocKi\" name=\"cboHocKi\">\r\n");
      out.write("\t\t\t\t<option value = \"1\" ");
      if (_jspx_meth_c_005fif_005f6(_jspx_page_context))
        return;
      out.write(">I</option>\r\n");
      out.write("\t\t\t\t<option value = \"2\" ");
      if (_jspx_meth_c_005fif_005f7(_jspx_page_context))
        return;
      out.write(">II</option>\r\n");
      out.write("\t\t\t</select> \r\n");
      out.write("\t\t\t- NĂM HỌC <select name=\"cboNam1\" id=\"Nam1\" onchange=\"selectNam1()\">\r\n");
      out.write("\t\t\t\t<option value=\"\">Select</option></select> - \r\n");
      out.write("\t\t\t<input type = \"text\" size = \"3\" name=\"txtNam2\" id=\"Nam2\" style=\"background-color: transparent;\" readonly=\"readonly\"/></strong>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f11 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f11.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f11.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(601,1) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f11.setVar("LopList");
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(601,1) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f11.setValue(LopHocDAO.getAllLopByMaChuongTrinhApproved() );
      int _jspx_eval_c_005fset_005f11 = _jspx_th_c_005fset_005f11.doStartTag();
      if (_jspx_th_c_005fset_005f11.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f11);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f11);
      out.write("\r\n");
      out.write("\t<tr style=\"background-color: transparent;\">\r\n");
      out.write("\t\t<td colspan = \"2\"><br /><div class = \"div_tr\">\r\n");
      out.write("\t\t\tLớp: <select name=\"cboLop\" id=\"Lop\" onclick=\"selectLop();\">\r\n");
      out.write("\t\t\t\t\t<option value=\"\">--Select--</option>\r\n");
      out.write("\t\t\t\t\t");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t");
      if (_jspx_meth_c_005fif_005f9(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\tChuyên ngành <input type=\"text\" name=\"txtChuyenNganh\" id=\"ChuyenNganh\" readonly=\"readonly\"/> <br />\r\n");
      out.write("\t\t\tTuần lễ thứ <select id = \"TuanBatDau\" onchange=\"selectTuanBatDau();\" name=\"cboTuanBatDau\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"\">Select</option>\r\n");
      out.write("\t\t\t\t\t\t\t");
      if (_jspx_meth_c_005fforEach_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select> \r\n");
      out.write("\t\t\t\t\t\t");
      if (_jspx_meth_c_005fif_005f11(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\tđến tuần lễ thứ <select id=\"TuanKetThuc\" onchange=\"selectTuanKetThuc();\" name=\"cboTuanKetThuc\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"\">Select</option>\r\n");
      out.write("\t\t\t\t\t\t\t");
      if (_jspx_meth_c_005fforEach_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t");
      if (_jspx_meth_c_005fif_005f13(_jspx_page_context))
        return;
      out.write("<br />\r\n");
      out.write("\t\t\tTừ ngày <input type = \"text\" id=\"TuNgay\" name=\"txtTuNgay\" size = 8 style=\"background-color: transparent;\" />\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\tđến ngày <input type = \"text\" id=\"DenNgay\" name=\"txtDenNgay\" size = 8 style=\"background-color: transparent;\" />\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t</div></td><br />\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr style=\"background-color: transparent;\">\r\n");
      out.write("\t\t<td colspan=\"2\">Chọn môn học để xóa : \r\n");
      out.write("\t\t\t<select id = \"cboXoaMonHoc\" name = \"cboXoaMonHoc\">\r\n");
      out.write("\t\t\t\t<option value=\"\">--Select--</option>\r\n");
      out.write("\t\t\t</select>\r\n");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f14 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_005fif_005f14.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f14.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(637,0) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f14.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty ThoiKhoaBieu.maThoiKhoaBieu}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f14 = _jspx_th_c_005fif_005f14.doStartTag();
      if (_jspx_eval_c_005fif_005f14 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\t\t\t\t\t\r\n");
          out.write("\t");
          //  c:choose
          org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_005fchoose_005f0 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _005fjspx_005ftagPool_005fc_005fchoose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
          _jspx_th_c_005fchoose_005f0.setPageContext(_jspx_page_context);
          _jspx_th_c_005fchoose_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fif_005f14);
          int _jspx_eval_c_005fchoose_005f0 = _jspx_th_c_005fchoose_005f0.doStartTag();
          if (_jspx_eval_c_005fchoose_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            do {
              out.write("\t\t\r\n");
              out.write("\t\t");
              //  c:when
              org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f0 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
              _jspx_th_c_005fwhen_005f0.setPageContext(_jspx_page_context);
              _jspx_th_c_005fwhen_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
              // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(639,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_c_005fwhen_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty ThoiKhoaBieu.maThoiKhoaBieu and ThoiKhoaBieu.tinhTrang ne APPROVE and ThoiKhoaBieu.tinhTrang ne PENDING and (ThoiKhoaBieu.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN)}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
              int _jspx_eval_c_005fwhen_005f0 = _jspx_th_c_005fwhen_005f0.doStartTag();
              if (_jspx_eval_c_005fwhen_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                do {
                  out.write("\t\r\n");
                  out.write("\t\t\t<a href = \"javascript: deleteRow()\">\r\n");
                  out.write("\t\t\t\t<img src=\"");
                  out.print(request.getContextPath());
                  out.write("/images/buttom/xoamonhoc.png\" alt=\"Xóa môn học\" border=\"0\"/>\r\n");
                  out.write("\t\t\t</a>\r\n");
                  out.write("\t\t\t<a href = \"javascript: openUpdate('CapNhat')\">\r\n");
                  out.write("\t\t\t\t<img src=\"");
                  out.print(request.getContextPath());
                  out.write("/images/buttom/capnhat.png\" alt=\"Cập nhật môn học\" border=\"0\"/>\r\n");
                  out.write("\t\t\t</a>\r\n");
                  out.write("\t\t");
                  int evalDoAfterBody = _jspx_th_c_005fwhen_005f0.doAfterBody();
                  if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                    break;
                } while (true);
              }
              if (_jspx_th_c_005fwhen_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f0);
                return;
              }
              _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f0);
              out.write("\t\r\n");
              out.write("\t\t");
              //  c:otherwise
              org.apache.taglibs.standard.tag.common.core.OtherwiseTag _jspx_th_c_005fotherwise_005f0 = (org.apache.taglibs.standard.tag.common.core.OtherwiseTag) _005fjspx_005ftagPool_005fc_005fotherwise.get(org.apache.taglibs.standard.tag.common.core.OtherwiseTag.class);
              _jspx_th_c_005fotherwise_005f0.setPageContext(_jspx_page_context);
              _jspx_th_c_005fotherwise_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
              int _jspx_eval_c_005fotherwise_005f0 = _jspx_th_c_005fotherwise_005f0.doStartTag();
              if (_jspx_eval_c_005fotherwise_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                do {
                  out.write("\r\n");
                  out.write("\t\t\t<a href = \"javascript: openUpdate('Xem')\">\r\n");
                  out.write("\t\t\t\t<img src=\"");
                  out.print(request.getContextPath());
                  out.write("/images/buttom/capnhat.png\" alt=\"Cập nhật môn học\" border=\"0\"/>\r\n");
                  out.write("\t\t\t</a>\r\n");
                  out.write("\t\t");
                  int evalDoAfterBody = _jspx_th_c_005fotherwise_005f0.doAfterBody();
                  if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                    break;
                } while (true);
              }
              if (_jspx_th_c_005fotherwise_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f0);
                return;
              }
              _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f0);
              out.write('\r');
              out.write('\n');
              out.write('	');
              int evalDoAfterBody = _jspx_th_c_005fchoose_005f0.doAfterBody();
              if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                break;
            } while (true);
          }
          if (_jspx_th_c_005fchoose_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
            _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f0);
            return;
          }
          _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f0);
          out.write('	');
          out.write('\r');
          out.write('\n');
          int evalDoAfterBody = _jspx_th_c_005fif_005f14.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f14.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f14);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f14);
      out.write("\t\t\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width = \"800\" border = \"1\" style=\"background-color: transparent;\" id=\"tableSang\">\r\n");
      out.write("\t<tr style=\"background-color: transparent;\"><td colspan=\"8\" id = \"td\">BUỔI SÁNG</td></tr>\r\n");
      out.write("\t<tr style=\"background-color: transparent;\" align=\"center\">\r\n");
      out.write("\t\t<td width = \"17\" >&nbsp;</td>\r\n");
      out.write("\t\t<td width = \"17\" >HAI</td>\r\n");
      out.write("\t\t<td width = \"17\" >BA</td>\r\n");
      out.write("\t\t<td width = \"17\" >TƯ</td>\r\n");
      out.write("\t\t<td width = \"17\" >NĂM</td>\r\n");
      out.write("\t\t<td width = \"17\" >SÁU</td>\r\n");
      out.write("\t\t<td width = \"17\" >BẢY</td>\r\n");
      out.write("\t\t<td width = \"17\" >Chủ nhật</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<br />\r\n");
      out.write("<table width = \"800\" border = \"1\" style=\"background-color: transparent;\" id=\"tableChieu\">\r\n");
      out.write("\t<tr style=\"background-color: transparent;\"><td colspan=\"8\">BUỔI CHIỀU</td></tr>\r\n");
      out.write("\t<tr style=\"background-color: transparent;\" align=\"center\">\r\n");
      out.write("\t\t<td width = \"17\" >&nbsp;</td>\r\n");
      out.write("\t\t<td width = \"17\" >HAI</td>\r\n");
      out.write("\t\t<td width = \"17\" >BA</td>\r\n");
      out.write("\t\t<td width = \"17\" >TƯ</td>\r\n");
      out.write("\t\t<td width = \"17\" >NĂM</td>\r\n");
      out.write("\t\t<td width = \"17\" >SÁU</td>\r\n");
      out.write("\t\t<td width = \"17\" >BẢY</td>\r\n");
      out.write("\t\t<td width = \"17\" >Chủ nhật</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("</table>\r\n");
      out.write("<input type = \"hidden\" value = \"1\" id = \"CountTableSang\"/>\r\n");
      out.write("<input type = \"hidden\" value = \"1\" id = \"CountTableChieu\"/>\r\n");
      out.write("<input type=\"hidden\" name = \"txtTongSoMonHoc\" id = \"txtTongSoMonHoc\" value = \"0\"/>\r\n");
      out.write("<input type=\"hidden\" name = \"txtMaNamHoc\" id = \"txtMaNamHoc\" value = \"0\"/>\r\n");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f15 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_005fif_005f15.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f15.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(691,0) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f15.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty ThoiKhoaBieu.maThoiKhoaBieu and ThoiKhoaBieu.tinhTrang ne APPROVE and ThoiKhoaBieu.tinhTrang ne PENDING and (ThoiKhoaBieu.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN)}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f15 = _jspx_th_c_005fif_005f15.doStartTag();
      if (_jspx_eval_c_005fif_005f15 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t<a href = \"javascript: openAdd()\">\r\n");
          out.write("\t\t<img src=\"");
          out.print(request.getContextPath());
          out.write("/images/buttom/themmonhoc.png\" alt=\"Thêm môn học\" border=\"0\"/>\r\n");
          out.write("\t</a>\r\n");
          out.write("\t<input type=\"hidden\" name = \"XoaMonHoc\" id = \"XoaMonHoc\" value=\"\"/>\r\n");
          int evalDoAfterBody = _jspx_th_c_005fif_005f15.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f15.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f15);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f15);
      out.write("\r\n");
      out.write("\t<a href=\"");
      out.print(Constant.PATH_RES.getString("iso.LichSuDungPhongPath") );
      out.write("\">\r\n");
      out.write("\t\t<img src=\"");
      out.print(request.getContextPath());
      out.write("/images/buttom/lichsudungphong.png\" alt=\"Lịch sử dụng phòng\" border=\"0\"/>\r\n");
      out.write("\t</a>\r\n");
      out.write("<table width = \"800\" style=\"background-color: transparent;\">\r\n");
      out.write("\t\t<tr style=\"background-color: transparent;\"><td colspan=\"2\">\r\n");
      out.write("\t\t\t<br />Phòng học lý thuyết  <input type = \"text\"  style=\"background-color: transparent;\"/><br /><br />\r\n");
      out.write("\t\t</td></tr>\r\n");
      out.write("\t<tr style=\"background-color: transparent;\">\r\n");
      out.write("\t\t<td>Ban Giám hiệu<br /><br /><input type = \"text\" /><br /><br /></td>\r\n");
      out.write("\t\t<td>Trưởng khoa CNTT<br /><br /><input type = \"text\"  style=\"background-color: transparent;\"/><br /><br /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\t<input type=\"hidden\" name=\"actionType\" style=\"background-color: transparent;\" id = \"actionType\"\r\n");
      out.write("\t\t\t");
      if (_jspx_meth_c_005fchoose_005f1(_jspx_page_context))
        return;
      out.write("  \r\n");
      out.write("\t\t/>\t\t\r\n");
      out.write("\t\t");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f16 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_005fif_005f16.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f16.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(719,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f16.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN or ThoiKhoaBieu.tinhTrang eq null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f16 = _jspx_th_c_005fif_005f16.doStartTag();
      if (_jspx_eval_c_005fif_005f16 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write(" \r\n");
          out.write("\t\t\t");
          //  c:choose
          org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_005fchoose_005f2 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _005fjspx_005ftagPool_005fc_005fchoose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
          _jspx_th_c_005fchoose_005f2.setPageContext(_jspx_page_context);
          _jspx_th_c_005fchoose_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fif_005f16);
          int _jspx_eval_c_005fchoose_005f2 = _jspx_th_c_005fchoose_005f2.doStartTag();
          if (_jspx_eval_c_005fchoose_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            do {
              out.write("\r\n");
              out.write("\t\t\t\t");
              //  c:when
              org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f2 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
              _jspx_th_c_005fwhen_005f2.setPageContext(_jspx_page_context);
              _jspx_th_c_005fwhen_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f2);
              // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(721,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_c_005fwhen_005f2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.tinhTrang eq NEW or ThoiKhoaBieu.tinhTrang eq REJECT or ThoiKhoaBieu.tinhTrang eq null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
              int _jspx_eval_c_005fwhen_005f2 = _jspx_th_c_005fwhen_005f2.doStartTag();
              if (_jspx_eval_c_005fwhen_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                do {
                  out.write("\r\n");
                  out.write("\t\t\t\t\t<!--  <input type = \"submit\" name=\"TaoMoi\" -->\r\n");
                  out.write("\t\t\t\t\t<a href = \"javascript: submitForm()\" name=\"TaoMoi\"> \r\n");
                  out.write("\t\t\t\t\t");
                  //  c:choose
                  org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_005fchoose_005f3 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _005fjspx_005ftagPool_005fc_005fchoose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
                  _jspx_th_c_005fchoose_005f3.setPageContext(_jspx_page_context);
                  _jspx_th_c_005fchoose_005f3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fwhen_005f2);
                  int _jspx_eval_c_005fchoose_005f3 = _jspx_th_c_005fchoose_005f3.doStartTag();
                  if (_jspx_eval_c_005fchoose_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                    do {
                      out.write("\r\n");
                      out.write("\t\t\t\t\t\t");
                      //  c:when
                      org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f3 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
                      _jspx_th_c_005fwhen_005f3.setPageContext(_jspx_page_context);
                      _jspx_th_c_005fwhen_005f3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f3);
                      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(725,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
                      _jspx_th_c_005fwhen_005f3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${empty ThoiKhoaBieu.maThoiKhoaBieu}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
                      int _jspx_eval_c_005fwhen_005f3 = _jspx_th_c_005fwhen_005f3.doStartTag();
                      if (_jspx_eval_c_005fwhen_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                        do {
                          out.write("\r\n");
                          out.write("\t\t\t\t\t\t\t<img id=\"ButtonAction\" src=\"");
                          out.print(request.getContextPath());
                          out.write("/images/buttom/taomoi.png\" alt=\"Tạo mới\" border = \"0\" />\r\n");
                          out.write("\t\t\t\t\t\t");
                          int evalDoAfterBody = _jspx_th_c_005fwhen_005f3.doAfterBody();
                          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                            break;
                        } while (true);
                      }
                      if (_jspx_th_c_005fwhen_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                        _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f3);
                        return;
                      }
                      _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f3);
                      out.write("\r\n");
                      out.write("\t\t\t\t\t\t");
                      //  c:otherwise
                      org.apache.taglibs.standard.tag.common.core.OtherwiseTag _jspx_th_c_005fotherwise_005f2 = (org.apache.taglibs.standard.tag.common.core.OtherwiseTag) _005fjspx_005ftagPool_005fc_005fotherwise.get(org.apache.taglibs.standard.tag.common.core.OtherwiseTag.class);
                      _jspx_th_c_005fotherwise_005f2.setPageContext(_jspx_page_context);
                      _jspx_th_c_005fotherwise_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f3);
                      int _jspx_eval_c_005fotherwise_005f2 = _jspx_th_c_005fotherwise_005f2.doStartTag();
                      if (_jspx_eval_c_005fotherwise_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                        do {
                          out.write("\t\t\t\t\t\t\t\r\n");
                          out.write("\t\t\t\t\t\t\t<img id=\"ButtonAction\" src=\"");
                          out.print(request.getContextPath());
                          out.write("/images/buttom/capnhat.png\" alt=\"Cập Nhật\" border = \"0\" />\r\n");
                          out.write("\t\t\t\t\t\t");
                          int evalDoAfterBody = _jspx_th_c_005fotherwise_005f2.doAfterBody();
                          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                            break;
                        } while (true);
                      }
                      if (_jspx_th_c_005fotherwise_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                        _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f2);
                        return;
                      }
                      _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f2);
                      out.write("\r\n");
                      out.write("\t\t\t\t\t");
                      int evalDoAfterBody = _jspx_th_c_005fchoose_005f3.doAfterBody();
                      if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                        break;
                    } while (true);
                  }
                  if (_jspx_th_c_005fchoose_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                    _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f3);
                    return;
                  }
                  _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f3);
                  out.write(" </a>\t\t\t\t\r\n");
                  out.write("\t\t\t\t\t");
                  //  c:choose
                  org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_005fchoose_005f4 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _005fjspx_005ftagPool_005fc_005fchoose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
                  _jspx_th_c_005fchoose_005f4.setPageContext(_jspx_page_context);
                  _jspx_th_c_005fchoose_005f4.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fwhen_005f2);
                  int _jspx_eval_c_005fchoose_005f4 = _jspx_th_c_005fchoose_005f4.doStartTag();
                  if (_jspx_eval_c_005fchoose_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                    do {
                      out.write("\r\n");
                      out.write("\t\t\t\t\t\t");
                      //  c:when
                      org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f4 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
                      _jspx_th_c_005fwhen_005f4.setPageContext(_jspx_page_context);
                      _jspx_th_c_005fwhen_005f4.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f4);
                      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(733,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
                      _jspx_th_c_005fwhen_005f4.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty ThoiKhoaBieu.maThoiKhoaBieu and empty param.AddRow and empty param.err}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
                      int _jspx_eval_c_005fwhen_005f4 = _jspx_th_c_005fwhen_005f4.doStartTag();
                      if (_jspx_eval_c_005fwhen_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                        do {
                          out.write("\t\t\t\t\t\t\t\r\n");
                          out.write("\t\t\t\t\t\t\t<a href = \"javascript: confirmSending()\">\r\n");
                          out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"GuiHieuTruong\" /> \r\n");
                          out.write("\t\t\t\t\t\t\t\t<img src=\"");
                          out.print(request.getContextPath());
                          out.write("/images/buttom/guihieutruong.png\" alt=\"Gửi Hiệu Trưởng\" border = \"0\" />\r\n");
                          out.write("\t\t\t\t\t\t\t</a>\r\n");
                          out.write("\t\t\t\t\t\t");
                          int evalDoAfterBody = _jspx_th_c_005fwhen_005f4.doAfterBody();
                          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                            break;
                        } while (true);
                      }
                      if (_jspx_th_c_005fwhen_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                        _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f4);
                        return;
                      }
                      _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f4);
                      out.write("\t\t\t\t\r\n");
                      out.write("\t\t\t\t\t");
                      int evalDoAfterBody = _jspx_th_c_005fchoose_005f4.doAfterBody();
                      if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                        break;
                    } while (true);
                  }
                  if (_jspx_th_c_005fchoose_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                    _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f4);
                    return;
                  }
                  _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f4);
                  out.write("\r\n");
                  out.write("\t\t\t\t");
                  int evalDoAfterBody = _jspx_th_c_005fwhen_005f2.doAfterBody();
                  if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                    break;
                } while (true);
              }
              if (_jspx_th_c_005fwhen_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f2);
                return;
              }
              _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f2);
              out.write("\r\n");
              out.write("\t\t\t");
              int evalDoAfterBody = _jspx_th_c_005fchoose_005f2.doAfterBody();
              if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                break;
            } while (true);
          }
          if (_jspx_th_c_005fchoose_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
            _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f2);
            return;
          }
          _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f2);
          out.write("\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f16.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f16.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f16);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f16);
      out.write("\t\r\n");
      out.write("\t\t");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f17 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_005fif_005f17.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f17.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(743,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f17.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and ThoiKhoaBieu.tinhTrang eq PENDING}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f17 = _jspx_th_c_005fif_005f17.doStartTag();
      if (_jspx_eval_c_005fif_005f17 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t<a href = \"javascript: confirmDuyet('A')\"><img src=\"");
          out.print(request.getContextPath());
          out.write("/images/buttom/approve.png\" alt=\"Approve\" border=\"0\"/> </a>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f17.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f17.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f17);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f17);
      out.write("\t\r\n");
      out.write("\t\t");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f18 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_005fif_005f18.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f18.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(746,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f18.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.tinhTrang eq APPROVE and (ThoiKhoaBieu.maNguoiTao eq maThanhVien or MaBoPhan eq BO_PHAN_ADMIN)}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f18 = _jspx_th_c_005fif_005f18.doStartTag();
      if (_jspx_eval_c_005fif_005f18 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\t\r\n");
          out.write("\t\t\t<a href = \"");
          out.print(Constant.PATH_RES.getString("iso.InThoiKhoaBieuPath") );
          out.write("\">\t\t\t\t\t\t\t\t \r\n");
          out.write("\t\t\t\t<img src=\"");
          out.print(request.getContextPath());
          out.write("/images/buttom/in.png\" alt=\"Xuất File\" border = \"0\" />\r\n");
          out.write("\t\t\t</a>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f18.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f18.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f18);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f18);
      out.write("\t\r\n");
      out.write("\t\t");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f19 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_005fif_005f19.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f19.setParent(null);
      // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(751,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f19.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${(MaBoPhan eq BO_PHAN_BGH or MaBoPhan eq BO_PHAN_ADMIN) and ThoiKhoaBieu.tinhTrang eq PENDING}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f19 = _jspx_th_c_005fif_005f19.doStartTag();
      if (_jspx_eval_c_005fif_005f19 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t<a href = \"javascript: confirmDuyet('R')\"><img src=\"");
          out.print(request.getContextPath());
          out.write("/images/buttom/reject.png\" alt=\"Reject\" border=\"0\"/> </a>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f19.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f19.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f19);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f19);
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<form method=\"post\" action=\"");
      out.print(request.getContextPath());
      out.write("/thoiKhoaBieuController?duyet1TKB=yes&maThoiKhoaBieu=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.maThoiKhoaBieu}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"Duyet1TKB\">\t\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"Duyet\" value = \"\" id=\"Duyet\"/>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"LyDoReject\" value=\"\" id = \"LyDoReject\"/>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<!-- S FOOT CONTENT -->\r\n");
      out.write("\t\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../../block/footer.jsp", out, false);
      out.write("\r\n");
      out.write("\t<!-- E FOOT CONTENT -->\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(553,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty param.xoa}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t<b class=\"msg\"> Xóa môn học thành công </b>\r\n");
        out.write("\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f1.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(556,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty param.err}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
    if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t<b class=\"error\"> Nhập liệu vào các ô bắt buộc (*) </b>\r\n");
        out.write("\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f2.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(559,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty param.errTrung}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f2 = _jspx_th_c_005fif_005f2.doStartTag();
    if (_jspx_eval_c_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t<b class=\"error\"> Thời khóa biểu này đã tồn tại </b>\r\n");
        out.write("\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f3 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f3.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f3.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(562,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty param.xoa}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f3 = _jspx_th_c_005fif_005f3.doStartTag();
    if (_jspx_eval_c_005fif_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t<b class=\"msg\"> Xóa môn học thành công </b>\r\n");
        out.write("\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f3);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f4 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f4.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f4.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(565,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f4.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty param.msg and param.msg eq 'ThemMoi'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f4 = _jspx_th_c_005fif_005f4.doStartTag();
    if (_jspx_eval_c_005fif_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t<b class=\"msg\"> Thêm mới \"THỜI KHÓA BIỂU\" thành công </b>\r\n");
        out.write("\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f4.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f4);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f5(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f5 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f5.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f5.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(568,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f5.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${(not empty param.msg and param.msg eq 'CapNhat')\r\n							or (not empty requestScope.msgDeleteRow)}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f5 = _jspx_th_c_005fif_005f5.doStartTag();
    if (_jspx_eval_c_005fif_005f5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t<b class=\"msg\"> Cập nhật \"THỜI KHÓA BIỂU\" thành công </b>\r\n");
        out.write("\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f5.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f5);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f5);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f6(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f6 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f6.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f6.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(593,24) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f6.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.hocKi eq 1}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f6 = _jspx_th_c_005fif_005f6.doStartTag();
    if (_jspx_eval_c_005fif_005f6 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("selected");
        int evalDoAfterBody = _jspx_th_c_005fif_005f6.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f6);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f6);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f7(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f7 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f7.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f7.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(594,24) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f7.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.hocKi eq 2}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f7 = _jspx_th_c_005fif_005f7.doStartTag();
    if (_jspx_eval_c_005fif_005f7 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("selected");
        int evalDoAfterBody = _jspx_th_c_005fif_005f7.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f7.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f7);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f7);
    return false;
  }

  private boolean _jspx_meth_c_005fforEach_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f0.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(606,5) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVar("Lop");
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(606,5) name = items type = java.lang.Object reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${LopList}", java.lang.Object.class, (PageContext)_jspx_page_context, null, false));
    int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
      if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t\t\t\t<option value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${Lop.maLopHoc}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
          out.write('"');
          out.write(' ');
          if (_jspx_meth_c_005fif_005f8(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
            return true;
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${Lop.kiHieu}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
          out.write("</option>\r\n");
          out.write("\t\t\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fforEach_005f0.doFinally();
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f8(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f8 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f8.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f8.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(607,38) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f8.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.maLop eq Lop.maLopHoc}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f8 = _jspx_th_c_005fif_005f8.doStartTag();
    if (_jspx_eval_c_005fif_005f8 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("selected");
        int evalDoAfterBody = _jspx_th_c_005fif_005f8.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f8.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f8);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f8);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f9(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f9 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f9.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f9.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(610,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f9.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty param.err and ThoiKhoaBieu.maLop eq ''}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f9 = _jspx_th_c_005fif_005f9.doStartTag();
    if (_jspx_eval_c_005fif_005f9 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("<b class=\"error\">(*)</b>");
        int evalDoAfterBody = _jspx_th_c_005fif_005f9.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f9.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f9);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f9);
    return false;
  }

  private boolean _jspx_meth_c_005fforEach_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fend_005fbegin.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f1.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(614,7) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f1.setVar("count");
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(614,7) name = begin type = int reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f1.setBegin(1);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(614,7) name = end type = int reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f1.setEnd(47);
    int[] _jspx_push_body_count_c_005fforEach_005f1 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f1 = _jspx_th_c_005fforEach_005f1.doStartTag();
      if (_jspx_eval_c_005fforEach_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t\t\t\t\t\t<option value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${count}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
          out.write('"');
          out.write(' ');
          if (_jspx_meth_c_005fif_005f10(_jspx_th_c_005fforEach_005f1, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f1))
            return true;
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${count}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
          out.write("</option>\r\n");
          out.write("\t\t\t\t\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fforEach_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fforEach_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fforEach_005f1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fforEach_005f1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fforEach_005f1.doFinally();
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fend_005fbegin.reuse(_jspx_th_c_005fforEach_005f1);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f10(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f1, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f1)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f10 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f10.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f10.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f1);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(615,33) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f10.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.tuanBatDau eq count}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f10 = _jspx_th_c_005fif_005f10.doStartTag();
    if (_jspx_eval_c_005fif_005f10 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("selected");
        int evalDoAfterBody = _jspx_th_c_005fif_005f10.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f10.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f10);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f10);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f11(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f11 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f11.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f11.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(618,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f11.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty param.err and ThoiKhoaBieu.tuanBatDau eq ''}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f11 = _jspx_th_c_005fif_005f11.doStartTag();
    if (_jspx_eval_c_005fif_005f11 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("<b class=\"error\">(*)</b>");
        int evalDoAfterBody = _jspx_th_c_005fif_005f11.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f11.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f11);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f11);
    return false;
  }

  private boolean _jspx_meth_c_005fforEach_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f2 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fend_005fbegin.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f2.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(621,7) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f2.setVar("count");
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(621,7) name = begin type = int reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f2.setBegin(1);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(621,7) name = end type = int reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f2.setEnd(47);
    int[] _jspx_push_body_count_c_005fforEach_005f2 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f2 = _jspx_th_c_005fforEach_005f2.doStartTag();
      if (_jspx_eval_c_005fforEach_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t\t\t\t\t\t<option value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${count}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
          out.write('"');
          out.write(' ');
          if (_jspx_meth_c_005fif_005f12(_jspx_th_c_005fforEach_005f2, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f2))
            return true;
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${count}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
          out.write("</option>\r\n");
          out.write("\t\t\t\t\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fforEach_005f2.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fforEach_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fforEach_005f2[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fforEach_005f2.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fforEach_005f2.doFinally();
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fend_005fbegin.reuse(_jspx_th_c_005fforEach_005f2);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f12(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f2, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f2)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f12 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f12.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f12.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f2);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(622,33) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f12.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ThoiKhoaBieu.tuanKetThuc eq count}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f12 = _jspx_th_c_005fif_005f12.doStartTag();
    if (_jspx_eval_c_005fif_005f12 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("selected");
        int evalDoAfterBody = _jspx_th_c_005fif_005f12.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f12.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f12);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f12);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f13(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f13 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f13.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f13.setParent(null);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(625,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f13.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty param.err and ThoiKhoaBieu.tuanKetThuc eq ''}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f13 = _jspx_th_c_005fif_005f13.doStartTag();
    if (_jspx_eval_c_005fif_005f13 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("<b class=\"error\">(*)</b>");
        int evalDoAfterBody = _jspx_th_c_005fif_005f13.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f13.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f13);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f13);
    return false;
  }

  private boolean _jspx_meth_c_005fchoose_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_005fchoose_005f1 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _005fjspx_005ftagPool_005fc_005fchoose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    _jspx_th_c_005fchoose_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fchoose_005f1.setParent(null);
    int _jspx_eval_c_005fchoose_005f1 = _jspx_th_c_005fchoose_005f1.doStartTag();
    if (_jspx_eval_c_005fchoose_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\t\t\t\t\r\n");
        out.write("\t\t\t\t");
        if (_jspx_meth_c_005fwhen_005f1(_jspx_th_c_005fchoose_005f1, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("\t\t\t\t");
        if (_jspx_meth_c_005fotherwise_005f1(_jspx_th_c_005fchoose_005f1, _jspx_page_context))
          return true;
        out.write("\t\r\n");
        out.write("\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fchoose_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fchoose_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005fwhen_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f1 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_005fwhen_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fwhen_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f1);
    // /ISO/ThoiKhoaBieu/ThoiKhoaBieu.jsp(711,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fwhen_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${empty ThoiKhoaBieu.maThoiKhoaBieu}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fwhen_005f1 = _jspx_th_c_005fwhen_005f1.doStartTag();
    if (_jspx_eval_c_005fwhen_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t\tvalue=\"ThemMoi\"\r\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fwhen_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fwhen_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005fotherwise_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f1, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:otherwise
    org.apache.taglibs.standard.tag.common.core.OtherwiseTag _jspx_th_c_005fotherwise_005f1 = (org.apache.taglibs.standard.tag.common.core.OtherwiseTag) _005fjspx_005ftagPool_005fc_005fotherwise.get(org.apache.taglibs.standard.tag.common.core.OtherwiseTag.class);
    _jspx_th_c_005fotherwise_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fotherwise_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f1);
    int _jspx_eval_c_005fotherwise_005f1 = _jspx_th_c_005fotherwise_005f1.doStartTag();
    if (_jspx_eval_c_005fotherwise_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t\tvalue=\"CapNhat\"\r\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fotherwise_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fotherwise_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f1);
    return false;
  }
}
