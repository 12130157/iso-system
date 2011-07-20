package vn.edu.hungvuongaptech.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;

import vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO;
import vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO;
import vn.edu.hungvuongaptech.dao.HopDongLanDauDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.HoSoDuTuyenModel;
import vn.edu.hungvuongaptech.model.HopDongLanDauModel;

import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class HopDongLanDauController extends HttpServlet{
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
			SaveHopDongLanDau(request, response);
		} else if(action.equals("send")){
			SendHopDongLanDau(request, response);
		} else if(action.equals("approve")){
			ApproveHopDongLanDau(request, response);
		} else if(action.equals("reject")){
			RejectHopDongLanDau(request, response);
		} else if(action.equals("search")){
			SearchHopDongLanDau(request, response);
		}
	}
	
	private void SaveHopDongLanDau(HttpServletRequest request,HttpServletResponse response){
		String luong = request.getParameter("txtLuong");
		String mes = "";
		luong = luong.replace(".", "");
		int kq = HopDongLanDauDAO.updateHopDongLanDau(request.getParameter("txtMaDeNghi"), request.getParameter("txtThoiGian").trim(),DateUtil.changeDMYtoMDY(request.getParameter("txtBatDau")), DateUtil.changeDMYtoMDY(request.getParameter("txtKetThuc")), luong, Constant.TINHTRANG_NEW);
		
		try {
			if (kq != 0) {
				mes = "Cập Nhật Thành Công !!!";
			}else{
				mes = "Cập Nhật Thất Bại !!!";
			}
			request.setAttribute("mes", mes);
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDongLanDau/HopDongLaoDongLanDau.jsp?id="+request.getParameter("txtMaDeNghi"));
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SendHopDongLanDau(HttpServletRequest request,HttpServletResponse response){
		String luong = request.getParameter("txtLuong");
		luong = luong.replace(".", "");
		int kq = HopDongLanDauDAO.updateHopDongLanDau(request.getParameter("txtMaDeNghi"), request.getParameter("txtThoiGian"), DateUtil.changeDMYtoMDY(request.getParameter("txtBatDau")), DateUtil.changeDMYtoMDY(request.getParameter("txtKetThuc")), luong, Constant.TINHTRANG_SEND);
		String truongkhoa = HopDongLanDauDAO.getTK(kq);
		
		kq = HopDongLanDauDAO.approveHopDongLanDau(request.getParameter("txtMaDeNghi"), truongkhoa);
		HopDongLanDauModel HDLD = HopDongLanDauDAO.getHopDongLanDauByID(request.getParameter("txtMaDeNghi"));

		if(kq != 0){
			MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT),
					MailDAO.getMailListByMaBoPhan(""),
										MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU),
											MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU,
													"Hợp Đồng lao Động (Lần Đầu) - "+HDLD.getTen_nguoi_du_tuyen(),
													HDLD.getTen_truong_khoa(),
													HDLD.getNgay_lap()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDongLanDau/showHopDongLaoDongLanDau.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void ApproveHopDongLanDau(HttpServletRequest request,HttpServletResponse response){
		int kq = HopDongLanDauDAO.approveHopDongLanDau(request.getParameter("txtMaDeNghi"), request.getSession().getAttribute("maThanhVien").toString());
		if(kq!=0){
			HopDongLanDauModel HDLD = HopDongLanDauDAO.getHopDongLanDauByID(request.getParameter("txtMaDeNghi"));
			ArrayList<String> mail = new ArrayList<String>();
			ArrayList<String> mailto = new ArrayList<String>();
			if(HDLD.getTinh_trang().equals("3")){
				mailto = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC);
			} else if(HDLD.getTinh_trang().equals("4")){
				mailto = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
			}  else if(HDLD.getTinh_trang().equals("5")){
				mailto.add(MailDAO.getMailByMaThanhVien(HDLD.getTruong_khoa()));
				mail = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
				HoSoDuTuyenDAO.updateHSDT(HDLD.getNguoi_du_tuyen(), "", "7");
				HoSoDuTuyenModel HSDT = HoSoDuTuyenDAO.getHoSoByID(HDLD.getNguoi_du_tuyen());
				ThanhVienDAO.UpdateVaiTroTV(HSDT.getMa_vai_tro(), HSDT.getTen_dang_nhap());
			}
			MailUtil.sendEmailToBoPhan(mailto,
									mail,
										MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC),
											MailDAO.getContentApproveByChucNang_NhanSu(Constant.CHUCNANG_DENGHIKHOANTHUVIEC,
													"Hợp Đồng lao Động (Lần Đầu) - "+HDLD.getTen_nguoi_du_tuyen(),
													HDLD.getTen_truong_khoa(),
													HDLD.getNgay_lap(),
													HDLD.getTen_phong_DT(),
													HDLD.getNgay_DT_duyet(),
													HDLD.getTen_phong_HC(),
													HDLD.getNgay_HC_duyet(),
													HDLD.getTen_hieu_truong(),
													HDLD.getNgay_HT_duyet()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDongLanDau/showHopDongLaoDongLanDau.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void RejectHopDongLanDau(HttpServletRequest request,HttpServletResponse response){
		int kq = HopDongLanDauDAO.rejectHopDongLanDau(request.getParameter("txtMaDeNghi"), StringUtil.toUTF8(request.getParameter("txtLyDoReject").trim()));
		if(kq!=0){
			HopDongLanDauModel HDLD = HopDongLanDauDAO.getHopDongLanDauByID(request.getParameter("txtMaDeNghi"));
			String ten = ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString());
			MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(HDLD.getTruong_khoa()),
								"",
									MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU),
										MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU,
											"Hợp Đồng lao Động (Lần Đầu) - "+HDLD.getTen_nguoi_du_tuyen(),
												HDLD.getTen_truong_khoa(),
													HDLD.getNgay_lap(),
													ten,
													HDLD.getNgay_cap_nhat_cuoi()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDongLanDau/showHopDongLaoDongLanDau.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SearchHopDongLanDau(HttpServletRequest request,HttpServletResponse response){
		String msg = request.getParameter("selectTinhTrang");
		if(msg.equals("All")){
			msg = "";
		}
		try {
				RequestDispatcher rd = request.getRequestDispatcher("NhanSu/HopDongLaoDongLanDau/showHopDongLaoDongLanDau.jsp?msg="+msg);
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
