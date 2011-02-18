package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChuyenNganhModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ChuyenNganhDAO {
	public static ArrayList<ChuyenNganhModel> getAllChuyenNganh(){ 
		ArrayList<ChuyenNganhModel> listChuyenNganh = new ArrayList<ChuyenNganhModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetAllChuyenNganh"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChuyenNganhModel chuyenNganhModel = new ChuyenNganhModel();
				chuyenNganhModel.setMaChuyenNganh(rs.getString("maChuyenNganh"));
				chuyenNganhModel.setTenChuyenNganh(rs.getString("tenChuyenNganh"));
				chuyenNganhModel.setMaKhoaTT(rs.getString("maKhoaTT"));
				chuyenNganhModel.setKiHieu(rs.getString("KiHieu"));
				chuyenNganhModel.setNgayTao(rs.getString("ngayTao"));
				chuyenNganhModel.setMaNguoiTao(rs.getString("maNguoiTao"));
				chuyenNganhModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));
				chuyenNganhModel.setUser1(rs.getString("user1"));
				chuyenNganhModel.setUser2(rs.getString("user2"));
				chuyenNganhModel.setUser3(rs.getString("user3"));
				chuyenNganhModel.setUser4(rs.getString("user4"));
				chuyenNganhModel.setUser5(rs.getString("user5"));
				listChuyenNganh.add(chuyenNganhModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listChuyenNganh;
	}
	
	public static ChuyenNganhModel getChuyenNganhByMaMaChuyenNganh(String maChuyenNganh){ 
		ChuyenNganhModel chuyenNganhModel = new ChuyenNganhModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetChuyenNganhByMaChuyenNganh"));
			preparedStatement.setString(1, maChuyenNganh);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				chuyenNganhModel.setMaChuyenNganh(rs.getString("maChuyenNganh"));
				chuyenNganhModel.setTenChuyenNganh(rs.getString("tenChuyenNganh"));
				chuyenNganhModel.setMaKhoaTT(rs.getString("maKhoaTT"));
				chuyenNganhModel.setNgayTao(rs.getString("ngayTao"));
				chuyenNganhModel.setMaNguoiTao(rs.getString("maNguoiTao"));
				chuyenNganhModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));
				chuyenNganhModel.setUser1(rs.getString("user1"));
				chuyenNganhModel.setUser2(rs.getString("user2"));
				chuyenNganhModel.setUser3(rs.getString("user3"));
				chuyenNganhModel.setUser4(rs.getString("user4"));
				chuyenNganhModel.setUser5(rs.getString("user5"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chuyenNganhModel;
	}
	
	public static ArrayList<ChuyenNganhModel> getAllChuyenNganhAndMaQuyetDinh(String maNghe){ 
	
		ArrayList<ChuyenNganhModel> listChuyenNganh = new ArrayList<ChuyenNganhModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetAllChuyenNganhAndMaQuyetDinh"));
			if(maNghe == null || maNghe.equals(""))
				preparedStatement.setString(1, "");
			else
				preparedStatement.setString(1, maNghe);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChuyenNganhModel chuyenNganhModel = new ChuyenNganhModel();
				chuyenNganhModel.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				chuyenNganhModel.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				chuyenNganhModel.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				chuyenNganhModel.setKiHieu(rs.getString("KiHieu"));
				chuyenNganhModel.setMaKhoa(rs.getString("MaKhoa"));
				chuyenNganhModel.setNamBatDau(rs.getString("NamBatDau"));
				chuyenNganhModel.setSoNam(rs.getString("SoNam"));
				chuyenNganhModel.setTenHeDaoTao(rs.getString("TenHeDaoTao"));
				chuyenNganhModel.setMaHeDaoTao(rs.getString("MaHeDaoTao"));
				chuyenNganhModel.setTenBangCap(rs.getString("TenBangCap"));
				listChuyenNganh.add(chuyenNganhModel);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return listChuyenNganh;
	}
		public static ArrayList<ChuyenNganhModel> showAllChuyenNganh() {
		ArrayList<ChuyenNganhModel> listKetQua = new ArrayList<ChuyenNganhModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.GetAllChuyenNganh"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChuyenNganhModel ChuyenNganhModel = new ChuyenNganhModel();
				ChuyenNganhModel.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				ChuyenNganhModel.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				ChuyenNganhModel.setKiHieu (rs.getString("KiHieu"));
				ChuyenNganhModel.setKhoa(rs.getString("Khoa"));
				
				
				listKetQua.add(ChuyenNganhModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
		
		public static Boolean insertChuyenNganh(ChuyenNganhModel chuyenNganhModel) {
			Boolean result = false;		
			try {

				CallableStatement csmt = DataUtil
					.getConnection()
					.prepareCall("{call sp_Admin_InsertChuyenNganh(?,?,?,?,?)}");
				csmt.setNString("Ten_chuyen_nganh", StringUtil.toTrim(chuyenNganhModel.getTenChuyenNganh()));
				csmt.setNString("Ki_hieu", StringUtil.toTrim(chuyenNganhModel.getKiHieu()));
				csmt.setNString("Ma_khoaTT", chuyenNganhModel.getMaKhoaTT());
				csmt.setNString("Ngay_tao", chuyenNganhModel.getNgayTao());
				csmt.setNString("Ngay_cap_nhat_cuoi", chuyenNganhModel.getNgayCapNhatCuoi());

				Boolean ketQua = DataUtil.executeNonStore(csmt);								
				if (ketQua) { // insert chuyen nganh thanh cong
					result = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = false;
			}
							
			return result;
		}	
		public static Boolean updateChuyenNganh(ChuyenNganhModel chuyenNganhModel) {
			Boolean result = false;		
			try {
				
				CallableStatement csmt = DataUtil
					.getConnection()
					.prepareCall("{call sp_Admin_UpdateChuyenNganh(?,?,?,?,?,?)}");
				csmt.setNString("ID", chuyenNganhModel.getMaChuyenNganh());
				csmt.setNString("Ten_chuyen_nganh", StringUtil.toTrim(chuyenNganhModel.getTenChuyenNganh()));
				csmt.setNString("Ki_hieu", StringUtil.toTrim(chuyenNganhModel.getKiHieu()));
				csmt.setNString("Ma_khoaTT", chuyenNganhModel.getMaKhoaTT());
				csmt.setNString("Ngay_tao", chuyenNganhModel.getNgayTao());
				csmt.setNString("Ngay_cap_nhat_cuoi", chuyenNganhModel.getNgayCapNhatCuoi());

				Boolean ketQua = DataUtil.executeNonStore(csmt);								
				if (ketQua) { // update chuyen nganh thanh cong
					result = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = false;
			}
							
			return result;
		}	
		
	
}
