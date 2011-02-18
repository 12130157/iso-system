package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.NamHocModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class NamHocDAO {
	public static ArrayList<NamHocModel> getAllNamHoc() {
		// TODO Auto-generated method stub
		ArrayList<NamHocModel> namHocModelList = new ArrayList<NamHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllNamHoc"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				NamHocModel namHocModel = new NamHocModel();
				namHocModel.setMaNamHoc(rs.getString("MaNamHoc"));
				namHocModel.setNamBatDau(rs.getString("NamBatDau"));
				namHocModel.setNamKetThuc(rs.getString("NamKetThuc"));
				namHocModelList.add(namHocModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return namHocModelList;
	}
	
	public static int getMaxNamHoc() {
		// TODO Auto-generated method stub
		int max = 0 ; 
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getMaxNamHoc"));
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				max = rs.getInt("year");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return max;
	}
	
	public static ArrayList<NamHocModel> get2NamHocByNamBatDau(String nam1, String nam2) {
		// TODO Auto-generated method stub
		ArrayList<NamHocModel> namHocModelList = new ArrayList<NamHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getNamHocByNamBatDau"));
			preparedStatement.setString(1, nam1);
			preparedStatement.setString(2, nam2);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				NamHocModel namHocModel = new NamHocModel();
				namHocModel.setMaNamHoc(rs.getString("MaNamHoc"));
				namHocModel.setNamBatDau(rs.getString("NamBatDau"));
				namHocModel.setNamKetThuc(rs.getString("namKetThuc"));
				namHocModelList.add(namHocModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return namHocModelList;
	}
}
