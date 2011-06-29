package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.TinhTrangThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ThayDoiThietBiDAO {	
	/*public static ArrayList<PhieuMuonThietBiModel> searchAllKhoa() {
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
	}*/
	
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
	
	public static ArrayList<ThanhVienModel> getAllThanhVienByKhoa(String maKhoa) {
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
	
	public static ArrayList<ThietBiModel> getSearchTenThietBi(String tenThietBi) {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();	
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_TimTenThietBiMuon(?)}");
	
			csmt.setString("TenThietBi", tenThietBi);
			ResultSet rs = DataUtil.executeStore(csmt);

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
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
}
