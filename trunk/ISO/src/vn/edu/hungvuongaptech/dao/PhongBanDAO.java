package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.PhongBanModel;
import vn.edu.hungvuongaptech.model.SysRoleAppModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class PhongBanDAO {
	public static ArrayList<PhongBanModel> getAllPhongBan() {
		ArrayList<PhongBanModel> phongBanList = new ArrayList<PhongBanModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllPhongBan"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				PhongBanModel phongBanModel = new PhongBanModel();
				phongBanModel.setMaPhongBan(rs.getString("MaPhongBan"));
				phongBanModel.setKiHieu(rs.getString("KiHieuPhong"));
				phongBanModel.setViTri(rs.getString("ViTri"));
				phongBanModel.setChucNang(rs.getString("ChucNang"));
				phongBanModel.setSucChua(rs.getString("SucChua"));
				phongBanModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				phongBanModel.setUser1(rs.getString("User1"));
				phongBanModel.setUser1(rs.getString("User2"));
				phongBanModel.setUser1(rs.getString("User3"));
				phongBanModel.setUser1(rs.getString("User4"));
				phongBanModel.setUser1(rs.getString("User5"));
				
				phongBanList.add(phongBanModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return phongBanList;
	}
	
	public static ArrayList<PhongBanModel> showAllPhongBan() {
		ArrayList<PhongBanModel> listKetQua = new ArrayList<PhongBanModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllPhongBan"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				PhongBanModel PhongBanModel = new PhongBanModel();
				PhongBanModel.setMaPhongBan(rs.getString("MaPhongBan"));
				PhongBanModel.setKiHieu(rs.getString("KiHieu"));
				PhongBanModel.setViTri(rs.getString("ViTri"));
				PhongBanModel.setChucNang(rs.getString("ChucNang"));
				PhongBanModel.setSucChua(rs.getString("SucChua"));
			
				
				
				listKetQua.add(PhongBanModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	/*update phong ban*/
	
	public static Boolean updatePhongBan(PhongBanModel phongBanModel) {
		Boolean result = false;		
		try {
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdatePhongBan(?,?,?,?,?,?)}");
			csmt.setNString("ID", phongBanModel.getMaPhongBan());
			csmt.setNString("Ki_hieu_phong", StringUtil.toTrim(phongBanModel.getKiHieu()));
			csmt.setString("Vi_tri", StringUtil.toUTF8(StringUtil.toTrim(phongBanModel.getViTri())));
			csmt.setNString("Chuc_nang", StringUtil.toUTF8(StringUtil.toTrim(phongBanModel.getChucNang())));
			csmt.setNString("Suc_chua", StringUtil.toTrim(phongBanModel.getSucChua()));
			csmt.setString("Ngay_cap_nhat_cuoi", phongBanModel.getNgayCapNhatCuoi());
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	
	/*insert phong ban*/
	
	public static Boolean insertPhongBan(PhongBanModel phongBanModel) {
		Boolean result = false;		
		try {
			
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_InsertPhongBan(?,?,?,?,?)}");
			
			csmt.setNString("Ki_hieu_phong", StringUtil.toTrim(phongBanModel.getKiHieu()));
			csmt.setString("Vi_tri", StringUtil.toUTF8(StringUtil.toTrim(phongBanModel.getViTri())));
			csmt.setNString("Chuc_nang", StringUtil.toUTF8(StringUtil.toTrim(phongBanModel.getChucNang())));
			csmt.setNString("Suc_chua", StringUtil.toTrim(phongBanModel.getSucChua()));
			csmt.setString("Ngay_cap_nhat_cuoi", phongBanModel.getNgayCapNhatCuoi());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static ArrayList<String> getAllTitlePhongByTuanAndKhoa(String maTuan, String maKhoa) {
		ArrayList<String> listTitle = new ArrayList<String>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllTitlePhongByTuanAndKhoa"));	
			preparedStatement.setString(1, maTuan);
			preparedStatement.setString(2, maKhoa);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				listTitle.add(rs.getString("KiHieuPhong"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listTitle;
	}
}
