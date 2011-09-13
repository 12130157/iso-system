package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.junit.runner.Request;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO;
import vn.edu.hungvuongaptech.dao.DiemDanhDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.DiemDanhModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class DiemDanhController extends HttpServlet {
	
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
		
		String actionType = request.getParameter("actionType").toString();
		if(actionType.equalsIgnoreCase("GiaoVienLogin")){
		String iDCard = request.getParameter("txtID").toString();// lay toan bo ky tu trong card
			if(iDCard.length()>=18)
			{
				String txtID = "";
				char test[] = iDCard.toCharArray();
				String regex = "[0-9]";
				for (int i = 0; i < test.length; i++) {
					String tmp = test[i]+"";
					if(tmp.matches(regex)){
						txtID = iDCard.substring(i, i+16);
						break;
					}
				}
				String loaiDiemDanh = request.getParameter("DDSinhVien").toString();
				ThanhVienModel thanhVienModel = DiemDanhDAO.getMaThanhVienByMaThe(txtID);
				if(loaiDiemDanh.equalsIgnoreCase("DiemDanh"))
				{
					if(ChiTietThanhVienDAO.timChiTietThanhVienByCard(txtID) != null){//chuyen qua list sinh vien
						if(DiemDanhDAO.UpdateTinhTrangDiemDanhGV(thanhVienModel.getMaThanhVien())){
							response.sendRedirect(Constant.PATH_RES
									.getString("Admin.ListDiemDanhSinhVien")
									+ "?IDThe=" + thanhVienModel.getMaThanhVien());
						}else{
							response.sendRedirect(Constant.PATH_RES
									.getString("Admin.GiaoVienDiemDanh")
									+ "?err=GiaoVienKhongCoTiet");
						}
					}else{
						response.sendRedirect(Constant.PATH_RES
								.getString("Admin.GiaoVienDiemDanh")
								+ "?err=KhongLaGiaoVien");
					}
				}
				else if(loaiDiemDanh.equalsIgnoreCase("DiemDanhOnline"))
				{
					if(ChiTietThanhVienDAO.timChiTietThanhVienByCard(txtID) != null){//chuyen qua list sinh vien
						if(DiemDanhDAO.UpdateTinhTrangDiemDanhGV(thanhVienModel.getMaThanhVien())){
							response.sendRedirect(Constant.PATH_RES
									.getString("Admin.ListDiemDanhOnline")
									+ "?IDThe=" + thanhVienModel.getMaThanhVien());
						}else{
							response.sendRedirect(Constant.PATH_RES
									.getString("Admin.GiaoVienDiemDanh")
									+ "?err=GiaoVienKhongCoTiet");
						}
					}else{
						response.sendRedirect(Constant.PATH_RES
								.getString("Admin.GiaoVienDiemDanh")
								+ "?err=KhongLaGiaoVien");
					}
				}
			}
			else
			{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.GiaoVienDiemDanh")
						+ "?err=khongdukitu");
			}
				
		}else if(actionType.equalsIgnoreCase("DDSinhVien")){
			String iDCard = request.getParameter("txtIDSinhVien").toString();
			String maGiaoVien = request.getParameter("maGiaoVien").toString();
			if(iDCard.length()>=18)
			{
				String maDiemDanh = "";
				char test[] = iDCard.toCharArray();
				String regex = "[0-9]";
				for (int i = 0; i < test.length; i++) {
					String tmp = test[i]+"";
					if(tmp.matches(regex)){
						maDiemDanh = iDCard.substring(i, i+16);
						break;
					}
				}
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				thanhVienModel = ThanhVienDAO.getThanhVienByMaDiemDanh(maDiemDanh);
				// bat loi khi nhap sai 
				if(thanhVienModel.getMaThanhVien()==null){
					response.sendRedirect(Constant.PATH_RES
							.getString("Admin.ListDiemDanhSinhVien")
							+ "?IDThe=" + maGiaoVien + "&TinhTrang=ThatBai" );
					
				}
				else{
						//set quet lan 3 
					if(thanhVienModel.getMaVaiTro().equalsIgnoreCase("9")){	
						DiemDanhModel diemDanhModel = new DiemDanhModel();
						diemDanhModel = DiemDanhDAO.getMaTVDDByMaThanhVien(thanhVienModel.getMaThanhVien(),maGiaoVien);
						//set coi quet lan 2 hay lan 4  
						if(diemDanhModel.getTinhTrang().equalsIgnoreCase("1")){
							if(DiemDanhDAO.updateTinhTrangSinhVien(diemDanhModel)){
									ThanhVienModel mm = DiemDanhDAO.getThanhVienByCard(thanhVienModel.getMaThanhVien());
									request.setAttribute("thongTinDiemDanh", mm);
									RequestDispatcher rd = request.getRequestDispatcher(Constant.PATH_RES
									.getString("Admin.ShortListDiemDanhSinhVien")
									+ "?IDThe=" + maGiaoVien+ "&tt=lan2"+"&maTV="+thanhVienModel.getMaThanhVien());
									rd.forward(request, response);
							}
						 }
						else if(diemDanhModel.getTinhTrang().equalsIgnoreCase("2")){
										ThanhVienModel mm = DiemDanhDAO.getThanhVienByCard(thanhVienModel.getMaThanhVien());
										request.setAttribute("thongTinDiemDanh", mm);
										//response.sendRedirect(Constant.PATH_RES
										//.getString("Admix.ListDiemDanhSinhVien")
										//+ "?IDThe=" + maGiaoVien+ "&tt=daquet2"+"&maTV="+thanhVienModel.getMaThanhVien());
										RequestDispatcher rd = request.getRequestDispatcher(Constant.PATH_RES
												.getString("Admin.ShortListDiemDanhSinhVien")
												+ "?IDThe=" + maGiaoVien+ "&tt=daquet2"+"&maTV="+thanhVienModel.getMaThanhVien());
										rd.forward(request, response);
						}
						else if(diemDanhModel.getTinhTrang().equalsIgnoreCase("3")){
								 //quet lan 4
								 if(DiemDanhDAO.updateTinhTrangSinhVien2(diemDanhModel)){
									 ThanhVienModel mm = DiemDanhDAO.getThanhVienByCard(thanhVienModel.getMaThanhVien());
										request.setAttribute("thongTinDiemDanh", mm);
										RequestDispatcher rd = request.getRequestDispatcher(Constant.PATH_RES
										.getString("Admin.ShortListDiemDanhSinhVien")
										+ "?IDThe=" + maGiaoVien+ "&tt=lan4"+"&maTV="+thanhVienModel.getMaThanhVien());
										rd.forward(request, response);
									}
						}
						else if(diemDanhModel.getTinhTrang().equalsIgnoreCase("4")){
								 //quet lan 4 2 lan 
								// if(DiemDanhDAO.updateTinhTrangSinhVien2(diemDanhModel)){
									 ThanhVienModel mm = DiemDanhDAO.getThanhVienByCard(thanhVienModel.getMaThanhVien());
										request.setAttribute("thongTinDiemDanh", mm);
										RequestDispatcher rd = request.getRequestDispatcher(Constant.PATH_RES
										.getString("Admin.ShortListDiemDanhSinhVien")
										+ "?IDThe=" + maGiaoVien+ "&tt=lan4"+"&maTV="+thanhVienModel.getMaThanhVien());
										rd.forward(request, response);
									//}
						}
							}
						else{
							if(DiemDanhDAO.UpdateTinhTrangDiemDanhGV2(thanhVienModel.getMaThanhVien())){
								response.sendRedirect(Constant.PATH_RES
										.getString("Admin.ListDiemDanhSinhVien")
										+ "?IDThe=" + thanhVienModel.getMaThanhVien()+"&tt=lan3");
							}
						}
					}
			}
			else
			{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.ListDiemDanhSinhVien")
						+ "?IDThe=" + maGiaoVien + "&err=khongdukitu" );
			}
		}
		else if(actionType.equalsIgnoreCase("DDOnlineSinhVien")){
			String maGiaoVien = request.getParameter("maGiaoVien").toString();
			int listSinhVienSize = Integer.parseInt(request.getParameter("listSinhVien").toString());
			DiemDanhModel model = new DiemDanhModel();
			boolean rs = false ;
			for(int i = 1; i<listSinhVienSize;i++)
			{
				
				if(request.getParameter("checkbox"+i)!=null)
				{
					model.setMaThanhVienDiemDanh(request.getParameter("checkbox"+i).toString()) ;
					if(DiemDanhDAO.updateSinhVienOnline(model))
					{
						rs= true;
					}
					else
					{
						rs = false; 
						break;
					}
				}
			}
			if(rs)
			{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.ListDiemDanhOnline")
						+ "?IDThe=" + maGiaoVien+"&tt=quetonline");
			}
			else
			{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.ListDiemDanhOnline")
						+ "?IDThe=" + maGiaoVien+"&tt=thatbai");
			}
			
		}
		// Get Giao Vien theo Dieu Kien
		else if(actionType.equalsIgnoreCase("HienThiTTGV"))
		{
			String Khoa = request.getParameter("cboKhoa");
			String Lop = request.getParameter("cboLop");
			String NamHoc = request.getParameter("cboNamHoc");
			String GiaoVien = request.getParameter("cboGiaoVien");
			String MonHoc = request.getParameter("cboMonHoc");
			String ThoiGian = request.getParameter("cboThoiGian");
			response.sendRedirect(Constant.PATH_RES
									.getString("DiemDanh.BaoCaoDiemDanhGV")+
									"?Khoa=" +Khoa +"&Lop="+Lop+"&NamHoc="+NamHoc +"&GiaoVien="+GiaoVien
									+"&MonHoc="+MonHoc+"&ThoiGian="+ThoiGian);
			
		}
	}
}















