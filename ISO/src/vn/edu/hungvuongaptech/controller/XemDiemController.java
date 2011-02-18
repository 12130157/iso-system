package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietDiemDAO;
import vn.edu.hungvuongaptech.dao.DangKyMonHocDAO;
import vn.edu.hungvuongaptech.model.BaiKiemTraModel;
import vn.edu.hungvuongaptech.model.ChiTietDiemModel;
import vn.edu.hungvuongaptech.model.DangKyMonHocModel;
import vn.edu.hungvuongaptech.model.DeCuongMonHocModel;

public class XemDiemController extends HttpServlet{
	private boolean check = true;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType = request.getParameter("actionType");
		
		if(actionType.equalsIgnoreCase("SinhVien"))
		{
			doPostSinhVien(request, response);
		}
		else if(actionType.equalsIgnoreCase("GiaoVien"))
		{
			searchOfGiaoVien(request, response);
		}
		else if(actionType.equalsIgnoreCase("CapNhatDiem")) {
			doPostGiaoVien(request, response);
		}
	}
	
	private void doPostSinhVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String maSinhVien = request.getParameter("cboTenSV");
		String hocKi = request.getParameter("cboHocKy");
		String namHoc = request.getParameter("cboNamHoc");
		String pageNext = Constant.PATH_RES.getString("xemDiem.showDiemShortPath") + "?maSinhVien=" + maSinhVien + "&hocKyChon=" + hocKi + "&namHoc=" + namHoc;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);
	}
	private void searchOfGiaoVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String maKhoa = request.getParameter("cboKhoa");
		String maLop = request.getParameter("cboLopHoc");
		String maNamHoc = request.getParameter("cboNamHoc");
		String hocki = request.getParameter("cboHocKy");
		String maMonHocTKB = request.getParameter("cboMonHoc");
		String maMonHoc = request.getParameter("txtMaMonHoc");
		String maGiaoVien = request.getParameter("txtMaGiaoVien");
		String pageNext = Constant.PATH_RES.getString("xemDiem.showDiemShortPath") + "?khoa=" + maKhoa + "&lop=" + maLop + "&namHoc=" + maNamHoc + "&hocKi=" + hocki + "&monHocTKB=" + maMonHocTKB + "&monHoc=" + maMonHoc + "&maGiaoVien=" + maGiaoVien;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);
	}
	private void doPostGiaoVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		check = true;
		String maKhoa = request.getParameter("cboKhoa");
		String maLop = request.getParameter("cboLopHoc");
		String maNamHoc = request.getParameter("cboNamHoc");
		String hocki = request.getParameter("cboHocKy");
		String maMonHocTKB = request.getParameter("cboMonHoc");
		String maMonHoc = request.getParameter("txtMaMonHoc");
		String maGiaoVien = request.getParameter("txtMaGiaoVien");
		String pageNext = Constant.PATH_RES.getString("xemDiem.showDiemShortPath") + "?khoa=" + maKhoa + "&lop=" + maLop + "&namHoc=" + maNamHoc + "&hocKi=" + hocki + "&monHocTKB=" + maMonHocTKB + "&monHoc=" + maMonHoc + "&maGiaoVien=" + maGiaoVien;
		RequestDispatcher rd;		
		ArrayList<DangKyMonHocModel> dangKyMonHocList = new ArrayList<DangKyMonHocModel>();		
		request.setCharacterEncoding("UTF-8");
		
		if(request.getSession().getAttribute("SinhVienList") != null){
			dangKyMonHocList = (ArrayList<DangKyMonHocModel>) request.getSession().getAttribute("SinhVienList");
		}
		mapParameter(request, response, dangKyMonHocList);
		for(int i=0;i<dangKyMonHocList.size();i++) {
			if(DangKyMonHocDAO.updateDangKyMonHoc(dangKyMonHocList.get(i)) == false)
				check = false;
		}
		if(check)
			pageNext += "&CapNhat=ThanhCong";
		else
			pageNext += "&Error=KoThanhCong";
		request.setAttribute(Constant.DANG_KY_MON_HOC_LIST, dangKyMonHocList);
		rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
	private void mapParameter(HttpServletRequest request, HttpServletResponse response, ArrayList<DangKyMonHocModel> list) throws ServletException, IOException {
		ArrayList<BaiKiemTraModel> baiKiemTraList = new ArrayList<BaiKiemTraModel>();
		if(request.getSession().getAttribute("BaiKiemTraList") != null)
			baiKiemTraList = (ArrayList<BaiKiemTraModel>)request.getSession().getAttribute("BaiKiemTraList");
		for(Integer i=1;i<=list.size();i++) {
			String maDangKiMonHoc = request.getParameter("txtDangKiMonHoc" + i.toString());
			DangKyMonHocModel dangKyMonHoc = list.get(i-1);
			dangKyMonHoc.setDiemTrungBinh(request.getParameter("txtTrungBinhMon" + i.toString()));
			ArrayList<ChiTietDiemModel> chiTietDiemList = new ArrayList<ChiTietDiemModel>();
			for(Integer j=0;j<baiKiemTraList.size();j++) {
				ChiTietDiemModel chiTietDiem = new ChiTietDiemModel();
				
				if(dangKyMonHoc.getChiTietDiemList() != null && j < dangKyMonHoc.getChiTietDiemList().size()) 
					chiTietDiem = dangKyMonHoc.getChiTietDiemList().get(j);
				
					chiTietDiem.setMaBaiKiemTra(baiKiemTraList.get(j).getMaBaiKiemTra());
					chiTietDiem.setMaDangKyMonHoc(maDangKiMonHoc);
				
					if(!request.getParameter("txtDiem" + i.toString() + "_" + j.toString()).equals("")){
						chiTietDiem.setDiem(request.getParameter("txtDiem" + i.toString() + "_" + j.toString()));
						
						/*if(chiTietDiem.getMaChiTietDiem() != null) {
							
							ChiTietDiemDAO.updateChiTietDiem(chiTietDiem);
						} else
							ChiTietDiemDAO.insertChiTietDiem(chiTietDiem);*/
						
					} else {
						/*if(chiTietDiem.getMaChiTietDiem() != null)
							ChiTietDiemDAO.deleteChiTietDiem(chiTietDiem.getMaChiTietDiem());*/
						chiTietDiem.setDiem("-1");
					}
					chiTietDiemList.add(chiTietDiem);
				
			}
			dangKyMonHoc.setChiTietDiemList(chiTietDiemList);
			list.set(i-1, dangKyMonHoc);
		}
	}
}
