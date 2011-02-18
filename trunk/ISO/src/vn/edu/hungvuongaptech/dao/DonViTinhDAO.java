package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.DonViTinhModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class DonViTinhDAO {

		public static ArrayList<DonViTinhModel> getAllDonViTinh(){
			ArrayList<DonViTinhModel> donViTinhList=new ArrayList<DonViTinhModel>();
			DonViTinhModel donViTinhModel;
			try {
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("QLTB.sql.getAllDonViTinh"));
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					donViTinhModel = new DonViTinhModel();
					donViTinhModel.setTenDonViTinh(rs.getNString("Ten"));
					donViTinhModel.setGhiChu(rs.getNString("GhiChu"));
					donViTinhModel.setMaDonViTinh(rs.getString("MaDonVi"));
					donViTinhModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
					donViTinhModel.setUser1(rs.getString("User1"));
					donViTinhModel.setUser2(rs.getString("User2"));							
					donViTinhModel.setUser3(rs.getString("User3"));
					donViTinhModel.setUser4(rs.getString("User4"));
					donViTinhModel.setUser5(rs.getString("User5"));
					donViTinhList.add(donViTinhModel);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return donViTinhList;
		}
}
