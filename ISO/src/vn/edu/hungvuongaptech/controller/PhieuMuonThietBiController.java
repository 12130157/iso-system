package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietPhieuMuonDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.MonHocTKBDAO;
import vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.ThietBiDAO;
import vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel;

import vn.edu.hungvuongaptech.model.SysParamsModel;
import vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

/**
 * Servlet implementation class ThemThoiKhoaieuController
 */

public class PhieuMuonThietBiController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	private String tenThanhVien = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
	public PhieuMuonThietBiController(){
		 super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		tenThanhVien = (String)request.getSession().getAttribute("tenDangNhap");
		if(request.getParameter("actionType").equals("ThemPhieuMuon")) {
			themPhieuMuon(request, response);
		} else if(request.getParameter("actionType").equals("MuonThietBi")){
			muonThietBi(request, response);
		} else if(request.getParameter("actionType").equals("XoaThietBi")) {
			xoaThietBiMuon(request, response);
		} else if(request.getParameter("actionType").equals("TraThietBi")){
			traThietBi(request, response);
		} else if(request.getParameter("actionType").equals("TimPhieuMuon")) {
			timPhieuMuon(request, response);
		} else if(request.getParameter("actionType").equals("TimPhieuMuonTheoTrang")) {
			timPhieuMuonTheoTrang(request, response);
		} else if(request.getParameter("actionType").equals("Search")) {
			search(request, response);
		} else if(request.getParameter("actionType").equals("CapNhatPhieuMuon")) {
			capNhatPhieuMuon(request, response);
		} 
	}
	private void timPhieuMuon(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String khoa = "", ten = "", ngay = "";
		khoa = request.getParameter("cboKhoa");
		ten = StringUtil.toUTF8(request.getParameter("txtHoTen"));
		ngay = request.getParameter("txtNgay");
		String pageNext = Constant.PATH_RES.getString("qltb.QuanLyPhieuMuonShortPath")  + "?khoa=" + khoa + "&ngay=" + ngay;
		
		request.setAttribute("hoTenTimKiem", ten);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
	private void timPhieuMuonTheoTrang(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String khoa = "", ten = "", ngay = "", page = "";
		khoa = request.getParameter("cboKhoa");
		ten = StringUtil.toUTF8(request.getParameter("txtTen"));
		ngay = request.getParameter("txtNgay");
		page = request.getParameter("txtPage");
		String pageNext = Constant.PATH_RES.getString("qltb.QuanLyPhieuMuonShortPath")  + "?khoa=" + khoa + "&ngay=" + ngay + "&page=" + page;
		
		request.setAttribute("hoTenTimKiem", ten);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
	private void themPhieuMuon(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageNext = Constant.PATH_RES.getString("qltb.ThemPhieuMuonShortPath");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);		
		PhieuMuonThietBiModel phieuMuon = new PhieuMuonThietBiModel();	
		
		request.setCharacterEncoding("UTF-8");
		phieuMuon.setMaNguoiMuon(request.getParameter("cboNguoiMuon"));
		phieuMuon.setMaLop(request.getParameter("cboLop"));
		phieuMuon.setGhiChu(request.getParameter("txtGhiChu"));
		/*if(PhieuMuonThietBiDAO.checkNguoiMuonAndNgayMuonANDMaLopOfPhieuMuonThietBi(phieuMuon.getMaNguoiMuon(), phieuMuon.getMaLop())) {
			pageNext += "?TrungPhieuMuon=ok";
				
			rd.forward(request, response);
		} else {*/
			if(PhieuMuonThietBiDAO.insertPhieuMuonThietBi(phieuMuon))
				pageNext += "?ThemPhieuMuon=ok";
			else
				pageNext += "?ThemPhieuMuon=fail";
			response.sendRedirect(pageNext);
		//}
			
		request.setAttribute(Constant.PHIEU_MUON_THIET_BI_MODEL, phieuMuon);	
	}
	private void muonThietBi(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.MuonThietBiShortPath");
		String[] listThietBiCanMuon = request.getParameter("txtListXuLy").split("-");
		for(int i=1;i<listThietBiCanMuon.length;i++) {
			ChiTietPhieuMuonModel chiTietPhieuMuon = new ChiTietPhieuMuonModel();
			chiTietPhieuMuon.setMaThietBi(listThietBiCanMuon[i]);
			chiTietPhieuMuon.setMaPhieuMuon(request.getParameter("txtMaPhieuMuon"));
			if(!PhieuMuonThietBiDAO.muonThietBi(chiTietPhieuMuon))
				check = false;
		}
		if(check)
			pageNext += "?MuonThietBi=ok";
		else
			pageNext += "?MuonThietBi=fail";
		pageNext += "&" + getYeuToSearch(request, response);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
	private void xoaThietBiMuon(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.MuonThietBiShortPath");
		String[] listThietBiCanXoa = request.getParameter("txtListXuLy").split("-");
		for(int i=1;i<listThietBiCanXoa.length;i++) {
			if(!ChiTietPhieuMuonDAO.xoaChiTietPhieuMuon(listThietBiCanXoa[i]))
				check = false;
		}
		if(check)
			pageNext += "?XoaThietBiMuon=ok";
		else
			pageNext += "?XoaThietBiMuon=fail";
		pageNext += "&" + getYeuToSearch(request, response);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
	private void traThietBi(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.MuonThietBiShortPath");
		String[] listThietBiCanTra = request.getParameter("txtListXuLy").split("-");
		for(int i=1;i<listThietBiCanTra.length;i++) {
			if(!ChiTietPhieuMuonDAO.traThietBi(listThietBiCanTra[i]))
				check = false;
		}
		if(check)
			pageNext += "?TraThietBi=ok";
		else
			pageNext += "?TraThietBi=fail";
		pageNext += "&" + getYeuToSearch(request, response);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
		
	}
	private String getYeuToSearch (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maPhongBan = request.getParameter("txtHiddenPhongBan").toString();
		String maLoaiThietBi = request.getParameter("txtHiddenLoaiThietBi");
		String maTinhTrang = request.getParameter("txtHiddenTinhTrangChonThietBi");
		String tinhTrangXemPhieuMuon = request.getParameter("txtHiddenTinhTrangXemPhieuMuon");
		String choice = request.getParameter("txtChoice");
		String maPhieuMuon = request.getParameter("txtMaPhieuMuon");
		String tenThietBi = StringUtil.toUTF8(request.getParameter("txtHiddenTenThietBi")).trim();
		String pageNext = "phongBan=" + maPhongBan + "&loaiThietBi=" + maLoaiThietBi + "&maPhieuMuon=" + maPhieuMuon
			+ "&tinhTrangThietBi=" + maTinhTrang + "&tinhTrangXemPhieuMuon=" + tinhTrangXemPhieuMuon + "&choice=" + choice;
		request.setAttribute("tenThietBi", tenThietBi);
		return pageNext;
		
	}
	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("qltb.MuonThietBiShortPath");
		pageNext += "?" + getYeuToSearch(request, response);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
	private void capNhatPhieuMuon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("qltb.MuonThietBiShortPath");
		boolean check = true;
		pageNext += "?" + getYeuToSearch(request, response);
		String[] listThietBi = request.getParameter("txtListXuLy").split("-");
		if(ThietBiDAO.updatePhieuMuonByID(request.getParameter("txtMaPhieuMuon"), StringUtil.toUTF8(request.getParameter("txtGhiChu").trim()))) {
			for(int i=1;i<listThietBi.length;i++) {
				if(!ChiTietPhieuMuonDAO.updateChiTietPhieuMuonByID(listThietBi[i], 
						StringUtil.toUTF8(request.getParameter("txtGhiChu-") + listThietBi[i]).trim()))
					check = false;
			}
		} else
			check = false;
		if(check)
			pageNext += "?UpdatePhieuMuon=ok";
		else
			pageNext += "?UpdatePhieuMuon=fail";
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
}
