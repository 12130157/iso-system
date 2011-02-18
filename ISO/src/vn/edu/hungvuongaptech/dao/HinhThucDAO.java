package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.HinhThucModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class HinhThucDAO {	

	public static ArrayList<HinhThucModel> showAllHinhThuc() {
		ArrayList<HinhThucModel> listKetQua = new ArrayList<HinhThucModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.GetAllHinhThuc"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				HinhThucModel hinhThucModel = new HinhThucModel();
				
				hinhThucModel.setMaHinhThuc(rs.getString("maHinhThuc"));
				hinhThucModel.setTenHinhThuc(rs.getNString("tenHinhThuc"));
				hinhThucModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));			
				
				listKetQua.add(hinhThucModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
}
