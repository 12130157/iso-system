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
import vn.edu.hungvuongaptech.dao.ChiTietTKBDAO;
import vn.edu.hungvuongaptech.dao.ChiTietTKBThayDoiDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.MonHocTKBDAO;
import vn.edu.hungvuongaptech.dao.MonHocTKBThayDoiDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.ThoiKhoaBieuDAO;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.ChiTietTKBThayDoiModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.MonHocTKBThayDoiModel;

import vn.edu.hungvuongaptech.model.SysParamsModel;
import vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

/**
 * Servlet implementation class ThemThoiKhoaieuController
 */

public class ThoiKhoaBieuController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	boolean check;
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	private String tenThanhVien = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
	public ThoiKhoaBieuController(){
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
		if(request.getParameter("phanloai") != null) {
			phanLoaiThoiKhoaBieu(request, response);
		} else if(request.getParameter("them") != null) {
			themThoiKhoaBieu(request, response);
		} else if(request.getParameter("duyet") != null) {
			duyetThoiKhoaBieu(request, response);
		} else if(request.getParameter("themChiTiet") != null) {
			themChiTietTKB(request, response);
		} else if(request.getParameter("duyet1TKB") != null) {
			duyetMotThoiKhoaBieu(request, response, request.getParameter("maThoiKhoaBieu")); 
		} else if(request.getParameter("doiGiaoVien") != null) {
			doiGiaoVien(request, response); 
		} else if(request.getParameter("thayDoi") != null) {
			thayDoiThoiKhoaBieu(request, response); 
		}
	}
	private void doiGiaoVien(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String pageNext = "ISO/ThoiKhoaBieu/DoiGiaoVien.jsp";
		String maGiaoVien = request.getParameter("cboGiaoVien");
		String tenGiaoVien = StringUtil.toUTF8(request.getParameter("txtTenGiaoVien"));
		if(MonHocTKBDAO.doiGiaoVien(maGiaoVien, request.getParameter("txtMaMonHocTKB"))) {
			pageNext += "?Doi=ok&maGiaoVien="+maGiaoVien;
		}
		else
			pageNext += "?Doi=fail";
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		request.setAttribute("tenGiaoVien", tenGiaoVien);
		rd.forward(request, response);
	}
	private void duyetMotThoiKhoaBieu(HttpServletRequest request,
			HttpServletResponse response, String maThoiKhoaBieu) throws ServletException, IOException{
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		
		if(request.getParameter("Duyet").equals("Approve")) {
			ThoiKhoaBieuDAO.duyetThoiKhoaBieu(userLoginID, maThoiKhoaBieu, Constant.TINHTRANG_APPROVE, null);
			ThoiKhoaBieuModel thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuSimpleByID(maThoiKhoaBieu);
			// Gui email inform APPROVE cho Truong khoa
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(thoiKhoaBieuModel.getMaNguoiTao()),///////////////
								MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
										MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_THOIKHOABIEU),
											MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_THOIKHOABIEU, 
													"THỜI KHÓA BIỂU " + thoiKhoaBieuModel.getTenThoiKhoaBieu(), 
													thoiKhoaBieuModel.getTenNguoiTao(), 
													thoiKhoaBieuModel.getNgayGui() + " " + thoiKhoaBieuModel.getGioGui(), 
													thoiKhoaBieuModel.getTenNguoiDuyet(), 
													thoiKhoaBieuModel.getNgayDuyet() + " " + thoiKhoaBieuModel.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + " approve thời khóa biểu"); // ghi vào file log
		} else {
			ThoiKhoaBieuDAO.duyetThoiKhoaBieu(userLoginID, maThoiKhoaBieu, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
			ThoiKhoaBieuModel thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuSimpleByID(maThoiKhoaBieu);
			// Gui email inform APPROVE cho Truong khoa
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(thoiKhoaBieuModel.getMaNguoiTao()),///////////////
									MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
										MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_THOIKHOABIEU),
											MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_THOIKHOABIEU, 
													"THỜI KHÓA BIỂU " + thoiKhoaBieuModel.getTenThoiKhoaBieu(), 
													thoiKhoaBieuModel.getTenNguoiTao(), 
													thoiKhoaBieuModel.getNgayGui() + " " + thoiKhoaBieuModel.getGioGui(), 
													thoiKhoaBieuModel.getTenNguoiDuyet(), 
													thoiKhoaBieuModel.getNgayDuyet() + " " + thoiKhoaBieuModel.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + "reject thời khóa biểu"); // ghi vào file log
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemThoiKhoaBieuPath"));
	}

	private void themChiTietTKB(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		MonHocTKBModel monHocTKBModel = new MonHocTKBModel();
		String pageNext = "/ISO/ThoiKhoaBieu/";
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		mapParameterToModelChiTiet(request, response, monHocTKBModel);
		if(request.getParameter("action").equals("Add")) {
			if(MonHocTKBDAO.insertMonHocTKB(monHocTKBModel)) {
				pageNext += "AddThoiKhoaBieu.jsp?AddThanhCong=true";					
				rd = request.getRequestDispatcher(pageNext);
				ThoiKhoaBieuDAO.capNhatThoiKhoaBieu(monHocTKBModel.getMaTKB());
				LogUtil.logInfo(loggerInfo, tenThanhVien + " thêm môn học thời khóa biểu"); // ghi vào file log
			}
			else
			{
				pageNext += "?Error=true";					
				rd = request.getRequestDispatcher(pageNext);
			}
		} else if(request.getParameter("action").equals("Update")) {
			if(MonHocTKBDAO.updateMonHocTKB(monHocTKBModel)) {
				pageNext += "UpdateThoiKhoaBieu.jsp?UpdateThanhCong=true";					
				rd = request.getRequestDispatcher(pageNext);
				ThoiKhoaBieuDAO.capNhatThoiKhoaBieu(monHocTKBModel.getMaTKB());
				LogUtil.logInfo(loggerInfo, tenThanhVien + " cập nhậ môn học thời khóa biểu"); // ghi vào file log
			}
			else
			{
				pageNext += "?Error=true";					
				rd = request.getRequestDispatcher(pageNext);
			}
		} 
		request.setAttribute(Constant.MON_HOC_TKB_ATT, monHocTKBModel);		
		rd.forward(request, response); 
	}
	
	private void mapParameterToModelChiTiet(HttpServletRequest req 
			,HttpServletResponse res
				,MonHocTKBModel monHocTKBModel) {	
		
		if(req.getParameter("txtMaMonHocTKB") != null)
			monHocTKBModel.setMaMonHocTKB(req.getParameter("txtMaMonHocTKB"));
		monHocTKBModel.setMaTKB(req.getParameter("txtMaTKB"));
		monHocTKBModel.setMaGiaoVien(StringUtil.toUTF8(req.getParameter("cboGiaoVien")));
		monHocTKBModel.setTenGiaoVien(StringUtil.toUTF8(req.getParameter("txtTenGiaoVien")));
		monHocTKBModel.setMaMonHoc(req.getParameter("txtMonHoc"));
		monHocTKBModel.setTenMonHoc(StringUtil.toUTF8(req.getParameter("txtTenMonHoc")));
		monHocTKBModel.setSoCaThucHanh(req.getParameter("SoCa")); // so ca thuc hanh
		monHocTKBModel.setUser4(req.getParameter("SoCaLyThuyet")); // so ca ly thuyet
		monHocTKBModel.setSoNoiDung(req.getParameter("txtSoNoiDung"));
		monHocTKBModel.setGhiChu(StringUtil.toUTF8(req.getParameter("areaGhiChu")).trim());
		monHocTKBModel.setTuanBatDauLT(req.getParameter("Tuan_bat_dau_LT"));
		monHocTKBModel.setTuanBatDauTH(req.getParameter("Tuan_bat_dau_TH"));
		monHocTKBModel.setTuanKetThucLT(req.getParameter("Tuan_ket_thuc_LT"));
		monHocTKBModel.setTuanKetThucTH(req.getParameter("Tuan_ket_thuc_TH"));
		monHocTKBModel.setChuoiPhongLT(StringUtil.toUTF8(req.getParameter("ChuoiPhongLT")));
		monHocTKBModel.setChuoiPhongTH(StringUtil.toUTF8(req.getParameter("ChuoiPhongTH")));
		monHocTKBModel.setKieuBienSoan(req.getParameter("KieuBienSoan"));
		monHocTKBModel.setLyThuyetCTMH(req.getParameter("SoTietLyThuyet"));
		monHocTKBModel.setThucHanhCTMH(req.getParameter("SoTietThucHanh"));
		monHocTKBModel.setChuoiThuTrongTuan(StringUtil.toUTF8(req.getParameter("ChuoiThuTrongTuan")));
		monHocTKBModel.setSoTietHoc1Buoi(req.getParameter("txtSoTiet1Buoi"));
		if(req.getParameter("cboPhongLT") != null)
			monHocTKBModel.setUser1(req.getParameter("cboPhongLT"));
		else
			monHocTKBModel.setUser1(null);
		if(req.getParameter("cboPhongTH") != null)
			monHocTKBModel.setUser2(req.getParameter("cboPhongTH"));
		else
			monHocTKBModel.setUser2(null);
		ArrayList<ChiTietTKBModel> chiTietTKBModelList = new ArrayList<ChiTietTKBModel>();
		
		String[] value = new String[2];
		int size1 = 0, size2 = 0, size = 0;
		
		size1 = Integer.parseInt(req.getParameter("MangChiTietLength"));
		size2 = Integer.parseInt(req.getParameter("txtSoBuoi"));
		if(size1 >= size2)
			size = size1;
		else
			size = size2;
		String[] 
			value1 = req.getParameter("ChuoiMaChiTietTKB").split("<->");
		for(Integer i=1;i<=size;i++) {
			ChiTietTKBModel chiTietTKBModel = new ChiTietTKBModel();
			if(i <= size1)
			{
				chiTietTKBModel.setMaChiTietTKB(value1[i-1]);
			}
			if(i<=size2) {	
				value = (req.getParameter("Buoi" + i.toString())).split("-");
				chiTietTKBModel.setMaMonHocTKB(monHocTKBModel.getMaMonHocTKB());
				chiTietTKBModel.setBuoi(StringUtil.toUTF8(value[0]));
				chiTietTKBModel.setsTTNoiDung(value[1]);
				chiTietTKBModel.setCoHieu(value[2]);
				chiTietTKBModel.setHinhThucDay(req.getParameter("HinhThucDay" + i.toString()));
				chiTietTKBModel.setMaThoiKhoaBieu(monHocTKBModel.getMaTKB());
				if(req.getParameter("Nhom" + i.toString()) != null) {
					chiTietTKBModel.setNhom(req.getParameter("Nhom" + i.toString()));
				}
				else {
					chiTietTKBModel.setNhom("1");
				}
				chiTietTKBModel.setThuTrongTuan(req.getParameter("Thu" + i.toString()));
				chiTietTKBModel.setSoThuTu(i.toString());
				chiTietTKBModel.setTuan(req.getParameter("hiddenTuan" + i.toString()));				
				chiTietTKBModel.setMaPhong(req.getParameter("Phong" + i.toString()));
				chiTietTKBModel.setMaNamHoc(req.getParameter("MaNamHoc"));
				chiTietTKBModel.setTenChuong(StringUtil.toUTF8(req.getParameter("hiddenTenChuong" + i.toString())));	
				chiTietTKBModel.setMucTieu(StringUtil.toUTF8(req.getParameter("hiddenMucTieu" + i.toString())));	
				chiTietTKBModel.setTietBatDau(req.getParameter("cboTietBatDau" + i.toString()));
				chiTietTKBModelList.add(chiTietTKBModel);
				
			} else {
				ChiTietTKBDAO.deleteChiTietTKB(chiTietTKBModel.getMaChiTietTKB());
			}
		}
		monHocTKBModel.setChiTietTKBModelList(chiTietTKBModelList);
	}
	private void thayDoiThoiKhoaBieu(HttpServletRequest req 
			,HttpServletResponse res) throws ServletException, IOException{	
		String result1 = "0", result2 = "0", pageNext = "/HungVuongISO/ISO/ThoiKhoaBieu/ThayDoiThoiKhoaBieu.jsp";
		MonHocTKBThayDoiModel monHocTKBThayDoi = new MonHocTKBThayDoiModel();
		if(req.getParameter("txtThayDoiGV").equals("1")) {
			if(req.getParameter("txtMaMonHocTKB") != null)
				monHocTKBThayDoi.setMaMonHocTKB(req.getParameter("txtMaMonHocTKB"));
			monHocTKBThayDoi.setMaGiaoVien(StringUtil.toUTF8(req.getParameter("cboGiaoVien")));
			monHocTKBThayDoi.setMaNguoiTao(req.getSession().getAttribute("maThanhVien").toString());
			if(!req.getParameter("txtMaGVThayDoi").equals("-1")) {
				monHocTKBThayDoi.setId(req.getParameter("txtMaGVThayDoi"));
				if(MonHocTKBThayDoiDAO.updateMonHocTKBThayDoi(monHocTKBThayDoi))
					result1 = "1";
			} else {
				if(MonHocTKBThayDoiDAO.insertMonHocTKBThayDoi(monHocTKBThayDoi))
					result1 = "1";
			}
		}	
		
		String[] value = new String[2];
		
		String[] 
			value1 = req.getParameter("ChuoiMaChiTietTKB").split("<->");
		for(Integer i=1;i<=value1.length;i++) {
			if(req.getParameter("txtDong" + i).equals("1")) {
				ChiTietTKBThayDoiModel chiTietTKBThayDoi = new ChiTietTKBThayDoiModel();
				value = (req.getParameter("Buoi" + i.toString())).split("-");
				chiTietTKBThayDoi.setMaChiTietTKB(value1[i-1]);
				chiTietTKBThayDoi.setBuoi(StringUtil.toUTF8(value[0]));
				chiTietTKBThayDoi.setThuTrongTuan(req.getParameter("Thu" + i.toString()));
				chiTietTKBThayDoi.setTuan(req.getParameter("hiddenTuan" + i.toString()));				
				chiTietTKBThayDoi.setMaPhong(req.getParameter("Phong" + i.toString()));
				chiTietTKBThayDoi.setMaMonHocTKB(req.getParameter("txtMaMonHocTKB"));
				chiTietTKBThayDoi.setMaNguoiTao(req.getSession().getAttribute("maThanhVien").toString());
				
				if(!req.getParameter("txtMaThayDoi" + i).equals("-1")) {
					chiTietTKBThayDoi.setId(req.getParameter("txtMaThayDoi" + i));
					if(ChiTietTKBThayDoiDAO.updateChiTietTKBThayDoi(chiTietTKBThayDoi))
						result2 = "1";
				} else {
					if(ChiTietTKBThayDoiDAO.insertChiTietTKBThayDoi(chiTietTKBThayDoi))
						result2 = "1";
				}
			}
		}
		if(result1.equals("1") && result2.equals("1"))
			pageNext += "?ThayDoiMonHoc=ok&ThayDoiChiTiet=ok";
		else if(result1.equals("1"))
			pageNext += "?ThayDoiMonHoc=ok";
		else if(result2.equals("1"))
			pageNext += "?ThayDoiChiTiet=ok";
		else
			pageNext += "ThayDoiThoiKhoaBieu.jsp?Error=ok";
		res.sendRedirect(pageNext);
	}
	private void themThoiKhoaBieu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageNext = Constant.PATH_RES.getString("iso.ThemThoiKhoaBieuShortPath");
		String actionType = request.getParameter("actionType");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);		
		ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();	
		check = false;
		request.setCharacterEncoding("UTF-8");
		if (request.getSession().getAttribute("ThoiKhoaBieu") != null) { // Truong hop: Cap Nhat
			thoiKhoaBieuModel = (ThoiKhoaBieuModel) request.getSession().getAttribute("ThoiKhoaBieu");
		} 
		mapParameterToModel(request, response, thoiKhoaBieuModel);
		if (request.getParameter("XoaMonHoc") != null
				&& request.getParameter("XoaMonHoc").equals("XoaMonHoc"))  { // Truong hop xoa 1 mon
			if(check == true) {
				pageNext += "?xoa=thanhcong";
				ThoiKhoaBieuDAO.capNhatThoiKhoaBieu(thoiKhoaBieuModel.getMaThoiKhoaBieu());
			}
			rd = request.getRequestDispatcher(pageNext);
		} else if (request.getParameter("GuiHieuTruong") != null
				&& request.getParameter("GuiHieuTruong").equals("GuiHieuTruong")) { // Truong hop Gui Hieu Truong
			if (thoiKhoaBieuModel.validateModel()) {
				thoiKhoaBieuModel.setTinhTrang(Constant.TINHTRANG_SEND);
				SysParamsModel sysParam = SysParamsDAO.getNgayGioHeThong();
				thoiKhoaBieuModel.setNgayGui(sysParam.getNgayHeThong());
				thoiKhoaBieuModel.setGioGui(sysParam.getGioHeThong());
				if (ThoiKhoaBieuDAO.updateThoiKhoaBieu(thoiKhoaBieuModel)) {
					// Gui email inform Hieu Truong
					LogUtil.logInfo(loggerInfo, tenThanhVien + " gửi thời khóa biểu cho ban giám hiệu"); // ghi vào file log
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),
							MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(thoiKhoaBieuModel.getMaNguoiTao()),///////////////
												MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_THOIKHOABIEU),
													MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_THOIKHOABIEU, 
															"THỜI KHÓA BIỂU " + thoiKhoaBieuModel.getTenThoiKhoaBieu(), 
															request.getSession().getAttribute("tenThanhVien").toString(), 
																sysParam.getNgayHeThong() + " " + sysParam.getGioHeThong()));				
					//pageNext = Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoShortPath");
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemThoiKhoaBieuPath"));
					return;
				} 	
			} else { // Validate that bai
				pageNext += "?err='Validate Error'";					
				rd = request.getRequestDispatcher(pageNext);
			}
		//	return;
		} else {  
			if (actionType.equals("ThemMoi")) { // Truong hop : Them "THOI KHOA BIEU"
				if(thoiKhoaBieuModel.validateModel()) { // Validate thanh cong	
					if (!ThoiKhoaBieuDAO.checkThoiKhoaBieuTrung(thoiKhoaBieuModel.getHocKi(), thoiKhoaBieuModel.getMaLop(), thoiKhoaBieuModel.getNam1())) { 					
						if (ThoiKhoaBieuDAO.insertThoiKhoaBieu(thoiKhoaBieuModel)) {
							pageNext += "?msg=ThemMoi";						
							rd = request.getRequestDispatcher(pageNext);						
						}	
					} else { 
						pageNext += "?errTrung='Trung'";						
						rd = request.getRequestDispatcher(pageNext);							
					}
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);
				}
					
			} else if(actionType.equals("Delete")) { // Truong hop: Xoa "THOI KHOA BIEU"	
				if (ThoiKhoaBieuDAO.deleteThoiKhoaBieu(thoiKhoaBieuModel.getMaThoiKhoaBieu())) {
					LogUtil.logInfo(loggerInfo, tenThanhVien + " xóa thời khóa biểu"); // ghi vào file log
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemThoiKhoaBieuPath"));
					return;
				}
			} else if (actionType.equals("CapNhat")) { // Truong hop : Them "THOI KHOA BIEU"
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
			}
		}
		
		request.setAttribute(Constant.THOI_KHOA_BIEU_ATT, thoiKhoaBieuModel);		
		rd.forward(request, response);
	}

	private void duyetThoiKhoaBieu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		for (Integer i = 0; i< Constant.RECORDS_PER_PAGE; i++) {
			if(request.getParameter("tinhtrang" + i.toString()) != null) {
				String choiseValue = request.getParameter("tinhtrang" + i.toString());
				String[] value = choiseValue.split("-");
				if (value[0].equals("Approve")) {
					String maThoiKhoaBieu = value[1];
					ThoiKhoaBieuDAO.duyetThoiKhoaBieu(userLoginID, maThoiKhoaBieu, Constant.TINHTRANG_APPROVE, null);
					
					ThoiKhoaBieuModel thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuSimpleByID(maThoiKhoaBieu);
					// Gui email inform APPROVE cho TrÆ°á»Ÿng Khoa
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(thoiKhoaBieuModel.getMaNguoiTao()),///////////////
											MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
												MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_THOIKHOABIEU),
													MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_THOIKHOABIEU, 
															"THỜI KHÓA BIỂU " + thoiKhoaBieuModel.getTenThoiKhoaBieu(), 
															thoiKhoaBieuModel.getTenNguoiTao(), 
															thoiKhoaBieuModel.getNgayGui() + " " + thoiKhoaBieuModel.getGioGui(), 
															thoiKhoaBieuModel.getTenNguoiDuyet(), 
															thoiKhoaBieuModel.getNgayDuyet() + " " + thoiKhoaBieuModel.getGioDuyet()));
					LogUtil.logInfo(loggerInfo, tenThanhVien + " approve thời khóa biểu"); // ghi vào file log
				}
				else if(value[0].equals("Reject")) {
					String maThoiKhoaBieu = value[1];
					ThoiKhoaBieuDAO.duyetThoiKhoaBieu(userLoginID, maThoiKhoaBieu, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("Ly_do_reject" + i.toString()).trim()));
					
					ThoiKhoaBieuModel thoiKhoaBieuModel = ThoiKhoaBieuDAO.getThoiKhoaBieuSimpleByID(maThoiKhoaBieu);
					// Gui email inform REJECT cho TrÆ°á»Ÿng Khoa
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(thoiKhoaBieuModel.getMaNguoiTao()),///////////////
							MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
								MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_THOIKHOABIEU),
									MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_THOIKHOABIEU, 
											"THỜI KHÓA BIỂU " + thoiKhoaBieuModel.getTenThoiKhoaBieu(), 
											thoiKhoaBieuModel.getTenNguoiTao(), 
											thoiKhoaBieuModel.getNgayGui() + " " + thoiKhoaBieuModel.getGioGui(), 
											thoiKhoaBieuModel.getTenNguoiDuyet(), 
											thoiKhoaBieuModel.getNgayDuyet() + " " + thoiKhoaBieuModel.getGioDuyet()));
					LogUtil.logInfo(loggerInfo, tenThanhVien + " reject thời khóa biểu"); // ghi vào file log
				}
			}
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemThoiKhoaBieuPath"));
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
			monHocTKBModel.setGhiChu(StringUtil.toUTF8(value1[0]));
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
			monHocTKBModel.setSoTietHoc1Buoi(value1[22]);
			monHocTKBModel.setUser4(value1[23]);
			
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
					chiTietTKBModel.setMucTieu(chiTiet[11]);
					chiTietTKBModel.setTietBatDau(chiTiet[12]);
					
					chiTietTKBModelList.add(chiTietTKBModel);
				}
				monHocTKBModel.setChiTietTKBModelList(chiTietTKBModelList);
				monHocTKBList.add(monHocTKBModel);
			}
		}
		thoiKhoaBieuModel.setMonHocTKBModelList(monHocTKBList);
	}
	

	private void phanLoaiThoiKhoaBieu(HttpServletRequest request
			,HttpServletResponse response)throws ServletException, IOException {
		String select = request.getParameter("selectTinhTrang");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemThoiKhoaBieuPath")
				+ "?msg=" + select);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " phân loại thời khóa biểu"); // ghi vào file log
	}

}
