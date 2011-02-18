package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.util.LogUtil;
public class LichSuDungPhongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    boolean check = true;
    private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	private String tenThanhVien = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LichSuDungPhongController() {
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
		timKiemLichSuDungPhong(request, response);
		
	}
	
	
	private void timKiemLichSuDungPhong(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("iso.LichSuDungPhongShortPath");
		//RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		String maPhong = "", maKhoa = "", maNam = "", kiHieuTuan = "", maMonHoc;
		maPhong = request.getParameter("cboPhong");
		maKhoa = request.getParameter("cboKhoa");
		maMonHoc = request.getParameter("cboMonHoc");
		if(request.getParameter("cboNam") != null)
			maNam = request.getParameter("cboNam");
		if(request.getParameter("cboTuan") != null)
			kiHieuTuan = request.getParameter("cboTuan");
		LogUtil.logInfo(loggerInfo, tenThanhVien + " tìm lịch sử dụng phòng"); // ghi vào file log
		pageNext += "?maPhong=" + maPhong + "&maNam=" + maNam + "&maKhoa=" + maKhoa + "&tuan=" + kiHieuTuan + "&maMonHoc=" + maMonHoc;
		response.sendRedirect(pageNext);
	}
}
