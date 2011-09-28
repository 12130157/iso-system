package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.KeHoachGiangDayModel;
import vn.edu.hungvuongaptech.model.SoTayGiaoVienModel;
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
			String sql = "";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new SoTayGiaoVienModel();
				model.setId(rs.getString("ID"));
				model.setMaKHGD(rs.getString("Ma_KHGD"));
				model.setQuanLyHocSinhCaBiet(rs.getString("Quan_ly_hoc_sinh_ca_biet"));
				model.setDanhGiaQuiTrinhGiangDay(rs.getString("Danh_gia_qui_trinh_giang_day"));
				model.setTinhTrang(rs.getString("Tinh_trang"));
				model.setNgayCapNhatCuoi(rs.getString("Ngay_cap_nhat_cuoi"));
			}
			KeHoachGiangDayModel KHGD = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(model.getMaKHGD());
			model.setListDiemDanh(DiemDanhDAO.getListHocSinhDiemDanhByMaLopAndMaMonHoc(KHGD.getMaLop(), KHGD.getMaMonHoc()));
			model.setListHocSinh(ThanhVienDAO.getThanhVienByMaLop(KHGD.getMaLop()));
			ThoiGianGiangDayModel BE = KeHoachGiangDayDAO.getBatDauAndKetThucByMaKeHoachGiangDay(model.getMaKHGD());
			model.setListThang(DateUtil.getMonthByTwoDate(BE.getBatDau(),BE.getKetThuc()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

}
