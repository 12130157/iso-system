package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.IntroModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class IntroDAO {
	public static ArrayList<IntroModel> getAllCongTacByNguoiLogin(String maNguoiLogin) {
		ArrayList<IntroModel> introModelList = new ArrayList<IntroModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllCongTacByNguoiLogin"));
			preparedStatement.setString(1, maNguoiLogin);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				IntroModel introModel = new IntroModel();
				introModel.setTenKHDT(rs.getNString("Ten"));
				introModel.setMaNoiDungChiTietKHDT(rs.getString("MaNoiDungChiTietKHDT"));
				introModel.setNoiDungCongTac(rs.getNString("Noi_dung_cong_tac"));
				introModel.setTenBoPhan(rs.getNString("Ten_bo_phan"));
				introModel.setTenThanhVien(rs.getNString("Ten_thanh_vien"));
				introModel.setEmail(rs.getString("Email"));
				introModel.setTuNgay(rs.getString("Tu_ngay"));
				introModel.setDenNgay(rs.getString("Den_ngay"));
				introModel.setMaBoPhan(rs.getString("MaBoPhanThucHien"));
				introModel.setMaNguoiThucHien(rs.getString("MaNguoiThucHien"));
				introModel.setTinhTrang(rs.getString("Tinh_trang_thuc_hien"));
				introModelList.add(introModel);
				Constant.NUM_ROWS = introModelList.size();
			}
			return introModelList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<IntroModel> getCongTac(String tinhTrang, String maNhanVien, String maNamHoc, String tuanLe, String check) {
		ArrayList<IntroModel> introModelList = new ArrayList<IntroModel>();		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_GetCongTac(?,?,?,?,?,?)}");
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_nhan_vien", maNhanVien);
			csmt.setString("Tuan_le", tuanLe);
			csmt.setString("Ma_nam_hoc", maNamHoc);
			csmt.setString("Check", check);
			csmt.setString("Bo_phan_BGH", Constant.BO_PHAN_BGH);
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
			return introModelList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int checkListCongTac(ArrayList<IntroModel> introModelList) {
		int result = 0;
		try {
			for (IntroModel introModel : introModelList) {
				if(introModel.getTinhTrang()=="1"){
					checkCongTac(introModel);
				}
			}
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	
	public static int checkCongTac(IntroModel introModel) {
		int result = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_CheckCongTac(?,?,?)}");
			csmt.setString("MaNguoiThucHien", introModel.getMaNguoiThucHien());
			csmt.setString("MaBoPhanThucHien", introModel.getMaBoPhan());
			csmt.setString("MaNoiDungChiTietKHDT", introModel.getMaNoiDungChiTietKHDT());
			DataUtil.executeNonStore(csmt);
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	
	public static int getCountCongTac(String tuan, String nam, String maThanhVien) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_GetCountCongTac(?,?,?)}");
			csmt.setString("Ma_thanh_vien", maThanhVien);
			if(tuan == null){
				csmt.setString("Tuan_le", "");
			}else{
				csmt.setString("Tuan_le", tuan);
			}
			if(nam == null){
				csmt.setString("Ma_nam_hoc", "");
			}else{
				csmt.setString("Ma_nam_hoc", nam);
			}
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
