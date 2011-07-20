package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.DeNghiNhanSuModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class DeNghiNhanSuDAO {
	public static int InsertDNNS(DeNghiNhanSuModel model){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertDeNghiNhanSu(?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Nam", model.getNam());
			csmt.setString("Ma_bo_phan", model.getMa_bo_phan());
			csmt.setString("Nguoi_de_nghi", model.getNguoi_de_nghi());
			csmt.setString("Chuc_danh", model.getChuc_danh());
			csmt.setString("So_luong", model.getSo_luong());
			csmt.setString("Cong_viec", model.getCong_viec());
			csmt.setString("Luong", model.getLuong());
			csmt.setString("Thoi_gian_bat_dau_lam", model.getThoi_gian_bat_dau_lam());
			csmt.setString("Tinh_trang", model.getTinh_trang());
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int UpdateDNNS(DeNghiNhanSuModel model){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDeNghiNhanSu(?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", model.getId());
			csmt.setString("Chuc_danh", model.getChuc_danh());
			csmt.setString("So_luong", model.getSo_luong());
			csmt.setString("Cong_viec", model.getCong_viec());
			csmt.setString("Luong", model.getLuong());
			csmt.setString("Thoi_gian_bat_dau_lam", model.getThoi_gian_bat_dau_lam());
			csmt.setString("Tinh_trang", model.getTinh_trang());
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int ApproveDNNS(String maDeNghi,String maNguoiDuyet){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDeNghiNhanSu_Approve(?,?,?)}");
			csmt.setString("ID", maDeNghi);
			csmt.setString("Ma_nguoi_duyet", maNguoiDuyet);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int RejectDNNS(String maDeNghi,String lyDoReject){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDeNghiNhanSu_Reject(?,?,?)}");
			csmt.setString("ID", maDeNghi);
			csmt.setString("Ly_do_reject", lyDoReject);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static DeNghiNhanSuModel getDNNSByID(String id){
		DeNghiNhanSuModel model = null;
		try {
			String sql = "SELECT A.*, "
						+" CONVERT(VARCHAR(50),A.Thoi_gian_bat_dau_lam,105) as Thoi_gian_bat_dau_lam_mdy, "
						+" CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap_mdy,(C.Ho+' '+C.Ten_lot+' '+C.Ten) as Ten_truong_khoa, "
						+" CONVERT(VARCHAR(50),A.Ngay_TK_duyet,105) as Ngay_TK_duyet_mdy,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Ten_phong_HC, "
						+" CONVERT(VARCHAR(50),A.Ngay_HC_duyet,105) as Ngay_HC_duyet_mdy,(G.Ho+' '+G.Ten_lot+' '+G.Ten) as Ten_phong_DT, "
						+" CONVERT(VARCHAR(50),A.Ngay_DT_duyet,105) as Ngay_DT_duyet_mdy,(J.Ho+' '+J.Ten_lot+' '+J.Ten) as Ten_hieu_truong, "
						+" CONVERT(VARCHAR(50),A.Ngay_HT_duyet,105) as Ngay_HT_duyet_mdy,(L.Ho+' '+L.Ten_lot+' '+L.Ten) as Ten_nguoi_de_nghi, "
						+" M.Ten as Ten_bo_phan,M.MA_TRUONG_KHOA AS Ma_truong_khoa,N.Ten_vai_tro as Ten_Chuc_danh "
						+" FROM DENGHINHANSU A "
						+" LEFT JOIN THANHVIEN B ON A.Truong_khoa=B.ID LEFT JOIN CHITIETTHANHVIEN C ON B.Ten_DN=C.Ten_dang_nhap "
						+" LEFT JOIN THANHVIEN D ON A.Phong_HC=D.ID LEFT JOIN CHITIETTHANHVIEN E ON D.Ten_DN=E.Ten_dang_nhap "
						+" LEFT JOIN THANHVIEN F ON A.Phong_DT=F.ID LEFT JOIN CHITIETTHANHVIEN G ON F.Ten_DN=G.Ten_dang_nhap "
						+" LEFT JOIN THANHVIEN H ON A.Hieu_truong=H.ID LEFT JOIN CHITIETTHANHVIEN J ON H.Ten_DN=J.Ten_dang_nhap "
						+" LEFT JOIN THANHVIEN K ON A.Nguoi_de_nghi=K.ID LEFT JOIN CHITIETTHANHVIEN L ON K.Ten_DN=L.Ten_dang_nhap "
						+" LEFT JOIN KHOA_TRUNGTAM M ON A.MA_BO_PHAN=M.ID "
						+" LEFT JOIN VAITRO N ON A.CHUC_DANH=N.ID "
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				model = new DeNghiNhanSuModel();
				model.setId(rs.getString("ID"));
				model.setNam(rs.getString("Nam"));
				model.setMa_bo_phan(rs.getString("Ma_bo_phan"));
				model.setNguoi_de_nghi(rs.getString("Nguoi_de_nghi"));
				model.setChuc_danh(rs.getString("Chuc_danh"));
				model.setSo_luong(rs.getString("So_luong"));
				model.setCong_viec(rs.getString("Cong_viec"));
				model.setLuong(rs.getString("Luong"));
				model.setThoi_gian_bat_dau_lam(rs.getString("Thoi_gian_bat_dau_lam"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setNgay_lap(rs.getString("Ngay_lap"));
				model.setTruong_khoa(rs.getString("Truong_khoa"));
				model.setNgay_TK_duyet(rs.getString("Ngay_TK_duyet"));
				model.setNgay_TK_duyet_mdy(rs.getString("Ngay_TK_duyet_mdy"));
				model.setPhong_HC(rs.getString("Phong_HC"));
				model.setNgay_HC_duyet(rs.getString("Ngay_HC_duyet"));
				model.setNgay_HC_duyet_mdy(rs.getString("Ngay_HC_duyet_mdy"));
				model.setPhong_DT(rs.getString("Phong_DT"));
				model.setNgay_DT_duyet(rs.getString("Ngay_DT_duyet"));
				model.setNgay_DT_duyet_mdy(rs.getString("Ngay_DT_duyet_mdy"));
				model.setHieu_truong(rs.getString("Hieu_truong"));
				model.setNgay_HT_duyet(rs.getString("Ngay_HT_duyet"));
				model.setNgay_HT_duyet_mdy(rs.getString("Ngay_HT_duyet_mdy"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setThoi_gian_bat_dau_lam_mdy(rs.getString("Thoi_gian_bat_dau_lam_mdy"));
				model.setNgay_lap_mdy(rs.getString("Ngay_lap_mdy"));
				model.setTen_nguoi_de_nghi(rs.getString("Ten_nguoi_de_nghi"));
				model.setTen_phong_HC(rs.getString("Ten_phong_HC"));
				model.setTen_phong_DT(rs.getString("Ten_phong_DT"));
				model.setTen_hieu_truong(rs.getString("Ten_hieu_truong"));
				model.setTen_truong_khoa(rs.getString("Ten_truong_khoa"));
				model.setMa_truong_khoa(rs.getString("Ma_truong_khoa"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_chuc_danh(rs.getString("Ten_chuc_danh"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static ArrayList<DeNghiNhanSuModel> getAllDeNghi(String maBoPhan,String nguoiDeNghi,String tinhTrang){
		ArrayList<DeNghiNhanSuModel> list = new ArrayList<DeNghiNhanSuModel>();
		
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_SelectAllDeNghiNhanSu(?,?,?)}");
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Nguoi_de_nghi", nguoiDeNghi);
			csmt.setString("Tinh_trang", tinhTrang);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				DeNghiNhanSuModel model = new DeNghiNhanSuModel();
				model.setId(rs.getString("ID"));
				model.setNam(rs.getString("Nam"));
				model.setMa_bo_phan(rs.getString("Ma_bo_phan"));
				model.setNguoi_de_nghi(rs.getString("Nguoi_de_nghi"));
				model.setChuc_danh(rs.getString("Chuc_danh"));
				model.setSo_luong(rs.getString("So_luong"));
				model.setCong_viec(rs.getString("Cong_viec"));
				model.setLuong(rs.getString("Luong"));
				model.setThoi_gian_bat_dau_lam(rs.getString("Thoi_gian_bat_dau_lam"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setNgay_lap(rs.getString("Ngay_lap"));
				model.setTruong_khoa(rs.getString("Truong_khoa"));
				model.setNgay_TK_duyet(rs.getString("Ngay_TK_duyet"));
				model.setPhong_HC(rs.getString("Phong_HC"));
				model.setNgay_HC_duyet(rs.getString("Ngay_HC_duyet"));
				model.setPhong_DT(rs.getString("Phong_DT"));
				model.setNgay_DT_duyet(rs.getString("Ngay_DT_duyet"));
				model.setHieu_truong(rs.getString("Hieu_truong"));
				model.setNgay_HT_duyet(rs.getString("Ngay_HT_duyet"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setNgay_lap_mdy(rs.getString("Ngay_lap_mdy"));
				model.setTen_nguoi_de_nghi(rs.getString("Ten_nguoi_de_nghi"));
				model.setMa_truong_khoa(rs.getString("Ma_truong_khoa"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_chuc_danh(rs.getString("Ten_chuc_danh"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<DeNghiNhanSuModel> getDanhSachDeNghi(String maKeHoach){
		ArrayList<DeNghiNhanSuModel> list = new ArrayList<DeNghiNhanSuModel>();
		try {
			String sql = "SELECT A.ID,A.Nam,A.So_luong,B.Ma_truong_khoa as user1,B.Ten as Ma_bo_phan,(E.Ho+' '+E.Ten_lot+' '+E.Ten) as Nguoi_de_nghi,C.Ten_vai_tro AS Chuc_danh,A.Tinh_trang,A.Ly_do_Reject,CONVERT(VARCHAR(50),A.Ngay_lap,105) as Ngay_lap "
						+" FROM (((DENGHINHANSU A LEFT JOIN KHOA_TRUNGTAM B ON A.Ma_bo_phan=B.ID) LEFT JOIN VAITRO C ON A.Chuc_danh=C.ID ) LEFT JOIN ThanhVien D ON A.Nguoi_de_nghi=D.ID) LEFT JOIN ChiTietThanhVien E ON D.Ten_DN=E.Ten_dang_nhap "
						+" WHERE A.Tinh_trang='5' AND A.ID NOT IN (SELECT Ma_de_nghi FROM chiTietKHTNS WHERE Ma_ke_hoach=?) AND A.NAM=(SELECT NAM FROM KEHOACHTNS WHERE ID=?)";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maKeHoach);
			ps.setString(2, maKeHoach);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				DeNghiNhanSuModel model = new DeNghiNhanSuModel();
				model.setId(rs.getString("ID"));
				model.setNam(rs.getString("Nam"));
				model.setMa_bo_phan(rs.getString("Ma_bo_phan"));
				model.setNguoi_de_nghi(rs.getString("Nguoi_de_nghi"));
				model.setChuc_danh(rs.getString("Chuc_danh"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setNgay_lap(rs.getString("Ngay_lap"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				model.setSo_luong(rs.getString("So_luong"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

