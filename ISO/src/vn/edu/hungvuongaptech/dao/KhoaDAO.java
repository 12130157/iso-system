package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.PhongBanModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class KhoaDAO {

	public static ArrayList<KhoaModel> showAllKhoa() {
		ArrayList<KhoaModel> listKetQua = new ArrayList<KhoaModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("admin.sql.getAllKhoa"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				KhoaModel KhoaModel = new KhoaModel();
				KhoaModel.setMaKhoa(rs.getString("MaKhoa"));
				KhoaModel.setTenKhoa(rs.getString("TenKhoa"));

				listKetQua.add(KhoaModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}

	public static Boolean updateKhoaTT(KhoaModel model) {
		Boolean result = false;
		try {
			
			CallableStatement csmt = DataUtil.getConnection().prepareCall(
					"{call sp_Admin_UpdateKhoaTT(?,?,?,?)}");
			csmt.setString("ID", model.getMaKhoa());
			csmt.setNString("Ten", StringUtil.toTrim(model.getTenKhoa()));
			csmt.setString("Ma_truong_khoa", model.getMaTruongKhoa());
			csmt.setString("Nguoi_tao", model.getNguoiTao());

			result = DataUtil.executeNonStore(csmt);

		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}

		return result;
	}
	
	public static Boolean insertKhoaTT(KhoaModel model) {
		Boolean result = false;		
		try {	
			
			CallableStatement csmt = DataUtil.getConnection()
				.prepareCall("{call sp_Admin_InsertKhoaTT(?,?,?)}");
			csmt.setNString("Ten", StringUtil.toTrim(model.getTenKhoa()));
			csmt.setString("Ma_truong_khoa", model.getMaTruongKhoa());
			csmt.setString("Nguoi_tao", model.getNguoiTao());
			
			
			result = DataUtil.executeNonStore(csmt);

		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}

		return result;
	}
	
	public static ArrayList<KhoaModel> getAllKhoaCoSinhVien() {
		ArrayList<KhoaModel> listKetQua = new ArrayList<KhoaModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("admin.sql.getAllKhoaCoSinhVien"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				KhoaModel KhoaModel = new KhoaModel();
				KhoaModel.setMaKhoa(rs.getString("MaKhoa"));
				KhoaModel.setTenKhoa(rs.getString("TenKhoa"));

				listKetQua.add(KhoaModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	//muon thiet bi
	public static ArrayList<KhoaModel> getAllKhoa(String maKhoa) {
		ArrayList<KhoaModel> khoaModelList = new ArrayList<KhoaModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllKhoa"));						
			preparedStatement.setNString(1,maKhoa);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				KhoaModel KhoaModel = new KhoaModel();
				
				KhoaModel.setMaKhoa(rs.getString("MaKhoa"));
				KhoaModel.setTenKhoa(rs.getString("TenKhoa"));
				
				khoaModelList.add(KhoaModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return khoaModelList;
	}
	
	public static ArrayList<KhoaModel> showKhoaTrungTam() {
		ArrayList<KhoaModel> listKetQua = new ArrayList<KhoaModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.showKhoaTrungTam"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				KhoaModel KhoaModel = new KhoaModel();
				
				KhoaModel.setMaKhoa(rs.getString("MaKhoa"));
				KhoaModel.setTenKhoa(rs.getString("TenKhoa"));

				listKetQua.add(KhoaModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
}
