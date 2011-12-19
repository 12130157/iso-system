package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.LoaiThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class LoaiThietBiDAO {
	public static ArrayList<LoaiThietBiModel> getAllLoaiThietBi(){
		ArrayList<LoaiThietBiModel> loaiThietBiList=new ArrayList<LoaiThietBiModel>();
		LoaiThietBiModel loaiThietBiModel;
		try {
			String sql = "SELECT * FROM LOAITHIETBI ORDER BY ID";
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				loaiThietBiModel = new LoaiThietBiModel();
				loaiThietBiModel.setMaLoaiThietBi(rs.getString("ID"));
				loaiThietBiModel.setTenLoaiThietBi(rs.getNString("Ten_loai_thiet_bi"));
				loaiThietBiList.add(loaiThietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loaiThietBiList;
	}

	
}
