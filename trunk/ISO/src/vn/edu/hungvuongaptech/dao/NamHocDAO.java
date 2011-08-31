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
	
	public static NamHocModel getNamHocByNamBatDau(String namBatDau){
		NamHocModel model = null;
		try {
			String sql = "SELECT * FROM NAMHOC WHERE Nam_bat_dau=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, namBatDau);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new NamHocModel();
				model.setMaNamHoc(rs.getString("ID"));
				model.setNamBatDau(rs.getString("Nam_bat_dau"));
				model.setNamKetThuc(rs.getString("Nam_ket_thuc"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static ArrayList<NamHocModel> getAllNamHocByNow(){
		ArrayList<NamHocModel> listNamHoc = new ArrayList<NamHocModel>();
		try {
			String sql = "SELECT * FROM NAMHOC WHERE Nam_bat_dau<=YEAR(GETDATE()) ORDER BY Nam_bat_dau";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				NamHocModel model = new NamHocModel();
				model.setMaNamHoc(rs.getString("ID"));
				model.setNamBatDau(rs.getString("Nam_bat_dau"));
				model.setNamKetThuc(rs.getString("Nam_ket_thuc"));
				listNamHoc.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listNamHoc;
	}
	public static NamHocModel getNamHocByMaNamHoc(String maNamHoc) {
		// TODO Auto-generated method stub
		NamHocModel namHocModel = new NamHocModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getNamHocByMaNamHoc"));
			preparedStatement.setString(1, maNamHoc);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				namHocModel.setNamBatDau(rs.getString("NamBatDau"));
				namHocModel.setNamKetThuc(rs.getString("namKetThuc"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return namHocModel;
	}
}
