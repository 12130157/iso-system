/**
 * 
 */
package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.MonHocModel;
import vn.edu.hungvuongaptech.util.DataUtil;

/**
 * @author ThienVD
 *
 */
public class ChiTietThanhVienDAO {
	public static ChiTietThanhVienModel timChiTietThanhVien(String tenDangNhap) {
		ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getChiTietThanhVienByTenDangNhap"));
			preparedStatement.setString(1, tenDangNhap);			
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				chiTietThanhVienModel.setTenLot(rs.getString("TenLot"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				chiTietThanhVienModel.setNgaySinh(rs.getString("NgaySinh"));
				chiTietThanhVienModel.setMaDiaChi(rs.getString("MaDiaChi"));
				chiTietThanhVienModel.setEmail(rs.getString("Email"));
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setDienThoaiDiDong(rs.getString("DienThoaiDiDong"));
				chiTietThanhVienModel.setMaBangCap(rs.getString("MaBangCap"));
				chiTietThanhVienModel.setNgayBatDau(rs.getString("NgayBatDau"));
				chiTietThanhVienModel.setNgayKetThuc(rs.getString("NgayKetThuc"));
				chiTietThanhVienModel.setMaTaiKhoan(rs.getString("MaTaiKhoan"));
				chiTietThanhVienModel.setTinhTrang(rs.getString("TinhTrang"));
				chiTietThanhVienModel.setChungMinhNhanDan(rs.getString("ChungMinhNhanDan"));
				chiTietThanhVienModel.setMaLopHoc(rs.getString("MaLopHoc"));
				chiTietThanhVienModel.setKiHieuLop(rs.getString("KiHieuLop"));
				chiTietThanhVienModel.setUser1(rs.getString("User1"));
				chiTietThanhVienModel.setUser2(rs.getString("User2"));
				chiTietThanhVienModel.setUser3(rs.getString("User3"));
				chiTietThanhVienModel.setUser4(rs.getString("User4"));
				chiTietThanhVienModel.setUser5(rs.getString("User5"));
				
				
				return chiTietThanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	public static ChiTietThanhVienModel getChiTietThanhVienByMaLop(String maLop) {
		ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getChiTietThanhVienByMaLop"));
			preparedStatement.setString(1, maLop);			
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				chiTietThanhVienModel.setTenLot(rs.getString("TenLot"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				chiTietThanhVienModel.setNgaySinh(rs.getString("NgaySinh"));
				chiTietThanhVienModel.setMaDiaChi(rs.getString("MaDiaChi"));
				chiTietThanhVienModel.setEmail(rs.getString("Email"));
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setDienThoaiDiDong(rs.getString("DienThoaiDiDong"));
				chiTietThanhVienModel.setMaBangCap(rs.getString("MaBangCap"));
				chiTietThanhVienModel.setNgayBatDau(rs.getString("NgayBatDau"));
				chiTietThanhVienModel.setNgayKetThuc(rs.getString("NgayKetThuc"));
				chiTietThanhVienModel.setMaTaiKhoan(rs.getString("MaTaiKhoan"));
				chiTietThanhVienModel.setTinhTrang(rs.getString("TinhTrang"));
				chiTietThanhVienModel.setChungMinhNhanDan(rs.getString("ChungMinhNhanDan"));
				chiTietThanhVienModel.setMaLopHoc(rs.getString("MaLopHoc"));
				chiTietThanhVienModel.setUser1(rs.getString("User1"));
				chiTietThanhVienModel.setUser2(rs.getString("User2"));
				chiTietThanhVienModel.setUser3(rs.getString("User3"));
				chiTietThanhVienModel.setUser4(rs.getString("User4"));
				chiTietThanhVienModel.setUser5(rs.getString("User5"));
				
				
				return chiTietThanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<ChiTietThanhVienModel> getAllChiTietThanhVien() {
		ArrayList<ChiTietThanhVienModel> listKetQua = new ArrayList<ChiTietThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllChiTietThanhVien"));		
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
				
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				chiTietThanhVienModel.setTenLot(rs.getString("TenLot"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				chiTietThanhVienModel.setNgaySinh(rs.getString("NgaySinh"));
				chiTietThanhVienModel.setMaDiaChi(rs.getString("MaDiaChi"));
				chiTietThanhVienModel.setEmail(rs.getString("Email"));
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setDienThoaiDiDong(rs.getString("DienThoaiDiDong"));
				chiTietThanhVienModel.setMaBangCap(rs.getString("MaBangCap"));
				chiTietThanhVienModel.setNgayBatDau(rs.getString("NgayBatDau"));
				chiTietThanhVienModel.setNgayKetThuc(rs.getString("NgayKetThuc"));
				chiTietThanhVienModel.setMaTaiKhoan(rs.getString("MaTaiKhoan"));
				chiTietThanhVienModel.setTinhTrang(rs.getString("TinhTrang"));
				chiTietThanhVienModel.setChungMinhNhanDan(rs.getString("ChungMinhNhanDan"));
				chiTietThanhVienModel.setMaLopHoc(rs.getString("MaLopHoc"));
				chiTietThanhVienModel.setUser1(rs.getString("User1"));
				chiTietThanhVienModel.setUser2(rs.getString("User2"));
				chiTietThanhVienModel.setUser3(rs.getString("User3"));
				chiTietThanhVienModel.setUser4(rs.getString("User4"));
				chiTietThanhVienModel.setUser5(rs.getString("User5"));
				
				
				listKetQua.add(chiTietThanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	/*public static ArrayList<ChiTietThanhVienModel> getAllGiaoVien() {
		ArrayList<ChiTietThanhVienModel> chiTietThanhVienModelList = new ArrayList<ChiTietThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllGiaoVien"));
			preparedStatement.setString(1, Constant.PHONG_DAO_TAO);
			preparedStatement.setString(2, Constant.PHONG_HANH_CHANH);
			preparedStatement.setString(3, Constant.GIAO_VIEN);
			preparedStatement.setString(4, Constant.HIEU_TRUONG);
			preparedStatement.setString(5, Constant.HOI_DONG_THAM_DINH);
			preparedStatement.setString(6, Constant.TRUONG_BO_MON);
			preparedStatement.setString(7, Constant.TRUONG_KHOA);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
				chiTietThanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				chiTietThanhVienModel.setHoThanhVien(rs.getString("Ho"));
				chiTietThanhVienModel.setTenLot(rs.getString("TenLot"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("Ten"));
				chiTietThanhVienModelList.add(chiTietThanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietThanhVienModelList;
	}*/

	public static ChiTietThanhVienModel timChiTietThanhVienByCard(String idCar) {
		ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.ShowChiTietThanhVienByMaCar"));
			preparedStatement.setString(1, idCar);			
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				chiTietThanhVienModel.setTenLot(rs.getString("TenLot"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				chiTietThanhVienModel.setNgaySinh(rs.getString("NgaySinh"));
				chiTietThanhVienModel.setMaDiaChi(rs.getString("MaDiaChi"));
				chiTietThanhVienModel.setEmail(rs.getString("Email"));
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setDienThoaiDiDong(rs.getString("DienThoaiDiDong"));
				chiTietThanhVienModel.setMaBangCap(rs.getString("MaBangCap"));
				chiTietThanhVienModel.setNgayBatDau(rs.getString("NgayBatDau"));
				chiTietThanhVienModel.setNgayKetThuc(rs.getString("NgayKetThuc"));
				chiTietThanhVienModel.setMaTaiKhoan(rs.getString("MaTaiKhoan"));
				chiTietThanhVienModel.setTinhTrang(rs.getString("TinhTrang"));
				chiTietThanhVienModel.setChungMinhNhanDan(rs.getString("ChungMinhNhanDan"));
				chiTietThanhVienModel.setMaLopHoc(rs.getString("MaLopHoc"));
				chiTietThanhVienModel.setUser1(rs.getString("User1"));
				chiTietThanhVienModel.setUser2(rs.getString("User2"));
				chiTietThanhVienModel.setUser3(rs.getString("User3"));
				chiTietThanhVienModel.setUser4(rs.getString("User4"));
				chiTietThanhVienModel.setUser5(rs.getString("User5"));
				
				
				return chiTietThanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}	
	public static ArrayList<ChiTietThanhVienModel> getAllChiTietThanhVienByMaLop(String maLop) {
		ArrayList<ChiTietThanhVienModel> chiTietThanhVienList = new ArrayList<ChiTietThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("xemDiem.sql.getAllChiTietThanhVienByMaLop"));
			preparedStatement.setString(1, maLop);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
				
				chiTietThanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				chiTietThanhVienModel.setHoThanhVien(rs.getString("Ho"));
				chiTietThanhVienModel.setTenLot(rs.getString("TenLot"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("Ten"));
				chiTietThanhVienList.add(chiTietThanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietThanhVienList;
	}
}
