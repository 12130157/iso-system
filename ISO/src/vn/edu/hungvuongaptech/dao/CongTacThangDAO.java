package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.model.CongTacThangModel;
import vn.edu.hungvuongaptech.model.KeHoachThangModel;
import vn.edu.hungvuongaptech.model.TinhTrangCongTacModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.LogUtil;

public class CongTacThangDAO {
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	public static boolean insertCongTacThang(CongTacThangModel congTacThang) {
		boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertCongTacThang(?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setString("Ma_ke_hoach_thang", congTacThang.getMaKeHoachThang());
			csmt.setString("Ma_cong_tac", congTacThang.getMaCongTac());
			csmt.setString("Ngay_cap_nhat_cuoi", congTacThang.getNgayCapNhatCuoi());
			csmt.setString("Bao_cao", congTacThang.getBaoCao());
			csmt.setString("Ghi_chu", congTacThang.getGhiChu());
			csmt.setString("Bo_phan_thuc_hien", congTacThang.getBoPhanThucHien());
			csmt.setString("User1", congTacThang.getUser1());
			csmt.setString("User2", congTacThang.getUser2());
			csmt.setString("User3", congTacThang.getUser3());
			csmt.setString("User4", congTacThang.getUser4());
			csmt.setString("User5", congTacThang.getUser5());
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				congTacThang.setMaCongTacThang(csmt.getString("ID"));
				ArrayList<TinhTrangCongTacModel> tinhTrangCongTacList = new ArrayList<TinhTrangCongTacModel>();
				ArrayList<TinhTrangCongTacModel> tinhTrangCongTacListOld = congTacThang.getTinhTrangCongTacList();
				for (TinhTrangCongTacModel obj : tinhTrangCongTacListOld) {
					if(obj.getMaCongTacThang() != null)
						TinhTrangCongTacDAO.updateTinhTrangCongTac(obj);
					else {
						obj.setMaCongTacThang(congTacThang.getMaCongTacThang());
						TinhTrangCongTacDAO.insertTinhTrangCongTac(obj);
					}
					tinhTrangCongTacList.add(obj);
				}
				congTacThang.setTinhTrangCongTacList(tinhTrangCongTacList);
				result = true;
			}
		} catch (Exception ex) {
			// TODO: handle exception
			result = false;
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return result;
	}
	public static boolean updateCongTacThang(CongTacThangModel congTacThang) {
		boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateCongTacThang(?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", congTacThang.getMaCongTacThang());
			csmt.setString("Ma_ke_hoach_thang", congTacThang.getMaKeHoachThang());
			csmt.setString("Ma_cong_tac", congTacThang.getMaCongTac());
			csmt.setString("Ngay_cap_nhat_cuoi", congTacThang.getNgayCapNhatCuoi());
			csmt.setString("Bao_cao", congTacThang.getBaoCao());
			csmt.setString("Ghi_chu", congTacThang.getGhiChu());
			csmt.setString("Bo_phan_thuc_hien", congTacThang.getBoPhanThucHien());
			csmt.setString("User1", congTacThang.getUser1());
			csmt.setString("User2", congTacThang.getUser2());
			csmt.setString("User3", congTacThang.getUser3());
			csmt.setString("User4", congTacThang.getUser4());
			csmt.setString("User5", congTacThang.getUser5());
			boolean ketQua = DataUtil.executeNonStore(csmt);
			if(ketQua) {
				ArrayList<TinhTrangCongTacModel> tinhTrangCongTacList = new ArrayList<TinhTrangCongTacModel>();
				ArrayList<TinhTrangCongTacModel> tinhTrangCongTacListOld = congTacThang.getTinhTrangCongTacList();
				for (TinhTrangCongTacModel obj : tinhTrangCongTacListOld) {
					if(obj.getMaCongTacThang() != null)
						TinhTrangCongTacDAO.updateTinhTrangCongTac(obj);
					else {
						obj.setMaCongTacThang(congTacThang.getMaCongTacThang());
						TinhTrangCongTacDAO.insertTinhTrangCongTac(obj);
					}
					tinhTrangCongTacList.add(obj);
				}
				congTacThang.setTinhTrangCongTacList(tinhTrangCongTacList);
				result = true;
			}
		} catch (Exception ex) {
			// TODO: handle exception
			result = false;
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return result;
	}
	public static Boolean deleteCongTacThang(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteCongTacThang(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
}
