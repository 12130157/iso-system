package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BaiKiemTraModel;
import vn.edu.hungvuongaptech.model.TenBaiKiemTraModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class TenBaiKiemTraDAO {
	
	public static ArrayList<TenBaiKiemTraModel> showAllTenBaiKiemTra() {
		ArrayList<TenBaiKiemTraModel> listKetQua = new ArrayList<TenBaiKiemTraModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.GetAllTenBaiKiemTra"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				TenBaiKiemTraModel tenBaiKiemTraModel = new TenBaiKiemTraModel();
				
				tenBaiKiemTraModel.setMaTenBaiKiemTra(rs.getString("maTenBaiKiemTra"));
				tenBaiKiemTraModel.setTenBaiKiemTra(rs.getString("tenBaiKiemTra"));
				tenBaiKiemTraModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));			
				
				listKetQua.add(tenBaiKiemTraModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}

}
