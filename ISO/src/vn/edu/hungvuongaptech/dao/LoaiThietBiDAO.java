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
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("QLTB.sql.getAllLoaiThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				loaiThietBiModel = new LoaiThietBiModel();
				loaiThietBiModel.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
				loaiThietBiModel.setTenLoaiThietBi(rs.getNString("TenLoaiThietBi"));
				loaiThietBiModel.setGhiChu(rs.getNString("GhiChu"));
				loaiThietBiModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				loaiThietBiModel.setUser1(rs.getString("User1"));
				loaiThietBiModel.setUser2(rs.getString("User2"));							
				loaiThietBiModel.setUser3(rs.getString("User3"));
				loaiThietBiModel.setUser4(rs.getString("User4"));
				loaiThietBiModel.setUser5(rs.getString("User5"));
				loaiThietBiList.add(loaiThietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loaiThietBiList;
	}

	
}
