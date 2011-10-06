package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietDiemDanhModel;
import vn.edu.hungvuongaptech.model.ThangTheoDoiModel;
import vn.edu.hungvuongaptech.model.ThanhVienDiemDanhModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ThangTheoDoiDAO {
	public static ArrayList<ThangTheoDoiModel> getThangTheoDoiByMaTKB(String maTKB){
		ArrayList<ThangTheoDoiModel> thangTheoDoiList = new ArrayList<ThangTheoDoiModel>();
		String thang = "na", maSinhVien = "na";
		ArrayList<ThanhVienDiemDanhModel> thanhVienDiemDanhList = new ArrayList<ThanhVienDiemDanhModel>();
		ArrayList<ChiTietDiemDanhModel> chiTietDiemDanhList = new ArrayList<ChiTietDiemDanhModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getThangTheoDoiByMaTKB"));
			preparedStatement.setString(1, maTKB);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				String thangHoc = rs.getString("Thang");
				if(!thangHoc.equals(thang)) {
					ThangTheoDoiModel thangTheoDoi = new ThangTheoDoiModel();
					thangTheoDoi.setThang(thangHoc);
					thangTheoDoi.setNam(rs.getString("Nam"));
					thanhVienDiemDanhList = new ArrayList<ThanhVienDiemDanhModel>();
					thangTheoDoi.setThanhVienDiemDanhModelList(thanhVienDiemDanhList);
					thangTheoDoiList.add(thangTheoDoi);
				}
				if(!thangHoc.equals(thang) || !rs.getString("MaSinhVien").equals(maSinhVien)) {
					ThanhVienDiemDanhModel thanhVienDiemDanh = new ThanhVienDiemDanhModel();
					thanhVienDiemDanh.setMaThanhVien(rs.getString("MaSinhVien"));
					thanhVienDiemDanh.setTenThanhVien(rs.getNString("TenSinhVien"));
					chiTietDiemDanhList = new ArrayList<ChiTietDiemDanhModel>();
					thanhVienDiemDanh.setChiTietDiemDanhList(chiTietDiemDanhList);
					thanhVienDiemDanhList.add(thanhVienDiemDanh);
				}
				ChiTietDiemDanhModel chiTietDiemDanh = new ChiTietDiemDanhModel();
				chiTietDiemDanh.setNgayHoc(rs.getString("NgayHoc"));
				chiTietDiemDanh.setNam(rs.getString("Nam"));
				chiTietDiemDanh.setThang(rs.getString("Thang"));
				chiTietDiemDanh.setNgay(rs.getString("Ngay"));
				chiTietDiemDanh.setTinhTrangDiHoc(rs.getString("TinhTrangDiHoc"));
				chiTietDiemDanhList.add(chiTietDiemDanh);
				if(!thangHoc.equals(thang)) {
					thang = thangHoc;
					maSinhVien = rs.getString("MaSinhVien");
				} else if(!rs.getString("MaSinhVien").equals(maSinhVien))
					maSinhVien = rs.getString("MaSinhVien");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return thangTheoDoiList;
	}
}
