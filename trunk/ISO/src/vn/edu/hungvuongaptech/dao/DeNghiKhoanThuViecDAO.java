package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.xml.crypto.Data;

import vn.edu.hungvuongaptech.model.DeNghiKTVModel;
import vn.edu.hungvuongaptech.model.DeNghiNhanSuModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class DeNghiKhoanThuViecDAO {
	public static int insertDeNghiKTV(String idNguoiDuTuyen,String tinhTrang,String maTruongKhoa){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertDeNghiKTV(?,?,?,?)}");
			csmt.setString("Nguoi_du_tuyen", idNguoiDuTuyen);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_truong_khoa", maTruongKhoa);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int updateDeNghiKTV(String id,String thoigian,String batdau,String ketthuc,String luong,String tinhtrang){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDeNghiKTV(?,?,?,?,?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Thoi_gian", thoigian);
			csmt.setString("Bat_dau", batdau);
			csmt.setString("Ket_thuc", ketthuc);
			csmt.setString("Luong_khoan", luong);
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int approveDeNghiKTV(String id,String manguoiduyet){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDeNghiKTV_Approve(?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ma_nguoi_duyet", manguoiduyet);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int rejectDeNghiKTV(String id,String lyDoReject){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDeNghiKTV_Reject(?,?,?)}");
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
	public static DeNghiKTVModel getDeNghiKTVByID(String id){
		DeNghiKTVModel model = null;
		try {
			String sql = "SELECT A.*, "
						+" CONVERT(VARCHAR(10),A.BAT_DAU,105) AS BAT_DAU_MDY, "
						+" CONVERT(VARCHAR(10),A.KET_THUC,105) AS KET_THUC_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_TK_DUYET,105) AS NGAY_TK_DUYET_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_HC_DUYET,105) AS NGAY_HC_DUYET_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_DT_DUYET,105) AS NGAY_DT_DUYET_MDY, "
						+" CONVERT(VARCHAR(10),A.NGAY_HT_DUYET,105) AS NGAY_HT_DUYET_MDY, "
						+" (B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN, "
						+" (D.HO+' '+D.TEN_LOT+' '+D.TEN) AS TEN_TRUONG_KHOA, "
						+" (F.HO+' '+F.TEN_LOT+' '+F.TEN) AS TEN_PHONG_HC, "
						+" (K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_PHONG_DT, "
						+" (M.HO+' '+M.TEN_LOT+' '+M.TEN) AS TEN_HIEU_TRUONG,N.TEN AS TEN_KHOA "
						+" FROM DeNghiKTV A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID "
						+" LEFT JOIN THANHVIEN C ON A.TRUONG_KHOA=C.ID LEFT JOIN CHITIETTHANHVIEN D ON C.TEN_DN=D.TEN_DANG_NHAP "
						+" LEFT JOIN THANHVIEN E ON A.PHONG_HC=E.ID LEFT JOIN CHITIETTHANHVIEN F ON E.TEN_DN=F.TEN_DANG_NHAP "
						+" LEFT JOIN THANHVIEN J ON A.PHONG_DT=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP "
						+" LEFT JOIN THANHVIEN L ON A.HIEU_TRUONG=L.ID LEFT JOIN CHITIETTHANHVIEN M ON L.TEN_DN=M.TEN_DANG_NHAP "
						+" LEFT JOIN KHOA_TRUNGTAM N ON A.TRUONG_KHOA=N.ID "
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new DeNghiKTVModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_du_tuyen(rs.getString("NGUOI_DU_TUYEN"));
				model.setThoi_gian(rs.getString("THOI_GIAN"));
				model.setBat_dau(rs.getString("BAT_DAU"));
				model.setKet_thuc(rs.getString("KET_THUC"));
				model.setLuong_khoan(rs.getString("LUONG_KHOAN"));
				model.setTinh_trang(rs.getString("TINH_TRANG"));
				model.setNgay_lap(rs.getString("NGAY_LAP"));
				model.setTruong_khoa(rs.getString("TRUONG_KHOA"));
				model.setNgay_TK_duyet(rs.getString("NGAY_TK_DUYET"));
				model.setPhong_HC(rs.getString("PHONG_HC"));
				model.setNgay_HC_duyet(rs.getString("NGAY_HC_DUYET"));
				model.setPhong_DT(rs.getString("PHONG_DT"));
				model.setNgay_DT_duyet(rs.getString("NGAY_DT_DUYET"));
				model.setHieu_truong(rs.getString("HIEU_TRUONG"));
				model.setNgay_HT_duyet(rs.getString("NGAY_HT_DUYET"));
				model.setLy_do_reject(rs.getString("LY_DO_REJECT"));
				model.setNgay_cap_nhat_cuoi(rs.getString("NGAY_CAP_NHAT_CUOI"));
				model.setTen_nguoi_du_tuyen(rs.getString("TEN_NGUOI_DU_TUYEN"));
				model.setTen_truong_khoa(rs.getString("TEN_TRUONG_KHOA"));
				model.setTen_phong_HC(rs.getString("TEN_PHONG_HC"));
				model.setTen_phong_DT(rs.getString("TEN_PHONG_DT"));
				model.setTen_hieu_truong(rs.getString("TEN_HIEU_TRUONG"));
				model.setBat_dau_mdy(rs.getString("BAT_DAU_MDY"));
				model.setKet_thuc_mdy(rs.getString("KET_THUC_MDY"));
				model.setNgay_lap_mdy(rs.getString("NGAY_LAP_MDY"));
				model.setNgay_TK_duyet_mdy(rs.getString("NGAY_TK_DUYET_MDY"));
				model.setNgay_HC_duyet_mdy(rs.getString("NGAY_HC_DUYET_MDY"));
				model.setNgay_DT_duyet_mdy(rs.getString("NGAY_DT_DUYET_MDY"));
				model.setNgay_HT_duyet_mdy(rs.getString("NGAY_HT_DUYET_MDY"));
				model.setTen_khoa(rs.getString("TEN_KHOA"));
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
						+" FROM DENGHIKTV A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID "
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
	
	public static ArrayList<DeNghiKTVModel> getAllDeNghiKTV(String maBoPhan,String maTruongKhoa,String tinhTrang){
		ArrayList<DeNghiKTVModel> list = new ArrayList<DeNghiKTVModel>();
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_SelectAllDeNghiKTV(?,?,?)}");
			csmt.setString("Ma_BO_PHAN", maBoPhan);
			csmt.setString("Ma_truong_khoa", maTruongKhoa);
			csmt.setString("Tinh_trang", tinhTrang);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				DeNghiKTVModel model = new DeNghiKTVModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_du_tuyen(rs.getString("NGUOI_DU_TUYEN"));
				model.setThoi_gian(rs.getString("THOI_GIAN"));
				model.setBat_dau(rs.getString("BAT_DAU"));
				model.setKet_thuc(rs.getString("KET_THUC"));
				model.setLuong_khoan(rs.getString("LUONG_KHOAN"));
				model.setTinh_trang(rs.getString("TINH_TRANG"));
				model.setNgay_lap(rs.getString("NGAY_LAP"));
				model.setTruong_khoa(rs.getString("TRUONG_KHOA"));
				model.setNgay_TK_duyet(rs.getString("NGAY_TK_DUYET"));
				model.setPhong_HC(rs.getString("PHONG_HC"));
				model.setNgay_HC_duyet(rs.getString("NGAY_HC_DUYET"));
				model.setPhong_DT(rs.getString("PHONG_DT"));
				model.setNgay_DT_duyet(rs.getString("NGAY_DT_DUYET"));
				model.setHieu_truong(rs.getString("HIEU_TRUONG"));
				model.setNgay_HT_duyet(rs.getString("NGAY_HT_DUYET"));
				model.setLy_do_reject(rs.getString("LY_DO_REJECT"));
				model.setNgay_cap_nhat_cuoi(rs.getString("NGAY_CAP_NHAT_CUOI"));
				model.setTen_nguoi_du_tuyen(rs.getString("TEN_NGUOI_DU_TUYEN"));
				model.setTen_truong_khoa(rs.getString("NGUOI_LAP"));
				model.setNgay_lap_mdy(rs.getString("NGAY_LAP_MDY"));
				model.setUser2(rs.getString("VI_TRI_DU_TUYEN"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static DeNghiKTVModel getDeNghiKTVByTenDangNhap(String tenDangNhap){
		DeNghiKTVModel model = null;
		try {
			String sql = "SELECT A.*, CONVERT(VARCHAR(10),GETDATE(),105) AS NGAY_HE_THONG_MDY,CONVERT(VARCHAR(10),A.KET_THUC,105) AS KET_THUC_MDY " 
						+" FROM DENGHIKTV A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID "
						+" WHERE B.TEN_DANG_NHAP=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, tenDangNhap);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new DeNghiKTVModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_du_tuyen(rs.getString("NGUOI_DU_TUYEN"));
				model.setThoi_gian(rs.getString("THOI_GIAN"));
				model.setBat_dau(rs.getString("BAT_DAU"));
				model.setKet_thuc(rs.getString("KET_THUC"));
				model.setLuong_khoan(rs.getString("LUONG_KHOAN"));
				model.setTinh_trang(rs.getString("TINH_TRANG"));
				model.setNgay_lap(rs.getString("NGAY_LAP"));
				model.setTruong_khoa(rs.getString("TRUONG_KHOA"));
				model.setNgay_TK_duyet(rs.getString("NGAY_TK_DUYET"));
				model.setPhong_HC(rs.getString("PHONG_HC"));
				model.setNgay_HC_duyet(rs.getString("NGAY_HC_DUYET"));
				model.setPhong_DT(rs.getString("PHONG_DT"));
				model.setNgay_DT_duyet(rs.getString("NGAY_DT_DUYET"));
				model.setHieu_truong(rs.getString("HIEU_TRUONG"));
				model.setNgay_HT_duyet(rs.getString("NGAY_HT_DUYET"));
				model.setLy_do_reject(rs.getString("LY_DO_REJECT"));
				model.setNgay_cap_nhat_cuoi(rs.getString("NGAY_CAP_NHAT_CUOI"));
				model.setNgay_he_thong_mdy(rs.getString("NGAY_HE_THONG_MDY"));
				model.setKet_thuc_mdy(rs.getString("KET_THUC_MDY"));
			}
		} catch (Exception e  ) {
			e.printStackTrace();
		}
		return model;
	}
}
