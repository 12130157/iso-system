package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.TinhTrangThietBiModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class DiChuyenThietBiDAO {
	public static ArrayList<ThietBiModel> getAllDiChuyenThietBiByListTrai(String maPhong) {
		ArrayList<ThietBiModel> thietBiModelList = new ArrayList<ThietBiModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllThietBiDiChuyen"));						
			preparedStatement.setNString(1,maPhong);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaPhongBan(rs.getString("MaPhongBan"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				
				thietBiModelList.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBiModelList;
	}
	
	public static ArrayList<ThietBiModel> getAllThietBiByMaPhong(String maPhong) {
		ArrayList<ThietBiModel> thietBiModelList = new ArrayList<ThietBiModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getThietBiByMaPhong"));						
			preparedStatement.setNString(1,maPhong);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaPhongBan(rs.getString("MaPhong"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhong"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				
				thietBiModelList.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBiModelList;
	}
	public static ArrayList<TinhTrangThietBiModel> searchTinhTrangTB() {
		ArrayList<TinhTrangThietBiModel> listKetQua = new ArrayList<TinhTrangThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllTinhTrang"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				TinhTrangThietBiModel TinhTrangTBModel = new TinhTrangThietBiModel();
				TinhTrangTBModel.setMaTinhTrang(rs.getString("MaTinhTrang"));
				TinhTrangTBModel.setTenTinhTrang(rs.getString("TenTinhTrang"));

				listKetQua.add(TinhTrangTBModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<ThietBiModel> showAllThietBi() {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaTinhTrang(rs.getString("MaTinhTrang"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));

				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
}
