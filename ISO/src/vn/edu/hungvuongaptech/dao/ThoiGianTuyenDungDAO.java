package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.ThoiGianTuyenDungModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ThoiGianTuyenDungDAO {
	public static int InsertThoiGianTuyenDung(String maCTKH,String thoiGian){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertThoiGianTuyenDung(?,?,?)}");
			csmt.setString("Ma_CTKHTDNS", maCTKH);
			csmt.setString("Thoi_gian", thoiGian);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static void DeleteThoiGianTuyenDung(String maCTKH){
		try {
			String sql = "DELETE FROM ThoiGianTuyenDung WHERE Ma_CTKHTDNS=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maCTKH);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ArrayList<ThoiGianTuyenDungModel> getAllThoiGianByMaCTKHTNS(String maCTKH){
		ArrayList<ThoiGianTuyenDungModel> list = new ArrayList<ThoiGianTuyenDungModel>();
		try {
			String sql = "SELECT * FROM ThoiGianTuyenDung WHERE Ma_CTKHTDNS=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maCTKH);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ThoiGianTuyenDungModel model = new ThoiGianTuyenDungModel();
				model.setId(rs.getString("ID"));
				model.setMa_CTKHTDNS(rs.getString("Ma_CTKHTDNS"));
				model.setThoi_gian(rs.getString("Thoi_gian"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
}
