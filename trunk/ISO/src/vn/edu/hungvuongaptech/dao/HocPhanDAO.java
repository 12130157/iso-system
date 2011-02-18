package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.HocPhanModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class HocPhanDAO {
	
	public static ArrayList<HocPhanModel> showAllHocPhan() {
		ArrayList<HocPhanModel> listKetQua = new ArrayList<HocPhanModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllHocPhan"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				HocPhanModel HocPhanModel = new HocPhanModel();
				HocPhanModel.setMaHocPhan(rs.getString("MaHocPhan"));
				HocPhanModel.setTenHocPhan(rs.getString("TenHocPhan"));
				HocPhanModel.setGhiChu(rs.getString("GhiChu"));
						
				listKetQua.add(HocPhanModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static Boolean updateHocPhan(HocPhanModel model) {
		Boolean result = false;
		try {
			
			
			CallableStatement csmt = DataUtil.getConnection().prepareCall(
					"{call sp_Admin_UpdateHocPhan(?,?,?)}");
			csmt.setString("ID", model.getMaHocPhan());
			csmt.setNString("Ten", StringUtil.toTrim(model.getTenHocPhan()));
			csmt.setString("GhiChu", StringUtil.toTrim(model.getGhiChu()));
		
			result = DataUtil.executeNonStore(csmt);

		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}

		return result;
	}
	public static Boolean insertHocPhan(HocPhanModel model) {
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall(
					"{call sp_Admin_InsertHocPhan(?,?)}");
			csmt.setNString("Ten", model.getTenHocPhan());
			csmt.setString("GhiChu", model.getGhiChu());
		
			result = DataUtil.executeNonStore(csmt);

		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}

		return result;
	}

}
