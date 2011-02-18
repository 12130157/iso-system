package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;

public class ReportController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("phanloai") != null)
		{
			phanLoaiCongTac(request, response);
		}
	}
	
	private void phanLoaiCongTac(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String tinhTrang = "", tuan = "", maNam = "", maKhoa = "";
		tinhTrang = request.getParameter("cboTinhTrang");
		tuan = request.getParameter("cboTuan");
		maKhoa = request.getParameter("txtKhoa");
		if(request.getParameter("cboNam") != null){
			maNam = request.getParameter("cboNam");
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.reportPath")
				+ "?tinhTrang=" + tinhTrang + "&tuan=" + tuan + "&maNam=" + maNam + "&khoa=" + maKhoa);	
	}
}
