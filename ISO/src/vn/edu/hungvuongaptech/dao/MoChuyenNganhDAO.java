package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.MoChuyenNganhModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class MoChuyenNganhDAO{

	public static ArrayList<MoChuyenNganhModel> getMoChuyenNganhByMaQuyetDinh(String maQuyetDinh){
		ArrayList<MoChuyenNganhModel> listMoChuyenNganh = new ArrayList<MoChuyenNganhModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
				.getConnection()
					.prepareStatement(
							Constant.SQL_RES
								.getString("iso.sql.GetMoChuyenNganhByMaQuyetDinh"));
			preparedStatement.setString(1, maQuyetDinh);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				MoChuyenNganhModel moChuyenNganh = new MoChuyenNganhModel();
				moChuyenNganh.setId(rs.getString("MaMoChuyenNganh"));
				moChuyenNganh.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				moChuyenNganh.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				moChuyenNganh.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				moChuyenNganh.setGhiChu(rs.getString("GhiChu"));
				moChuyenNganh.setUser1(rs.getString("User1"));
				moChuyenNganh.setUser2(rs.getString("User2"));
				moChuyenNganh.setUser3(rs.getString("User3"));
				moChuyenNganh.setUser4(rs.getString("User4"));
				moChuyenNganh.setUser5(rs.getString("User5"));
				listMoChuyenNganh.add(moChuyenNganh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listMoChuyenNganh;
	}
	
	public static void insertLopHocByMaQuyetDinhWithMoChuyeNganh(String maQuyetDinh, String maKhoa){
		ArrayList<MoChuyenNganhModel> listMoChuyenNganh = new ArrayList<MoChuyenNganhModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
				.getConnection()
					.prepareStatement(
						Constant.SQL_RES
							.getString("iso.sql.GetMoChuyenNganhByMaQuyetDinh"));
			preparedStatement.setString(1, maQuyetDinh);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				MoChuyenNganhModel moChuyenNganh = new MoChuyenNganhModel();
				moChuyenNganh.setId(rs.getString("MaMoChuyenNganh"));
				moChuyenNganh.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				moChuyenNganh.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				moChuyenNganh.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				moChuyenNganh.setGhiChu(rs.getString("GhiChu"));
				moChuyenNganh.setUser1(rs.getString("User1"));
				moChuyenNganh.setUser2(rs.getString("User2"));
				moChuyenNganh.setUser3(rs.getString("User3"));
				moChuyenNganh.setUser4(rs.getString("User4"));
				moChuyenNganh.setUser5(rs.getString("User5"));
				listMoChuyenNganh.add(moChuyenNganh);
			}
			/*INSERT INTO LOPHOC*/
			for (MoChuyenNganhModel moChuyenNganhModel : listMoChuyenNganh) {
				LopHocDAO.insertLopHocWithMoChuyenNganh(moChuyenNganhModel.getMaChuyenNganh(), maQuyetDinh, maKhoa);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static Boolean insertMoChuyenNganh(MoChuyenNganhModel moChuyenNganhModel){
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_InsertMoChuyenNganh(?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_chuyen_nganh", moChuyenNganhModel.getMaChuyenNganh());
			csmt.setString("Ma_quyet_dinh", moChuyenNganhModel.getMaQuyetDinh());
			csmt.setString("Ghi_chu", moChuyenNganhModel.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", moChuyenNganhModel.getNgayCapNhatCuoi());		
			csmt.setString("User1", moChuyenNganhModel.getUser1());
			csmt.setString("User2", moChuyenNganhModel.getUser2());
			csmt.setString("User3", moChuyenNganhModel.getUser3());
			csmt.setString("User4", moChuyenNganhModel.getUser4());
			csmt.setString("User5", moChuyenNganhModel.getUser5());
			
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				String id = csmt.getString("ID");
				moChuyenNganhModel.setId(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static Boolean updateMoChuyenNganh(MoChuyenNganhModel moChuyenNganhModel){
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_UpdateMoChuyenNganh(?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", moChuyenNganhModel.getId());
			csmt.setString("Ma_chuyen_Nganh", moChuyenNganhModel.getMaChuyenNganh());
			csmt.setString("Ghi_chu", moChuyenNganhModel.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", moChuyenNganhModel.getNgayCapNhatCuoi());		
			csmt.setString("User1", moChuyenNganhModel.getUser1());
			csmt.setString("User2", moChuyenNganhModel.getUser2());
			csmt.setString("User3", moChuyenNganhModel.getUser3());
			csmt.setString("User4", moChuyenNganhModel.getUser4());
			csmt.setString("User5", moChuyenNganhModel.getUser5());
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static Boolean deleteMoChuyenNganh(String maChuyenNganh) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteMoChuyenNganh(?)}");		
			csmt.setString("ID", maChuyenNganh);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
}
