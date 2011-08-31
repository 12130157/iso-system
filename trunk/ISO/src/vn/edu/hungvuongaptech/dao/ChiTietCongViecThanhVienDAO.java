package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.ChiTietCongViecThanhVienModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ChiTietCongViecThanhVienDAO {
	public static ArrayList<ChiTietCongViecThanhVienModel> getKhenThuongKyLuatByMaThanhVien(String maThanhVien){
		ArrayList<ChiTietCongViecThanhVienModel> list = new ArrayList<ChiTietCongViecThanhVienModel>();
		try {
			String sql = "SELECT A.*,REPLACE(A.Ghi_chu,char(13) + char(10),'<br/>') as Ghi_chu_2,C.Ten_vai_tro,(CAST(D.Nam_bat_dau AS VARCHAR)+' - '+CAST(D.Nam_ket_thuc AS VARCHAR)) as Nam_hoc "
						+" FROM CHITIETCONGVIECTHANHVIEN A INNER JOIN THANHVIEN B ON A.Ma_thanh_vien=B.ID "
						+" INNER JOIN VAITRO C ON A.Chuc_vu=C.ID "
						+" INNER JOIN NAMHOC D ON A.Ma_nam_hoc=D.ID"
						+" WHERE A.Ma_thanh_vien=?"
						+" ORDER BY A.Ma_nam_hoc ASC";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChiTietCongViecThanhVienModel model = new ChiTietCongViecThanhVienModel();
				model.setId(rs.getString("ID"));
				model.setMaNamHoc(rs.getString("Ma_nam_hoc"));
				model.setMaThanhVien(rs.getString("Ma_thanh_vien"));
				model.setChucVu(rs.getString("Chuc_vu"));
				model.setGhiChu(rs.getString("Ghi_chu_2"));
				model.setLoaiGhiChu(rs.getString("Loai_ghi_chu"));
				model.setNgayCapNhatCuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setUser1(rs.getString("User1"));
				model.setUser2(rs.getString("User2"));
				model.setUser3(rs.getString("User3"));
				model.setUser4(rs.getString("User4"));
				model.setUser5(rs.getString("User5"));
				model.setTenChucVu(rs.getString("Ten_vai_tro"));
				model.setNamHoc(rs.getString("Nam_hoc"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<ChiTietCongViecThanhVienModel> getThamNienByMaThanhVien(String maThanhVien){
		ArrayList<ChiTietCongViecThanhVienModel> list = new ArrayList<ChiTietCongViecThanhVienModel>();
		try {
			String sql = "SELECT (CAST(D.Nam_bat_dau AS VARCHAR)+' - '+CAST(D.Nam_ket_thuc AS VARCHAR)) as Nam_hoc "
						+" FROM CHITIETCONGVIECTHANHVIEN A INNER JOIN THANHVIEN B ON A.Ma_thanh_vien=B.ID "
						+" INNER JOIN VAITRO C ON A.Chuc_vu=C.ID "
						+" INNER JOIN NAMHOC D ON A.Ma_nam_hoc=D.ID "
						+" WHERE A.Ma_thanh_vien=? "
						+" GROUP BY D.Nam_bat_dau,D.Nam_ket_thuc";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChiTietCongViecThanhVienModel model = new ChiTietCongViecThanhVienModel();
				model.setNamHoc(rs.getString("Nam_hoc"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<String> getChucVuByMaThanhVien(String maThanhVien){
		ArrayList<String> list = new ArrayList<String>();
		try {
			String sql = " SELECT C.Ten_vai_tro "
						+" FROM CHITIETCONGVIECTHANHVIEN A INNER JOIN THANHVIEN B ON A.Ma_thanh_vien=B.ID "
						+" INNER JOIN VAITRO C ON A.Chuc_vu=C.ID "
						+" WHERE A.Ma_thanh_vien=? "
						+" GROUP BY C.Ten_vai_tro";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				list.add(rs.getString("Ten_vai_tro"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static int insertChiTietCongViecThanhVien(String maNamHoc,String maThanhVien,String chucVu,String ghiChu,String loaiGhiChu){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertChiTietCongViecThanhVien(?,?,?,?,?,?)}");
			csmt.setString("Ma_nam_hoc", maNamHoc);
			csmt.setString("Ma_thanh_vien", maThanhVien);
			csmt.setString("Chuc_vu", chucVu);
			csmt.setString("Ghi_chu", ghiChu);
			csmt.setString("Loai_ghi_chu", loaiGhiChu);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int updateChiTietCongViecThanhVien(String id,String ghiChu,String loaiGhiChu){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateChiTietCongViecThanhVien(?,?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ghi_chu", ghiChu);
			csmt.setString("Loai_ghi_chu", loaiGhiChu);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static ChiTietCongViecThanhVienModel getKTKLByID(String id){
		ChiTietCongViecThanhVienModel model = null;
		try {
			String sql = "SELECT ID,Ghi_chu,Loai_ghi_chu FROM CHITIETCONGVIECTHANHVIEN WHERE ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new ChiTietCongViecThanhVienModel();
				model.setId(rs.getString("ID"));
				model.setGhiChu(rs.getString("Ghi_chu"));
				model.setLoaiGhiChu(rs.getString("Loai_ghi_chu"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
}
