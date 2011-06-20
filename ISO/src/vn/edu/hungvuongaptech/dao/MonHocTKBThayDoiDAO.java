package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.MonHocTKBThayDoiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class MonHocTKBThayDoiDAO {
	public static Boolean insertMonHocTKBThayDoi(MonHocTKBThayDoiModel monHocTKBThayDoiModel) {
		
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertMonHocTKBThayDoi(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", monHocTKBThayDoiModel.getId());
			csmt.setString("Ma_mon_hoc_TKB", monHocTKBThayDoiModel.getMaMonHocTKB());
			csmt.setString("Ma_giao_vien", monHocTKBThayDoiModel.getMaGiaoVien());
			csmt.setNString("Ma_to_trinh", monHocTKBThayDoiModel.getMaToTrinh());
			csmt.setString("Ma_nguoi_tao", monHocTKBThayDoiModel.getMaNguoiTao());
			csmt.setString("Tinh_trang", Constant.TINHTRANG_NEW);
			csmt.setString("ID_thay_the", null);
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1", monHocTKBThayDoiModel.getUser1());
			csmt.setString("User2", monHocTKBThayDoiModel.getUser2());
			csmt.setString("User3", monHocTKBThayDoiModel.getUser3());
			csmt.setString("User4", monHocTKBThayDoiModel.getUser4());
			csmt.setString("User5", monHocTKBThayDoiModel.getUser5()); 
			
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	public static Boolean updateMonHocTKBThayDoi(MonHocTKBThayDoiModel monHocTKBThayDoiModel) {
		
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateMonHocTKBThayDoi(?,?,?)}");
			csmt.setString("ID", monHocTKBThayDoiModel.getId());
			csmt.setString("Ma_giao_vien", monHocTKBThayDoiModel.getMaGiaoVien());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			
			
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
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
							.getString("iso.sql.getCountThayDoiMonHocTKB"));		
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public static ArrayList<MonHocTKBThayDoiModel> getThayDoiMonHocTKBByMaNguoiTaoAndTinhTrangNew(String maNguoiTao) {
		ArrayList<MonHocTKBThayDoiModel> monHocTKBThayDoiList = new ArrayList<MonHocTKBThayDoiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getThayDoiMonHocTKBByMaNguoiTaoAndTinhTrangNew"));	
			preparedStatement.setString(1, maNguoiTao);
			preparedStatement.setString(2, Constant.TINHTRANG_NEW);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				MonHocTKBThayDoiModel monHocTKBThayDoi = new MonHocTKBThayDoiModel();
				monHocTKBThayDoi.setId(rs.getString("MaMonHocTKBThayDoi"));
				monHocTKBThayDoi.setMaGiaoVienThayDoi(rs.getString("MaGiaoVienThayDoi"));
				monHocTKBThayDoi.setTenGiaoVienThayDoi(rs.getNString("TenGiaoVienThayDoi"));
				monHocTKBThayDoi.setMaGiaoVien(rs.getString("MaGiaoVien"));
				monHocTKBThayDoi.setTenGiaoVien(rs.getNString("TenGiaoVien"));
				monHocTKBThayDoi.setTenMonHoc(rs.getNString("TenMonHoc"));
				monHocTKBThayDoiList.add(monHocTKBThayDoi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return monHocTKBThayDoiList;
	}
	public static MonHocTKBThayDoiModel getThayDoiByMaMonHocTKB(String maMonHocTKB) {
		MonHocTKBThayDoiModel monHocTKBThayDoi = new MonHocTKBThayDoiModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getThayDoiByMaMonHocTKB"));	
			preparedStatement.setString(1, maMonHocTKB);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				monHocTKBThayDoi.setMaGiaoVien(rs.getString("MaGiaoVien"));
				monHocTKBThayDoi.setId(rs.getString("MaMonHocTKBThayDoi"));
				monHocTKBThayDoi.setTenGiaoVien(rs.getString("TenGiaoVien"));
				monHocTKBThayDoi.setTinhTrang(rs.getString("TinhTrang"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return monHocTKBThayDoi;
	}
}
