/**
 * 
 */
package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLData;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import sun.tools.jar.resources.jar;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.model.NguoiThucHienModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.LogUtil;

/**
 * @author ThienVD
 *
 */
public class ChiTietKHDTDAO {
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	public static ArrayList<ChiTietKHDTModel> timChiTietKHDT(String maKeHoach) {
		ArrayList<ChiTietKHDTModel> list = new ArrayList<ChiTietKHDTModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getChiTietKHDTByMaKeHoach"));
			preparedStatement.setString(1, maKeHoach);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietKHDTModel chiTietKHDTModel = new ChiTietKHDTModel();
				
				chiTietKHDTModel.setId(rs.getString("id"));
				chiTietKHDTModel.setMaKeHoach(rs.getString("MaKeHoach"));
				chiTietKHDTModel.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
				chiTietKHDTModel.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));
				chiTietKHDTModel.setTuan(rs.getString("Tuan"));
				chiTietKHDTModel.setMaNamHoc(rs.getString("MaNamHoc"));
				chiTietKHDTModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));				
				chiTietKHDTModel.setUser1(rs.getString("User1"));
				chiTietKHDTModel.setUser2(rs.getString("User2"));
				chiTietKHDTModel.setUser3(rs.getString("User3"));
				chiTietKHDTModel.setUser4(rs.getString("User4"));
				chiTietKHDTModel.setUser5(rs.getString("User5"));
				chiTietKHDTModel.setThuTuTuan(rs.getString("ThuTuTuan"));
				
				ArrayList<NoiDungChiTietKHDTModel> noiDungList = NoiDungChiTietKHDTDAO.timNoiDungKHDTByMaChiTietKHDT(chiTietKHDTModel.getId());
				chiTietKHDTModel.setNoiDungChiTietKHDTModelList(noiDungList);
				list.add(chiTietKHDTModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
		}
		return list;
	}	

	public static Boolean insertChiTietKHDT(ChiTietKHDTModel chiTietKHDTModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertChiTietKHDT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_ke_hoach", chiTietKHDTModel.getMaKeHoach());
			csmt.setString("Tu_ngay", DateUtil.setDate(chiTietKHDTModel.getTuNgay()));
			csmt.setString("Den_ngay", DateUtil.setDate(chiTietKHDTModel.getDenNgay()));
			csmt.setString("Ma_nam_hoc", chiTietKHDTModel.getMaNamHoc());
			csmt.setString("Tuan", chiTietKHDTModel.getTuan());
			csmt.setString("Delay_days", Constant.DELAY_DAYS + "");
			csmt.setString("Tinh_trang_phan_cong_tac", "0");
			csmt.setString("Ngay_cap_nhat_cuoi", null);	
			csmt.setNString("Ghi_chu", null);
			csmt.setString("User1", "-1");
			csmt.setString("User2", chiTietKHDTModel.getUser2());
			csmt.setString("User3", chiTietKHDTModel.getUser3());
			csmt.setString("User4", chiTietKHDTModel.getUser4());
			csmt.setString("User5", chiTietKHDTModel.getUser5());
			
			Boolean ketqua = DataUtil.executeNonStore(csmt);
			if (ketqua) {
				String id = csmt.getString("ID");
				chiTietKHDTModel.setId(id);
				ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietKHDTList = chiTietKHDTModel.getNoiDungChiTietKHDTModelList();
				ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietKHDTListAfterAdded = new ArrayList<NoiDungChiTietKHDTModel>();
				if(noiDungChiTietKHDTList != null) {
					for (NoiDungChiTietKHDTModel obj : noiDungChiTietKHDTList) {
						obj.setMaChiTietKHDT(id);
						if (obj.getMaNoiDungChiTietKHDT() != null) { // Cap nhat "Noi Dung chi tiet KE HOACH DAO TAO" da ton tai
							NoiDungChiTietKHDTDAO.updateNoiDungChiTietKHDT(obj);
						} else { // Them moi " noi dung CHI TIET KE HOACH DAO TAO"
							NoiDungChiTietKHDTDAO.insertNoiDungChiTietKHDT(obj);
						}
						noiDungChiTietKHDTListAfterAdded.add(obj);
					}
				}
				chiTietKHDTModel.setNoiDungChiTietKHDTModelList(noiDungChiTietKHDTListAfterAdded);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
			LogUtil.logError(e, logger);
		}
						
		return result;
	}

	public static Boolean updateChiTietKHDT(ChiTietKHDTModel chiTietKHDTModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateChiTietKHDT(?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", chiTietKHDTModel.getId());
			csmt.setString("Ma_ke_hoach", chiTietKHDTModel.getMaKeHoach());
			csmt.setString("Tu_ngay", DateUtil.setDate(chiTietKHDTModel.getTuNgay()));
			csmt.setString("Den_ngay", DateUtil.setDate(chiTietKHDTModel.getDenNgay()));
			csmt.setString("Tuan", chiTietKHDTModel.getTuan());
			csmt.setString("Ma_nam_hoc", chiTietKHDTModel.getMaNamHoc());
			csmt.setString("Tinh_trang_phan_cong_tac", chiTietKHDTModel.getTinhTrangPhanCongTac());
			csmt.setString("Ngay_cap_nhat_cuoi", null);	
			csmt.setString("User1", chiTietKHDTModel.getUser1());
			csmt.setString("User2", chiTietKHDTModel.getUser2());
			csmt.setString("User3", chiTietKHDTModel.getUser3());
			csmt.setString("User4", chiTietKHDTModel.getUser4());
			csmt.setString("User5", chiTietKHDTModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);	
			if (ketQua) {
				ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietKHDTList = chiTietKHDTModel.getNoiDungChiTietKHDTModelList();
				ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietKHDTListAfterUpdated = new ArrayList<NoiDungChiTietKHDTModel>();
				if(noiDungChiTietKHDTList != null) {
					for (NoiDungChiTietKHDTModel obj : noiDungChiTietKHDTList) {
						obj.setMaChiTietKHDT(chiTietKHDTModel.getId());
						if (obj.getMaNoiDungChiTietKHDT() != null) { // Cap nhat "Noi Dung chi tiet KE HOACH DAO TAO" da ton tai
							NoiDungChiTietKHDTDAO.updateNoiDungChiTietKHDT(obj);
						} else { // Them moi " noi dung CHI TIET KE HOACH DAO TAO"
							NoiDungChiTietKHDTDAO.insertNoiDungChiTietKHDT(obj);
						}
						noiDungChiTietKHDTListAfterUpdated.add(obj);
					}
				}
				chiTietKHDTModel.setNoiDungChiTietKHDTModelList(noiDungChiTietKHDTListAfterUpdated);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
			LogUtil.logError(e, logger);
		}
						
		return result;
	}
	
	public static Boolean deleteChiTietKHDT(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteChiTietKHDT(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
		}
						
		return result;
	}
	public static ChiTietKHDTModel timChiTietKHDTByID(String maChiTiet) {
		ChiTietKHDTModel chiTietKHDTModel = new ChiTietKHDTModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getChiTietKHDTByID"));
			preparedStatement.setString(1, maChiTiet);			
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				chiTietKHDTModel.setId(rs.getString("id"));
				chiTietKHDTModel.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
				chiTietKHDTModel.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));	
				chiTietKHDTModel.setGhiChu(rs.getNString("GhiChu"));
				chiTietKHDTModel.setTinhTrangPhanCongTac(rs.getString("TinhTrangPhanCongTac"));
				chiTietKHDTModel.setUser1(rs.getString("User1")); // lan bo sung
				chiTietKHDTModel.setUser2(rs.getString("User2"));
				chiTietKHDTModel.setUser3(rs.getString("User3"));
				chiTietKHDTModel.setUser4(rs.getString("User4"));
				chiTietKHDTModel.setUser5(rs.getString("User5"));
				
				ArrayList<NoiDungChiTietKHDTModel> noiDungList = NoiDungChiTietKHDTDAO.getNoiDungPhanCongByMaChiTietKHDT(maChiTiet);
				//String [] arrNgay = new String[7];
				//arrNgay = getAllNgayOfTuan(chiTietKHDTModel.getTuNgay());
				//chiTietKHDTModel.setArrNgay(arrNgay);
				chiTietKHDTModel.setNoiDungChiTietKHDTModelList(noiDungList);
			}
		}catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return chiTietKHDTModel;
	}
	public static boolean updateGhiChuChiTietKHDT(ChiTietKHDTModel chiTietKHDT) {
		boolean result = true;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateGhiChuChiTietKHDT(?,?,?)}");		
			csmt.setString("ID", chiTietKHDT.getId());
			csmt.setNString("Ghi_chu", chiTietKHDT.getGhiChu());
			csmt.setString("Tinh_trang_phan_cong_tac", chiTietKHDT.getTinhTrangPhanCongTac());
			boolean ketQua = DataUtil.executeNonStore(csmt);	
			if(ketQua) {
				ArrayList<NoiDungChiTietKHDTModel> noiDungList = new ArrayList<NoiDungChiTietKHDTModel>();
				for(NoiDungChiTietKHDTModel obj : chiTietKHDT.getNoiDungChiTietKHDTModelList()) {
					NoiDungChiTietKHDTDAO.phanCongNoiDungChiTietKHDT(obj, chiTietKHDT.getTuNgay());
					noiDungList.add(obj);
				}
				chiTietKHDT.setNoiDungChiTietKHDTModelList(noiDungList);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
			LogUtil.logError(e, logger);
		}
		return result;
	}
	public static boolean getTuanChiTietKHDT(ChiTietKHDTModel chiTietKHDT, String ngayBatDau, String ngayKetThuc, String kieuThemDong) {
		boolean result = true;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetTuanChiTietKHDT(?,?,?,?,?,?,?,?)}");
			csmt.setString("Ngay_bat_dau", DateUtil.setDate(ngayBatDau));
			csmt.setString("Ngay_Ket_thuc", DateUtil.setDate(ngayKetThuc));
			csmt.registerOutParameter("Ngay_bat_dau_tuan_moi", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ngay_ket_thuc_tuan_moi", java.sql.Types.VARCHAR);
			csmt.setNString("Kieu_them_dong", kieuThemDong);
			csmt.registerOutParameter("Ma_nam", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ma_tuan_le", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Thu_tu_tuan", java.sql.Types.VARCHAR);
			boolean ketQua = DataUtil.executeNonStore(csmt);	
			if(ketQua) {
				chiTietKHDT.setMaNamHoc(csmt.getString("Ma_nam"));
				chiTietKHDT.setTuan(csmt.getString("Ma_tuan_le"));
				chiTietKHDT.setTuNgay(csmt.getString("Ngay_bat_dau_tuan_moi"));
				chiTietKHDT.setDenNgay(csmt.getString("Ngay_ket_thuc_tuan_moi"));
				chiTietKHDT.setThuTuTuan(csmt.getString("Thu_tu_tuan"));
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
			LogUtil.logError(e, logger);
		}
		return result;
	}
	public static String[] getAllNgayOfTuan(String tuNgay) {
		String [] arrNgay = new String[7];
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetAllNgayOfTuan(?)}");		
			csmt.setString("Tu_ngay", tuNgay);
			ResultSet rs = DataUtil.executeStore(csmt);	
			if(rs.next()) {
				arrNgay[0] = "Thứ hai " + rs.getString("1");
				arrNgay[1] = "Thứ ba " + rs.getString("2");
				arrNgay[2] = "Thứ tư " + rs.getString("3");
				arrNgay[0] = "Thứ năm " + rs.getString("4");
				arrNgay[0] = "Thứ sáu " + rs.getString("5");
				arrNgay[0] = "Thứ bảy " + rs.getString("6");
				arrNgay[0] = "Chủ nhật " + rs.getString("7");
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
		}
		return arrNgay;
	}
	
	
	public static ChiTietKHDTModel getChiTietJoinAllTableByMaKHDTAndNgay(String maKeHoach, String kieuTuan, String namBatDau){
		ChiTietKHDTModel chiTiet = new ChiTietKHDTModel();
		String maBoPhan = "na", maCongTac = "na", maChiTiet = "na";
		ArrayList<NguoiThucHienModel> listNguoiThucHien = new ArrayList<NguoiThucHienModel>();
		ArrayList<BoPhanThucHienKHDTModel> boPhanList = new ArrayList<BoPhanThucHienKHDTModel>();
		ArrayList<NoiDungChiTietKHDTModel> noiDungList = new ArrayList<NoiDungChiTietKHDTModel>();
		//int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetChiTietJoinAllTableByMaKHDTAndNgay(?,?,?)}");
			csmt.setString("Ma_ke_hoach", maKeHoach);
			csmt.setString("Nam_bat_dau", namBatDau);
			csmt.setString("Kieu_tuan", kieuTuan);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next()) {
					if(maChiTiet.equals("na")) {
						chiTiet.setId(rs.getString("MaChiTietKHDT"));
						chiTiet.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
						chiTiet.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));
						chiTiet.setMaNamHoc(rs.getString("MaNamHoc"));
						chiTiet.setTuan(rs.getString("Tuan"));
						chiTiet.setThuTuTuan(rs.getString("ThuTuTuan"));
						chiTiet.setTinhTrangPhanCongTac(rs.getString("TinhTrangPhanCongTableChiTietKHDT"));
						/*chiTiet.setUser1(rs.getString("User1TableChiTietKHDT"));
						chiTiet.setUser2(rs.getString("User2TableChiTietKHDT"));
						chiTiet.setUser3(rs.getString("User3TableChiTietKHDT"));
						chiTiet.setUser4(rs.getString("User4TableChiTietKHDT"));
						chiTiet.setUser5(rs.getString("User5TableChiTietKHDT"));*/
						noiDungList = new ArrayList<NoiDungChiTietKHDTModel>();
						chiTiet.setNoiDungChiTietKHDTModelList(noiDungList);
						maChiTiet = "";
					}
				
				if(rs.getString("MaNoiDungChiTietKHDT") != null) {
					if(!maCongTac.equals(rs.getString("MaNoiDungChiTietKHDT"))) {
						NoiDungChiTietKHDTModel noiDung = new NoiDungChiTietKHDTModel();
						noiDung.setMaNoiDungChiTietKHDT(rs.getString("MaNoiDungChiTietKHDT"));
						noiDung.setMaCongTac(rs.getString("MaCongTac"));
						noiDung.setKhoa(rs.getString("Khoa"));
						noiDung.setNoiDungCongTac(rs.getString("NoiDungCongTac"));
						noiDung.setTinhTrangThucHien(rs.getString("TinhTrangThucHienTableNoiDungKHDT"));
						noiDung.setBoSung(rs.getString("BoSungTableNoiDungKHDT"));
						if(rs.getString("ThoiGian") != null) {
							noiDung.setThoiGian(rs.getNString("ThoiGian").replaceAll("\r\n", "<-XUONGHANG->"));
							noiDung.setThoiGian(noiDung.getThoiGian().replaceAll("'", "-DAUNHAY-"));
							noiDung.setThoiGian(noiDung.getThoiGian().replaceAll("\"", "-DAUNHAY1-"));
						} else
							noiDung.setThoiGian(null);
						/*noiDung.setUser1(rs.getString("User1TableNoiDungKHDT"));
						noiDung.setUser2(rs.getString("User2TableNoiDungKHDT"));
						noiDung.setUser3(rs.getString("User3TableNoiDungKHDT"));
						noiDung.setUser4(rs.getString("User4TableNoiDungKHDT"));
						noiDung.setUser5(rs.getString("User5TableNoiDungKHDT"));*/
						noiDung.setStatus("1");
						boPhanList = new ArrayList<BoPhanThucHienKHDTModel>();
						noiDung.setBoPhanThucHienKHDTModelList(boPhanList);
						noiDungList.add(noiDung);
					}
				}
				if(rs.getString("MaBoPhanThucHien") != null) {
					if(!maBoPhan.equals(rs.getString("MaBoPhanThucHien")) || !maCongTac.equals(rs.getString("MaNoiDungChiTietKHDT"))) {
						BoPhanThucHienKHDTModel boPhan = new BoPhanThucHienKHDTModel();
						boPhan.setMaBoPhanThucHienKHDT(rs.getString("MaBoPhanThuchien"));
						boPhan.setMaKhoa(rs.getString("MaKhoa"));
						boPhan.setTenBoPhan(rs.getString("TenBoPhan"));
						/*boPhan.setUser1(rs.getString("User1TableBoPhanKHDT"));
						boPhan.setUser2(rs.getString("User2TableBoPhanKHDT"));
						boPhan.setUser3(rs.getString("User3TableBoPhanKHDT"));
						boPhan.setUser4(rs.getString("User4TableBoPhanKHDT"));
						boPhan.setUser5(rs.getString("User5TableBoPhanKHDT"));*/
						boPhan.setStatus("1");
						listNguoiThucHien = new ArrayList<NguoiThucHienModel>();
						boPhan.setNguoiThucHienModelList(listNguoiThucHien);
						boPhanList.add(boPhan);
					}
				}
				if(rs.getString("MaNguoiThucHien") != null)	 {
					NguoiThucHienModel nguoiThucHien = new NguoiThucHienModel();
					
					nguoiThucHien.setMaNguoiThucHien(rs.getString("MaNguoiThucHien"));
					nguoiThucHien.setMaThanhVien(rs.getString("MaThanhVien"));
					nguoiThucHien.setTenThanhVien(rs.getString("TenThanhVien"));
					nguoiThucHien.setTinhTrangThucHien(rs.getString("TinhTrangThucHienTableNguoiThucHien"));
					/*nguoiThucHien.setUser1(rs.getString("User1TableNguoiThucHienKHDT"));
					nguoiThucHien.setUser2(rs.getString("User2TableNguoiThucHienKHDT"));
					nguoiThucHien.setUser3(rs.getString("User3TableNguoiThucHienKHDT"));
					nguoiThucHien.setUser4(rs.getString("User4TableNguoiThucHienKHDT"));
					nguoiThucHien.setUser5(rs.getString("User5TableNguoiThucHienKHDT"));*/
					nguoiThucHien.setStatus("1");
					listNguoiThucHien.add(nguoiThucHien);
				}
				if(rs.getString("MaNoiDungChiTietKHDT") != null)
					maCongTac = rs.getString("MaNoiDungChiTietKHDT");
				else
					maCongTac = "na";
				if(rs.getString("MaBoPhanThuchien") != null)
					maBoPhan = rs.getString("MaBoPhanThuchien");
				else
					maBoPhan = "na";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
		}
		
		return chiTiet;
		
	}
}
