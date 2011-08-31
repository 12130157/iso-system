package vn.edu.hungvuongaptech.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.DonXinThoiViecDAO;
import vn.edu.hungvuongaptech.dao.HoSoDuTuyenDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.DonXinThoiViecModel;
import vn.edu.hungvuongaptech.model.HoSoDuTuyenModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class DonXinThoiViecController extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		String action = request.getParameter("action");
		if(action.equals("create")){
			doPostCreate(request,response);
		}else if(action.equals("save")){
			doPostSave(request,response);
		}else if(action.equals("send")){
			doPostSend(request,response);
		}else if(action.equals("approve")){
			doPostApprove(request,response);
		}else if(action.equals("reject")){
			doPostReject(request,response);
		}
	}
	
	private void doPostCreate(HttpServletRequest request,HttpServletResponse response){
		HoSoDuTuyenModel model = HoSoDuTuyenDAO.getHoSoByTenDangNhap(request.getSession().getAttribute("tenDangNhap").toString());
		String kq = "-1";
		String pageNext = "";
		if(model!=null){
			kq = DonXinThoiViecDAO.insertDonXinThoiViec(model.getId());
		}
		
		if(!kq.equals("-1")){
			pageNext = "/NhanSu/DonXinThoiViec/DonXinThoiViec.jsp?id="+kq;
		}else {
			pageNext = "/NhanSu/DonXinThoiViec/showDonXinThoiViec.jsp";
		}
		
		try {
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostSave(HttpServletRequest request,HttpServletResponse response){
		String kq = DonXinThoiViecDAO.updateDonXinThoiViec(request.getParameter("id"),
					StringUtil.toUTF8(request.getParameter("txtLyDo")),
					DateUtil.changeDMYtoMDY(request.getParameter("txtNgayThoiViec")),
					"0");
		String error = "";
		if(!kq.equals("-1")){
			error = "Cập Nhật Thành Công !!!";
		}else{
			error = "Cập Nhật Thất Bại !!!";
		}
		
		try {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DonXinThoiViec/DonXinThoiViec.jsp?id="+request.getParameter("id"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostSend(HttpServletRequest request,HttpServletResponse response){
		String kq = DonXinThoiViecDAO.updateDonXinThoiViec(request.getParameter("id"),
				StringUtil.toUTF8(request.getParameter("txtLyDo")),
				DateUtil.changeDMYtoMDY(request.getParameter("txtNgayThoiViec")),
				"1");
		String error = "";
		if(!kq.equals("-1")){
			error = "Cập Nhật Thành Công !!!";
			DonXinThoiViecModel model = DonXinThoiViecDAO.getDonXinThoiViecByMaDonXinThoiViec(kq);
			MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(model.getMaTruongKhoa()),
					"",
					MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_DONXINTHOIVIEC),
					MailDAO.getContentApproveByChucNang_NhanSu(Constant.CHUCNANG_DONXINTHOIVIEC,
							"Đơn Xin Thôi Việc "+ model.getTenNguoiDuTuyen(),
							model.getTenNguoiDuTuyen(),
							model.getNgayLap(),
							model.getTenTruongKhoa(),
							model.getNgayTKduyetDMY(),
							model.getTenPhongDT(),
							model.getNgayDTduyetDMY(),
							model.getTenPhongHC(),
							model.getNgayHCduyetDMY(),
							model.getHieuTruong(),
							model.getNgayHTduyetDMY()));
		}else{
			error = "Cập Nhật Thất Bại !!!";
		}
		
		try {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DonXinThoiViec/DonXinThoiViec.jsp?id="+request.getParameter("id"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostApprove(HttpServletRequest request,HttpServletResponse response){
		String kq = DonXinThoiViecDAO.updateDonXinThoiViec_Approve(request.getParameter("id"), request.getSession().getAttribute("maThanhVien").toString());
		String error = "";
		if(!kq.equals("-1")){
			error = "Cập Nhật Thành Công !!!";
			DonXinThoiViecModel model = DonXinThoiViecDAO.getDonXinThoiViecByMaDonXinThoiViec(kq);
			ArrayList<String> mailto = new ArrayList<String>();

			if(model.getTinhTrang().equals("5")){
				ChiTietThanhVienModel chiTietThanhVien = ThanhVienDAO.XemChiTietThanhVienByMaThanhVien(model.getMaThanhVien());
				ThanhVienDAO.updateTinhTrangNhanSu("0", chiTietThanhVien.getTenDangNhap());
				HoSoDuTuyenDAO.updateHSDT(model.getNguoiDuTuyen(), "Xin Thôi Việc", "11");
			}
			else{
				if(model.getTinhTrang().equals("2")){
					mailto.addAll(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC));
					mailto.addAll(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT));
				}
				
				if(model.getTinhTrang().equals("4")){
					mailto.addAll(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH));
				}
				

				
				MailUtil.sendEmailToBoPhan(mailto, 
						MailDAO.getMailListByMaBoPhan(""),
						MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_DONXINTHOIVIEC),
						MailDAO.getContentApproveByChucNang_NhanSu(Constant.CHUCNANG_DONXINTHOIVIEC,
								"Đơn Xin Thôi Việc "+ model.getTenNguoiDuTuyen(),
								model.getTenNguoiDuTuyen(),
								model.getNgayLap(),
								model.getTenTruongKhoa(),
								model.getNgayTKduyetDMY(),
								model.getTenPhongDT(),
								model.getNgayDTduyetDMY(),
								model.getTenPhongHC(),
								model.getNgayHCduyetDMY(),
								model.getHieuTruong(),
								model.getNgayHTduyetDMY()));
			}
			
		}else{
			error = "Cập Nhật Thất Bại !!!";
		}
		
		try {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DonXinThoiViec/DonXinThoiViec.jsp?id="+request.getParameter("id"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostReject(HttpServletRequest request,HttpServletResponse response){
		String kq = DonXinThoiViecDAO.updateDonXinThoiViec_Reject(request.getParameter("id"), request.getParameter("txtLyDoReject"));
		if(!kq.equals("-1")){
			DonXinThoiViecModel model = DonXinThoiViecDAO.getDonXinThoiViecByMaDonXinThoiViec(kq);
			MailUtil.sendEmail(MailDAO.getMailByMaThanhVien(model.getMaThanhVien()),
					"",
					MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_DONXINTHOIVIEC),
					MailDAO.getContentRejectByChucNangCoLyDoReject(Constant.CHUCNANG_DONXINTHOIVIEC,
							"Đơn Xin Thôi Việc "+ model.getTenNguoiDuTuyen(),
							model.getTenNguoiDuTuyen(),
							model.getNgayLap(),
							ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString()),
							model.getNgayCapNhatCuoi(),
							model.getLyDoReject()));
		}
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/DonXinThoiViec/showDonXinThoiViec.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
