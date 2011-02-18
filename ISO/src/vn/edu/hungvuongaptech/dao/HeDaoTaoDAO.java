package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChuyenNganhModel;
import vn.edu.hungvuongaptech.model.HeDaoTaoModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class HeDaoTaoDAO {
	public static ArrayList<HeDaoTaoModel> getHeDaoTao(){
		ArrayList<HeDaoTaoModel> heDaoTaoModelList = new ArrayList<HeDaoTaoModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetHeDaoTao"));	
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				HeDaoTaoModel heDaoTaoModel = new HeDaoTaoModel();
				heDaoTaoModel.setMaHeDaoTao(rs.getString("MaHeDaoTao"));
				heDaoTaoModel.setTenHeDaoTao(rs.getString("TenHeDaoTao"));
				heDaoTaoModel.setSoNam(rs.getString("SoNam"));
				heDaoTaoModel.setUser1(rs.getString("User1"));
				heDaoTaoModel.setUser1(rs.getString("User2"));
				heDaoTaoModel.setUser1(rs.getString("User3"));
				heDaoTaoModel.setUser1(rs.getString("User4"));
				heDaoTaoModel.setUser1(rs.getString("User5"));
				
				heDaoTaoModelList.add(heDaoTaoModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return heDaoTaoModelList;
	}
	
	public static HeDaoTaoModel getHeDaoTaoByMaHeDaoTao(String maHeDaoTao) {
		HeDaoTaoModel heDaoTaoModel = new HeDaoTaoModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetHeDaoTaoByMaHeDaoTao"));
			preparedStatement.setString(1, maHeDaoTao);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				heDaoTaoModel.setMaHeDaoTao(rs.getString("MaHeDaoTao"));
				heDaoTaoModel.setTenHeDaoTao(rs.getString("TenHeDaoTao"));
				heDaoTaoModel.setSoNam(rs.getString("SoNam"));
				heDaoTaoModel.setUser1(rs.getString("User1"));
				heDaoTaoModel.setUser1(rs.getString("User2"));
				heDaoTaoModel.setUser1(rs.getString("User3"));
				heDaoTaoModel.setUser1(rs.getString("User4"));
				heDaoTaoModel.setUser1(rs.getString("User5"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return heDaoTaoModel;
	}
	public static ArrayList<HeDaoTaoModel> getSoNamHeDaoTao() {
		ArrayList<HeDaoTaoModel> heDaoTaoList = new ArrayList<HeDaoTaoModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetSonamHeDaoTao"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				HeDaoTaoModel heDaoTaoModel = new HeDaoTaoModel();
				heDaoTaoModel.setMaChuongtrinh(rs.getString("maChuongTrinh"));
				heDaoTaoModel.setSoNam(rs.getString("SoNam"));
				heDaoTaoList.add(heDaoTaoModel);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return heDaoTaoList;	
	}
}
