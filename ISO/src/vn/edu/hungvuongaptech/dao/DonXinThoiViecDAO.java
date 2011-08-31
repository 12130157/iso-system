package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.DonXinThoiViecModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class DonXinThoiViecDAO {
	public static ArrayList<DonXinThoiViecModel> getAllDonXinThoiViec(String tinhTrang){
		ArrayList<DonXinThoiViecModel> list = new ArrayList<DonXinThoiViecModel>();
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_SelectAllDonXinThoiViec(?)}");
			csmt.setString("Tinh_trang", tinhTrang);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				DonXinThoiViecModel model = new DonXinThoiViecModel();
				model.setMaDonXinThoiViec(rs.getString("ID"));
				model.setNguoiDuTuyen(rs.getString("Nguoi_du_tuyen"));
				model.setNgayLap(rs.getString("Ngay_lap"));
				model.setNgayLapDMY(rs.getString("Ngay_Lap_DMY"));
				model.setTenNguoiDuTuyen(rs.getString("Ten_nguoi_du_tuyen"));
				model.setMaBoPhan(rs.getString("Ma_bo_phan"));
				model.setTenBoPhan(rs.getString("Ten_bo_phan"));
				model.setTinhTrang(rs.getString("Tinh_trang"));
				model.setLyDoReject(rs.getString("Ly_do_reject"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static DonXinThoiViecModel getDonXinThoiViecByMaDonXinThoiViec(String maDonXinThoiViec){
		DonXinThoiViecModel model = null;
		try {
			String sql = "SELECT A.*,B.Gioi_tinh,CONVERT(VARCHAR(10),B.Ngay_sinh,105) as NGAY_SINH, (B.HO+' '+B.TEN_LOT+' '+B.TEN) AS TEN_NGUOI_DU_TUYEN, "
						+" D.TEN AS TEN_BO_PHAN, D.ID AS MA_BO_PHAN, "
						+" E.ID AS MA_VAI_TRO, E.TEN_VAI_TRO AS TEN_VAI_TRO, "
						+" (G.HO+' '+G.TEN_LOT+' '+G.TEN) AS TEN_TRUONG_KHOA, "
						+" (K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_PHONG_DT, "
						+" (M.HO+' '+M.TEN_LOT+' '+M.TEN) AS TEN_PHONG_HC, "
						+" (O.HO+' '+O.TEN_LOT+' '+O.TEN) AS TEN_HIEU_TRUONG, "
						+" CONVERT(VARCHAR(10),A.NGAY_LAP,105) AS NGAY_LAP_DMY, "
						+" CONVERT(VARCHAR(10),A.NGAY_TK_DUYET,105) AS NGAY_TK_DUYET_DMY, "
						+" CONVERT(VARCHAR(10),A.NGAY_DT_DUYET,105) AS NGAY_DT_DUYET_DMY, "
						+" CONVERT(VARCHAR(10),A.NGAY_HC_DUYET,105) AS NGAY_HC_DUYET_DMY, "
						+" CONVERT(VARCHAR(10),A.NGAY_HT_DUYET,105) AS NGAY_HT_DUYET_DMY, "
						+" CONVERT(VARCHAR(10),A.NGAY_THOI_VIEC,105) AS NGAY_THOI_VIEC_DMY, "
						+" CONVERT(VARCHAR(10),GETDATE(),105) AS NGAY_HE_THONG,C.ID AS MA_THANH_VIEN, D.Ma_truong_khoa as MA_TRUONG_KHOA "
						+" FROM DONXINTHOIVIEC A INNER JOIN HOSODUTUYEN B ON A.NGUOI_DU_TUYEN=B.ID "
						+" INNER JOIN THANHVIEN C ON B.TEN_DANG_NHAP=C.TEN_DN "
						+" INNER JOIN KHOA_TRUNGTAM D ON C.MA_BO_PHAN=D.ID "
						+" INNER JOIN VAITRO E ON C.MA_VAI_TRO=E.ID "
						+" LEFT JOIN THANHVIEN F ON A.TRUONG_KHOA=F.ID LEFT JOIN CHITIETTHANHVIEN G ON F.TEN_DN=G.TEN_DANG_NHAP "
						+" LEFT JOIN THANHVIEN H ON A.Phong_DT=H.ID LEFT JOIN CHITIETTHANHVIEN K ON H.TEN_DN=K.TEN_DANG_NHAP "
						+" LEFT JOIN THANHVIEN L ON A.Phong_HC=L.ID LEFT JOIN CHITIETTHANHVIEN M ON L.TEN_DN=M.TEN_DANG_NHAP "
						+" LEFT JOIN THANHVIEN N ON A.Hieu_truong=N.ID LEFT JOIN CHITIETTHANHVIEN O ON N.TEN_DN=O.TEN_DANG_NHAP "
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maDonXinThoiViec);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new DonXinThoiViecModel();
				String gioiTinh = "";
				if(rs.getString("Gioi_tinh").equals("0")){
					gioiTinh = "Nữ";
				}else if(rs.getString("Gioi_tinh").equals("1")){
					gioiTinh = "Nam";
				}else{
					gioiTinh = "Khác";
				}
				model.setMaDonXinThoiViec(rs.getString("ID"));
				model.setNguoiDuTuyen(rs.getString("Nguoi_du_tuyen"));
				model.setLyDo(rs.getString("Ly_do"));
				model.setNgayLap(rs.getString("Ngay_lap"));
				model.setNgayThoiViec(rs.getString("NGAY_THOI_VIEC"));
				model.setTruongKhoa(rs.getString("Truong_khoa"));
				model.setNgayTKduyet(rs.getString("Ngay_TK_duyet"));
				model.setPhongHC(rs.getString("Phong_HC"));
				model.setNgayHCduyet(rs.getString("ngay_HC_duyet"));
				model.setPhongDT(rs.getString("Phong_DT"));
				model.setNgayDTduyet(rs.getString("Ngay_DT_duyet"));
				model.setHieuTruong(rs.getString("Hieu_truong"));
				model.setNgayHTduyet(rs.getString("Ngay_HT_duyet"));
				model.setLyDoReject(rs.getString("Ly_do_reject"));
				model.setTinhTrang(rs.getString("Tinh_trang"));
				model.setNgayCapNhatCuoi(rs.getString("NGAY_HE_THONG"));
				model.setTenNguoiDuTuyen(rs.getString("Ten_nguoi_du_tuyen"));
				model.setMaBoPhan(rs.getString("Ma_bo_phan"));
				model.setTenBoPhan(rs.getString("Ten_bo_phan"));
				model.setMaVaiTro(rs.getString("Ma_vai_tro"));
				model.setTenVaiTro(rs.getString("Ten_vai_tro"));
				model.setTenTruongKhoa(rs.getString("Ten_truong_khoa"));
				model.setTenPhongDT(rs.getString("Ten_phong_DT"));
				model.setTenPhongHC(rs.getString("Ten_phong_HC"));
				model.setTenHieuTruong(rs.getString("Ten_hieu_truong"));
				model.setNgayLapDMY(rs.getString("Ngay_Lap_DMY"));
				model.setNgayTKduyetDMY(rs.getString("ngay_TK_duyet_DMY"));
				model.setNgayHCduyetDMY(rs.getString("ngay_HC_duyet_DMY"));
				model.setNgayDTduyetDMY(rs.getString("ngay_DT_duyet_DMY"));
				model.setNgayHTduyetDMY(rs.getString("ngay_HT_duyet_DMY"));
				model.setNgayThoiViecDMY(rs.getString("NGAY_THOI_VIEC_DMY"));
				model.setGioiTinh(gioiTinh);
				model.setNgaySinh(rs.getString("NGAY_SINH"));
				model.setMaThanhVien(rs.getString("MA_THANH_VIEN"));
				model.setMaTruongKhoa(rs.getString("MA_TRUONG_KHOA"));
			}
			model.setHopDongLaoDong(HopDongLaoDongDAO.getHopDongLaoDongByNguoiDuTuyen(model.getNguoiDuTuyen()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static String insertDonXinThoiViec(String nguoiDuTuyen){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertDonXinThoiViec(?,?)}");
			csmt.setString("Nguoi_du_tuyen",nguoiDuTuyen);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String updateDonXinThoiViec(String id,String lyDo,String ngayThoiViec,String tinhTrang){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDonXinThoiViec(?,?,?,?,?)}");
			csmt.setString("ID",id);
			csmt.setString("Ly_do",lyDo);
			csmt.setString("Ngay_thoi_viec", ngayThoiViec);
			csmt.setString("Tinh_trang",tinhTrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String updateDonXinThoiViec_Reject(String id,String lyDoReject){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDonXinThoiViec_Reject(?,?,?)}");
			csmt.setString("ID",id);
			csmt.setString("Ly_do_reject",lyDoReject);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String updateDonXinThoiViec_Approve(String id,String maNguoiDuyet){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateDonXinThoiViec_Approve(?,?,?)}");
			csmt.setString("ID",id);
			csmt.setString("Ma_nguoi_duyet",maNguoiDuyet);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	
}
