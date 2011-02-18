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
		
		
		if(actionType.equalsIgnoreCase("tinhtrang"))
		{
			showThietBi(request,response);
		}
		else if(actionType.equalsIgnoreCase("loaiThietBi"))
		{
			showLoaiThietBi(request, response);
		}
		else if(actionType.equalsIgnoreCase("insert")){
			insertThietBi(request, response);
		}
		else if(actionType.equalsIgnoreCase("QLTB_updateTB")){//update 1 thiet bi
			doPostUpdateTB(request, response);
		}
		else if(actionType.equalsIgnoreCase("dichuyen"))
		{
			diChuyenThietBi(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchTinhTrang"))
		{
			timTinhTrang(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchKiHieu"))
		{
			timKiHieu(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchPhongAndLoai"))
		{
			timPhongAndLoaiTB(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchNhaCungCap"))
		{
			timNhaCungCap(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchLoaiTB"))
		{
			timLoaiThietBi(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchPhongBan"))
		{
			timPhongBan(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchTT"))
		{
			timThongKeTinhTrang(request,response);
		}
		else if(actionType.equalsIgnoreCase("timTenThietBi"))
		{
			searchTenThietBi(request,response);
		}
		//di chuyen thiet bi
		else if(actionType.equalsIgnoreCase("PhongBanA")){
			doPostSearchPhongBanA(request, response);
		}
		else if(actionType.equalsIgnoreCase("PhongBanB"))
		{
			doPostSearchPhongBanB(request,response);
		}
		//muon thiet bi
		else if(actionType.equalsIgnoreCase("timThietBiMuon"))
		{
			searchMuonThietBi(request,response);
		}
		
		else if(actionType.equalsIgnoreCase("muonTB"))
		{
			xuLyMuon(request,response);
		}

		//chi tiet thiet bi --- xu ly combobox thanhvien
		else if(actionType.equalsIgnoreCase("timThanhVienByMaKhoa"))
		{
			searchThanhVien(request,response);
		}
		else if(actionType.equalsIgnoreCase("hienthiThanhVien"))
		{
			listShowThanhVien(request,response);
		}
		
		//thay doi thiet bi
		else if(actionType.equalsIgnoreCase("timTenThanhVienByKhoa"))
		{
			searchTenThanhVien(request,response);
		}
		else if(actionType.equalsIgnoreCase("timThietBiDaMuon")){
			doPostSearchThietBiDaMuon(request, response);
		}
	}		
	
	protected void insertThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean result=true;
		
		String pageNext = Constant.PATH_RES.getString("qltb.XemThietBiPath");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		
		int soLuong=Integer.parseInt(request.getParameter("txtSoLuong"));
		ThietBiDAO thietBiDAO=new ThietBiDAO();
		ThietBiModel thietBiModel;
		thietBiModel=new ThietBiModel();
			
		//thietBiModel.setMaThietBi(request.getParameter("MaThietBi"));
		thietBiModel.setMaThietBi(request.getParameter("MaThietBi"));
		thietBiModel.setTenThietBi(StringUtil.toUTF8(request.getParameter("txtTenThietBi")).trim());
		thietBiModel.setMaLoaiThietBi(request.getParameter("selLoaiThietBi"));
		thietBiModel.setMaBoPhan(request.getParameter("selKhoa"));
		thietBiModel.setMaNhaCungCap(request.getParameter("selNhaCC"));
		thietBiModel.setMaDonViTinh(request.getParameter("selDonViTinh"));
		thietBiModel.setMaPhongBan(request.getParameter("selPhong"));
		thietBiModel.setTanSuatToiDa(request.getParameter("txtTanSuatToiDa").trim());
		thietBiModel.setNgaySanXuat(request.getParameter("txtCalendar1").trim());
		thietBiModel.setMaDonViTanSuat(request.getParameter("selDonViTanSuat"));
		thietBiModel.setNgayMua(request.getParameter("txtCalendar2"));
		thietBiModel.setGiaMua(request.getParameter("txtGiaMua").trim());
		thietBiModel.setNgayBaoHanh(request.getParameter("txtCalendar3").trim());
		thietBiModel.setPhuKien(StringUtil.toUTF8(request.getParameter("txtPhuKien")).trim());
		thietBiModel.setNguyenTacSuDung(StringUtil.toUTF8(request.getParameter("txtNguyenTacSD")).trim());
		thietBiModel.setDacTinhKyThuat(StringUtil.toUTF8(request.getParameter("txtDacTinhKT")).trim());
		thietBiModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu")).trim());
		thietBiModel.setMaNguoiTao(request.getSession().getAttribute("maThanhVien").toString());
		thietBiModel.setKiHieu(StringUtil.toUTF8(request.getParameter("txtKiHieu")).trim());
		
		ChiTietThietBiModel chiTietThietBiModel;
		ArrayList<ChiTietThietBiModel> chiTietList=new ArrayList<ChiTietThietBiModel>();
		
		int index=1;
		int lengthChiTiet=Integer.parseInt(request.getParameter("txtIndexRow"));
		while(index<lengthChiTiet){
			chiTietThietBiModel=new ChiTietThietBiModel();
			chiTietThietBiModel.setTenLinhKien(StringUtil.toUTF8(request.getParameter("txtTenLinhKien"+index)).trim());
			chiTietThietBiModel.setMaNhaCungCap(request.getParameter("selMaNhaCungCap"+index));
			chiTietThietBiModel.setDungLuong(StringUtil.toUTF8(request.getParameter("txtDungLuong"+index)).trim());
			chiTietThietBiModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu"+index)).trim());
			chiTietList.add(chiTietThietBiModel);
			index++;
		}

		thietBiModel.setListChiTietThietBi(chiTietList);
		
		for(int i=0;i<soLuong;i++){
			result=thietBiDAO.insertThietBi(thietBiModel);
			
		}
		
		if(result){
			response.sendRedirect(Constant.PATH_RES.getString("qltb.DanhSachNhaCungCap")
					+ "?errInsert=false&stt=insert");
		}
		else{
			response.sendRedirect(Constant.PATH_RES.getString("qltb.DanhSachNhaCungCap")
					+ "?errInsert=true&stt=insert");
		}		

	}
	
	private void timThietBiTheoPhong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String maPhong = request.getParameter("cboPhong");
		
		ArrayList<ThietBiModel> listThietBi = DiChuyenThietBiDAO.getAllThietBiByMaPhong(maPhong);
		request.setAttribute("listThietBi", listThietBi);
		String pageNext = Constant.PATH_RES.getString("qltb.XemThietBiPath") + "?maPhongBan=" + maPhong;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);
	}
	
	
	
	protected void showThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maThietBi="";
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi") + "?MaThietBi=" + maThietBi ;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		
		ArrayList<ThietBiModel> thietBiModelList1  = new ArrayList<ThietBiModel>();
		ArrayList<ThietBiModel> thietBiModelList2  = new ArrayList<ThietBiModel>();
		if(request.getSession().getAttribute("listThietBi") != null)
			thietBiModelList1 = (ArrayList<ThietBiModel>)request.getSession().getAttribute("listThietBi");
		
		for(Integer i = 1; i <= thietBiModelList1.size(); i++){
			
			ThietBiModel thietBiModel = thietBiModelList1.get(i-1);
			
			if(request.getParameter("xuly") != null && request.getParameter("xuly").equals("xoa") && request.getParameter("chk" + i.toString()) != null)
			{
				if(thietBiModel.getMaThietBi() != null){
					ThietBiDAO.deleteThietBi(thietBiModel.getMaThietBi());
				}
			}
			else{
				thietBiModelList2.add(thietBiModel);
			}
		}
		
		if(request.getParameter("xuly").equals("xoa"))
		{
			
			rd = request.getRequestDispatcher(pageNext);	
			pageNext += "?xoa=DeleteTC";
		}
		request.setAttribute(Constant.THIET_BI_MODEL_LIST, thietBiModelList2);
		rd.forward(request, response);
	}
	
	protected void showLoaiThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maLoaiThietBi = request.getParameter("cboLoaiThietBi");
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi") + "?MaLoaiThietBi=" + maLoaiThietBi ;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);
	}
	
	protected void diChuyenThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maPhong = request.getParameter("cboPhong1");		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<ThietBiModel> thietBiList = new ArrayList<ThietBiModel>();
		
		if(request.getSession().getAttribute("ThietBiList") != null)
		{
			thietBiList = (ArrayList<ThietBiModel>) request.getSession().getAttribute("ThietBiList");
		}
		
		request.setAttribute(Constant.THIET_BI_LIST, thietBiList);
		String pageNext = Constant.PATH_RES.getString("qltb.XemThietBiPath") + "?MaPhong=" + maPhong;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);		
	}
	//tim kiem theo combobox
	//danh sach thiet bi
	protected void timTinhTrang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maTinhTrang = request.getParameter("cboTinhTrang").toString();
			
			ArrayList<ThietBiModel> listThietBi = ThietBiDAO.getAllThietBiByMaTinhTrang(maTinhTrang);
			request.setAttribute("listThietBi", listThietBi);
			String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi") + "?maTinhTrang=" + maTinhTrang ;
			
			if(maTinhTrang.equals("-1"))
			{
				listThietBi = ThietBiDAO.getAllThietBi();
				request.setAttribute("listThietBi", listThietBi);
				pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi");
			}
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
	
	protected void timKiHieu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maThietBi = request.getParameter("cboKihieu").toString();
			
			ArrayList<ThietBiModel> listThietBi = ThietBiDAO.getAllThietBiByKiHieuTB(maThietBi);
			request.setAttribute("listThietBi", listThietBi);
			String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi") + "?maThietBi=" + maThietBi ;
			
			if(maThietBi.equals("-1"))
			{
				listThietBi = ThietBiDAO.getAllThietBi();
				request.setAttribute("listThietBi", listThietBi);
				pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi");
			}
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
	
	private void timPhongAndLoaiTB (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maPhongBan = request.getParameter("cboPhong").toString();
		String maLoaiThietBi = request.getParameter("cboLoaiThietBi");
		
		ArrayList<ThietBiModel> listThietBi = ThietBiDAO.getAllThietBiByPhongAndLoaiTB(maPhongBan, maLoaiThietBi);
		request.setAttribute("listThietBi", listThietBi);
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi") 
							+ "?maPhongBan=" + maPhongBan + "&maLoaiThietBi=" + maLoaiThietBi ;
		if (maPhongBan.equals("-1") && maLoaiThietBi.equals("-1")) {
			listThietBi = ThietBiDAO.getAllThietBi();
			request.setAttribute("listThietBi", listThietBi);
			pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi");
		}		
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);						
		rd.forward(request, response);
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
	protected void timLoaiThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maLoaiThietBi = request.getParameter("cboLoaiThietBi");
			
			ArrayList<ThietBiModel> listThietBi = ThongKeDAO.getAllThongKeByMaLoaiThietBi(maLoaiThietBi);
			request.setAttribute("listThietBi", listThietBi);
			String pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath") + "?maLoaiThietBi=" + maLoaiThietBi ;
			
			if(maLoaiThietBi.equals("-1"))
			{
				listThietBi = ThongKeDAO.showAllTanSuatThietBi();
				request.setAttribute("listThietBi", listThietBi);
				pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath");
			}
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
	protected void timPhongBan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maPhongBan = request.getParameter("cboPhongBan");
			
			ArrayList<ThietBiModel> listThietBi = ThongKeDAO.getAllThongKeByMaPhongBan(maPhongBan);
			request.setAttribute("listThietBi", listThietBi);
			String pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath") + "?maPhongBan=" + maPhongBan ;
			
			if(maPhongBan.equals("-1"))
			{
				listThietBi = ThongKeDAO.showAllTanSuatThietBi();
				request.setAttribute("listThietBi", listThietBi);
				pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath");
			}
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
	protected void timThongKeTinhTrang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maTinhTrang = request.getParameter("cboTT");
			
			ArrayList<ThietBiModel> listThietBi = ThongKeDAO.getAllThongKeByMaTinhTrang(maTinhTrang);
			request.setAttribute("listThietBi", listThietBi);
			String pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath") + "?maTinhTrang=" + maTinhTrang ;
			
			if(maTinhTrang.equals("-1"))
			{
				listThietBi = ThongKeDAO.showAllTanSuatThietBi();
				request.setAttribute("listThietBi", listThietBi);
				pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath");
			}
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
	protected void searchTenThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenThietBi = request.getParameter("txtTimKiemTheoTenThietBi");
		request.setAttribute("ten", tenThietBi);
		
			ArrayList<ThietBiModel> listThietBi = ThongKeDAO.getAllThongKeByTenThietBi(tenThietBi);
			request.setAttribute("listThietBi", listThietBi);
			String pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath") + "?tenThietBi=" + tenThietBi ;
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
	// muon thiet bi
	
	protected void searchMuonThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ngay = request.getParameter("txtThoiGianTra").toString();		
		request.setAttribute("ThoiGianTra", ngay);
		
		String tenThietBi = StringUtil.toUTF8(request.getParameter("txtTimThietBiMuon").toString());
		request.setAttribute("tenThietBi", tenThietBi);
		String kiHieu = request.getParameter("txtTimKiHieu");
		request.setAttribute("kiHieu", kiHieu);
		
		String maLoaiThietBi = request.getParameter("cboLoaiThietBi").toString();
		request.setAttribute("maLoaiThietBi", maLoaiThietBi);
		
		ArrayList<ThietBiModel> listThietBi = PhieuMuonThietBiDAO.getSearchTenAndKiHieuThietBi(tenThietBi,kiHieu,maLoaiThietBi);
		request.setAttribute("listThietBi", listThietBi);
		String pageNext = Constant.PATH_RES.getString("qltb.MuonThietBiPath") 
							+ "?tenThietBi=" + tenThietBi + "&kiHieu=" + kiHieu + "&maLoaiThietBi=" + maLoaiThietBi ;
		
		if (tenThietBi.equals("") && kiHieu.equals("") && maLoaiThietBi.equals("-1")) {
			listThietBi = ThietBiDAO.showAllMuonThietBi();
			request.setAttribute("listThietBi", listThietBi);
		}
		pageNext = Constant.PATH_RES.getString("qltb.MuonThietBiPath");
		
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);						
		rd.forward(request, response);
	}
	
	private void xuLyMuon (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean result=true;
		PhieuMuonThietBiModel phieuMuon = new PhieuMuonThietBiModel();
		
		phieuMuon.setThoiGianTra(request.getParameter("txtThoiGianTra").trim());
		phieuMuon.setNguoiMuon(StringUtil.toUTF8(request.getParameter("cboNguoiMuon")).trim());
		
		String maThietBi="";
		String pageNext = Constant.PATH_RES.getString("qltb.MuonThietBiPath") + "?MaThietBi=" + maThietBi ;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		
		ArrayList<ThietBiModel> thietBiModelList1  = new ArrayList<ThietBiModel>();
		ArrayList<ThietBiModel> thietBiModelList2  = new ArrayList<ThietBiModel>();
		if(request.getSession().getAttribute("listThietBi") != null)
			thietBiModelList1 = (ArrayList<ThietBiModel>)request.getSession().getAttribute("listThietBi");
		
		for(Integer i = 1; i <= thietBiModelList1.size(); i++){
			
			ThietBiModel thietBiModel = thietBiModelList1.get(i-1);
			
			if(request.getParameter("xuly") != null && request.getParameter("xuly").equals("muon") && request.getParameter("chk" + i.toString()) != null)
			{
				if(thietBiModel.getMaThietBi() != null){
					PhieuMuonThietBiDAO.muonThietBi(thietBiModel.getMaThietBi(),phieuMuon);
				}
			}
			else{
				thietBiModelList2.add(thietBiModel);
			}
		}
		
		if(request.getParameter("xuly").equals("muon"))
		{			
			rd = request.getRequestDispatcher(pageNext);	
			pageNext += "?muon=DeleteTC";
		}
		if(result){
			pageNext=Constant.PATH_RES.getString("qltb.MuonThietBiPath");
		}
		request.setAttribute(Constant.THIET_BI_MODEL_LIST, thietBiModelList2);
		rd.forward(request, response);
	}
	
	//chi tiet thiet bi
	private void doPostUpdateTB (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maThietBi = request.getParameter("id");
		String tenThietBi = request.getParameter("txtTenThietBi");
		String tenDonViTanSuat = request.getParameter("cboDonViTanSuat");
		String tenLinhKien = StringUtil.toUTF8(request.getParameter("txtTenLinhKien"));
		String dungLuong = request.getParameter("txtDungLuong");

		String kiHieu = StringUtil.toUTF8(request.getParameter("txtKiHieu"));
		String soMay = request.getParameter("txtSoMay");
		String ngaySanXuat = request.getParameter("txtNgaySanXuat").trim();
		String tenTinhTrang = request.getParameter("cboTinhTrang");
		String giaMua = request.getParameter("txtGiaMua").trim();
		
		String ngayMua = StringUtil.toUTF8(request.getParameter("txtNgayMua"));
		String tanSuatToiDa = request.getParameter("txtTanSuatToiDa").trim();
		String ngayBatDauSuDung = request.getParameter("txtNgayBatDauSuDung").trim();
		String tanSuatSuDung = request.getParameter("txtTanSuatSuDung");
		String soLanSuDung = request.getParameter("txtSoLanSuDung");
		
		String phuKien = request.getParameter("txtPhuKien");
		String soLanBaoTri = request.getParameter("txtSoLanBaoTri");
		String ngayBaoHanh = request.getParameter("txtNgayBaoHanh").trim();
		String nguyenTacSuDung = request.getParameter("teaNguyenTacSuDung");
		String dacTinhKyThuat = request.getParameter("teaDacTinhKyThuat");
		
		String tenLoaiThietBi = request.getParameter("cboLoaiThietBi");
		String tenPhongBan = request.getParameter("cboPhong");
		String tenBoPhan = request.getParameter("cboKhoa");
		String tenNhaCungCap = request.getParameter("cboNhaCungCap");
		String tenDonViTinh = request.getParameter("cboDonViTinh");
		
		String hoThanhVien = request.getParameter("cboNguoiTao");
		String tenLot = request.getParameter("cboNguoiTao");
		String tenThanhVien = request.getParameter("cboNguoiTao");
		
		//tinh txtHienTrang chua co table HienTrang
			
			ChiTietThietBiModel chiTietThietBiModel = new ChiTietThietBiModel();
			
			chiTietThietBiModel.setMaThietBi(maThietBi);
			chiTietThietBiModel.setTenThietBi(tenThietBi);
			chiTietThietBiModel.setTenDonViTanSuat(tenDonViTanSuat);
			chiTietThietBiModel.setTenLinhKien(tenLinhKien);
			chiTietThietBiModel.setDungLuong(dungLuong);
			
			
			chiTietThietBiModel.setKiHieu(kiHieu);
			chiTietThietBiModel.setSoMay(soMay);
			chiTietThietBiModel.setNgaySanXuat(ngaySanXuat);
			chiTietThietBiModel.setTenTinhTrang(tenTinhTrang);
			chiTietThietBiModel.setGiaMua(giaMua);

			chiTietThietBiModel.setNgayMua(ngayMua);
			chiTietThietBiModel.setTanSuatToiDa(tanSuatToiDa);
			chiTietThietBiModel.setNgayBatDauSuDung(ngayBatDauSuDung);
			chiTietThietBiModel.setTanSuatSuDung(tanSuatSuDung);
			chiTietThietBiModel.setSoLanSuDung(soLanSuDung);
			
			chiTietThietBiModel.setPhuKien(phuKien);
			chiTietThietBiModel.setSoLanBaoTri(soLanBaoTri);
			chiTietThietBiModel.setNgayBaoHanh(ngayBaoHanh);
			chiTietThietBiModel.setNguyenTacSuDung(nguyenTacSuDung);
			chiTietThietBiModel.setDacTinhKyThuat(dacTinhKyThuat);

			chiTietThietBiModel.setTenLoaiThietBi(tenLoaiThietBi);
			chiTietThietBiModel.setTenPhongBan(tenPhongBan);
			chiTietThietBiModel.setTenBoPhan(tenBoPhan);
			chiTietThietBiModel.setTenNhaCungCap(tenNhaCungCap);
			chiTietThietBiModel.setTenDonViTinh(tenDonViTinh);
			
			chiTietThietBiModel.setTenThanhVien(tenThanhVien);
			
			if(ChiTietThietBiDAO.updateChiTietThietBi(chiTietThietBiModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("qltb.XemChiTietThietBiPath")
						+ "?msg=" + "msg_1");
			}else{
				response.sendRedirect(Constant.PATH_RES
						.getString("qltb.XemChiTietThietBiPath")
						+ "?err=" + "err1");
			}
	}
	
	//chi tiet thiet bi ---xu ly combobox thanhvien
	protected void searchThanhVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maKhoa = request.getParameter("cboKhoa").toString();
		
		ArrayList<ThanhVienModel> listThanhVien = PhieuMuonThietBiDAO.getAllThanhVienMuonThietBi(maKhoa);
		request.setAttribute("listThanhVien", listThanhVien);
		String pageNext = Constant.PATH_RES.getString("qltb.SearchThanhVienByMaKhoa") + "?maKhoa=" + maKhoa ;

		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);
	}
	protected void listShowThanhVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maThanhVien = request.getParameter("cboKhoa");
		String pageNext = Constant.PATH_RES.getString("qltb.SearchThanhVienByMaKhoa") + "?MaThanhVien=" + maThanhVien ;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		
			ArrayList<ThanhVienModel> thanhVienModelList1  = new ArrayList<ThanhVienModel>();
			ArrayList<ThanhVienModel> thanhVienModelList2  = new ArrayList<ThanhVienModel>();
			if(request.getSession().getAttribute("listThanhVien") != null)
				thanhVienModelList1 = (ArrayList<ThanhVienModel>)request.getSession().getAttribute("listThanhVien");
			
			for(Integer i = 1; i <=thanhVienModelList1.size(); i++){			
				ThanhVienModel thanhVienModel = thanhVienModelList1.get(i-1);			
				thanhVienModelList2.add(thanhVienModel);
			}
			request.setAttribute(Constant.THANH_VIEN_MODEL_LIST, thanhVienModelList2);
			rd.forward(request, response);
	}
	
	// di chuyen thiet bi
	protected void doPostSearchPhongBanB(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maPhongBan = request.getParameter("cboPhongBanB").toString();
		String maPhongBan_1 = request.getParameter("cboPhongBanA").toString();	
			ArrayList<ThietBiModel> listB = ThongKeDAO.getAllThongKeByMaPhongBan(maPhongBan);
			ArrayList<ThietBiModel> listThietBi1 = new ArrayList<ThietBiModel>();
			request.setAttribute(Constant.THIET_BI_LIST_2, listB);
			if(request.getSession().getAttribute("thietBiList1") != null)
				listThietBi1 = (ArrayList<ThietBiModel>)request.getSession().getAttribute("thietBiList1");
			request.setAttribute(Constant.THIET_BI_LIST_1, listThietBi1);
			String pageNext = Constant.PATH_RES.getString("qltb.DiChuyenThietBi") + "?PhongBanB=" + maPhongBan + "&PhongBanA=" + maPhongBan_1;
			
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
	
	protected void doPostSearchPhongBanA(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maPhongBan_1 = request.getParameter("cboPhongBanA").toString();
		String maPhongBan = request.getParameter("cboPhongBanB").toString();
			ArrayList<ThietBiModel> listThietBi = ThietBiDAO.getAllThietBiDiChuyen(maPhongBan_1);
			ArrayList<ThietBiModel> listThietBi2 = new ArrayList<ThietBiModel>();
			request.setAttribute(Constant.THIET_BI_LIST_1, listThietBi);
			if(request.getSession().getAttribute("thietBiList2") != null)
				listThietBi2 = (ArrayList<ThietBiModel>)request.getSession().getAttribute("thietBiList2");
			request.setAttribute(Constant.THIET_BI_LIST_2, listThietBi2);
			String pageNext = Constant.PATH_RES.getString("qltb.DiChuyenThietBi") + "?PhongBanA=" + maPhongBan_1 + "&PhongBanB=" + maPhongBan;
			
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
	
	// thay doi thiet bi	
	protected void searchTenThanhVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maKhoa = request.getParameter("cboKhoa").toString();
		request.setAttribute("maKhoa", maKhoa);
		ArrayList<ThanhVienModel> listThanhVien = PhieuMuonThietBiDAO.getAllThanhVienMuonThietBi(maKhoa);
		request.setAttribute("listThanhVien", listThanhVien);
		String pageNext = Constant.PATH_RES.getString("qltb.ThayDoiThietBiPath") + "?maKhoa=" + maKhoa ;
		
		if(maKhoa.equals("-1"))
		{
			listThanhVien = ThanhVienDAO.timAllThanhVien();
			request.setAttribute("listThanhVien", listThanhVien);
			pageNext = Constant.PATH_RES.getString("qltb.ThayDoiThietBiPath");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);
	}
	
	protected void doPostSearchThietBiDaMuon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maThanhVien = request.getParameter("cboNguoiMuon").toString();
		
		ArrayList<ThietBiModel> listThietBiDaMuon = PhieuMuonThietBiDAO.getAllThietBiByMaThanhVien(maThanhVien);
		
			if(request.getSession().getAttribute("thietBiDaMuon") != null)
				listThietBiDaMuon = (ArrayList<ThietBiModel>)request.getSession().getAttribute("thietBiDaMuon");
			request.setAttribute(Constant.THIET_BI_LIST, listThietBiDaMuon);
			
			String pageNext = Constant.PATH_RES.getString("qltb.ThayDoiThietBiPath") + "?maThanhVien=" + maThanhVien;
			
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}
}
