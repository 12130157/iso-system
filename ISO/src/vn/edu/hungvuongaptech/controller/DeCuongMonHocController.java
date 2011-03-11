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
import vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO;
import vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.NoiDungDCMHDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.model.DeCuongMonHocModel;
import vn.edu.hungvuongaptech.model.NoiDungDCMHModel;
import vn.edu.hungvuongaptech.model.SysParamsModel;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;
import vn.edu.hungvuongaptech.util.XmlUtil;

public class DeCuongMonHocController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	 private String tenThanhVien = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeCuongMonHocController() {
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
			phanLoaiDeCuongMonHoc(request, response);
		}
		else if(request.getParameter("them") != null) {
			if(request.getParameter("txtXuLyFile").equals("GhiFile"))
				ghiFile(request, response);
			else if(request.getParameter("txtXuLyFile").equals("DocFile"))
				docFile(request, response);
			else
				themDeCuongMonHoc(request, response);
		}
		else if(request.getParameter("duyet") != null) {
			duyetDeCuongMonHoc(request, response);
		} else if(request.getParameter("sosanh") != null) {
			soSanhDeCuongMonHoc(request, response);
		} else if(request.getParameter("duyet1DeCuong") != null) {
			duyetMotDeCuongMonHoc(request, response, request.getParameter("maDeCuong"));
		}
	}

	private void ghiFile(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DeCuongMonHocModel deCuongMonHoc = new DeCuongMonHocModel();
		
		if (request.getSession().getAttribute("DeCuongMonHoc") != null) { // Truong hop: Cap Nhat
			deCuongMonHoc = (DeCuongMonHocModel) request.getSession().getAttribute("DeCuongMonHoc");
		}
		deCuongMonHoc.setLyThuyetCTMH(request.getParameter("txtLyThuyetCTDT"));
		deCuongMonHoc.setThucHanhCTMH(request.getParameter("txtThucHanhCTDT"));
		String pageNext = "";
		if(XmlUtil.xuatFileXMLDeCuongMonHoc(deCuongMonHoc, "DeCuongMonHoc", "ChiTietNguoiTao"))
			pageNext = Constant.PATH_RES.getString("iso.ThemDeCuongMonHocShortPath") + "?maID=" + deCuongMonHoc.getMaDeCuongMonHoc() + "&GhiFile=ok";
		else
			pageNext = Constant.PATH_RES.getString("iso.ThemDeCuongMonHocShortPath") + "?maID=" + deCuongMonHoc.getMaDeCuongMonHoc() + "&GhiFileError=ok";
		response.sendRedirect(pageNext);
	}
	private void docFile(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DeCuongMonHocModel deCuongMonHoc = new DeCuongMonHocModel();
		if (request.getParameter("cboChuongTrinh") != null) {
			deCuongMonHoc.setMaChuongTrinh(request.getParameter("cboChuongTrinh").trim()); }
		if (request.getParameter("txtTenKhoa") != null) {
			deCuongMonHoc.setTenKhoa(StringUtil.toUTF8(request.getParameter("txtTenKhoa").trim())); }
		if (request.getParameter("cboMonHoc") != null) {
			deCuongMonHoc.setMaMonHoc(request.getParameter("cboMonHoc").trim()); }
		if (request.getParameter("txtTenMonHoc") != null) {
			deCuongMonHoc.setTenMonHoc(StringUtil.toUTF8(request.getParameter("txtTenMonHoc").trim())); }
		if (request.getParameter("cboSoBuoi") != null) {
			deCuongMonHoc.setSoBuoiHoc(request.getParameter("cboSoBuoi").trim()); }
		if (request.getParameter("cboSoTiet") != null) {
			deCuongMonHoc.setSoTietHocMotBuoi(request.getParameter("cboSoTiet").trim()); }
		if (request.getParameter("txtLyThuyet") != null) {
			deCuongMonHoc.setLyThuyet(request.getParameter("txtLyThuyet").trim()); }
		if (request.getParameter("txtThucHanh") != null) {
			deCuongMonHoc.setThucHanh(request.getParameter("txtThucHanh").trim()); }
		if (request.getParameter("txtKiemTra") != null) {
			deCuongMonHoc.setKiemTra(request.getParameter("txtKiemTra").trim()); }
		
		String pageNext = "";
		String fileName = StringUtil.toUTF8(request.getParameter("txtFile"));
		if(XmlUtil.getDataFromFileXMLDeCuongMonHoc(fileName, deCuongMonHoc))  {
			
			pageNext = Constant.PATH_RES.getString("iso.ThemDeCuongMonHocShortPath") + "?DocFile=ok";
		} else
			pageNext = Constant.PATH_RES.getString("iso.ThemDeCuongMonHocShortPath") + "?DocFileError=ok";
		request.setAttribute(Constant.DE_CUONG_MON_HOC_ATT, deCuongMonHoc);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}

	private void duyetMotDeCuongMonHoc(HttpServletRequest request,
			HttpServletResponse response, String maDeCuong) throws ServletException, IOException{
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		
		if(request.getParameter("Duyet").equals("Approve")) {
			DeCuongMonHocDAO.duyetDeCuongMonHoc(userLoginID, maDeCuong, Constant.TINHTRANG_APPROVE, null);
			DeCuongMonHocModel deCuongMonHocModel = DeCuongMonHocDAO.getDeCuongMonHocByID(maDeCuong);
			// Gui email inform APPROVE cho Truong bo mon
			ArrayList<String> mailThanhVien = new ArrayList<String>();
			mailThanhVien.add(MailDAO.getMailByMaThanhVien(deCuongMonHocModel.getMaNguoiTao()));
			MailUtil.sendEmailToBoPhan(	mailThanhVien,
									MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(deCuongMonHocModel.getMaNguoiTaoChuongTrinh()),
										MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_DECUONGMONHOC),
											MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_DECUONGMONHOC, 
													deCuongMonHocModel.getTenDeCuongMonHoc(), 
													deCuongMonHocModel.getTenNguoiTao(), 
													deCuongMonHocModel.getNgayGui() + " " + deCuongMonHocModel.getGioGui(), 
													deCuongMonHocModel.getTenNguoiDuyet(), 
													deCuongMonHocModel.getNgayDuyet() + " " + deCuongMonHocModel.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + " approve đề cương môn học"); // ghi vào file log
		} else {
			DeCuongMonHocDAO.duyetDeCuongMonHoc(userLoginID, maDeCuong, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
			DeCuongMonHocModel deCuongMonHocModel = DeCuongMonHocDAO.getDeCuongMonHocByID(maDeCuong);
			// Gui email inform APPROVE cho Truong bo mon
			ArrayList<String> mailThanhVien = new ArrayList<String>();
			mailThanhVien.add(MailDAO.getMailByMaThanhVien(deCuongMonHocModel.getMaNguoiTao()));
			MailUtil.sendEmailToBoPhan(	mailThanhVien,
									MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(deCuongMonHocModel.getMaNguoiTaoChuongTrinh()),
										MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_DECUONGMONHOC),
											MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_DECUONGMONHOC, 
													deCuongMonHocModel.getTenDeCuongMonHoc(), 
													deCuongMonHocModel.getTenNguoiTao(), 
													deCuongMonHocModel.getNgayGui() + " " + deCuongMonHocModel.getGioGui(), 
													deCuongMonHocModel.getTenNguoiDuyet(), 
													deCuongMonHocModel.getNgayDuyet() + " " + deCuongMonHocModel.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + " reject đề cương môn học"); // ghi vào file log
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemDeCuongMonHocPath"));
	}

	private void soSanhDeCuongMonHoc(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		String idSoSanh = request.getParameter("SoSanh");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.SoSanhDeCuongMonHocPath")
				+ "?SoSanhDeCuong=" + idSoSanh);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " so sánh đề cương môn học"); // ghi vào file log
	}

	private void duyetDeCuongMonHoc(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		for (Integer i = 0; i< Constant.RECORDS_PER_PAGE; i++) {
			if(request.getParameter("tinhtrang" + i.toString()) != null) {
				String a = request.getParameter("status" + i.toString());
				String choiseValue = request.getParameter("tinhtrang" + i.toString());
				String[] value = choiseValue.split("-");
				if (value[0].equals("Approve")) {
					if(!(a.equals(Constant.TINHTRANG_APPROVE))) {
						String maDeCuongMonHoc = value[1];
						DeCuongMonHocDAO.duyetDeCuongMonHoc(userLoginID, maDeCuongMonHoc, Constant.TINHTRANG_APPROVE, null);
						LogUtil.logInfo(loggerInfo, tenThanhVien + " approve đề cương môn học"); // ghi vào file log
						DeCuongMonHocModel deCuongMonHocModel = DeCuongMonHocDAO.getDeCuongMonHocByID(maDeCuongMonHoc);
						// Gui email inform APPROVE cho Truong Bo Mon
						ArrayList<String> mailThanhVien = new ArrayList<String>();
						mailThanhVien.add(MailDAO.getMailByMaThanhVien(deCuongMonHocModel.getMaNguoiTao()));
						MailUtil.sendEmailToBoPhan(	mailThanhVien,
								MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(deCuongMonHocModel.getMaNguoiTaoChuongTrinh()),
													MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_DECUONGMONHOC),
														MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_DECUONGMONHOC, 
																deCuongMonHocModel.getTenDeCuongMonHoc(), 
																deCuongMonHocModel.getTenNguoiTao(), 
																deCuongMonHocModel.getNgayGui() + " " + deCuongMonHocModel.getGioGui(), 
																deCuongMonHocModel.getTenNguoiDuyet(), 
																deCuongMonHocModel.getNgayDuyet() + " " + deCuongMonHocModel.getGioDuyet()));
					}
				}
				else if(value[0].equals("Reject")) {
					if(!(a.equals(Constant.TINHTRANG_REJECT))) {
						String maDeCuongMonHoc = value[1];
						DeCuongMonHocDAO.duyetDeCuongMonHoc(userLoginID, maDeCuongMonHoc, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("Ly_do_reject" + i.toString()).trim()));
						LogUtil.logInfo(loggerInfo, tenThanhVien + " reject đề cương môn học"); // ghi vào file log
						DeCuongMonHocModel deCuongMonHocModel = DeCuongMonHocDAO.getDeCuongMonHocByID(maDeCuongMonHoc);
						// Gui email inform REJECT cho Truong Bo Mon
						ArrayList<String> mailThanhVien = new ArrayList<String>();
						mailThanhVien.add(MailDAO.getMailByMaThanhVien(deCuongMonHocModel.getMaNguoiTao()));
						MailUtil.sendEmailToBoPhan(	mailThanhVien,
								MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(deCuongMonHocModel.getMaNguoiTaoChuongTrinh()),
													MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_DECUONGMONHOC),
														MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_DECUONGMONHOC, 
																deCuongMonHocModel.getTenDeCuongMonHoc(), 
																deCuongMonHocModel.getTenNguoiTao(), 
																deCuongMonHocModel.getNgayGui() + " " + deCuongMonHocModel.getGioGui(), 
																deCuongMonHocModel.getTenNguoiDuyet(), 
																deCuongMonHocModel.getNgayDuyet() + " " + deCuongMonHocModel.getGioDuyet()));
					}
				}
			}
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemDeCuongMonHocPath"));
	}

	private void themDeCuongMonHoc(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		String pageNext = Constant.PATH_RES.getString("iso.ThemDeCuongMonHocShortPath");
		String actionType = request.getParameter("actionType");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);		
		DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();		
		request.setCharacterEncoding("UTF-8");
		if (request.getSession().getAttribute("DeCuongMonHoc") != null) { // Truong hop: Cap Nhat
			deCuongMonHocModel = (DeCuongMonHocModel) request.getSession().getAttribute("DeCuongMonHoc");
		}
		mapParameterToModel(request, response, deCuongMonHocModel);
				
		if (request.getParameter("GuiTruongKhoa") != null
				&& request.getParameter("GuiTruongKhoa").equals("GuiTruongKhoa")) { // Truong hop Gui Hieu Truong
			if (deCuongMonHocModel.validateModel()) { 
				deCuongMonHocModel.setTinhTrang(Constant.TINHTRANG_SEND);
				SysParamsModel sysParam = SysParamsDAO.getNgayGioHeThong();
				deCuongMonHocModel.setNgayGui(sysParam.getNgayHeThong());
				deCuongMonHocModel.setGioGui(sysParam.getGioHeThong());
				if (DeCuongMonHocDAO.updateDeCuongMonHoc(deCuongMonHocModel)) {
					// Gui email inform Truong khoa
					LogUtil.logInfo(loggerInfo, tenThanhVien + " gửi đề cương môn học cho Ban Giám Hiệu"); // ghi vào file log
					ArrayList<String> mailThanhVien = new ArrayList<String>();
					mailThanhVien.add(MailDAO.getMailByMaThanhVien(deCuongMonHocModel.getMaNguoiTao()));
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(deCuongMonHocModel.getMaNguoiTaoChuongTrinh()),
										mailThanhVien,
												MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_DECUONGMONHOC),
													MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_DECUONGMONHOC, 
															deCuongMonHocModel.getTenDeCuongMonHoc(), 
															request.getSession().getAttribute("tenThanhVien").toString(), 
																sysParam.getNgayHeThong() + " " + sysParam.getGioHeThong()));				
					Constant.NUM_ROWS = 1;
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemDeCuongMonHocPath"));
					
				}
				return;
			} else {
				pageNext += "?err='Validate Error'";					
				rd = request.getRequestDispatcher(pageNext);
			}
			//return;
		} else if (request.getParameter("Copy") != null
				&& request.getParameter("Copy").equals("Copy")) {
			deCuongMonHocModel.setMaDeCuongMonHoc(null);
			deCuongMonHocModel.setTinhTrang(null);
			deCuongMonHocModel.setNgayCapNhatCuoi(null);
			deCuongMonHocModel.setMaNguoiDuyet(null);
			deCuongMonHocModel.setNgayDuyet(null);
			deCuongMonHocModel.setNgayTao(null);
			deCuongMonHocModel.setTenNguoiTao(null);
			deCuongMonHocModel.setTenNguoiDuyet(null);
			for(int i=0;i<deCuongMonHocModel.getNoiDungDCMHModelsList().size();i++)
			{
				deCuongMonHocModel.getNoiDungDCMHModelsList().get(i).setMaDeCuong(null);
				deCuongMonHocModel.getNoiDungDCMHModelsList().get(i).setMaNoiDungDeCuong(null);	
				deCuongMonHocModel.getNoiDungDCMHModelsList().get(i).setNgayCapNhatCuoi(null);
			}
		}else {  
			if (actionType.equals("ThemMoi")) { // Truong hop : Them "DE CUONG MON HOC"
				if (deCuongMonHocModel.validateModel()) { // Validate thanh cong					
					if(!DeCuongMonHocDAO.checkMonHocAndChuongTrinh(deCuongMonHocModel.getMaChuongTrinh(), deCuongMonHocModel.getMaMonHoc())) {
						if (DeCuongMonHocDAO.insertDeCuongMonHoc(deCuongMonHocModel)) {
							LogUtil.logInfo(loggerInfo, tenThanhVien + " tạo mới đề cương môn học"); // ghi vào file log
							deCuongMonHocModel.setStatus(ChuongTrinhDaoTaoDAO.getTinhTrangChuongTrinh(deCuongMonHocModel.getMaChuongTrinh()));
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
			} else if(actionType.equals("CapNhat")) { // Truong hop: Cap nhat "DE CUONG MON HOC"
				if (deCuongMonHocModel.validateModel()) { // Validate thanh cong
					deCuongMonHocModel.setTinhTrang(Constant.TINHTRANG_NEW);
					if (DeCuongMonHocDAO.updateDeCuongMonHoc(deCuongMonHocModel)) {
						LogUtil.logInfo(loggerInfo, tenThanhVien + " cập nhật đề cương môn học"); // ghi vào file log
						pageNext += "?msg=CapNhat";						
						rd = request.getRequestDispatcher(pageNext);
					}	
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);
				}
			}
		}
		
		request.setAttribute(Constant.DE_CUONG_MON_HOC_ATT, deCuongMonHocModel);		
		rd.forward(request, response);
	
	}

	private void mapParameterToModel(HttpServletRequest req,
			HttpServletResponse response, DeCuongMonHocModel deCuongMonHocModel) {
		// TODO Auto-generated method stub
		deCuongMonHocModel.setMaNguoiTao(req.getSession().getAttribute("maThanhVien").toString());	
		if (req.getParameter("cboChuongTrinh") != null) {
			deCuongMonHocModel.setMaChuongTrinh(req.getParameter("cboChuongTrinh").trim()); }
		if (req.getParameter("txtTenKhoa") != null) {
			deCuongMonHocModel.setTenKhoa(StringUtil.toUTF8(req.getParameter("txtTenKhoa").trim())); }
		if (req.getParameter("cboMonHoc") != null) {
			deCuongMonHocModel.setMaMonHoc(req.getParameter("cboMonHoc").trim()); }
		if (req.getParameter("txtTenMonHoc") != null) {
			deCuongMonHocModel.setTenMonHoc(StringUtil.toUTF8(req.getParameter("txtTenMonHoc").trim())); }
		if (req.getParameter("cboSoBuoi") != null) {
			deCuongMonHocModel.setSoBuoiHoc(req.getParameter("cboSoBuoi").trim()); }
		if (req.getParameter("cboSoTiet") != null) {
			deCuongMonHocModel.setSoTietHocMotBuoi(req.getParameter("cboSoTiet").trim()); }
		if (req.getParameter("txtLyThuyet") != null) {
			deCuongMonHocModel.setLyThuyet(req.getParameter("txtLyThuyet").trim()); }
		if (req.getParameter("txtThucHanh") != null) {
			deCuongMonHocModel.setThucHanh(req.getParameter("txtThucHanh").trim()); }
		if (req.getParameter("txtKiemTra") != null) {
			deCuongMonHocModel.setKiemTra(req.getParameter("txtKiemTra").trim()); }
		if (req.getParameter("areaViTriMonHoc") != null) {			
			deCuongMonHocModel.setViTriMonHoc(StringUtil.toUTF8(req.getParameter("areaViTriMonHoc").trim())); }
		if (req.getParameter("areaTinhChatMonHoc") != null) {			
			deCuongMonHocModel.setTinhChatMonHoc(StringUtil.toUTF8(req.getParameter("areaTinhChatMonHoc").trim())); }
		if (req.getParameter("areaMucTieu1") != null) {			
			deCuongMonHocModel.setMucTieu1(StringUtil.toUTF8(req.getParameter("areaMucTieu1").trim())); }
		if (req.getParameter("areaMucTieu2") != null) {			
			deCuongMonHocModel.setMucTieu2(StringUtil.toUTF8(req.getParameter("areaMucTieu2").trim())); }
		if (req.getParameter("areaMucTieu3") != null) {			
			deCuongMonHocModel.setMucTieu3(StringUtil.toUTF8(req.getParameter("areaMucTieu3").trim())); }
		if (req.getParameter("areaMucTieu4") != null) {			
			deCuongMonHocModel.setMucTieu4(StringUtil.toUTF8(req.getParameter("areaMucTieu4").trim())); }
		if (req.getParameter("areaDieuKien1") != null) {			
			deCuongMonHocModel.setDieuKien1(StringUtil.toUTF8(req.getParameter("areaDieuKien1").trim())); }
		if (req.getParameter("areaDieuKien2") != null) {			
			deCuongMonHocModel.setDieuKien2(StringUtil.toUTF8(req.getParameter("areaDieuKien2").trim())); }
		if (req.getParameter("areaDieuKien3") != null) {			
			deCuongMonHocModel.setDieuKien3(StringUtil.toUTF8(req.getParameter("areaDieuKien3").trim())); }
		if (req.getParameter("areaDieuKien4") != null) {			
			deCuongMonHocModel.setDieuKien4(StringUtil.toUTF8(req.getParameter("areaDieuKien4").trim())); }
		if (req.getParameter("areaPhuongPhap1") != null) {			
			deCuongMonHocModel.setPhuongPhap1(StringUtil.toUTF8(req.getParameter("areaPhuongPhap1").trim())); }
		if (req.getParameter("areaPhuongPhap2") != null) {			
			deCuongMonHocModel.setPhuongPhap2(StringUtil.toUTF8(req.getParameter("areaPhuongPhap2").trim())); }
		if (req.getParameter("areaPhuongPhap3") != null) {			
			deCuongMonHocModel.setPhuongPhap3(StringUtil.toUTF8(req.getParameter("areaPhuongPhap3").trim())); }
		deCuongMonHocModel.setNgayGui("");
		int count = 0, soDongDaCo = 0, soDong = 0, truongHop = 0, count1 = 0, count2 = 0, count3 = 0;
		if(req.getParameter("Kieu") == null || req.getParameter("Kieu").equals("LT/TH")) {
			deCuongMonHocModel.setKieuBienSoan("0");
			truongHop = 2;
		} else if(req.getParameter("Kieu").equals("LT+TH")){
			deCuongMonHocModel.setKieuBienSoan("1");
			truongHop = 1;
		} else {
			deCuongMonHocModel.setKieuBienSoan("2");
			truongHop = 3;
		}
		Integer soBuoi = 1, soThuTu = 1;
		if(req.getParameter("actionType").equals("CapNhat")) {
			soDongDaCo = deCuongMonHocModel.getNoiDungDCMHModelsList().size();
		}
		if(deCuongMonHocModel.getMaChuongTrinh() != "" && deCuongMonHocModel.getMaMonHoc() != "") {
			soDong = (Integer.parseInt(deCuongMonHocModel.getLyThuyet()) + Integer.parseInt(deCuongMonHocModel.getThucHanh()) + Integer.parseInt(deCuongMonHocModel.getKiemTra())) /Integer.parseInt(deCuongMonHocModel.getSoTietHocMotBuoi());
			if(truongHop == 1 && Integer.parseInt(deCuongMonHocModel.getLyThuyet()) > 0)
				count1 = (Integer.parseInt(deCuongMonHocModel.getThucHanh()) + Integer.parseInt(deCuongMonHocModel.getKiemTra()))/Integer.parseInt(deCuongMonHocModel.getLyThuyet());
			count2 = Integer.parseInt(deCuongMonHocModel.getLyThuyet())/Integer.parseInt(deCuongMonHocModel.getSoTietHocMotBuoi());
			count3 = Integer.parseInt(deCuongMonHocModel.getKiemTra())/Integer.parseInt(deCuongMonHocModel.getSoTietHocMotBuoi());
			
			/*if((Integer.parseInt(deCuongMonHocModel.getThucHanh()) + Integer.parseInt(deCuongMonHocModel.getKiemTra())) % Integer.parseInt(deCuongMonHocModel.getLyThuyet()) == 0) {
				if(deCuongMonHocModel.getKieuBienSoan().equals("1")) {
					truongHop = 1;//chia theo tỉ lệ
				} else
					truongHop = 2;//không theo tỉ lệ
			} else {
				truongHop = 3;//không có tỉ lệ
			}*/
		}
		if(soDongDaCo >= soDong) {
			count = soDongDaCo;
		} else {
			count = soDong;
		}
		ArrayList<NoiDungDCMHModel> noiDungDCMHModelList = new ArrayList<NoiDungDCMHModel>();
		
		for(int i=1;i<=count;i++) {
			NoiDungDCMHModel noiDungDCMHModel = new NoiDungDCMHModel(); 
			if (deCuongMonHocModel.getNoiDungDCMHModelsList() != null
					&& i <= deCuongMonHocModel.getNoiDungDCMHModelsList().size()) {
				noiDungDCMHModel = deCuongMonHocModel.getNoiDungDCMHModelsList().get(i-1);
			}
			if(i <= soDong) {
				noiDungDCMHModel.setSoBuoi(soBuoi.toString());
				noiDungDCMHModel.setSoThuTu(soThuTu.toString());
				noiDungDCMHModel.setSoTiet(deCuongMonHocModel.getSoTietHocMotBuoi());	
				noiDungDCMHModel.setMucTieu(StringUtil.toUTF8(req.getParameter("txtMucTieu_" + soBuoi.toString()).trim()));
				if(truongHop == 1) {
					if(soThuTu == 1) {
						noiDungDCMHModel.setCoHieu("0");
						if (req.getParameter("areaTenChuong_" + soBuoi.toString()) != null) {
							noiDungDCMHModel.setTenChuong(StringUtil.toUTF8(req.getParameter("areaTenChuong_" + soBuoi.toString()).trim()));
						}
					} else {
						if(count3 > count - i) {
							noiDungDCMHModel.setCoHieu("4");
						} else {
							noiDungDCMHModel.setCoHieu("1");
						}
					}
					soThuTu++;
					if(i % (count1 + 1) == 0) {
						soBuoi++;
						soThuTu = 1;
					}
				} else {
					if(truongHop == 2) {
						noiDungDCMHModel.setCoHieu(req.getParameter("KieuDay" + i));
						/*if(count2 >= i) {
							noiDungDCMHModel.setCoHieu("0");
						}
						else if(count3 > count - i) {
							noiDungDCMHModel.setCoHieu("4");
						} else {
							noiDungDCMHModel.setCoHieu("1");
						}*/
					}
					else {
						if(count3 > count - i) {
							noiDungDCMHModel.setCoHieu("4");
						} else
							noiDungDCMHModel.setCoHieu("5");
					}
					noiDungDCMHModel.setTenChuong(StringUtil.toUTF8(req.getParameter("areaTenChuong_" + soBuoi.toString()).trim()));
					soBuoi++;
				} 
				noiDungDCMHModelList.add(noiDungDCMHModel);
			} else {
				String id = noiDungDCMHModel.getMaNoiDungDeCuong();
				NoiDungDCMHDAO.deleteNoiDungDCMH(id);
			}	
		}
		deCuongMonHocModel.setNoiDungDCMHModelsList(noiDungDCMHModelList);
	}

	private void phanLoaiDeCuongMonHoc(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		String select = request.getParameter("selectTinhTrang");
		
		String tenMonHoc = StringUtil.toUTF8(request.getParameter("txtTenMonHoc"));
		request.setAttribute("tenMonHocTimKiem", tenMonHoc);
		String page = Constant.PATH_RES
				.getString("iso.XemDeCuongMonHocShortPath")
				+ "?msg=" + select;
		if(request.getParameter("cboKhoa") != null) {
			String khoa = request.getParameter("cboKhoa");
			page += Constant.PATH_RES
			.getString("iso.XemDeCuongMonHocShortPath")
			+ "&khoa=" + khoa;
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " phân loại đề cương môn học"); // ghi vào file log
	}
}
