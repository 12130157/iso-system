package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.TinhTrangThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class PhieuMuonThietBiDAO {
	public static ArrayList<PhieuMuonThietBiModel> showDanhSachMuon() {
		ArrayList<PhieuMuonThietBiModel> listKetQua = new ArrayList<PhieuMuonThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.showDanhSachMuon"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				PhieuMuonThietBiModel phieuMuonModel = new PhieuMuonThietBiModel();
				
				phieuMuonModel.setMaPhieuMuon(rs.getString("MaPhieuMuon"));
				phieuMuonModel.setMaThietBi(rs.getString("MaThietBi"));
				phieuMuonModel.setTenThietBi(rs.getString("TenThietBi"));
				phieuMuonModel.setHoThanhVien(rs.getString("Ho"));
				phieuMuonModel.setTenLot(rs.getString("TenLot"));
				phieuMuonModel.setTenThanhVien(rs.getString("TenThanhVien"));
				phieuMuonModel.setThoiGianMuon(rs.getString("ThoiGianMuon"));
				phieuMuonModel.setThoiGianTra(rs.getString("ThoiGianTra"));

				listKetQua.add(phieuMuonModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ChiTietPhieuMuonModel XemChiTietPhieuMuonByMaPhieuMuon(String maPhieuMuon) {
		ChiTietPhieuMuonModel chiTietPhieuMuonModel = new ChiTietPhieuMuonModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getChiTietPhieuMuonByMaPhieuMuon"));
			preparedStatement.setString(1, maPhieuMuon);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				chiTietPhieuMuonModel.setMaPhieuMuon(rs.getString("MaPhieuMuon"));
				chiTietPhieuMuonModel.setMaThietBi(rs.getString("MaThietBi"));
				chiTietPhieuMuonModel.setTenThietBi(rs.getString("TenThietBi"));
				chiTietPhieuMuonModel.setSoLuong(rs.getString("SoLuong"));
				chiTietPhieuMuonModel.setTinhTrang(rs.getString("TinhTrang"));
				chiTietPhieuMuonModel.setGhiChu(rs.getString("GhiChu"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietPhieuMuonModel;
	}
	public static ArrayList<ThietBiModel> getSearchTenAndKiHieuThietBi(String tenThietBi, String kiHieu, String maLoaiThietBi) {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();	
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_TimTenThietBiMuon(?,?,?)}");
	
			csmt.setString("TenThietBi", tenThietBi);
			csmt.setString("KiHieu", kiHieu);
			csmt.setString("MaLoaiThietBi", maLoaiThietBi);
			ResultSet rs = DataUtil.executeStore(csmt);

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				
				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<PhieuMuonThietBiModel> searchAllKhoa() {
		ArrayList<PhieuMuonThietBiModel> listKetQua = new ArrayList<PhieuMuonThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllKhoaTrungTam"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				PhieuMuonThietBiModel KhoaModel = new PhieuMuonThietBiModel();
				KhoaModel.setMaKhoa(rs.getString("MaKhoa"));
				KhoaModel.setTenKhoa(rs.getString("TenKhoa"));

				listKetQua.add(KhoaModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static ArrayList<ThanhVienModel> timAllThanhVienByMaKhoa() {
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllThanhVien"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				thanhVienModel.setMaBoPhan(rs.getString("MaKhoa"));
				thanhVienModel.setTenBoPhan(rs.getString("TenKhoa"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));

				listKetQua.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static ArrayList<ThanhVienModel> getAllThanhVienMuonThietBi(String maKhoa) {
		ArrayList<ThanhVienModel> thanhVienModelList = new ArrayList<ThanhVienModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getThanhVienByMaKhoa"));						
			preparedStatement.setNString(1,maKhoa);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				thanhVienModel.setMaBoPhan(rs.getString("MaKhoa"));
				thanhVienModel.setTenBoPhan(rs.getString("TenKhoa"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				
				thanhVienModelList.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thanhVienModelList;
	}
	
	public static String hienThiNgaylap() {
		String ngayLap = "";
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.showNgaylap"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				
				ngayLap=rs.getString("Thoi_gian_muon");

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ngayLap;
	}
	
	public static ArrayList<ThietBiModel> getAllThietBiByMaThanhVien(String maThanhVien) {
		ArrayList<ThietBiModel> thietBiModelList = new ArrayList<ThietBiModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getThietBiByMaThanhVien"));						
			preparedStatement.setNString(1,maThanhVien);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				
				thietBiModelList.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBiModelList;
	}
	
	public static ArrayList<ThietBiModel> showAllThietBi() {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getDaMuonThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));

				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	private String getMaxIDThietBi(){
		String maxID="";
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("QLTB.sql.getMaxIDThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				maxID=rs.getString("MAX");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return maxID;
	}
	
	public static Boolean muonThietBi(String maThietBi,PhieuMuonThietBiModel phieuMuon) {
		Boolean result = true;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_MuonThietBi(?,?,?,?,?)}");
			
			csmt.setString("ID",maThietBi);
			csmt.setString("ThoiGianTra",phieuMuon.getThoiGianTra());
			csmt.setNString("HoThanhVien",phieuMuon.getHoThanhVien());
			csmt.setNString("TenLot",phieuMuon.getTenLot());
			csmt.setNString("TenThanhVien",phieuMuon.getTenThanhVien());
			
			result = DataUtil.executeNonStore(csmt);

		} catch (Exception e) {
			e.printStackTrace();
		}						
		return result;
	}
}
