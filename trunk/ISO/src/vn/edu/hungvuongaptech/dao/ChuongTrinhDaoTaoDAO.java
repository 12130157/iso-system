package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietMonHocCTDTModel;
import vn.edu.hungvuongaptech.model.ChuongTrinhDaoTaoModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class ChuongTrinhDaoTaoDAO {
	public static ArrayList<ChuongTrinhDaoTaoModel> getAllChuongTrinhDaoTaoAndTenNguoiTao() {
		ArrayList<ChuongTrinhDaoTaoModel> chuongTrinhDaoTaoModelList = new ArrayList<ChuongTrinhDaoTaoModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllChuongTrinhDaoTaoAndTenNguoiTao"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();
				chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(rs.getString("MaChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenChuongTrinhDaoTao(rs.getString("TenChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenNguoiTao(rs.getString("NguoiTao"));
				chuongTrinhDaoTaoModel.setNgayTao(rs.getString("NgayTao"));
				chuongTrinhDaoTaoModel.setTinhTrang(rs.getString("TinhTrang"));
				chuongTrinhDaoTaoModel.setLyDoReject(rs.getString("LyDoReject"));
				chuongTrinhDaoTaoModelList.add(chuongTrinhDaoTaoModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chuongTrinhDaoTaoModelList;
	}
	public static ArrayList<ChuongTrinhDaoTaoModel> getAllChuongTrinhDaoTaoAndTenNguoiTaoByMaNguoiTao(String maNguoiTao) {
		ArrayList<ChuongTrinhDaoTaoModel> chuongTrinhDaoTaoModelList = new ArrayList<ChuongTrinhDaoTaoModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllChuongTrinhDaoTaoAndTenNguoiTaoByMaNguoiTao"));
			preparedStatement.setString(1, maNguoiTao);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();
				chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(rs.getString("MaChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenChuongTrinhDaoTao(rs.getString("TenChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenNguoiTao(rs.getString("NguoiTao"));
				chuongTrinhDaoTaoModel.setNgayTao(rs.getString("NgayTao"));
				chuongTrinhDaoTaoModel.setTinhTrang(rs.getString("TinhTrang"));
				chuongTrinhDaoTaoModel.setLyDoReject(rs.getString("LyDoReject"));
				chuongTrinhDaoTaoModelList.add(chuongTrinhDaoTaoModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chuongTrinhDaoTaoModelList;
	}
	public static ChuongTrinhDaoTaoModel getChuongTrinhDaoTaoByID(String maChuongTrinh) {
		ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getChuongTrinhDaoTaoByID"));
			preparedStatement.setString(1, maChuongTrinh);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(rs.getString("MaChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenChuongTrinhDaoTao(rs.getString("TenChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				chuongTrinhDaoTaoModel.setMaNghe(rs.getString("MaNghe"));
				chuongTrinhDaoTaoModel.setTenNghe(rs.getString("TenNghe"));
				chuongTrinhDaoTaoModel.setKiHieu(rs.getString("KiHieu"));
				chuongTrinhDaoTaoModel.setMaTrinhDo(rs.getString("MaTrinhDo"));
				chuongTrinhDaoTaoModel.setDoiTuong1(rs.getString("DoiTuong1"));
				chuongTrinhDaoTaoModel.setDoiTuong2(rs.getString("DoiTuong2"));
				chuongTrinhDaoTaoModel.setDoiTuong3(rs.getString("DoiTuong3"));
				chuongTrinhDaoTaoModel.setBangCap(rs.getString("BangCap"));
				chuongTrinhDaoTaoModel.setSoLuongMonHoc(rs.getString("SoLuongMonHoc"));
				chuongTrinhDaoTaoModel.setMucTieu1(rs.getString("MucTieu1"));
				chuongTrinhDaoTaoModel.setMucTieu2(rs.getString("MucTieu2"));
				chuongTrinhDaoTaoModel.setMucTieu3(rs.getString("MucTieu3"));
				chuongTrinhDaoTaoModel.setMucTieu4(rs.getString("MucTieu4"));
				chuongTrinhDaoTaoModel.setMucTieu5(rs.getString("MucTieu5"));
				chuongTrinhDaoTaoModel.setPhuongPhap1(rs.getString("PhuongPhap1"));
				chuongTrinhDaoTaoModel.setPhuongPhap2(rs.getString("PhuongPhap2"));
				chuongTrinhDaoTaoModel.setPhuongPhap3(rs.getString("PhuongPhap3"));
				chuongTrinhDaoTaoModel.setThoiGian1(rs.getString("ThoiGian1"));
				chuongTrinhDaoTaoModel.setThoiGian2(rs.getString("ThoiGian2"));
				chuongTrinhDaoTaoModel.setThoiGian3(rs.getString("ThoiGian3"));
				chuongTrinhDaoTaoModel.setThoiGian4(rs.getString("ThoiGian4"));
				chuongTrinhDaoTaoModel.setThoiGian5(rs.getString("ThoiGian5"));
				chuongTrinhDaoTaoModel.setThoiGian6(rs.getString("ThoiGian6"));
				chuongTrinhDaoTaoModel.setThoiGian7(rs.getString("ThoiGian7"));
				chuongTrinhDaoTaoModel.setThoiGian8(rs.getString("ThoiGian8"));
				chuongTrinhDaoTaoModel.setPhanBo1(rs.getString("PhanBo1"));
				chuongTrinhDaoTaoModel.setPhanBo2(rs.getString("PhanBo2"));
				chuongTrinhDaoTaoModel.setPhanBo3(rs.getString("PhanBo3"));
				chuongTrinhDaoTaoModel.setPhanBo4(rs.getString("PhanBo4"));
				chuongTrinhDaoTaoModel.setPhanBo5(rs.getString("PhanBo5"));
				chuongTrinhDaoTaoModel.setPhanBo6(rs.getString("PhanBo6"));
				chuongTrinhDaoTaoModel.setThiHocKi(rs.getString("ThiHocKi"));
				chuongTrinhDaoTaoModel.setThiTotNghiep(rs.getString("ThiTotNghiep"));
				chuongTrinhDaoTaoModel.setThucTap(rs.getString("ThucTap"));
				chuongTrinhDaoTaoModel.setyKienDeXuat(rs.getString("YKienDeXuat"));
				chuongTrinhDaoTaoModel.setNgayTao(rs.getString("NgayTao"));
				chuongTrinhDaoTaoModel.setGioTao(rs.getString("GioTao"));
				chuongTrinhDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				chuongTrinhDaoTaoModel.setGioCapNhatCuoi(rs.getString("GioCapNhatCuoi"));
				chuongTrinhDaoTaoModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				chuongTrinhDaoTaoModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				chuongTrinhDaoTaoModel.setNgayDuyet(DateUtil.setDate(rs.getString("NgayDuyet")));
				chuongTrinhDaoTaoModel.setGioDuyet(rs.getString("GioDuyet"));
				chuongTrinhDaoTaoModel.setTinhTrang(rs.getString("TinhTrang"));
				chuongTrinhDaoTaoModel.setLyDoReject(rs.getString("LyDoReject"));
				chuongTrinhDaoTaoModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
				chuongTrinhDaoTaoModel.setGioGui(rs.getString("GioGui"));
				chuongTrinhDaoTaoModel.setUser1(rs.getString("User1"));
				chuongTrinhDaoTaoModel.setUser2(rs.getString("User2"));
				chuongTrinhDaoTaoModel.setUser3(rs.getString("User3"));
				chuongTrinhDaoTaoModel.setUser4(rs.getString("User4"));
				chuongTrinhDaoTaoModel.setUser5(rs.getString("User5"));
				chuongTrinhDaoTaoModel.setTenNguoiTao(rs.getString("NguoiTao"));
				chuongTrinhDaoTaoModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				chuongTrinhDaoTaoModel.setTenTrinhDo(rs.getString("TenTrinhDo"));
				
				ChiTietMonHocCTDTDAO.getChiTietCTDTByMaChuongTrinh(chuongTrinhDaoTaoModel);
			}
			return chuongTrinhDaoTaoModel;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Boolean insertChuongTrinhDaoTao(ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel) {
		boolean result = false;
		String maChuongTrinhDaoTaoNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertChuongTrinhDaoTao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setNString("Ten", chuongTrinhDaoTaoModel.getTenChuongTrinhDaoTao());
			csmt.setNString("Ten_nghe", chuongTrinhDaoTaoModel.getTenNghe());
			csmt.setString("Ma_nghe", chuongTrinhDaoTaoModel.getMaNghe());
			csmt.setString("Ma_trinh_do", chuongTrinhDaoTaoModel.getMaTrinhDo());
			csmt.setNString("Doi_tuong_1", chuongTrinhDaoTaoModel.getDoiTuong1());
			csmt.setNString("Doi_tuong_2", chuongTrinhDaoTaoModel.getDoiTuong2());
			csmt.setNString("Doi_tuong_3", chuongTrinhDaoTaoModel.getDoiTuong3());
			csmt.setNString("So_luong_mon_hoc", chuongTrinhDaoTaoModel.getSoLuongMonHoc());
			csmt.setNString("Muc_tieu_1", chuongTrinhDaoTaoModel.getMucTieu1());
			csmt.setNString("Muc_tieu_2", chuongTrinhDaoTaoModel.getMucTieu2());
			csmt.setNString("Muc_tieu_3", chuongTrinhDaoTaoModel.getMucTieu3());
			csmt.setNString("Muc_tieu_4", chuongTrinhDaoTaoModel.getMucTieu4());
			csmt.setNString("Muc_tieu_5", chuongTrinhDaoTaoModel.getMucTieu5());
			csmt.setNString("Phuong_phap_1", chuongTrinhDaoTaoModel.getPhuongPhap1());
			csmt.setNString("Phuong_phap_2", chuongTrinhDaoTaoModel.getPhuongPhap2());
			csmt.setNString("Phuong_phap_3", chuongTrinhDaoTaoModel.getPhuongPhap3());
			csmt.setNString("Thoi_gian_1", chuongTrinhDaoTaoModel.getThoiGian1());
			csmt.setNString("Thoi_gian_2", chuongTrinhDaoTaoModel.getThoiGian2());
			csmt.setNString("Thoi_gian_3", chuongTrinhDaoTaoModel.getThoiGian3());
			csmt.setNString("Thoi_gian_4", chuongTrinhDaoTaoModel.getThoiGian4());
			csmt.setNString("Thoi_gian_5", chuongTrinhDaoTaoModel.getThoiGian5());
			csmt.setNString("Thoi_gian_6", chuongTrinhDaoTaoModel.getThoiGian6());
			csmt.setNString("Thoi_gian_7", chuongTrinhDaoTaoModel.getThoiGian7());
			csmt.setNString("Thoi_gian_8", chuongTrinhDaoTaoModel.getThoiGian8());
			csmt.setNString("Phan_bo_1", chuongTrinhDaoTaoModel.getPhanBo1());
			csmt.setNString("Phan_bo_2", chuongTrinhDaoTaoModel.getPhanBo2());
			csmt.setNString("Phan_bo_3", chuongTrinhDaoTaoModel.getPhanBo3());
			csmt.setNString("Phan_bo_4", chuongTrinhDaoTaoModel.getPhanBo4());
			csmt.setNString("Phan_bo_5", chuongTrinhDaoTaoModel.getPhanBo5());
			csmt.setNString("Phan_bo_6", chuongTrinhDaoTaoModel.getPhanBo6());
			csmt.setNString("Thi_hoc_ki", chuongTrinhDaoTaoModel.getThiHocKi());
			csmt.setNString("Thi_tot_nghiep", chuongTrinhDaoTaoModel.getThiTotNghiep());
			csmt.setNString("Thuc_tap", chuongTrinhDaoTaoModel.getThucTap());
			csmt.setNString("Y_kien_de_xuat", chuongTrinhDaoTaoModel.getyKienDeXuat());
			csmt.setString("Ngay_tao",chuongTrinhDaoTaoModel.getNgayTao());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.VARCHAR);
			csmt.setString("Ma_nguoi_tao", chuongTrinhDaoTaoModel.getMaNguoiTao());
			csmt.setString("Ma_nguoi_duyet", null);
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Tinh_trang", Constant.TINHTRANG_NEW);
			csmt.setNString("Ly_do_reject", chuongTrinhDaoTaoModel.getLyDoReject());
			csmt.setString("Ma_quyet_dinh", chuongTrinhDaoTaoModel.getMaQuyetDinh());
			csmt.setNString("Bang_cap", chuongTrinhDaoTaoModel.getBangCap());
			csmt.setString("Ngay_gui", null);
			csmt.setString("User1", chuongTrinhDaoTaoModel.getUser1());
			csmt.setString("User2", chuongTrinhDaoTaoModel.getUser2());
			csmt.setString("User3", chuongTrinhDaoTaoModel.getUser3());
			csmt.setString("User4", chuongTrinhDaoTaoModel.getUser4());
			csmt.setString("User5", chuongTrinhDaoTaoModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				maChuongTrinhDaoTaoNew = csmt.getString("ID");
				chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(maChuongTrinhDaoTaoNew);
				chuongTrinhDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(csmt.getString("Ngay_cap_nhat_cuoi")));
				
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList1 = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList2 = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList3 = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelListAfterAdded1 = new ArrayList<ChiTietMonHocCTDTModel>();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelListAfterAdded2 = new ArrayList<ChiTietMonHocCTDTModel>();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelListAfterAdded3 = new ArrayList<ChiTietMonHocCTDTModel>();
				
				for (ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList1) {
					obj.setMaChuongTrinh(maChuongTrinhDaoTaoNew);
					obj.setMaDeCuong("");
					if (ChiTietMonHocCTDTDAO.insertChiTietMonHocCTDT(obj)) {
						chiTietMonHocCTDTModelListAfterAdded1.add(obj);
					}
				}
				for (ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList2) {
					obj.setMaChuongTrinh(maChuongTrinhDaoTaoNew);
					obj.setMaDeCuong("");
					if (ChiTietMonHocCTDTDAO.insertChiTietMonHocCTDT(obj)) {
						chiTietMonHocCTDTModelListAfterAdded2.add(obj);
					}
				}
				for (ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList3) {
					obj.setMaChuongTrinh(maChuongTrinhDaoTaoNew);
					obj.setMaDeCuong("");
					if (ChiTietMonHocCTDTDAO.insertChiTietMonHocCTDT(obj)) {
						chiTietMonHocCTDTModelListAfterAdded3.add(obj);
					}
				}
				chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList1(chiTietMonHocCTDTModelListAfterAdded1);	
				chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList2(chiTietMonHocCTDTModelListAfterAdded2);	
				chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList3(chiTietMonHocCTDTModelListAfterAdded3);	
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	public static Boolean updateChuongTrinhDaoTao(ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel) {
		boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateChuongTrinhDaoTao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", chuongTrinhDaoTaoModel.getMaChuongTrinhDaoTao());
			csmt.registerOutParameter("Ten", java.sql.Types.NVARCHAR);
			csmt.registerOutParameter("Ten_nghe", java.sql.Types.NVARCHAR);
			csmt.setString("Ma_nghe", chuongTrinhDaoTaoModel.getMaNghe());
			csmt.setString("Ma_trinh_do", chuongTrinhDaoTaoModel.getMaTrinhDo());
			csmt.setNString("Doi_tuong_1", chuongTrinhDaoTaoModel.getDoiTuong1());
			csmt.setNString("Doi_tuong_2", chuongTrinhDaoTaoModel.getDoiTuong2());
			csmt.setNString("Doi_tuong_3", chuongTrinhDaoTaoModel.getDoiTuong3());
			csmt.setNString("So_luong_mon_hoc", chuongTrinhDaoTaoModel.getSoLuongMonHoc());
			csmt.setNString("Muc_tieu_1", chuongTrinhDaoTaoModel.getMucTieu1());
			csmt.setNString("Muc_tieu_2", chuongTrinhDaoTaoModel.getMucTieu2());
			csmt.setNString("Muc_tieu_3", chuongTrinhDaoTaoModel.getMucTieu3());
			csmt.setNString("Muc_tieu_4", chuongTrinhDaoTaoModel.getMucTieu4());
			csmt.setNString("Muc_tieu_5", chuongTrinhDaoTaoModel.getMucTieu5());
			csmt.setNString("Phuong_phap_1", chuongTrinhDaoTaoModel.getPhuongPhap1());
			csmt.setNString("Phuong_phap_2", chuongTrinhDaoTaoModel.getPhuongPhap2());
			csmt.setNString("Phuong_phap_3", chuongTrinhDaoTaoModel.getPhuongPhap3());
			csmt.setNString("Thoi_gian_1", chuongTrinhDaoTaoModel.getThoiGian1());
			csmt.setNString("Thoi_gian_2", chuongTrinhDaoTaoModel.getThoiGian2());
			csmt.setNString("Thoi_gian_3", chuongTrinhDaoTaoModel.getThoiGian3());
			csmt.setNString("Thoi_gian_4", chuongTrinhDaoTaoModel.getThoiGian4());
			csmt.setNString("Thoi_gian_5", chuongTrinhDaoTaoModel.getThoiGian5());
			csmt.setNString("Thoi_gian_6", chuongTrinhDaoTaoModel.getThoiGian6());
			csmt.setNString("Thoi_gian_7", chuongTrinhDaoTaoModel.getThoiGian7());
			csmt.setNString("Thoi_gian_8", chuongTrinhDaoTaoModel.getThoiGian8());
			csmt.setNString("Phan_bo_1", chuongTrinhDaoTaoModel.getPhanBo1());
			csmt.setNString("Phan_bo_2", chuongTrinhDaoTaoModel.getPhanBo2());
			csmt.setNString("Phan_bo_3", chuongTrinhDaoTaoModel.getPhanBo3());
			csmt.setNString("Phan_bo_4", chuongTrinhDaoTaoModel.getPhanBo4());
			csmt.setNString("Phan_bo_5", chuongTrinhDaoTaoModel.getPhanBo5());
			csmt.setNString("Phan_bo_6", chuongTrinhDaoTaoModel.getPhanBo6());
			csmt.setNString("Thi_hoc_ki", chuongTrinhDaoTaoModel.getThiHocKi());
			csmt.setNString("Thi_tot_nghiep", chuongTrinhDaoTaoModel.getThiTotNghiep());
			csmt.setNString("Thuc_tap", chuongTrinhDaoTaoModel.getThucTap());
			csmt.setNString("Y_kien_de_xuat", chuongTrinhDaoTaoModel.getyKienDeXuat());
			//csmt.setString("Ngay_tao", chuongTrinhDaoTaoModel.getNgayTao());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.VARCHAR);
			csmt.setString("Ma_nguoi_tao", chuongTrinhDaoTaoModel.getMaNguoiTao());
			csmt.setString("Ma_nguoi_duyet", chuongTrinhDaoTaoModel.getMaNguoiDuyet());
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Tinh_trang", chuongTrinhDaoTaoModel.getTinhTrang());
			csmt.setNString("Ly_do_reject", null);
			csmt.setString("Ma_quyet_dinh", chuongTrinhDaoTaoModel.getMaQuyetDinh());
			csmt.setNString("Bang_cap", chuongTrinhDaoTaoModel.getBangCap());
			if(chuongTrinhDaoTaoModel.getNgayGui().equals(""))
				csmt.setString("Ngay_gui", null);
			else
				csmt.setString("Ngay_gui", DateUtil.setDate(chuongTrinhDaoTaoModel.getNgayGui()) + " " + chuongTrinhDaoTaoModel.getGioGui());
			csmt.setString("User1", chuongTrinhDaoTaoModel.getUser1());
			csmt.setString("User2", chuongTrinhDaoTaoModel.getUser2());
			csmt.setString("User3", chuongTrinhDaoTaoModel.getUser3());
			csmt.setString("User4", chuongTrinhDaoTaoModel.getUser4());
			csmt.setString("User5", chuongTrinhDaoTaoModel.getUser5());
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update "CHUONG TRINH DAO TAO" thanh cong				
				chuongTrinhDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(csmt.getString("Ngay_cap_nhat_cuoi")));
				chuongTrinhDaoTaoModel.setTenChuongTrinhDaoTao(csmt.getString("Ten"));
				chuongTrinhDaoTaoModel.setTenNghe(csmt.getString("Ten_nghe"));
				
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList1 = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList1();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList2 = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList2();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList3 = chuongTrinhDaoTaoModel.getChiTietMonHocCTDTModelList3();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelListAfterUpdated1 = new ArrayList<ChiTietMonHocCTDTModel>();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelListAfterUpdated2 = new ArrayList<ChiTietMonHocCTDTModel>();
				ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelListAfterUpdated3 = new ArrayList<ChiTietMonHocCTDTModel>();
				for (ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList1) {	
					if (obj.getMaChiTietCTDT() != null) { // Cap nhat "CHI TIET CHUONG TRINH DAO TAO" da ton tai
						ChiTietMonHocCTDTDAO.updateChiTietMonHocCTDT(obj);
					} else { // Them moi "CHI TIET MON HOC CHUONG TRINH DAO TAO"
						obj.setMaChuongTrinh(chuongTrinhDaoTaoModel.getMaChuongTrinhDaoTao());
						ChiTietMonHocCTDTDAO.insertChiTietMonHocCTDT(obj);
					}
					
					chiTietMonHocCTDTModelListAfterUpdated1.add(obj);
				}
				for (ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList2) {	
					if (obj.getMaChiTietCTDT() != null) { // Cap nhat "CHI TIET KE HOACH DAO TAO" da ton tai
						ChiTietMonHocCTDTDAO.updateChiTietMonHocCTDT(obj);
					} else { // Them moi "CHI TIET MON HOC CHUONG TRINH DAO TAO"
						obj.setMaChuongTrinh(chuongTrinhDaoTaoModel.getMaChuongTrinhDaoTao());
						ChiTietMonHocCTDTDAO.insertChiTietMonHocCTDT(obj);
					}
					
					chiTietMonHocCTDTModelListAfterUpdated2.add(obj);
				}
				for (ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList3) {	
					if (obj.getMaChiTietCTDT() != null) { // Cap nhat "CHI TIET KE HOACH DAO TAO" da ton tai
						ChiTietMonHocCTDTDAO.updateChiTietMonHocCTDT(obj);
					} else { // Them moi "CHI TIET MON HOC CHUONG TRINH DAO TAO"
						obj.setMaChuongTrinh(chuongTrinhDaoTaoModel.getMaChuongTrinhDaoTao());
						ChiTietMonHocCTDTDAO.insertChiTietMonHocCTDT(obj);
					}
					
					chiTietMonHocCTDTModelListAfterUpdated3.add(obj);
				}
				chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList1(chiTietMonHocCTDTModelListAfterUpdated1);
				chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList2(chiTietMonHocCTDTModelListAfterUpdated2);
				chuongTrinhDaoTaoModel.setChiTietMonHocCTDTModelList3(chiTietMonHocCTDTModelListAfterUpdated3);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	public static int duyetChuongTrinhDaoTao(String maNguoiDuyet, String maChuongTrinhDaoTao, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.duyetChuongTrinhDaoTaoByMaChuongTrinh"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maChuongTrinhDaoTao);
			result = preparedStatement.executeUpdate();
			return result;
		}catch(Exception e){e.printStackTrace();}
		return result;
	}	
	public static Boolean checkNgheAndQuyetDinhOfChuongTrinh(String maNghe, String maQuyetDinh) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_CheckNgheAndQuyetDinh(?,?,?)}");
			csmt.setString("Ma_quyet_dinh", maQuyetDinh);
			csmt.setString("Ma_nghe", maNghe);
			csmt.registerOutParameter("result", java.sql.Types.VARCHAR);
			if (DataUtil.executeNonStore(csmt)) {
				String kq = csmt.getString("result");
				if (kq.equals("0")) {
					result = false;
				}
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static ArrayList<ChuongTrinhDaoTaoModel> getAllChuongTrinhChuaDuyet() {
		ArrayList<ChuongTrinhDaoTaoModel> chuongTrinhDaoTaoModelList = new ArrayList<ChuongTrinhDaoTaoModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllChuongTrinhChuaDuyet"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();
				chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(rs.getString("MaChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenChuongTrinhDaoTao(rs.getString("TenChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenNghe(rs.getString("TenNghe"));
				chuongTrinhDaoTaoModel.setTenTrinhDo(rs.getString("TenTrinhDo"));
				chuongTrinhDaoTaoModelList.add(chuongTrinhDaoTaoModel);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return chuongTrinhDaoTaoModelList;
	}
	public static ArrayList<ChuongTrinhDaoTaoModel> getAllChuongTrinh() {
		ArrayList<ChuongTrinhDaoTaoModel> chuongTrinhDaoTaoModelList = new ArrayList<ChuongTrinhDaoTaoModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllChuongTrinh"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();
				chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(rs.getString("MaChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenChuongTrinhDaoTao(rs.getString("TenChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenNghe(rs.getString("TenNghe"));
				chuongTrinhDaoTaoModel.setTenTrinhDo(rs.getString("TenTrinhDo"));
				chuongTrinhDaoTaoModelList.add(chuongTrinhDaoTaoModel);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return chuongTrinhDaoTaoModelList;
	}
	
	public static int getCountChuongTrinhDaoTao(String tinhtrang, String maBoPhan, String check) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountChuongTrinhDaoTao(?,?,?,?)}");
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
			csmt.setString("Check", check);
			//csmt.registerOutParameter("Count", java.sql.Types.INTEGER);
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public static ArrayList<ChuongTrinhDaoTaoModel> getChuongTrinhDaoTao(int totalRows, String currenPage, String tinhTrang, String maBoPhan, String check) {
		ArrayList<ChuongTrinhDaoTaoModel> chuongTrinhDaoTaoModelsList = new ArrayList<ChuongTrinhDaoTaoModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetChuongTrinhDaoTao(?,?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
			csmt.setString("Check", check);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();
				chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(rs.getString("MaChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenChuongTrinhDaoTao(rs.getString("TenChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenNguoiTao(rs.getString("TenNguoiTao"));
				chuongTrinhDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				chuongTrinhDaoTaoModel.setTinhTrang(rs.getString("TinhTrang"));
				chuongTrinhDaoTaoModel.setLyDoReject(rs.getString("LyDoReject"));
				chuongTrinhDaoTaoModel.setTenTrinhDo(rs.getString("TenTrinhDo"));
				chuongTrinhDaoTaoModel.setTenNghe(rs.getString("TenNghe"));
				chuongTrinhDaoTaoModelsList.add(chuongTrinhDaoTaoModel);
			}
			Constant.CHECK_ROWS = chuongTrinhDaoTaoModelsList.size(); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return chuongTrinhDaoTaoModelsList;
	}
	public static ArrayList<ChuongTrinhDaoTaoModel> getAllChuongTrinhDaoTaoApproved() {
		ArrayList<ChuongTrinhDaoTaoModel> chuongTrinhDaoTaoModelList = new ArrayList<ChuongTrinhDaoTaoModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllChuongTrinhDaoTaoApproved"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChuongTrinhDaoTaoModel chuongTrinhDaoTaoModel = new ChuongTrinhDaoTaoModel();
				
				chuongTrinhDaoTaoModel.setMaChuongTrinhDaoTao(rs.getString("MaChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setTenChuongTrinhDaoTao(rs.getString("TenChuongTrinhDaoTao"));
				chuongTrinhDaoTaoModel.setMaNghe(rs.getString("MaNghe"));
				chuongTrinhDaoTaoModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				chuongTrinhDaoTaoModel.setMaTrinhDo(rs.getString("MaTrinhDo"));
				chuongTrinhDaoTaoModel.setTenNghe(rs.getString("TenNghe"));
				chuongTrinhDaoTaoModel.setTenTrinhDo(rs.getString("TenTrinhDo"));
				
				chuongTrinhDaoTaoModelList.add(chuongTrinhDaoTaoModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chuongTrinhDaoTaoModelList;
	}
	public static String getTinhTrangChuongTrinh(String maChuongTrinh) {
		String tinhTrang = "";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTinhTrangChuongTrinh"));
			preparedStatement.setString(1, maChuongTrinh);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next())
				tinhTrang = rs.getString("TinhTrang");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tinhTrang;	
	}
	public static int phongKiemDinhGuiChuongTrinhChoBanGiamHieu(String maChuongTrinh) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.phongKiemDinhGuiChuongTrinhChoBanGiamHieu"));
			preparedStatement.setString(1, Constant.TINHTRANG_SEND);
			preparedStatement.setString(2, maChuongTrinh);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;	
	}
}
