package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import vn.edu.hungvuongaptech.model.LuongModel;
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
	
	public static ArrayList<LuongModel> getDanhSachLuongByMaThanhVien(String maThanhVien){
		ArrayList<LuongModel> list = new ArrayList<LuongModel>();
		try {
			String sql = "SELECT * FROM LUONG WHERE MA_THANH_VIEN=? ORDER BY NGAY_XEP_LUONG DESC";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				LuongModel model = new LuongModel();
				model.setId(rs.getString("ID"));
				model.setMaThanhVien(rs.getString("Ma_thanh_vien"));
				model.setLoaiVienChuc(rs.getString("Loai_vien_chuc"));
				model.setMaNgach(rs.getString("Ma_ngach"));
				model.setBacLuong(rs.getString("Bac_luong"));
				model.setHeSoLuong(rs.getString("He_so_luong"));
				model.setNgayXepLuong(rs.getString("Ngay_xep_luong"));
				model.setGhiChu(rs.getString("Ghi_chu"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
