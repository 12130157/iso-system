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

public class LopHocController extends HttpServlet{
private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	public LopHocController(){
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

		String lopHoc = request.getParameter("cboLop");
		response.sendRedirect(Constant.PATH_RES.getString("iso.PhanCaHoc")
				+ "?lopHoc=" + lopHoc);
				
	}
	
}