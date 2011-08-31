package vn.edu.hungvuongaptech.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO;
import vn.edu.hungvuongaptech.dao.DeNghiKhoanThuViecDAO;
import vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO;
import vn.edu.hungvuongaptech.dao.HopDongLaoDongDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.NhanXetKetQuaThuViecDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.DeNghiKTVModel;
import vn.edu.hungvuongaptech.model.HoSoDuTuyenModel;
import vn.edu.hungvuongaptech.model.HopDongLaoDongModel;
import vn.edu.hungvuongaptech.model.NhanXetKetQuaThuViecModel;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class NhanXetKetQuaThuViecController extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		String action = request.getParameter("action");
		if(action.equals("create")){
			doPostCreate(request,response);
		} else if(action.equals("save")){
			doPostSave(request,response);
		} else if(action.equals("send")){
			doPostSend(request,response);
		} else if(action.equals("approve")){
			doPostApprove(request,response);
		} else if(action.equals("reject")){
			doPostReject(request,response);
		} else if(action.equals("search")){
			doPostSearch(request,response);
		}
	}
	
	private void doPostCreate(HttpServletRequest request,HttpServletResponse response){
		String tenDangNhap = request.getSession().getAttribute(Constant.USERNAME_ATT).toString();
		HopDongLaoDongModel HDLD = HopDongLaoDongDAO.getHopDongLaoDongByTenDangNhap(tenDangNhap);
		String pageNext = "/NhanSu/Intro.jsp";
		if(HDLD==null){
			/*Bạn Chưa Được Đề Nghị Khoán Thử Việc !!!*/
			pageNext = "/NhanSu/NhanXetKetQuaThuViec/NhanXetKetQuaThuViec.jsp?error=HDLD";
		}else{
			/*Bạn Đã Được Đề Nghị Khoán Thử Việc !!!
			Kiểm tra thời gian !!!*/
			String ketthuc = HDLD.getKet_thuc_mdy();
			String test = HDLD.getNgay_cap_nhat_cuoi();
			String ketthuc_test[] =  ketthuc.split("-");
			String test_test[] = test.split("-");
			int ketthuc_test_so = Integer.parseInt(ketthuc_test[0])+Integer.parseInt(ketthuc_test[1])*30+Integer.parseInt(ketthuc_test[2])*365;
			int test_test_so = Integer.parseInt(test_test[0])+Integer.parseInt(test_test[1])*30+Integer.parseInt(test_test[2])*365;
			if(test_test_so>=ketthuc_test_so){
				/*Tạo Bản Tự Nhận Xét Kết Quả Thử Việc !!!*/
				NhanXetKetQuaThuViecModel NXKQTV = NhanXetKetQuaThuViecDAO.getNhanXetByTenDangNhap(tenDangNhap);
				if(NXKQTV==null){
					int MaNhanXet = NhanXetKetQuaThuViecDAO.insertNhanXetKetQuaThuViec(HDLD.getNguoi_du_tuyen(), HDLD.getThoi_gian());
					if(MaNhanXet!=-1){
						pageNext = "/NhanSu/NhanXetKetQuaThuViec/NhanXetKetQuaThuViec.jsp?id="+MaNhanXet;
					}
					
				}
				else{
					pageNext = "/NhanSu/NhanXetKetQuaThuViec/NhanXetKetQuaThuViec.jsp?id="+NXKQTV.getId();
				}
			}
			else{
				pageNext = "/NhanSu/NhanXetKetQuaThuViec/NhanXetKetQuaThuViec.jsp?error=KetThuc";
				request.setAttribute("KetThuc", ketthuc);
			}
		}
		
		try {
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostSave(HttpServletRequest request,HttpServletResponse response){
		String MaNhanXet = request.getParameter("MaNhanXet");
		String mes = "";
		int kq = NhanXetKetQuaThuViecDAO.updateNhanXetKetQuaThuViec(MaNhanXet,
				StringUtil.toUTF8(request.getParameter("areaNoiDung1").trim()),
					StringUtil.toUTF8(request.getParameter("areaNoiDung2").trim()),
						StringUtil.toUTF8(request.getParameter("areaNoiDung3").trim()), 
								StringUtil.toUTF8(request.getParameter("areaNoiDung4").trim()), 
								"0");
		try {
			
			if (kq != -1) {
				mes = "Cập Nhật Thành Công !!!";
			}else{
				mes = "Cập Nhật Thất Bại !!!";
			}
			request.setAttribute("mes", mes);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/NhanXetKetQuaThuViec/NhanXetKetQuaThuViec.jsp?id="+MaNhanXet);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostSend(HttpServletRequest request,HttpServletResponse response){
		String MaNhanXet = request.getParameter("MaNhanXet");
		NhanXetKetQuaThuViecDAO.updateNhanXetKetQuaThuViec(MaNhanXet,
				StringUtil.toUTF8(request.getParameter("areaNoiDung1").trim()),
					StringUtil.toUTF8(request.getParameter("areaNoiDung2").trim()),
						StringUtil.toUTF8(request.getParameter("areaNoiDung3").trim()), 
							StringUtil.toUTF8(request.getParameter("areaNoiDung4").trim()), 
								"1");
		
		NhanXetKetQuaThuViecModel NXKQTV = NhanXetKetQuaThuViecDAO.getNhanXetById(MaNhanXet);
		
		MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(NXKQTV.getMa_truong_khoa()), "",
				MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_NHANXETKETQUATHUVIEC),
					MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_NHANXETKETQUATHUVIEC,
							"Nhận Xét Kết Quả Thử Việc Của "+ NXKQTV.getTen_nguoi_nhan_xet(), 
								NXKQTV.getTen_nguoi_nhan_xet(), 
									NXKQTV.getNgay_nhan_xet()));
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/NhanXetKetQuaThuViec/NhanXetKetQuaThuViec.jsp?id="+MaNhanXet);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostApprove(HttpServletRequest request,HttpServletResponse response){
		String MaNhanXet = request.getParameter("MaNhanXet");
		String ghiChu = request.getParameter("txtGhiChu").trim();
		
		NhanXetKetQuaThuViecDAO.ApproveNhanXetKetQuaThuViec(MaNhanXet, 
				request.getSession().getAttribute("maThanhVien").toString(), 
					ghiChu);
		
		NhanXetKetQuaThuViecModel NXKQTV = NhanXetKetQuaThuViecDAO.getNhanXetById(MaNhanXet);
		
		String tenNguoiDuyet = ThanhVienDAO.getTenThanhVien(NXKQTV.getMa_truong_khoa());
		if(ghiChu.equals("1")){
			ghiChu = "Đề Xuất Ký Hợp Đồng";
			HoSoDuTuyenDAO.updateHSDT(NXKQTV.getNguoi_nhan_xet(), ghiChu, "7");
			MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(NXKQTV.getMa_truong_khoa()), "", 
					MailDAO.getSubjectNhacNhoByChucNang(Constant.CHUCNANG_KYHOPDONGLANDAU),
						MailDAO.getContentDeXuatKyHopDongLanDau(NXKQTV.getTen_nguoi_nhan_xet(),
							tenNguoiDuyet,
								NXKQTV.getNgay_cap_nhat_cuoi(),
									ghiChu));
		}else if(ghiChu.equals("2")){
			ghiChu = "Không thích hợp với công việc !!!";
			String maHSDT = HoSoDuTuyenDAO.updateHSDT(NXKQTV.getNguoi_nhan_xet(), ghiChu, "2");
			ChiTietKHTNSDAO.GiamSoLuongDaTuyenChiTietKHTNS(NXKQTV.getVi_tri_du_tuyen());
		}
		
		MailUtil.sendEmail(NXKQTV.getEmail(), "",
				MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_NHANXETKETQUATHUVIEC),
					MailDAO.getContentApproveNhanXetKetQuaThuViec(Constant.CHUCNANG_NHANXETKETQUATHUVIEC,
							"Nhận Xét Kết Quả Thử Việc Của "+ NXKQTV.getTen_nguoi_nhan_xet(),
								NXKQTV.getTen_nguoi_nhan_xet(),
									NXKQTV.getNgay_nhan_xet(),
										tenNguoiDuyet, 
											NXKQTV.getNgay_cap_nhat_cuoi(),
												ghiChu));
														
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/NhanXetKetQuaThuViec/showNhanXetKetQuaThuViec.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostReject(HttpServletRequest request,HttpServletResponse response){
		String MaNhanXet = request.getParameter("MaNhanXet");
		String lyDoReject = StringUtil.toUTF8(request.getParameter("txtLyDoReject").toString().trim());
		
		NhanXetKetQuaThuViecDAO.RejectNhanXetKetQuaThuViec(MaNhanXet, lyDoReject);
		
		NhanXetKetQuaThuViecModel NXKQTV = NhanXetKetQuaThuViecDAO.getNhanXetById(MaNhanXet);
		
		String tenNguoiDuyet = ThanhVienDAO.getTenThanhVien(NXKQTV.getMa_truong_khoa());
		
		MailUtil.sendEmail(NXKQTV.getEmail(), "",
				MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_NHANXETKETQUATHUVIEC),
					MailDAO.getContentRejectByChucNangCoLyDoReject(Constant.CHUCNANG_NHANXETKETQUATHUVIEC,
							"Nhận Xét Kết Quả Thử Việc Của "+ NXKQTV.getTen_nguoi_nhan_xet(),
								NXKQTV.getTen_nguoi_nhan_xet(),
									NXKQTV.getNgay_nhan_xet(),
										tenNguoiDuyet, 
											NXKQTV.getNgay_cap_nhat_cuoi(),
												lyDoReject));
														
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/NhanXetKetQuaThuViec/showNhanXetKetQuaThuViec.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostSearch(HttpServletRequest request,HttpServletResponse response){
		String msg = request.getParameter("selectTinhTrang");
		if(msg.equals("All")){
			msg = "";
		}
		try {
				RequestDispatcher rd = request.getRequestDispatcher("NhanSu/NhanXetKetQuaThuViec/showNhanXetKetQuaThuViec.jsp?msg="+msg);
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
