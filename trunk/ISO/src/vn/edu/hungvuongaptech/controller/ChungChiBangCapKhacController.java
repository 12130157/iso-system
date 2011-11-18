package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.dao.ChungChiBangCapKhacDAO;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ChungChiBangCapKhacController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("create")){
			doPostCreate(request, response);
		}
	}
	
	private void doPostCreate(HttpServletRequest request,HttpServletResponse response){
		String kq = ChungChiBangCapKhacDAO.insertChungChiBangCapKhac(StringUtil.toUTF8(request.getParameter("txtTen")), request.getParameter("txtLoai"), request.getParameter("txtDoUuTien"));
		String msg = "";
		if(!kq.equals("-1")){
			msg = "Thêm Chứng Chỉ/ Bằng Cấp thành công !!!";
		}else{
			msg = "Thêm Chứng Chỉ/ Bằng Cấp không thành công !!!";
		}
		request.setAttribute("error", msg);
		try {
			RequestDispatcher rd = request.getRequestDispatcher("NhanSu/TimKiemNhanSu/ChungChiBangCapKhac.jsp?loai=1");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
