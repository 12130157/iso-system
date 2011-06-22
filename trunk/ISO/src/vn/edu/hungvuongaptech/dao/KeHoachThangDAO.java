package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.ChuongTrinhDaoTaoModel;
import vn.edu.hungvuongaptech.model.CongTacThangModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.model.KeHoachThangModel;
import vn.edu.hungvuongaptech.model.NguoiThucHienModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.TinhTrangCongTacModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.LogUtil;

public class KeHoachThangDAO {
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	public static boolean insertKeHoachThang(KeHoachThangModel keHoachThang) {
		boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertKeHoachThang(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setString("Thang", keHoachThang.getThang());
			csmt.setString("Ma_nguoi_tao", keHoachThang.getMaNguoiTao());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("Ngay_tao", null);
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Ma_nguoi_duyet", keHoachThang.getMaNguoiDuyet());
			csmt.setString("Nam", keHoachThang.getNam());
			csmt.setNString("Noi_nhan", keHoachThang.getNoiNhan());
			csmt.setString("Tinh_trang", keHoachThang.getTinhTrang());
			csmt.registerOutParameter("Ten_ke_hoach_thang", java.sql.Types.NVARCHAR);
			csmt.setNString("Ly_do_reject", keHoachThang.getLyDoReject());
			csmt.setString("Ngay_gui", null);
			csmt.setString("User1", keHoachThang.getUser1());
			csmt.setString("User2", keHoachThang.getUser2());
			csmt.setString("User3", keHoachThang.getUser3());
			csmt.setString("User4", keHoachThang.getUser4());
			csmt.setString("User5", keHoachThang.getUser5());
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				keHoachThang.setMaKeHoachThang(csmt.getString("ID"));
				keHoachThang.setTenKeHoach(csmt.getNString("Ten_ke_hoach_thang"));
			}
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return result;
	}
	public static boolean updateKeHoachThang(KeHoachThangModel keHoachThang) {
		boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateKeHoachThang(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", keHoachThang.getMaKeHoachThang());
			csmt.setString("Thang", keHoachThang.getThang());
			csmt.setString("Ma_nguoi_tao", keHoachThang.getMaNguoiTao());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("Ngay_tao", null);
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Ma_nguoi_duyet", keHoachThang.getMaNguoiDuyet());
			csmt.setString("Nam", keHoachThang.getThang());
			csmt.setNString("Noi_nhan", keHoachThang.getNoiNhan());
			csmt.setString("Tinh_trang", keHoachThang.getTinhTrang());
			csmt.setNString("Ten_ke_hoach_thang", keHoachThang.getTenKeHoach());
			csmt.setNString("Ly_do_reject", null);
			if(keHoachThang.getNgayGui().equals(""))
				csmt.setString("Ngay_gui", null);
			else
				csmt.setString("Ngay_gui", DateUtil.setDate(keHoachThang.getNgayGui()) + " " + keHoachThang.getGioGui());
			csmt.setString("User1", keHoachThang.getUser1());
			csmt.setString("User2", keHoachThang.getUser2());
			csmt.setString("User3", keHoachThang.getUser3());
			csmt.setString("User4", keHoachThang.getUser4());
			csmt.setString("User5", keHoachThang.getUser5());
			boolean ketQua = DataUtil.executeNonStore(csmt);
			if(ketQua) {
				ArrayList<CongTacThangModel> congTacThangList = new ArrayList<CongTacThangModel>();
				ArrayList<CongTacThangModel> congTacThangListOld = keHoachThang.getCongTacThangList();
				for (CongTacThangModel obj : congTacThangListOld) {
					if(obj.getMaCongTacThang() != null)
						CongTacThangDAO.updateCongTacThang(obj);
					else {
						obj.setMaKeHoachThang(keHoachThang.getMaKeHoachThang());
						CongTacThangDAO.insertCongTacThang(obj);
					}
					congTacThangList.add(obj);
				}
				keHoachThang.setCongTacThangList(congTacThangList);
				result = true;
			}
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return result;
	}
	public static KeHoachThangModel getKeHoachThangByID(String id){
		KeHoachThangModel keHoachThang = new KeHoachThangModel();
		String maKeHoachThang = "na", maCongTacThang = "na";
		ArrayList<CongTacThangModel> congTacThangList = new ArrayList<CongTacThangModel>();
		ArrayList<TinhTrangCongTacModel> tinhTrangCongTacList = new ArrayList<TinhTrangCongTacModel>();
		//int count = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getKeHoachThangByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				if(!rs.getString("MaKeHoachThang").equals(maKeHoachThang)) {
					keHoachThang.setMaKeHoachThang(rs.getString("MaKeHoachThang"));
					keHoachThang.setThang(rs.getString("Thang"));
					keHoachThang.setNam(rs.getString("Nam"));
					keHoachThang.setMaNguoiTao(rs.getString("MaNguoiTao"));
					keHoachThang.setNgayTao(DateUtil.setDate(rs.getString("NgayTao")));
					keHoachThang.setGioTao(rs.getString("GioTao"));
					keHoachThang.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
					keHoachThang.setNgayDuyet(DateUtil.setDate(rs.getString("NgayDuyet")));
					keHoachThang.setGioDuyet(rs.getString("GioDuyet"));
					keHoachThang.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
					keHoachThang.setGioCapNhatCuoi(rs.getString("GioCapNhatCuoi"));
					keHoachThang.setNoiNhan(rs.getString("NoiNhan"));
					keHoachThang.setTenNguoiTao(rs.getString("TenNguoiTao"));
					keHoachThang.setTenNguoiDuyet(rs.getString("TenNguoiDuyet"));
					keHoachThang.setTinhTrang(rs.getString("TinhTrang"));
					keHoachThang.setTenKeHoach(rs.getNString("TenKeHoachThang"));
					/*keHoachThang.setUser1(rs.getString("User1"));
					keHoachThang.setUser2(rs.getString("User2"));
					keHoachThang.setUser3(rs.getString("User3"));
					keHoachThang.setUser4(rs.getString("User4"));
					keHoachThang.setUser5(rs.getString("User5"));*/
					keHoachThang.setCongTacThangList(congTacThangList);
					maKeHoachThang = keHoachThang.getMaKeHoachThang();
				}
				if(rs.getString("MaCongTacThang") != null) {
					if(!maCongTacThang.equals(rs.getString("MaCongTacThang"))) {
						CongTacThangModel congTacThang = new CongTacThangModel();
						congTacThang.setMaKeHoachThang(rs.getString("MaKeHoachThang"));
						congTacThang.setMaCongTacThang(rs.getString("MaCongTacThang"));
						congTacThang.setMaCongTac(rs.getString("MaCongTac"));
						congTacThang.setNoiDungCongTac(rs.getString("NoiDungCongTac"));
						congTacThang.setBoPhanThucHien(rs.getString("BoPhanThucHien"));
						congTacThang.setGhiChu(rs.getString("GhiChu"));
						/*congTacThang.setUser1(rs.getString("User1"));
						congTacThang.setUser2(rs.getString("User2"));
						congTacThang.setUser3(rs.getString("User3"));
						congTacThang.setUser4(rs.getString("User4"));
						congTacThang.setUser5(rs.getString("User5"));*/
						tinhTrangCongTacList = new ArrayList<TinhTrangCongTacModel>();
						congTacThang.setTinhTrangCongTacList(tinhTrangCongTacList);
						
						congTacThangList.add(congTacThang);
					}
				}
				if(rs.getString("MaTinhTrangCongTac") != null) {
						//if(!rs.getString("BoSungTableNoiDungKHDT").equals("1")) {
							TinhTrangCongTacModel tinhTrangCongTac = new TinhTrangCongTacModel();
							tinhTrangCongTac.setMaCongTacThang(rs.getString("MaCongTacThang"));
							tinhTrangCongTac.setMaTinhTrangCongTac(rs.getString("MaTinhTrangCongTac"));
							tinhTrangCongTac.setThuTuTuan(rs.getString("ThuTuTuan"));
							/*tinhTrangCongTac.setUser1(rs.getString("User1"));
							tinhTrangCongTac.setUser2(rs.getString("User2"));
							tinhTrangCongTac.setUser3(rs.getString("User3"));
							tinhTrangCongTac.setUser4(rs.getString("User4"));
							tinhTrangCongTac.setUser5(rs.getString("User5"));
							if(rs.getString("ThoiGian") != null) {
								noiDung.setThoiGian(rs.getString("ThoiGian").replaceAll("\r\n", "<-XUONGDONG->"));
								noiDung.setThoiGian(noiDung.getThoiGian().replaceAll("'", "-DAUNHAY-"));
								noiDung.setThoiGian(noiDung.getThoiGian().replaceAll("\"", "-DAUNHAY1-"));
							} else
								noiDung.setThoiGian(null);*/
							tinhTrangCongTacList.add(tinhTrangCongTac);
					//	}
					
				}
				
				if(rs.getString("MaCongTacThang") != null)
					maCongTacThang = rs.getString("MaCongTacThang");
				else
					maCongTacThang = "na";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return keHoachThang;
	}
	public static int duyetKeHoachThang(String maNguoiDuyet, String maKeHoachThang, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.duyetKeHoachThangByMaKeHoach"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maKeHoachThang);
			result = preparedStatement.executeUpdate();
			return result;
		}catch(Exception e){e.printStackTrace();}
		return result;
	}	
	public static int getCountKeHoachThang(String tinhtrang, String maBoPhan) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountKeHoachThang(?,?,?)}");
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_PHC", Constant.BO_PHAN_PHC);
			//csmt.registerOutParameter("Count", java.sql.Types.INTEGER);
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public static ArrayList<KeHoachThangModel> getKeHoachThang(int totalRows, String currenPage, String tinhTrang, String maBoPhan) {
		ArrayList<KeHoachThangModel> keHoachThangList = new ArrayList<KeHoachThangModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetKeHoachThang(?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_PHC", Constant.BO_PHAN_PHC);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				KeHoachThangModel keHoachThang = new KeHoachThangModel();
				keHoachThang.setMaKeHoachThang(rs.getString("MaKeHoachThang"));
				keHoachThang.setTenKeHoach(rs.getString("TenKeHoachThang"));
				keHoachThang.setTenNguoiTao(rs.getString("TenNguoiTao"));
				keHoachThang.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				keHoachThang.setTinhTrang(rs.getString("TinhTrang"));
				keHoachThang.setLyDoReject(rs.getString("LyDoReject"));
				keHoachThangList.add(keHoachThang);
			}
			Constant.CHECK_ROWS = keHoachThangList.size();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return keHoachThangList;
	}
	public static KeHoachThangModel getKeHoachThangSimpleByID(String id){ // chỉ lấy trong bảng KeHoachThang
		KeHoachThangModel keHoachThang = new KeHoachThangModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getKeHoachThangSimpleByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				keHoachThang.setMaKeHoachThang(rs.getString("MaKeHoachThang"));
				keHoachThang.setTenKeHoach(rs.getString("TenKeHoachThang"));
				keHoachThang.setTenNguoiTao(rs.getString("TenNguoiTao"));
				keHoachThang.setTenNguoiDuyet(rs.getString("TenNguoiDuyet"));
				keHoachThang.setNgayGui(rs.getString("NgayGui"));
				keHoachThang.setGioGui(rs.getString("GioGui"));
				keHoachThang.setNgayDuyet(rs.getString("NgayDuyet"));
				keHoachThang.setGioDuyet(rs.getString("GioDuyet"));
				
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			LogUtil.logError(ex, logger);
		}
		return keHoachThang;
	}
	public static Boolean checkNamVaThangOfKeHoachThang(String nam, String thang) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_FindKeHoachThangByYearAndMonth(?,?,?)}");
			csmt.setString("Nam", nam);
			csmt.setString("Thang", thang);
			csmt.registerOutParameter("result", java.sql.Types.VARCHAR);
			if (DataUtil.executeNonStore(csmt)) {
				String kq = csmt.getString("result");
				if (kq.equals("0")) {
					result = false;
				}
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
