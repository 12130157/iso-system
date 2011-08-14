package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;

import vn.edu.hungvuongaptech.model.BangPhanCongModel;
import vn.edu.hungvuongaptech.model.ChiTietBangPhanCongModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ChiTietBangPhanCongDAO {
	public static boolean insertChiTietBangPhanCong(ChiTietBangPhanCongModel chiTietBangPhanCong) {
		boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertChiTietBangPhanCong}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ma_bang_phan_cong", chiTietBangPhanCong.getMaBangPhanCong());
			csmt.setString("Ma_lop", chiTietBangPhanCong.getMaLop());
			csmt.setString("Ma_chi_tiet_CTDT", chiTietBangPhanCong.getMaChiTietCTDT());
			csmt.setString("Ma_giao_vien", chiTietBangPhanCong.getMaGiaoVien());
			csmt.setString("Nhiem_vu", chiTietBangPhanCong.getNhiemVu());
			csmt.setString("Ghi_chu", chiTietBangPhanCong.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietBangPhanCong.getNgayCapNhatCuoi());
			csmt.setString("User1", chiTietBangPhanCong.getUser1());
			csmt.setString("User2", chiTietBangPhanCong.getUser2());
			csmt.setString("User3", chiTietBangPhanCong.getUser3());
			csmt.setString("User4", chiTietBangPhanCong.getUser4());
			csmt.setString("User5", chiTietBangPhanCong.getUser5());
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				chiTietBangPhanCong.setId(csmt.getString("ID"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
	public static boolean updateChiTietBangPhanCong(ChiTietBangPhanCongModel chiTietBangPhanCong) {
		boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateChiTietBangPhanCong(?,?,?,?,?)}");
			csmt.setNString("ID", chiTietBangPhanCong.getId());
			csmt.setString("Ma_giao_vien", chiTietBangPhanCong.getMaGiaoVien());
			csmt.setString("Nhiem_vu", chiTietBangPhanCong.getNhiemVu());
			csmt.setString("Ghi_chu", chiTietBangPhanCong.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietBangPhanCong.getNgayCapNhatCuoi());
			result = DataUtil.executeNonStore(csmt);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
}
