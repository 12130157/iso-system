package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ThongKeDAO {
	
	/*public static ArrayList<ThietBiModel> showAllTanSuatThietBi() {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();
		try {
				PreparedStatement preparedStatement = DataUtil.getConnection()
				.prepareStatement(
						Constant.SQL_RES.getString("QLTB.sql.getAllThongKeThietBi"));
				ResultSet rs = preparedStatement.executeQuery();
		
			while (rs.next()) {			
				ThietBiModel thietBiModel = new ThietBiModel();
				
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
				thietBiModel.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
				thietBiModel.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				thietBiModel.setTenDonViTanSuat(rs.getString("TenDonViTanSuat"));
				thietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				thietBiModel.setSoMay(rs.getString("SoMay"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static ArrayList<ThietBiModel> getAllThongKeByMaNhaCungCap(String maNhaCungCap) {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();	
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllThongKeByMaNhaCungCap"));						
			preparedStatement.setNString(1,maNhaCungCap);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
				thietBiModel.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
				thietBiModel.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				thietBiModel.setTenDonViTanSuat(rs.getString("TenDonViTanSuat"));
				thietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				thietBiModel.setSoMay(rs.getString("SoMay"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				
				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static ArrayList<ThietBiModel> getAllThongKeByMaLoaiThietBi(String maLoaiThietBi) {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();	
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllThongKeByMaLoaiThietBi"));						
			preparedStatement.setNString(1,maLoaiThietBi);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
				thietBiModel.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
				thietBiModel.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				thietBiModel.setTenDonViTanSuat(rs.getString("TenDonViTanSuat"));
				thietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				thietBiModel.setSoMay(rs.getString("SoMay"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				
				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static ArrayList<ThietBiModel> getAllThongKeByMaPhongBan(String maPhongBan) {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();	
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllThongKeByMaPhongBan"));						
			preparedStatement.setNString(1,maPhongBan);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
				thietBiModel.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
				thietBiModel.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				thietBiModel.setTenDonViTanSuat(rs.getString("TenDonViTanSuat"));
				thietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				thietBiModel.setSoMay(rs.getString("SoMay"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				
				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static ArrayList<ThietBiModel> getAllThongKeByMaTinhTrang(String maTinhTrang) {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();	
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllThongKeByMaTinhTrang"));						
			preparedStatement.setNString(1,maTinhTrang);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
				thietBiModel.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
				thietBiModel.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				thietBiModel.setTenDonViTanSuat(rs.getString("TenDonViTanSuat"));
				thietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				thietBiModel.setSoMay(rs.getString("SoMay"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				
				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static ArrayList<ThietBiModel> getAllThongKeByTenThietBi(String tenThietBi) {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();	
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_TimTenThongKe(?)}");
	
			csmt.setString("TenThietBi", tenThietBi);
			ResultSet rs = DataUtil.executeStore(csmt);

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
				thietBiModel.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
				thietBiModel.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				thietBiModel.setTenDonViTanSuat(rs.getString("TenDonViTanSuat"));
				thietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				thietBiModel.setSoMay(rs.getString("SoMay"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				
				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}*/
}
