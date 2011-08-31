package vn.edu.hungvuongaptech.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO;
import vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO;
import vn.edu.hungvuongaptech.dao.DeNghiNhanSuDAO;
import vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO;
import vn.edu.hungvuongaptech.dao.KhoaDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.DeNghiKTVModel;
import vn.edu.hungvuongaptech.model.DeNghiNhanSuModel;
import vn.edu.hungvuongaptech.model.HoSoDuTuyenModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class DeNghiKTVController extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		String action = request.getParameter("action");
		if(action.equals("new")){
			SaveDeNghiKTV(request, response);
		} else if(action.equals("send")){
			SendDeNghiKTV(request, response);
		} else if(action.equals("approve")){
			ApproveDeNghiKTV(request, response);
		} else if(action.equals("reject")){
			RejectDeNghiKTV(request, response);
		} else if(action.equals("search")){
			SearchDeNghiKTV(request, response);
		}
	}
	
	private void SaveDeNghiKTV(HttpServletRequest request,HttpServletResponse response){
		String luong = request.getParameter("txtLuong");
		luong = luong.replace(".", "");
		String mes = "";
		DeNghiKTVModel deNghiKTV = DeNghiKhoanThuViecDAO.getDeNghiKTVByID(request.getParameter("txtMaDeNghi"));
		HoSoDuTuyenModel model = HoSoDuTuyenDAO.getHoSoByID(deNghiKTV.getNguoi_du_tuyen());
		int kq = DeNghiKhoanThuViecDAO.updateDeNghiKTV(request.getParameter("txtMaDeNghi"),
				request.getParameter("txtThoiGian").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("txtBatDau")),
				DateUtil.changeDMYtoMDY(request.getParameter("txtKetThuc")),
				luong,
				Constant.TINHTRANG_NEW);
		try {
			if (kq != -1) {
				mes = "Cập Nhật Thành Công !!!";
			}else{
				mes = "Cập Nhật Thất Bại !!!";
			}
			
			request.setAttribute("mes", mes);
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/DeNghiKhoanThuViec/DeNghiKhoanThuViec.jsp?id="+request.getParameter("txtMaDeNghi")+"&&nguoidutuyen="+model.getId()+"&&vitridutuyen="+model.getVi_tri_du_tuyen());
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SendDeNghiKTV(HttpServletRequest request,HttpServletResponse response){
		String luong = request.getParameter("txtLuong");
		luong = luong.replace(".", "");
		int kq = DeNghiKhoanThuViecDAO.updateDeNghiKTV(request.getParameter("txtMaDeNghi"),
				request.getParameter("txtThoiGian").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("txtBatDau")),
				DateUtil.changeDMYtoMDY(request.getParameter("txtKetThuc")),
				luong,
				Constant.TINHTRANG_SEND);
		
		if(kq != -1){
			DeNghiKTVModel DNKTV = DeNghiKhoanThuViecDAO.getDeNghiKTVByID(request.getParameter("txtMaDeNghi"));
			DeNghiKhoanThuViecDAO.approveDeNghiKTV(request.getParameter("txtMaDeNghi"), DeNghiKhoanThuViecDAO.getTK(kq));
			ArrayList<String> listMail = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC);
			if(!ChiTietKHTNSDAO.getMaChucDanhByMaCTKHTNS(DNKTV.getViTriDuTuyen()).equals("8")){
				DeNghiKhoanThuViecDAO.updateDeNghiKTV(request.getParameter("txtMaDeNghi"),
						request.getParameter("txtThoiGian").trim(),
						DateUtil.changeDMYtoMDY(request.getParameter("txtBatDau")),
						DateUtil.changeDMYtoMDY(request.getParameter("txtKetThuc")),
						luong,
						"3");
			}else{
				listMail.addAll(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT));
			}
			
			MailUtil.sendEmailToBoPhan(listMail,
					MailDAO.getMailListByMaBoPhan(""),
										MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC),
											MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC,
													"Đề Nghị Khoán Thử Việc - "+DNKTV.getTen_nguoi_du_tuyen(),
													DNKTV.getTen_truong_khoa(),
													DNKTV.getNgay_lap()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/DeNghiKhoanThuViec/showDeNghiKhoanThuViec.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void ApproveDeNghiKTV(HttpServletRequest request,HttpServletResponse response){
		int kq = DeNghiKhoanThuViecDAO.approveDeNghiKTV(request.getParameter("txtMaDeNghi"), request.getSession().getAttribute("maThanhVien").toString());
		if(kq != -1){
			DeNghiKTVModel DNKTV = DeNghiKhoanThuViecDAO.getDeNghiKTVByID(request.getParameter("txtMaDeNghi"));
			ArrayList<String> mail = new ArrayList<String>();
			ArrayList<String> mailto = new ArrayList<String>();
			if(DNKTV.getTinh_trang().equals("4")){
				mailto = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
				MailUtil.sendEmailToBoPhan(mailto,
						mail,
							MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC),
								MailDAO.getContentApproveByChucNang_NhanSu(Constant.CHUCNANG_DENGHIKHOANTHUVIEC,
										"Đề Nghị Khoán Thử Việc - "+DNKTV.getTen_nguoi_du_tuyen(),
										DNKTV.getTen_truong_khoa(),
										DNKTV.getNgay_lap(),
										DNKTV.getTen_truong_khoa(),
										DNKTV.getNgay_TK_duyet(),
										DNKTV.getTen_phong_DT(),
										DNKTV.getNgay_DT_duyet(),
										DNKTV.getTen_phong_HC(),
										DNKTV.getNgay_HC_duyet(),
										DNKTV.getTen_hieu_truong(),
										DNKTV.getNgay_HT_duyet()));
			}  else if(DNKTV.getTinh_trang().equals("5")){
				mailto.add(MailDAO.getMailByMaThanhVien(DNKTV.getTruong_khoa()));
				mail = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
				HoSoDuTuyenDAO.updateHSDT(DNKTV.getNguoi_du_tuyen(), "", "4");
				MailUtil.sendEmailToBoPhan(mailto,
						mail,
							MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC),
								MailDAO.getContentApproveByChucNang_NhanSu(Constant.CHUCNANG_DENGHIKHOANTHUVIEC,
										"Đề Nghị Khoán Thử Việc - "+DNKTV.getTen_nguoi_du_tuyen(),
										DNKTV.getTen_truong_khoa(),
										DNKTV.getNgay_lap(),
										DNKTV.getTen_truong_khoa(),
										DNKTV.getNgay_TK_duyet(),
										DNKTV.getTen_phong_DT(),
										DNKTV.getNgay_DT_duyet(),
										DNKTV.getTen_phong_HC(),
										DNKTV.getNgay_HC_duyet(),
										DNKTV.getTen_hieu_truong(),
										DNKTV.getNgay_HT_duyet()));
			}
			
			
			
			try {
				RequestDispatcher rd = request.getRequestDispatcher("NhanSu/DeNghiKhoanThuViec/showDeNghiKhoanThuViec.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private void RejectDeNghiKTV(HttpServletRequest request,HttpServletResponse response){
		int kq = DeNghiKhoanThuViecDAO.rejectDeNghiKTV(request.getParameter("txtMaDeNghi"), StringUtil.toUTF8(request.getParameter("txtLyDoReject").trim()));
		if(kq != -1){
			DeNghiKTVModel DNKTV = DeNghiKhoanThuViecDAO.getDeNghiKTVByID(request.getParameter("txtMaDeNghi"));
			String ten = ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString());
			MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(DNKTV.getTruong_khoa()),
								"",
									MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC),
										MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC,
											"Đề Nghị Khoán Thử Việc - "+DNKTV.getTen_nguoi_du_tuyen(),
												DNKTV.getTen_truong_khoa(),
													DNKTV.getNgay_lap(),
													ten,
													DNKTV.getNgay_cap_nhat_cuoi()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/DeNghiKhoanThuViec/showDeNghiKhoanThuViec.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SearchDeNghiKTV(HttpServletRequest request,HttpServletResponse response){
		String msg = request.getParameter("selectTinhTrang");
		if(msg.equals("All")){
			msg = "";
		}
		try {
				RequestDispatcher rd = request.getRequestDispatcher("NhanSu/DeNghiKhoanThuViec/showDeNghiKhoanThuViec.jsp?msg="+msg);
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
