package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.BangCapModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class BangCapDAO {
	public static ArrayList<BangCapModel> getAllBangCapByMaThanhVien(String maThanhVien){
		ArrayList<BangCapModel> list = new ArrayList<BangCapModel>();
		try {
			String sql = "SELECT * "
						+" FROM BANGCAP "
						+" WHERE MA_THANH_VIEN=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				BangCapModel model = new BangCapModel();
				model.setId(rs.getString("ID"));
				model.setMaThanhVien(rs.getString("Ma_thanh_vien"));
				model.setLoaiBang(rs.getString("Loai_bang"));
				model.setTruongCap(rs.getString("Truong_cap"));
				model.setNamTotNghiep(rs.getString("Nam_tot_nghiep"));
				model.setLoaiTotNghiep(rs.getString("Loai_tot_nghiep"));
				model.setNgachLuong(rs.getString("Ngach_luong"));
				model.setChuyenNganh(rs.getString("Chuyen_nganh"));
				model.setBangCapChinh(rs.getString("Bang_cap_chinh"));
				model.setNgayCapNhatCuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static String insertBangCap(String maThanhVien,String loaiBang,String truongCap,String namTotNghiep,String loaiTotNghiep,String chuyenNganh,String bangCapChinh){
		String kq ="";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertBangCap(?,?,?,?,?,?,?,?)}");
			csmt.setString("Ma_thanh_vien", maThanhVien);
			csmt.setString("Loai_bang", loaiBang);
			csmt.setString("Truong_cap", truongCap);
			csmt.setString("Nam_tot_nghiep", namTotNghiep);
			csmt.setString("Loai_tot_nghiep", loaiTotNghiep);
			csmt.setString("Chuyen_nganh", chuyenNganh);
			csmt.setString("Bang_cap_chinh", bangCapChinh);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static void updateBangCapChinh(String maBangCap,String bangCapChinh){
		try {
			String sql = "UPDATE BANGCAP SET Bang_cap_chinh=? WHERE ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, bangCapChinh);
			ps.setString(2, maBangCap);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteBangCap(String maBangCap){
		try {
			String sql = "DELETE FROM BANGCAP WHERE ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maBangCap);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static int countBangCapByMaThanhVien(String maThanhVien){
		int kq = 0;
		try {
			String sql = " SELECT COUNT(*) AS KQ "
						+" FROM BANGCAP "
						+" WHERE MA_THANH_VIEN=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				kq = rs.getInt("KQ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
}
