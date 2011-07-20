package vn.edu.hungvuongaptech.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO;
import vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO;
import vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO;
import vn.edu.hungvuongaptech.dao.DeNghiNhanSuDAO;
import vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO;
import vn.edu.hungvuongaptech.dao.HopDongLanDauDAO;
import vn.edu.hungvuongaptech.dao.KhoaDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.dao.TieuChuanDAO;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.DeNghiNhanSuModel;
import vn.edu.hungvuongaptech.model.HoSoDuTuyenModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.NhanXetKetQuaThuViecModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;


public class HoSoDuTuyenController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public HoSoDuTuyenController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		String action = request.getParameter("action");
		if(action.equals("new")){
			newHoSoDuTuyen(request,response);
		} else if(action.equals("approve")){
			approveHoSoDuTuyen(request,response);
		} else if(action.equals("reject")){
			rejectHoSoDuTuyen(request,response);
		} else if(action.equals("search")){
			searchHoSoDuTuyen(request,response);
		} else if(action.equals("new1")){
			newDeNghiKhoanThuViec(request,response);
		} else if(action.equals("new2")){
			newHopDongLanDau(request,response);
		}
	}
	
	private void newHoSoDuTuyen(HttpServletRequest request,HttpServletResponse response){
		int kq = HoSoDuTuyenDAO.insertHoSoDuTuyen(request.getParameter("TenDangNhap").trim(),
				StringUtil.toUTF8(request.getParameter("Ho").trim()),
				StringUtil.toUTF8(request.getParameter("TenLot").trim()),
				StringUtil.toUTF8(request.getParameter("Ten").trim()),
				request.getParameter("GioiTinh"),
				DateUtil.changeDMYtoMDY(request.getParameter("NgaySinh")),
				request.getParameter("CMND").trim(),
				StringUtil.toUTF8(request.getParameter("SoNha").trim()),
				StringUtil.toUTF8(request.getParameter("TenDuong").trim()),
				StringUtil.toUTF8(request.getParameter("PhuongXa").trim()),
				StringUtil.toUTF8(request.getParameter("QuanHuyen").trim()),
				StringUtil.toUTF8(request.getParameter("TinhTP").trim()),
				request.getParameter("DTNha").trim(),
				request.getParameter("Email").trim(),
				request.getParameter("DTDD").trim(),
				StringUtil.toUTF8(request.getParameter("TrinhDoVanHoa").trim()),
				StringUtil.toUTF8(request.getParameter("ChuyenMon").trim()),
				StringUtil.toUTF8(request.getParameter("NgoaiNgu").trim()),
				StringUtil.toUTF8(request.getParameter("TinHoc").trim()),
				StringUtil.toUTF8(request.getParameter("TomTatBanThan").trim()),
				request.getParameter("ViTriDuTuyen"));
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/ThemThanhCong.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void approveHoSoDuTuyen(HttpServletRequest request,HttpServletResponse response){
		int kq = HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"),StringUtil.toUTF8(request.getParameter("txtGhiChu"+request.getParameter("id"))), Constant.TINHTRANG_HSDT_APPROVE);
		String tenNguoiDuyet = ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString());
		HoSoDuTuyenModel HSDT = HoSoDuTuyenDAO.getHoSoByID(request.getParameter("id"));
		
		ChiTietThanhVienModel model = new ChiTietThanhVienModel();
		model.setTenDangNhap(HSDT.getTen_dang_nhap());
		model.setMatKhau(HSDT.getTen_dang_nhap());
		model.setMaVaiTro(Constant.NGUOI_DU_TUYEN);
		model.setMaKhoa(HSDT.getMa_bo_phan());
		model.setHoThanhVien(HSDT.getHo());
		model.setTenLot(HSDT.getTen_lot());
		model.setTenThanhVien(HSDT.getTen());
		model.setNgaySinh(DateUtil.changeDMYtoMDY(HSDT.getNgay_sinh_mdy()));
		model.setEmail(HSDT.getEmail());
		model.setDienThoaiDiDong(HSDT.getDien_thoai_dd());
		model.setTinhTrang("1");
		model.setChungMinhNhanDan(HSDT.getCmnd());
		model.setSoNha(HSDT.getSo_nha());
		model.setDuong(HSDT.getDuong());
		model.setPhuongXa(HSDT.getPhuong_xa());
		model.setQuanHuyen(HSDT.getQuan_huyen());
		model.setThanhPho(HSDT.getTinh_thanhpho());
		model.setDienThoaiNha(HSDT.getDien_thoai_nha());
		ThanhVienDAO.insertChiTietThanhVien(model);
		ChiTietKHTNSDAO.TangSoLuongDaTuyenChiTietKHTNS(HSDT.getVi_tri_du_tuyen());
		
		MailUtil.sendEmail(HSDT.getEmail(), 
						"", 
							MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_HOSODUTUYEN), 
								MailDAO.getContentApproveHoSoDuTuyen(HSDT.getHo_ten(),
									HSDT.getTen_dang_nhap(),
										HSDT.getTen_dang_nhap(),
											tenNguoiDuyet,
												HSDT.getNgay_cap_nhat_cuoi()));
		
		
		MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(HSDT.getMa_truong_khoa()),
								"",
									MailDAO.getSubjectNhacNhoByChucNang(Constant.CHUCNANG_DENGHIKHOANTHUVIEC),
										MailDAO.getContentDeNghiKhoanThuViec(HSDT.getHo_ten(),
												tenNguoiDuyet,
													HSDT.getNgay_cap_nhat_cuoi(),
														HSDT.getTen_bo_phan()));
		try {
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/showHoSoDuTuyen.jsp");
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void rejectHoSoDuTuyen(HttpServletRequest request,HttpServletResponse response){
		int kq = HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"), request.getParameter("txtGhiChu"), Constant.TINHTRANG_HSDT_REJECT);
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/showHoSoDuTuyen.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void searchHoSoDuTuyen(HttpServletRequest request,HttpServletResponse response){
		String tinhtrang = request.getParameter("selectTinhTrang");
		ArrayList<HoSoDuTuyenModel> listHSDT;
		if(tinhtrang.equals("All")){
			tinhtrang = "";
		}
			listHSDT = HoSoDuTuyenDAO.getAllHoSoByTinhTrang(tinhtrang);
		
		request.setAttribute("listHSDT", listHSDT);
		
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/showHoSoDuTuyen.jsp?msg="+tinhtrang);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void newDeNghiKhoanThuViec(HttpServletRequest request,HttpServletResponse response){
		HoSoDuTuyenModel model = HoSoDuTuyenDAO.getHoSoByID(request.getParameter("id"));
		int kq = DeNghiKhoanThuViecDAO.insertDeNghiKTV(request.getParameter("id"), Constant.TINHTRANG_HT_NEW, request.getSession().getAttribute(Constant.USERID_ATT).toString());
		HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"), "", "3");
		try {
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DeNghiKhoanThuViec/DeNghiKhoanThuViec.jsp?id="+kq+"&&nguoidutuyen="+model.getId()+"&&vitridutuyen="+model.getVi_tri_du_tuyen());
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void newHopDongLanDau(HttpServletRequest request,HttpServletResponse response){
		HoSoDuTuyenModel model = HoSoDuTuyenDAO.getHoSoByID(request.getParameter("id"));
		int kq = HopDongLanDauDAO.insertHopDongLanDau(request.getParameter("id"), Constant.TINHTRANG_HT_NEW, request.getSession().getAttribute(Constant.USERID_ATT).toString());
		HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"), "", "6");
		try {
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HopDongLaoDongLanDau/HopDongLaoDongLanDau.jsp?id="+kq+"&&nguoidutuyen="+model.getId()+"&&vitridutuyen="+model.getVi_tri_du_tuyen());
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
