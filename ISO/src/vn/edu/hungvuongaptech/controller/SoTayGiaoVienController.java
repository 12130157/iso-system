package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.dao.SoTayGiaoVienDAO;
import vn.edu.hungvuongaptech.util.StringUtil;

public class SoTayGiaoVienController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		String action = request.getParameter("action");
		if(action.equals("update")){
			doPostUpdate(request, response);
		}else if(action.equals("send")){
			doPostSend(request, response);
		}
	}
	
	private void doPostSend(HttpServletRequest request,HttpServletResponse response){
		String kq = SoTayGiaoVienDAO.UpdateSoTayGiaoVien(request.getParameter("id"),
				StringUtil.toUTF8(request.getParameter("QuanLyHocSinhCaBiet").trim()),
					StringUtil.toUTF8(request.getParameter("DanhGiaQuiTrinhGiangDay").trim()),
						"1");
		try {
			RequestDispatcher rd = request.getRequestDispatcher("ISO/KeHoachGiangDay/SoTayGiaoVien.jsp?id="+kq);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void doPostUpdate(HttpServletRequest request,HttpServletResponse response){
		String kq = SoTayGiaoVienDAO.UpdateSoTayGiaoVien(request.getParameter("id"),
				StringUtil.toUTF8(request.getParameter("QuanLyHocSinhCaBiet").trim()),
					StringUtil.toUTF8(request.getParameter("DanhGiaQuiTrinhGiangDay").trim()),
						"0");
		try {
			RequestDispatcher rd = request.getRequestDispatcher("ISO/KeHoachGiangDay/SoTayGiaoVien.jsp?id="+kq);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
