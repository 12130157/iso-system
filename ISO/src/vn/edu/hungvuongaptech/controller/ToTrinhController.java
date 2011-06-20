package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.ToTrinhDAO;
import vn.edu.hungvuongaptech.model.SysParamsModel;
import vn.edu.hungvuongaptech.model.ToTrinhModel;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ToTrinhController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType = request.getParameter("actionType");
		if(actionType.equals("GuiToTrinh"))
			guiToTrinh(request, response);
		else if(actionType.equals("GuiLaiToTrinh"))
			guiLaiToTrinh(request, response);
		else if(actionType.equals("DuyetToTrinh"))
			duyetToTrinh(request, response);
		else if(actionType.equals("DuyetMotToTrinh"))
			duyetMotToTrinh(request, response);
		else if(actionType.equals("PhanLoai"))
			phanLoaiToTrinh(request, response);
	}
	private void guiLaiToTrinh(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
			//String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		ToTrinhModel toTrinh = new ToTrinhModel();
		toTrinh.setId(request.getParameter("txtMaToTrinh"));
		if(ToTrinhDAO.guiLaiToTrinh(toTrinh)) {
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),
					MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(toTrinh.getMaNguoiTao()),///////////////
										MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_TOTRINH),
											MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_TOTRINH, 
												toTrinh.getTen(), 
													request.getSession().getAttribute("tenThanhVien").toString(), 
														toTrinh.getNgayGui() + " " + toTrinh.getGioGui()));
			response.sendRedirect(Constant.PATH_RES
					.getString("iso.XemToTrinhPath"));
		}
		return;
	}
	private void duyetMotToTrinh(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
			String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		
		if(request.getParameter("Duyet").equals("Approve")) {
			ToTrinhDAO.duyetToTrinh(request.getParameter("txtMaToTrinh"), request.getParameter("txtMaNguoiTao"), Constant.TINHTRANG_APPROVE, userLoginID, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
			ToTrinhModel toTrinh = ToTrinhDAO.getToTrinhSimpleByID(request.getParameter("txtMaToTrinh"));
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(request.getParameter("txtMaNguoiTao")),///////////////
					MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
						MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_TOTRINH),
							MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_TOTRINH, 
									toTrinh.getTen(), 
									toTrinh.getTenNguoiTao(), 
									toTrinh.getNgayGui() + " " + toTrinh.getGioGui(), 
									toTrinh.getTenNguoiDuyet(), 
									toTrinh.getNgayDuyet() + " " + toTrinh.getGioDuyet()));
		} else {
			if(!request.getSession().getAttribute("maBoPhan").equals(Constant.BO_PHAN_BGH))
				userLoginID = "";
			ToTrinhDAO.duyetToTrinh(request.getParameter("txtMaToTrinh"), request.getParameter("txtMaNguoiTao"), Constant.TINHTRANG_REJECT, userLoginID, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
			ToTrinhModel toTrinh = ToTrinhDAO.getToTrinhSimpleByID(request.getParameter("txtMaToTrinh"));
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(request.getParameter("txtMaNguoiTao")),///////////////
					MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
						MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_TOTRINH),
							MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_TOTRINH, 
									toTrinh.getTen(), 
									toTrinh.getTenNguoiTao(), 
									toTrinh.getNgayGui() + " " + toTrinh.getGioGui(), 
									toTrinh.getTenNguoiDuyet(), 
									toTrinh.getNgayDuyet() + " " + toTrinh.getGioDuyet()));
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemToTrinhPath"));
	}
	private void duyetToTrinh(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
			String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		for (Integer i = 0; i< Constant.RECORDS_PER_PAGE; i++) {
			if(request.getParameter("tinhtrang" + i.toString()) != null) {
				//String a = request.getParameter("status" + i.toString());
				String choiseValue = request.getParameter("tinhtrang" + i.toString());
				String[] value = choiseValue.split("-");
				String maNguoiTao = value[2];
					
				if (value[0].equals("Approve")) {
					//if(!(a.equals(Constant.TINHTRANG_APPROVE))) {
						String maToTrinh = value[1];
						ToTrinhDAO.duyetToTrinh(maToTrinh, maNguoiTao, Constant.TINHTRANG_APPROVE, userLoginID, "");
						ToTrinhModel toTrinh = ToTrinhDAO.getToTrinhSimpleByID(maToTrinh);
						MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(maNguoiTao),///////////////
								MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
									MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_TOTRINH),
										MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_TOTRINH, 
												toTrinh.getTen(), 
												toTrinh.getTenNguoiTao(), 
												toTrinh.getNgayGui() + " " + toTrinh.getGioGui(), 
												toTrinh.getTenNguoiDuyet(), 
												toTrinh.getNgayDuyet() + " " + toTrinh.getGioDuyet()));
		//LogUtil.logInfo(loggerInfo, tenThanhVien + " approve thời khóa biểu"); // ghi vào file log
					//}
				}
				if(value[0].equals("Reject")) {
					//if(!(a.equals(Constant.TINHTRANG_REJECT))) {
						String maToTrinh = value[1];
						ToTrinhDAO.duyetToTrinh(maToTrinh, maNguoiTao, Constant.TINHTRANG_REJECT, userLoginID, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
						ToTrinhModel toTrinh = ToTrinhDAO.getToTrinhSimpleByID(maToTrinh);
						MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(maNguoiTao),///////////////
								MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
									MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_TOTRINH),
										MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_TOTRINH, 
												toTrinh.getTen(), 
												toTrinh.getTenNguoiTao(), 
												toTrinh.getNgayGui() + " " + toTrinh.getGioGui(), 
												toTrinh.getTenNguoiDuyet(), 
												toTrinh.getNgayDuyet() + " " + toTrinh.getGioDuyet()));
					//}
				}
			}
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemToTrinhPath"));
	}
	private void guiToTrinh(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
			String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
			
		ToTrinhModel toTrinh = new ToTrinhModel();
		toTrinh.setMaNguoiTao(userLoginID);
		
		if(ToTrinhDAO.guiToTrinh(toTrinh)) {
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),
					MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(toTrinh.getMaNguoiTao()),///////////////
										MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_TOTRINH),
											MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_TOTRINH, 
												toTrinh.getTen(), 
													request.getSession().getAttribute("tenThanhVien").toString(), 
														toTrinh.getNgayGui() + " " + toTrinh.getGioGui()));
			response.sendRedirect(Constant.PATH_RES
					.getString("iso.XemToTrinhPath"));
		}
		return;
	}
	private void phanLoaiToTrinh(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String select = request.getParameter("selectTinhTrang");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemToTrinhPath")
				+ "?msg=" + select);
		//LogUtil.logInfo(loggerInfo, tenThanhVien + " phân loại kế hoạch đào tạo"); // ghi vào file log
	}
}
