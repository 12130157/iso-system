package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietTKBThayDoiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ChiTietTKBThayDoiDAO {
	public static ArrayList<ChiTietTKBThayDoiModel> getChiTietTKBThayDoiByMaMonHocTKB(String maMonHocTKB) {
		ArrayList<ChiTietTKBThayDoiModel> list = new ArrayList<ChiTietTKBThayDoiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getChiTietTKBThayDoiByMaMonHocTKB"));
			preparedStatement.setString(1, maMonHocTKB);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietTKBThayDoiModel chiTiet = new ChiTietTKBThayDoiModel();
				
				chiTiet.setId(rs.getString("MaChiTietTKBThayDoi"));
				chiTiet.setMaChiTietTKB(rs.getString("MaChiTietTKB"));
				chiTiet.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				chiTiet.setBuoi(rs.getString("Buoi"));
				chiTiet.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				chiTiet.setMaPhong(rs.getString("MaPhong"));
				chiTiet.setNgayHoc(rs.getString("NgayHoc"));
				chiTiet.setTuan(rs.getString("Tuan"));
				chiTiet.setTinhTrang(rs.getString("TinhTrang"));
				/*chiTiet.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				chiTiet.setUser1(rs.getString("User1"));
				chiTiet.setUser2(rs.getString("User2"));
				chiTiet.setUser3(rs.getString("User3"));
				chiTiet.setUser4(rs.getString("User4"));
				chiTiet.setUser5(rs.getString("User5"));*/
				
				list.add(chiTiet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public static Boolean insertChiTietTKBThayDoi(ChiTietTKBThayDoiModel chiTietTKBThayDoiModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertChiTietTKBThayDoi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_chi_tiet_TKB", chiTietTKBThayDoiModel.getMaChiTietTKB());
			csmt.setString("Ma_mon_hoc_TKB", chiTietTKBThayDoiModel.getMaMonHocTKB());
			csmt.setString("Thu_trong_tuan", chiTietTKBThayDoiModel.getThuTrongTuan());
			csmt.setNString("Buoi", chiTietTKBThayDoiModel.getBuoi());
			csmt.setString("Ma_phong", chiTietTKBThayDoiModel.getMaPhong());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietTKBThayDoiModel.getNgayCapNhatCuoi());
			csmt.setString("ID_thay_the", null);
			csmt.setString("Tuan", chiTietTKBThayDoiModel.getTuan());
			csmt.setString("Ma_nguoi_tao", chiTietTKBThayDoiModel.getMaNguoiTao());
			csmt.setString("Ma_to_trinh", chiTietTKBThayDoiModel.getMaToTrinh());
			csmt.setString("Tinh_trang", Constant.TINHTRANG_NEW);
			csmt.setString("Ngay_hoc", null);
			csmt.setString("User1", chiTietTKBThayDoiModel.getUser1());
			csmt.setString("User2", chiTietTKBThayDoiModel.getUser2());
			csmt.setString("User3", chiTietTKBThayDoiModel.getUser3());
			csmt.setString("User4", chiTietTKBThayDoiModel.getUser4());
			csmt.setString("User5", chiTietTKBThayDoiModel.getUser5());

			result = DataUtil.executeNonStore(csmt);
			if (result) {
				String id = csmt.getString("ID");
				chiTietTKBThayDoiModel.setId(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean updateChiTietTKBThayDoi(ChiTietTKBThayDoiModel chiTietTKBThayDoiModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateChiTietTKBThayDoi(?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", chiTietTKBThayDoiModel.getId());
			csmt.setString("Thu_trong_tuan", chiTietTKBThayDoiModel.getThuTrongTuan());
			csmt.setNString("Buoi", chiTietTKBThayDoiModel.getBuoi());
			csmt.setString("Ma_phong", chiTietTKBThayDoiModel.getMaPhong());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietTKBThayDoiModel.getNgayCapNhatCuoi());
			csmt.setString("Ma_chi_tiet_TKB", chiTietTKBThayDoiModel.getMaChiTietTKB());
			csmt.setString("Tuan", chiTietTKBThayDoiModel.getTuan());
			csmt.setString("Ngay_hoc", null);

			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static int getCountThayDoi() {
		int count = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getCountThayDoiChiTietTKB"));		
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public static ArrayList<ChiTietTKBThayDoiModel> getChiTietTKBThayDoiByMaNguoiTaoAndTinhTrangNew(String maNguoiTao) {
		ArrayList<ChiTietTKBThayDoiModel> chiTietTKBThayDoiList = new ArrayList<ChiTietTKBThayDoiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getChiTietTKBThayDoiByMaNguoiTaoAndTinhTrangNew"));	
			preparedStatement.setString(1, maNguoiTao);
			preparedStatement.setString(2, Constant.TINHTRANG_NEW);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ChiTietTKBThayDoiModel chiTietTKBThayDoi = new ChiTietTKBThayDoiModel();
				chiTietTKBThayDoi.setMaPhongThayDoi(rs.getString("MaPhongThayDoi"));
				chiTietTKBThayDoi.setNgayHocThayDoi(rs.getString("NgayHocThayDoi"));
				chiTietTKBThayDoi.setKiHieuPhongThayDoi(rs.getNString("KiHieuPhongThayDoi"));
				chiTietTKBThayDoi.setBuoiThayDoi(rs.getNString("BuoiThayDoi"));
				chiTietTKBThayDoi.setThuTrongTuanThayDoi(rs.getString("ThuTrongTuanThayDoi"));
				chiTietTKBThayDoi.setTuanThayDoi(rs.getString("TuanThayDoi"));
				chiTietTKBThayDoi.setBuoi(rs.getNString("Buoi"));
				chiTietTKBThayDoi.setTuan(rs.getString("Tuan"));
				chiTietTKBThayDoi.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				chiTietTKBThayDoi.setMaPhong(rs.getString("MaPhong"));
				chiTietTKBThayDoi.setNgayHoc(rs.getString("NgayHoc"));
				chiTietTKBThayDoi.setKiHieuPhong(rs.getNString("KiHieuPhong"));
				chiTietTKBThayDoi.setTenMonHoc(rs.getNString("TenMonHocChiTiet"));
				
				chiTietTKBThayDoiList.add(chiTietTKBThayDoi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietTKBThayDoiList;
	}
}
