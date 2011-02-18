package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.LoaiCongViecChuanBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class LoaiCongViecChuanBiDAO {
	
	public static ArrayList<LoaiCongViecChuanBiModel> getAllLoaiCongViecChuanBi(){
		ArrayList<LoaiCongViecChuanBiModel> loaiCVCBModelList = new ArrayList<LoaiCongViecChuanBiModel>();
		LoaiCongViecChuanBiModel loaiCVCBModel;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllLoaiCongViecChuanBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				loaiCVCBModel=new LoaiCongViecChuanBiModel();
				loaiCVCBModel.setMaLoai(rs.getString("MaLoai"));
				loaiCVCBModel.setTen(rs.getString("Ten"));
				loaiCVCBModel.setUser1(rs.getString("User1"));
				loaiCVCBModel.setUser2(rs.getString("User2"));							
				loaiCVCBModel.setUser3(rs.getString("User3"));
				loaiCVCBModel.setUser4(rs.getString("User4"));
				loaiCVCBModel.setUser5(rs.getString("User5"));
				
				loaiCVCBModelList.add(loaiCVCBModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loaiCVCBModelList;
	}
	
}
