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
import vn.edu.hungvuongaptech.dao.SendMailListCongTacDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.model.NguoiThucHienModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.SendMailListCongTacModel;
import vn.edu.hungvuongaptech.model.SysParamsModel;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

/**
 * Servlet implementation class ThemKeHoachDaoTaoController
 */
public class KeHoachDaoTaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	private String tenThanhVien = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KeHoachDaoTaoController() {
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
		if(request.getParameter("phanloai") != null) {
			phanLoaiKeHoachDaoTao(request, response);
		} else if(request.getParameter("them") != null) {
			themKeHoachDaoTao(request, response);
		} else if(request.getParameter("duyet") != null) {
			duyetKeHoachDaoTao(request, response);
		} else if(request.getParameter("sosanh") != null) {
			soSanhKeHoachDaoTao(request, response);
		} else if(request.getParameter("duyet1kehoach") != null) {
			duyetMotKeHoachDaoTao(request, response, request.getParameter("maKeHoach"));
		}
		
	}

	private void duyetMotKeHoachDaoTao(HttpServletRequest request,
			HttpServletResponse response, String maKeHoach) throws ServletException, IOException{
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		
		if(request.getParameter("Duyet").equals("Approve")) {
			KeHoachDaoTaoDao.duyetKeHoachDaoTao(userLoginID, maKeHoach, Constant.TINHTRANG_APPROVE, null);
			KeHoachDaoTaoModel keHoachDaoTaoModel = KeHoachDaoTaoDao.getKeHoachDaoTaoByID(maKeHoach);
			// Gui email inform APPROVE cho Phong Dao Tao
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT),//////////////////
									MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
										MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO),
											MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO, 
														keHoachDaoTaoModel.getTenKeHoachDaoTao(), 
														 keHoachDaoTaoModel.getTenNguoiLap(), 
														 keHoachDaoTaoModel.getNgayGui() + " " + keHoachDaoTaoModel.getGioGui(), 
														   keHoachDaoTaoModel.getTenNguoiDuyet(), 
															keHoachDaoTaoModel.getNgayDuyet() + " " + keHoachDaoTaoModel.getGioDuyet()));
			ArrayList<SendMailListCongTacModel> list = SendMailListCongTacDAO.getAllListCongTacByMaKeHoach(maKeHoach);
			sendMailListCongTac(list, keHoachDaoTaoModel,"");
			LogUtil.logInfo(loggerInfo, tenThanhVien + " approve kế hoạch đào tạo"); // ghi vào file log
		} else {
			KeHoachDaoTaoDao.duyetKeHoachDaoTao(userLoginID, maKeHoach, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
			KeHoachDaoTaoModel keHoachDaoTaoModel = KeHoachDaoTaoDao.getKeHoachDaoTaoByID(maKeHoach);
			MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT),//////////////////
					MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
						MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO),
							MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO, 
										keHoachDaoTaoModel.getTenKeHoachDaoTao(), 
										 keHoachDaoTaoModel.getTenNguoiLap(), 
										 keHoachDaoTaoModel.getNgayGui() + " " + keHoachDaoTaoModel.getGioGui(), 
										   keHoachDaoTaoModel.getTenNguoiDuyet(), 
											keHoachDaoTaoModel.getNgayDuyet() + " " + keHoachDaoTaoModel.getGioDuyet()));
			LogUtil.logInfo(loggerInfo, tenThanhVien + " reject kế hoạch đào tạo"); // ghi vào file log
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemKeHoachDaoTaoPath"));
	}

	private void soSanhKeHoachDaoTao(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idSoSanh = request.getParameter("SoSanh");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.SoSanhKeHoachDaoTaoPath")
				+ "?SoSanhKeHoach=" + idSoSanh);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " so sánh kế hoạch đào tạo"); // ghi vào file log
	}

	private Integer mapParameterToModel(HttpServletRequest req 
													,HttpServletResponse res
														,KeHoachDaoTaoModel keHoachDaoTaoModel) {
		Integer countRowSelect = 0;
		if(keHoachDaoTaoModel.getMaNguoiLap() == null)
			keHoachDaoTaoModel.setMaNguoiLap(req.getSession().getAttribute("maThanhVien").toString());		
		if (req.getParameter("cboNam1") != null) {
			keHoachDaoTaoModel.setNam1(req.getParameter("cboNam1").trim()); }
		if (req.getParameter("txtNam2") != null) {
			keHoachDaoTaoModel.setNam2(req.getParameter("txtNam2").trim()); }
		if (req.getParameter("txtNam3") != null) {
			keHoachDaoTaoModel.setNam3(req.getParameter("txtNam3").trim()); }
		if (req.getParameter("txtNam4") != null) {
			keHoachDaoTaoModel.setNam4(req.getParameter("txtNam4").trim()); }
		if (req.getParameter("txtNam5") != null) {
			keHoachDaoTaoModel.setNam5(req.getParameter("txtNam5").trim()); }
		if (req.getParameter("txtNam6") != null) {
			keHoachDaoTaoModel.setNam6(req.getParameter("txtNam6").trim()); }
		if (req.getParameter("areaNhiemvu1") != null) {			
			keHoachDaoTaoModel.setNhiemVu1(StringUtil.toUTF8(req.getParameter("areaNhiemvu1").trim())); }
		if (req.getParameter("areaNhiemvu2") != null) {
			keHoachDaoTaoModel.setNhiemVu2(StringUtil.toUTF8(req.getParameter("areaNhiemvu2").trim())); }
		if (req.getParameter("areaNhiemvu3") != null) {
			keHoachDaoTaoModel.setNhiemVu3(StringUtil.toUTF8(req.getParameter("areaNhiemvu3").trim())); }
		if (req.getParameter("areaNhiemvu4") != null) {
			keHoachDaoTaoModel.setNhiemVu4(StringUtil.toUTF8(req.getParameter("areaNhiemvu4").trim())); }
		keHoachDaoTaoModel.setNgayGui("");
		keHoachDaoTaoModel.setUser1(req.getParameter("txtKhoa1"));
		keHoachDaoTaoModel.setUser2(req.getParameter("txtKhoa2"));
		ArrayList<ChiTietKHDTModel> chiTietKHDTList = new ArrayList<ChiTietKHDTModel>();
		if(req.getParameter("actionType").equals("CapNhat")) {
			boolean check1 = true, check2 = true, check3 = true;
			String[] objCongTac; 
			int countNoiDungA, countNoiDungB, countBoPhan, countNguoiThucHien;
			for (Integer i = 1; i<=Integer.parseInt(req.getSession().getAttribute("Row") + ""); i++) {
				countNoiDungA = 0;
				countNoiDungB = 0;
				countBoPhan = 0;
				countNguoiThucHien = 0;
				ChiTietKHDTModel obj = new ChiTietKHDTModel();
				if (keHoachDaoTaoModel.getChiTietKHDTList() != null
						&& i <= keHoachDaoTaoModel.getChiTietKHDTList().size()) {
					obj = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1);
					check1 = true;
				}
				else
					check1 = false;
				if(req.getParameter("txtNamHoc" + i.toString()) != null)
					obj.setMaNamHoc(req.getParameter("txtNamHoc" + i.toString()));
				if(req.getParameter("txtTuanLe" + i.toString()) != null) {
					obj.setTuan(req.getParameter("txtTuanLe" + i.toString()));
				}
				if(req.getParameter("txtKiTuTuan" + i.toString()) != null) {
					obj.setThuTuTuan(req.getParameter("txtKiTuTuan" + i.toString()));
				}
				if(req.getParameter("txtTuNgay" + i.toString()) != null) {
					obj.setTuNgay(req.getParameter("txtTuNgay" + i.toString()));
				}
				if(req.getParameter("txtDenNgay" + i.toString()) != null) {
					obj.setDenNgay(req.getParameter("txtDenNgay" + i.toString()));
				}
				ArrayList<NoiDungChiTietKHDTModel> noiDungList = new ArrayList<NoiDungChiTietKHDTModel>();
				String[] noiDungChiTietListA, noiDungChiTietListB;
				NoiDungChiTietKHDTModel noiDung;
				check2 = true;
				check3 = true;
				if(req.getParameter("CongTacKhoaA" + i.toString()) != null) {
					noiDungChiTietListA = req.getParameter("CongTacKhoaA" + i.toString()).split("<->");
					countNoiDungA = noiDungChiTietListA.length;
					for(Integer j=1;j <= countNoiDungA;j++) {
						noiDung = new NoiDungChiTietKHDTModel();
						if(check1 == true)
						{
							if (keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList() != null
									&& j <= keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().size()) {
								noiDung = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1);
								check2 = true;
							}
							else
								check2 = false;
						}
						else
							check2 = false;
						objCongTac = noiDungChiTietListA[j-1].split("</>");
						noiDung.setThoiGian(objCongTac[3]);
						noiDung.setStatus("1");
						noiDung.setKhoa("1");
						noiDung.setMaCongTac(StringUtil.toUTF8(objCongTac[0]));
						noiDung.setNoiDungCongTac(StringUtil.toUTF8(objCongTac[1]));
						if(objCongTac[2].equals("null") && keHoachDaoTaoModel.getTinhTrang().equals(Constant.TINHTRANG_APPROVE)) 
							noiDung.setBoSung("-1");
						else if(objCongTac[2].equals("null") && !keHoachDaoTaoModel.getTinhTrang().equals(Constant.TINHTRANG_APPROVE))
							noiDung.setBoSung("0");
						else 
							noiDung.setBoSung(objCongTac[2]);
							
						ArrayList<BoPhanThucHienKHDTModel> boPhanList = new ArrayList<BoPhanThucHienKHDTModel>();
						String[] boPhanThucHienList;
						if(req.getParameter("BoPhanThucHienA" + i.toString() + "_" + j.toString()) != null) {
							boPhanThucHienList = req.getParameter("BoPhanThucHienA" + i.toString() + "_" + j.toString()).split("<->");
							if(check2 == true) {
								if(keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList() != null) {
									if(keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size() <= boPhanThucHienList.length)
										countBoPhan = boPhanThucHienList.length;
									else
										countBoPhan = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size();
								} else
									countBoPhan = boPhanThucHienList.length;
							} else
								countBoPhan = boPhanThucHienList.length;
							 for(Integer k =1;k<=countBoPhan;k++) {
								BoPhanThucHienKHDTModel boPhanThucHien = new BoPhanThucHienKHDTModel();
								if(check2 == true)
								{
									if (keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList() != null
											&& k <= keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size()) {
										boPhanThucHien = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1);
										check3 = true;
									}
									else
										check3 = false;
								}
								else
									check3 = false;
								if(k <= boPhanThucHienList.length) {
									if(!boPhanThucHienList[k-1].equals("")) {// dang sua
										boPhanThucHien.setStatus("1");
										boPhanThucHien.setMaKhoa(boPhanThucHienList[k-1].split("</>")[0]);
										boPhanThucHien.setTenBoPhan(StringUtil.toUTF8(boPhanThucHienList[k-1].split("</>")[1]));
									} else
										boPhanThucHien.setStatus("0");
									ArrayList<NguoiThucHienModel> nguoiList = new ArrayList<NguoiThucHienModel>();
									String [] nguoiThucHienList;
									if(req.getParameter("NguoiThucHienA" + i.toString() + "_" + j.toString() + "_" + k.toString()) != null ) {
									        nguoiThucHienList = req.getParameter("NguoiThucHienA" + i.toString() + "_" + j.toString() + "_" + k.toString()).split("<->");
									        if(check3 == true) {
											        if(keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList() != null) {
											        		if(keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size() <= nguoiThucHienList.length)
											        			countNguoiThucHien = nguoiThucHienList.length;
											        		else
											        			countNguoiThucHien = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size();
										        
											        } else
											        	countNguoiThucHien = nguoiThucHienList.length;
									        } else
									        	countNguoiThucHien = nguoiThucHienList.length;
											for(int m=0;m<countNguoiThucHien;m++) {
												NguoiThucHienModel nguoiThucHien = new NguoiThucHienModel();
												if(check3 == true)
												{
													if (keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList() != null
															&& m < keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size()) {
														nguoiThucHien = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().get(m);
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
												if(nguoiThucHien.getStatus().equals("1") || !req.getParameter("actionType").equals("CapNhat"))
													nguoiList.add(nguoiThucHien);
												else
													NguoiThucHienDAO.deleteNguoiThucHienKHDT(nguoiThucHien.getMaNguoiThucHien());
											}
											boPhanThucHien.setNguoiThucHienModelList(nguoiList);
										}
										
									}
									else
										boPhanThucHien.setStatus("0");
									if(boPhanThucHien.getStatus().equals("1") || !req.getParameter("actionType").equals("CapNhat"))
										boPhanList.add(boPhanThucHien);
									else
										BoPhanThucHienDAO.deleteBoPhanThucHienKHDT(boPhanThucHien.getMaBoPhanThucHienKHDT());
								}
								noiDung.setBoPhanThucHienKHDTModelList(boPhanList);
							}
						noiDungList.add(noiDung);
					}
					
				}
				check2 = true;
				check3 = true;
				if(req.getParameter("CongTacKhoaB" + i.toString()) != null) {
					noiDungChiTietListB = req.getParameter("CongTacKhoaB" + i.toString()).split("<->");
					countNoiDungB = noiDungChiTietListB.length;
					for(Integer j=1 + countNoiDungA;j <= countNoiDungA + countNoiDungB;j++) {
						noiDung = new NoiDungChiTietKHDTModel();
						if(check1 == true)
						{
							if (keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList() != null
									&& j <= keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().size()) {
								noiDung = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1);
								check2 = true;
							}
							else
								check2 = false;
						}
						else
							check2 = false;
							objCongTac = noiDungChiTietListB[j-1-countNoiDungA].split("</>");
							noiDung.setThoiGian(objCongTac[3]);
							noiDung.setStatus("1");
							noiDung.setKhoa("2");
							noiDung.setMaCongTac(StringUtil.toUTF8(objCongTac[0]));
							noiDung.setNoiDungCongTac(StringUtil.toUTF8(objCongTac[1]));
							if(objCongTac[2].equals("null") && keHoachDaoTaoModel.getTinhTrang().equals(Constant.TINHTRANG_APPROVE))
								noiDung.setBoSung("-1");
							else if(objCongTac[2].equals("null") && !keHoachDaoTaoModel.getTinhTrang().equals(Constant.TINHTRANG_APPROVE))
								noiDung.setBoSung("0");
							else
								noiDung.setBoSung(objCongTac[2]);
							ArrayList<BoPhanThucHienKHDTModel> boPhanList = new ArrayList<BoPhanThucHienKHDTModel>();
							String[] boPhanThucHienList;
							if(req.getParameter("BoPhanThucHienB" + i.toString() + "_" + (j-countNoiDungA)+ "") != null) {
								boPhanThucHienList = req.getParameter("BoPhanThucHienB" + i.toString() + "_" + (j-countNoiDungA)+ "").split("<->");
								if(check2 == true) {
									 if(keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList() != null) {
											if(keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size() <= boPhanThucHienList.length)
												countBoPhan = boPhanThucHienList.length;
											else
												countBoPhan = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size();
								
									 } else
										 countBoPhan = boPhanThucHienList.length;
								} else
									 countBoPhan = boPhanThucHienList.length;
								 for(Integer k =1;k<=countBoPhan;k++) {
									BoPhanThucHienKHDTModel boPhanThucHien = new BoPhanThucHienKHDTModel();
									if(check2 == true)
									{
										if (keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList() != null
												&& k <= keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().size()) {
											boPhanThucHien = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1);
											check3 = true;
										}
										else
											check3 = false;
									}
									else
										check3 = false;
									if(k <= boPhanThucHienList.length) {
										if(!boPhanThucHienList[k-1].equals("")) {// dang sua
											boPhanThucHien.setStatus("1");
											boPhanThucHien.setMaKhoa(boPhanThucHienList[k-1].split("</>")[0]);
											boPhanThucHien.setTenBoPhan(StringUtil.toUTF8(boPhanThucHienList[k-1].split("</>")[1]));
										}else
											boPhanThucHien.setStatus("0");
										ArrayList<NguoiThucHienModel> nguoiList = new ArrayList<NguoiThucHienModel>();
										String [] nguoiThucHienList;
										if(req.getParameter("NguoiThucHienB" + i.toString() + "_" + (j-countNoiDungA)+ "" + "_" + k.toString()) != null) {
										        nguoiThucHienList = req.getParameter("NguoiThucHienB" + i.toString() + "_" + (j-countNoiDungA)+ "" + "_" + k.toString()).split("<->");
										        if(check3 == true) {
											        if(keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList() != null) {
											        		if(keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size() <= nguoiThucHienList.length)
											        			countNguoiThucHien = nguoiThucHienList.length;
											        		else
											        			countNguoiThucHien = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size();
											        } else
											        	countNguoiThucHien = nguoiThucHienList.length;
											    } else
										        	countNguoiThucHien = nguoiThucHienList.length;
											for(int m=0;m<countNguoiThucHien;m++) {
												NguoiThucHienModel nguoiThucHien = new NguoiThucHienModel();
												if(check3 == true)
												{
													if (keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList() != null
															&& m < keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().size()) {
														nguoiThucHien = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1).getBoPhanThucHienKHDTModelList().get(k-1).getNguoiThucHienModelList().get(m);
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
												if(nguoiThucHien.getStatus().equals("1") || !req.getParameter("actionType").equals("CapNhat"))
													nguoiList.add(nguoiThucHien);
												else
													NguoiThucHienDAO.deleteNguoiThucHienKHDT(nguoiThucHien.getMaNguoiThucHien());
											}
											boPhanThucHien.setNguoiThucHienModelList(nguoiList);
										}
										
									}
									else
										boPhanThucHien.setStatus("0");
									if(boPhanThucHien.getStatus().equals("1") || !req.getParameter("actionType").equals("CapNhat"))
										boPhanList.add(boPhanThucHien);
									else
										BoPhanThucHienDAO.deleteBoPhanThucHienKHDT(boPhanThucHien.getMaBoPhanThucHienKHDT());
								}
								noiDung.setBoPhanThucHienKHDTModelList(boPhanList);
							}
							noiDungList.add(noiDung);
					}
					
				}
				if(check1 == true && obj.getNoiDungChiTietKHDTModelList() != null) {
					for(int j = countNoiDungA + countNoiDungB + 1;j <= obj.getNoiDungChiTietKHDTModelList().size();j++) {
						noiDung = keHoachDaoTaoModel.getChiTietKHDTList().get(i-1).getNoiDungChiTietKHDTModelList().get(j-1);
						noiDung.setStatus("0");
						if(!req.getParameter("actionType").equals("CapNhat"))
							noiDungList.add(noiDung);
						else
							NoiDungChiTietKHDTDAO.deleteNoiDungChiTietKHDT(noiDung.getMaNoiDungChiTietKHDT());
					}
				}
				obj.setNoiDungChiTietKHDTModelList(noiDungList);
				/*if (req.getParameter("XuLyDong").equals("XoaDong") && req.getParameter("chkRow" + i.toString()) != null) { 
					// Row nay dang bi chon de DELETE ==> ko dua vao Object Model
					countRowSelect++; 
					String id = obj.getId();
					if (id != null) {
						ChiTietKHDTDAO.deleteChiTietKHDT(id);
						req.setAttribute("msgDeleteRow", "XoaDong");
					}
				} else { 
					chiTietKHDTList.add(obj);
				}*/
				chiTietKHDTList.add(obj);
			}
		}
		keHoachDaoTaoModel.setChiTietKHDTList(chiTietKHDTList);		
		
		return countRowSelect;
	}
	
	private void duyetKeHoachDaoTao(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		for (Integer i = 0; i< Constant.RECORDS_PER_PAGE; i++) {
			if(request.getParameter("tinhtrang" + i.toString()) != null) {
				String choiseValue = request.getParameter("tinhtrang" + i.toString());
				String[] value = choiseValue.split("-");
				if (value[0].equals("Approve")) {
					String maKeHoachDaoTao = value[1];
					KeHoachDaoTaoDao.duyetKeHoachDaoTao(userLoginID, maKeHoachDaoTao, Constant.TINHTRANG_APPROVE, null);
					
					KeHoachDaoTaoModel keHoachDaoTaoModel = KeHoachDaoTaoDao.getKeHoachDaoTaoByID(maKeHoachDaoTao);
					// Gui email inform APPROVE cho Phong Dao Tao
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT),//////////////
											MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
												MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO),
													MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO, 
																keHoachDaoTaoModel.getTenKeHoachDaoTao(), 
																 keHoachDaoTaoModel.getTenNguoiLap(), 
																 keHoachDaoTaoModel.getNgayGui() + " " + keHoachDaoTaoModel.getGioGui(), 
																   keHoachDaoTaoModel.getTenNguoiDuyet(), 
																	keHoachDaoTaoModel.getNgayDuyet() + " " + keHoachDaoTaoModel.getGioDuyet()));	
					ArrayList<SendMailListCongTacModel> list = SendMailListCongTacDAO.getAllListCongTacByMaKeHoach(maKeHoachDaoTao);
					sendMailListCongTac(list, keHoachDaoTaoModel,"");
					LogUtil.logInfo(loggerInfo, tenThanhVien + " approve kế hoạch đào tạo"); // ghi vào file log
				}
				else if(value[0].equals("Reject")) {
					String maKeHoachDaoTao = value[1];
					KeHoachDaoTaoDao.duyetKeHoachDaoTao(userLoginID, maKeHoachDaoTao, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("Ly_do_reject" + i.toString()).trim()));
					
					KeHoachDaoTaoModel keHoachDaoTaoModel = KeHoachDaoTaoDao.getKeHoachDaoTaoByID(maKeHoachDaoTao);
					// Gui email inform REJECT cho Phong Dao Tao
					MailUtil.sendEmailToBoPhan(	MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT),//////////////
											MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
												MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO),
													MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO, 
																keHoachDaoTaoModel.getTenKeHoachDaoTao(), 
																 keHoachDaoTaoModel.getTenNguoiLap(), 
																 keHoachDaoTaoModel.getNgayGui() + " " + keHoachDaoTaoModel.getGioGui(), 
																   keHoachDaoTaoModel.getTenNguoiDuyet(), 
																	keHoachDaoTaoModel.getNgayDuyet() + " " + keHoachDaoTaoModel.getGioDuyet()));
					LogUtil.logInfo(loggerInfo, tenThanhVien + " reject kế hoạch đào tạo"); // ghi vào file log
				}
			}
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemKeHoachDaoTaoPath"));
	}
	private void sendMailListCongTac(ArrayList<SendMailListCongTacModel> list, KeHoachDaoTaoModel keHoach, String boSung) {
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
					//MailDAO.getMailListByMaVaiTro(Constant.HIEU_TRUONG),
						MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO),
							MailDAO.getContentSendMailListCongTacNamHoc(boSung,listOfThanhVien.get(j).get(0).getTenKeHoach(), 
									keHoach.getTenNguoiLap(), 
									keHoach.getNgayGui(), 
										 listOfThanhVien.get(j).get(0).getTenThanhVien(), 
											listOfThanhVien.get(j)));	
		}
		
	}
	private void phanLoaiKeHoachDaoTao(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String select = request.getParameter("selectTinhTrang");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemKeHoachDaoTaoPath")
				+ "?msg=" + select);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " phân loại kế hoạch đào tạo"); // ghi vào file log
	}
	
	private void themKeHoachDaoTao(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("iso.ThemKeHoachDaoTaoShortPath");
		String actionType = request.getParameter("actionType");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);		
		KeHoachDaoTaoModel keHoachDaoTaoModel = new KeHoachDaoTaoModel();		
		request.setCharacterEncoding("UTF-8");
		if (request.getSession().getAttribute("KHDTObj") != null) { // Truong hop: Cap Nhat
			keHoachDaoTaoModel = (KeHoachDaoTaoModel) request.getSession().getAttribute("KHDTObj");
		}
		Integer countRowSelected = 
					mapParameterToModel(request, response, keHoachDaoTaoModel);
		if (request.getParameter("XuLyDong") != null
				&& request.getParameter("XuLyDong").equals("ThemDongTren"))  { // Truong hop Them dong tren cung
			Constant.NUM_ROWS++;
			pageNext += "?msg=ThemDongTren";
			String temp = "";
			ArrayList<ChiTietKHDTModel> chiTietList = new ArrayList<ChiTietKHDTModel>();
			keHoachDaoTaoModel.getChiTietKHDTList().add(new ChiTietKHDTModel());
			for(int i = 0;i<keHoachDaoTaoModel.getChiTietKHDTList().size();i++) {
				chiTietList.add(new ChiTietKHDTModel());
				temp = keHoachDaoTaoModel.getChiTietKHDTList().get(i).getId();
				if(i == 0) {
					chiTietList.set(i, new ChiTietKHDTModel());
					chiTietList.get(i).setId(temp);
					ChiTietKHDTDAO.getTuanChiTietKHDT(chiTietList.get(i), keHoachDaoTaoModel.getChiTietKHDTList().get(i).getTuNgay(), keHoachDaoTaoModel.getChiTietKHDTList().get(i).getDenNgay(), "1");
				}
				else {
					chiTietList.set(i, keHoachDaoTaoModel.getChiTietKHDTList().get(i-1)); 
					chiTietList.get(i).setId(temp);
				}
			}
			keHoachDaoTaoModel.setChiTietKHDTList(chiTietList);
			rd = request.getRequestDispatcher(pageNext);					
		} else if (request.getParameter("XuLyDong") != null
				&& request.getParameter("XuLyDong").equals("ThemDongDuoi")) { // Truong hop Them dong duoi cung
			keHoachDaoTaoModel.getChiTietKHDTList().add(new ChiTietKHDTModel());
			int size = keHoachDaoTaoModel.getChiTietKHDTList().size();
			ChiTietKHDTDAO.getTuanChiTietKHDT(keHoachDaoTaoModel.getChiTietKHDTList().get(size-1), keHoachDaoTaoModel.getChiTietKHDTList().get(size-2).getTuNgay(), keHoachDaoTaoModel.getChiTietKHDTList().get(size-2).getDenNgay(), "2");
				pageNext += "?msg=ThemDongDuoi";
				Constant.NUM_ROWS++;
				rd = request.getRequestDispatcher(pageNext);	
		} else if (request.getParameter("GuiHieuTruong") != null
				&& request.getParameter("GuiHieuTruong").equals("GuiHieuTruong")) { // Truong hop Gui Hieu Truong
			if (keHoachDaoTaoModel.validateModel()) {
				keHoachDaoTaoModel.setTinhTrang(Constant.TINHTRANG_SEND);
				SysParamsModel sysParam = SysParamsDAO.getNgayGioHeThong();
				keHoachDaoTaoModel.setNgayGui(sysParam.getNgayHeThong());
				keHoachDaoTaoModel.setGioGui(sysParam.getGioHeThong());
				if (KeHoachDaoTaoDao.updateKeHoachDaoTao(keHoachDaoTaoModel)) {
					// Gui email inform Hieu Truong
					LogUtil.logInfo(loggerInfo, tenThanhVien + " gửi ban giám hiệu kế hoạch đào tạo"); // ghi vào file log
					MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////
											MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PDT),////////////
												MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO),
													MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_KEHOACHDAOTAO, 
														keHoachDaoTaoModel.getTenKeHoachDaoTao(), 
															request.getSession().getAttribute("tenThanhVien").toString(), 
															sysParam.getNgayHeThong() + " " + sysParam.getGioHeThong()));				
					Constant.NUM_ROWS = 1;
					//pageNext = Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoShortPath");
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemKeHoachDaoTaoPath"));
					
				} 	
				return;
			} else { // Validate that bai
				pageNext += "?err='Validate Error'";					
				rd = request.getRequestDispatcher(pageNext);
			}
		//	return;
		} /*else if (request.getParameter("Copy") != null
				&& request.getParameter("Copy").equals("Copy")) {
			keHoachDaoTaoModel.setMaKeHoachDaoTao(null);
			keHoachDaoTaoModel.setTinhTrang(null);
			keHoachDaoTaoModel.setNgayCapNhatCuoi(null);
			keHoachDaoTaoModel.setMaNguoiDuyet(null);
			keHoachDaoTaoModel.setNgayDuyet(null);
			keHoachDaoTaoModel.setNgayLap(null);
			keHoachDaoTaoModel.setTenNguoiLap(null);
			keHoachDaoTaoModel.setTenNguoiDuyet(null);
			for(int i=0;i<keHoachDaoTaoModel.getChiTietKHDTList().size();i++)
			{
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setId(null);	
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setNgayCapNhatCuoi(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setTuNgay(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setDenNgay(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setCloseDate(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setGhiChu(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setMaNamHoc(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setTuan(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setThuTuTuan(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).setMaKeHoach(null);
				keHoachDaoTaoModel.getChiTietKHDTList().get(i).set(null);
			}
		} */else {  
			if (actionType.equals("ThemMoi")) { // Truong hop : Them "KE HOACH DAO TAO"
				keHoachDaoTaoModel.setChiTietKHDTList(null);
				
				if (keHoachDaoTaoModel.validateModel()) { // Validate thanh cong					
					if(!KeHoachDaoTaoDao.checkNamOfKeHoachDaoTao(keHoachDaoTaoModel.getNam1())) {
						if (KeHoachDaoTaoDao.insertKeHoachDaoTao(keHoachDaoTaoModel)) {
							LogUtil.logInfo(loggerInfo, tenThanhVien + " thêm mới kế hoạch đào tạo"); // ghi vào file log
							keHoachDaoTaoModel.setTinhTrang(Constant.TINHTRANG_NEW);
							pageNext += "?msg=ThemMoi";						
							rd = request.getRequestDispatcher(pageNext);						
						}
					} else {
						pageNext += "?errNam='TrungNam'";						
						rd = request.getRequestDispatcher(pageNext);						
					}
						
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);					
				}
			} else if(actionType.equals("CapNhat")) { // Truong hop: Cap nhat "KE HOACH DAO TAO"
				if (keHoachDaoTaoModel.validateModel()) { // Validate thanh cong
						if (KeHoachDaoTaoDao.updateKeHoachDaoTao(keHoachDaoTaoModel)) {
							pageNext += "?msg=CapNhat";						
							rd = request.getRequestDispatcher(pageNext);
							LogUtil.logInfo(loggerInfo, tenThanhVien + " cập nhật kế hoạch đào tạo"); // ghi vào file log
						}	
					
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);
				}
			}
		}
		
		request.setAttribute(Constant.KE_HOACH_DAO_TAO_ATT, keHoachDaoTaoModel);		
		rd.forward(request, response);
	}
}
