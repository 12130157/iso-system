package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.ChungChiBangCapKhacModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ChungChiBangCapKhacDAO {
	public static ArrayList<ChungChiBangCapKhacModel> getDanhSachChungChiBangCapKhac(){
		ArrayList<ChungChiBangCapKhacModel> list = new ArrayList<ChungChiBangCapKhacModel>();
		try {
			String sql = "SELECT * FROM CHUNGCHIBANGCAPKHAC ORDER BY LOAI";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChungChiBangCapKhacModel model = new ChungChiBangCapKhacModel();
				model.setId(rs.getString("ID"));
				model.setTen(rs.getString("Ten"));
				model.setLoai(rs.getString("Loai"));
				model.setDoUuTien(rs.getString("Do_uu_tien"));
				model.setNgayCapNhatCuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<ChungChiBangCapKhacModel> getDanhSachChungChiBangCapKhac(String loai){
		ArrayList<ChungChiBangCapKhacModel> list = new ArrayList<ChungChiBangCapKhacModel>();
		try {
			String sql = "SELECT * FROM CHUNGCHIBANGCAPKHAC WHERE LOAI=? ORDER BY DO_UU_TIEN";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, loai);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChungChiBangCapKhacModel model = new ChungChiBangCapKhacModel();
				model.setId(rs.getString("ID"));
				model.setTen(rs.getString("Ten"));
				model.setDoUuTien(rs.getString("Do_uu_tien"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<ChungChiBangCapKhacModel> getDanhSachChungChiBangCapKhacCuaThanhVien(String maThanhVien){
		ArrayList<ChungChiBangCapKhacModel> list = new ArrayList<ChungChiBangCapKhacModel>();
		try {
			String sql = "SELECT B.ID,CONVERT(VARCHAR(10),B.Ngay_bat_dau,105) as Ngay_bat_dau, "
						+" CONVERT(VARCHAR(10),B.Ngay_ket_thuc,105) as Ngay_ket_thuc, "
						+" B.Nam_tot_nghiep, "
						+" B.Xep_loai,A.Ten,A.Loai "
						+" FROM CHUNGCHIBANGCAPKHAC A INNER JOIN CHUNGCHIBANGCAPKHACCUATHANHVIEN B " 
						+" ON A.ID=B.MA_CCBCK "
						+" WHERE B.Ma_thanh_vien=? "
						+" ORDER BY A.DO_UU_TIEN";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChungChiBangCapKhacModel model = new ChungChiBangCapKhacModel();
				model.setId(rs.getString("ID"));
				model.setTen(rs.getString("Ten"));
				model.setLoai(rs.getString("Loai"));
				model.setNgayBatDau(rs.getString("Ngay_bat_dau"));
				model.setNgayKetThuc(rs.getString("Ngay_ket_thuc"));
				model.setNgayTotNghiep(rs.getString("Nam_tot_nghiep"));
				model.setXepLoai(rs.getString("Xep_loai"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static int countBangCapKhac(String maThanhVien){
		int kq = 0;
		try {
			String sql = "SELECT COUNT(*) AS KQ FROM CHUNGCHIBANGCAPKHACCUATHANHVIEN WHERE MA_THANH_VIEN=?";
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
	
	public static String insertChungChiBangCapKhac(String ten,String loai,String doUuTien){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertChungChiBangCapKhac(?,?,?,?)}");
			csmt.setString("Ten", ten);
			csmt.setString("Loai", loai);
			csmt.setString("Do_uu_tien", doUuTien);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String insertChungChiBangCapKhacCuaThanhVien(String maThanhVien,String maCCBCK,String ngayBatDau,String ngayKetThuc,String namTotNghiep,String xepLoai){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertChungChiBangCapKhacCuaThanhVien(?,?,?,?,?,?,?)}");
			csmt.setString("Ma_thanh_vien", maThanhVien);
			csmt.setString("Ma_CCBCK", maCCBCK);
			csmt.setString("Ngay_bat_dau", ngayBatDau);
			csmt.setString("Ngay_ket_thuc", ngayKetThuc);
			csmt.setString("Nam_tot_nghiep", namTotNghiep);
			csmt.setString("Xep_loai", xepLoai);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
}
