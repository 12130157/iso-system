package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO;
import vn.edu.hungvuongaptech.dao.CongTacThangDAO;
import vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao;
import vn.edu.hungvuongaptech.dao.KeHoachThangDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.SendMailListCongTacDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.TinhTrangCongTacDAO;
import vn.edu.hungvuongaptech.model.CongTacThangModel;
import vn.edu.hungvuongaptech.model.KeHoachThangModel;
import vn.edu.hungvuongaptech.model.SysParamsModel;
import vn.edu.hungvuongaptech.model.TinhTrangCongTacModel;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;
import vn.edu.hungvuongaptech.common.Constant;

public class KeHoachThangController extends HttpServlet{
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	private String tenThanhVien;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		tenThanhVien = (String)request.getSession().getAttribute("tenDangNhap");
		if(request.getParameter("phanloai") != null) {
			phanLoaiKeHoachThang(request, response);
		} else if(request.getParameter("them") != null) {
			themKeHoachThang(request, response);
		} else if(request.getParameter("duyet") != null){
			duyetKeHoachThang(request, response);
		} else if(request.getParameter("duyet1chuongtrinh") != null) {
			duyetMotKeHoachThang(request, response, request.getParameter("maChuongTrinh"));
		}
	}
	private void themKeHoachThang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String actionType = request.getParameter("actionType");
		String pageNext = Constant.PATH_RES.getString("iso.ThemKeHoachThangShortPath");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		KeHoachThangModel keHoachThang = new KeHoachThangModel();
		if(request.getSession().getAttribute("KeHoachThang") != null)
			keHoachThang = (KeHoachThangModel) request.getSession().getAttribute("KeHoachThang");
		mapParameter(keHoachThang, request, response);
		if(actionType.equals("GuiHieuTruong")) {
			if (keHoachThang.validateModel()) {
				keHoachThang.setTinhTrang(Constant.TINHTRANG_SEND);
				SysParamsModel sysParam = SysParamsDAO.getNgayGioHeThong();
				keHoachThang.setNgayGui(sysParam.getNgayHeThong());
				keHoachThang.setGioGui(sysParam.getGioHeThong());
				if (KeHoachThangDAO.updateKeHoachThang(keHoachThang)) {
					// Gui email inform Hieu Truong
					LogUtil.logInfo(loggerInfo, tenThanhVien + " gửi ban giám hiệu kế hoạch tháng"); // ghi vào file log
					MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
											MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC),////////////
												MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_KEHOACHTHANG),
													MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_KEHOACHTHANG, 
														keHoachThang.getTenKeHoach(), 
															request.getSession().getAttribute("tenThanhVien").toString(), 
																sysParam.getNgayHeThong() + " " + sysParam.getGioHeThong()));				
					Constant.NUM_ROWS = 1;
					//pageNext = Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoShortPath");
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemKeHoachThangPath"));
					
				} 	
				return;
			} else { // Validate that bai
				pageNext += "?err='Validate Error'";					
				rd = request.getRequestDispatcher(pageNext);
			}
		} else if(actionType.equals("TaoMoi")) {
			if(keHoachThang.validateModel()) {
				if(KeHoachThangDAO.insertKeHoachThang(keHoachThang))
					pageNext += "?TaoMoi=OK";
				else
					pageNext += "?TaoMoiThatBai=OK";
			} else {
				pageNext += "?err='Validate Error'";					
			}
		} else if(actionType.equals("CapNhat")){
			if(keHoachThang.validateModel()) {
				if(KeHoachThangDAO.updateKeHoachThang(keHoachThang))
					pageNext += "?CapNhat=OK";
				else
					pageNext += "?CapNhatThatBai=OK";
			}else {
				pageNext += "?err='Validate Error'";					
			}
		}
		rd = request.getRequestDispatcher(pageNext);
		request.setAttribute(Constant.KE_HOACH_THANG_ATT, keHoachThang);
		rd.forward(request, response);
	}
	private void mapParameter(KeHoachThangModel keHoachThang, HttpServletRequest requset, HttpServletResponse response)throws ServletException, IOException {
		if(keHoachThang.getMaNguoiTao() != null) 
			keHoachThang.setMaNguoiTao((String) requset.getSession().getAttribute("maThanhVien"));
		keHoachThang.setThang(requset.getParameter("cboThang"));
		keHoachThang.setNam(requset.getParameter("cboNam"));
		keHoachThang.setNoiNhan(requset.getParameter("txtNoiNhan").trim());
		keHoachThang.setNgayGui("");
		boolean check = false;
		ArrayList<CongTacThangModel> congTacThangList = new ArrayList<CongTacThangModel>();
		CongTacThangModel congTacThang;
		TinhTrangCongTacModel tinhTrangCongTac;
		String[] mangCongTac = new String[0];
		int totalCongTac = Integer.parseInt(requset.getParameter("TotalCongTac"));
		if(requset.getParameter("MangCongTac") != null)
			mangCongTac = requset.getParameter("MangCongTac").split("<->");
		for(Integer i=1;i<=totalCongTac;i++) {
			check = false;
			int count = 0;
			congTacThang = new CongTacThangModel();
			if(keHoachThang.getCongTacThangList() != null && i <= keHoachThang.getCongTacThangList().size()) {
				congTacThang = keHoachThang.getCongTacThangList().get(i-1);
				check = true;//nếu công tác tháng != null thì check1 = true
			}
			String[] objCongTac = mangCongTac[i-1].split("</>");
			congTacThang.setMaCongTac(objCongTac[0]);
			congTacThang.setNoiDungCongTac(objCongTac[1]);
			congTacThang.setBoPhanThucHien(requset.getParameter("txtBoPhanThucHien" + objCongTac[0]).trim());
			congTacThang.setGhiChu(requset.getParameter("txtGhiChu" + objCongTac[0]).trim());
			
			ArrayList<TinhTrangCongTacModel> tinhTrangCongTacList = new ArrayList<TinhTrangCongTacModel>();
			for(Integer j=1;j<=Integer.parseInt(requset.getParameter("SoTuan"));j++) {
				tinhTrangCongTac = new TinhTrangCongTacModel();
				if(check) {
					if(congTacThang.getTinhTrangCongTacList() != null && j <= congTacThang.getTinhTrangCongTacList().size()) {
						tinhTrangCongTac = congTacThang.getTinhTrangCongTacList().get(j-1-count);
					}
				}
				if(requset.getParameter("txtCongTacTuan" + objCongTac[0] + "_" + j).equals("1")) {
					tinhTrangCongTac.setThuTuTuan(j.toString());
					tinhTrangCongTacList.add(tinhTrangCongTac);
				}
				else {
					if(tinhTrangCongTac.getMaTinhTrangCongTac() != null) {
						if(tinhTrangCongTac.getThuTuTuan().equals(j.toString()))
							TinhTrangCongTacDAO.deleteTinhTrangCongTac(tinhTrangCongTac.getMaTinhTrangCongTac());
						else
							count++;
					}
				}
			}
			congTacThang.setTinhTrangCongTacList(tinhTrangCongTacList);
			congTacThangList.add(congTacThang);
		}
		if(keHoachThang.getCongTacThangList() != null && keHoachThang.getCongTacThangList().get(totalCongTac) != null) {
			for(int i=totalCongTac;i<keHoachThang.getCongTacThangList().size();i++) {
				String id = keHoachThang.getCongTacThangList().get(i).getMaCongTacThang();
				if(id != null)
					CongTacThangDAO.deleteCongTacThang(id);
			}
		}
		keHoachThang.setCongTacThangList(congTacThangList);
	}
	private void duyetMotKeHoachThang(HttpServletRequest request,
			HttpServletResponse response, String maKeHoachThang) throws ServletException, IOException{
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		
		if(request.getParameter("Duyet").equals("Approve")) {
			KeHoachThangDAO.duyetKeHoachThang(userLoginID, maKeHoachThang, Constant.TINHTRANG_APPROVE, null);
			KeHoachThangModel keHoachThangModel = KeHoachThangDAO.getKeHoachThangByID(maKeHoachThang);
			// Gui email inform APPROVE cho Phong Dao Tao
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC),//////////////////
									MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
										MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHTHANG),
											MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_KEHOACHTHANG, 
													keHoachThangModel.getTenKeHoach(), 
														keHoachThangModel.getTenNguoiTao(), 
															keHoachThangModel.getNgayGui() + " " + keHoachThangModel.getGioGui(), 
																keHoachThangModel.getTenNguoiDuyet(), 
																	keHoachThangModel.getNgayDuyet() + " " + keHoachThangModel.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + " approve kế hoạch tháng"); // ghi vào file log
		} else {
			KeHoachThangDAO.duyetKeHoachThang(userLoginID, maKeHoachThang, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
			KeHoachThangModel keHoachThangModel = KeHoachThangDAO.getKeHoachThangByID(maKeHoachThang);
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PHC),//////////////////
					MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
						MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KEHOACHTHANG),
							MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KEHOACHTHANG, 
									keHoachThangModel.getTenKeHoach(), 
										keHoachThangModel.getTenNguoiTao(), 
											keHoachThangModel.getNgayGui() + " " + keHoachThangModel.getGioGui(), 
												keHoachThangModel.getTenNguoiDuyet(), 
													keHoachThangModel.getNgayDuyet() + " " + keHoachThangModel.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + " reject kế hoạch tháng"); // ghi vào file log
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemKeHoachThangPath"));
	}
	private void phanLoaiKeHoachThang(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String select = request.getParameter("selectTinhTrang");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemKeHoachThangPath")
				+ "?msg=" + select);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " phân loại kế hoạch tháng");
	}
	private void duyetKeHoachThang(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		
	}
}
