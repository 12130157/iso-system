package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class NoiDungChiTietKHDTDAO {
	public static ArrayList<NoiDungChiTietKHDTModel> timNoiDungKHDTByMaChiTietKHDT(String maChiTietKHDT) {
		ArrayList<NoiDungChiTietKHDTModel> list = new ArrayList<NoiDungChiTietKHDTModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getNoiDungKHDTByMaChiTietKHDT"));
			preparedStatement.setString(1, maChiTietKHDT);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				NoiDungChiTietKHDTModel noiDung = new NoiDungChiTietKHDTModel();
				
				noiDung.setMaNoiDungChiTietKHDT(rs.getString("id"));
				noiDung.setMaChiTietKHDT(rs.getString("MaChiTietKHDT"));
				noiDung.setKhoa(rs.getString("Khoa"));
				noiDung.setMaCongTac(rs.getString("MaCongTac"));
				noiDung.setNoiDungCongTac(rs.getString("NoiDungCongTac"));
				noiDung.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));	
				noiDung.setTinhTrangThucHien(rs.getString("TinhTrangThucHien"));
				noiDung.setBoSung(rs.getString("BoSung"));
				//phân công tác
				noiDung.setThu(rs.getString("Thu"));
				noiDung.setNgay(rs.getString("Ngay"));
				noiDung.setBuoi(rs.getString("Buoi"));
				noiDung.setGio(rs.getString("Gio"));
				noiDung.setPhut(rs.getString("Phut"));
				noiDung.setGhiChu(rs.getNString("GhiChu"));
				noiDung.setTinhTrangPhanCong(rs.getString("TinhTrangPhanCong"));
				//
				noiDung.setUser1(rs.getString("User1"));
				noiDung.setUser2(rs.getString("User2"));
				noiDung.setUser3(rs.getString("User3"));
				noiDung.setUser4(rs.getString("User4"));
				noiDung.setUser5(rs.getString("User5"));
				noiDung.setStatus("1");
				
				ArrayList<BoPhanThucHienKHDTModel> boPhanList = BoPhanThucHienDAO.timBoPhanThucHienByMaNoiDungKHDT(noiDung.getMaNoiDungChiTietKHDT());
				noiDung.setBoPhanThucHienKHDTModelList(boPhanList);
				list.add(noiDung);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	public static Boolean insertNoiDungChiTietKHDT(NoiDungChiTietKHDTModel noiDungChiTietKHDTModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertNoiDungChiTietKHDT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_chi_tiet_KHDT", noiDungChiTietKHDTModel.getMaChiTietKHDT());
			csmt.setString("Ma_cong_tac", noiDungChiTietKHDTModel.getMaCongTac());
			csmt.setString("Noi_dung_cong_tac", noiDungChiTietKHDTModel.getNoiDungCongTac());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);
			csmt.setString("Khoa", noiDungChiTietKHDTModel.getKhoa());
			csmt.setString("Tinh_trang_thuc_hien", "0");
			csmt.setString("Bo_sung", noiDungChiTietKHDTModel.getBoSung());
			// phân công tác
			csmt.setString("Thu", null);
			csmt.setString("Ngay", null);
			csmt.setString("Buoi", null);
			csmt.setString("Gio", null);
			csmt.setString("Phut", null);
			csmt.setString("Ghi_chu", null);
			csmt.setString("Tinh_trang_phan_cong", "0");
			//
			csmt.setString("User1", noiDungChiTietKHDTModel.getUser1());
			csmt.setString("User2", noiDungChiTietKHDTModel.getUser2());
			csmt.setString("User3", noiDungChiTietKHDTModel.getUser3());
			csmt.setString("User4", noiDungChiTietKHDTModel.getUser4());
			csmt.setString("User5", noiDungChiTietKHDTModel.getUser5());
			
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) {
				String id = csmt.getString("ID");
				noiDungChiTietKHDTModel.setMaNoiDungChiTietKHDT(id);
				noiDungChiTietKHDTModel.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				ArrayList<BoPhanThucHienKHDTModel> boPhanThucHienKHDTModelList = noiDungChiTietKHDTModel.getBoPhanThucHienKHDTModelList();
				ArrayList<BoPhanThucHienKHDTModel> boPhanThucHienKHDTModelListAfterAdded = new ArrayList<BoPhanThucHienKHDTModel>();
				if(boPhanThucHienKHDTModelList != null) {
					for (BoPhanThucHienKHDTModel obj : boPhanThucHienKHDTModelList) {	
						obj.setMaNoiDungChiTietKHDT(id);
						if (obj.getMaBoPhanThucHienKHDT() != null) { // Cap nhat "BO PHAN THC HIEN CHI TIET KE HOACH DAO TAO" da ton tai
							BoPhanThucHienDAO.updateBoPhanThucHienKHDT(obj);
						} else { // Them moi "BO PHAN THC HIEN CHI TIET KE HOACH DAO TAO"
							BoPhanThucHienDAO.insertBoPhanThucHienKHDT(obj);
						}
						
						boPhanThucHienKHDTModelListAfterAdded.add(obj);
					}
				}
				noiDungChiTietKHDTModel.setBoPhanThucHienKHDTModelList(boPhanThucHienKHDTModelListAfterAdded);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}

	public static Boolean updateNoiDungChiTietKHDT(NoiDungChiTietKHDTModel noiDungChiTietKHDTModel) {
		Boolean result = false;	
		String[] thoiGian;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateNoiDungChiTietKHDT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", noiDungChiTietKHDTModel.getMaNoiDungChiTietKHDT());
			csmt.setString("Ma_cong_tac", noiDungChiTietKHDTModel.getMaCongTac());
			csmt.setString("Noi_dung_cong_tac", noiDungChiTietKHDTModel.getNoiDungCongTac());
			csmt.setString("Ma_chi_tiet_KHDT", noiDungChiTietKHDTModel.getMaChiTietKHDT());
			csmt.setString("Khoa", noiDungChiTietKHDTModel.getKhoa());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);
			csmt.setString("Tinh_trang_thuc_hien", "0");
			csmt.setString("Bo_sung", noiDungChiTietKHDTModel.getBoSung());
			if(noiDungChiTietKHDTModel.getThoiGian() != null && !noiDungChiTietKHDTModel.getThoiGian().equals("null")) {
				thoiGian = noiDungChiTietKHDTModel.getThoiGian().split("<-reg->");
				csmt.setString("Thu", thoiGian[4]);
				csmt.setString("Ngay", thoiGian[5]);
				csmt.setString("Buoi", thoiGian[3]);
				csmt.setString("Gio", thoiGian[1]);
				csmt.setString("Phut", thoiGian[2]);
				csmt.setString("Tinh_trang_phan_cong", "1");
				if(thoiGian[0].equals("<+na+>"))
					csmt.setString("Ghi_chu", null);
				else {
					thoiGian[0] = thoiGian[0].substring(6).replaceAll("<-XUONGHANG->", "\r\n");
					thoiGian[0] = thoiGian[0].replaceAll("-DAUNHAY-", "'");
					thoiGian[0] = thoiGian[0].replaceAll("-DAUNHAY1-", "\"");
					csmt.setNString("Ghi_chu", StringUtil.toUTF8(thoiGian[0]));
				}
			} else {
				csmt.setString("Thu", null);
				csmt.setString("Ngay", null);
				csmt.setString("Buoi", null);
				csmt.setString("Gio", null);
				csmt.setString("Phut", null);
				csmt.setString("Ghi_chu", null);
				csmt.setString("Tinh_trang_phan_cong", "0");
			}
			csmt.setString("User1", noiDungChiTietKHDTModel.getUser1());
			csmt.setString("User2", noiDungChiTietKHDTModel.getUser2());
			csmt.setString("User3", noiDungChiTietKHDTModel.getUser3());
			csmt.setString("User4", noiDungChiTietKHDTModel.getUser4());
			csmt.setString("User5", noiDungChiTietKHDTModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) {
				noiDungChiTietKHDTModel.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				ArrayList<BoPhanThucHienKHDTModel> boPhanThucHienKHDTModelList = noiDungChiTietKHDTModel.getBoPhanThucHienKHDTModelList();
				ArrayList<BoPhanThucHienKHDTModel> boPhanThucHienKHDTModelListAfterUpdated = new ArrayList<BoPhanThucHienKHDTModel>();
				if(boPhanThucHienKHDTModelList != null) {
					for (BoPhanThucHienKHDTModel obj : boPhanThucHienKHDTModelList) {	
						obj.setMaNoiDungChiTietKHDT(noiDungChiTietKHDTModel.getMaNoiDungChiTietKHDT());
						if (obj.getMaBoPhanThucHienKHDT() != null) { // Cap nhat "BO PHAN THC HIEN CHI TIET KE HOACH DAO TAO" da ton tai
							BoPhanThucHienDAO.updateBoPhanThucHienKHDT(obj);
						} else { // Them moi "BO PHAN THC HIEN CHI TIET KE HOACH DAO TAO"
							BoPhanThucHienDAO.insertBoPhanThucHienKHDT(obj);
						}
						
						boPhanThucHienKHDTModelListAfterUpdated.add(obj);
					}
				}
				noiDungChiTietKHDTModel.setBoPhanThucHienKHDTModelList(boPhanThucHienKHDTModelListAfterUpdated);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}			
								
		return result;
	}
	public static Boolean deleteNoiDungChiTietKHDT(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteNoiDungChiTietKHDT(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}				
		return result;
	}

	//Phan cong tac
	public static Boolean phanCongNoiDungChiTietKHDT(NoiDungChiTietKHDTModel noiDungChiTietKHDTModel, String tuNgay) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_PhanCongNoiDungChiTietKHDT(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", noiDungChiTietKHDTModel.getMaNoiDungChiTietKHDT());
			csmt.setString("Gio", noiDungChiTietKHDTModel.getGio());
			csmt.setString("Phut", noiDungChiTietKHDTModel.getPhut());
			csmt.setString("Buoi", noiDungChiTietKHDTModel.getBuoi());
			csmt.setString("Thu", noiDungChiTietKHDTModel.getThu());
			csmt.setString("Ngay", null);
			csmt.setNString("Ghi_chu", noiDungChiTietKHDTModel.getGhiChu());
			csmt.setString("Tinh_trang_phan_cong", noiDungChiTietKHDTModel.getTinhTrangPhanCong());
			csmt.setString("User1", noiDungChiTietKHDTModel.getUser1());
			csmt.setString("User2", noiDungChiTietKHDTModel.getUser2());
			csmt.setString("User3", noiDungChiTietKHDTModel.getUser3());
			csmt.setString("User4", noiDungChiTietKHDTModel.getUser4());
			csmt.setString("User5", noiDungChiTietKHDTModel.getUser5());
			csmt.setString("Tu_ngay", DateUtil.setDate(tuNgay));
			
			result = DataUtil.executeNonStore(csmt);
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}			
								
		return result;
	}
	
	public static ArrayList<NoiDungChiTietKHDTModel> getNoiDungPhanCongByMaChiTietKHDT(String maChiTietKHDT) {
		ArrayList<NoiDungChiTietKHDTModel> list = new ArrayList<NoiDungChiTietKHDTModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getNoiDungPhanCongByMaChiTietKHDT"));
			preparedStatement.setString(1, maChiTietKHDT);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				NoiDungChiTietKHDTModel noiDung = new NoiDungChiTietKHDTModel();
				
				noiDung.setMaNoiDungChiTietKHDT(rs.getString("id"));
				noiDung.setMaChiTietKHDT(rs.getString("MaChiTietKHDT"));
				noiDung.setKhoa(rs.getString("Khoa"));
				noiDung.setMaCongTac(rs.getString("MaCongTac"));
				noiDung.setNoiDungCongTac(rs.getString("NoiDungCongTac"));
				noiDung.setBoSung(rs.getString("BoSung"));
				//phân công tác
				noiDung.setThu(rs.getString("Thu"));
				noiDung.setNgay(DateUtil.setDate(rs.getString("Ngay")));
				noiDung.setBuoi(rs.getString("Buoi"));
				noiDung.setGio(rs.getString("Gio"));
				noiDung.setPhut(rs.getString("Phut"));
				noiDung.setGhiChu(rs.getNString("GhiChu"));
				noiDung.setTinhTrangPhanCong(rs.getString("TinhTrangPhanCong"));
				//
				noiDung.setUser1(rs.getString("User1"));
				noiDung.setUser2(rs.getString("User2"));
				noiDung.setUser3(rs.getString("User3"));
				noiDung.setUser4(rs.getString("User4"));
				noiDung.setUser5(rs.getString("User5"));
	
				list.add(noiDung);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	
}
