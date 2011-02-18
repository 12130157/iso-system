package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.PhanCongTacTuanModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class PhanCongTacTuanDAO {
	public static ArrayList<PhanCongTacTuanModel> getAllPhanCongTacTuanByMaChiTietKHDT(String maChiTietKHDT) {
		ArrayList<PhanCongTacTuanModel> list = new ArrayList<PhanCongTacTuanModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllPhanCongTacTuanByMaChiTietKHDT"));
			preparedStatement.setString(1, maChiTietKHDT);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				PhanCongTacTuanModel congTac = new PhanCongTacTuanModel();
				
				congTac.setMaPhanCongTacTuan(rs.getString("ID"));
				congTac.setMaChiTietKHDT(rs.getString("MaChiTietKHDT"));
				congTac.setThu(rs.getString("Thu"));
				congTac.setBuoi(rs.getString("Buoi"));
				congTac.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));	
				congTac.setGio(rs.getString("Gio"));
				congTac.setPhut(rs.getString("Phut"));
				congTac.setMaCongTac(rs.getString("MaCongTac"));
				congTac.setNoiDungCongTac(rs.getNString("NoiDungCongTac"));
				congTac.setGhiChu(rs.getNString("GhiChu"));
				congTac.setUser1(rs.getString("User1"));
				congTac.setUser2(rs.getString("User2"));
				congTac.setUser3(rs.getString("User3"));
				congTac.setUser4(rs.getString("User4"));
				congTac.setUser5(rs.getString("User5"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public static Boolean insertPhanCongTacTuan(PhanCongTacTuanModel congTacTuan) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_insertPhanCongTacTuan(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_chi_tiet_KHDT", congTacTuan.getMaChiTietKHDT());
			csmt.setString("Thu", congTacTuan.getThu());
			csmt.setString("Buoi", congTacTuan.getBuoi());
			csmt.setString("Gio", congTacTuan.getGio());
			csmt.setString("Phut", congTacTuan.getPhut());
			csmt.setString("Ma_cong_tac", congTacTuan.getMaCongTac());
			csmt.setNString("Noi_dung_cong_tac", congTacTuan.getNoiDungCongTac());
			csmt.setNString("Ghi_chu", congTacTuan.getGhiChu());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);	
			csmt.setString("User1", congTacTuan.getUser1());
			csmt.setString("User2", congTacTuan.getUser2());
			csmt.setString("User3", congTacTuan.getUser3());
			csmt.setString("User4", congTacTuan.getUser4());
			csmt.setString("User5", congTacTuan.getUser5());
			
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				String id = csmt.getString("ID");
				congTacTuan.setMaPhanCongTacTuan(id);
				congTacTuan.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	public static Boolean updatePhanCongTacTuan(PhanCongTacTuanModel congTacTuan) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_updatePhanCongTacTuan(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", congTacTuan.getMaPhanCongTacTuan());
			csmt.setString("Ma_chi_tiet_KHDT", congTacTuan.getMaChiTietKHDT());
			csmt.setString("Thu", congTacTuan.getThu());
			csmt.setString("Buoi", congTacTuan.getBuoi());
			csmt.setString("Gio", congTacTuan.getGio());
			csmt.setString("Phut", congTacTuan.getPhut());
			csmt.setString("Ma_cong_tac", congTacTuan.getMaCongTac());
			csmt.setNString("Noi_dung_cong_tac", congTacTuan.getNoiDungCongTac());
			csmt.setNString("Ghi_chu", congTacTuan.getGhiChu());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);	
			csmt.setString("User1", congTacTuan.getUser1());
			csmt.setString("User2", congTacTuan.getUser2());
			csmt.setString("User3", congTacTuan.getUser3());
			csmt.setString("User4", congTacTuan.getUser4());
			csmt.setString("User5", congTacTuan.getUser5());
			
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				congTacTuan.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static boolean insertAndUpdatePhanCongTacTuanList(ArrayList<PhanCongTacTuanModel> phanCongTacTuanModelList) {
		boolean result = true;
		ArrayList<PhanCongTacTuanModel> phanCongTacTuanAfterInsertedAndUpadted = new ArrayList<PhanCongTacTuanModel>();
		if(phanCongTacTuanModelList != null) {
			for (PhanCongTacTuanModel obj : phanCongTacTuanModelList) {
				if(obj.getMaPhanCongTacTuan() != null) {
					if(updatePhanCongTacTuan(obj) == false)
						result = false;
				} else {
					if(!insertPhanCongTacTuan(obj) == false)
						result = false;
				}
				phanCongTacTuanAfterInsertedAndUpadted.add(obj);	
			}
		}
		return result;
	}
	public static boolean deletePhanCongTacTuan(String id) {
		boolean result = true;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_deletePhanCongTacTuan(?)}");	
			csmt.setString("ID", id);
		} catch (Exception ex) {
			ex.printStackTrace();
			result = false;
		}
		return result;
	}
}
