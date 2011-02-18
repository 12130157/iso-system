package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.MoChuyenNganhDAO;
import vn.edu.hungvuongaptech.dao.QuyetDinhDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.model.MoChuyenNganhModel;
import vn.edu.hungvuongaptech.model.QuyetDinhModel;
import vn.edu.hungvuongaptech.taglib.ChangeStringTaglib;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class QuyetDinhController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public QuyetDinhController() {
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("phanloai") != null)
		{
			phanLoaiQuyetDinh(request, response);
		}
		else if(request.getParameter("them") != null)
		{
			themQuyetDinh(request, response);
		}
		else if(request.getParameter("duyet") != null)
		{
			duyetQuyetDinh(request, response);
		}
		else if(request.getParameter("sosanh") != null) {
			soSanhQuyetDinhDaoTao(request, response);
		} 
		else if(request.getParameter("duyet1quyetdinh") != null) {
			duyet1QuyetDinh(request, response, request.getParameter("maQuyetDinh"));
		}
	}
	
	private Integer mapParameterToModel(HttpServletRequest req 
			,HttpServletResponse res
				,QuyetDinhModel quyetDinhModel) {
		Integer countRowSelect = 0;
		quyetDinhModel.setMaNguoiLap(req.getSession().getAttribute("maThanhVien").toString());		
		if (req.getParameter("txtKihieu") != null) {
			quyetDinhModel.setKiHieu(StringUtil.toUTF8(req.getParameter("txtKihieu").trim())); }
		if (req.getParameter("txtKhoa") != null) {
			quyetDinhModel.setMaKhoa(req.getParameter("txtKhoa").trim()); }
		if (req.getParameter("txtDate") != null) {
			quyetDinhModel.setNgayRaQuyetDinh(req.getParameter("txtDate").trim()); }
		if (req.getParameter("cboHeDaoTao") != null) {
			quyetDinhModel.setMaHeDaoTao(req.getParameter("cboHeDaoTao").trim()); }
		if (req.getParameter("txtNamBatDauNK") != null) {
			quyetDinhModel.setNamBatDau(req.getParameter("txtNamBatDauNK").trim()); }
		if (req.getParameter("cboKHDT") != null) {
			quyetDinhModel.setMaKHDT(req.getParameter("cboKHDT").trim()); }
		if (req.getParameter("txtQuyetDinhSo") != null) {
			quyetDinhModel.setQuyetDinhSo(StringUtil.toUTF8(req.getParameter("txtQuyetDinhSo").trim())); }
		if (req.getParameter("txtNgayRaQD") != null) {
			quyetDinhModel.setNgayRaQuyetDinh(req.getParameter("txtNgayRaQD").trim()); }
		if (req.getParameter("txtSoHocSinh") != null) {
			quyetDinhModel.setTongSoHocSinh(req.getParameter("txtSoHocSinh").trim()); }
		if (req.getParameter("txtSoChuyenNganh") != null) {
			quyetDinhModel.setTongSoChuyenNganh(req.getParameter("txtSoChuyenNganh").trim()); }
		if (req.getParameter("cboTuThang") != null) {
			quyetDinhModel.setTuThang(req.getParameter("cboTuThang").trim()); }
		if (req.getParameter("cboDenThang") != null) {
			quyetDinhModel.setDenThang(req.getParameter("cboDenThang").trim()); }
		if (req.getParameter("txtNoiNhan") != null) {
			quyetDinhModel.setNoiNhan(StringUtil.toUTF8(req.getParameter("txtNoiNhan").trim())); }
		
		ArrayList<MoChuyenNganhModel> moChuyenNganhList = new ArrayList<MoChuyenNganhModel>();
		for (Integer i = 1; i<= Constant.NUM_ROWS; i++) {
			MoChuyenNganhModel obj = new MoChuyenNganhModel();
			if (quyetDinhModel.getMoChuyenNganhList() != null
					&& i <= quyetDinhModel.getMoChuyenNganhList().size()) {
				obj = quyetDinhModel.getMoChuyenNganhList().get(i-1);
			}
			if (req.getParameter("cboChuyenNganh" + i.toString()) != null) {
				obj.setMaChuyenNganh(req.getParameter("cboChuyenNganh" + i.toString().trim())); }
			if (req.getParameter("txtGhiChu" + i.toString()) != null) {
				obj.setGhiChu(req.getParameter("txtGhiChu" + i.toString().trim()));}
			if (req.getParameter("chkRow" + i.toString()) != null 
					&& req.getParameter("XuLyDong").equals("XoaDong")) { 
			// Row nay dang bi chon de DELETE ==> ko dua vao Object Model
				countRowSelect++; 
				String maChuyenNganh = obj.getId();
				MoChuyenNganhDAO.deleteMoChuyenNganh(maChuyenNganh);
				req.setAttribute("msgDeleteRow", "XoaDong");
			} else { 
				moChuyenNganhList.add(obj);
			}						
		}
		quyetDinhModel.setMoChuyenNganhList(moChuyenNganhList);		
		
		return countRowSelect;
	}
	
	private void duyet1QuyetDinh(HttpServletRequest request,
			HttpServletResponse response, String maQuyetDinh)throws ServletException, IOException {
		
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		
		if(request.getParameter("Duyet").equals("Approve")) {
			QuyetDinhDAO.duyetQuyetDinh(userLoginID, maQuyetDinh, Constant.TINHTRANG_APPROVE, null);
			QuyetDinhModel quyetDinhModel = QuyetDinhDAO.getQuyetDinhByMaQuyetDinh(maQuyetDinh);
			MoChuyenNganhDAO.insertLopHocByMaQuyetDinhWithMoChuyeNganh(maQuyetDinh, quyetDinhModel.getMaKhoa());
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC),//////////////////
					MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
						MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO),
							MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO, 
									quyetDinhModel.getTenQuyetDinh(), 
										quyetDinhModel.getTenNguoiLap(), 
											SysParamsDAO.getSysParams().getGioHeThong(), 
												quyetDinhModel.getTenNguoiDuyet(), 
													quyetDinhModel.getNgayDuyet() + " : " + quyetDinhModel.getGioDuyet()));
		} else {
			QuyetDinhDAO.duyetQuyetDinh(userLoginID, maQuyetDinh, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("LyDoReject")));
			QuyetDinhModel quyetDinhModel = QuyetDinhDAO.getQuyetDinhByMaQuyetDinh(maQuyetDinh);
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC),//////////////////
					MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
										MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO),
											MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO, 
													quyetDinhModel.getTenQuyetDinh(), 
														quyetDinhModel.getTenNguoiLap(), 
															SysParamsDAO.getSysParams().getGioHeThong(), 
																quyetDinhModel.getTenNguoiDuyet(),
																	quyetDinhModel.getNgayDuyet()  + " : " + quyetDinhModel.getGioDuyet()));
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemQuyetDinhDaoTaoPath"));
	}
	
	private void duyetQuyetDinh(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		for (Integer i = 0; i< Constant.RECORDS_PER_PAGE; i++) {
			if(request.getParameter("tinhtrang" + i.toString()) != null) {
				String choiseValue = request.getParameter("tinhtrang" + i.toString());
				String[] value = choiseValue.split("-");
				if (value[0].equals("Approve")) {
					String maQuyetDinh = value[1];
					QuyetDinhDAO.duyetQuyetDinh(userLoginID, maQuyetDinh, Constant.TINHTRANG_APPROVE, null);
					QuyetDinhModel quyetDinhModel = QuyetDinhDAO.getQuyetDinhByMaQuyetDinh(maQuyetDinh);
					MoChuyenNganhDAO.insertLopHocByMaQuyetDinhWithMoChuyeNganh(maQuyetDinh, quyetDinhModel.getMaKhoa());
					// Gui email inform APPROVE cho Phong Ke Hoach
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC),//////////////////
							MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
												MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO),
													MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO, 
															quyetDinhModel.getTenQuyetDinh(), 
																quyetDinhModel.getTenNguoiLap(), 
																	SysParamsDAO.getSysParams().getGioHeThong(), 
																		quyetDinhModel.getTenNguoiDuyet(), 
																			quyetDinhModel.getNgayDuyet()  + " : " + quyetDinhModel.getGioDuyet()));														
				}
				else if(value[0].equals("Reject")) {
					String maQuyetDinh = value[1];
					QuyetDinhDAO.duyetQuyetDinh(userLoginID, maQuyetDinh, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("Ly_do_reject" + i.toString())));
					QuyetDinhModel quyetDinhModel = QuyetDinhDAO.getQuyetDinhByMaQuyetDinh(maQuyetDinh);
					// Gui email inform REJECT cho Phong Ke Hoach
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC),//////////////////
							MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
												MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO),
													MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO, 
															quyetDinhModel.getTenQuyetDinh(), 
																quyetDinhModel.getTenNguoiLap(), 
																	SysParamsDAO.getSysParams().getGioHeThong(), 
																		quyetDinhModel.getTenNguoiDuyet(),
																			quyetDinhModel.getNgayDuyet()  + " : " + quyetDinhModel.getGioDuyet()));
				}
			}
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemQuyetDinhDaoTaoPath"));
	}
	
	private void phanLoaiQuyetDinh(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String select = request.getParameter("selectTinhTrang");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemQuyetDinhDaoTaoPath")
				+ "?msg=" + select);
	}
	
	private void soSanhQuyetDinhDaoTao(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idSoSanh = request.getParameter("SoSanh");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.SoSanhQuyetDinhDaoTaoPath")
				+ "?SoSanhQuyetDinh=" + idSoSanh);
	}
	
	private void themQuyetDinh(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("iso.NewQuyetDinhDaoTaoShortPath");
		String actionType = request.getParameter("actionType");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		QuyetDinhModel quyetDinhModel = new QuyetDinhModel();
		request.setCharacterEncoding("UTF-8");
		if (request.getSession().getAttribute("objQuyetDinh") != null) { // Truong hop: Cap Nhat
			quyetDinhModel = (QuyetDinhModel) request.getSession().getAttribute("objQuyetDinh");
		}
		Integer countRowSelected = mapParameterToModel(request, response, quyetDinhModel);
		if (request.getParameter("XuLyDong") != null
				&& request.getParameter("XuLyDong").equals("ThemDong"))  { // Truong hop Add New Row
			Constant.NUM_ROWS++;
			pageNext += "?maQuyetDinh=ThemDong";
			rd = request.getRequestDispatcher(pageNext);		
		} else if (request.getParameter("XuLyDong") != null
				&& request.getParameter("XuLyDong").equals("XoaDong")) { // Truong hop Delete Row
			if (Constant.NUM_ROWS >= 1) {
				Constant.NUM_ROWS -= countRowSelected; 
			}
		} else if (request.getParameter("GuiHieuTruong") != null
				&& request.getParameter("GuiHieuTruong").equals("GuiHieuTruong")) { // Truong hop Gui Hieu Truong
			if (quyetDinhModel.validateModel()) {
				quyetDinhModel.setTinhTrang(Constant.TINHTRANG_SEND);
				if (QuyetDinhDAO.updateQuyetDinh(quyetDinhModel)) {
					
					// Gui email inform Hieu Truong
					MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
							MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC),////////////
												MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO),
													MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_QUYETDINHDAOTAO, 
														ChangeStringTaglib.upperString(quyetDinhModel.getTenQuyetDinh()), 
															request.getSession().getAttribute("tenThanhVien").toString(), 
																SysParamsDAO.getSysParams().getGioHeThong()));				
					Constant.NUM_ROWS = 1;
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemQuyetDinhDaoTaoPath"));
					return;
				} 	
			} else { // Validate that bai
				pageNext += "?err='Validate Error'";					
				rd = request.getRequestDispatcher(pageNext);
			}
		} else if (request.getParameter("Copy") != null
				&& request.getParameter("Copy").equals("Copy")) {
			quyetDinhModel.setMaQuyetDinh(null);
			quyetDinhModel.setTinhTrang(null);
			quyetDinhModel.setNgayCapNhatCuoi(null);
			quyetDinhModel.setMaNguoiDuyet(null);
			quyetDinhModel.setNgayDuyet(null);
			quyetDinhModel.setNgayLap(null);
			quyetDinhModel.setTenNguoiLap(null);
			quyetDinhModel.setTenNguoiDuyet(null);
			for(int i=0;i<quyetDinhModel.getMoChuyenNganhList().size();i++)
			{
				quyetDinhModel.getMoChuyenNganhList().get(i).setId(null);	
				quyetDinhModel.getMoChuyenNganhList().get(i).setNgayCapNhatCuoi(null);
				quyetDinhModel.getMoChuyenNganhList().get(i).setMaQuyetDinh(null);
				quyetDinhModel.getMoChuyenNganhList().get(i).setNgayCapNhatCuoi(null);
			}
		} else {
			if (actionType.equals("ThemMoi")) { // Truong hop : Them "QUYET DINH"
				if (quyetDinhModel.validateModel()) { // Validate thanh cong					
					if(QuyetDinhDAO.checkNamAndHeDaoTaoOfQuyetDinh(quyetDinhModel.getNamBatDau(), quyetDinhModel.getMaHeDaoTao())) {
						if (QuyetDinhDAO.insertQuyetDinh(quyetDinhModel)) {
							pageNext += "?msg=ThemMoi";
							rd = request.getRequestDispatcher(pageNext);						
						}
					} else {
						pageNext += "?errNam='TrungNam'";						
						rd = request.getRequestDispatcher(pageNext);						
					}
						
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);					
				}
			} else if(actionType.equals("CapNhat")) { // Truong hop: Cap nhat "QUYET DINH"
				if (quyetDinhModel.validateModel()) { // Validate thanh cong
					if (QuyetDinhDAO.updateQuyetDinh(quyetDinhModel)) {
						pageNext += "?msg=CapNhat";						
						rd = request.getRequestDispatcher(pageNext);
					}	
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);
				}
			}
		}
		request.setAttribute(Constant.QUYET_DINH_ATT, quyetDinhModel);
		rd.forward(request, response);
	}
}
