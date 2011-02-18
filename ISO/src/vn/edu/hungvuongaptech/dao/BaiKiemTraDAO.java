package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;


import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BaiKiemTraModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class BaiKiemTraDAO {
	private static final Logger logger = Logger.getLogger(BaiKiemTraDAO.class.getName());
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	
	public static ArrayList<BaiKiemTraModel> getAllBaiKiemTraByMaMonHocOrderByTenBaiKiemTra(String maMonHoc){ 
		ArrayList<BaiKiemTraModel> listBaiKiemTra = new ArrayList<BaiKiemTraModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllBaiKiemTraByMaMonHocOrderByTenBaiKiemTra"));
			preparedStatement.setString(1, maMonHoc);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				BaiKiemTraModel baiKiemTraModel = new BaiKiemTraModel();
				baiKiemTraModel.setMaBaiKiemTra(rs.getString("maBaiKiemTra"));
				baiKiemTraModel.setMaMonHoc(rs.getString("maMonHoc"));
				baiKiemTraModel.setTenBaiKiemTra(rs.getString("tenBaiKiemTra"));
				baiKiemTraModel.setMaHinhThuc(rs.getString("maHinhThuc"));
				baiKiemTraModel.setTenHinhThuc(rs.getString("tenHinhThuc"));
				baiKiemTraModel.setThangDiem(rs.getString("thangDiem"));
				baiKiemTraModel.setGhiChu(rs.getString("ghiChu"));
				baiKiemTraModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));
				baiKiemTraModel.setUser1(rs.getString("user1"));
				baiKiemTraModel.setUser2(rs.getString("user2"));
				baiKiemTraModel.setUser3(rs.getString("user3"));
				baiKiemTraModel.setUser4(rs.getString("user4"));
				baiKiemTraModel.setUser5(rs.getString("user5"));
				baiKiemTraModel.setMaTenBaiKiemTra(rs.getString("MaTenBaiKiemTra"));
				listBaiKiemTra.add(baiKiemTraModel);
			}
		} catch (SQLException e) {
			//e.printStackTrace();
			LogUtil.logError(e, logger);
		}
		return listBaiKiemTra;
	}
	
	public static BaiKiemTraModel getBaiKiemTraByMaBaiKiemTra(String maBaiKiemTra){ 
		BaiKiemTraModel baiKiemTraModel = new BaiKiemTraModel();
		
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetBaiKiemTraByMaBaiKiemTra"));
			preparedStatement.setString(1, maBaiKiemTra);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				
				baiKiemTraModel.setMaBaiKiemTra(rs.getString("maBaiKiemTra"));
				baiKiemTraModel.setMaMonHoc(rs.getString("maMonHoc"));
				baiKiemTraModel.setTenBaiKiemTra(rs.getString("tenBaiKiemTra"));
				baiKiemTraModel.setMaHinhThuc(rs.getString("maHinhThuc"));
				baiKiemTraModel.setThangDiem(rs.getString("thangDiem"));
				baiKiemTraModel.setGhiChu(rs.getString("ghiChu"));
				baiKiemTraModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));
				baiKiemTraModel.setTenHinhThuc(rs.getString("tenHinhThuc"));
				baiKiemTraModel.setUser1(rs.getString("user1"));
				baiKiemTraModel.setUser2(rs.getString("user2"));
				baiKiemTraModel.setUser3(rs.getString("user3"));
				baiKiemTraModel.setUser4(rs.getString("user4"));
				baiKiemTraModel.setUser5(rs.getString("user5"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return baiKiemTraModel;
	}
	
	public static ArrayList<BaiKiemTraModel> getBaiKiemTraByMaMonHoc(String maMonHoc){
		ArrayList<BaiKiemTraModel> listKetQua = new ArrayList<BaiKiemTraModel>();
		BaiKiemTraModel baiKiemTraModel = null;
		Constant.NUM_ROW_1 = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.GetBaiKiemTraByMaMonHoc"));
			preparedStatement.setString(1, maMonHoc);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				baiKiemTraModel = new BaiKiemTraModel();
				
				baiKiemTraModel.setMaBaiKiemTra(rs.getString("maBaiKiemTra"));
				baiKiemTraModel.setMaMonHoc(rs.getString("maMonHoc"));
				baiKiemTraModel.setMaTenBaiKiemTra(rs.getString("maTenBaiKiemTra"));
				baiKiemTraModel.setTenBaiKiemTra(rs.getString("tenBaiKiemTra"));
				baiKiemTraModel.setMaHinhThuc(rs.getString("maHinhThuc"));
				baiKiemTraModel.setThangDiem(rs.getString("thangDiem"));
				baiKiemTraModel.setTenHinhThuc(rs.getString("tenHinhThuc"));
				baiKiemTraModel.setHeSo(rs.getString("heSo"));
				
				listKetQua.add(baiKiemTraModel);
				Constant.NUM_ROW_1++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<BaiKiemTraModel> showAllBaiKiemTra() {
		ArrayList<BaiKiemTraModel> listKetQua = new ArrayList<BaiKiemTraModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.GetAllBaiKiemTra"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				BaiKiemTraModel baiKiemTraModel = new BaiKiemTraModel();
				
				baiKiemTraModel.setMaBaiKiemTra(rs.getString("maBaiKiemTra"));
				baiKiemTraModel.setMaMonHoc(rs.getString("maMonHoc"));
				baiKiemTraModel.setMaTenBaiKiemTra(rs.getString("maTenBaiKiemTra"));
				baiKiemTraModel.setMaHinhThuc(rs.getString("maHinhThuc"));
				baiKiemTraModel.setThangDiem(rs.getString("thangDiem"));				
				
				listKetQua.add(baiKiemTraModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static BaiKiemTraModel timBaiKiemTraGP(String tenBaiKiemTra) {
		BaiKiemTraModel baiKiemtraModel = new BaiKiemTraModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetBaiKiemTraByTenBaiKiemtra"));
			preparedStatement.setString(1, tenBaiKiemTra);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				baiKiemtraModel.setMaBaiKiemTra(rs.getString("maBaiKiemTra"));
				baiKiemtraModel.setMaMonHoc(rs.getString("maMonHoc"));
				baiKiemtraModel.setTenBaiKiemTra(rs.getString("tenBaiKiemTra"));
				baiKiemtraModel.setMaHinhThuc(rs.getString("maHinhThuc"));
				baiKiemtraModel.setThangDiem(rs.getString("thangDiem"));
				return baiKiemtraModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Boolean insertBaiKiemTra(BaiKiemTraModel baiKiemTraModel) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_InsertBaiKiemTra(?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ma_mon_hoc", StringUtil.toTrim(baiKiemTraModel.getMaMonHoc()));
			csmt.setNString("Ma_ten_bai_kiem_tra", StringUtil.toTrim(baiKiemTraModel.getMaTenBaiKiemTra()));
			csmt.setNString("Ma_hinh_thuc", baiKiemTraModel.getMaHinhThuc());
			csmt.setNString("Thang_diem", baiKiemTraModel.getThangDiem());
			csmt.setNString("Ghi_chu", baiKiemTraModel.getGhiChu());
			csmt.setNString("Ngay_cap_nhat_cuoi", baiKiemTraModel.getNgayCapNhatCuoi());
			csmt.setNString("User1", baiKiemTraModel.getHeSo());

			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // insert bai kiem tra thanh cong
				baiKiemTraModel.setMaBaiKiemTra(csmt.getString("ID"));
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static Boolean updateBaiKiemTra(BaiKiemTraModel baiKiemTraModel) {
		Boolean result = false;		
		try {
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateBaiKiemTra(?,?,?,?,?,?,?,?)}");
			csmt.setNString("ID", baiKiemTraModel.getMaBaiKiemTra());
			csmt.setNString("Ma_mon_hoc", StringUtil.toTrim(baiKiemTraModel.getMaMonHoc()));
			csmt.setNString("Ma_ten_bai_kiem_tra", baiKiemTraModel.getMaTenBaiKiemTra());
			csmt.setNString("Ma_hinh_thuc", baiKiemTraModel.getMaHinhThuc());
			csmt.setNString("Thang_diem", baiKiemTraModel.getThangDiem());
			csmt.setNString("Ghi_chu", baiKiemTraModel.getGhiChu());
			csmt.setNString("Ngay_cap_nhat_cuoi", baiKiemTraModel.getNgayCapNhatCuoi());
			csmt.setNString("User1", baiKiemTraModel.getHeSo());

			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update bai kiem tra thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static Boolean deleteBaiKiemTra(String maBaiKiemTra) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_DeleteBaiKiemTra(?)}");
			
			csmt.setString("ID",maBaiKiemTra);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
}
