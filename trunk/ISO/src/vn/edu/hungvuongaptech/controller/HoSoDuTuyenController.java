package vn.edu.hungvuongaptech.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.BangCapDAO;
import vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO;
import vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO;
import vn.edu.hungvuongaptech.dao.ChungChiBangCapKhacDAO;
import vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO;
import vn.edu.hungvuongaptech.dao.DeNghiNhanSuDAO;
import vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO;
import vn.edu.hungvuongaptech.dao.HopDongLaoDongDAO;
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
		} else if(action.equals("newThongTin")){
			doPostNewThongTin(request, response);
		} else if(action.equals("updateThongTin")){
			doPostUpdateThongTin(request, response);
		} else if(action.equals("update")){
			doPostUpdate(request, response);
		} else if(action.equals("thuCamOn")){
			doPostThanks(request, response);
		} else if(action.equals("restore")){
			doPostRestore(request, response);
		} else if(action.equalsIgnoreCase("xoaBangCap")){
			doPostDeleteBangCap(request,response);
		} else if(action.equalsIgnoreCase("xoaBangCapKhac")){
			doPostDeleteBangCapKhac(request,response);
		}
	}
	
	private void doPostDeleteBangCap(HttpServletRequest request,HttpServletResponse response){
		BangCapDAO.deleteBangCap(request.getParameter("MaBangCap").toString());
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/NhapThongTin.jsp?maThanhVien="+request.getParameter("maThanhVien"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostDeleteBangCapKhac(HttpServletRequest request,HttpServletResponse response){
		ChungChiBangCapKhacDAO.deleteChungChiBangCapKhacCuaThanhVien(request.getParameter("MaBangCap").toString());
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/NhapThongTin.jsp?maThanhVien="+request.getParameter("maThanhVien"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void newHoSoDuTuyen(HttpServletRequest request,HttpServletResponse response){
		String tenDangNhap = HoSoDuTuyenDAO.getTenDangNhapByHoTen(StringUtil.toUTF8(request.getParameter("Ho").trim()),StringUtil.toUTF8(request.getParameter("TenLot").trim()),StringUtil.toUTF8(request.getParameter("Ten").trim()));
		ArrayList<String> list = ThanhVienDAO.getAllTenDangNhap();
		list.addAll(HoSoDuTuyenDAO.getAllTenDangNhapInHoSoDuTuyen());
		
		while(HoSoDuTuyenDAO.checkTenDangNhap(tenDangNhap, list)==true){
			tenDangNhap += Math.round(Math.random());
		}
		
		int kq = HoSoDuTuyenDAO.insertHoSoDuTuyen(
				tenDangNhap,
				StringUtil.toUTF8(request.getParameter("Ho").trim()),
				StringUtil.toUTF8(request.getParameter("TenLot").trim()),
				StringUtil.toUTF8(request.getParameter("Ten").trim()),
				request.getParameter("GioiTinh"),
				DateUtil.changeDMYtoMDY(request.getParameter("NgaySinh")),
				request.getParameter("CMND").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("txtNgayCap")),
				StringUtil.toUTF8(request.getParameter("txtNoiCap")),
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
	
	private void doPostUpdate(HttpServletRequest request,HttpServletResponse response){
		
		String kq = HoSoDuTuyenDAO.updateHoSoDuTuyen(
				request.getParameter("id"),
				StringUtil.toUTF8(request.getParameter("Ho").trim()),
				StringUtil.toUTF8(request.getParameter("TenLot").trim()),
				StringUtil.toUTF8(request.getParameter("Ten").trim()),
				request.getParameter("GioiTinh"),
				DateUtil.changeDMYtoMDY(request.getParameter("NgaySinh")),
				request.getParameter("CMND").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("txtNgayCap").trim()),
				StringUtil.toUTF8(request.getParameter("txtNoiCap").trim()),
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
				StringUtil.toUTF8(request.getParameter("TomTatBanThan").trim()));
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/HoSoDuTuyen.jsp?id="+kq);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void approveHoSoDuTuyen(HttpServletRequest request,HttpServletResponse response){
		HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"),StringUtil.toUTF8(request.getParameter("txtGhiChu"+request.getParameter("id"))), Constant.TINHTRANG_HSDT_APPROVE);
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
		HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"), "", "10");
		HoSoDuTuyenModel model = HoSoDuTuyenDAO.getHoSoByID(request.getParameter("id"));
		ChiTietKHTNSDAO.GiamSoLuongDaTuyenChiTietKHTNS(model.getVi_tri_du_tuyen());
		ArrayList<String> listTDN = ThanhVienDAO.getAllTenDangNhap();
		for (String tdn : listTDN) {
			if(model.getTen_dang_nhap().equals(tdn)){
				ThanhVienModel chiTietThanhVien = ThanhVienDAO.timThanhVienGP(model.getTen_dang_nhap());
				ThanhVienDAO.updateTinhTrang("0", chiTietThanhVien.getTenDangNhap());
			}
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/showHoSoDuTuyen.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void searchHoSoDuTuyen(HttpServletRequest request,HttpServletResponse response){
		String tinhtrang = request.getParameter("selectTinhTrang");
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
		int kq = HopDongLaoDongDAO.insertHopDongLaoDong(request.getParameter("id"), HopDongLaoDongDAO.countHopDongLaoDongByNguoiDuTuyen(request.getParameter("id")), request.getSession().getAttribute("maThanhVien").toString());
		if(!HopDongLaoDongDAO.countHopDongLaoDongByNguoiDuTuyen(request.getParameter("id")).equals("0")){
			HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"), "", "5");
		}else {
			HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"), "", "8");
		}
		
		try {
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HopDongLaoDong/HopDongLaoDong.jsp?id="+kq+"&&nguoidutuyen="+model.getId()+"&&vitridutuyen="+model.getVi_tri_du_tuyen());
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostNewThongTin(HttpServletRequest request, HttpServletResponse response){
		String error = "";
		String tenDangNhap = HoSoDuTuyenDAO.getTenDangNhapByHoTen(StringUtil.toUTF8(request.getParameter("Ho").trim()),StringUtil.toUTF8(request.getParameter("TenLot").trim()),StringUtil.toUTF8(request.getParameter("Ten").trim()));
		ArrayList<String> list = ThanhVienDAO.getAllTenDangNhap();
		list.addAll(HoSoDuTuyenDAO.getAllTenDangNhapInHoSoDuTuyen());
		
		while(HoSoDuTuyenDAO.checkTenDangNhap(tenDangNhap, list)==true){
			tenDangNhap += Math.round(Math.random());
		}
		String kq = HoSoDuTuyenDAO.insertThongTinThanhVien(tenDangNhap,
				StringUtil.toUTF8(request.getParameter("Ho").trim()),
				StringUtil.toUTF8(request.getParameter("TenLot").trim()),
				StringUtil.toUTF8(request.getParameter("Ten").trim()),
				request.getParameter("GioiTinh"),
				DateUtil.changeDMYtoMDY(request.getParameter("NgaySinh")),
				request.getParameter("CMND").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("txtNgayCap").trim()),
				StringUtil.toUTF8(request.getParameter("txtNoiCap").trim()),
				StringUtil.toUTF8(request.getParameter("SoNha").trim()),
				StringUtil.toUTF8(request.getParameter("TenDuong").trim()),
				StringUtil.toUTF8(request.getParameter("PhuongXa").trim()),
				StringUtil.toUTF8(request.getParameter("QuanHuyen").trim()),
				StringUtil.toUTF8(request.getParameter("TinhTP").trim()),
				request.getParameter("DTNha").trim(),
				request.getParameter("Email").trim(),
				request.getParameter("DTDD").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("NgayThuViec")),
				DateUtil.changeDMYtoMDY(request.getParameter("NgayVaoLam")), 
				request.getParameter("VaiTro"),
				request.getParameter("BoPhan"));
		if(!kq.equals("-1")){
			int max = Integer.parseInt(request.getParameter("row").trim());
			String n;
			for (int i = 1; i < max; i++) {
				if(Integer.parseInt(request.getParameter("BangCapChinh"))==i){
					n = "1";
				}else{
					n = "0";
				}
				BangCapDAO.insertBangCap(kq, 
						StringUtil.toUTF8(request.getParameter("LoaiBang"+i)), 
						StringUtil.toUTF8(request.getParameter("TruongCap"+i)),
						request.getParameter("Nam"+i),
						StringUtil.toUTF8(request.getParameter("LoaiTotNghiep"+i)),
						StringUtil.toUTF8(request.getParameter("ChuyenNganh"+i)),
						n);
			}
			error = "Thêm Thông Tin Thành Công !!!";
		}else{
			error = "Thêm Thông Tin Thất Bại !!!";
		}
		
		try {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/NhapThongTin.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostUpdateThongTin(HttpServletRequest request, HttpServletResponse response){
		String error = "";
		String kq = HoSoDuTuyenDAO.updateThongTinThanhVien(request.getParameter("maThanhVien").toString(),
				StringUtil.toUTF8(request.getParameter("Ho").trim()),
				StringUtil.toUTF8(request.getParameter("TenLot").trim()),
				StringUtil.toUTF8(request.getParameter("Ten").trim()),
				request.getParameter("GioiTinh"),
				DateUtil.changeDMYtoMDY(request.getParameter("NgaySinh")),
				request.getParameter("CMND").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("txtNgayCap").trim()),
				StringUtil.toUTF8(request.getParameter("txtNoiCap").trim()),
				StringUtil.toUTF8(request.getParameter("SoNha").trim()),
				StringUtil.toUTF8(request.getParameter("TenDuong").trim()),
				StringUtil.toUTF8(request.getParameter("PhuongXa").trim()),
				StringUtil.toUTF8(request.getParameter("QuanHuyen").trim()),
				StringUtil.toUTF8(request.getParameter("TinhTP").trim()),
				request.getParameter("DTNha").trim(),
				request.getParameter("Email").trim(),
				request.getParameter("DTDD").trim(),
				DateUtil.changeDMYtoMDY(request.getParameter("NgayThuViec")),
				DateUtil.changeDMYtoMDY(request.getParameter("NgayVaoLam")),
				request.getParameter("VaiTro"),
				request.getParameter("BoPhan"));

		if(!kq.equals("-1")){
			int max = Integer.parseInt(request.getParameter("row").trim());
			int count = BangCapDAO.countBangCapByMaThanhVien(kq);
			String n = "0";
			for (int i = 1; i < max; i++) {
				if(request.getParameter("BangCapChinh")!=null){
					if(Integer.parseInt(request.getParameter("BangCapChinh"))==i){
						n = "1";
					}
				}else{
					n = "0";
				}
				if(i<=count){
					BangCapDAO.updateBangCapChinh(request.getParameter("maBangCap"+i), n);
				}else{
					BangCapDAO.insertBangCap(kq, 
							StringUtil.toUTF8(request.getParameter("LoaiBang"+i)), 
							StringUtil.toUTF8(request.getParameter("TruongCap"+i)),
							request.getParameter("Nam"+i),
							StringUtil.toUTF8(request.getParameter("LoaiTotNghiep"+i)),
							StringUtil.toUTF8(request.getParameter("ChuyenNganh"+i)),
							n);
				}
				
			}
			max = Integer.parseInt(request.getParameter("row2"));
			count = ChungChiBangCapKhacDAO.countBangCapKhac(kq);
			for (int i = count+1; i < max; i++) {
				ChungChiBangCapKhacDAO.insertChungChiBangCapKhacCuaThanhVien(kq,
						request.getParameter("maCCBCK"+i), "", "", request.getParameter("NamTotNghiep"+i), StringUtil.toUTF8(request.getParameter("XepLoai"+i)));
			}
			error = "Cập Nhật Thông Tin Thành Công !!!";
		}else{
			error = "Cập Nhật Thông Tin Thất Bại !!!";
		}
		
		try {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/NhapThongTin.jsp?maThanhVien="+request.getParameter("maThanhVien"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostThanks(HttpServletRequest request, HttpServletResponse response){
		HoSoDuTuyenModel model = HoSoDuTuyenDAO.getHoSoByID(request.getParameter("id"));
		HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"), "", "2");
		ChiTietKHTNSDAO.GiamSoLuongDaTuyenChiTietKHTNS(model.getVi_tri_du_tuyen());
		ThanhVienModel chiTietThanhVien = ThanhVienDAO.timThanhVienGP(model.getTen_dang_nhap());
		ThanhVienDAO.updateTinhTrang("0", chiTietThanhVien.getTenDangNhap());
		String error = "1";
		try {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/HoSoDuTuyen.jsp?id="+request.getParameter("id"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostRestore(HttpServletRequest request, HttpServletResponse response){
		HoSoDuTuyenModel model = HoSoDuTuyenDAO.getHoSoByID(request.getParameter("id"));
		ArrayList<String> listTenDangNhap = ThanhVienDAO.getAllTenDangNhap();
		int n = 0;
		String error = "";
		for (String tenDangNhap : listTenDangNhap) {
			if(tenDangNhap.equals(model.getTen_dang_nhap())){
				HoSoDuTuyenDAO.updateHSDT(request.getParameter("id"), "", "0");
				n++;
			}
		}
		if(n==0){
			error = "Chức Năng đang được xây dựng !!!";
		}else{
			error = "Khôi Phục thành công !!!";
		}
		
		try {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/HoSoDuTuyen/showHoSoDuTuyen.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
