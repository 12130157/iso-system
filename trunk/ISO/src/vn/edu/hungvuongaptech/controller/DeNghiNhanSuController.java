package vn.edu.hungvuongaptech.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.DeNghiNhanSuDAO;
import vn.edu.hungvuongaptech.dao.KhoaDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.dao.TieuChuanDAO;
import vn.edu.hungvuongaptech.dao.VaiTroDAO;
import vn.edu.hungvuongaptech.model.DeNghiNhanSuModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.NhanXetKetQuaThuViecModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;


public class DeNghiNhanSuController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public DeNghiNhanSuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		String action = request.getParameter("action");
		if(action.equals("create")){
			CreateDeNghiTNS(request, response);
		}else if(action.equals("new")){
			SaveDeNghiTNS(request, response);
		} else if(action.equals("send")){
			SendDeNghiTNS(request, response);
		} else if(action.equals("approve")){
			ApproveDeNghiTNS(request, response);
		} else if(action.equals("reject")){
			RejectDeNghiTNS(request, response);
		} else if(action.equals("search")){
			SearchDeNghiTNS(request, response);
		} else if(action.equals("deleteTC")){
			DeleteTieuChuan(request,response);
		}
		
	}
	
	private void SaveDeNghiTNS(HttpServletRequest request,HttpServletResponse response){
		int cTieuChuan = Integer.parseInt(request.getParameter("row").toString());
		int count = TieuChuanDAO.CountTieuChuanByMaDeNghi(request.getParameter("txtMaDeNghi"));
		String maTieuChuan = "";
		String mes = "";
		for (int i = 1; i < cTieuChuan; i++) {
			if(i<=count){
				maTieuChuan = request.getParameter("txtMaTieuChuan"+i);
				TieuChuanDAO.UpdateTieuChuan(maTieuChuan, StringUtil.toUTF8(request.getParameter("txtTieuChuan"+i).toString().trim()));
			}
			else{
				TieuChuanDAO.InsertTieuChuan(request.getParameter("txtMaDeNghi"), StringUtil.toUTF8(request.getParameter("txtTieuChuan"+i).toString().trim()));
			}
		}
		String luong = request.getParameter("txtLuong");
		luong = luong.replace(".", "");
		DeNghiNhanSuModel model = new DeNghiNhanSuModel();
		model.setId(request.getParameter("txtMaDeNghi"));
		model.setChuc_danh(request.getParameter("txtChucDanh"));
		model.setSo_luong(request.getParameter("txtSoLuong").trim());
		model.setCong_viec(StringUtil.toUTF8(request.getParameter("txtCongViec").trim()));
		model.setLuong(luong);
		model.setThoi_gian_bat_dau_lam(DateUtil.changeDMYtoMDY(request.getParameter("txtCalendar")));
		model.setTinh_trang(Constant.TINHTRANG_NEW);
		int kq = DeNghiNhanSuDAO.UpdateDNNS(model);
		try {
			if (kq != 0) {
				mes = "Cập Nhật Thành Công !!!";
			}else{
				mes = "Cập Nhật Thất Bại !!!";
			}
			request.setAttribute("mes", mes);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiTuyenNhanSu/DeNghiTuyenNhanSu.jsp?id="+model.getId());
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	private void SendDeNghiTNS(HttpServletRequest request,HttpServletResponse response){
		int cTieuChuan = Integer.parseInt(request.getParameter("row").toString());
		int count = TieuChuanDAO.CountTieuChuanByMaDeNghi(request.getParameter("txtMaDeNghi"));
		for (int i = count+1; i < cTieuChuan; i++) {
			TieuChuanDAO.InsertTieuChuan(request.getParameter("txtMaDeNghi"), StringUtil.toUTF8(request.getParameter("txtTieuChuan"+i).toString()));
		}
		String luong = request.getParameter("txtLuong");
		luong = luong.replace(".", "");
		DeNghiNhanSuModel model = new DeNghiNhanSuModel();
		model.setId(request.getParameter("txtMaDeNghi"));
		model.setChuc_danh(request.getParameter("txtChucDanh"));
		model.setSo_luong(request.getParameter("txtSoLuong").trim());
		model.setCong_viec(StringUtil.toUTF8(request.getParameter("txtCongViec").trim()));
		model.setLuong(luong);
		model.setThoi_gian_bat_dau_lam(DateUtil.changeDMYtoMDY(request.getParameter("txtCalendar")));
		model.setTinh_trang(Constant.TINHTRANG_SEND);
		int kq = DeNghiNhanSuDAO.UpdateDNNS(model);
		if(kq != 0){
			DeNghiNhanSuModel DNNS = DeNghiNhanSuDAO.getDNNSByID(model.getId());
			KhoaModel khoa = KhoaDAO.getKhoaByMaBoPhan(DNNS.getMa_bo_phan());
			if(khoa.getMaTruongKhoa().equals(DNNS.getNguoi_de_nghi())){
				DeNghiNhanSuDAO.ApproveDNNS(DNNS.getId(), khoa.getMaTruongKhoa());
				MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT),
						MailDAO.getMailListByMaBoPhan(""),
											MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_DENGHINHANSU),
												MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_DENGHINHANSU,
														"Đề Nghị Nhân Sự - "+DNNS.getNam()+" - "+DNNS.getTen_bo_phan()+" - "+DNNS.getTen_chuc_danh()+" - "+DNNS.getSo_luong(),
														DNNS.getTen_nguoi_de_nghi(),
														DNNS.getNgay_lap()));
			} else{
				MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(khoa.getMaKhoa()),
										"",
											MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_DENGHINHANSU),
												MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_DENGHINHANSU,
														"Đề Nghị Nhân Sự - "+DNNS.getNam()+" - "+DNNS.getTen_bo_phan()+" - "+DNNS.getTen_chuc_danh()+" - "+DNNS.getSo_luong(),
														DNNS.getTen_nguoi_de_nghi(),
														DNNS.getNgay_lap()));
			}
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiTuyenNhanSu/showDeNghiTuyenNhanSu.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void ApproveDeNghiTNS(HttpServletRequest request,HttpServletResponse response){
		int kq = DeNghiNhanSuDAO.ApproveDNNS(request.getParameter("txtMaDeNghi"), request.getSession().getAttribute("maThanhVien").toString());
		if(kq!=0){
			DeNghiNhanSuModel DNNS = DeNghiNhanSuDAO.getDNNSByID(request.getParameter("txtMaDeNghi"));
			ArrayList<String> mail = new ArrayList<String>();
			ArrayList<String> mailto = new ArrayList<String>();
			if(DNNS.getTinh_trang().equals("3")){
				mailto = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC);
			} else if(DNNS.getTinh_trang().equals("4")){
				mailto = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
			}  else if(DNNS.getTinh_trang().equals("5")){
				mailto.add(MailDAO.getMailByMaThanhVien(DNNS.getNguoi_de_nghi()));
				mail = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
			}
			MailUtil.sendEmailToBoPhan(mailto,
									mail,
										MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC),
											MailDAO.getContentApproveByChucNang_NhanSu(Constant.CHUCNANG_DENGHIKHOANTHUVIEC,
													"Đề Nghị Nhân Sự - "+DNNS.getNam()+" - "+DNNS.getTen_bo_phan()+" - "+DNNS.getTen_chuc_danh()+" - "+DNNS.getSo_luong(),
													DNNS.getTen_truong_khoa(),
													DNNS.getNgay_lap(),
													DNNS.getTen_phong_DT(),
													DNNS.getNgay_DT_duyet(),
													DNNS.getTen_phong_HC(),
													DNNS.getNgay_HC_duyet(),
													DNNS.getTen_hieu_truong(),
													DNNS.getNgay_HT_duyet()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiTuyenNhanSu/showDeNghiTuyenNhanSu.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void RejectDeNghiTNS(HttpServletRequest request,HttpServletResponse response){
		int kq = DeNghiNhanSuDAO.RejectDNNS(request.getParameter("txtMaDeNghi"), StringUtil.toUTF8(request.getParameter("txtLyDoReject").trim()));
		if(kq!=0){

			DeNghiNhanSuModel DNNS = DeNghiNhanSuDAO.getDNNSByID(request.getParameter("txtMaDeNghi"));
			KhoaModel khoa = KhoaDAO.getKhoaByMaBoPhan(DNNS.getMa_bo_phan());
			String ten = ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString());
			MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(khoa.getMaTruongKhoa()),
								MailDAO.getMailByMaThanhVien(DNNS.getNguoi_de_nghi()),
									MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_DENGHINHANSU),
									MailDAO.getContentRejectByChucNangCoLyDoReject(Constant.CHUCNANG_DENGHINHANSU,
											"Đề Nghị Nhân Sự - "+DNNS.getNam()+" - "+DNNS.getTen_bo_phan()+" - "+DNNS.getTen_chuc_danh()+" - "+DNNS.getSo_luong(),
													DNNS.getTen_nguoi_de_nghi(),
													DNNS.getNgay_lap(),
													ten,
													DNNS.getNgay_cap_nhat_cuoi(),
													DNNS.getLy_do_reject()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiTuyenNhanSu/showDeNghiTuyenNhanSu.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void CreateDeNghiTNS(HttpServletRequest request,HttpServletResponse response){
		String error = "";
		String luong = request.getParameter("txtLuong");
		luong = luong.replace(".", "");
		VaiTroModel VT = VaiTroDAO.timVaiTro(request.getParameter("txtChucDanh"));
		KhoaModel Khoa = KhoaDAO.getKhoaByMaBoPhan(request.getSession().getAttribute("maBoPhan").toString());
		DeNghiNhanSuModel model = new DeNghiNhanSuModel();
		model.setNam(request.getParameter("txtNam"));
		model.setMa_bo_phan(request.getSession().getAttribute("maBoPhan").toString());
		model.setNguoi_de_nghi(request.getSession().getAttribute("maThanhVien").toString());
		model.setChuc_danh(request.getParameter("txtChucDanh"));
		model.setSo_luong(request.getParameter("txtSoLuong").trim());
		model.setCong_viec(StringUtil.toUTF8(request.getParameter("txtCongViec").trim()));
		model.setLuong(luong);
		model.setThoi_gian_bat_dau_lam(DateUtil.changeDMYtoMDY(request.getParameter("txtCalendar")));
		model.setTinh_trang(Constant.TINHTRANG_NEW);
		int MaDeNghi = DeNghiNhanSuDAO.InsertDNNS(model);
		try {
			if(MaDeNghi!=0){
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiTuyenNhanSu/DeNghiTuyenNhanSu.jsp?id="+MaDeNghi);
				rd.forward(request, response);
			}
			else{
				error = VT.getTenVaiTro()+" đã được Bộ Phận/Khoa "+Khoa.getTenKhoa()+" đề nghị trong Năm "+request.getParameter("txtNam")+" rồi !!!";
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiTuyenNhanSu/DeNghiTuyenNhanSu.jsp?Them=yes");
				request.setAttribute("error", error);
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SearchDeNghiTNS(HttpServletRequest request,HttpServletResponse response){
		String msg = request.getParameter("selectTinhTrang");
		if(msg.equals("All")){
			msg = "";
		}
		try {
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiTuyenNhanSu/showDeNghiTuyenNhanSu.jsp?msg="+msg);
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void DeleteTieuChuan(HttpServletRequest request,HttpServletResponse response){
		String maDeNghi = request.getParameter("txtMaDeNghi");
		String maTieuChuan = request.getParameter("txtMaTieuChuan");
		TieuChuanDAO.DeleteTieuChuan(maTieuChuan);
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiTuyenNhanSu/DeNghiTuyenNhanSu.jsp?id="+maDeNghi);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}