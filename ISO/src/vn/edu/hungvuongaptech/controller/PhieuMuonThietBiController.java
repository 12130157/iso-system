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
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.MonHocTKBDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;

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
	boolean check;
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
		if(request.getParameter("them") != null) {
			themThoiKhoaBieu(request, response);
		} 
	}
	
	private void mapParameterToModel(HttpServletRequest req 
			,HttpServletResponse res
				,ThoiKhoaBieuModel thoiKhoaBieuModel) {	
		thoiKhoaBieuModel.setMaNguoiTao(req.getSession().getAttribute("maThanhVien").toString());	
		if (req.getParameter("cboHocKi") != null) {
			thoiKhoaBieuModel.setHocKi(req.getParameter("cboHocKi").trim()); }
		if (req.getParameter("cboNam1") != null) {
			thoiKhoaBieuModel.setNam1(req.getParameter("cboNam1")); }
		if (req.getParameter("txtNam2") != null) {
			thoiKhoaBieuModel.setNam2(req.getParameter("txtNam2").trim()); }
		if (req.getParameter("cboLop") != null) {
			thoiKhoaBieuModel.setMaLop(req.getParameter("cboLop")); }
		if (req.getParameter("txtChuyenNganh") != null) {
			thoiKhoaBieuModel.setTenChuyenNganh(StringUtil.toUTF8(req.getParameter("txtChuyenNganh").trim())); }
		if (req.getParameter("cboTuanBatDau") != null) {
			thoiKhoaBieuModel.setTuanBatDau(req.getParameter("cboTuanBatDau")); }
		if (req.getParameter("cboTuanKetThuc") != null) {
			thoiKhoaBieuModel.setTuanKetThuc(req.getParameter("cboTuanKetThuc")); }
		if (req.getParameter("txtTuNgay") != null) {
			thoiKhoaBieuModel.setNgayBatDau(req.getParameter("txtTuNgay").trim()); }
		if (req.getParameter("txtDenNgay") != null) {
			thoiKhoaBieuModel.setNgayKetThuc(req.getParameter("txtDenNgay").trim()); }
		thoiKhoaBieuModel.setNgayGui("");
		
		ArrayList<MonHocTKBModel> monHocTKBList = new ArrayList<MonHocTKBModel>();
		ArrayList<ChiTietTKBModel> chiTietTKBModelList;
		String[] value1, value2, chiTiet;
		for(Integer i=1;i<=Integer.parseInt(req.getParameter("txtTongSoMonHoc"));i++) {
			MonHocTKBModel monHocTKBModel = new MonHocTKBModel();
			
			value1 = req.getParameter("MonHoc" + i.toString()).split("<->");
			monHocTKBModel.setGhiChu(value1[0]);
			monHocTKBModel.setSoNoiDung(value1[1]);
			monHocTKBModel.setSoCaThucHanh(value1[2]);
			monHocTKBModel.setMaMonHoc(value1[3]);
			monHocTKBModel.setTenMonHoc(StringUtil.toUTF8(value1[4]));
			monHocTKBModel.setMaGiaoVien(value1[5]);
			monHocTKBModel.setTenGiaoVien(StringUtil.toUTF8(value1[6]));
			monHocTKBModel.setMaMonHocTKB(value1[7]);
			monHocTKBModel.setChuoiPhongLT(StringUtil.toUTF8(value1[8]));
			monHocTKBModel.setChuoiPhongTH(StringUtil.toUTF8(value1[9]));
			monHocTKBModel.setNgayBatDauLT(value1[10]);
			monHocTKBModel.setNgayBatDauTH(value1[11]);
			monHocTKBModel.setNgayKetThucLT(value1[12]);
			monHocTKBModel.setNgayKetThucTH(value1[13]);
			monHocTKBModel.setChuoiThuTrongTuan(StringUtil.toUTF8(value1[14]));
			monHocTKBModel.setKieuBienSoan(value1[15]);
			monHocTKBModel.setLyThuyetCTMH(value1[16]);
			monHocTKBModel.setThucHanhCTMH(value1[17]);
			monHocTKBModel.setTuanBatDauLT(value1[18]);
			monHocTKBModel.setTuanBatDauTH(value1[19]);
			monHocTKBModel.setUser1(value1[20]);
			monHocTKBModel.setUser2(value1[21]);
			
			if(req.getParameter("XoaMonHoc") != null && 
					req.getParameter("XoaMonHoc").equals("XoaMonHoc") &&
					monHocTKBModel.getMaMonHocTKB().equals(req.getParameter("cboXoaMonHoc")))
			{
				if(MonHocTKBDAO.deleteMonHocTKB(req.getParameter("cboXoaMonHoc"))) {
					check = true;
				}	
			}
			else
			{
				value2 = req.getParameter("ChiTiet" + i.toString()).split("</>");
				chiTietTKBModelList = new ArrayList<ChiTietTKBModel>();
				for(Integer j=0;j<value2.length;j++) {
					ChiTietTKBModel chiTietTKBModel = new ChiTietTKBModel();
					
					chiTiet = value2[j].split("<->");
					chiTietTKBModel.setMaChiTietTKB(chiTiet[0]);
					chiTietTKBModel.setBuoi(StringUtil.toUTF8(chiTiet[1]));
					chiTietTKBModel.setsTTNoiDung(chiTiet[2]);
					chiTietTKBModel.setCoHieu(chiTiet[3]);
					chiTietTKBModel.setHinhThucDay(chiTiet[4]);
					chiTietTKBModel.setThuTrongTuan(chiTiet[5]);
					chiTietTKBModel.setMaPhong(chiTiet[6]);
					chiTietTKBModel.setTuan(chiTiet[7]);
					chiTietTKBModel.setSoThuTu(chiTiet[8]);
					chiTietTKBModel.setNhom(chiTiet[9]);
					chiTietTKBModel.setTenChuong(chiTiet[10]);
					
					chiTietTKBModelList.add(chiTietTKBModel);
				}
				monHocTKBModel.setChiTietTKBModelList(chiTietTKBModelList);
				monHocTKBList.add(monHocTKBModel);
			}
		}
		thoiKhoaBieuModel.setMonHocTKBModelList(monHocTKBList);
	}
	
	private void themThoiKhoaBieu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageNext = Constant.PATH_RES.getString("qltb.TimThietBiMuon");
		String actionType = request.getParameter("actionType");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);		
		ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();	
		check = false;
		request.setCharacterEncoding("UTF-8");
		 
			if (actionType.equals("ThemMoi")) { // Truong hop : Them "THOI KHOA BIEU"
				if(thoiKhoaBieuModel.validateModel()) { // Validate thanh cong	
					if (!ThoiKhoaBieuDAO.checkThoiKhoaBieuTrung(thoiKhoaBieuModel.getHocKi(), thoiKhoaBieuModel.getMaLop(), thoiKhoaBieuModel.getNam1())) { 					
						if (ThoiKhoaBieuDAO.insertThoiKhoaBieu(thoiKhoaBieuModel)) {
							pageNext += "?msg=ThemMoi";						
							rd = request.getRequestDispatcher(pageNext);						
						}	
					} 
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);
				}
			} 
				if (thoiKhoaBieuModel.validateModel()) { // Validate thanh cong						
					if (ThoiKhoaBieuDAO.updateThoiKhoaBieu(thoiKhoaBieuModel)) {
						LogUtil.logInfo(loggerInfo, tenThanhVien + " câp nhật thời khóa biểu"); // ghi vào file log
						pageNext += "?msg=CapNhat";						
						rd = request.getRequestDispatcher(pageNext);						
					}	
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);					
				}
		
		request.setAttribute(Constant.THOI_KHOA_BIEU_ATT, thoiKhoaBieuModel);		
		rd.forward(request, response);
	}
}
