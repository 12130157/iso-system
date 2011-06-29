package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.LoaiLinhKienModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class LoaiLinhKienDAO {
	public static ArrayList<LoaiLinhKienModel> getAllLoaiLinhKien(){
		ArrayList<LoaiLinhKienModel> loaiLinhKienList = new ArrayList<LoaiLinhKienModel>();
		LoaiLinhKienModel loaiLinhKien;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("QLTB.sql.getAllLoaiLinhKien"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				loaiLinhKien = new LoaiLinhKienModel();
				loaiLinhKien.setMaLoaiLinhKien(rs.getString("MaLoaiLinhKien"));
				loaiLinhKien.setTenLoaiLinhKien(rs.getNString("TenLoaiLinhKien"));
				loaiLinhKien.setGhiChu(rs.getNString("GhiChu"));
				loaiLinhKien.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				loaiLinhKien.setUser1(rs.getString("User1"));
				loaiLinhKien.setUser2(rs.getString("User2"));							
				loaiLinhKien.setUser3(rs.getString("User3"));
				loaiLinhKien.setUser4(rs.getString("User4"));
				loaiLinhKien.setUser5(rs.getString("User5"));
				
				loaiLinhKienList.add(loaiLinhKien);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loaiLinhKienList;
	}

}
