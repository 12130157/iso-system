package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel;
import vn.edu.hungvuongaptech.model.NguoiThucHienModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class NguoiThucHienDAO {
	public static ArrayList<NguoiThucHienModel> timNguoiThucHienKHDTByMaBoPhanThucHienKHDT(String maBoPhanThucHienKHDT) {
		ArrayList<NguoiThucHienModel> list = new ArrayList<NguoiThucHienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getNguoiThucHienKHDTByMaBoPhanThucHienKHDT"));
			preparedStatement.setString(1, maBoPhanThucHienKHDT);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				NguoiThucHienModel nguoiThucHien = new NguoiThucHienModel();
				
				nguoiThucHien.setMaNguoiThucHien(rs.getString("ID"));
				nguoiThucHien.setMaThanhVien(rs.getString("MaThanhVien"));
				nguoiThucHien.setTenThanhVien(rs.getString("TenThanhVien"));
				nguoiThucHien.setMaBoPhanThucHien(rs.getString("MaBoPhan"));
				nguoiThucHien.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));	
				nguoiThucHien.setTinhTrangThucHien(rs.getString("TinhTrangThucHien"));
				nguoiThucHien.setUser1(rs.getString("User1"));
				nguoiThucHien.setUser2(rs.getString("User2"));
				nguoiThucHien.setUser3(rs.getString("User3"));
				nguoiThucHien.setUser4(rs.getString("User4"));
				nguoiThucHien.setUser5(rs.getString("User5"));
				nguoiThucHien.setStatus("1");
				list.add(nguoiThucHien);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	public static Boolean insertNguoiThucHien(NguoiThucHienModel nguoiThucHienModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertNguoiThucHien(?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_bo_phan", nguoiThucHienModel.getMaBoPhanThucHien());
			csmt.setString("Ma_thanh_vien", nguoiThucHienModel.getMaThanhVien());
			csmt.setString("Ten_thanh_vien", nguoiThucHienModel.getTenThanhVien());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);	
			csmt.setString("Tinh_trang_thuc_hien", "0");
			csmt.setString("User1", nguoiThucHienModel.getUser1());
			csmt.setString("User2", nguoiThucHienModel.getUser2());
			csmt.setString("User3", nguoiThucHienModel.getUser3());
			csmt.setString("User4", nguoiThucHienModel.getUser4());
			csmt.setString("User5", nguoiThucHienModel.getUser5());
			
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				String id = csmt.getString("ID");
				nguoiThucHienModel.setMaNguoiThucHien(id);
				nguoiThucHienModel.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}

	public static Boolean updateNguoiThucHien(NguoiThucHienModel nguoiThucHienModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateNguoiThucHien(?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", nguoiThucHienModel.getMaNguoiThucHien());
			csmt.setString("Ma_bo_phan", nguoiThucHienModel.getMaBoPhanThucHien());
			csmt.setString("Ma_thanh_vien", nguoiThucHienModel.getMaThanhVien());
			csmt.setString("Ten_thanh_vien", nguoiThucHienModel.getTenThanhVien());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);	
			csmt.setString("Tinh_trang_thuc_hien", nguoiThucHienModel.getTinhTrangThucHien());
			csmt.setString("User1", nguoiThucHienModel.getUser1());
			csmt.setString("User2", nguoiThucHienModel.getUser2());
			csmt.setString("User3", nguoiThucHienModel.getUser3());
			csmt.setString("User4", nguoiThucHienModel.getUser4());
			csmt.setString("User5", nguoiThucHienModel.getUser5());
			
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				nguoiThucHienModel.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}			
								
		return result;
	}
	public static Boolean deleteNguoiThucHienKHDT(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteNguoiThucHienKHDT(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
}
