package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.TieuChuanModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class TieuChuanDAO {
	public static int InsertTieuChuan(String maDenghi,String tieuChuan){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertTieuChuan(?,?,?)}");
			csmt.setString("Ma_de_nghi", maDenghi);
			csmt.setString("Tieu_chuan", tieuChuan);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int UpdateTieuChuan(String id,String tieuChuan){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateTieuChuan(?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Tieu_chuan", tieuChuan);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int DeleteTieuChuan(String maTieuChuan){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_DeleteTieuChuan(?,?)}");
			csmt.setString("ID", maTieuChuan);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int CountTieuChuanByMaDeNghi(String maDeNghi){
		int kq = 0;
		try {
			String sql = "SELECT COUNT(*) as KQ FROM TIEUCHUAN WHERE ma_de_nghi=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maDeNghi);
			ResultSet rs =  ps.executeQuery();
			if(rs.next()){
				kq = rs.getInt("KQ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static ArrayList<TieuChuanModel> getTieuChuanByMaDeNghi(String id){
		ArrayList<TieuChuanModel> list = new ArrayList<TieuChuanModel>();
		try {
			String sql = "SELECT * FROM TIEUCHUAN WHERE Ma_de_nghi=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				TieuChuanModel model = new TieuChuanModel();
				model.setId(rs.getString("ID"));
				model.setMa_de_nghi(rs.getString("Ma_de_nghi"));
				model.setTieu_chuan(rs.getString("Tieu_chuan"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
