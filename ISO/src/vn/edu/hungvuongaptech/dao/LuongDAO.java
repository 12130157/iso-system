package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;

import vn.edu.hungvuongaptech.util.DataUtil;

public class LuongDAO {
	public static String insertLuong(String maThanhVien,String loaiVienChuc,String maNgach,String bacLuong,String heSoLuong,String ngayXetLuong,String ghiChu){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertLuong(?,?,?,?,?,?,?)}");
			csmt.setString("Ma_thanh_vien", maThanhVien);
			csmt.setString("Loai_vien_chuc", loaiVienChuc);
			csmt.setString("Ma_ngach", maNgach);
			csmt.setString("Bac_luong", bacLuong);
			csmt.setString("He_so_luong", heSoLuong);
			csmt.setString("Ghi_chu", ghiChu);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return kq;
	}
}
