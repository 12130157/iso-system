package vn.edu.hungvuongaptech.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.dao.QuaTrinhCongTacDAO;
import vn.edu.hungvuongaptech.util.DateUtil;

public class QuaTrinhCongTacController extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response){
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response){
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("create")){
			doPostCreate(request, response);
		}
	}
	
	private void doPostCreate(HttpServletRequest request,HttpServletResponse response){
		String kq = QuaTrinhCongTacDAO.insertQuaTrinhCongTac(request.getParameter("maThanhVien"), DateUtil.changeDMYtoMDY(request.getParameter("txtNgayNhanChuc").toString()), request.getParameter("txtChucVu"));
		String error = "";
		if(!kq.equals("-1")){
			error = "Thêm Quá Trình Công Tác thành công !!!";
		}else{
			error = "Thêm Quá Trình Công Tác không thành công !!!";
		}
		try {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/TimKiemNhanSu/QuaTrinhCongTac.jsp?maThanhVien="+request.getParameter("maThanhVien"));
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
