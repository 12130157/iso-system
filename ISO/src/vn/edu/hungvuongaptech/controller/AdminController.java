package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.zefer.html.doc.r;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.KhoaDAO;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.dao.BaiKiemTraDAO;
import vn.edu.hungvuongaptech.dao.ChuyenNganhDAO;
import vn.edu.hungvuongaptech.dao.CongTacDAO;
import vn.edu.hungvuongaptech.dao.HocPhanDAO;
import vn.edu.hungvuongaptech.dao.LopHocDAO;
import vn.edu.hungvuongaptech.dao.MonHocDAO;
import vn.edu.hungvuongaptech.dao.PhongBanDAO;
import vn.edu.hungvuongaptech.dao.SysRoleAppDAO;
import vn.edu.hungvuongaptech.dao.SysRoleMenuDAO;
import vn.edu.hungvuongaptech.dao.VaiTroDAO;
import vn.edu.hungvuongaptech.model.BaiKiemTraModel;
import vn.edu.hungvuongaptech.model.ChuyenNganhModel;
import vn.edu.hungvuongaptech.model.CongTacModel;
import vn.edu.hungvuongaptech.model.HocPhanModel;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.model.MonHocModel;
import vn.edu.hungvuongaptech.model.PhongBanModel;
import vn.edu.hungvuongaptech.model.SysRoleAppModel;
import vn.edu.hungvuongaptech.model.SysRoleMenuModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

import java.util.ArrayList;
import java.util.Iterator;

public class AdminController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	/*
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, 
	 * javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/* 
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, 
	 * javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionType = request.getParameter("actionType");
		
		
		if(actionType.equalsIgnoreCase("vaitro")){
			doPostVaiTro(request, response);
		}else if(actionType.equalsIgnoreCase("UngDung")){
			doPostUngDung(request, response);
		}else if(actionType.equalsIgnoreCase("PhanQuyen")){
			doPostPhanQuyen(request, response);
		}else if(actionType.equalsIgnoreCase("ShowMenu")){
			doPostShowMenu(request, response);
		}else if(actionType.equalsIgnoreCase("phongBan")){	
			doPostPhongBan(request, response);
		}else if(actionType.equalsIgnoreCase("MonHoc")){	
			doPostMonHoc(request, response);
		}else if(actionType.equalsIgnoreCase("lopHoc")){	
			doPostLopHoc(request, response);
		}else if(actionType.equalsIgnoreCase("chuyenNganh")){	
			doPostChuyenNganh(request, response);
		}else if (actionType.equalsIgnoreCase("Khoa_TT")){
			doPostKhoaTrungTam(request, response);
		}else if(actionType.equalsIgnoreCase("HocPhan")){
			doPostHocPhan(request, response);
		}else if(actionType.equalsIgnoreCase("PhanQuyenMenu")){
			doPostPhanQuyenMenu(request, response);
		}else if(actionType.equalsIgnoreCase("congTac")){
			doPostCongTac(request, response);
		}
	}

	private void doPostUngDung(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String actionStatus = request.getParameter("actionStatus").toString();
		SysRoleAppModel sysAppModel=new SysRoleAppModel();
		String tenAppImage=request.getParameter("txtTenAppImage");

		sysAppModel.setAppImage(StringUtil.toUTF8(tenAppImage));
		sysAppModel.setAppID(StringUtil.toUTF8(request.getParameter("txtTenID")));
		sysAppModel.setAppName(StringUtil.toUTF8(request.getParameter("txtTenAppName")));
		sysAppModel.setAppLink(StringUtil.toUTF8(request.getParameter("txtTenAppLink")));

		if(actionStatus.equalsIgnoreCase("capnhat")){	
			if(SysRoleAppDAO.updateSysApp(sysAppModel)==true){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemUngDungPath")
						+ "?err=updateTC");
			}
			else{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemUngDungPath")
						+ "?msg=updateTB");	
			}
		}
		else{
			sysAppModel.setUser1("");
			sysAppModel.setUser2("");
			sysAppModel.setUser3("");
			sysAppModel.setUser4("");
			sysAppModel.setUser5("");
			if(SysRoleAppDAO.insertSysApp(sysAppModel)==true){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemUngDungPath")
						+ "?err=insertTC");
			}
			else{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemUngDungPath")
						+ "?msg=insertTB");	
			}					
		}
	
	}
	
	private void doPostPhanQuyen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String actionStatus = StringUtil.toUTF8(request.getParameter("actionStatus"));
		
		if(actionStatus.equalsIgnoreCase("them"))
		{
			String[] roleID=request.getParameterValues("cboChuaPhanQuyen");
			
			SysRoleAppModel sysRoleAppModel;
			for(int i=0;i<roleID.length;i++){
				sysRoleAppModel=new SysRoleAppModel();
				sysRoleAppModel.setRoleID(roleID[i]);
				sysRoleAppModel.setAppID(request.getParameter("appID"));
				sysRoleAppModel.setUser1("");
				sysRoleAppModel.setUser2("");
				sysRoleAppModel.setUser3("");
				sysRoleAppModel.setUser4("");
				sysRoleAppModel.setUser5("");
				if(SysRoleAppDAO.insertSysRoleApp(sysRoleAppModel)==false){
					
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemPhanQuyenPath")
							+ "?err=insertTB&appID="+request.getParameter("appID"));
					
				}
			}
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemPhanQuyenPath")
						+ "?err=insertTC&appID="+request.getParameter("appID"));
				

		}
		else if(actionStatus.equalsIgnoreCase("huyAll")){
			String appID=request.getParameter("appID");
			ArrayList<VaiTroModel> vaiTroModel=SysRoleAppDAO.getVaiTroDaPhanQuyen(appID);
			int i=0;
			while(i<vaiTroModel.size())
			{
				if(SysRoleAppDAO.deleteSysRoleAppBy(vaiTroModel.get(i).getMaVaiTro(),appID)==false)
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemPhanQuyenPath")
							+ "?err=deleteTB&appID="+request.getParameter("appID"));					
					
				i++;
			}
			response.sendRedirect(Constant.PATH_RES
					.getString("Admin.XemPhanQuyenPath")
					+ "?err=deleteTC&appID="+request.getParameter("appID"));					
	
		}
		else if(actionStatus.equalsIgnoreCase("themAll")){
			String appID=request.getParameter("appID");
			ArrayList<VaiTroModel> vaiTroModel=SysRoleAppDAO.getVaiTroChuaPhanQuyen(appID);
			int i=0;
			SysRoleAppModel sysRoleAppModel;
			
			while(i<vaiTroModel.size())
			{
				sysRoleAppModel=new SysRoleAppModel();
				sysRoleAppModel.setRoleID(vaiTroModel.get(i).getMaVaiTro());
				sysRoleAppModel.setAppID(request.getParameter("appID"));
				sysRoleAppModel.setUser1("");
				sysRoleAppModel.setUser2("");
				sysRoleAppModel.setUser3("");
				sysRoleAppModel.setUser4("");
				sysRoleAppModel.setUser5("");			
				if(SysRoleAppDAO.insertSysRoleApp(sysRoleAppModel)==false)
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemPhanQuyenPath")
							+ "?err=insertTB&appID="+request.getParameter("appID"));					
					
				i++;
			}
			response.sendRedirect(Constant.PATH_RES
					.getString("Admin.XemPhanQuyenPath")
					+ "?err=insertTC&appID="+request.getParameter("appID"));					
	
		}
		else
		{
			String[] roleID=request.getParameterValues("cboPhanQuyen");
			
			for(int i=0;i<roleID.length;i++){
				if(SysRoleAppDAO.deleteSysRoleAppBy(roleID[i],request.getParameter("appID"))==false){
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemPhanQuyenPath")
							+ "?err=deleteTB&appID="+request.getParameter("appID"));					
				
				}
			}
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemPhanQuyenPath")
						+ "?err=deleteTC&appID="+request.getParameter("appID"));
		}

	}

	private void doPostShowMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String actionStatus=request.getParameter("actionStatus");
		if(actionStatus.equalsIgnoreCase("capnhat")){
			SysRoleMenuModel sysMenuModel=new SysRoleMenuModel();
			sysMenuModel.setRoleID(StringUtil.toUTF8(request.getParameter("txtTenID")));
			sysMenuModel.setAppID(StringUtil.toUTF8(request.getParameter("txtTenAppID")));
			sysMenuModel.setMenuName(StringUtil.toUTF8(request.getParameter("txtTenMenuName")));
			sysMenuModel.setMenuImage(request.getParameter("txtTenMenuImage"));
			sysMenuModel.setMenuLink(request.getParameter("txtTenMenuLink"));
			sysMenuModel.setUser1("");
			sysMenuModel.setUser2("");
			sysMenuModel.setUser3("");
			sysMenuModel.setUser4("");
			sysMenuModel.setUser5("");
			if(SysRoleMenuDAO.updateSysMenu(sysMenuModel)==true)
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemMenuPath")
						+ "?msg=updateTC&appID="+sysMenuModel.getAppID());
			else
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemMenuPath")
						+ "?err=updateTB&appID="+sysMenuModel.getAppID());
				
		}
		else{
				SysRoleMenuModel sysMenuModel=new SysRoleMenuModel();
				sysMenuModel.setAppID(StringUtil.toUTF8(request.getParameter("txtTenAppID")));
				sysMenuModel.setMenuName(StringUtil.toUTF8(request.getParameter("txtTenMenuName")));
				sysMenuModel.setMenuImage(request.getParameter("txtTenMenuImage"));
				sysMenuModel.setMenuLink(request.getParameter("txtTenMenuLink"));
				sysMenuModel.setUser1("");
				sysMenuModel.setUser2("");
				sysMenuModel.setUser3("");
				sysMenuModel.setUser4("");
				sysMenuModel.setUser5("");
				if(SysRoleMenuDAO.insertSysMenu(sysMenuModel)==true)
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemMenuPath")
							+ "?msg=insertTC&appID="+sysMenuModel.getAppID());
				else
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemMenuPath")
							+ "?err=insertTB&appID="+sysMenuModel.getAppID());
				
		}
		
		
	
	}

	private void doPostPhanQuyenMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String actionStatus = StringUtil.toUTF8(request.getParameter("actionStatus"));
		if(actionStatus.equalsIgnoreCase("them"))
		{
			String[] roleID=request.getParameterValues("cboChuaPhanQuyen");
			
			SysRoleMenuModel sysRoleMenuModel;
			for(int i=0;i<roleID.length;i++){
				sysRoleMenuModel=new SysRoleMenuModel();
				sysRoleMenuModel.setRoleID(roleID[i]);
				sysRoleMenuModel.setMenuID(request.getParameter("menuID"));
				sysRoleMenuModel.setUser1("");
				sysRoleMenuModel.setUser2("");
				sysRoleMenuModel.setUser3("");
				sysRoleMenuModel.setUser4("");
				sysRoleMenuModel.setUser5("");
				if(SysRoleMenuDAO.insertSysRoleMenu(sysRoleMenuModel)==false){
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemPhanQuyenMenuPath")
							+ "?err=insertTB&menuID="+request.getParameter("menuID"));
					
				}
			}
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemPhanQuyenMenuPath")
						+ "?err=insertTC&menuID="+request.getParameter("menuID"));
				

		}
		else if(actionStatus.equalsIgnoreCase("huyAll")){
			String menuID=request.getParameter("menuID");
			ArrayList<VaiTroModel> vaiTroModel=SysRoleMenuDAO.getVaiTroMenuDaPhanQuyen(menuID);
			int i=0;
			while(i<vaiTroModel.size())
			{
				if(SysRoleMenuDAO.deleteSysRoleMenuByRoleIDAndMenuID(vaiTroModel.get(i).getMaVaiTro(),menuID)==false)
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemPhanQuyenMenuPath")
							+ "?err=deleteTB&menuID="+request.getParameter("menuID"));					
					
				i++;
			}
			response.sendRedirect(Constant.PATH_RES
					.getString("Admin.XemPhanQuyenMenuPath")
					+ "?err=deleteTC&menuID="+request.getParameter("menuID"));					
	
		}
		else if(actionStatus.equalsIgnoreCase("themAll")){
			String menuID=request.getParameter("menuID");
			ArrayList<VaiTroModel> vaiTroModel=SysRoleMenuDAO.getVaiTroMenuChuaPhanQuyen(menuID);
			int i=0;
			SysRoleMenuModel sysRoleMenuModel;
			
			while(i<vaiTroModel.size())
			{
				sysRoleMenuModel=new SysRoleMenuModel();
				sysRoleMenuModel.setRoleID(vaiTroModel.get(i).getMaVaiTro());
				sysRoleMenuModel.setMenuID(request.getParameter("menuID"));
				sysRoleMenuModel.setUser1("");
				sysRoleMenuModel.setUser2("");
				sysRoleMenuModel.setUser3("");
				sysRoleMenuModel.setUser4("");
				sysRoleMenuModel.setUser5("");			
				if(SysRoleMenuDAO.insertSysRoleMenu(sysRoleMenuModel)==false)
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemPhanQuyenMenuPath")
							+ "?err=insertTB&menuID="+request.getParameter("menuID"));					
				i++;
			}
			response.sendRedirect(Constant.PATH_RES
					.getString("Admin.XemPhanQuyenMenuPath")
					+ "?err=insertTC&menuID="+request.getParameter("menuID"));					
	
		}
		else
		{
			String[] roleID=request.getParameterValues("cboPhanQuyen");
			
			for(int i=0;i<roleID.length;i++){
				if(SysRoleMenuDAO.deleteSysRoleMenuByRoleIDAndMenuID(roleID[i],request.getParameter("menuID"))==false){
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemPhanQuyenMenuPath")
							+ "?err=deleteTB&menuID="+request.getParameter("menuID"));					
				
				}
			}
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemPhanQuyenMenuPath")
						+ "?err=deleteTC&menuID="+request.getParameter("menuID"));
		}
		
	}
	
	private void doPostVaiTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//them moi
		String tenVaiTro = StringUtil.toUTF8(request.getParameter("txtTenVaiTro"));
		String ngayCapNhatCuoi = request.getParameter("txtNgayCapNhatCuoi");
		
		//cap nhat
		String tenVaiTroMoi = StringUtil.toUTF8(request.getParameter("txtTenVaiTroMoi"));
		String ngayCapNhatCuoiMoi = request.getParameter("txtNgayCapNhatCuoiMoi");
		
		if(tenVaiTro == null){//tinh trang cap nhat
			if(tenVaiTroMoi == null){
				//bao cao update vai tro that bai
				LogUtil.logInfo(loggerInfo, "update vai tro that bai");
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemVaiTroPath")
						+ "?err=updateTB");
				return;
			}else{
				String maVaiTro = request.getParameter("maVaiTro");
				VaiTroModel vaiTroModel = new VaiTroModel();
				vaiTroModel.setMaVaiTro(maVaiTro);
				vaiTroModel.setTenVaiTro(tenVaiTroMoi);
				vaiTroModel.setNgayCapNhatCuoi(ngayCapNhatCuoiMoi);
				
				if(VaiTroDAO.updateVaiTro(vaiTroModel)){// update thanh cong
						//bao cao update vai tro thanh cong
						LogUtil.logInfo(loggerInfo, "update vai tro" + tenVaiTro);
						response.sendRedirect(Constant.PATH_RES
								.getString("Admin.XemVaiTroPath")
								+ "?msg=updateTC");
						return;
				}else{
					//bao cao update vai tro that bai
					LogUtil.logInfo(loggerInfo, "update vai tro that bai");
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemVaiTroPath")
							+ "?err=updateTB");
				}
			}
		}else {//tinh trang them moi
			if(VaiTroDAO.TimTenVaiTro(tenVaiTro)){
				VaiTroModel vaiTroModel = new VaiTroModel();
					vaiTroModel.setTenVaiTro(tenVaiTro);
					vaiTroModel.setNgayCapNhatCuoi(ngayCapNhatCuoi);
				if(VaiTroDAO.insertVaiTro(vaiTroModel)){// insert thanh cong
					//bao cao isert vai tro thanh cong
					LogUtil.logInfo(loggerInfo, "insert vai tro" + tenVaiTro);
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemVaiTroPath")
							+ "?msg=insertTC");
					return;
				}else{// insert that bai
					//bao cao insert vai tro that bai
					LogUtil.logInfo(loggerInfo, "isert vai tro that bai");
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.XemVaiTroPath")
							+ "?err=insertTB");
				}
			}else{
				//bao cao insert vai tro that bai
				LogUtil.logInfo(loggerInfo, "isert vai tro that bai");
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemVaiTroPath")
						+ "?err=insertTB");
			}
		}	
	}

	private void doPostKhoaTrungTam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String maKhoa = request.getParameter("maKhoaTT");
		String tenKhoa = StringUtil.toUTF8(request.getParameter("txtTenKhoa").toString());
		String maTruongKhoa = request.getParameter("cboTruongKhoa").toString();
		String maNguoiTao = request.getSession().getAttribute("maThanhVien").toString();

		
		KhoaModel model = new KhoaModel();
		model.setMaKhoa(maKhoa);
		model.setTenKhoa(tenKhoa);
		model.setMaTruongKhoa(maTruongKhoa);
		model.setNguoiTao(maNguoiTao);
		
		if(maKhoa == null){//them moi
			if(KhoaDAO.insertKhoaTT(model)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemKhoaPath")+"?msg=msgInsert");
			}
		}else{
			if(KhoaDAO.updateKhoaTT(model)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemKhoaPath")+"?msg=msgUpdate");
			}
		}	
	}

	private void doPostPhongBan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String kiHieuPhong = StringUtil.toTrim(StringUtil.toUTF8(request.getParameter("txtKiHieu")));
		String viTri = StringUtil.toTrim(StringUtil.toUTF8(request.getParameter("txtViTri")));
		String chucNang = StringUtil.toTrim(StringUtil.toUTF8(request.getParameter("txtChucNang")));
		String sucChua = StringUtil.toTrim(request.getParameter("txtSucChua"));
		String iD = request.getParameter("idPhong");
		
		String kiHieuPhongMoi = StringUtil.toTrim(StringUtil.toUTF8(request.getParameter("txtKiHieuMoi")));
		String viTriMoi = request.getParameter("txtViTriMoi");
		String chucNangMoi = request.getParameter("txtChucNangMoi");
		String sucChuaMoi = request.getParameter("txtSucChuaMoi");
		
		if(kiHieuPhongMoi == null &&  kiHieuPhong != null){//tinh trang cap nhat
			//update phong ban
			PhongBanModel phongBanModel = new PhongBanModel();
				phongBanModel.setMaPhongBan(iD);
				phongBanModel.setChucNang(chucNang);
				phongBanModel.setKiHieu(kiHieuPhong);
				phongBanModel.setNgayCapNhatCuoi("");
				phongBanModel.setSucChua(sucChua);
				phongBanModel.setViTri(viTri);
				
			if(PhongBanDAO.updatePhongBan(phongBanModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemPhongBanPath")+"?msg=updateThanhCong");
			}else{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemPhongBanPath")+"?err=updateThatBai");
			}
		}else if(kiHieuPhongMoi != null &&  kiHieuPhong == null){//tinh trang them moi
			//insert phong ban
			PhongBanModel phongBanModel = new PhongBanModel();
			phongBanModel.setChucNang(chucNangMoi);
			phongBanModel.setKiHieu(kiHieuPhongMoi);
			phongBanModel.setNgayCapNhatCuoi("");
			phongBanModel.setSucChua(sucChuaMoi);
			phongBanModel.setViTri(viTriMoi);
			if(PhongBanDAO.insertPhongBan(phongBanModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemPhongBanPath")+"?msg=insertThanhCong");
			}else{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemPhongBanPath")+"?err=insertThatBai");
			}
		}	
	}

	private void doPostMonHoc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String nhanBiet = request.getParameter("nhanbiet");
		String pageNext = Constant.PATH_RES.getString("Admin.XemChiTietMonHocShortPath");
		MonHocModel monHocModel = new MonHocModel();
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		boolean check = true;
		int countRow = 0;
		if(request.getSession().getAttribute("MonHoc") != null)
			monHocModel = (MonHocModel) request.getSession().getAttribute("MonHoc");
		monHocModel.setTenMonHoc(StringUtil.toUTF8(request.getParameter("txtTenMonHoc")));
		monHocModel.setLyThuyet(request.getParameter("txtLyThuyet"));
		monHocModel.setKiemTra(request.getParameter("txtKiemTra"));
		monHocModel.setThucHanh(request.getParameter("txtThucHanh"));
		monHocModel.setTinhChat(StringUtil.toUTF8(request.getParameter("txtTinhChat")));
		monHocModel.setMaChuyenNganh(request.getParameter("cboChuyenNganh"));
		monHocModel.setNgayTao(null);
		monHocModel.setMaNguoiTao(request.getParameter("maNguoiTao"));
		monHocModel.setNgayCapNhatCuoi(null);
		monHocModel.setMaHocPhan(request.getParameter("cboHocPhan"));
		monHocModel.setMaTruongBoMon(request.getParameter("cboTruongBoMon"));
		//--------------------------------Tinh he so
		Float lyThuyet = Float.parseFloat(monHocModel.getLyThuyet());
		Float thucHanh = Float.parseFloat(monHocModel.getThucHanh());
		int heSo = Math.round(lyThuyet/15 + thucHanh/40);
		monHocModel.setUser1(heSo+"");
		
		//--------------------------------Tinh he so
		ArrayList<BaiKiemTraModel> baiKiemTraList = new ArrayList<BaiKiemTraModel> ();

		
		for(Integer i = 1; i <= Constant.NUM_ROW_1; i++){
			
			BaiKiemTraModel baiKiemTra = new BaiKiemTraModel();
			
			if(monHocModel.getBaiKiemTraList() != null && i <= monHocModel.getBaiKiemTraList().size())
			{
				baiKiemTra = monHocModel.getBaiKiemTraList().get(i - 1); 
			}
			baiKiemTra.setTenBaiKiemTra(StringUtil.toUTF8(request.getParameter("cboTenBaiKiemTra" + i.toString())).trim());
			baiKiemTra.setMaHinhThuc(StringUtil.toUTF8(request.getParameter("cboHinhThuc" + i.toString())));
			baiKiemTra.setThangDiem(request.getParameter("txtThangDiem" + i.toString()));
			baiKiemTra.setUser1(request.getParameter("cboHeSo" + i.toString()));
 			if(check == true){
 				for(int j=0;j<baiKiemTraList.size();j++) {
 					if(baiKiemTra.getTenBaiKiemTra().equalsIgnoreCase(baiKiemTraList.get(j).getTenBaiKiemTra()))
 					{
 						check = false;
 						break;
 					}
 				}
			}
			if(request.getParameter("xulydong") != null && request.getParameter("xulydong").equals("xoadong")
					&& request.getParameter("chk" + i.toString()) != null)
			{
				if(baiKiemTra.getMaBaiKiemTra() != null){
					BaiKiemTraDAO.deleteBaiKiemTra(baiKiemTra.getMaBaiKiemTra());
				}
				countRow++;
			}else{
				baiKiemTraList.add(baiKiemTra);
			}
		}
		monHocModel.setBaiKiemTraList(baiKiemTraList);
		
		
		if(request.getParameter("xulydong").equals("ThemDong")){
				Constant.NUM_ROW_1++;
		}
		else if(request.getParameter("xulydong").equals("xoadong"))
			{
				Constant.NUM_ROW_1 -= countRow;
				pageNext += "?xoa=DeleteTC";
				rd = request.getRequestDispatcher(pageNext);
			}
		
		
		
		
		
		
		
		
		
		else if(nhanBiet.equals("themmoi")){ //tinh trang them moi
			if(check == true) {
				if(MonHocDAO.insertMonHoc(monHocModel)){
					pageNext += "?them=insertThanhCong";
					rd = request.getRequestDispatcher(pageNext);
				}else{
					pageNext += "?errthem=insertThatBai";
					rd = request.getRequestDispatcher(pageNext);
				}
			} else {
				pageNext += "?trung=yes";
				rd = request.getRequestDispatcher(pageNext);
			}
				
		}else if(nhanBiet.equals("capnhat")){ //tinh trang cap nhat	
			if(check == true) {
				if(MonHocDAO.updateMonHoc(monHocModel)){
					pageNext += "?sua=updateThanhCong";
					rd = request.getRequestDispatcher(pageNext);
				}else{
					pageNext += "?errsua=updateThatBai";
					rd = request.getRequestDispatcher(pageNext);
				}
			} else {
				pageNext += "?trung=yes";
				rd = request.getRequestDispatcher(pageNext);
			}
		}
		request.setAttribute(Constant.MON_HOC, monHocModel);
		rd.forward(request, response);		
	}
	
	private void doPostHocPhan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String maHocPhan = request.getParameter("maHocPhan").toString();
		String tenHocPhan = StringUtil.toTrim(StringUtil.toUTF8(request.getParameter("txtTenHocPhan").trim()));
		String ghiChu = StringUtil.toUTF8(request.getParameter("txtGhichu").toString());
		
		HocPhanModel hocPhanModel = new HocPhanModel();
		hocPhanModel.setMaHocPhan(maHocPhan);
		hocPhanModel.setTenHocPhan(tenHocPhan);
		hocPhanModel.setGhiChu(ghiChu);
		
		if(maHocPhan == ""){//them moi
			if(HocPhanDAO.insertHocPhan(hocPhanModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemHocPhanPath")+"?msg=msgInsert");
			}
		}else{// cap nhat
			if(HocPhanDAO.updateHocPhan(hocPhanModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemHocPhanPath")+"?msg=msgUpdate");
			}	
		}
		
		
		
		
	}
	
	private void doPostLopHoc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String maLopHoc = request.getParameter("maLopHoc").toString();
		String kiHieu = request.getParameter("txtKiHieu").toString();
		String maLopTruong = request.getParameter("cboLopTruong");

		
		LopHocModel lopHocModel = new LopHocModel();
		
		lopHocModel.setMaLopHoc(maLopHoc);
		lopHocModel.setKiHieu(kiHieu);
		lopHocModel.setMaLopTruong(maLopTruong);
		
		if(LopHocDAO.updateLopHoc(lopHocModel)){
			response.sendRedirect(Constant.PATH_RES
					.getString("Admin.XemLopPath")+"?msg=msgUpdate");
		}
		
	}

	private void doPostChuyenNganh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String maChuyenNganh = request.getParameter("maChuyenNganh").toString();
		String tenChuyenNganh = StringUtil.toUTF8(request.getParameter("txtTenChuyenNganh"));
		String kiHieu = request.getParameter("txtKiHieu");
		String maKhoa = request.getParameter("cboTenKhoa");
		
		ChuyenNganhModel chuyenNganhModel = new ChuyenNganhModel();
		
		chuyenNganhModel.setTenChuyenNganh(tenChuyenNganh);
		chuyenNganhModel.setKiHieu(kiHieu);
		chuyenNganhModel.setMaKhoaTT(maKhoa);
		
		if(maChuyenNganh == ""){//tinh trang them moi
			if(ChuyenNganhDAO.insertChuyenNganh(chuyenNganhModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemChuyenNganhPath")+"?msg=msgInsert");
			}
			
		}else{//tinh trang cap nhat
			chuyenNganhModel.setMaChuyenNganh(maChuyenNganh);
			
			if(ChuyenNganhDAO.updateChuyenNganh(chuyenNganhModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemChuyenNganhPath")+"?msg=msgUpdate");
			}
		}
	}
	
	private void doPostCongTac(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		String maCongTac = request.getParameter("maCongTac");
		String noiDung = StringUtil.toUTF8(request.getParameter("txtNoiDung"));
		String ghiChu = StringUtil.toUTF8(request.getParameter("txtGhiChu"));
		
		CongTacModel congTacModel = new CongTacModel();
		congTacModel.setMaCongTac(maCongTac);
		congTacModel.setNoiDung(noiDung);
		congTacModel.setGhiChu(ghiChu);
		
		if(maCongTac == ""){// them moi
			if(CongTacDAO.insertCongTac(congTacModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemThemCongTacPath")+"?msg=msgInsertTC");
			}else{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemThemCongTacPath")+"?msg=msgInsertTB");
			}
		}else{// cap nhat
			if(CongTacDAO.updateCongTac(congTacModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemThemCongTacPath")+"?msg=msgUpdateTC");
			}else{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemThemCongTacPath")+"?msg=msgUpdateTB");
			}
		}
	}
	
	
}
