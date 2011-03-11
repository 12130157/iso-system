package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.model.CongTacThangModel;
import vn.edu.hungvuongaptech.model.TinhTrangCongTacModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.LogUtil;

public class TinhTrangCongTacDAO {
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	public static boolean insertTinhTrangCongTac(TinhTrangCongTacModel tinhTrangCongTac) {
		boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertTinhTrangCongTac(?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setString("Ma_cong_tac_thang", tinhTrangCongTac.getMaCongTacThang());
			csmt.setString("Tinh_trang", tinhTrangCongTac.getTinhTrang());
			csmt.setString("Ngay_cap_nhat_cuoi", tinhTrangCongTac.getNgayCapNhatCuoi());
			csmt.setString("Thu_tu_tuan", tinhTrangCongTac.getThuTuTuan());
			csmt.setString("User1", tinhTrangCongTac.getUser1());
			csmt.setString("User2", tinhTrangCongTac.getUser2());
			csmt.setString("User3", tinhTrangCongTac.getUser3());
			csmt.setString("User4", tinhTrangCongTac.getUser4());
			csmt.setString("User5", tinhTrangCongTac.getUser5());
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				tinhTrangCongTac.setMaTinhTrangCongTac(csmt.getString("ID"));
			}
		} catch (Exception ex) {
			// TODO: handle exception
			result = false;
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return result;
	}
	public static boolean updateTinhTrangCongTac(TinhTrangCongTacModel tinhTrangCongTac) {
		boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_UpdateTinhTrangCongTac(?,?,?,?,?,?,?,?,?,?)}");
				csmt.setString("ID", tinhTrangCongTac.getMaTinhTrangCongTac());
				csmt.setString("Ma_cong_tac_thang", tinhTrangCongTac.getMaCongTacThang());
				csmt.setString("Tinh_trang", tinhTrangCongTac.getTinhTrang());
				csmt.setString("Ngay_cap_nhat_cuoi", tinhTrangCongTac.getNgayCapNhatCuoi());
				csmt.setString("Thu_tu_tuan", tinhTrangCongTac.getThuTuTuan());
				csmt.setString("User1", tinhTrangCongTac.getUser1());
				csmt.setString("User2", tinhTrangCongTac.getUser2());
				csmt.setString("User3", tinhTrangCongTac.getUser3());
				csmt.setString("User4", tinhTrangCongTac.getUser4());
				csmt.setString("User5", tinhTrangCongTac.getUser5());
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception ex) {
			// TODO: handle exception
			result = false;
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return result;
	}
	public static Boolean deleteTinhTrangCongTac(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_iso_DeleteTinhTrangCongTac(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
}
