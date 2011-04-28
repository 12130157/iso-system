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
import vn.edu.hungvuongaptech.dao.NhaCungCapDAO;

import vn.edu.hungvuongaptech.dao.PhongBanDAO;
import vn.edu.hungvuongaptech.dao.SysRoleAppDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.dao.ThayDoiThietBiDAO;
import vn.edu.hungvuongaptech.dao.ThietBiDAO;
import vn.edu.hungvuongaptech.dao.ThongKeDAO;
import vn.edu.hungvuongaptech.dao.KhoaDAO;
import vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO;
import vn.edu.hungvuongaptech.dao.DiChuyenThietBiDAO;
import vn.edu.hungvuongaptech.dao.ChiTietThietBiDAO;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.LoaiThietBiModel;
import vn.edu.hungvuongaptech.model.MonHocModel;
import vn.edu.hungvuongaptech.model.NhaCungCapModel;
import vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel;
import vn.edu.hungvuongaptech.model.SysRoleAppModel;
import vn.edu.hungvuongaptech.model.TaiKhoanModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ThietBiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	/*
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, 
	 * javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/* 
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, 
	 * javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType=request.getParameter("actionType");
		
		if(actionType.equalsIgnoreCase("ThemThietBi") || actionType.equalsIgnoreCase("CapNhatThietBi")){
			themThietBi(request, response);
		}
		else if(actionType.equalsIgnoreCase("BaoHuThietBi")) {
			baoHuThietBi(request, response);
		}
		else if(actionType.equalsIgnoreCase("XoaThietBi")) {
			xoaThietBi(request, response);
		}
		else if(actionType.equalsIgnoreCase("searchThietBi"))
		{
			searchThietBi(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchNhaCungCap"))
		{
			timNhaCungCap(request,response);
		}
		else if(actionType.equalsIgnoreCase("ThemLinhKien") || actionType.equalsIgnoreCase("UpdateLinhKien")) {
			themLinhKien(request,response);
		}
		else if(actionType.equalsIgnoreCase("XoaLinhKien")) {
			xoaLinhKien(request, response);
		}
		else if(actionType.equalsIgnoreCase("searchLinhKien"))
		{
			searchLinhKien(request,response);
		}
	}		
	private void xoaLinhKien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.XemLinhKienShortPath");
		String[] listLinhKienCanXoa = request.getParameter("txtListLinhKien").split("-");
		for(int i=1;i<listLinhKienCanXoa.length;i++) {
			if(!ChiTietThietBiDAO.deleteChiTietThietBiByID(listLinhKienCanXoa[i]))
				check = false;
		}
		if(check)
			pageNext += "?XoaLinhKien=ok";
		else
			pageNext += "?XoaLinhKien=fail";
		response.sendRedirect(pageNext);
	}
	private void themThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageNext = Constant.PATH_RES.getString("qltb.XemThietBiShortPath");
		
		String actionType = request.getParameter("actionType");
		ThietBiModel thietBiModel;
		thietBiModel=new ThietBiModel();
			
		if(request.getSession().getAttribute("ThietBi") != null)
			thietBiModel = (ThietBiModel) request.getSession().getAttribute("ThietBi");
		//thietBiModel.setMaThietBi(request.getParameter("MaThietBi"));
		mapParameterToThietBiModel(request, response, thietBiModel);
				
		if(actionType.equals("ThemThietBi")){
			if(ThietBiDAO.insertThietBi(thietBiModel))
				pageNext += "?ThemThietBi=ok";
			else
				pageNext += "?ThemThietBi=fail";
		}
		else{
			if(ThietBiDAO.updateThietBi(thietBiModel))
				pageNext += "?UpdateThietBi=ok";
			else
				pageNext += "?UpdateThietBi=fail";
		}		
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		request.setAttribute(Constant.THIET_BI, thietBiModel);
		rd.forward(request, response);
	}
	protected void themLinhKien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageNext = Constant.PATH_RES.getString("qltb.XemChiTietThietBiShortPath");
		
		String actionType = request.getParameter("actionType");
		ChiTietThietBiModel linhKien = new ChiTietThietBiModel();
			
		if(request.getSession().getAttribute("ChiTietThietBi") != null)
			linhKien = (ChiTietThietBiModel) request.getSession().getAttribute("ChiTietThietBi");
		//thietBiModel.setMaThietBi(request.getParameter("MaThietBi"));
		mapParameterToLinhKienModel(request, response, linhKien);
				
		if(actionType.equals("ThemLinhKien")){
			if(ChiTietThietBiDAO.insertChiTietThietBi(linhKien))
				pageNext += "?ThemLinhKien=ok";
			else
				pageNext += "?ThemLinhKien=fail";
		}
		else{
			if(ChiTietThietBiDAO.updateChiTietThietBi(linhKien))
				pageNext += "?UpdateLinhKien=ok";
			else
				pageNext += "?UpdateLinhKien=fail";
		}		
		
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		request.setAttribute(Constant.CHI_TIET_THIET_BI, linhKien);
		rd.forward(request, response);
	}
	private void mapParameterToLinhKienModel(HttpServletRequest request, HttpServletResponse response, 
			ChiTietThietBiModel chiTietThietBiModel) {
	if(chiTietThietBiModel.getMaNguoiTao() == null)
		chiTietThietBiModel.setMaNguoiTao((String)request.getSession().getAttribute("maThanhVien"));
	chiTietThietBiModel.setTenChiTietThietBi(StringUtil.toUTF8(request.getParameter("txtTenLinhKien")).trim());
	chiTietThietBiModel.setMaLoaiChiTietThietBi(request.getParameter("cboLoaiThietBiLinhKien"));
	chiTietThietBiModel.setMaBoPhan(request.getParameter("cboKhoa"));
	chiTietThietBiModel.setMaNhaCungCap(request.getParameter("cboNhaCungCap"));
	chiTietThietBiModel.setMaPhongBan(request.getParameter("cboPhongBan"));
	chiTietThietBiModel.setTanSuatToiDa(request.getParameter("txtTanSuatToiDa").trim());
	chiTietThietBiModel.setNgaySanXuat(request.getParameter("txtCalendar1").trim());
	chiTietThietBiModel.setNgayMua(request.getParameter("txtCalendar2"));
	chiTietThietBiModel.setGiaMua(request.getParameter("txtGiaMua").trim());
	chiTietThietBiModel.setHanBaoHanh(request.getParameter("txtCalendar3").trim());
	chiTietThietBiModel.setNgayBatDauSuDung(request.getParameter("txtCalendar4"));
	chiTietThietBiModel.setNguyenTacSuDung(StringUtil.toUTF8(request.getParameter("txtNguyenTacSD")).trim());
	chiTietThietBiModel.setDacTinhKyThuat(StringUtil.toUTF8(request.getParameter("txtDacTinhKT")).trim());
	chiTietThietBiModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu")).trim());
	chiTietThietBiModel.setKiHieu(StringUtil.toUTF8(request.getParameter("txtKiHieu")).trim());
}	
	private void baoHuThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBiPath");
		String[] listThietBiBaoHu = request.getParameter("txtListThietBi").split("</>");
		for(int i=1;i<listThietBiBaoHu.length;i++) {
			String[] listLinhKienKhongHu = listThietBiBaoHu[i].split("<->");
			for(int j=1;j<listLinhKienKhongHu.length;j++) {
				if(!ChiTietThietBiDAO.thayDoiChiTietThietBiByID(listLinhKienKhongHu[i]))
					check = false;
			}
			if(!ThietBiDAO.baoHuThietBi(listThietBiBaoHu[i]))
				check = false;
		}
		if(check)
			pageNext += "?BaoHuThietBi=ok";
		else
			pageNext += "?BaoHuThietBi=fail";
		response.sendRedirect(pageNext);
	}
	private void xoaThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBiPath");
		String[] listThietBiCanXoa = request.getParameter("txtListThietBi").split("-");
		for(int i=1;i<listThietBiCanXoa.length;i++) {
			if(!ThietBiDAO.xoaThietBi(listThietBiCanXoa[i]))
				check = false;
		}
		if(check)
			pageNext += "?XoaThietBi=ok";
		else
			pageNext += "?XoaThietBi=fail";
		response.sendRedirect(pageNext);
	}
	private void mapParameterToThietBiModel(HttpServletRequest request, HttpServletResponse response, 
				ThietBiModel thietBiModel) {
		if(thietBiModel.getMaNguoiTao() == null)
			thietBiModel.setMaNguoiTao((String)request.getSession().getAttribute("maThanhVien"));
		thietBiModel.setTenThietBi(StringUtil.toUTF8(request.getParameter("txtTenThietBi")).trim());
		thietBiModel.setMaLoaiThietBi(request.getParameter("cboLoaiThietBiLinhKien"));
		thietBiModel.setMaBoPhan(request.getParameter("cboKhoa"));
		thietBiModel.setMaNhaCungCap(request.getParameter("cboNhaCungCap"));
		thietBiModel.setMaPhongBan(request.getParameter("cboPhongBan"));
		thietBiModel.setTanSuatToiDa(request.getParameter("txtTanSuatToiDa").trim());
		thietBiModel.setNgaySanXuat(request.getParameter("txtCalendar1").trim());
		thietBiModel.setNgayMua(request.getParameter("txtCalendar2"));
		thietBiModel.setGiaMua(request.getParameter("txtGiaMua").trim());
		thietBiModel.setHanBaoHanh(request.getParameter("txtCalendar3").trim());
		thietBiModel.setNgayBatDauSuDung(request.getParameter("txtCalendar4"));
		thietBiModel.setNguyenTacSuDung(StringUtil.toUTF8(request.getParameter("txtNguyenTacSD")).trim());
		thietBiModel.setDacTinhKyThuat(StringUtil.toUTF8(request.getParameter("txtDacTinhKT")).trim());
		thietBiModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu")).trim());
		thietBiModel.setMaNguoiTao(request.getSession().getAttribute("maThanhVien").toString());
		thietBiModel.setKiHieu(StringUtil.toUTF8(request.getParameter("txtKiHieu")).trim());
		if(request.getParameter("cboSoLuong") != null)
			thietBiModel.setSoLuong(request.getParameter("cboSoLuong"));
		/*ChiTietThietBiModel chiTietThietBiModel;
		ArrayList<ChiTietThietBiModel> chiTietList=new ArrayList<ChiTietThietBiModel>();
		
		int index=1;
		int lengthChiTiet=Integer.parseInt(request.getParameter("txtIndexRow"));
		for(int i=1;i<=lengthChiTiet;i++){
			chiTietThietBiModel=new ChiTietThietBiModel();
			if(thietBiModel.getChiTietThietBiList() != null && i<=thietBiModel.getChiTietThietBiList().size())
				chiTietThietBiModel = thietBiModel.getChiTietThietBiList().get(i-1);
			chiTietThietBiModel.setMaNhaCungCap(request.getParameter("selMaNhaCungCap"+index));
			chiTietThietBiModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu"+index)).trim());
			chiTietList.add(chiTietThietBiModel);
		}
		for(int i=lengthChiTiet;i<thietBiModel.getChiTietThietBiList().size();i++) {
			chiTietThietBiModel = thietBiModel.getChiTietThietBiList().get(i);
			if(chiTietThietBiModel.getMaCTTB() != null)
				ChiTietThietBiDAO.deleteChiTietThietBiByID(chiTietThietBiModel.getMaCTTB());
		}
		thietBiModel.setListChiTietThietBi(chiTietList);*/
	}	
	private void searchThietBi (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maPhongBan = request.getParameter("cboPhong").toString();
		String maLoaiThietBi = request.getParameter("cboLoaiThietBi");
		String maTinhTrang = request.getParameter("cboTinhTrang");
		
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi") + "?phongBan=" + maPhongBan
			+ "&loaiThietBi=" + maLoaiThietBi + "&tinhTrang=" + maTinhTrang;
			
		response.sendRedirect(pageNext);
	}
	private void searchLinhKien (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maPhongBan = request.getParameter("cboPhong").toString();
		String maLoaiLinhKien = request.getParameter("cboLoaiLinhKien");
		String maTinhTrang = request.getParameter("cboTinhTrang");
		
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachLinhKien") + "?phongBan=" + maPhongBan
			+ "&loaiLinhKien=" + maLoaiLinhKien + "&tinhTrang=" + maTinhTrang;
			
		response.sendRedirect(pageNext);
	}
	//thong ke
	protected void timNhaCungCap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maNhaCungCap = request.getParameter("cboNhaCungCap");
			
			ArrayList<ThietBiModel> listThietBi = ThongKeDAO.getAllThongKeByMaNhaCungCap(maNhaCungCap);
			request.setAttribute("listThietBi", listThietBi);
			String pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath") + "?maNhaCungCap=" + maNhaCungCap ;
			
			if(maNhaCungCap.equals("-1"))
			{
				listThietBi = ThongKeDAO.showAllTanSuatThietBi();
				request.setAttribute("listThietBi", listThietBi);
				pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath");
			}
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
}
