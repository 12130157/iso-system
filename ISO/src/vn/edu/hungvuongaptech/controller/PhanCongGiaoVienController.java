package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.util.LogUtil;

public class PhanCongGiaoVienController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    boolean check = true;
    private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	private String tenThanhVien = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhanCongGiaoVienController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		tenThanhVien = (String)request.getSession().getAttribute("tenDangNhap");
		phanCongGiaoVien(request, response);
		
	}
	
	
	private void phanCongGiaoVien(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("iso.PhanCongGiaoVienShortPath");
		//RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		String khoa = "", namBatDau = "", hocKi = "";
		khoa = request.getParameter("cboKhoa");
		namBatDau = request.getParameter("cboNamHoc");
		hocKi = request.getParameter("cboHocKi");
		
		LogUtil.logInfo(loggerInfo, tenThanhVien + " tìm lịch sử dụng phòng"); // ghi vào file log
		pageNext += "?khoa=" + khoa + "&namBatDau=" + namBatDau + "&hocKi=" + hocKi;
		response.sendRedirect(pageNext);
	}
}
