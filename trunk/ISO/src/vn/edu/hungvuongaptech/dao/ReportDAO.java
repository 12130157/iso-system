package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.IntroModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ReportDAO {
	public static ArrayList<IntroModel> getCongTacReport(String maThanhVien, String tinhTrang, String khoa, String maNamHoc, String tuanLe, String check) {
		ArrayList<IntroModel> introModelList = new ArrayList<IntroModel>();		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_GetCongTacReport(?,?,?,?,?,?)}");
			csmt.setString("Ma_thanh_vien", maThanhVien);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Khoa", khoa);
			csmt.setString("Tuan_le", tuanLe);
			csmt.setString("Ma_nam_hoc", maNamHoc);
			csmt.setString("Check", check);
			
			ResultSet rs = DataUtil.executeStore(csmt);
			while (rs.next()) {
				IntroModel introModel = new IntroModel();
				introModel.setTenKHDT(rs.getNString("Ten"));
				introModel.setMaNoiDungChiTietKHDT(rs.getString("MaNoiDungChiTietKHDT"));
				introModel.setNoiDungCongTac(rs.getNString("NoiDungCongTac"));
				introModel.setTenBoPhan(rs.getNString("TenBoPhan"));
				introModel.setTenThanhVien(rs.getNString("TenThanhVien"));
				introModel.setEmail(rs.getString("Email"));
				introModel.setTuNgay(rs.getString("Tu_ngay"));
				introModel.setDenNgay(rs.getString("Den_ngay"));
				introModel.setMaBoPhan(rs.getString("MaBoPhanThucHien"));
				introModel.setMaNguoiThucHien(rs.getString("MaNguoiThucHien"));
				introModel.setTinhTrang(rs.getString("TinhTrangThucHien"));
				introModelList.add(introModel);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return introModelList;
	}
}
