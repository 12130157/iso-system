package vn.edu.hungvuongaptech.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;

import vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO;
import vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO;
import vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO;
import vn.edu.hungvuongaptech.dao.HopDongLaoDongDAO;
import vn.edu.hungvuongaptech.dao.LuongDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.DeNghiKTVModel;
import vn.edu.hungvuongaptech.model.HoSoDuTuyenModel;
import vn.edu.hungvuongaptech.model.HopDongLaoDongModel;

import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class HopDongLaoDongController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		String action = request.getParameter("action");
		if(action.equals("save")){
			SaveHopDongLaoDong(request, response);
		} else if(action.equals("send")){
			SendHopDongLaoDong(request, response);
		} else if(action.equals("approve")){
			ApproveHopDongLaoDong(request, response);
		} else if(action.equals("reject")){
			RejectHopDongLaoDong(request, response);
		} else if(action.equals("search")){
			SearchHopDongLaoDong(request, response);
		}
	}
	
	private void SaveHopDongLaoDong(HttpServletRequest request,HttpServletResponse response){
		int kq = HopDongLaoDongDAO.updateHopDongLaoDong(request.getParameter("txtMaDeNghi"),
				request.getParameter("txtThoiGian").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("txtBatDau")),
				DateUtil.changeDMYtoMDY(request.getParameter("txtKetThuc")),
				request.getParameter("txtLoaiVienChuc"),
				request.getParameter("txtMaNgach"), 
				request.getParameter("txtBac"),
				request.getParameter("txtHeSoLuong"),
				Constant.TINHTRANG_NEW);
		HopDongLaoDongModel hopDongLaoDong = HopDongLaoDongDAO.getHopDongLaoDongByID(request.getParameter("txtMaDeNghi"));
		HoSoDuTuyenModel model = HoSoDuTuyenDAO.getHoSoByID(hopDongLaoDong.getNguoi_du_tuyen());
		String mes = "";
		try {
			if (kq != -1) {
				mes = "Cập Nhật Thành Công !!!";
			}else{
				mes = "Cập Nhật Thất Bại !!!";
			}
			request.setAttribute("mes", mes);
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDong/HopDongLaoDong.jsp?id="+request.getParameter("txtMaDeNghi")+"&&nguoidutuyen="+model.getId()+"&&vitridutuyen="+model.getVi_tri_du_tuyen());
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SendHopDongLaoDong(HttpServletRequest request,HttpServletResponse response){
		int kq = HopDongLaoDongDAO.updateHopDongLaoDong(request.getParameter("txtMaDeNghi"),
				request.getParameter("txtThoiGian").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("txtBatDau")),
				DateUtil.changeDMYtoMDY(request.getParameter("txtKetThuc")),
				request.getParameter("txtLoaiVienChuc"),
				request.getParameter("txtMaNgach"),
				request.getParameter("txtBac"),
				request.getParameter("txtHeSoLuong"),
				Constant.TINHTRANG_SEND);
		
		if(kq != -1){
			HopDongLaoDongModel HDLD = HopDongLaoDongDAO.getHopDongLaoDongByID(request.getParameter("txtMaDeNghi"));
			HoSoDuTuyenModel HSDT = HoSoDuTuyenDAO.getHoSoByID(HDLD.getNguoi_du_tuyen());
			ArrayList<String> listMail = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
			listMail.add(HSDT.getEmail());
			
			String ten = "";
			if(HDLD.getSo_lan().equals("0")){
				ten = "Hợp Đồng Lao Động (Lần Đầu) - " + HDLD.getTen_nguoi_du_tuyen();
			}else{
				ten = "Hợp Đồng Lao Động - " + HDLD.getTen_nguoi_du_tuyen();
			}
			
			MailUtil.sendEmailToBoPhan(listMail,
					MailDAO.getMailListByMaBoPhan(""),
										MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU),
											MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU,
													ten,
													HDLD.getTen_nguoi_lap(),
													HDLD.getNgay_lap()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDong/showHopDongLaoDong.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void ApproveHopDongLaoDong(HttpServletRequest request,HttpServletResponse response){
		int kq = HopDongLaoDongDAO.approveHopDongLaoDong(request.getParameter("txtMaDeNghi"), request.getSession().getAttribute("maThanhVien").toString());
		if(kq != -1){
			HopDongLaoDongModel HDLD = HopDongLaoDongDAO.getHopDongLaoDongByID(request.getParameter("txtMaDeNghi"));
			HoSoDuTuyenModel HSDT = HoSoDuTuyenDAO.getHoSoByID(HDLD.getNguoi_du_tuyen());
			String ten="";
			if(HDLD.getTinh_trang().equals("3")){
				if(HDLD.getSo_lan().equals("0")){
					ten = "Hợp Đồng Lao Động (Lần Đầu) - " + HDLD.getTen_nguoi_du_tuyen();
				}else{
					ten = "Hợp Đồng Lao Động - " + HDLD.getTen_nguoi_du_tuyen();
				}
				if(HDLD.getSo_lan().equals("0")){
					HoSoDuTuyenDAO.updateHSDT(HDLD.getNguoi_du_tuyen(), "", "6");
					ThanhVienDAO.UpdateVaiTroTV(HSDT.getMa_vai_tro(), HSDT.getTen_dang_nhap());
					LuongDAO.insertLuong(ThanhVienDAO.getMaThanhVienByHoSoDuTuyen(HDLD.getNguoi_du_tuyen()),
							HDLD.getLoai_vien_chuc(),
							HDLD.getMa_ngach(),
							HDLD.getBac(),
							HDLD.getHe_so_luong(),
							HDLD.getNgay_cap_nhat_cuoi(),
							ten);
				}else{
					HoSoDuTuyenDAO.updateHSDT(HDLD.getNguoi_du_tuyen(), "", "9");
					LuongDAO.insertLuong(ThanhVienDAO.getMaThanhVienByHoSoDuTuyen(HDLD.getNguoi_du_tuyen()),
							HDLD.getLoai_vien_chuc(),
							HDLD.getMa_ngach(),
							HDLD.getBac(),
							HDLD.getHe_so_luong(),
							HDLD.getNgay_cap_nhat_cuoi(),
							ten);
				}
				
				
				MailUtil.sendEmail(HSDT.getEmail(), "",
						MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU),
						MailDAO.getContentApproveHopDongLaoDong(Constant.CHUCNANG_KYHOPDONGLANDAU,
								ten,
								HDLD.getTen_nguoi_lap(),
								HDLD.getNgay_lap(),
								HDLD.getTen_hieu_truong(),
								HDLD.getNgay_HT_duyet(),
								HSDT.getTen_vai_tro(),
								HSDT.getTen_bo_phan(),
								HDLD.getBat_dau_mdy(),
								HDLD.getKet_thuc_mdy()));
			}
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDong/showHopDongLaoDong.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void RejectHopDongLaoDong(HttpServletRequest request,HttpServletResponse response){
		int kq = HopDongLaoDongDAO.rejectHopDongLaoDong(request.getParameter("txtMaDeNghi"), StringUtil.toUTF8(request.getParameter("txtLyDoReject").trim()));
		if(kq != -1){
			HopDongLaoDongModel HDLD = HopDongLaoDongDAO.getHopDongLaoDongByID(request.getParameter("txtMaDeNghi"));
			String ten = ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString());
			MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(HDLD.getNguoi_lap()),
								"",
									MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU),
										MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU,
											"Hợp Đồng lao Động (Lần Đầu) - "+HDLD.getTen_nguoi_du_tuyen(),
												HDLD.getTen_nguoi_lap(),
													HDLD.getNgay_lap(),
													ten,
													HDLD.getNgay_cap_nhat_cuoi()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDong/showHopDongLaoDong.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SearchHopDongLaoDong(HttpServletRequest request,HttpServletResponse response){
		String msg = request.getParameter("selectTinhTrang");
		if(msg.equals("All")){
			msg = "";
		}
		try {
				RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDong/showHopDongLaoDong.jsp?msg="+msg);
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
