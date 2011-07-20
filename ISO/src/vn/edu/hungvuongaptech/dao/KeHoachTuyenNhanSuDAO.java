package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.KeHoachTNSModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class KeHoachTuyenNhanSuDAO {
	public static int InsertKeHoachTNS(String nam,String nguoiLap){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertKeHoachTNS(?,?,?)}");
			csmt.setString("Nam", nam);
			csmt.setString("Nguoi_lap_ke_hoach", nguoiLap);
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
	
	public static String ApproveKeHoachTNS(String maKeHoach,String nguoiDuyet){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateKeHoachTNS_Approve(?,?,?)}");
			csmt.setString("ID", maKeHoach);
			csmt.setString("Nguoi_duyet", nguoiDuyet);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String RejectKeHoachTNS(String maKeHoach,String lyDoReject){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateKeHoachTNS_Reject(?,?,?)}");
			csmt.setString("ID", maKeHoach);
			csmt.setString("Ly_do_reject", lyDoReject);
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
			String sql = "SELECT A.*,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach_dmy,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ten_nguoi_lap_ke_hoach,(C.Ho+' '+C.Ten_lot+' '+C.Ten) as Ten_nguoi_duyet,CONVERT(VARCHAR(10),A.Ngay_duyet,105) AS Ngay_duyet_dmy "
						+" FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap LEFT JOIN THANHVIEN E ON A.Nguoi_duyet=E.ID LEFT JOIN CHITIETTHANHVIEN C ON E.Ten_DN=C.Ten_dang_nhap "
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
				model.setNguoi_duyet(rs.getString("Nguoi_duyet"));
				model.setNgay_duyet(rs.getString("Ngay_duyet"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setNgay_lap_ke_hoach_dmy(rs.getString("Ngay_lap_ke_hoach_dmy"));
				model.setTen_nguoi_lap_ke_hoach(rs.getString("Ten_nguoi_lap_ke_hoach"));
				model.setTen_nguoi_duyet(rs.getString("Ten_nguoi_duyet"));
				model.setNgay_duyet_dmy(rs.getString("Ngay_duyet_dmy"));	
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
				model.setNguoi_duyet(rs.getString("Nguoi_duyet"));
				model.setNgay_duyet(rs.getString("Ngay_duyet"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setNgay_lap_ke_hoach_dmy(rs.getString("Ngay_lap_ke_hoach_dmy"));
				model.setTen_nguoi_lap_ke_hoach(rs.getString("Ten_nguoi_lap_ke_hoach"));
				model.setTen_nguoi_duyet(rs.getString("Ten_nguoi_duyet"));
				model.setNgay_duyet_dmy(rs.getString("Ngay_duyet_dmy"));	
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
			String sql = "SELECT A.ID,A.Ten_ke_hoach,A.Nam,A.Tinh_trang,CONVERT(VARCHAR(10),A.Ngay_lap_ke_hoach,105) as Ngay_lap_ke_hoach,A.Ly_do_reject,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Nguoi_lap_ke_hoach,(C.Ho+' '+C.Ten_lot+' '+C.Ten) as Nguoi_duyet,CONVERT(VARCHAR(10),A.Ngay_duyet,105) AS Ngay_duyet "
						+" FROM KeHoachTNS A LEFT JOIN THANHVIEN D ON A.Nguoi_lap_ke_hoach=D.ID "
						+" LEFT JOIN CHITIETTHANHVIEN B ON D.Ten_DN=B.Ten_dang_nhap "
						+" LEFT JOIN THANHVIEN E ON A.Nguoi_duyet=E.ID "
						+" LEFT JOIN CHITIETTHANHVIEN C ON E.Ten_DN=C.Ten_dang_nhap"
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
				model.setNguoi_duyet(rs.getString("Nguoi_duyet"));
				model.setNgay_duyet(rs.getString("Ngay_duyet"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
