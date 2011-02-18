package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel;
import vn.edu.hungvuongaptech.model.NguoiThucHienModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.LogUtil;

public class BoPhanThucHienDAO {
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	public static ArrayList<BoPhanThucHienKHDTModel> timBoPhanThucHienByMaNoiDungKHDT(String maNoiDungKHDT) {
		ArrayList<BoPhanThucHienKHDTModel> list = new ArrayList<BoPhanThucHienKHDTModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getBoPhanThucHienByMaNoiDungKHDT"));
			preparedStatement.setString(1, maNoiDungKHDT);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				BoPhanThucHienKHDTModel bophanThucHien = new BoPhanThucHienKHDTModel();
				
				bophanThucHien.setMaBoPhanThucHienKHDT(rs.getString("ID"));
				bophanThucHien.setMaNoiDungChiTietKHDT(rs.getString("MaNoiDungChiTietKHDT"));
				bophanThucHien.setMaKhoa(rs.getString("MaKhoa"));
				bophanThucHien.setTenBoPhan(rs.getString("TenBoPhan"));
				bophanThucHien.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));				
				bophanThucHien.setUser1(rs.getString("User1"));
				bophanThucHien.setUser2(rs.getString("User2"));
				bophanThucHien.setUser3(rs.getString("User3"));
				bophanThucHien.setUser4(rs.getString("User4"));
				bophanThucHien.setUser5(rs.getString("User5"));
				bophanThucHien.setStatus("1");
				ArrayList<NguoiThucHienModel> nguoiThucHienList = NguoiThucHienDAO.timNguoiThucHienKHDTByMaBoPhanThucHienKHDT(bophanThucHien.getMaBoPhanThucHienKHDT());
				bophanThucHien.setNguoiThucHienModelList(nguoiThucHienList);
				list.add(bophanThucHien);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
		}
		return list;
	}	
	public static Boolean insertBoPhanThucHienKHDT(BoPhanThucHienKHDTModel boPhanThucHienKHDTModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertBoPhanThucHienKHDT(?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_noi_dung_chi_tiet_KHDT", boPhanThucHienKHDTModel.getMaNoiDungChiTietKHDT());
			csmt.setString("Ma_khoa", boPhanThucHienKHDTModel.getMaKhoa());
			csmt.setString("Ten_bo_phan", boPhanThucHienKHDTModel.getTenBoPhan());
			csmt.setString("Ngay_cap_nhat_cuoi", boPhanThucHienKHDTModel.getNgayCapNhatCuoi());		
			csmt.setString("User1", boPhanThucHienKHDTModel.getUser1());
			csmt.setString("User2", boPhanThucHienKHDTModel.getUser2());
			csmt.setString("User3", boPhanThucHienKHDTModel.getUser3());
			csmt.setString("User4", boPhanThucHienKHDTModel.getUser4());
			csmt.setString("User5", boPhanThucHienKHDTModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) {
				String id = csmt.getString("ID");
				boPhanThucHienKHDTModel.setMaBoPhanThucHienKHDT(id);
				ArrayList<NguoiThucHienModel> nguoiThucHienModelList = boPhanThucHienKHDTModel.getNguoiThucHienModelList();
				ArrayList<NguoiThucHienModel> nguoiThucHienModelListAfterAdded = new ArrayList<NguoiThucHienModel>();
				if(nguoiThucHienModelList != null) {
					for (NguoiThucHienModel obj : nguoiThucHienModelList) {
						obj.setMaBoPhanThucHien(id);
						if (obj.getMaNguoiThucHien() != null) { // Cap nhat "NGUOI THC HIEN CHI TIET KE HOACH DAO TAO" da ton tai
	  						NguoiThucHienDAO.updateNguoiThucHien(obj);
						} else { // Them moi "NGUOI THC HIEN CHI TIET KE HOACH DAO TAO"
							NguoiThucHienDAO.insertNguoiThucHien(obj);
						}
						nguoiThucHienModelListAfterAdded.add(obj);
					}
				}
				boPhanThucHienKHDTModel.setNguoiThucHienModelList(nguoiThucHienModelListAfterAdded);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
			result = false;
		}
						
		return result;
	}

	public static Boolean updateBoPhanThucHienKHDT(BoPhanThucHienKHDTModel boPhanThucHienKHDTModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateBoPhanThucHienKHDT(?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", boPhanThucHienKHDTModel.getMaBoPhanThucHienKHDT());
			csmt.setString("Ma_noi_dung_chi_tiet_KHDT", boPhanThucHienKHDTModel.getMaNoiDungChiTietKHDT());
			csmt.setString("Ma_khoa", boPhanThucHienKHDTModel.getMaKhoa());
			csmt.setString("Ten_bo_phan", boPhanThucHienKHDTModel.getTenBoPhan());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);	
			csmt.setString("User1", boPhanThucHienKHDTModel.getUser1());
			csmt.setString("User2", boPhanThucHienKHDTModel.getUser2());
			csmt.setString("User3", boPhanThucHienKHDTModel.getUser3());
			csmt.setString("User4", boPhanThucHienKHDTModel.getUser4());
			csmt.setString("User5", boPhanThucHienKHDTModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) {
				boPhanThucHienKHDTModel.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				ArrayList<NguoiThucHienModel> nguoiThucHienModelList = boPhanThucHienKHDTModel.getNguoiThucHienModelList();
				ArrayList<NguoiThucHienModel> nguoiThucHienModelListAfterAdded = new ArrayList<NguoiThucHienModel>();
				
				for (NguoiThucHienModel obj : nguoiThucHienModelList) {
					obj.setMaBoPhanThucHien(boPhanThucHienKHDTModel.getMaBoPhanThucHienKHDT());
					if (obj.getMaNguoiThucHien() != null) { // Cap nhat "NGUOI THC HIEN CHI TIET KE HOACH DAO TAO" da ton tai
  						NguoiThucHienDAO.updateNguoiThucHien(obj);
					} else { // Them moi "NGUOI THC HIEN CHI TIET KE HOACH DAO TAO"
						
						NguoiThucHienDAO.insertNguoiThucHien(obj);
					}
					
					nguoiThucHienModelListAfterAdded.add(obj);
				}
				boPhanThucHienKHDTModel.setNguoiThucHienModelList(nguoiThucHienModelListAfterAdded);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
			result = false;
		}
						
		return result;
	}
	public static Boolean deleteBoPhanThucHienKHDT(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteBoPhanThucHienKHDT(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
		}
		return result;
	}

}
