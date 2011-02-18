package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.CongTacModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class CongTacDAO {
	public static ArrayList<CongTacModel> getAllCongTac() {
		ArrayList<CongTacModel> congTacModelList = new ArrayList<CongTacModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllChiTiet"));		
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				CongTacModel congTacModel = new CongTacModel();
				congTacModel.setMaCongTac(rs.getString("MaCongTac"));
				congTacModel.setNoiDung(rs.getString("NoiDung"));
				congTacModelList.add(congTacModel);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return congTacModelList;
	}
	public static ArrayList<CongTacModel> getCongTac() {
		ArrayList<CongTacModel> congTacModelList = new ArrayList<CongTacModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getCongTac"));		
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				CongTacModel congTacModel = new CongTacModel();
				congTacModel.setMaCongTac(rs.getString("MaCongTac"));
				congTacModel.setNoiDung(rs.getString("NoiDung"));
				congTacModel.setGhiChu(rs.getString("GhiChu"));
				congTacModelList.add(congTacModel);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return congTacModelList;
	}
	
	public static Boolean insertCongTac(CongTacModel congTacModel) {
		Boolean result = false;		
		try {
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_InsertCongTac(?,?)}");
			csmt.setNString("Noi_dung", StringUtil.toTrim(congTacModel.getNoiDung()));
			csmt.setString("Ghi_chu", StringUtil.toTrim(congTacModel.getGhiChu()));
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // insert thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}				
	
	public static Boolean updateCongTac(CongTacModel congTacModel) {
		Boolean result = false;		
		try {
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateCongTac(?,?,?)}");
			csmt.setString("ID", congTacModel.getMaCongTac());
			csmt.setNString("Noi_dung", StringUtil.toTrim(congTacModel.getNoiDung()));
			csmt.setString("Ghi_chu", StringUtil.toTrim(congTacModel.getGhiChu()));
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}	
}
