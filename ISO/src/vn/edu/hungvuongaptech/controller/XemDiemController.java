package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.BangDiemHocKiDAO;
import vn.edu.hungvuongaptech.dao.ChiTietDiemDAO;
import vn.edu.hungvuongaptech.dao.DangKyMonHocDAO;
import vn.edu.hungvuongaptech.dao.HocKiTungLopDAO;
import vn.edu.hungvuongaptech.dao.SoDiemMonHocDAO;
import vn.edu.hungvuongaptech.model.BaiKiemTraModel;
import vn.edu.hungvuongaptech.model.BangDiemHocKiModel;
import vn.edu.hungvuongaptech.model.ChiTietDiemModel;
import vn.edu.hungvuongaptech.model.DangKyMonHocModel;
import vn.edu.hungvuongaptech.model.DeCuongMonHocModel;
import vn.edu.hungvuongaptech.model.SoDiemMonHocModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;

public class XemDiemController extends HttpServlet{
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
		else if(actionType.equalsIgnoreCase("SinhVienTN"))
		{
			searchSinhVienTN(request,response);
		}
		else if(actionType.equalsIgnoreCase("GiaoVienTN"))
		{
			searchGiaoVienTN(request, response);
		}
		else if(actionType.equalsIgnoreCase("CapNhatDiem") || actionType.equalsIgnoreCase("GuiSoDiem")) {
			doPostGiaoVien(request, response);
		}
		else if(actionType.equalsIgnoreCase("LuuBangDiemHocKi") || actionType.equalsIgnoreCase("GuiBangDiemHocKi")) {
			tinhBangDiemHocKi(request, response);
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
		boolean check = true;
		String maNamHoc = request.getParameter("cboNamHoc");
		String hocki = request.getParameter("cboHocKy");
		String[] monHoc = request.getParameter("cboMonHoc").split("-");
		String maHKTL = request.getParameter("cboLop");
		String pageNext = Constant.PATH_RES.getString("xemDiem.showDiemShortPath") + "?MaNamHoc=" + maNamHoc + "&HocKi=" + hocki + "&maMonHoc=" + monHoc[1] + "&maMonHocTKB=" + monHoc[0] + "&maHKTL=" + maHKTL;
		RequestDispatcher rd;		
		SoDiemMonHocModel soDiemMonHoc = new SoDiemMonHocModel();	
		request.setCharacterEncoding("UTF-8");
		
		if(request.getSession().getAttribute("SoDiemMonHoc") != null){
			soDiemMonHoc = (SoDiemMonHocModel) request.getSession().getAttribute("SoDiemMonHoc");
		}
		check = mapParameter(request, response, soDiemMonHoc);
		if(request.getParameter("actionType").equalsIgnoreCase("CapNhatDiem")) {
			if(check)
				pageNext += "&CapNhat=ThanhCong";
			else
				pageNext += "&Error=KoThanhCong";
		}
		else if(request.getParameter("actionType").equalsIgnoreCase("GuiSoDiem")) {
			if(SoDiemMonHocDAO.guiSoDiemMonHocChoGVCN(soDiemMonHoc.getMaSoDiemMonHoc()) == 1 && check == true)
				pageNext += "&Gui=ThanhCong";
			else
				pageNext += "&Gui=KoThanhCong";
		}
		request.setAttribute("soDiemMonHoc", soDiemMonHoc);
		rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
	private boolean mapParameter(HttpServletRequest request, HttpServletResponse response, SoDiemMonHocModel soDiemMonHoc) throws ServletException, IOException {
		ArrayList<BaiKiemTraModel> baiKiemTraList = new ArrayList<BaiKiemTraModel>();
		boolean check = true;
		int dem = 0;
		if(request.getSession().getAttribute("BaiKiemTraList") != null)
			baiKiemTraList = (ArrayList<BaiKiemTraModel>)request.getSession().getAttribute("BaiKiemTraList");
		for(Integer i=1;i<=soDiemMonHoc.getDangKyMonHocList().size();i++) {
			dem = 0;
			String maDangKiMonHoc = request.getParameter("txtDangKiMonHoc" + i.toString());
			DangKyMonHocModel dangKyMonHoc = soDiemMonHoc.getDangKyMonHocList().get(i-1);
			dangKyMonHoc.setDiemTrungBinh(request.getParameter("txtTrungBinhMon" + i.toString()));
			ArrayList<ChiTietDiemModel> chiTietDiemList = new ArrayList<ChiTietDiemModel>();
			for(Integer j=0;j<baiKiemTraList.size();j++) {
				ChiTietDiemModel chiTietDiem = new ChiTietDiemModel();
				
				if(dangKyMonHoc.getChiTietDiemList() != null && j < dangKyMonHoc.getChiTietDiemList().size()) 
					chiTietDiem = dangKyMonHoc.getChiTietDiemList().get(j);
				
					/*if(!chiTietDiem.getMaBaiKiemTra().equals(baiKiemTraList.get(j).getMaBaiKiemTra())) {
						chiTietDiem.setMaBaiKiemTra(baiKiemTraList.get(j).getMaBaiKiemTra());
						chiTietDiem.setMaDangKyMonHoc(maDangKiMonHoc);
						
					}*/
				if(!(request.getParameter("txtDiem" + i.toString() + "_" + j.toString()).equals("")) || !chiTietDiem.getDiem().equals("-1.0")) {
					if(!chiTietDiem.getDiem().equals(request.getParameter("txtDiem" + i.toString() + "_" + j.toString()))) {
						if(request.getParameter("txtDiem" + i.toString() + "_" + j.toString()).equals(""))
							chiTietDiem.setDiem("-1.0");
						else	
							chiTietDiem.setDiem(request.getParameter("txtDiem" + i.toString() + "_" + j.toString()));
						if(!ChiTietDiemDAO.updateChiTietDiem(chiTietDiem))
							check = false;
						dem++;
					}
				}
					chiTietDiemList.add(chiTietDiem);	
			}
			if(dem > 0) {
				if(!DangKyMonHocDAO.updateDangKyMonHoc(dangKyMonHoc))
					check = false;
			}
			dangKyMonHoc.setChiTietDiemList(chiTietDiemList);
			soDiemMonHoc.getDangKyMonHocList().set(i-1, dangKyMonHoc);
		}
		return check;
	}
	
	//--------seach diem tot nghiep cua sinh vien----------//
	private void searchSinhVienTN(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String maSinhVien = request.getParameter("cboSinhVien");
		String pageNext = Constant.PATH_RES.getString("xemDiem.showDiemTotNghiepPath") + "?maSinhVien=" + maSinhVien;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);
	}
	//---------end----------//
	
	//--------seach diem tot nghiep cua giao vien----------//
	private void searchGiaoVienTN(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
	//--------end---------//
	private void tinhBangDiemHocKi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maNamHoc = request.getParameter("cboNamHoc");
		String hocKi = request.getParameter("cboHocKy");
		String[] lop = request.getParameter("cboLop").split("-");
		String pageNext = Constant.PATH_RES.getString("xemDiem.showDiemHocKyShortPath") + "?MaNamHoc=" + maNamHoc + "&HocKi=" + hocKi + "&MaHKTL=" + lop[0];
		ArrayList<ThanhVienModel> thanhVienList = new ArrayList<ThanhVienModel>();
		ArrayList<BangDiemHocKiModel> bangDiemHocKiList = new ArrayList<BangDiemHocKiModel>();
		Boolean check = true;
		if(request.getSession().getAttribute("BangDiemHocVienList") != null)
			thanhVienList = (ArrayList<ThanhVienModel>) request.getSession().getAttribute("BangDiemHocVienList");
		//if(request.getSession().getAttribute("BangDiemHocKiList") != null)
			//bangDiemHocKiList = (ArrayList<BangDiemHocKiModel>) request.getSession().getAttribute("BangDiemHocKiList");
		for(Integer i=1; i<Integer.parseInt(request.getParameter("txtCount"));i++) {
			BangDiemHocKiModel bangDiemHocKi = new BangDiemHocKiModel();
			bangDiemHocKi.setDiemTrungBinh(request.getParameter("txtDiemTrungBinh" + i.toString()));
			bangDiemHocKi.setDiemRenLuyen(request.getParameter("txtDiemRenLuyen" + i.toString()));
			bangDiemHocKi.setDiemTBHocKi(request.getParameter("txtDiemTBHocKi" + i.toString()));
			bangDiemHocKi.setHocLuc(request.getParameter("txtHocLuc" + i.toString()));
			bangDiemHocKi.setHanhKiem(request.getParameter("txtHanhKiem" + i.toString()));
			
			if(BangDiemHocKiDAO.updateBangDiemHocKi(bangDiemHocKi) == false)
				check = false;
			bangDiemHocKiList.add(bangDiemHocKi);
		}
		if(request.getParameter("actionType").equalsIgnoreCase("LuuBangDiemHocKi")) {
			if(check)
				pageNext += "&TinhTrang=" + lop[1] + "&Luu=ThanhCong";
			else
				pageNext += "&TinhTrang=" + lop[1] + "&Luu=KoThanhCong";
		} else if(request.getParameter("actionType").equalsIgnoreCase("GuiBangDiemHocKi")) {
			String tinhTrang = (Integer.parseInt(lop[1]) + 1) + "";
			if(HocKiTungLopDAO.guiSoDiemHocKiMaHocKiTungLop(lop[0], tinhTrang) && check == true) {
				pageNext += "&TinhTrang=" + tinhTrang + "&Gui=ThanhCong";
			}
			else
				pageNext += "&TinhTrang=" + lop[1] + "&Gui=KoThanhCong";
		}
		request.setAttribute("BangDiemHocVienList", thanhVienList);
		request.setAttribute("BangDiemHocKiList", bangDiemHocKiList);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
}
