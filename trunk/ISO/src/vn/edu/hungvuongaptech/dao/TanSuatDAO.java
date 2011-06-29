package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.TanSuatModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class TanSuatDAO {
	public static ArrayList<TanSuatModel> getAllTanSuat(){
		ArrayList<TanSuatModel> tanSuatList=new ArrayList<TanSuatModel>();
		TanSuatModel tanSuatModel;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("QLTB.sql.getAllTanSuat"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				tanSuatModel = new TanSuatModel();
				tanSuatModel.setTenTanSuat(rs.getNString("Ten"));
				tanSuatModel.setGhiChu(rs.getNString("GhiChu"));
				tanSuatModel.setMaTanSuat(rs.getString("MaTanSuat"));
				tanSuatModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				tanSuatModel.setUser1(rs.getString("User1"));
				tanSuatModel.setUser2(rs.getString("User2"));							
				tanSuatModel.setUser3(rs.getString("User3"));
				tanSuatModel.setUser4(rs.getString("User4"));
				tanSuatModel.setUser5(rs.getString("User5"));
				tanSuatList.add(tanSuatModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tanSuatList;
	}
	
	public static int countThietBi() {
		Integer count=0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.countThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				count = Integer.parseInt(rs.getString("TotalRows"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}	
}
