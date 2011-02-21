package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.NoiDungDCMHModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class NoiDungDCMHDAO {
	public static Boolean insertNoiDungDCMH(NoiDungDCMHModel noiDungDCMHModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertNoiDungDCMH(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");	
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("So_thu_tu", noiDungDCMHModel.getSoThuTu());
			csmt.setString("So_buoi", noiDungDCMHModel.getSoBuoi());
			csmt.setString("Ma_de_cuong", noiDungDCMHModel.getMaDeCuong());
			csmt.setNString("Ten_chuong", noiDungDCMHModel.getTenChuong());	
			csmt.setString("Co_hieu", noiDungDCMHModel.getCoHieu());
			csmt.setString("So_tiet", noiDungDCMHModel.getSoTiet());
			csmt.setString("Ngay_cap_nhat_cuoi", noiDungDCMHModel.getNgayCapNhatCuoi());
			csmt.setString("User1", noiDungDCMHModel.getUser1());
			csmt.setString("User2", noiDungDCMHModel.getUser2());
			csmt.setString("User3", noiDungDCMHModel.getUser3());
			csmt.setString("User4", noiDungDCMHModel.getUser4());
			csmt.setString("User5", noiDungDCMHModel.getUser5());
			csmt.setNString("Muc_tieu", noiDungDCMHModel.getMucTieu());
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				String id = csmt.getString("ID");
				noiDungDCMHModel.setMaNoiDungDeCuong(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static Boolean updateNoiDungDCMH(NoiDungDCMHModel noiDungDCMHModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateNoiDungDCMH(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");	
			csmt.setString("ID", noiDungDCMHModel.getMaNoiDungDeCuong());
			csmt.setString("So_thu_tu", noiDungDCMHModel.getSoThuTu());
			csmt.setString("So_buoi", noiDungDCMHModel.getSoBuoi());
			csmt.setString("Ma_de_cuong", noiDungDCMHModel.getMaDeCuong());
			csmt.setNString("Ten_chuong", noiDungDCMHModel.getTenChuong());	
			csmt.setString("Co_hieu", noiDungDCMHModel.getCoHieu());
			csmt.setString("So_tiet", noiDungDCMHModel.getSoTiet());
			csmt.setString("Ngay_cap_nhat_cuoi", noiDungDCMHModel.getNgayCapNhatCuoi());
			csmt.setString("User1", noiDungDCMHModel.getUser1());
			csmt.setString("User2", noiDungDCMHModel.getUser2());
			csmt.setString("User3", noiDungDCMHModel.getUser3());
			csmt.setString("User4", noiDungDCMHModel.getUser4());
			csmt.setString("User5", noiDungDCMHModel.getUser5());
			csmt.setNString("Muc_tieu", noiDungDCMHModel.getMucTieu());
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static ArrayList<NoiDungDCMHModel> getAllNoiDungDCMHByMaDeCuong(String maDeCuong) {
		ArrayList<NoiDungDCMHModel> list = new ArrayList<NoiDungDCMHModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllNoiDungDCMHByMaDeCuong"));
			preparedStatement.setString(1, maDeCuong);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				NoiDungDCMHModel noiDungDCMHModel = new NoiDungDCMHModel();
				
				noiDungDCMHModel.setMaNoiDungDeCuong(rs.getString("MaNoiDungDCMH"));
				noiDungDCMHModel.setTenChuong(rs.getNString("TenChuong"));	
				noiDungDCMHModel.setMaDeCuong(rs.getString("MaDeCuong"));
				noiDungDCMHModel.setSoBuoi(rs.getString("SoBuoi"));
				noiDungDCMHModel.setSoThuTu(rs.getString("SoThuTu"));
				noiDungDCMHModel.setCoHieu(rs.getString("CoHieu"));
				noiDungDCMHModel.setSoTiet(rs.getString("SoTiet"));
				noiDungDCMHModel.setMucTieu(rs.getNString("MucTieu"));
				list.add(noiDungDCMHModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Boolean deleteNoiDungDCMH(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteNoiDungDCMH(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static ArrayList<NoiDungDCMHModel> getAllNoiDungDCMHByMaChuongTrinhAndHocKi(String maChuongTrinh, String hocKi) {
		ArrayList<NoiDungDCMHModel> noiDungDCMHModelList = new ArrayList<NoiDungDCMHModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllNoiDungDCMHByMaChuongTrinhAndHocKi"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			preparedStatement.setString(2, maChuongTrinh);
			//preparedStatement.setString(3, hocKi);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				NoiDungDCMHModel noiDungDCMHModel = new NoiDungDCMHModel();
				noiDungDCMHModel.setMaMonHoc(rs.getString("MaMonHoc"));
				noiDungDCMHModel.setCoHieu(rs.getString("CoHieu"));
				noiDungDCMHModel.setSoBuoi(rs.getString("SoBuoi"));
				noiDungDCMHModel.setSoThuTu(rs.getString("SoThuTu"));
				if(rs.getString("TenChuong") != null) {
					noiDungDCMHModel.setTenChuong(rs.getString("TenChuong").replaceAll("\r\n", "<+++>"));
					noiDungDCMHModel.setTenChuong(noiDungDCMHModel.getTenChuong().replace("'", "-DAUNHAY-"));
					noiDungDCMHModel.setTenChuong(noiDungDCMHModel.getTenChuong().replace("\"", "-DAUNHAY1-"));
				} else
					noiDungDCMHModel.setTenChuong(rs.getString("TenChuong"));
				if(rs.getString("MucTieu") != null && !rs.getString("MucTieu").equals("")) {
					noiDungDCMHModel.setMucTieu(rs.getString("MucTieu").replaceAll("\r\n", "<+++>"));
					noiDungDCMHModel.setMucTieu(noiDungDCMHModel.getMucTieu().replace("'", "-DAUNHAY-"));
					noiDungDCMHModel.setMucTieu(noiDungDCMHModel.getMucTieu().replace("\"", "-DAUNHAY1-"));
				} else
					noiDungDCMHModel.setMucTieu(null);
				//noiDungDCMHModel.setTenChuong(rs.getNString("TenChuong"));
				//noiDungDCMHModel.setMucTieu(rs.getNString("MucTieu"));
				noiDungDCMHModelList.add(noiDungDCMHModel);
			} 
		}catch (Exception e) {
				e.printStackTrace();
		}
		return noiDungDCMHModelList;					
	}
	
	public static ArrayList<NoiDungDCMHModel> getAllNoiDungDCMH() {
		ArrayList<NoiDungDCMHModel> list = new ArrayList<NoiDungDCMHModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllNoiDungDCMH"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				NoiDungDCMHModel noiDungDCMHModel = new NoiDungDCMHModel();
				
				noiDungDCMHModel.setMaNoiDungDeCuong(rs.getString("MaNoiDungDCMH"));
				if(rs.getString("TenChuong")!=null)
					noiDungDCMHModel.setTenChuong(rs.getString("TenChuong"));	
				else
					noiDungDCMHModel.setTenChuong("");	
				noiDungDCMHModel.setMaDeCuong(rs.getString("MaDeCuong"));
				noiDungDCMHModel.setSoBuoi(rs.getString("SoBuoi"));
				noiDungDCMHModel.setSoThuTu(rs.getString("SoThuTu"));
				noiDungDCMHModel.setCoHieu(rs.getString("CoHieu"));
				noiDungDCMHModel.setSoTiet(rs.getString("SoTiet"));
				list.add(noiDungDCMHModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	public static String getTotalNoiDungDCMHByMaDeCuong(String maDC) {
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTotalNoiDungDCMHByMaDeCuong"));
			preparedStatement.setString(1,maDC);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				return rs.getString("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "0";
		}
		return "0";
	}	
	
	
}
