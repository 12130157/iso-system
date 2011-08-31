package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.KeHoachTNSModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class KeHoachTuyenNhanSuDAO {
	public static int InsertKeHoachTNS(String nam,String nguoiLap,String boSung){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertKeHoachTNS(?,?,?,?)}");
			csmt.setString("Nam", nam);
			csmt.setString("Nguoi_lap_ke_hoach", nguoiLap);
			csmt.setString("Bo_sung", boSung);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String UpdateKeHoachTNS(String maKeHoach,String tinhTrang){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateKeHoachTNS(?,?,?)}");
			csmt.setString("ID", maKeHoach);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	
	public static KeHoachTNSModel getKHByID(String id){
		KeHoachTNSModel model = null;
		try {
			String sql = "SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach "
						+" FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap "
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				model = new KeHoachTNSModel();
				model.setId(rs.getString("ID"));
				model.setTen_ke_hoach("Ten_ke_hoach");
				model.setNam(rs.getString("Nam"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setNguoi_lap_ke_hoach(rs.getString("Nguoi_lap_ke_hoach"));
				model.setNgay_lap_ke_hoach(rs.getString("Ngay_lap_ke_hoach"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setNgay_lap_ke_hoach_dmy(rs.getString("Ngay_lap_ke_hoach_dmy"));
				model.setTen_nguoi_lap_ke_hoach(rs.getString("Ten_nguoi_lap_ke_hoach"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	
	public static ArrayList<KeHoachTNSModel> getAllKeHoach(String maBoPhan,String maThanhVien, String tinhTrang){
		ArrayList<KeHoachTNSModel> list = new ArrayList<KeHoachTNSModel>();
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_SelectAllKeHoachTNS(?,?,?)}");
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_thanh_vien", maThanhVien);
			csmt.setString("Tinh_trang", tinhTrang);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				KeHoachTNSModel model = new KeHoachTNSModel();
				model.setId(rs.getString("ID"));
				model.setTen_ke_hoach("Ten_ke_hoach");
				model.setNam(rs.getString("Nam"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setNguoi_lap_ke_hoach(rs.getString("Nguoi_lap_ke_hoach"));
				model.setNgay_lap_ke_hoach(rs.getString("Ngay_lap_ke_hoach"));
				model.setBo_sung(rs.getString("Bo_sung"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setNgay_lap_ke_hoach_dmy(rs.getString("Ngay_lap_ke_hoach_dmy"));
				model.setTen_nguoi_lap_ke_hoach(rs.getString("Ten_nguoi_lap_ke_hoach"));	
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<KeHoachTNSModel> SearchKeHoach(String tinhTrang){
		ArrayList<KeHoachTNSModel> list = new ArrayList<KeHoachTNSModel>();
		try {
			String sql = "SELECT A.ID,A.Ten_ke_hoach,A.Nam,A.Tinh_trang,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Nguoi_lap_ke_hoach,A.Bo_sung "
						+" FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID "
						+" LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap "
						+" WHERE Tinh_trang=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, tinhTrang);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				KeHoachTNSModel model = new KeHoachTNSModel();
				model.setId(rs.getString("ID"));
				model.setTen_ke_hoach("Ten_ke_hoach");
				model.setNam(rs.getString("Nam"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setNguoi_lap_ke_hoach(rs.getString("Nguoi_lap_ke_hoach"));
				model.setNgay_lap_ke_hoach(rs.getString("Ngay_lap_ke_hoach"));
				model.setBo_sung(rs.getString("Bo_sung"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static String countKeHoachTNS(String nam){
		String kq = "";
		try {
			String sql = "SELECT COUNT(*) AS KQ FROM KEHOACHTNS WHERE NAM=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, nam);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				kq = rs.getString("KQ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return kq;
	}
}
