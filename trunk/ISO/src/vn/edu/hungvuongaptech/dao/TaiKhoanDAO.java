package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.TaiKhoanModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class TaiKhoanDAO {
	public static TaiKhoanModel getTaiKhoanByMaTaiKhoan(String id){
		TaiKhoanModel taiKhoanModel=new TaiKhoanModel();
		
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("QLTB.sql.getTaiKhoanByMaTaiKhoan"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){			
				taiKhoanModel.setMaTaiKhoan(id);
				taiKhoanModel.setNganhang(rs.getString("NganHang"));
				taiKhoanModel.setNgayLapThe(rs.getString("NgayLapThe"));
				taiKhoanModel.setSoTaiKhoan(rs.getString("SoTaiKhoan"));
				taiKhoanModel.setUser1(rs.getString("User1"));
				taiKhoanModel.setUser2(rs.getString("User2"));
				taiKhoanModel.setUser3(rs.getString("User3"));
				taiKhoanModel.setUser4(rs.getString("User4"));
				taiKhoanModel.setUser5(rs.getString("User5"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return taiKhoanModel;
	}
	
	public static ArrayList<TaiKhoanModel> getAllTaiKhoan(){
		TaiKhoanModel taiKhoanModel;
		 ArrayList<TaiKhoanModel> taiKhoanList=new ArrayList<TaiKhoanModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("QLTB.sql.getAllTaiKhoan"));
		
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				taiKhoanModel=new TaiKhoanModel();
				taiKhoanModel.setMaTaiKhoan(rs.getString("MaTaiKhoan"));
				taiKhoanModel.setNganhang(rs.getString("NganHang"));
				taiKhoanModel.setNgayLapThe(rs.getString("NgayLapThe"));
				taiKhoanModel.setSoTaiKhoan(rs.getString("SoTaiKhoan"));
				taiKhoanModel.setUser1(rs.getString("User1"));
				taiKhoanModel.setUser2(rs.getString("User2"));
				taiKhoanModel.setUser3(rs.getString("User3"));
				taiKhoanModel.setUser4(rs.getString("User4"));
				taiKhoanModel.setUser5(rs.getString("User5"));
				taiKhoanList.add(taiKhoanModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return taiKhoanList;
	}
}
