package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.HocKyModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class HocKyDAO {
	
	public static ArrayList<HocKyModel> getAllHocKy() {
		// TODO Auto-generated method stub
		ArrayList<HocKyModel> hocKyModelList = new ArrayList<HocKyModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllHocKy"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				HocKyModel hocKyModel = new HocKyModel();

				hocKyModel.setMaKhoa(rs.getString("maKhoa"));
				hocKyModel.setMaNamHoc(rs.getString("maNamHoc"));
				hocKyModel.setMaLop(rs.getString("maLop"));
				hocKyModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));
				hocKyModelList.add(hocKyModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return hocKyModelList;
	}
	
	public static ArrayList<HocKyModel> getHocKyByMaLop(String maLop) {
		// TODO Auto-generated method stub
		ArrayList<HocKyModel> hocKyModelList = new ArrayList<HocKyModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getHocKyByMaLop"));
			preparedStatement.setString(1, maLop);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				HocKyModel hocKyModel = new HocKyModel();

				hocKyModel.setMaKhoa(rs.getString("maKhoa"));
				hocKyModel.setMaNamHoc(rs.getString("maNamHoc"));
				hocKyModel.setMaLop(rs.getString("maLop"));
				hocKyModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));
				hocKyModelList.add(hocKyModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return hocKyModelList;
	}
}
