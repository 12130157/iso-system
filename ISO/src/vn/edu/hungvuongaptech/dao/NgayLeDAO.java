package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.NgayLeModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class NgayLeDAO {
	public static ArrayList<NgayLeModel> getAllNgayLe() {
		ArrayList<NgayLeModel> ngayLeList = new ArrayList<NgayLeModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllNgayLe"));
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				NgayLeModel ngayLe = new NgayLeModel();
				ngayLe.setMaNgayLe(rs.getString("MaNgayLe"));
				ngayLe.setNgay(rs.getString("Ngay"));
				ngayLe.setThang(rs.getString("Thang"));
				ngayLeList.add(ngayLe);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return ngayLeList;
	}
}
