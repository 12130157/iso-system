package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.DiemDanhModel;
import vn.edu.hungvuongaptech.model.KeHoachGiangDayModel;
import vn.edu.hungvuongaptech.model.SoTayGiaoVienModel;
import vn.edu.hungvuongaptech.model.ThangModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThoiGianGiangDayModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class SoTayGiaoVienDAO {
	public static String InsertSoTayGiaoVien(String maKHGD){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ISO_InsertSoTayGiaoVien(?,?)}");
			csmt.setString("Ma_KHGD", maKHGD);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String UpdateSoTayGiaoVien(String ID,String quanLyHocSinhCabiet,String danhGiaQuiTrinhGiangDay,String tinhTrang){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ISO_UpdateSoTayGiaoVien(?,?,?,?,?)}");
			csmt.setString("ID", ID);
			csmt.setString("Quan_ly_hoc_sinh_ca_biet", quanLyHocSinhCabiet);
			csmt.setString("Danh_gia_qui_trinh_giang_day", danhGiaQuiTrinhGiangDay);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static SoTayGiaoVienModel getSoTayGiaoVienById(String id){
		SoTayGiaoVienModel model = null;
		try {
			String sql = "SELECT A.Id as ID, A.Ma_KHGD, A.Quan_ly_hoc_sinh_ca_biet as QuanLyHocSinhCaBiet, "
						+" A.Danh_gia_qui_trinh_giang_day as DanhGiaQuiTrinhGiangDay, A.Tinh_trang as TinhTrang, "
						+" C.Id as MaMonHoc,C.Ten_mon_hoc as TenMonHoc, "
						+" D.Id as MaLopHoc, D.Ki_hieu as TenLopHoc, E.Ma_khoa as Khoa, "
						+" G.Id as MaGiaoVien,(H.Ho+' '+H.Ten_lot+' '+H.Ten) as TenGiaoVien, "
						+" K.Id as MaNamHoc, (CAST(K.Nam_bat_dau AS VARCHAR)+'-'+CAST(K.Nam_ket_thuc AS VARCHAR)) as NamHoc, "
						+" F.Id as MaHeDaoTao, F.Ten as TenHeDaoTao, "
						+" J.Id as MaChuyenNganh, J.Ten_chuyen_nganh as TenChuyenNganh, "
						+" E.Id as MaQuyetDinh, E.Ten as TenQuyetDinh "
						+" FROM SOTAYGIAOVIEN A INNER JOIN KEHOACHGIANGDAY B ON A.MA_KHGD=B.ID "
						+" INNER JOIN MONHOC C ON B.MA_MON_HOC=C.ID "
						+" INNER JOIN LOPHOC D ON B.MA_LOP=D.ID "
						+" INNER JOIN QUYETDINHMOLOP E ON D.MA_QUYET_DINH=E.ID "
						+" INNER JOIN HEDAOTAO F ON E.MA_HE_DAO_TAO=F.ID "
						+" INNER JOIN THANHVIEN G ON B.MA_GIAO_VIEN=G.ID "
						+" INNER JOIN CHITIETTHANHVIEN H ON G.TEN_DN=H.TEN_DANG_NHAP "
						+" INNER JOIN NAMHOC K ON B.MA_NAM_HOC=K.ID "
						+" INNER JOIN CHUYENNGANH J ON D.MA_CHUYEN_NGANH=J.ID "
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new SoTayGiaoVienModel();
				model.setId(rs.getString("ID"));
				model.setMaKHGD(rs.getString("Ma_KHGD"));
				model.setQuanLyHocSinhCaBiet(rs.getString("QuanLyHocSinhCaBiet"));
				model.setDanhGiaQuiTrinhGiangDay(rs.getString("DanhGiaQuiTrinhGiangDay"));
				model.setTinhTrang(rs.getString("TinhTrang"));
				model.setMaNamHoc(rs.getString("MaNamHoc"));
				model.setNamHoc(rs.getString("NamHoc"));
				model.setMaMonHoc(rs.getString("MaMonHoc"));
				model.setTenMonHoc(rs.getString("TenMonHoc"));
				model.setMaLopHoc(rs.getString("MaLopHoc"));
				model.setTenLopHoc(rs.getString("TenLopHoc"));
				model.setKhoa(rs.getString("Khoa"));
				model.setMaGiaoVien(rs.getString("MaGiaoVien"));
				model.setTenGiaoVien(rs.getString("TenGiaoVien"));
				model.setMaHeDaoTao(rs.getString("MaHeDaoTao"));
				model.setTenHeDaoTao(rs.getString("TenHeDaoTao"));
				model.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				model.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				model.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				model.setTenQuyetDinh(rs.getString("TenQuyetDinh"));
			}
			KeHoachGiangDayModel KHGD = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(model.getMaKHGD());
			ThoiGianGiangDayModel BE = KeHoachGiangDayDAO.getBatDauAndKetThucByMaKeHoachGiangDay(model.getMaKHGD());
			model.setListHocSinh(ThanhVienDAO.getThanhVienByMaLop(KHGD.getMaLop()));
			for (ThanhVienModel thanhVien : model.getListHocSinh()) {
				thanhVien.setUser1(XemDiemDAO.getDiemByMaLop_MaHocSinh_MaMonHoc(KHGD.getMaLop(), KHGD.getMaMonHoc(), thanhVien.getMaThanhVien()));
				thanhVien.setThangList(DateUtil.getMonthByTwoDate(BE.getBatDau(),BE.getKetThuc()));
				for (ThangModel thang : thanhVien.getThangList()) {
					int tongNgayNghi = 0;
					thanhVien.setDiemDanhList(DiemDanhDAO.getListHocSinhDiemDanhByMaLopAndMaMonHoc(KHGD.getMaLop(), KHGD.getMaMonHoc(),thanhVien.getMaThanhVien(),thang.getThang(),thang.getNam()));
					for (DiemDanhModel diemDanh : thanhVien.getDiemDanhList()) {
						if(diemDanh.getTinhTrang().equals("1") || diemDanh.getTinhTrang().equals("2") || diemDanh.getTinhTrang().equals("3")){
							tongNgayNghi++;
						}
					}
					thang.setTongNgayNghi(tongNgayNghi+"");
				}
				
			}
			
			model.setListThang(DateUtil.getMonthByTwoDate(BE.getBatDau(),BE.getKetThuc()));
			
			for (ThangModel thang : model.getListThang()) {
				
				thang.setListHocSinh(ThanhVienDAO.getThanhVienByMaLop(KHGD.getMaLop()));
				for (ThanhVienModel thanhVien : thang.getListHocSinh()) {
					thanhVien.setDiemDanhList(DiemDanhDAO.getListHocSinhDiemDanhByMaLopAndMaMonHoc(KHGD.getMaLop(), KHGD.getMaMonHoc(),thanhVien.getMaThanhVien(),thang.getThang(),thang.getNam()));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

}
