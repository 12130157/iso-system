package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.util.DataUtil;

public class SoTayGiaoVienDAO {
	public static String InsertSoTayGiaoVien(String maKHGD){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ISO_InsertSoTayGiaoVien(?,?)}");
			csmt.setString("Ma_KHGD", maKHGD);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String UpdateSoTayGiaoVien(String ID,String quanLyHocSinhCabiet,String danhGiaQuiTrinhGiangDay,String tinhTrang){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ISO_UpdateSoTayGiaoVien(?,?,?,?,?)}");
			csmt.setString("ID", ID);
			csmt.setString("Quan_ly_hoc_sinh_ca_biet", quanLyHocSinhCabiet);
			csmt.setString("Danh_gia_qui_trinh_giang_day", danhGiaQuiTrinhGiangDay);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	

}
