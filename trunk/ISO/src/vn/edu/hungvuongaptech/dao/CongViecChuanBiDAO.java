package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.CongViecChuanBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class CongViecChuanBiDAO {

	public static ArrayList<CongViecChuanBiModel> getAllCongViecChuanBi(){
		ArrayList<CongViecChuanBiModel> congViecChuanBiModelList = new ArrayList<CongViecChuanBiModel>();
		CongViecChuanBiModel congViecChuanBiModel;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllCongViecChuanBi"));
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				congViecChuanBiModel=new CongViecChuanBiModel();
				congViecChuanBiModel.setMaCVCB(rs.getString("MaCVCB"));
				congViecChuanBiModel.setMaLoai(rs.getString("MaLoai"));
				congViecChuanBiModel.setTen(rs.getString("Ten"));
				congViecChuanBiModel.setUser1(rs.getString("User1"));
				congViecChuanBiModel.setUser2(rs.getString("User2"));							
				congViecChuanBiModel.setUser3(rs.getString("User3"));
				congViecChuanBiModel.setUser4(rs.getString("User4"));
				congViecChuanBiModel.setUser5(rs.getString("User5"));
				
				congViecChuanBiModelList.add(congViecChuanBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return congViecChuanBiModelList;
	}
	
	public static ArrayList<CongViecChuanBiModel> getAllCongViecChuanBiByMaLoai(String maLoai){
		ArrayList<CongViecChuanBiModel> congViecChuanBiModelList = new ArrayList<CongViecChuanBiModel>();
		CongViecChuanBiModel congViecChuanBiModel;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllCongViecChuanBiByMaLoai"));
			preparedStatement.setString(1,maLoai);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				congViecChuanBiModel=new CongViecChuanBiModel();
				congViecChuanBiModel.setMaCVCB(rs.getString("MaCVCB"));
				congViecChuanBiModel.setMaLoai(rs.getString("MaLoai"));
				congViecChuanBiModel.setTen(rs.getString("Ten"));
				congViecChuanBiModel.setUser1(rs.getString("User1"));
				congViecChuanBiModel.setUser2(rs.getString("User2"));							
				congViecChuanBiModel.setUser3(rs.getString("User3"));
				congViecChuanBiModel.setUser4(rs.getString("User4"));
				congViecChuanBiModel.setUser5(rs.getString("User5"));
				
				congViecChuanBiModelList.add(congViecChuanBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return congViecChuanBiModelList;
	}
}
