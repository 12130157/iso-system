package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
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
	public static ArrayList<ChiTietBangPhanCongModel> getChiTietBangPhanCongByMaBangPhanCongAndMaLop(String maBangPhanCong, String maLop) {
		// TODO Auto-generated method stub
		ArrayList<ChiTietBangPhanCongModel> chiTietBangPhanCongList = new ArrayList<ChiTietBangPhanCongModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getChiTietBangPhanCongByMaBangPhanCongAndMaLop"));
			preparedStatement.setString(1, maBangPhanCong);
			preparedStatement.setString(2, maLop);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ChiTietBangPhanCongModel chiTietBangPhanCong = new ChiTietBangPhanCongModel();
				chiTietBangPhanCong.setMaGiaoVien(rs.getString("MaGiaoVien"));
				chiTietBangPhanCong.setTenGiaoVien(rs.getString("TenGiaoVien"));
				chiTietBangPhanCong.setMaMonHoc(rs.getString("MaMonHoc"));
				
				chiTietBangPhanCongList.add(chiTietBangPhanCong);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return chiTietBangPhanCongList;
	}
}
