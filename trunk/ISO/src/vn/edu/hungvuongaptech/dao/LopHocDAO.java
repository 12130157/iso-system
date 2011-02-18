package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.model.TuanLeModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class LopHocDAO {
	public static Boolean insertLopHocWithMoChuyenNganh(String maChuyenNganh, String maQuyetDinh, String kiHieu){
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertLopHoc(?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("Ma_chuyen_nganh", maChuyenNganh);
			csmt.setString("Ki_hieu", kiHieu);
			csmt.setString("Ma_lop_truong", "");
			csmt.setString("Ma_quyet_dinh", maQuyetDinh);	
			csmt.setString("User1", "");
			csmt.setString("User2", "");
			csmt.setString("User3", "");
			csmt.setString("User4", "");
			csmt.setString("User5", "");			
			result = DataUtil.executeNonStore(csmt);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static ArrayList<LopHocModel> getAllLopByMaChuongTrinhApproved() {
		ArrayList<LopHocModel> lopHocModelList = new ArrayList<LopHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllLopByMaChuongTrinhApproved"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				LopHocModel lopHocModel = new LopHocModel();
				lopHocModel.setMaLopHoc(rs.getString("MaLop"));
				lopHocModel.setMaChuongtrinh(rs.getString("MaChuongTrinh"));
				lopHocModel.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				lopHocModel.setSoHocSinh(rs.getString("GhiChu"));
				lopHocModel.setNamBatDau(rs.getString("NamBatDau"));
				lopHocModel.setKiHieu(rs.getString("KiHieu"));
				lopHocModelList.add(lopHocModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return lopHocModelList;
	}
	public static ArrayList<LopHocModel> getAllKiHieuLop() {
		ArrayList<LopHocModel> lopHocModelList = new ArrayList<LopHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllKiHieuLop"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				LopHocModel lopHocModel = new LopHocModel();
				lopHocModel.setMaLopHoc(rs.getString("MaLop"));
				lopHocModel.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				lopHocModel.setKiHieu(rs.getString("KiHieu"));
				lopHocModel.setMaLopTruong(rs.getString("MaLopTruong"));
				lopHocModel.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				lopHocModelList.add(lopHocModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return lopHocModelList;
	}
	
	public static ArrayList<LopHocModel> getAllKiHieuLopAndMaChuongTrinh() {
		ArrayList<LopHocModel> lopHocModelList = new ArrayList<LopHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllKiHieuLopAndMaChuongTrinh"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				LopHocModel lopHocModel = new LopHocModel();
				lopHocModel.setMaLopHoc(rs.getString("MaLop"));
				lopHocModel.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				lopHocModel.setKiHieu(rs.getString("KiHieu"));
				lopHocModel.setMaLopTruong(rs.getString("MaLopTruong"));
				lopHocModel.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				lopHocModel.setMaChuongtrinh(rs.getString("MaChuongTrinhDaoTao"));
				lopHocModelList.add(lopHocModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return lopHocModelList;
	}
	
	public static ArrayList<LopHocModel> showLop() {
		ArrayList<LopHocModel> lopHocModelList = new ArrayList<LopHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.showAllLopHoc"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				LopHocModel lopHocModel = new LopHocModel();
				lopHocModel.setMaLopHoc(rs.getString("MaLop"));
				lopHocModel.setMaLopTruong(rs.getString("MaLopTruong"));
				lopHocModel.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				lopHocModel.setKiHieu(rs.getString("KiHieu"));
				lopHocModel.setHoTenLopTruong(rs.getString("HoTenLopTruong"));
				lopHocModel.setTenQuyetDinh(rs.getString("TenQuyetDinh"));
				
				lopHocModelList.add(lopHocModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return lopHocModelList;
	}
	
	public static Boolean updateLopHoc(LopHocModel lopHocModel) {
		Boolean result = false;		
		try {
			
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateLopHoc(?,?,?)}");
			csmt.setNString("ID", lopHocModel.getMaLopHoc());
			csmt.setNString("Ki_hieu", StringUtil.toTrim(lopHocModel.getKiHieu()));
			if(lopHocModel.getMaLopTruong() == ""){
				csmt.setString("Ma_lop_truong", null);
			}else{
				csmt.setString("Ma_lop_truong", lopHocModel.getMaLopTruong());
			}

			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update lop hoc thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	
	public static String getMaChuongTrinhByMaLop(String maLop) {
		String maChuongTrinh="";
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getMaChuongTrinhByMaLop"));
			preparedStatement.setString(1,maLop);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				maChuongTrinh=rs.getString("MaChuongTrinh");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return maChuongTrinh;
	}
	
	public static ArrayList<LopHocModel> showLopHoc() {
		ArrayList<LopHocModel> lopHocModelList = new ArrayList<LopHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.ShowLopHoc"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				LopHocModel lopHocModel = new LopHocModel();
				lopHocModel.setMaLopHoc(rs.getString("ID"));
				lopHocModel.setKiHieu(rs.getString("Ki_hieu"));
			
				
				lopHocModelList.add(lopHocModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return lopHocModelList;
	}
	
	
	public static LopHocModel getKiHieuByMaLop(String maLop) {
		LopHocModel lopHocModel = new LopHocModel();
		
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getKiHieuByMaLop"));
			preparedStatement.setString(1,maLop);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				lopHocModel.setMaLopHoc(rs.getString("MaLop"));
				lopHocModel.setKiHieu(rs.getString("KiHieu"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return lopHocModel;
	}
	
	
}
