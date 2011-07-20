package vn.edu.hungvuongaptech.controller;

import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO;
import vn.edu.hungvuongaptech.dao.KeHoachTuyenNhanSuDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.dao.ThoiGianTuyenDungDAO;
import vn.edu.hungvuongaptech.model.KeHoachTNSModel;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class KeHoachTuyenNhanSuController extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		String action = request.getParameter("action");
		if(action.equals("create")){
			CreateKeHoachTNS(request, response); 
		} else if(action.equals("new")){
			SaveKeHoachTNS(request, response);
		} else if(action.equals("send")){
			SendKeHoachTNS(request, response);
		} else if(action.equals("approve")){
			ApproveKeHoachTNS(request, response);
		} else if(action.equals("reject")) {
			RejectKeHoachTNS(request, response);
		} else if(action.equals("refresh")) {
			RefreshKeHoachTNS(request, response);
		} else if(action.equals("search")) {
			SearchKeHoachTNS(request, response);
		}
	}
	
	private void CreateKeHoachTNS(HttpServletRequest request,HttpServletResponse response){
		int MaKeHoach = KeHoachTuyenNhanSuDAO.InsertKeHoachTNS(request.getParameter("txtNam"), request.getSession().getAttribute("maThanhVien").toString());
		
		try {
			if(MaKeHoach==0){
				request.setAttribute("error", "Đã có kế hoạch tuyển nhân sự năm "+request.getParameter("txtNam")+" !!!");
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/KeHoachTuyenNhanSu/KeHoachTuyenNhanSu.jsp?Them=yes");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/KeHoachTuyenNhanSu/KeHoachTuyenNhanSu.jsp?id="+MaKeHoach);
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SendKeHoachTNS(HttpServletRequest request,HttpServletResponse response){
		int max = Integer.parseInt(request.getParameter("max").toString());
		for (int i = 1; i < max; i++) {
			if(request.getParameter("txtGhiChu"+i)!=null){
				ChiTietKHTNSDAO.UpdateChiTietKHTNS(request.getParameter("txtMaDeNghi"+i), StringUtil.toUTF8(request.getParameter("txtGhiChu"+i).toString()));
			}
			ThoiGianTuyenDungDAO.DeleteThoiGianTuyenDung(request.getParameter("txtMaDeNghi"+i));
			int soLuong = Integer.parseInt(request.getParameter("txtSoLuong"+i).toString());
			for (int j = 1; j <= soLuong; j++) {
				if(request.getParameter("txtThoiGian"+i+j)!=null){
					ThoiGianTuyenDungDAO.InsertThoiGianTuyenDung(request.getParameter("txtMaDeNghi"+i), request.getParameter("txtThoiGian"+i+j));
				}
			}
		}
		
		String MaKeHoach = KeHoachTuyenNhanSuDAO.UpdateKeHoachTNS(request.getParameter("txtMaKeHoach"), Constant.TINHTRANG_HT_SEND);
		KeHoachTNSModel KHTNS = KeHoachTuyenNhanSuDAO.getKHByID(MaKeHoach);
		MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),
				MailDAO.getMailListByMaBoPhan(""),
					MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_DENGHINHANSU),
						MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_DENGHINHANSU,
								"Kế Hoạch Tuyển Nhân Sự - "+KHTNS.getNam(),
								KHTNS.getTen_nguoi_lap_ke_hoach(),
								KHTNS.getNgay_lap_ke_hoach()));
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/KeHoachTuyenNhanSu/KeHoachTuyenNhanSu.jsp?id="+MaKeHoach);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void SaveKeHoachTNS(HttpServletRequest request,HttpServletResponse response){
		int max = Integer.parseInt(request.getParameter("max").toString());
		String mes = "";
		for (int i = 1; i < max; i++) {
			if(request.getParameter("txtGhiChu"+i)!=null){
				ChiTietKHTNSDAO.UpdateChiTietKHTNS(request.getParameter("txtMaDeNghi"+i), StringUtil.toUTF8(request.getParameter("txtGhiChu"+i).toString().trim()));
			}
			ThoiGianTuyenDungDAO.DeleteThoiGianTuyenDung(request.getParameter("txtMaDeNghi"+i));
			int soLuong = Integer.parseInt(request.getParameter("txtSoLuong"+i).toString());
			for (int j = 1; j <= soLuong; j++) {
				if(request.getParameter("txtThoiGian"+i+j)!=null){
					ThoiGianTuyenDungDAO.InsertThoiGianTuyenDung(request.getParameter("txtMaDeNghi"+i), request.getParameter("txtThoiGian"+i+j));
				}
			}
		}
		String MaKeHoach = KeHoachTuyenNhanSuDAO.UpdateKeHoachTNS(request.getParameter("txtMaKeHoach"), Constant.TINHTRANG_HT_NEW);
		int kq = Integer.parseInt(MaKeHoach);
		if (kq != 0) {
			mes = "Cập Nhật Thành Công !!!";
		}else{
			mes = "Cập Nhật Thất Bại !!!";
		}
		try {
			request.setAttribute("mes", mes);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/KeHoachTuyenNhanSu/KeHoachTuyenNhanSu.jsp?id="+MaKeHoach);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void ApproveKeHoachTNS(HttpServletRequest request,HttpServletResponse response){
		String MaKeHoach = KeHoachTuyenNhanSuDAO.ApproveKeHoachTNS(request.getParameter("txtMaKeHoach"), request.getSession().getAttribute("maThanhVien").toString());
		if(MaKeHoach!="0"){
			KeHoachTNSModel KHTNS = KeHoachTuyenNhanSuDAO.getKHByID(MaKeHoach);
			ArrayList<String> mailto = new ArrayList<String>();
			ArrayList<String> mail = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
			mailto.add(MailDAO.getMailByMaThanhVien(KHTNS.getNguoi_lap_ke_hoach()));
			MailUtil.sendEmailToBoPhan(mailto,
					mail,
						MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHTNS),
							MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_KEHOACHTNS,
									"Kế Hoạch Tuyển Nhân Sự - "+KHTNS.getNam(),
									KHTNS.getTen_nguoi_lap_ke_hoach(),
									KHTNS.getNgay_lap_ke_hoach(),
									KHTNS.getTen_nguoi_duyet(),
									KHTNS.getNgay_duyet()));
		}
			try {
				RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/KeHoachTuyenNhanSu/showKeHoachTuyenDungNhanSu.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	private void RejectKeHoachTNS(HttpServletRequest request,HttpServletResponse response){
		String MaKeHoach = KeHoachTuyenNhanSuDAO.RejectKeHoachTNS(request.getParameter("txtMaKeHoach"),StringUtil.toUTF8(request.getParameter("txtLyDoReject").toString().trim()));
		if(MaKeHoach!="0"){
			KeHoachTNSModel KHTNS = KeHoachTuyenNhanSuDAO.getKHByID(MaKeHoach);
			ArrayList<String> mailto = new ArrayList<String>();
			ArrayList<String> mail = MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
			mailto.add(MailDAO.getMailByMaThanhVien(KHTNS.getNguoi_lap_ke_hoach()));
			MailUtil.sendEmailToBoPhan(mailto,
					mail,
						MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KEHOACHTNS),
							MailDAO.getContentRejectByChucNangCoLyDoReject(Constant.CHUCNANG_KEHOACHTNS,
									"Kế Hoạch Tuyển Nhân Sự - "+KHTNS.getNam(),
									KHTNS.getTen_nguoi_lap_ke_hoach(),
									KHTNS.getNgay_lap_ke_hoach(),
									ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString()),
									KHTNS.getNgay_cap_nhat_cuoi(),
									StringUtil.toUTF8(request.getParameter("txtLyDoReject"))));
									
									
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/KeHoachTuyenNhanSu/showKeHoachTuyenDungNhanSu.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void RefreshKeHoachTNS(HttpServletRequest request,HttpServletResponse response){
		String MaKeHoach = request.getParameter("txtMaKeHoach");
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/KeHoachTuyenNhanSu/KeHoachTuyenNhanSu.jsp?id="+MaKeHoach);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private void SearchKeHoachTNS(HttpServletRequest request,HttpServletResponse response){
		String tinhTrang = request.getParameter("selectTinhTrang");
		String pageNext = "";
		if(tinhTrang.equals("All")){
			pageNext = "/NhanSu/KeHoachTuyenNhanSu/showKeHoachTuyenDungNhanSu.jsp";
		}
		else{
			pageNext = "/NhanSu/KeHoachTuyenNhanSu/showKeHoachTuyenDungNhanSu.jsp?msg="+tinhTrang;
		}   
		try {
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
}
