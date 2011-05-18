package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.TuanLeModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.LogUtil;

public class TuanLeDAO {
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	public static ArrayList<TuanLeModel> getAllTuanLe() {
		ArrayList<TuanLeModel> tuanLeModelList = new ArrayList<TuanLeModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllTuanLe"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				TuanLeModel tuanLeModel = new TuanLeModel();
				tuanLeModel.setMaNamHoc(rs.getString("MaNamHoc"));
				tuanLeModel.setMaTuanLe(rs.getString("MaTuanLe"));
				tuanLeModel.setSoThuTu(rs.getString("SoThuTu"));
				tuanLeModel.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
				tuanLeModel.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));
				tuanLeModel.setNamBatDau(rs.getString("NamBatDau"));
				tuanLeModelList.add(tuanLeModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return tuanLeModelList;
	}
	public static ArrayList<TuanLeModel> getTuanLeBy2NamBatDau(String nam1, String nam2) {
		ArrayList<TuanLeModel> tuanLeModelList = new ArrayList<TuanLeModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getTuanLeBy2NamBatDau"));
			preparedStatement.setString(1, nam1);
			preparedStatement.setString(2, nam2);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				TuanLeModel tuanLeModel = new TuanLeModel();
				tuanLeModel.setMaNamHoc(rs.getString("MaNamHoc"));
				tuanLeModel.setMaTuanLe(rs.getString("MaTuanLe"));
				tuanLeModel.setSoThuTu(rs.getString("SoThuTu"));
				tuanLeModel.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
				tuanLeModel.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));
				tuanLeModel.setNamBatDau(rs.getString("NamBatDau"));
				tuanLeModelList.add(tuanLeModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return tuanLeModelList;
	}
	public static ArrayList<TuanLeModel> getTuanLeByMaNam(String maNam) {
		ArrayList<TuanLeModel> tuanLeModelList = new ArrayList<TuanLeModel>();
		try {
			if (maNam == null) {
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("admin.sql.SelectTopIDNamHoc"));
				ResultSet rs = preparedStatement.executeQuery();
				if (rs.next()) {
					maNam = rs.getString("id");
				}
				
			}
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.ChiTietByMaNam"));
			preparedStatement.setString(1, maNam);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				TuanLeModel tuanLeModel = new TuanLeModel();
				tuanLeModel.setMaTuanLe(rs.getString("MaTuanLe"));
				tuanLeModel.setSoThuTu(rs.getString("SoThuTu"));
				tuanLeModel.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
				tuanLeModel.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));
				tuanLeModel.setNamBatDau(rs.getString("NamBatDau"));
				tuanLeModel.setNamBatDau(rs.getString("NamKetThuc"));
				tuanLeModelList.add(tuanLeModel);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return tuanLeModelList;
	}
	
	public static Boolean updateTuanLe(TuanLeModel tuanle) {
		Boolean result = false;		
		try {
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateTuanLe(?,?,?)}");
			
			csmt.setString("Tu_Ngay",DateUtil.setDate(tuanle.getTuNgay()));
			csmt.setString("Den_Ngay",DateUtil.setDate( tuanle.getDenNgay()));
			csmt.setString("ID", tuanle.getMaTuanLe());
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update Tuan Le thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	public static TuanLeModel getTuanByNgay(String kieuTuan) {
		TuanLeModel tuanLe = new TuanLeModel();		
		try {
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetTuanByNgay(?,?,?,?,?,?)}");
			csmt.setString("Kieu_tuan", kieuTuan);
			csmt.registerOutParameter("Ma_tuan", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Tu_Ngay", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Den_Ngay", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Thu_tu_tuan", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ma_nam_hoc", java.sql.Types.VARCHAR);
			
			boolean result = DataUtil.executeNonStore(csmt);								
			if (result) { 
				tuanLe.setMaTuanLe(csmt.getString("Ma_tuan"));
				tuanLe.setTuNgay(DateUtil.setDate(csmt.getString("Tu_ngay")));
				tuanLe.setDenNgay(DateUtil.setDate(csmt.getString("Den_ngay")));
				tuanLe.setSoThuTu(csmt.getString("Thu_tu_tuan"));
				tuanLe.setMaNamHoc(csmt.getString("Ma_nam_hoc"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return tuanLe;
	}	
	public static int getSoTuanByThangAndNam(String thang, String nam) {
		int soTuan = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getSoTuanByThangAndNam"));
			preparedStatement.setString(1, nam);
			preparedStatement.setString(2, thang);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				soTuan = Integer.parseInt(rs.getString("SoTuan"));
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return soTuan;
	}
	public static ArrayList<TuanLeModel> getNgayTrongTuanByTuanBatDauVaTuanKetThucVaMaNamHoc(String tuanBatDau, String tuanKetThuc, String maNamHoc) {
		ArrayList<TuanLeModel> tuanLeList = new ArrayList<TuanLeModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getNgayTrongTuanByTuanBatDauVaTuanKetThucVaMaNamHoc"));
			preparedStatement.setString(1, maNamHoc);
			preparedStatement.setString(2, tuanBatDau);
			preparedStatement.setString(3, tuanKetThuc);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				TuanLeModel tuanLe = new TuanLeModel();
				tuanLe.setSoThuTu(rs.getString("SoThuTu"));
				tuanLe.setThuHai(rs.getString("ThuHai"));
				tuanLe.setThuBa(rs.getString("ThuBa"));
				tuanLe.setThuTu(rs.getString("ThuTu"));
				tuanLe.setThuNam(rs.getString("ThuNam"));
				tuanLe.setThuSau(rs.getString("ThuSau"));
				tuanLe.setThuBay(rs.getString("ThuBay"));
				tuanLe.setChuNhat(rs.getString("ChuNhat"));
				tuanLeList.add(tuanLe);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return tuanLeList;
	}
}
