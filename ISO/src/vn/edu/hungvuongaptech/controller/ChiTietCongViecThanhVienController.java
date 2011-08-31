package vn.edu.hungvuongaptech.controller;

import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.dao.ChiTietCongViecThanhVienDAO;
import vn.edu.hungvuongaptech.dao.NamHocDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.NamHocModel;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ChiTietCongViecThanhVienController extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		String action = request.getParameter("action");
		if(action.equals("Update")){
			doPostUpdate(request,response);
		}else if(action.equals("Create")){
			doPostCreate(request,response);
		}
	}
	
	private void doPostUpdate(HttpServletRequest request,HttpServletResponse response) {
		String error = "";
		String nextPage = "";
		int kq = ChiTietCongViecThanhVienDAO.updateChiTietCongViecThanhVien(request.getParameter("maKTKL"),
				StringUtil.toUTF8(request.getParameter("txtNoiDung")), request.getParameter("txtLoaiGhiChu"));
		if(kq!=-1){
			error = "Cập Nhật Thành Công !!!";
			nextPage = "/NhanSu/TimKiemNhanSu/boSungKhenThuongKyLuat.jsp?maThanhVien="+request.getParameter("maThanhVien");
		}else{
			error = "Cập Nhật Thất Bại !!!";
			nextPage = "/NhanSu/TimKiemNhanSu/boSungKhenThuongKyLuat.jsp?maThanhVien="+request.getParameter("maThanhVien")+"&&maKTKL="+request.getParameter("maKTKL");
		}
		request.setAttribute("error", error);
		try {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void doPostCreate(HttpServletRequest request,HttpServletResponse response) {
		String error = "";
		NamHocModel namHoc = NamHocDAO.getNamHocByNamBatDau(SysParamsDAO.getNamHeThong());
		int kq = ChiTietCongViecThanhVienDAO.insertChiTietCongViecThanhVien(namHoc.getMaNamHoc(),
				request.getParameter("maThanhVien").toString(),
				ThanhVienDAO.getMaChucVuByMaThanhVien(request.getParameter("maThanhVien").toString()),
				StringUtil.toUTF8(request.getParameter("txtNoiDung")), request.getParameter("txtLoaiGhiChu"));
				
		if(kq!=-1){
			error = "Bổ Sung Thành Công !!!";
		}else{
			error = "Bổ Sung Nhật Thất Bại !!!";
		}
		request.setAttribute("error", error);
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/TimKiemNhanSu/boSungKhenThuongKyLuat.jsp?maThanhVien="+request.getParameter("maThanhVien"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
