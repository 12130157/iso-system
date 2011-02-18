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
import vn.edu.hungvuongaptech.dao.ChiTietMonHocCTDTDAO;
import vn.edu.hungvuongaptech.dao.ChuongTrinhDaoTaoDAO;
import vn.edu.hungvuongaptech.dao.DeCuongMonHocDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.model.ChiTietMonHocCTDTModel;
import vn.edu.hungvuongaptech.model.ChuongTrinhDaoTaoModel;

import vn.edu.hungvuongaptech.model.SysParamsModel;

import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ChuongTrinhDaoTaoController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private boolean tinhTrang = true;
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
    ArrayList<String> maNguoiTaoDeCuongUpdateList = new ArrayList<String>();
    ArrayList<String> tenMonHocUpdateList = new ArrayList<String>();
    ArrayList<String> maNguoiTaoDeCuongDeleteList = new ArrayList<String>();
    ArrayList<String> tenMonHocDeleteList = new ArrayList<String>();
    private String tenThanhVien = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChuongTrinhDaoTaoController() {
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
			phanLoaiChuongTrinhDaoTao(request, response);
		} else if(request.getParameter("them") != null) {
			themChuongTrinhDaoTao(request, response);
		} else if(request.getParameter("duyet") != null){
			duyetChuongTrinhDaoTao(request, response);
		} else if(request.getParameter("sosanh") != null) {
			soSanhChuongTrinhDaoTao(request, response);
		} else if(request.getParameter("duyet1chuongtrinh") != null) {
			duyetMotChuongTrinhDaoTao(request, response, request.getParameter("maChuongTrinh"));
		}
	}

	private void duyetMotChuongTrinhDaoTao(HttpServletRequest request,
			HttpServletResponse response, String maChuongTrinh) throws ServletException, IOException{
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		
		if(request.getParameter("Duyet").equals("Approve")) {
			ChuongTrinhDaoTaoDAO.duyetChuongTrinhDaoTao(userLoginID, maChuongTrinh, Constant.TINHTRANG_APPROVE, null);
			ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTaoByID(maChuongTrinh);
			sendMailApprove(chuongTrinhDaoTaoModel);
			LogUtil.logInfo(loggerInfo, tenThanhVien + " approve chương trình đào tạo"); // ghi vào file log
		} else {
			if(!request.getSession().getAttribute("maBoPhan").equals(Constant.BO_PHAN_BGH))
				userLoginID = "";
			ChuongTrinhDaoTaoDAO.duyetChuongTrinhDaoTao(userLoginID, maChuongTrinh, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
			ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTaoByID(maChuongTrinh);
			sendMailReject(chuongTrinhDaoTaoModel);
			LogUtil.logInfo(loggerInfo, tenThanhVien + " reject chương trình đào tạo"); // ghi vào file log
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemChuongTrinhDaoTaoPath"));
	}

	private void soSanhChuongTrinhDaoTao(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idSoSanh = request.getParameter("SoSanh");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.SoSanhChuongTrinhDaoTaoPath")
				+ "?SoSanhChuongTrinh=" + idSoSanh);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " so sánh chương trình đào tạo"); // ghi vào file log
	}

	private Integer mapParameterToModel(HttpServletRequest req 
			,HttpServletResponse res
				,ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel) {
		chuongTrinhDaoTaoModel.setMaNguoiTao(req.getSession().getAttribute("maThanhVien").toString());	
		Integer countRowSelect = 0;		
		if (req.getParameter("cboQuyetDinhDaoTao") != null) {
			chuongTrinhDaoTaoModel.setMaQuyetDinh(req.getParameter("cboQuyetDinhDaoTao").trim()); }
		if (req.getParameter("cboTenNghe") != null) {
			chuongTrinhDaoTaoModel.setMaNghe(req.getParameter("cboTenNghe").trim()); }
		if (req.getParameter("txtMaNghe") != null) {
			chuongTrinhDaoTaoModel.setKiHieu(req.getParameter("txtMaNghe").trim()); }
		if (req.getParameter("txtTrinhDoDaoTao") != null) {
			chuongTrinhDaoTaoModel.setTenTrinhDo(StringUtil.toUTF8(req.getParameter("txtTrinhDoDaoTao").trim())); }
		if (req.getParameter("txtMaTrinhDo") != null) {
			chuongTrinhDaoTaoModel.setMaTrinhDo(req.getParameter("txtMaTrinhDo").trim()); }
		if (req.getParameter("areaDoiTuongTuyenSinh") != null) {
			chuongTrinhDaoTaoModel.setDoiTuong1(StringUtil.toUTF8(req.getParameter("areaDoiTuongTuyenSinh").trim())); }
		if (req.getParameter("areaSoLuongMonHoc") != null) {
			chuongTrinhDaoTaoModel.setSoLuongMonHoc(StringUtil.toUTF8(req.getParameter("areaSoLuongMonHoc").trim())); }
		if (req.getParameter("txtBangCap") != null) {
			chuongTrinhDaoTaoModel.setBangCap(StringUtil.toUTF8(req.getParameter("txtBangCap").trim())); }
		if (req.getParameter("areaKienThucNghe") != null) {			
			chuongTrinhDaoTaoModel.setMucTieu1(StringUtil.toUTF8(req.getParameter("areaKienThucNghe").trim())); }
		if (req.getParameter("areaKynangNghe") != null) {
			chuongTrinhDaoTaoModel.setMucTieu2(StringUtil.toUTF8(req.getParameter("areaKynangNghe").trim())); }
		if (req.getParameter("areaChinhTri") != null) {
			chuongTrinhDaoTaoModel.setMucTieu3(StringUtil.toUTF8(req.getParameter("areaChinhTri").trim())); }
		if (req.getParameter("areaKiNang") != null) {
			chuongTrinhDaoTaoModel.setMucTieu4(StringUtil.toUTF8(req.getParameter("areaKiNang").trim())); }
		if (req.getParameter("areaCoHoiViecLam") != null) {
			chuongTrinhDaoTaoModel.setMucTieu5(StringUtil.toUTF8(req.getParameter("areaCoHoiViecLam").trim())); }
		if (req.getParameter("areaPhuongPhapLyThuyet") != null) {
			chuongTrinhDaoTaoModel.setPhuongPhap1(StringUtil.toUTF8(req.getParameter("areaPhuongPhapLyThuyet").trim())); }
		if (req.getParameter("areaPhuongPhapThucHanh") != null) {
			chuongTrinhDaoTaoModel.setPhuongPhap2(StringUtil.toUTF8(req.getParameter("areaPhuongPhapThucHanh").trim())); }
		if (req.getParameter("areaPhuongPhapHocTap") != null) {
			chuongTrinhDaoTaoModel.setPhuongPhap3(StringUtil.toUTF8(req.getParameter("areaPhuongPhapHocTap").trim())); }
		if (req.getParameter("txtThoiGianDaoTao") != null) {
			chuongTrinhDaoTaoModel.setThoiGian1(req.getParameter("txtThoiGianDaoTao").trim()); }
		if (req.getParameter("cboThoiGianHocTap") != null) {
			chuongTrinhDaoTaoModel.setThoiGian2(req.getParameter("cboThoiGianHocTap").trim()); }
		if (req.getParameter("cboThoigianThucHocToiThieu") != null) {
			chuongTrinhDaoTaoModel.setThoiGian3(req.getParameter("cboThoigianThucHocToiThieu").trim()); }
		if (req.getParameter("txtThoiGian4") != null) {
			chuongTrinhDaoTaoModel.setThoiGian4(req.getParameter("txtThoiGian4").trim()); }
		if (req.getParameter("txtThoiGian5") != null) {
			chuongTrinhDaoTaoModel.setThoiGian5(req.getParameter("txtThoiGian5").trim()); }
		if (req.getParameter("txtThoiGian6") != null) {
			chuongTrinhDaoTaoModel.setThoiGian6(req.getParameter("txtThoiGian6").trim()); }
		if (req.getParameter("txtThoiGian7") != null) {
			chuongTrinhDaoTaoModel.setThoiGian7(req.getParameter("txtThoiGian7").trim()); }
		if (req.getParameter("txtThoiGian8") != null) {
			chuongTrinhDaoTaoModel.setThoiGian8(req.getParameter("txtThoiGian8").trim()); }
		if (req.getParameter("txtPhanBo1") != null) {
			chuongTrinhDaoTaoModel.setPhanBo1(req.getParameter("txtPhanBo1").trim()); }
		if (req.getParameter("txtPhanBo2") != null) {
			chuongTrinhDaoTaoModel.setPhanBo2(req.getParameter("txtPhanBo2").trim()); }
		if (req.getParameter("txtPhanBo3") != null) {
			chuongTrinhDaoTaoModel.setPhanBo3(req.getParameter("txtPhanBo3").trim()); }
		if (req.getParameter("txtPhanBo4") != null) {
			chuongTrinhDaoTaoModel.setPhanBo4(req.getParameter("txtPhanBo4").trim()); }
		if (req.getParameter("areaThiHocKi") != null) {
			chuongTrinhDaoTaoModel.setThiHocKi(StringUtil.toUTF8(req.getParameter("areaThiHocKi").trim())); }
		if (req.getParameter("areaThiTotNghiep") != null) {
			chuongTrinhDaoTaoModel.setThiTotNghiep(StringUtil.toUTF8(req.getParameter("areaThiTotNghiep").trim())); }
		if (req.getParameter("areaTTSX") != null) {
			chuongTrinhDaoTaoModel.setThucTap(StringUtil.toUTF8(req.getParameter("areaTTSX").trim())); }
		if (req.getParameter("areaYKienDeXuat") != null) {
			chuongTrinhDaoTaoModel.setyKienDeXuat(StringUtil.toUTF8(req.getParameter("areaYKienDeXuat").trim())); }
		chuongTrinhDaoTaoModel.setNgayGui("");
		Integer count = 0; 
		int status = 0;
		ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList1 = new ArrayList<ChiTietMonHocCTDTModel>();
		ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList2 = new ArrayList<ChiTietMonHocCTDTModel>();
		ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList3 = new ArrayList<ChiTietMonHocCTDTModel>();
		for (Integer i = 1; i<= Integer.parseInt(req.getSession().getAttribute("Rows1") + ""); i++) {
			
			ChiTietMonHocCTDTModel obj = new ChiTietMonHocCTDTModel();
			/*if(req.getParameter("MaDeCuong_PhanI_" + i.toString()).equals("-1") && chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1() != null) {
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().add(i-1, obj);
				obj.setMaDeCuong("");
			}
			else {*/
				if (chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1() != null
				&& i <= chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().size()) {
					obj = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i-1);
				}
				obj.setMaDeCuong(req.getParameter("MaDeCuong_PhanI_" + i.toString()));
			//}
			obj.setTinhTrang(req.getParameter("TinhTrang_PhanI_" + i.toString()));
			obj.setMaNguoiTaoDeCuong(req.getParameter("MaNguoiTaoDeCuong_PhanI_" + i.toString()));
			//if(obj.getTinhTrang() == null)
				//obj.setTinhTrang("");
			if(obj.getTinhTrang().equals(Constant.TINHTRANG_NEW) 
					|| obj.getTinhTrang().equals(Constant.TINHTRANG_REJECT)
						|| obj.getTinhTrang().equals("") 
							|| obj.getTinhTrang().equals(Constant.TINHTRANG_SEND)) {
				tinhTrang = false;
				if(req.getParameter("actionType").equals("CapNhat")) {
					if(!obj.getTinhTrang().equals(Constant.TINHTRANG_SEND) && obj.getMaDeCuong() != "" && (!obj.getLyThuyetBeforeUpdate().equals(req.getParameter("cboLyThuyet_PhanI_" + i.toString())) || !obj.getThucHanhBeforeUpdate().equals(req.getParameter("cboThucHanh_PhanI_" + i.toString())))) {
						status = 1;
					}
					obj.setLyThuyetBeforeUpdate(req.getParameter("cboLyThuyet_PhanI_" + i.toString()));
					obj.setThucHanhBeforeUpdate(req.getParameter("cboThucHanh_PhanI_" + i.toString()));
				}
			}
			obj.setKiemTraTrung("0");
			obj.setMaHocPhan("1");
			Integer thuTu = i - count;
			obj.setThuTu(thuTu.toString());
			if (req.getParameter("cboMonHoc_PhanI_" + i.toString()) != null) {
				obj.setMaMonHoc(req.getParameter("cboMonHoc_PhanI_" + i.toString().trim())); }
			if (req.getParameter("cboNamHoc_PhanI_" + i.toString()) != null) {
				obj.setNamHoc(req.getParameter("cboNamHoc_PhanI_" + i.toString().trim())); }
			if (req.getParameter("cboHocKi_PhanI_" + i.toString()) != null) {
				obj.setHocKi(req.getParameter("cboHocKi_PhanI_" + i.toString().trim())); }
			if (req.getParameter("cboLyThuyet_PhanI_" + i.toString()) != null) {
				obj.setLyThuyet(req.getParameter("cboLyThuyet_PhanI_" + i.toString().trim())); }
			if (req.getParameter("cboThucHanh_PhanI_" + i.toString()) != null) {
				obj.setThucHanh(req.getParameter("cboThucHanh_PhanI_" + i.toString().trim())); }
			if (req.getParameter("cboTinhChat_PhanI_" + i.toString()) != null) {
				obj.setTinhChat(StringUtil.toUTF8(req.getParameter("cboTinhChat_PhanI_" + i.toString().trim()))); }
			if (req.getParameter("chkRow_PhanI_" + i.toString()) != null && req.getParameter("XuLyDong_Phan1").equals("XoaDong")) { 
			// Row nay dang bi chon de DELETE ==> ko dua vao Object Model
				countRowSelect++; 
				count++;
				String id = obj.getMaChiTietCTDT();
				if(id != null) {
					ChiTietMonHocCTDTDAO.deleteChiTietMonHocCTDT(id);
					if(obj.getMaDeCuong() != "") {
						DeCuongMonHocDAO.deleteDCMH(obj.getMaDeCuong());
						MailUtil.sendEmail(	MailDAO.getMailByMaThanhVien(obj.getMaNguoiTaoDeCuong()),
								MailDAO.getMailByMaThanhVien(chuongTrinhDaoTaoModel.getMaNguoiTao()),
									"[ISO] - Thong Bao - Update - CHUONG TRINH DAO TAO",
										MailDAO.getContentUpdateByChucNangAndDeleteMonHoc(Constant.CHUCNANG_CHUONGTRINHDAOTAO, 
												"CHƯƠNG TRÌNH ĐÀO TẠO HỆ " + chuongTrinhDaoTaoModel.getTenTrinhDo().toUpperCase() + " NGÀNH " + chuongTrinhDaoTaoModel.getTenNghe().toUpperCase() + " " + chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao(), 
													chuongTrinhDaoTaoModel.getTenNguoiTao(), 
														SysParamsDAO.getSysParams().getGioHeThong(), 
															obj.getTenMonHoc()));
						
					}
					req.setAttribute("msgDeleteRow", "XoaDong");
				}
			} else { 
				if(status == 1) {
					maNguoiTaoDeCuongUpdateList.add(obj.getMaNguoiTaoDeCuong());
					tenMonHocUpdateList.add(obj.getTenMonHoc());	
				}
				chiTietMonHocCTDTModelList1.add(obj);
			}	
			status = 0;
		}
		count = 0;
		for (Integer i = 1; i<= Integer.parseInt(req.getSession().getAttribute("Rows2") + ""); i++) {
			ChiTietMonHocCTDTModel obj = new ChiTietMonHocCTDTModel();
			/*if(req.getParameter("MaDeCuong_PhanII_" + i.toString()).equals("-1") && chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2() != null) {
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().add(i-1, obj);
				obj.setMaDeCuong("");
			}
			else {*/
				if (chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2() != null
				&& i <= chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().size()) {
					obj = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i-1);
				}
				obj.setMaDeCuong(req.getParameter("MaDeCuong_PhanII_" + i.toString()));
			//}
			obj.setTinhTrang(req.getParameter("TinhTrang_PhanII_" + i.toString()));
			obj.setMaNguoiTaoDeCuong(req.getParameter("MaNguoiTaoDeCuong_PhanII_" + i.toString()));
			//if(obj.getTinhTrang() == null)
				//obj.setTinhTrang("");
			if(obj.getTinhTrang().equals(Constant.TINHTRANG_NEW) 
					|| obj.getTinhTrang().equals(Constant.TINHTRANG_REJECT)
						|| obj.getTinhTrang().equals("")
						|| obj.getTinhTrang().equals(Constant.TINHTRANG_SEND)) {
				tinhTrang = false;
				if(req.getParameter("actionType").equals("CapNhat")) {
					if(!obj.getTinhTrang().equals(Constant.TINHTRANG_SEND) && obj.getMaDeCuong() != "" && (!obj.getLyThuyetBeforeUpdate().equals(req.getParameter("cboLyThuyet_PhanII_" + i.toString())) || !obj.getThucHanhBeforeUpdate().equals(req.getParameter("cboThucHanh_PhanII_" + i.toString())))) {
						status = 1;
					}
					obj.setLyThuyetBeforeUpdate(req.getParameter("cboLyThuyet_PhanII_" + i.toString()));
					obj.setThucHanhBeforeUpdate(req.getParameter("cboThucHanh_PhanII_" + i.toString()));
				}
			}
			obj.setKiemTraTrung("0");
			obj.setMaHocPhan("2");
			Integer thuTu = i - count;
			obj.setThuTu(thuTu.toString());
			if (req.getParameter("cboMonHoc_PhanII_" + i.toString()) != null) {
				obj.setMaMonHoc(req.getParameter("cboMonHoc_PhanII_" + i.toString().trim())); }
			if (req.getParameter("cboNamHoc_PhanII_" + i.toString()) != null) {
				obj.setNamHoc(req.getParameter("cboNamHoc_PhanII_" + i.toString().trim())); }
			if (req.getParameter("cboHocKi_PhanII_" + i.toString()) != null) {
				obj.setHocKi(req.getParameter("cboHocKi_PhanII_" + i.toString().trim())); }
			if (req.getParameter("cboLyThuyet_PhanII_" + i.toString()) != null) {
				obj.setLyThuyet(req.getParameter("cboLyThuyet_PhanII_" + i.toString().trim())); }
			if (req.getParameter("cboThucHanh_PhanII_" + i.toString()) != null) {
				obj.setThucHanh(req.getParameter("cboThucHanh_PhanII_" + i.toString().trim())); }
			if (req.getParameter("cboTinhChat_PhanII_" + i.toString()) != null) {
				obj.setTinhChat(StringUtil.toUTF8(req.getParameter("cboTinhChat_PhanII_" + i.toString().trim()))); }
			if (req.getParameter("chkRow_PhanII_" + i.toString()) != null && req.getParameter("XuLyDong_Phan2").equals("XoaDong")) { 
			// Row nay dang bi chon de DELETE ==> ko dua vao Object Model
				countRowSelect++; 
				count++;
				String id = obj.getMaChiTietCTDT();
				if(id != null) {
					ChiTietMonHocCTDTDAO.deleteChiTietMonHocCTDT(id);
					if(obj.getMaDeCuong() != "") {
						DeCuongMonHocDAO.deleteDCMH(obj.getMaDeCuong());
						MailUtil.sendEmail(	MailDAO.getMailByMaThanhVien(obj.getMaNguoiTaoDeCuong()),
								MailDAO.getMailByMaThanhVien(chuongTrinhDaoTaoModel.getMaNguoiTao()),
									"[ISO] - Thong Bao - Update - CHUONG TRINH DAO TAO",
										MailDAO.getContentUpdateByChucNangAndDeleteMonHoc(Constant.CHUCNANG_CHUONGTRINHDAOTAO, 
												"CHƯƠNG TRÌNH ĐÀO TẠO HỆ " + chuongTrinhDaoTaoModel.getTenTrinhDo().toUpperCase() + " NGÀNH " + chuongTrinhDaoTaoModel.getTenNghe().toUpperCase() + " " + chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao(), 
													chuongTrinhDaoTaoModel.getTenNguoiTao(), 
														SysParamsDAO.getSysParams().getGioHeThong(), 
															obj.getTenMonHoc()));
						
					}
					req.setAttribute("msgDeleteRow", "XoaDong");
				}
			} else { 
				if(status == 1) {
					maNguoiTaoDeCuongUpdateList.add(obj.getMaNguoiTaoDeCuong());
					tenMonHocUpdateList.add(obj.getTenMonHoc());	
				}
				chiTietMonHocCTDTModelList2.add(obj);
			}	
			status = 0;
		}
		count = 0;
		for (Integer i = 1; i<= Integer.parseInt(req.getSession().getAttribute("Rows3") + ""); i++) {
			ChiTietMonHocCTDTModel obj = new ChiTietMonHocCTDTModel();
			/*if(req.getParameter("MaDeCuong_PhanIII_" + i.toString()).equals("-1") && chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3() != null) {
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().add(i-1, obj);
				obj.setMaDeCuong("");
			}
			else {*/
				if (chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3() != null
				&& i <= chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().size()) {
					obj = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i-1);
				}
				obj.setMaDeCuong(req.getParameter("MaDeCuong_PhanIII_" + i.toString()));
			//}
			obj.setKiemTraTrung("0");
			obj.setTinhTrang(req.getParameter("TinhTrang_PhanIII_" + i.toString()));
			obj.setMaNguoiTaoDeCuong(req.getParameter("MaNguoiTaoDeCuong_PhanIII_" + i.toString()));
			//if(obj.getTinhTrang() == null)
				//obj.setTinhTrang("");nh
			if(obj.getTinhTrang().equals(Constant.TINHTRANG_NEW) 
					|| obj.getTinhTrang().equals(Constant.TINHTRANG_REJECT)
						|| obj.getTinhTrang().equals("")
							|| obj.getTinhTrang().equals(Constant.TINHTRANG_SEND)) {
				tinhTrang = false;
				if(req.getParameter("actionType").equals("CapNhat")) {
					if(!obj.getTinhTrang().equals(Constant.TINHTRANG_SEND) && obj.getMaDeCuong() != "" && (!obj.getLyThuyetBeforeUpdate().equals(req.getParameter("cboLyThuyet_PhanIII_" + i.toString())) || !obj.getThucHanhBeforeUpdate().equals(req.getParameter("cboThucHanh_PhanIII_" + i.toString())))) {
						status = 1;
					}
					obj.setLyThuyetBeforeUpdate(req.getParameter("cboLyThuyet_PhanIII_" + i.toString()));
					obj.setThucHanhBeforeUpdate(req.getParameter("cboThucHanh_PhanIII_" + i.toString()));
				}
			}
			obj.setMaHocPhan("3");
			Integer thuTu = i - count;
			obj.setThuTu(thuTu.toString());
			if (req.getParameter("cboMonHoc_PhanIII_" + i.toString()) != null) {
				obj.setMaMonHoc(req.getParameter("cboMonHoc_PhanIII_" + i.toString().trim())); }
			if (req.getParameter("cboNamHoc_PhanIII_" + i.toString()) != null) {
				obj.setNamHoc(req.getParameter("cboNamHoc_PhanIII_" + i.toString().trim())); }
			if (req.getParameter("cboHocKi_PhanIII_" + i.toString()) != null) {
				obj.setHocKi(req.getParameter("cboHocKi_PhanIII_" + i.toString().trim())); }
			if (req.getParameter("cboLyThuyet_PhanIII_" + i.toString()) != null) {
				obj.setLyThuyet(req.getParameter("cboLyThuyet_PhanIII_" + i.toString().trim())); }
			if (req.getParameter("cboThucHanh_PhanIII_" + i.toString()) != null) {
				obj.setThucHanh(req.getParameter("cboThucHanh_PhanIII_" + i.toString().trim())); }
			if (req.getParameter("cboTinhChat_PhanIII_" + i.toString()) != null) {
				obj.setTinhChat(StringUtil.toUTF8(req.getParameter("cboTinhChat_PhanIII_" + i.toString().trim()))); }
			if (req.getParameter("chkRow_PhanIII_" + i.toString()) != null && req.getParameter("XuLyDong_Phan3").equals("XoaDong")) { 
			// Row nay dang bi chon de DELETE ==> ko dua vao Object Model
				countRowSelect++; 
				count++;
				String id = obj.getMaChiTietCTDT();
				if(id != null) {
					ChiTietMonHocCTDTDAO.deleteChiTietMonHocCTDT(id);
					if(obj.getMaDeCuong() != "") {
						DeCuongMonHocDAO.deleteDCMH(obj.getMaDeCuong());
						MailUtil.sendEmail(	MailDAO.getMailByMaThanhVien(obj.getMaNguoiTaoDeCuong()),
								MailDAO.getMailByMaThanhVien(chuongTrinhDaoTaoModel.getMaNguoiTao()),
									"[ISO] - Thong Bao - Update - CHUONG TRINH DAO TAO",
										MailDAO.getContentUpdateByChucNangAndDeleteMonHoc(Constant.CHUCNANG_CHUONGTRINHDAOTAO, 
												"CHƯƠNG TRÌNH ĐÀO TẠO HỆ " + chuongTrinhDaoTaoModel.getTenTrinhDo().toUpperCase() + " NGÀNH " + chuongTrinhDaoTaoModel.getTenNghe().toUpperCase() + " " + chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao(), 
													chuongTrinhDaoTaoModel.getTenNguoiTao(), 
														SysParamsDAO.getSysParams().getGioHeThong(), 
															obj.getTenMonHoc()));
						
					}
					req.setAttribute("msgDeleteRow", "XoaDong");
				}
			} else { 
				if(status == 1) {
					maNguoiTaoDeCuongUpdateList.add(obj.getMaNguoiTaoDeCuong());
					tenMonHocUpdateList.add(obj.getTenMonHoc());	
				}
				chiTietMonHocCTDTModelList3.add(obj);
			}	
			status = 0;
		}
		
		chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList1(chiTietMonHocCTDTModelList1);		
		chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList2(chiTietMonHocCTDTModelList2);	
		chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList3(chiTietMonHocCTDTModelList3);	
		return countRowSelect;
	}
	
	private void phanLoaiChuongTrinhDaoTao(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String select = request.getParameter("selectTinhTrang");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemChuongTrinhDaoTaoPath")
				+ "?msg=" + select);
		LogUtil.logInfo(loggerInfo, tenThanhVien + " phân loại chương trình đào tạo");
	}
	
	private void themChuongTrinhDaoTao(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String pageNext = Constant.PATH_RES.getString("iso.ThemChuongTrinhDaoTaoShortPath");
		String actionType = request.getParameter("actionType");
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);		
		ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();		
		request.setCharacterEncoding("UTF-8");
		tinhTrang = true;
		if (request.getSession().getAttribute("ChuongTrinhDaoTao") != null) { // Truong hop: Cap Nhat
			chuongTrinhDaoTaoModel = (ChuongTrinhDaoTaoModel) request.getSession().getAttribute("ChuongTrinhDaoTao");
		}
		Integer countRowSelected = 
					mapParameterToModel(request, response, chuongTrinhDaoTaoModel);
		
		if (request.getParameter("XuLyDong_Phan1") != null && request.getParameter("XuLyDong_Phan1").equals("ThemDong"))  { // Truong hop Add New Row
			pageNext += "?ThemDong1=1";
			rd = request.getRequestDispatcher(pageNext);
		} else if(request.getParameter("XuLyDong_Phan2") != null && request.getParameter("XuLyDong_Phan2").equals("ThemDong")) {
			pageNext += "?ThemDong2=2";
			rd = request.getRequestDispatcher(pageNext);
		} else if(request.getParameter("XuLyDong_Phan3") != null && request.getParameter("XuLyDong_Phan3").equals("ThemDong")) {
				pageNext += "?ThemDong3=3";
				rd = request.getRequestDispatcher(pageNext);
		} else if (request.getParameter("GuiHieuTruong") != null
				&& request.getParameter("GuiHieuTruong").equals("GuiPhongKiemDinh")) { // Truong hop Gui Hieu Truong
			if (chuongTrinhDaoTaoModel.validateModel()) {
				SysParamsModel sysParam = new SysParamsModel();
				if(tinhTrang == true) {
					chuongTrinhDaoTaoModel.setTinhTrang(Constant.TINHTRANG_PENDING);
					sysParam = SysParamsDAO.getNgayGioHeThong();
					chuongTrinhDaoTaoModel.setNgayGui(sysParam.getNgayHeThong());
					chuongTrinhDaoTaoModel.setGioGui(sysParam.getGioHeThong());
				}
				else
					chuongTrinhDaoTaoModel.setTinhTrang(Constant.TINHTRANG_NEW);
			
				if (ChuongTrinhDaoTaoDAO.updateChuongTrinhDaoTao(chuongTrinhDaoTaoModel)) {
					if(tinhTrang == true) {
						// Gui email
						MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PKID),
								MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(chuongTrinhDaoTaoModel.getMaNguoiTao()),///////////////
													MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_CHUONGTRINHDAOTAO),
														MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_CHUONGTRINHDAOTAO, 
																"CHƯƠNG TRÌNH ĐÀO TẠO HỆ " + chuongTrinhDaoTaoModel.getTenTrinhDo().toUpperCase() + " NGÀNH " + chuongTrinhDaoTaoModel.getTenNghe().toUpperCase() + " " + chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao(), 
																chuongTrinhDaoTaoModel.getTenNguoiTao(), 
																sysParam.getNgayHeThong() + " " + sysParam.getGioHeThong()));				
						//pageNext = Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoShortPath");
						LogUtil.logInfo(loggerInfo, tenThanhVien + " gửi mail cho Phòng kiểm định"); // ghi vào file log
						response.sendRedirect(Constant.PATH_RES
								.getString("iso.XemChuongTrinhDaoTaoPath"));
						return;
					} else {
						pageNext += "?errTinhTrang=No";
						rd = request.getRequestDispatcher(pageNext);
					}
				}
			} else { // Validate that bai
				pageNext += "?err='Validate Error'";					
				rd = request.getRequestDispatcher(pageNext);
			}	
		} else if (request.getParameter("GuiHieuTruong") != null
				&& request.getParameter("GuiHieuTruong").equals("GuiHieuTruong")) { // Truong hop Gui Hieu Truong
				chuongTrinhDaoTaoModel.setTinhTrang(Constant.TINHTRANG_SEND);
				//chuongTrinhDaoTaoModel.setUser1(request.getSession().getAttribute("maThanhVien").toString());
				if (ChuongTrinhDaoTaoDAO.phongKiemDinhGuiChuongTrinhChoBanGiamHieu(chuongTrinhDaoTaoModel.getMaChuongTrinhDaoTao()) == 1) {
						// Gui email
						sendMailHieuTruong(chuongTrinhDaoTaoModel);		
						//pageNext = Constant.PATH_RES.getString("iso.XemKeHoachDaoTaoShortPath");
						LogUtil.logInfo(loggerInfo, tenThanhVien + " gửi mail cho Ban Giám Hiệu"); // ghi vào file log
						response.sendRedirect(Constant.PATH_RES
								.getString("iso.XemChuongTrinhDaoTaoPath"));
						return;
				}
		} else if (request.getParameter("Copy") != null
				&& request.getParameter("Copy").equals("Copy")) {
			chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(null);
			chuongTrinhDaoTaoModel.setTinhTrang(null);
			chuongTrinhDaoTaoModel.setNgayCapNhatCuoi(null);
			chuongTrinhDaoTaoModel.setMaNguoiDuyet(null);
			chuongTrinhDaoTaoModel.setNgayDuyet(null);
			chuongTrinhDaoTaoModel.setNgayTao(null);
			chuongTrinhDaoTaoModel.setTenNguoiTao(null);
			chuongTrinhDaoTaoModel.setTenNguoiDuyet(null);
			for(int i=0;i<chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().size();i++)
			{
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i).setMaChuongTrinh(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i).setMaChiTietCTDT(null);	
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i).setNgayCapNhatCuoi(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i).setMaDeCuong(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i).setTinhTrang(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1().get(i).setMaNguoiTaoDeCuong(null);
			}
			for(int i=0;i<chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().size();i++)
			{
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i).setMaChuongTrinh(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i).setMaChiTietCTDT(null);	
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i).setNgayCapNhatCuoi(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i).setMaDeCuong(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i).setTinhTrang(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2().get(i).setMaNguoiTaoDeCuong(null);
			}
			for(int i=0;i<chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().size();i++)
			{
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i).setMaChuongTrinh(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i).setMaChiTietCTDT(null);	
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i).setNgayCapNhatCuoi(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i).setMaDeCuong(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i).setTinhTrang(null);
				chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3().get(i).setMaNguoiTaoDeCuong(null);
			}
		} else {  
			if (actionType.equals("ThemMoi")) { // Truong hop : Them "CHUONG TRINH DAO TAO"
				if (chuongTrinhDaoTaoModel.validateModel()) { // Validate thanh cong
					
					if(!ChuongTrinhDaoTaoDAO.checkNgheAndQuyetDinhOfChuongTrinh(chuongTrinhDaoTaoModel.getMaNghe(), chuongTrinhDaoTaoModel.getMaQuyetDinh())) {
						if(kiemTraMonHoc(chuongTrinhDaoTaoModel) == false) {	
							if (ChuongTrinhDaoTaoDAO.insertChuongTrinhDaoTao(chuongTrinhDaoTaoModel)) {
								LogUtil.logInfo(loggerInfo, tenThanhVien + " thêm mới chương trình đào tạo"); // ghi vào file log
								pageNext += "?msg=ThemMoi";						
								rd = request.getRequestDispatcher(pageNext);						
							}
						}
						else {
							pageNext += "?errTrungMonHoc='TrungMonHoc'";					
							rd = request.getRequestDispatcher(pageNext);
						}
					} else {
						pageNext += "?errNghe='TrungNghe'";						
						rd = request.getRequestDispatcher(pageNext);						
					}					
				}
				else {
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);
				}
			} else if(actionType.equals("CapNhat")) { // Truong hop: Cap nhat "CHUONG TRINH DAO TAO"
				if (chuongTrinhDaoTaoModel.validateModel()) { // Validate thanh cong
					if(kiemTraMonHoc(chuongTrinhDaoTaoModel) == false) {
						chuongTrinhDaoTaoModel.setTinhTrang(Constant.TINHTRANG_NEW);
							if (ChuongTrinhDaoTaoDAO.updateChuongTrinhDaoTao(chuongTrinhDaoTaoModel)) {
								LogUtil.logInfo(loggerInfo, tenThanhVien + " cập nhật chương trình đào tạo"); // ghi vào file log
								pageNext += "?msg=CapNhat";						
								rd = request.getRequestDispatcher(pageNext);
								for(int i=0;i<maNguoiTaoDeCuongUpdateList.size();i++) {
									MailUtil.sendEmail(	MailDAO.getMailByMaThanhVien(maNguoiTaoDeCuongUpdateList.get(i)),
											"",
												"[ISO] - Thong Bao - Update - CHUONG TRINH DAO TAO",
													MailDAO.getContentUpdateByChucNang(Constant.CHUCNANG_CHUONGTRINHDAOTAO, 
															"CHƯƠNG TRÌNH ĐÀO TẠO HỆ " + chuongTrinhDaoTaoModel.getTenTrinhDo().toUpperCase() + " NGÀNH " + chuongTrinhDaoTaoModel.getTenNghe().toUpperCase() + " " + chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao(), 
																chuongTrinhDaoTaoModel.getTenNguoiTao(), 
																	SysParamsDAO.getSysParams().getGioHeThong(), 
																		tenMonHocUpdateList.get(i)));
								}
							}
					}
					else {
						pageNext += "?errTrungMonHoc='TrungMonHoc'";					
						rd = request.getRequestDispatcher(pageNext);
					}
					//}
				} else { // Validate that bai
					pageNext += "?err='Validate Error'";					
					rd = request.getRequestDispatcher(pageNext);
				}
			}
		}
		request.setAttribute(Constant.CHUONG_TRINH_DAO_TAO_ATT, chuongTrinhDaoTaoModel);		
		rd.forward(request, response);
	}
	
	private void duyetChuongTrinhDaoTao(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		if(!request.getSession().getAttribute("maBoPhan").equals(Constant.BO_PHAN_BGH))
			userLoginID = "";
		for (Integer i = 0; i< Constant.RECORDS_PER_PAGE; i++) {
			if(request.getParameter("tinhtrang" + i.toString()) != null) {
				String choiseValue = request.getParameter("tinhtrang" + i.toString());
				String[] value = choiseValue.split("-");
				if (value[0].equals("Approve")) {
					String maChuongTrinhDaoTao = value[1];
					// Gui email inform APPROVE cho Truong Khoa
					if(request.getParameter("Type").equals("1")) {
						ChuongTrinhDaoTaoDAO.duyetChuongTrinhDaoTao(userLoginID, maChuongTrinhDaoTao, Constant.TINHTRANG_APPROVE, null);
						ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTaoByID(maChuongTrinhDaoTao);
						sendMailApprove(chuongTrinhDaoTaoModel);
						LogUtil.logInfo(loggerInfo, tenThanhVien + " approve Chương trình đào tạo");
					} else {
						ChuongTrinhDaoTaoDAO.phongKiemDinhGuiChuongTrinhChoBanGiamHieu(maChuongTrinhDaoTao);
						ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTaoByID(maChuongTrinhDaoTao);
						sendMailHieuTruong(chuongTrinhDaoTaoModel);
						LogUtil.logInfo(loggerInfo, tenThanhVien + " gửi Chương trình đào tạo cho hiệu trưởng");
					}
				}
				else if(value[0].equals("Reject")) {
					String maChuongTrinhDaoTao = value[1];
					ChuongTrinhDaoTaoDAO.duyetChuongTrinhDaoTao(userLoginID, maChuongTrinhDaoTao, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("Ly_do_reject" + i.toString()).trim()));
					LogUtil.logInfo(loggerInfo, tenThanhVien + " reject chương trình đào tạo"); // ghi vào file log
					ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = ChuongTrinhDaoTaoDAO.getChuongTrinhDaoTaoByID(maChuongTrinhDaoTao);
					// Gui email inform REJECT cho Truong Khoa
					sendMailReject(chuongTrinhDaoTaoModel);
				}
			}
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemChuongTrinhDaoTaoPath"));
	}
	public boolean kiemTraMonHoc(ChuongTrinhDaoTaoModel chuongTrinh) {
		boolean trung = false;
		ChiTietMonHocCTDTModel chiTiet;
		int size1 = chuongTrinh.getChiTietMonHocCTDTModelList1().size(), size2 = chuongTrinh.getChiTietMonHocCTDTModelList2().size(), size3 = chuongTrinh.getChiTietMonHocCTDTModelList3().size();
		for(int i=0;i<size1 + size2 + size3;i++) {
			if(i < size1)
				chiTiet = chuongTrinh.getChiTietMonHocCTDTModelList1().get(i);
			else if(i < size2 + size1)
				chiTiet = chuongTrinh.getChiTietMonHocCTDTModelList2().get(i - size1);
			else
				chiTiet = chuongTrinh.getChiTietMonHocCTDTModelList3().get(i - size1 - size2);
			if(chiTiet.getKiemTraTrung().equals("0")) {
				for(int j=i+1;j<size1 + size2 + size3;j++) {
					if(j<size1) {
						if(chuongTrinh.getChiTietMonHocCTDTModelList1().get(j).getKiemTraTrung().equals("0")) {
							if(chuongTrinh.getChiTietMonHocCTDTModelList1().get(j).getMaMonHoc().equals(chiTiet.getMaMonHoc())) {
								chuongTrinh.getChiTietMonHocCTDTModelList1().get(j).setKiemTraTrung("1");
								chiTiet.setKiemTraTrung("1");
								trung = true;
							}
						}
					} else if (j < size2 + size1) {
						if(chuongTrinh.getChiTietMonHocCTDTModelList2().get(j - size1).getKiemTraTrung().equals("0")) {
							if(chuongTrinh.getChiTietMonHocCTDTModelList2().get(j - size1).getMaMonHoc().equals(chiTiet.getMaMonHoc())) {
								chuongTrinh.getChiTietMonHocCTDTModelList2().get(j - size1).setKiemTraTrung("1");
								chiTiet.setKiemTraTrung("1");
								trung = true;
							}
						}
					} else {
						if(chuongTrinh.getChiTietMonHocCTDTModelList3().get(j - size2 - size1).getKiemTraTrung().equals("0")) {
							if(chuongTrinh.getChiTietMonHocCTDTModelList3().get(j - size2 - size1).getMaMonHoc().equals(chiTiet.getMaMonHoc())) {
								chuongTrinh.getChiTietMonHocCTDTModelList3().get(j - size2 - size1).setKiemTraTrung("1");
								chiTiet.setKiemTraTrung("1");
								trung = true;
							}
						}
					}
				}	
			} 
			if(i < size1)
				chuongTrinh.getChiTietMonHocCTDTModelList1().set(i, chiTiet);
			else if(i < size2 + size1)
				chuongTrinh.getChiTietMonHocCTDTModelList2().set(i - size1, chiTiet);
			else
				chuongTrinh.getChiTietMonHocCTDTModelList3().set(i - size1 - size2, chiTiet);
		}	
		
		return trung;
	}
	public void sendMailApprove(ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel) {
		MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(chuongTrinhDaoTaoModel.getMaNguoiTao()),///////////////
				MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
					MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_CHUONGTRINHDAOTAO),
						MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_CHUONGTRINHDAOTAO, 
								"CHƯƠNG TRÌNH ĐÀO TẠO HỆ " + chuongTrinhDaoTaoModel.getTenTrinhDo().toUpperCase() + " NGÀNH " + chuongTrinhDaoTaoModel.getTenNghe().toUpperCase() + " " + chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao(),
								chuongTrinhDaoTaoModel.getTenNguoiTao(), 
								chuongTrinhDaoTaoModel.getNgayGui() + " " + chuongTrinhDaoTaoModel.getGioGui(), 
								chuongTrinhDaoTaoModel.getTenNguoiDuyet(), 
								chuongTrinhDaoTaoModel.getNgayDuyet() + " " + chuongTrinhDaoTaoModel.getGioDuyet()));
	}
	public void sendMailReject(ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel) {
		MailUtil.sendEmailToBoPhan(	MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(chuongTrinhDaoTaoModel.getMaNguoiTao()),///////////////
				MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),//////////////,
					MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_CHUONGTRINHDAOTAO),
						MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_CHUONGTRINHDAOTAO, 
								"CHƯƠNG TRÌNH ĐÀO TẠO HỆ " + chuongTrinhDaoTaoModel.getTenTrinhDo().toUpperCase() + " NGÀNH " + chuongTrinhDaoTaoModel.getTenNghe().toUpperCase() + " " + chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao(), 
								chuongTrinhDaoTaoModel.getTenNguoiTao(), 
								chuongTrinhDaoTaoModel.getNgayGui() + " " + chuongTrinhDaoTaoModel.getGioGui(), 
									  chuongTrinhDaoTaoModel.getTenNguoiDuyet(), 
									  chuongTrinhDaoTaoModel.getNgayDuyet() + " " + chuongTrinhDaoTaoModel.getGioDuyet()));
	}
	public void sendMailHieuTruong(ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel) {
		MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),
				MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_PKID),///////////////
									MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_CHUONGTRINHDAOTAO),
										MailDAO.mailPhongKiemDinhGuiHieuTruong(Constant.CHUCNANG_CHUONGTRINHDAOTAO, 
												"CHƯƠNG TRÌNH ĐÀO TẠO HỆ " + chuongTrinhDaoTaoModel.getTenTrinhDo().toUpperCase() + " NGÀNH " + chuongTrinhDaoTaoModel.getTenNghe().toUpperCase() + " " + chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao(), 
													chuongTrinhDaoTaoModel.getTenNguoiTao(), 
														tenThanhVien));		
	}
}
