package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.BoPhanThucHienDAO;
import vn.edu.hungvuongaptech.dao.ChiTietKHDTDAO;
import vn.edu.hungvuongaptech.dao.KeHoachDaoTaoDao;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.NguoiThucHienDAO;
import vn.edu.hungvuongaptech.dao.NoiDungChiTietKHDTDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.model.NguoiThucHienModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class PhanCongTacTuanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    boolean check = true;
    private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	private String tenThanhVien = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhanCongTacTuanController() {
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
		if(request.getParameter("BoSungCongTac") != null)
			boSungCongTacTuan(request, response);
		else
			themPhanCongTacTuan(request, response);
		
	}
	private void mapParameterToModel(HttpServletRequest req 
			,HttpServletResponse res
				,ChiTietKHDTModel chiTietKHDTModel) {
		String[] noiDungList;
		chiTietKHDTModel.setGhiChu(StringUtil.toUTF8(req.getParameter("txtGhiChu")));
		if(req.getParameter("CongTac") != null) {
			ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietKHDTModelList = new ArrayList<NoiDungChiTietKHDTModel>();
			noiDungList = req.getParameter("CongTac").split("-");
			for(int i=0;i<chiTietKHDTModel.getNoiDungChiTietKHDTModelList().size();i++) {
				NoiDungChiTietKHDTModel noiDung = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i);
				String[] value = noiDungList[i].split("/");
				if(value[0].equals("null"))
					noiDung.setThu(null);
				else
					noiDung.setThu(value[0]);
				if(value[1].equals("null"))
					noiDung.setBuoi(null);
				else
					noiDung.setBuoi(value[1]);
				if(req.getParameter("cboGio" + noiDung.getMaNoiDungChiTietKHDT()) != null)
					noiDung.setGio(req.getParameter("cboGio" + noiDung.getMaNoiDungChiTietKHDT()));
				else
					noiDung.setGio(null);
				if(req.getParameter("cboPhut" + noiDung.getMaNoiDungChiTietKHDT()) != null)
					noiDung.setPhut(req.getParameter("cboPhut" + noiDung.getMaNoiDungChiTietKHDT()));
				else
					noiDung.setPhut(null);
				if(req.getParameter("txt" + noiDung.getMaNoiDungChiTietKHDT()) != null)
					noiDung.setGhiChu(StringUtil.toUTF8(req.getParameter("txt" + noiDung.getMaNoiDungChiTietKHDT())));
				else
					noiDung.setGhiChu(null);	
				noiDung.setTinhTrangPhanCong(value[2]);
				//if(noiDung.getTinhTrangPhanCong().equals("0"))
					//check = false;
				noiDungChiTietKHDTModelList.add(noiDung);
			}
			chiTietKHDTModel.setNoiDungChiTietKHDTModelList(noiDungChiTietKHDTModelList);
		}
	}
	private void boSungCongTacTuan(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("iso.BoSungCongTacShortPath");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);		
		ChiTietKHDTModel chiTietKHDTModel = new ChiTietKHDTModel();		
		KeHoachDaoTaoModel keHoachDaoTaoModel = new KeHoachDaoTaoModel();
		request.setCharacterEncoding("UTF-8");
		if (request.getSession().getAttribute("ChiTietKHDT") != null) { // Truong hop: Cap Nhat
			chiTietKHDTModel = (ChiTietKHDTModel) request.getSession().getAttribute("ChiTietKHDT");
		}
		if (request.getSession().getAttribute("KeHoach") != null) { // Truong hop: Cap Nhat
			keHoachDaoTaoModel = (KeHoachDaoTaoModel) request.getSession().getAttribute("KeHoach");
		}
		mapParameterToModelBoSung(request, response, chiTietKHDTModel, keHoachDaoTaoModel);
		/*if(request.getParameter("BoSung") != null 
				&& request.getParameter("BoSung").equals("BoSung")) {
			if(KeHoachDaoTaoDao.boSungKHDT(keHoachDaoTaoModel)) {
				LogUtil.logInfo(loggerInfo, tenThanhVien + " bổ sung công tác tuần"); // ghi vào file log
				keHoachDaoTaoModel.setTinhTrang(Constant.TINHTRANG_BO_SUNG);
				pageNext += "?msg=BoSung&KieuTuan=" + request.getParameter("cboTuan");	
			}
		}else if(request.getParameter("BoSung") != null 
				&& request.getParameter("BoSung").equals("KhongBoSung")) {
			if(KeHoachDaoTaoDao.khongBoSungKHDT(keHoachDaoTaoModel))
				LogUtil.logInfo(loggerInfo, tenThanhVien + " không bổ sung công tác tuần"); // ghi vào file log
				keHoachDaoTaoModel.setTinhTrang(Constant.TINHTRANG_APPROVE);
				pageNext += "?msg=KhongBoSung&KieuTuan=" + request.getParameter("cboTuan");
		} else {*/
			chiTietKHDTModel.setMaKeHoach(keHoachDaoTaoModel.getMaKeHoachDaoTao());
			//keHoachDaoTaoModel.setTinhTrang(Constant.TINHTRANG_APPROVE);
			//keHoachDaoTaoModel.setBoSung((Integer.parseInt(keHoachDaoTaoModel.getBoSung()) + 1) + "");
			//KeHoachDaoTaoDao.khongBoSungKHDT(keHoachDaoTaoModel);
			if(chiTietKHDTModel.getId() != null) {
				if(ChiTietKHDTDAO.updateChiTietKHDT(chiTietKHDTModel)) {
					pageNext += "?capNhat=ok&KieuTuan=" + request.getParameter("cboTuan");
					LogUtil.logInfo(loggerInfo, tenThanhVien + " cập nhật công tác tuần"); // ghi vào file log
				}
				else
					pageNext += "?err=ok&KieuTuan=" + request.getParameter("cboTuan");
			} else {
				if(ChiTietKHDTDAO.insertChiTietKHDT(chiTietKHDTModel)) {
					pageNext += "?capNhat=ok&KieuTuan=" + request.getParameter("cboTuan");
					LogUtil.logInfo(loggerInfo, tenThanhVien + " cập nhật công tác tuần"); // ghi vào file log
				}
				else
					pageNext += "?err=ok&KieuTuan=" + request.getParameter("cboTuan");
			}
		//}
		rd = request.getRequestDispatcher(pageNext);
		request.setAttribute(Constant.CHI_TIET_KHDT_ATT, chiTietKHDTModel);		
		request.setAttribute(Constant.KE_HOACH_DAO_TAO_ATT, keHoachDaoTaoModel);	
		rd.forward(request, response);
	}
	private void mapParameterToModelBoSung(HttpServletRequest req 
			,HttpServletResponse res
				,ChiTietKHDTModel chiTietKHDTModel, KeHoachDaoTaoModel keHoachDaoTaoModel) {
		boolean check1 = true, check2 = true;
		int countNoiDungA, countNoiDungB, countBoPhan, countNguoiThucHien;
			countNoiDungA = 0;
			countNoiDungB = 0;
			countBoPhan = 0;
			countNguoiThucHien = 0;
			if(req.getParameter("txtNamHoc") != null)
				chiTietKHDTModel.setMaNamHoc(req.getParameter("txtNamHoc"));
			if(req.getParameter("txtTuanLe") != null) {
				chiTietKHDTModel.setTuan(req.getParameter("txtTuanLe"));
			}
			if(req.getParameter("txtKiTuTuan") != null) {
				chiTietKHDTModel.setThuTuTuan(req.getParameter("txtKiTuTuan"));
			}
			if(req.getParameter("txtTuNgay") != null) {
				chiTietKHDTModel.setTuNgay(req.getParameter("txtTuNgay"));
			}
			if(req.getParameter("txtDenNgay") != null) {
				chiTietKHDTModel.setDenNgay(req.getParameter("txtDenNgay"));
			}
			ArrayList<NoiDungChiTietKHDTModel> noiDungList = new ArrayList<NoiDungChiTietKHDTModel>();
			String[] noiDungChiTietListA, noiDungChiTietListB;
			NoiDungChiTietKHDTModel noiDung;
			check1 = true;
			check2 = true;
			String[] objCongTac;
			if(req.getParameter("CongTacKhoaA") != null) {
				noiDungChiTietListA = req.getParameter("CongTacKhoaA").split("<->");
				countNoiDungA = noiDungChiTietListA.length;
				for(Integer j=1;j <= countNoiDungA;j++) {
					noiDung = new NoiDungChiTietKHDTModel();
						if (chiTietKHDTModel.getNoiDungChiTietKHDTModelList() != null
								&& j <= chiTietKHDTModel.getNoiDungChiTietKHDTModelList().size()) {
							noiDung = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1);
							check1 = true;
						} else
							check1 = false;
					objCongTac = noiDungChiTietListA[j-1].split("</>");
					noiDung.setThoiGian(objCongTac[3]);
					noiDung.setStatus("1");
					noiDung.setKhoa("1");
					noiDung.setMaCongTac(StringUtil.toUTF8(objCongTac[0]));
					noiDung.setNoiDungCongTac(StringUtil.toUTF8(objCongTac[1]));
					if(objCongTac[2].equals("null"))
						noiDung.setBoSung("1");
					else
						noiDung.setBoSung(objCongTac[2]);
					ArrayList<BoPhanThucHienKHDTModel> boPhanList = new ArrayList<BoPhanThucHienKHDTModel>();
					String[] boPhanThucHienList;
					if(req.getParameter("BoPhanThucHienA" + j.toString()) != null) {
						boPhanThucHienList = req.getParameter("BoPhanThucHienA" + j.toString()).split("<->");
						if(check1 == true) {
							if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList() != null) {
								if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size() <= boPhanThucHienList.length)
									countBoPhan = boPhanThucHienList.length;
								else
									countBoPhan = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size();
							} else
								countBoPhan = boPhanThucHienList.length;
						} else
							countBoPhan = boPhanThucHienList.length;
						 for(Integer k =1;k<=countBoPhan;k++) {
							BoPhanThucHienKHDTModel boPhanThucHien = new BoPhanThucHienKHDTModel();
							if(check1 == true)
							{
								if (chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList() != null
										&& k <= chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size()) {
									boPhanThucHien = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1);
									check2 = true;
								}
								else
									check2 = false;
							}
							else
								check2 = false;
							if(k <= boPhanThucHienList.length) {
								if(!boPhanThucHienList[k-1].equals("")) {// dang sua
									boPhanThucHien.setStatus("1");
									boPhanThucHien.setMaKhoa(boPhanThucHienList[k-1].split("</>")[0]);
									boPhanThucHien.setTenBoPhan(StringUtil.toUTF8(boPhanThucHienList[k-1].split("</>")[1]));
								} else
									boPhanThucHien.setStatus("0");
								ArrayList<NguoiThucHienModel> nguoiList = new ArrayList<NguoiThucHienModel>();
								String [] nguoiThucHienList;
								if(req.getParameter("NguoiThucHienA" + j.toString() + "_" + k.toString()) != null ) {
								        nguoiThucHienList = req.getParameter("NguoiThucHienA" + j.toString() + "_" + k.toString()).split("<->");
								        if(check2 == true) {
										        if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList() != null) {
										        		if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size() <= nguoiThucHienList.length)
										        			countNguoiThucHien = nguoiThucHienList.length;
										        		else
										        			countNguoiThucHien = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size();
									        
										        } else
										        	countNguoiThucHien = nguoiThucHienList.length;
								        } else
								        	countNguoiThucHien = nguoiThucHienList.length;
										for(int m=0;m<countNguoiThucHien;m++) {
											NguoiThucHienModel nguoiThucHien = new NguoiThucHienModel();
											if(check2 == true)
											{
												if (chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList() != null
														&& m < chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size()) {
													nguoiThucHien = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().get(m);
												}
											}
											if(m < nguoiThucHienList.length) {
												if(!nguoiThucHienList[m].equals("")) {//dang sua
													nguoiThucHien.setStatus("1");
													nguoiThucHien.setMaThanhVien(nguoiThucHienList[m].split("</>")[0]);
													nguoiThucHien.setTenThanhVien(StringUtil.toUTF8(nguoiThucHienList[m].split("</>")[1]));
												} else
													nguoiThucHien.setStatus("0");
											}
											else
												nguoiThucHien.setStatus("0");
											if(nguoiThucHien.getStatus().equals("1"))
												nguoiList.add(nguoiThucHien);
											else if(req.getParameter("actionType").equals("CapNhat"))
												NguoiThucHienDAO.deleteNguoiThucHienKHDT(nguoiThucHien.getMaNguoiThucHien());
										}
										boPhanThucHien.setNguoiThucHienModelList(nguoiList);
									}
									
								}
								else
									boPhanThucHien.setStatus("0");
								if(boPhanThucHien.getStatus().equals("1"))
									boPhanList.add(boPhanThucHien);
								else if(req.getParameter("actionType").equals("CapNhat"))
									BoPhanThucHienDAO.deleteBoPhanThucHienKHDT(boPhanThucHien.getMaBoPhanThucHienKHDT());
							}
							noiDung.setBoPhanThucHienKHDTModelList(boPhanList);
						}
					noiDungList.add(noiDung);
				}
				
			}
			check1 = true;
			check2 = true;
			if(req.getParameter("CongTacKhoaB") != null) {
				noiDungChiTietListB = req.getParameter("CongTacKhoaB").split("<->");
				countNoiDungB = noiDungChiTietListB.length;
				for(Integer j=1 + countNoiDungA;j <= countNoiDungA + countNoiDungB;j++) {
					noiDung = new NoiDungChiTietKHDTModel();
						if (chiTietKHDTModel.getNoiDungChiTietKHDTModelList() != null
								&& j <= chiTietKHDTModel.getNoiDungChiTietKHDTModelList().size()) {
							noiDung = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1);
							check1 = true;
						}
						else
							check1 = false;
						objCongTac = noiDungChiTietListB[j-1-countNoiDungA].split("</>");
						noiDung.setThoiGian(objCongTac[3]);
						noiDung.setStatus("1");
						noiDung.setKhoa("2");
						noiDung.setMaCongTac(StringUtil.toUTF8(objCongTac[0]));
						noiDung.setNoiDungCongTac(StringUtil.toUTF8(objCongTac[1]));
						if(objCongTac[2].equals("null"))
							noiDung.setBoSung("1");
						else
							noiDung.setBoSung(objCongTac[2]);
						ArrayList<BoPhanThucHienKHDTModel> boPhanList = new ArrayList<BoPhanThucHienKHDTModel>();
						String[] boPhanThucHienList;
						if(req.getParameter("BoPhanThucHienB" + (j-countNoiDungA)+ "") != null) {
							boPhanThucHienList = req.getParameter("BoPhanThucHienB" + (j-countNoiDungA)+ "").split("<->");
							if(check1 == true) {
								 if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList() != null) {
										if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size() <= boPhanThucHienList.length)
											countBoPhan = boPhanThucHienList.length;
										else
											countBoPhan = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size();
							
								 } else
									 countBoPhan = boPhanThucHienList.length;
							} else
								 countBoPhan = boPhanThucHienList.length;
							 for(Integer k =1;k<=countBoPhan;k++) {
								BoPhanThucHienKHDTModel boPhanThucHien = new BoPhanThucHienKHDTModel();
								if(check1 == true)
								{
									if (chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList() != null
											&& k <= chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size()) {
										boPhanThucHien = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1);
										check2 = true;
									}
									else
										check2 = false;
								}
								else
									check2 = false;
								if(k <= boPhanThucHienList.length) {
									if(!boPhanThucHienList[k-1].equals("")) {// dang sua
										boPhanThucHien.setStatus("1");
										boPhanThucHien.setMaKhoa(boPhanThucHienList[k-1].split("</>")[0]);
										boPhanThucHien.setTenBoPhan(StringUtil.toUTF8(boPhanThucHienList[k-1].split("</>")[1]));
									}else
										boPhanThucHien.setStatus("0");
									ArrayList<NguoiThucHienModel> nguoiList = new ArrayList<NguoiThucHienModel>();
									String [] nguoiThucHienList;
									if(req.getParameter("NguoiThucHienB" + (j-countNoiDungA) + "_" + k.toString()) != null) {
									        nguoiThucHienList = req.getParameter("NguoiThucHienB" + (j-countNoiDungA) + "_" + k.toString()).split("<->");
									        if(check2 == true) {
										        if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList() != null) {
										        		if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size() <= nguoiThucHienList.length)
										        			countNguoiThucHien = nguoiThucHienList.length;
										        		else
										        			countNguoiThucHien = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size();
										        } else
										        	countNguoiThucHien = nguoiThucHienList.length;
										    } else
									        	countNguoiThucHien = nguoiThucHienList.length;
										for(int m=0;m<countNguoiThucHien;m++) {
											NguoiThucHienModel nguoiThucHien = new NguoiThucHienModel();
											if(check2 == true)
											{
												if (chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList() != null
														&& m < chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size()) {
													nguoiThucHien = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().get(m);
												}
											}
											if(m < nguoiThucHienList.length) {
												if(!nguoiThucHienList[m].equals("")) {//dang sua
													nguoiThucHien.setStatus("1");
													nguoiThucHien.setMaThanhVien(nguoiThucHienList[m].split("</>")[0]);
													nguoiThucHien.setTenThanhVien(StringUtil.toUTF8(nguoiThucHienList[m].split("</>")[1]));
												}else
													nguoiThucHien.setStatus("0");
											}
											else
												nguoiThucHien.setStatus("0");
											if(nguoiThucHien.getStatus().equals("1"))
												nguoiList.add(nguoiThucHien);
											else if(req.getParameter("actionType").equals("CapNhat"))
												NguoiThucHienDAO.deleteNguoiThucHienKHDT(nguoiThucHien.getMaNguoiThucHien());
										}
										boPhanThucHien.setNguoiThucHienModelList(nguoiList);
									}
									
								}
								else
									boPhanThucHien.setStatus("0");
								if(boPhanThucHien.getStatus().equals("1"))
									boPhanList.add(boPhanThucHien);
								else if(req.getParameter("actionType").equals("CapNhat"))
									BoPhanThucHienDAO.deleteBoPhanThucHienKHDT(boPhanThucHien.getMaBoPhanThucHienKHDT());
							}
							noiDung.setBoPhanThucHienKHDTModelList(boPhanList);
						}
						noiDungList.add(noiDung);
				}
				
			}
			if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList() != null) {
				for(int j = countNoiDungA + countNoiDungB + 1;j <= chiTietKHDTModel.getNoiDungChiTietKHDTModelList().size();j++) {
					noiDung = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(j-1);
					noiDung.setStatus("0");
					
					if(!req.getParameter("actionType").equals("CapNhat"))
						noiDungList.add(noiDung);
					else
						NoiDungChiTietKHDTDAO.deleteNoiDungChiTietKHDT(noiDung.getMaNoiDungChiTietKHDT());
				}
			}
			chiTietKHDTModel.setNoiDungChiTietKHDTModelList(noiDungList);
	}
	private void themPhanCongTacTuan(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("iso.PhanCongTacTuanShortPath");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);		
		ChiTietKHDTModel chiTietKHDTModel = new ChiTietKHDTModel();		
		request.setCharacterEncoding("UTF-8");
		check = true;
		if (request.getSession().getAttribute("ChiTietKHDT") != null) { // Truong hop: Cap Nhat
			chiTietKHDTModel = (ChiTietKHDTModel) request.getSession().getAttribute("ChiTietKHDT");
		}
		mapParameterToModel(request, response, chiTietKHDTModel);
		if(request.getParameter("GuiCongTac") != null && request.getParameter("GuiCongTac").equals("GuiCongTac")) {
			if(check == true) {	
				//chiTietKHDTModel.setTinhTrangPhanCongTac("1");
				if(chiTietKHDTModel.getUser1() != null)
					chiTietKHDTModel.setUser1((Integer.parseInt(chiTietKHDTModel.getUser1()) + 1) + "");
				else
					chiTietKHDTModel.setUser1((-1 + 1) + "");
				if(ChiTietKHDTDAO.updateGhiChuChiTietKHDT(chiTietKHDTModel)) {
					sendMailListCongTacTuan(chiTietKHDTModel);
					pageNext += "?msg=sendOk";
					rd = request.getRequestDispatcher(pageNext);
				}
				else
					chiTietKHDTModel.setUser1((Integer.parseInt(chiTietKHDTModel.getUser1()) - 1) + "");
					//chiTietKHDTModel.setTinhTrangPhanCongTac("0");*/
			} else {
				pageNext += "?err=sendError";
				rd = request.getRequestDispatcher(pageNext);
			}
		} else {
			if(ChiTietKHDTDAO.updateGhiChuChiTietKHDT(chiTietKHDTModel)) {
				pageNext += "?msg=ok";
				rd = request.getRequestDispatcher(pageNext);
			}
		}
		request.setAttribute(Constant.CHI_TIET_KHDT_ATT, chiTietKHDTModel);		
		rd.forward(request, response);
	}
	private void sendMailListCongTacTuan(ChiTietKHDTModel chiTietKHDTModel) {
		/*ArrayList<SendMailListCongTacModel> list = SendMailListCongTacDAO.getAllListCongTacTuanByMaChiTiet(maChiTiet);
		ArrayList<ArrayList<SendMailListCongTacModel>> listOfThanhVien = new ArrayList<ArrayList<SendMailListCongTacModel>>();
		String ten = "";
		for(int j=0;j<list.size();j++) {
			if(!ten.equals(list.get(j).getTenThanhVien())) {
				ten = list.get(j).getTenThanhVien();
				listOfThanhVien.add(new ArrayList<SendMailListCongTacModel>());
			}
			listOfThanhVien.get(listOfThanhVien.size()-1).add(list.get(j));
		}
		for(int j= 0;j<listOfThanhVien.size();j++) {
			MailUtil.sendEmail(	MailDAO.getMailByMaThanhVien(listOfThanhVien.get(j).get(0).getMaThanhVien()),"",
						"[ISO] - Thong Bao - Review - PHAN CONG TAC TUAN",
							MailDAO.getContentSendMailListCongTacTuan(list.get(0).getTuNgay(), 
									list.get(0).getDenNgay(), 
									SysParamsDAO.getNgayGioHeThong().getNgayHeThong(), 
										 listOfThanhVien.get(j).get(0).getTenThanhVien(), 
											listOfThanhVien.get(j)));	
		}*/
		String soLan = "";
		if(!chiTietKHDTModel.getUser1().equals("0"))
			soLan = "Bo Sung Lan " + chiTietKHDTModel.getUser1();
		MailUtil.sendEmail(Constant.SETTING_RES.getString("MAIL_EVERYONE"),"",
				"[ISO] - Thong Bao - " + soLan + " - PHAN CONG TAC TUAN",
					MailDAO.getContentSendMailListCongTacTuan(
							SysParamsDAO.getNgayGioHeThong().getNgayHeThong(),  
									chiTietKHDTModel.getId()));	
		MailUtil.sendEmail("cuongits@gmail.com","",
				"[ISO] - Thong Bao - " + soLan + " - PHAN CONG TAC TUAN",
					MailDAO.getContentSendMailListCongTacTuan(
							SysParamsDAO.getNgayGioHeThong().getNgayHeThong(),  
									chiTietKHDTModel.getId()));	
	}
}
