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
import vn.edu.hungvuongaptech.dao.BangPhanCongDAO;
import vn.edu.hungvuongaptech.dao.ChiTietBangPhanCongDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO;
import vn.edu.hungvuongaptech.model.BangPhanCongModel;
import vn.edu.hungvuongaptech.model.ChiTietBangPhanCongModel;
import vn.edu.hungvuongaptech.model.SysParamsModel;
import vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class PhanCongController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	private String tenThanhVien = "";
	public PhanCongController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		tenThanhVien = (String)request.getSession().getAttribute("tenDangNhap");
		if(request.getParameter("phanloai") != null) {
			phanLoaiBangPhanCong(request, response);
		} else if(request.getParameter("xuLy") != null) {
			taoBangPhanCong(request, response);
		} else if(request.getParameter("actionType") != null) {
			duyetBangPhanCong(request, response);
		}  else if(request.getParameter("duyet1BangPhanCong") != null) {
			duyetMotBangPhanCong(request, response, request.getParameter("maBangPhanCong"));
		}
		
	}
	private boolean mapBangPhanCong(HttpServletRequest request,
			HttpServletResponse response, BangPhanCongModel bangPhanCong) throws ServletException, IOException{
		boolean result = true;
		ArrayList<ChiTietBangPhanCongModel> chiTietList = new ArrayList<ChiTietBangPhanCongModel>();
		for(Integer i=1; i<=Integer.parseInt(request.getParameter("txtSoPhanCong"));i++) {
			ChiTietBangPhanCongModel chiTiet = bangPhanCong.getChiTietBangPhanCongList().get(i-1);
			chiTiet.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu" + i.toString()).trim()));
			chiTiet.setNhiemVu(StringUtil.toUTF8(request.getParameter("txtNhiemVu" + i.toString()).trim()));
			chiTiet.setMaGiaoVien(request.getParameter("cboGiaoVien" + i.toString()));
			if(!ChiTietBangPhanCongDAO.updateChiTietBangPhanCong(chiTiet))
				result = false;
			chiTietList.add(chiTiet);
		}
		return result;
	}
	private void taoBangPhanCong(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		BangPhanCongModel bangPhanCong = new BangPhanCongModel();
		String actionType = request.getParameter("actionType");
		String pageNext = Constant.PATH_RES.getString("iso.BangPhanCongShortPath");
		RequestDispatcher rd;
		if(request.getSession().getAttribute("BangPhanCongModel") != null)
			bangPhanCong = (BangPhanCongModel) request.getSession().getAttribute("BangPhanCongModel");
		if (request.getParameter("GuiHieuTruong") != null
				&& request.getParameter("GuiHieuTruong").equals("GuiHieuTruong")) { // Truong hop Gui Hieu Truong
			
			bangPhanCong.setTinhTrang(Constant.TINHTRANG_SEND);
			SysParamsModel sysParam = SysParamsDAO.getNgayGioHeThong();
			bangPhanCong.setNgayGui(sysParam.getNgayHeThong());
			bangPhanCong.setGioGui(sysParam.getGioHeThong());
			BangPhanCongDAO.guiHieuTruongByID(bangPhanCong.getId(), DateUtil.setDate(bangPhanCong.getNgayGui()) + " " + bangPhanCong.getGioGui());
			if (mapBangPhanCong(request, response, bangPhanCong)) {
					// Gui email inform Hieu Truong
					LogUtil.logInfo(loggerInfo, tenThanhVien + " gửi bảng phân công cho ban giám hiệu"); // ghi vào file log
					MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),
							MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(bangPhanCong.getMaNguoiTao()),///////////////
												MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_BANGPHANCONG),
													MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_BANGPHANCONG, 
														bangPhanCong.getTen(), 
															request.getSession().getAttribute("tenThanhVien").toString(), 
																sysParam.getNgayHeThong() + " " + sysParam.getGioHeThong()));				
					//pageNext = Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoShortPath");
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemBangPhanCongPath"));
					return;
			} 			
		} else if(actionType.equals("ThemMoi")) {
			if(request.getParameter("cboNamHoc") != null)
				bangPhanCong.setMaNamHoc(request.getParameter("cboNamHoc"));
			if(request.getParameter("cboHocKi") != null)
				bangPhanCong.setHocKi(request.getParameter("cboHocKi"));
			if(request.getParameter("cboQuyetDinh") != null)
				bangPhanCong.setMaQuyetDinh(request.getParameter("cboQuyetDinh"));
			if(request.getParameter("cboKhoa") != null)
				bangPhanCong.setMaKhoa(request.getParameter("cboKhoa"));
			if(request.getParameter("cboHeDaoTao") != null)
				bangPhanCong.setMaHeDaoTao(request.getParameter("cboHeDaoTao"));
			bangPhanCong.setMaNguoiTao(request.getSession().getAttribute("maThanhVien") + "");
			String kq = BangPhanCongDAO.kiemTraBangPhanCongDaTao(bangPhanCong.getMaNamHoc(), 
					bangPhanCong.getHocKi(), bangPhanCong.getMaKhoa(), bangPhanCong.getMaHeDaoTao(), bangPhanCong.getMaQuyetDinh());
			if(kq.equals("2")) {
				if(BangPhanCongDAO.insertBangPhanCong(bangPhanCong)) {
					response.sendRedirect(Constant.PATH_RES.getString("iso.BangPhanCongPath") + 
							"?maID=" + bangPhanCong.getId() + "&TaoMoiThanhCong=ok");
					return;
				}
				else
					pageNext += "?TaoMoiThatBai=fail";
			} else if(kq.equals("1")){
				pageNext += "?Trung=ok";
			} else if(kq.equals("0"))
				pageNext += "?TonTai=fail";
		} else {
			if(mapBangPhanCong(request, response, bangPhanCong)) {
				pageNext += "?UpdateThanhCong=ok";
			} else {
				pageNext += "?UpdateThatBai=fail";
			}
		}
		rd = request.getRequestDispatcher(pageNext);
		request.setAttribute("BangPhanCong", bangPhanCong);
		rd.forward(request, response);
	}
	private void duyetMotBangPhanCong(HttpServletRequest request,
			HttpServletResponse response, String maBangPhanCong) throws ServletException, IOException{
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		
		if(request.getParameter("Duyet").equals("Approve")) {
			BangPhanCongDAO.duyetBangPhanCong(userLoginID, maBangPhanCong, Constant.TINHTRANG_APPROVE, null);
			BangPhanCongModel bangPhanCong = BangPhanCongDAO.getBangPhanCongSimpleByID(maBangPhanCong);
			// Gui email inform APPROVE cho Truong khoa
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(bangPhanCong.getMaNguoiTao()),///////////////
								MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
										MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_BANGPHANCONG),
											MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_BANGPHANCONG, 
													bangPhanCong.getTen(), 
													bangPhanCong.getTenNguoiTao(), 
													bangPhanCong.getNgayGui() + " " + bangPhanCong.getGioGui(), 
													bangPhanCong.getTenNguoiDuyet(), 
													bangPhanCong.getNgayDuyet() + " " + bangPhanCong.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + " approve bảng phân công"); // ghi vào file log
		} else {
			BangPhanCongDAO.duyetBangPhanCong(userLoginID, maBangPhanCong, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
			BangPhanCongModel bangPhanCong = BangPhanCongDAO.getBangPhanCongSimpleByID(maBangPhanCong);
			// Gui email inform APPROVE cho Truong khoa
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(bangPhanCong.getMaNguoiTao()),///////////////
									MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
										MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_BANGPHANCONG),
											MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_BANGPHANCONG, 
													bangPhanCong.getTen(), 
													bangPhanCong.getTenNguoiTao(), 
													bangPhanCong.getNgayGui() + " " + bangPhanCong.getGioGui(), 
													bangPhanCong.getTenNguoiDuyet(), 
													bangPhanCong.getNgayDuyet() + " " + bangPhanCong.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + "reject bảng phân công"); // ghi vào file log
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemBangPhanCongPath"));
	}
	private void duyetBangPhanCong(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		for (Integer i = 0; i< Constant.RECORDS_PER_PAGE; i++) {
			if(request.getParameter("tinhtrang" + i.toString()) != null) {
				String choiseValue = request.getParameter("tinhtrang" + i.toString());
				String[] value = choiseValue.split("-");
				if (value[0].equals("Approve")) {
					String maBangPhanCong = value[1];
					BangPhanCongDAO.duyetBangPhanCong(userLoginID, maBangPhanCong, Constant.TINHTRANG_APPROVE, null);
					BangPhanCongModel bangPhanCong = BangPhanCongDAO.getBangPhanCongSimpleByID(maBangPhanCong);
					// Gui email inform APPROVE cho Truong khoa
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(bangPhanCong.getMaNguoiTao()),///////////////
										MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
												MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_BANGPHANCONG),
													MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_BANGPHANCONG, 
															bangPhanCong.getTen(), 
															bangPhanCong.getTenNguoiTao(), 
															bangPhanCong.getNgayGui() + " " + bangPhanCong.getGioGui(), 
															bangPhanCong.getTenNguoiDuyet(), 
															bangPhanCong.getNgayDuyet() + " " + bangPhanCong.getGioDuyet()));
					LogUtil.logInfo(loggerInfo, tenThanhVien + " approve bảng phân công"); // ghi vào file log
				}
				else if(value[0].equals("Reject")) {
					String maBangPhanCong = value[1];
					BangPhanCongDAO.duyetBangPhanCong(userLoginID, maBangPhanCong, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("Ly_do_reject" + i.toString()).trim()));
					
					BangPhanCongModel bangPhanCong = BangPhanCongDAO.getBangPhanCongSimpleByID(maBangPhanCong);
					// Gui email inform REJECT cho TrÆ°á»Ÿng Khoa
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(bangPhanCong.getMaNguoiTao()),///////////////
							MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
								MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_BANGPHANCONG),
									MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_BANGPHANCONG, 
											bangPhanCong.getTen(), 
											bangPhanCong.getTenNguoiTao(), 
											bangPhanCong.getNgayGui() + " " + bangPhanCong.getGioGui(), 
											bangPhanCong.getTenNguoiDuyet(), 
											bangPhanCong.getNgayDuyet() + " " + bangPhanCong.getGioDuyet()));
					LogUtil.logInfo(loggerInfo, tenThanhVien + "reject bảng phân công"); // ghi vào file log
				}
			}
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemBangPhanCongPath"));
	}
	private void phanLoaiBangPhanCong(HttpServletRequest request
			,HttpServletResponse response)throws ServletException, IOException {
		String select = request.getParameter("selectTinhTrang");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemBangPhanCongPath")
				+ "?msg=" + select);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " phân loại thời khóa biểu"); // ghi vào file log
	}
}
