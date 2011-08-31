package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.xml.crypto.Data;

import vn.edu.hungvuongaptech.model.HopDongLaoDongModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class HopDongLaoDongDAO {
	public static int insertHopDongLaoDong(String maNguoiDuTuyen,String soLan,String nguoiLap){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertHDLD(?,?,?,?)}");
			csmt.setString("Nguoi_du_tuyen", maNguoiDuTuyen);
			csmt.setString("So_lan", soLan);
			csmt.setString("Nguoi_lap", nguoiLap);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String countHopDongLaoDongByNguoiDuTuyen(String maNguoiDuTuyen){
		String kq = "";
		try {
			String sql ="SELECT COUNT(*) AS KQ FROM HOPDONGLAODONG WHERE NGUOI_DU_TUYEN=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maNguoiDuTuyen);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				kq = rs.getString("KQ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int updateHopDongLaoDong(String id,String thoiGian,String batDau,String ketThuc,String loaiVienChuc,String maNgach,String bac,String heSoLuong,String tinhTrang){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateHDLD(?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Thoi_gian", thoiGian);
			csmt.setString("Bat_dau", batDau);
			csmt.setString("Ket_thuc", ketThuc);
			csmt.setString("Loai_vien_chuc", loaiVienChuc);
			csmt.setString("Ma_ngach", maNgach);
			csmt.setString("Bac", bac);
			csmt.setString("He_so_luong", heSoLuong);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int approveHopDongLaoDong(String id,String maNguoiDuyet){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateHDLD_Approve(?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ma_nguoi_duyet", maNguoiDuyet);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int rejectHopDongLaoDong(String id,String lyDoReject){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateHDLD_Reject(?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ly_do_reject", lyDoReject);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	public static HopDongLaoDongModel getHopDongLaoDongByID(String id){
		HopDongLaoDongModel model = null;
		try {
			String sql = "SELECT A.*, "
						+" CONVERT(VARCHAR(10),A.BAT_DAU,105) AS BAT_DAU_MDY, "
						+" CONVERT(VARCHAR(10),A.KET_THUC,105) AS KET_THUC_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_NDT_DUYET,105) AS NGAY_NDT_DUYET_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_HT_DUYET,105) AS NGAY_HT_DUYET_MDY, "
						+" (B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN, "
						+" (D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_HIEU_TRUONG, "
						+" (L.HO+' '+L.TEN_LOT+' '+L.TEN) AS TEN_NGUOI_LAP, "
						+" J.TEN AS TEN_KHOA, B.Vi_tri_du_tuyen "
						+" FROM HopDongLaoDong A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID "
						+" LEFT JOIN THANHVIEN C ON A.HIEU_TRUONG=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP "
						+" LEFT JOIN CHITIETKHTNS E ON B.VI_TRI_DU_TUYEN=E.ID "
						+" LEFT JOIN DENGHINHANSU F ON E.MA_DE_NGHI=F.ID "
						+" LEFT JOIN KHOA_TRUNGTAM J ON F.MA_BO_PHAN=J.ID "
						+" LEFT JOIN THANHVIEN K ON A.NGUOI_LAP=K.ID LEFT JOIN CHITIETTHANHVIEN L ON K.TEN_DN=L.TEN_DANG_NHAP "
						+" WHERE A.ID=?";

			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new HopDongLaoDongModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_du_tuyen(rs.getString("NGUOI_DU_TUYEN"));
				model.setThoi_gian(rs.getString("THOI_GIAN"));
				model.setBat_dau(rs.getString("BAT_DAU"));
				model.setKet_thuc(rs.getString("KET_THUC"));
				model.setLoai_vien_chuc(rs.getString("Loai_vien_chuc"));
				model.setMa_ngach(rs.getString("MA_NGACH"));
				model.setBac(rs.getString("Bac"));
				model.setHe_so_luong(rs.getString("He_so_luong"));
				model.setTinh_trang(rs.getString("TINH_TRANG"));
				model.setNgay_lap(rs.getString("NGAY_LAP"));
				model.setNguoi_lap(rs.getString("Nguoi_lap"));
				model.setNgay_NDT_duyet(rs.getString("Ngay_NDT_duyet"));
				model.setHieu_truong(rs.getString("HIEU_TRUONG"));
				model.setNgay_HT_duyet(rs.getString("NGAY_HT_DUYET"));
				model.setSo_lan(rs.getString("So_lan"));
				model.setLy_do_reject(rs.getString("LY_DO_REJECT"));
				model.setNgay_cap_nhat_cuoi(rs.getString("NGAY_CAP_NHAT_CUOI"));
				model.setTen_nguoi_du_tuyen(rs.getString("TEN_NGUOI_DU_TUYEN"));
				model.setTen_hieu_truong(rs.getString("TEN_HIEU_TRUONG"));
				model.setBat_dau_mdy(rs.getString("BAT_DAU_MDY"));
				model.setKet_thuc_mdy(rs.getString("KET_THUC_MDY"));
				model.setNgay_lap_mdy(rs.getString("NGAY_LAP_MDY"));
				model.setNgay_HT_duyet_mdy(rs.getString("NGAY_HT_DUYET_MDY"));
				model.setTen_khoa(rs.getString("TEN_KHOA"));
				model.setVi_tri_du_tuyen(rs.getString("Vi_tri_du_tuyen"));
				model.setTen_nguoi_lap(rs.getString("TEN_NGUOI_LAP"));
			}
		} catch (Exception e  ) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static HopDongLaoDongModel getHopDongLaoDongByNguoiDuTuyen(String nguoiDuTuyen){
		HopDongLaoDongModel model = null;
		try {
			String sql = "SELECT A.*, "
						+" CONVERT(VARCHAR(10),A.BAT_DAU,105) AS BAT_DAU_MDY, "
						+" CONVERT(VARCHAR(10),A.KET_THUC,105) AS KET_THUC_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_NDT_DUYET,105) AS NGAY_NDT_DUYET_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_HT_DUYET,105) AS NGAY_HT_DUYET_MDY, "
						+" (B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN, "
						+" (D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_HIEU_TRUONG, "
						+" (L.HO+' '+L.TEN_LOT+' '+L.TEN) AS TEN_NGUOI_LAP, "
						+" J.TEN AS TEN_KHOA, B.Vi_tri_du_tuyen "
						+" FROM HopDongLaoDong A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID "
						+" LEFT JOIN THANHVIEN C ON A.HIEU_TRUONG=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP "
						+" LEFT JOIN CHITIETKHTNS E ON B.VI_TRI_DU_TUYEN=E.ID "
						+" LEFT JOIN DENGHINHANSU F ON E.MA_DE_NGHI=F.ID "
						+" LEFT JOIN KHOA_TRUNGTAM J ON F.MA_BO_PHAN=J.ID "
						+" LEFT JOIN THANHVIEN K ON A.NGUOI_LAP=K.ID LEFT JOIN CHITIETTHANHVIEN L ON K.TEN_DN=L.TEN_DANG_NHAP "
						+" WHERE B.ID=? AND A.ID=(SELECT MAX(So_lan) FROM HOPDONGLAODONG WHERE NGUOI_DU_TUYEN=?)";

			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, nguoiDuTuyen);
			ps.setString(2, nguoiDuTuyen);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new HopDongLaoDongModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_du_tuyen(rs.getString("NGUOI_DU_TUYEN"));
				model.setThoi_gian(rs.getString("THOI_GIAN"));
				model.setBat_dau(rs.getString("BAT_DAU"));
				model.setKet_thuc(rs.getString("KET_THUC"));
				model.setLoai_vien_chuc(rs.getString("Loai_vien_chuc"));
				model.setMa_ngach(rs.getString("MA_NGACH"));
				model.setBac(rs.getString("Bac"));
				model.setHe_so_luong(rs.getString("He_so_luong"));
				model.setTinh_trang(rs.getString("TINH_TRANG"));
				model.setNgay_lap(rs.getString("NGAY_LAP"));
				model.setNguoi_lap(rs.getString("Nguoi_lap"));
				model.setNgay_NDT_duyet(rs.getString("Ngay_NDT_duyet"));
				model.setHieu_truong(rs.getString("HIEU_TRUONG"));
				model.setNgay_HT_duyet(rs.getString("NGAY_HT_DUYET"));
				model.setSo_lan(rs.getString("So_lan"));
				model.setLy_do_reject(rs.getString("LY_DO_REJECT"));
				model.setNgay_cap_nhat_cuoi(rs.getString("NGAY_CAP_NHAT_CUOI"));
				model.setTen_nguoi_du_tuyen(rs.getString("TEN_NGUOI_DU_TUYEN"));
				model.setTen_hieu_truong(rs.getString("TEN_HIEU_TRUONG"));
				model.setBat_dau_mdy(rs.getString("BAT_DAU_MDY"));
				model.setKet_thuc_mdy(rs.getString("KET_THUC_MDY"));
				model.setNgay_lap_mdy(rs.getString("NGAY_LAP_MDY"));
				model.setNgay_HT_duyet_mdy(rs.getString("NGAY_HT_DUYET_MDY"));
				model.setTen_khoa(rs.getString("TEN_KHOA"));
				model.setVi_tri_du_tuyen(rs.getString("Vi_tri_du_tuyen"));
				model.setTen_nguoi_lap("TEN_NGUOI_LAP");
			}
		} catch (Exception e  ) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static String getTK(int madenghi){
		String maTK="";
		try {
			String sql = "SELECT E.MA_TRUONG_KHOA AS TRUONGKHOA"
						+" FROM HopDongLaoDong A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID "
						+" INNER JOIN CHITIETKHTNS C ON B.VI_TRI_DU_TUYEN=C.ID "
						+" INNER JOIN DENGHINHANSU D ON C.MA_DE_NGHI=D.ID "
						+" INNER JOIN KHOA_TRUNGTAM E ON D.MA_BO_PHAN=E.ID"
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setInt(1, madenghi);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				maTK = rs.getString("TRUONGKHOA");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maTK;
	}
	
	public static ArrayList<HopDongLaoDongModel> getAllHopDongLaoDong(String maBoPhan,String maThanhVien,String tinhTrang){
		ArrayList<HopDongLaoDongModel> list = new ArrayList<HopDongLaoDongModel>();
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_SelectAllHopDongLaoDong(?,?,?)}");
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_thanh_vien", maThanhVien);
			csmt.setString("Tinh_trang", tinhTrang);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				HopDongLaoDongModel model = new HopDongLaoDongModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_du_tuyen(rs.getString("Nguoi_du_tuyen"));
				model.setNguoi_lap(rs.getString("Ten_nguoi_lap"));
				model.setNgay_lap_mdy(rs.getString("Ngay_lap_mdy"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				model.setSo_lan(rs.getString("So_lan"));
				model.setTen_nguoi_du_tuyen(rs.getString("TEN_NGUOI_DU_TUYEN"));
				model.setVi_tri_du_tuyen(rs.getString("VI_TRI_DU_TUYEN"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static HopDongLaoDongModel getHopDongLaoDongByTenDangNhap(String tenDangNhap){
		HopDongLaoDongModel model = null;
		try {
			String sql = "SELECT A.*, "
						+" CONVERT(VARCHAR(10),A.BAT_DAU,105) AS BAT_DAU_MDY, "
						+" CONVERT(VARCHAR(10),A.KET_THUC,105) AS KET_THUC_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_NDT_DUYET,105) AS NGAY_NDT_DUYET_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_HT_DUYET,105) AS NGAY_HT_DUYET_MDY, "
						+" (B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN, "
						+" (D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_HIEU_TRUONG, "
						+" (L.HO+' '+L.TEN_LOT+' '+L.TEN) AS TEN_NGUOI_LAP, "
						+" J.TEN AS TEN_KHOA, B.Vi_tri_du_tuyen, CONVERT(VARCHAR(10),GETDATE(),105) AS NGAY_HE_THONG "
						+" FROM HopDongLaoDong A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID "
						+" LEFT JOIN THANHVIEN C ON A.HIEU_TRUONG=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP "
						+" LEFT JOIN CHITIETKHTNS E ON B.VI_TRI_DU_TUYEN=E.ID "
						+" LEFT JOIN DENGHINHANSU F ON E.MA_DE_NGHI=F.ID "
						+" LEFT JOIN KHOA_TRUNGTAM J ON F.MA_BO_PHAN=J.ID "
						+" LEFT JOIN THANHVIEN K ON A.NGUOI_LAP=K.ID LEFT JOIN CHITIETTHANHVIEN L ON K.TEN_DN=L.TEN_DANG_NHAP "
						+" WHERE B.Ten_dang_nhap=? AND A.So_lan='0'";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, tenDangNhap);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new HopDongLaoDongModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_du_tuyen(rs.getString("NGUOI_DU_TUYEN"));
				model.setThoi_gian(rs.getString("THOI_GIAN"));
				model.setBat_dau(rs.getString("BAT_DAU"));
				model.setKet_thuc(rs.getString("KET_THUC"));
				model.setLoai_vien_chuc(rs.getString("Loai_vien_chuc"));
				model.setMa_ngach(rs.getString("MA_NGACH"));
				model.setBac(rs.getString("Bac"));
				model.setHe_so_luong(rs.getString("He_so_luong"));
				model.setTinh_trang(rs.getString("TINH_TRANG"));
				model.setNgay_lap(rs.getString("NGAY_LAP"));
				model.setNguoi_lap(rs.getString("Nguoi_lap"));
				model.setNgay_NDT_duyet(rs.getString("Ngay_NDT_duyet"));
				model.setHieu_truong(rs.getString("HIEU_TRUONG"));
				model.setNgay_HT_duyet(rs.getString("NGAY_HT_DUYET"));
				model.setSo_lan(rs.getString("So_lan"));
				model.setLy_do_reject(rs.getString("LY_DO_REJECT"));
				model.setNgay_cap_nhat_cuoi(rs.getString("NGAY_HE_THONG"));
				model.setTen_nguoi_du_tuyen(rs.getString("TEN_NGUOI_DU_TUYEN"));
				model.setTen_hieu_truong(rs.getString("TEN_HIEU_TRUONG"));
				model.setBat_dau_mdy(rs.getString("BAT_DAU_MDY"));
				model.setKet_thuc_mdy(rs.getString("KET_THUC_MDY"));
				model.setNgay_lap_mdy(rs.getString("NGAY_LAP_MDY"));
				model.setNgay_HT_duyet_mdy(rs.getString("NGAY_HT_DUYET_MDY"));
				model.setTen_khoa(rs.getString("TEN_KHOA"));
				model.setVi_tri_du_tuyen(rs.getString("Vi_tri_du_tuyen"));
			}
		} catch (Exception e  ) {
			e.printStackTrace();
		}
		return model;
	}
	
}
