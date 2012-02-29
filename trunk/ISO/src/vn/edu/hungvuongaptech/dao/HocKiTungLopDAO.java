package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.HocKiTungLopModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class HocKiTungLopDAO {
	public static ArrayList<HocKiTungLopModel> getHocKiTungLopByMaNamHocAndHocKi(String maNamHoc, String hocKi) {
		ArrayList<HocKiTungLopModel> hocKiTungLopList = new ArrayList<HocKiTungLopModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.getHocKiTungLopByMaNamHocAndHocKi"));	
			preparedStatement.setString(1, maNamHoc);
			preparedStatement.setString(2, hocKi);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				HocKiTungLopModel hocKiTungLop = new HocKiTungLopModel();
				hocKiTungLop.setMaHocKiTungLop(rs.getString("MaHocKiTungLop"));
				hocKiTungLop.setMaLop(rs.getString("MaLop"));
				hocKiTungLop.setKiHieuLop(rs.getString("KiHieuLop"));
				hocKiTungLop.setTinhTrang(rs.getString("TinhTrang"));
				hocKiTungLopList.add(hocKiTungLop);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hocKiTungLopList;
	}
	
	// chi lay hocki, namhoc, tenchuyennganh, kihieulop dung cho trang in
	public static HocKiTungLopModel getHocKiTungLopByID(String maHocKiTungLop) {
		HocKiTungLopModel hocKiTungLop = new HocKiTungLopModel();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.getHocKiTungLopByID"));	
			preparedStatement.setString(1, maHocKiTungLop);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				
				hocKiTungLop.setHocKi(rs.getString("HocKi"));
				hocKiTungLop.setNamHoc(rs.getString("NamHoc"));
				hocKiTungLop.setKiHieuLop(rs.getString("KiHieuLop"));
				hocKiTungLop.setTenChuyenNganh(rs.getNString("TenChuyenNganh"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hocKiTungLop;
	}
	public static ArrayList<HocKiTungLopModel> getHocKiTungLopByMaNamHocAndHocKiAndMaGiaoVien(String maNamHoc, String hocKi, String maGiaoVien) {
		ArrayList<HocKiTungLopModel> hocKiTungLopList = new ArrayList<HocKiTungLopModel>();	
		String maHocKiTungLop = "na";
		ArrayList<MonHocTKBModel> monHocTKBList = new ArrayList<MonHocTKBModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.getHocKiTungLopByMaNamHocAndHocKiAndMaGiaoVien"));	
			preparedStatement.setString(1, maNamHoc);
			preparedStatement.setString(2, hocKi);
			preparedStatement.setString(3, maGiaoVien);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if(!maHocKiTungLop.equals(rs.getString("MaHocKiTungLop"))) {
					HocKiTungLopModel hocKiTungLop = new HocKiTungLopModel();
					hocKiTungLop.setMaHocKiTungLop(rs.getString("MaHocKiTUngLop"));
					hocKiTungLop.setMaLop(rs.getString("MaLop"));
					hocKiTungLop.setKiHieuLop(rs.getString("KiHieuLop"));
					monHocTKBList = new ArrayList<MonHocTKBModel>();
					hocKiTungLop.setMonHocTKBList(monHocTKBList);
					hocKiTungLopList.add(hocKiTungLop);
					maHocKiTungLop = hocKiTungLop.getMaHocKiTungLop();
				}
				MonHocTKBModel monHocTKB = new MonHocTKBModel();
				monHocTKB.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocTKB.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				monHocTKB.setTenMonHoc(rs.getNString("TenMonHoc"));
				monHocTKBList.add(monHocTKB);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hocKiTungLopList;
	}
	public static ArrayList<HocKiTungLopModel> getHocKiTungLopByMaLop(String maLop) {
		ArrayList<HocKiTungLopModel> hocKiTungLopList = new ArrayList<HocKiTungLopModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.getHocKiTungLopByMaLop"));	
			preparedStatement.setString(1, maLop);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				HocKiTungLopModel hocKiTungLop = new HocKiTungLopModel();
				hocKiTungLop.setMaNamHoc(rs.getString("MaNamHoc"));
				hocKiTungLop.setNamHoc(rs.getString("NamHoc"));
				hocKiTungLop.setHocKi(rs.getString("HocKi"));
				hocKiTungLopList.add(hocKiTungLop);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hocKiTungLopList;
	}
	public static Boolean guiSoDiemHocKiMaHocKiTungLop(String maHocKiTungLop, String tinhTrang) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_XemDiem_guiSoDiemHocKiMaHocKiTungLop(?)}");
			csmt.setString("ID", maHocKiTungLop);
			csmt.setString("Tinh_trang", tinhTrang);
			result = DataUtil.executeNonStore(csmt);	
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
}
