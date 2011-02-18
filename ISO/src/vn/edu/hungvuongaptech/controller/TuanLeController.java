package vn.edu.hungvuongaptech.controller;
import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.KhoaDAO;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.dao.ChuyenNganhDAO;
import vn.edu.hungvuongaptech.dao.CongTacDAO;
import vn.edu.hungvuongaptech.dao.HocPhanDAO;
import vn.edu.hungvuongaptech.dao.LopHocDAO;
import vn.edu.hungvuongaptech.dao.MonHocDAO;
import vn.edu.hungvuongaptech.dao.PhongBanDAO;
import vn.edu.hungvuongaptech.dao.SysRoleAppDAO;
import vn.edu.hungvuongaptech.dao.SysRoleMenuDAO;
import vn.edu.hungvuongaptech.dao.TuanLeDAO;
import vn.edu.hungvuongaptech.dao.VaiTroDAO;
import vn.edu.hungvuongaptech.model.TuanLeModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

import java.util.ArrayList;
import java.util.Iterator;

public class TuanLeController extends HttpServlet{
private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	public TuanLeController(){
		 super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub	

		//String maNamHoc = request.getParameter("cboNamHoc");
		//String pageNext = Constant.PATH_RES.getString("Admin.TuanTrongNamPath");
		//pageNext += "?maNamHoc=" + maNamHoc;
		//response.sendRedirect(Constant.PATH_RES.getString("Admin.TuanTrongNamShortPath")
				//+ "?maNamHoc=" + maNamHoc);
		//RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		//rd.forward(request, response);
		String actionType = request.getParameter("actionType").toString();
		if(actionType.equalsIgnoreCase("namHoc")) 
		{
			doPostShowNam(request, response);
		} 
		else if(actionType.equalsIgnoreCase("tuanHoc")) 
		{
			doPostEditTuan(request, response);
		}
		else if (actionType.equalsIgnoreCase("themmoi"))
		{
			doPostAddNam(request,response);
		}
		
	}
	
	private void doPostShowNam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String maNamHoc = request.getParameter("cboNamHoc");
		//String pageNext = Constant.PATH_RES.getString("Admin.TuanTrongNamPath");
		//pageNext += "?maNamHoc=" + maNamHoc;
		response.sendRedirect(Constant.PATH_RES.getString("Admin.TuanTrongNamShortPath")
				+ "?maNamHoc=" + maNamHoc);
		//RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		//rd.forward(request, response);
	
	}
	
	private void doPostEditTuan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		boolean test = false ; 
		for(int i = 1 ; i <52 ; i++)
		{
			String tungay = request.getParameter("txtTuNgay" +i ) ;
			String denngay = request.getParameter("txtDenNgay"+i);
			String id = request.getParameter("id"+i);
			TuanLeModel tuan = new TuanLeModel();
			tuan.setMaTuanLe(id);
			tuan.setTuNgay(tungay) ;
			tuan.setDenNgay(denngay);
			test = TuanLeDAO.updateTuanLe(tuan);
		}
		if(test==false)
		{
			response.sendRedirect(Constant.PATH_RES.getString("Admin.TuanTrongNamShortPath")
					+ "?thatbai");
		}
		else
		{
			response.sendRedirect(Constant.PATH_RES.getString("Admin.TuanTrongNamShortPath")
					+ "?ThanhCong");
		}
	}
	
	private void doPostAddNam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	}
}
