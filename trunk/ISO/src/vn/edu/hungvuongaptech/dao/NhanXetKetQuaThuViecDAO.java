package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.NhanXetKetQuaThuViecModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class NhanXetKetQuaThuViecDAO {
	
	public static NhanXetKetQuaThuViecModel getNhanXetByTenDangNhap(String tenDangNhap){
		NhanXetKetQuaThuViecModel model = null;
		try {
			String sql = "SELECT A.*,(B.HO+' '+B.TEN_LOT+' '+B.TEN ) AS TEN_NGUOI_NHAN_XET,(K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_NGUOI_DUYET,E.TEN_VAI_TRO AS TEN_VAI_TRO,F.TEN AS TEN_BO_PHAN "
						+" FROM NHANXETKETQUATHUVIEC A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_NHAN_XET=B.ID "
						+" LEFT JOIN CHITIETKHTNS C ON B.Vi_tri_du_tuyen=C.ID "
						+" LEFT JOIN DENGHINHANSU D ON C.Ma_de_nghi=D.ID "
						+" LEFT JOIN VAITRO E ON D.Chuc_danh=E.ID "
						+" LEFT JOIN KHOA_TRUNGTAM F ON D.Ma_bo_phan=F.ID "
						+" LEFT JOIN THANHVIEN J ON A.NGUOI_DUYET=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP "
						+" WHERE B.TEN_DANG_NHAP=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, tenDangNhap);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new NhanXetKetQuaThuViecModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_nhan_xet(rs.getString("Nguoi_nhan_xet"));
				model.setThoi_gian_thu_viec(rs.getString("Thoi_gian_thu_viec"));
				model.setNoidung1(rs.getString("NoiDung1"));
				model.setNoidung2(rs.getString("NoiDung2"));
				model.setNoidung3(rs.getString("NoiDung3"));
				model.setNoidung4(rs.getString("NoiDung4"));
				model.setNgay_nhan_xet(rs.getString("Ngay_nhan_xet"));
				model.setNguoi_duyet(rs.getString("Nguoi_duyet"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setTen_nguoi_nhan_xet(rs.getString("Ten_nguoi_nhan_xet"));
				model.setTen_vai_tro(rs.getString("Ten_vai_tro"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_nguoi_duyet(rs.getString("Ten_nguoi_duyet"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static NhanXetKetQuaThuViecModel getNhanXetById(String id){
		NhanXetKetQuaThuViecModel model = null;
		try {
			String sql = "SELECT A.*,CONVERT(VARCHAR(10),A.NGAY_NHAN_XET,105) AS NGAY_NHAN_XET_MDY,(B.HO+' '+B.TEN_LOT+' '+B.TEN ) AS TEN_NGUOI_NHAN_XET,B.EMAIL AS EMAIL,(K.HO+' '+K.TEN_LOT+' '+K.TEN) AS TEN_NGUOI_DUYET,E.TEN_VAI_TRO AS TEN_VAI_TRO,F.MA_TRUONG_KHOA as MA_TRUONG_KHOA,F.TEN AS TEN_BO_PHAN,M.ID AS MA_THANH_VIEN,C.ID AS VI_TRI_DU_TUYEN "
						+" FROM NHANXETKETQUATHUVIEC A LEFT JOIN HOSODUTUYEN B ON A.NGUOI_NHAN_XET=B.ID "
						+" LEFT JOIN CHITIETKHTNS C ON B.Vi_tri_du_tuyen=C.ID "
						+" LEFT JOIN DENGHINHANSU D ON C.Ma_de_nghi=D.ID "
						+" LEFT JOIN VAITRO E ON D.Chuc_danh=E.ID "
						+" LEFT JOIN KHOA_TRUNGTAM F ON D.Ma_bo_phan=F.ID "
						+" LEFT JOIN THANHVIEN J ON A.NGUOI_DUYET=J.ID LEFT JOIN CHITIETTHANHVIEN K ON J.TEN_DN=K.TEN_DANG_NHAP "
						+" LEFT JOIN THANHVIEN M ON B.TEN_DANG_NHAP=M.TEN_DN"
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new NhanXetKetQuaThuViecModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_nhan_xet(rs.getString("Nguoi_nhan_xet"));
				model.setThoi_gian_thu_viec(rs.getString("Thoi_gian_thu_viec"));
				model.setNoidung1(rs.getString("NoiDung1"));
				model.setNoidung2(rs.getString("NoiDung2"));
				model.setNoidung3(rs.getString("NoiDung3"));
				model.setNoidung4(rs.getString("NoiDung4"));
				model.setNgay_nhan_xet(rs.getString("Ngay_nhan_xet"));
				model.setNguoi_duyet(rs.getString("Nguoi_duyet"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setGhi_chu(rs.getString("Ghi_chu"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setTen_nguoi_nhan_xet(rs.getString("Ten_nguoi_nhan_xet"));
				model.setTen_vai_tro(rs.getString("Ten_vai_tro"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_nguoi_duyet(rs.getString("Ten_nguoi_duyet"));
				model.setMa_truong_khoa(rs.getString("Ma_truong_khoa"));
				model.setEmail(rs.getString("Email"));
				model.setNgay_nhan_xet_mdy(rs.getString("Ngay_nhan_xet_mdy"));
				model.setMa_thanh_vien(rs.getString("Ma_thanh_vien"));
				model.setVi_tri_du_tuyen(rs.getString("VI_TRI_DU_TUYEN"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static int insertNhanXetKetQuaThuViec(String nguoiDuTuyen,String chucDanh,String boPhan,String thoiGianThuViec){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertNhanXetKetQuaThuViec(?,?,?)}");
			csmt.setString("Nguoi_nhan_xet", nguoiDuTuyen);
			csmt.setString("Thoi_gian_thu_viec", thoiGianThuViec);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int updateNhanXetKetQuaThuViec(String maNhanXet,String noiDung1,String noiDung2,String noiDung3,String noiDung4,String tinhTrang){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateNhanXetKetQuaThuViec(?,?,?,?,?,?,?)}");
			csmt.setString("ID", maNhanXet);
			csmt.setString("NoiDung1", noiDung1);
			csmt.setString("NoiDung2", noiDung2);
			csmt.setString("NoiDung3", noiDung3);
			csmt.setString("NoiDung4", noiDung4);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int ApproveNhanXetKetQuaThuViec(String MaNhanXet,String nguoiDuyet,String ghiChu){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateNhanXetKetQuaThuViec_Approve(?,?,?,?)}");
			csmt.setString("ID", MaNhanXet);
			csmt.setString("Nguoi_duyet", nguoiDuyet);
			csmt.setString("Ghi_chu", ghiChu);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int RejectNhanXetKetQuaThuViec(String MaNhanXet,String lyDoReject){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateNhanXetKetQuaThuViec_Reject(?,?,?)}");
			csmt.setString("ID", MaNhanXet);
			csmt.setString("Ly_do_reject", lyDoReject);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static ArrayList<NhanXetKetQuaThuViecModel> getAllNhanXet(String maBoPhan,String maVaiTro,String tinhTrang){
		ArrayList<NhanXetKetQuaThuViecModel> list = new ArrayList<NhanXetKetQuaThuViecModel>();
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_SelectAllNhanXetKetQuaThuViec(?,?,?)}");
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_vai_tro", maVaiTro);
			csmt.setString("Tinh_trang", tinhTrang);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				NhanXetKetQuaThuViecModel model = new NhanXetKetQuaThuViecModel();
				model.setId(rs.getString("ID"));
				model.setNguoi_nhan_xet(rs.getString("Nguoi_nhan_xet"));
				model.setThoi_gian_thu_viec(rs.getString("Thoi_gian_thu_viec"));
				model.setNoidung1(rs.getString("NoiDung1"));
				model.setNoidung2(rs.getString("NoiDung2"));
				model.setNoidung3(rs.getString("NoiDung3"));
				model.setNoidung4(rs.getString("NoiDung4"));
				model.setNgay_nhan_xet(rs.getString("Ngay_nhan_xet"));
				model.setNguoi_duyet(rs.getString("Nguoi_duyet"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setLy_do_reject(rs.getString("Ly_do_reject"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setTen_nguoi_nhan_xet(rs.getString("Ten_nguoi_nhan_xet"));
				model.setTen_vai_tro(rs.getString("Ten_vai_tro"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_nguoi_duyet(rs.getString("Ten_nguoi_duyet"));
				model.setMa_truong_khoa(rs.getString("Ma_truong_khoa"));
				model.setEmail(rs.getString("Email"));
				model.setNgay_nhan_xet_mdy(rs.getString("Ngay_nhan_xet_mdy"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
