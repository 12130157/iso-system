package vn.edu.hungvuongaptech.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.dao.ChiTietKHTNSDAO;

public class ChiTietKHTNSController extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		String action = request.getParameter("action");
		if(action.equals("insert")){
			InsertCTKH(request, response);
		} 

		
	}
	
	private void InsertCTKH(HttpServletRequest request,HttpServletResponse response){
		int max = Integer.parseInt(request.getParameter("max").toString());
		for (int i = 1; i <= max; i++) {
			if(request.getParameter("txtMaDeNghi"+i)!=null){
				ChiTietKHTNSDAO.InsertChiTietKHTNS(request.getParameter("txtMaKeHoach"), request.getParameter("txtMaDeNghi"+i));
			}
		}
		try {
			request.setAttribute("close", "window.close()");
			RequestDispatcher rd = request.getRequestDispatcher("/NhanSu/KeHoachTuyenNhanSu/danhsachdenghi.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
