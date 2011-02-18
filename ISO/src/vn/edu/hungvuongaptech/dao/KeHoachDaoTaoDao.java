package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BoPhanThucHienKHDTModel;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.model.KeHoachGiangDayModel;
import vn.edu.hungvuongaptech.model.NguoiThucHienModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class KeHoachDaoTaoDao {
	
	
	public static KeHoachDaoTaoModel getKeHoachDaoTaoByID(String id){
		KeHoachDaoTaoModel keHoachDaoTaoModel = new KeHoachDaoTaoModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getKeHoachDaoTaoByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				keHoachDaoTaoModel.setMaKeHoachDaoTao(rs.getString("MaKeHoachDaoTao"));
				keHoachDaoTaoModel.setTenKeHoachDaoTao(rs.getString("TenKeHoachDaoTao"));
				keHoachDaoTaoModel.setNam1(rs.getString("Nam1"));
				keHoachDaoTaoModel.setNam2(rs.getString("Nam2"));
				keHoachDaoTaoModel.setNam3(rs.getString("Nam3"));
				keHoachDaoTaoModel.setNam4(rs.getString("Nam4"));
				keHoachDaoTaoModel.setNam5(rs.getString("Nam5"));
				keHoachDaoTaoModel.setNam6(rs.getString("Nam6"));
				keHoachDaoTaoModel.setNhiemVu1(rs.getString("NhiemVu1"));
				keHoachDaoTaoModel.setNhiemVu2(rs.getString("NhiemVu2"));
				keHoachDaoTaoModel.setNhiemVu3(rs.getString("NhiemVu3"));
				keHoachDaoTaoModel.setNhiemVu4(rs.getString("NhiemVu4"));
				keHoachDaoTaoModel.setMaNguoiLap(rs.getString("MaNguoiLap"));
				keHoachDaoTaoModel.setNgayLap(DateUtil.setDate(rs.getString("NgayLap")));
				keHoachDaoTaoModel.setGioLap(rs.getString("GioLap"));
				keHoachDaoTaoModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				keHoachDaoTaoModel.setNgayDuyet(DateUtil.setDate(rs.getString("NgayDuyet")));
				keHoachDaoTaoModel.setGioDuyet(rs.getString("GioDuyet"));
				keHoachDaoTaoModel.setTinhTrang(rs.getString("TinhTrang"));
				keHoachDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				keHoachDaoTaoModel.setGioCapNhatCuoi(rs.getString("GioCapNhatCuoi"));
				keHoachDaoTaoModel.setLyDoReject(rs.getString("LyDoReject"));
				keHoachDaoTaoModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
				keHoachDaoTaoModel.setGioGui(rs.getString("GioGui"));
				keHoachDaoTaoModel.setBoSung(rs.getString("BoSung"));
				keHoachDaoTaoModel.setUser1(rs.getString("User1"));
				keHoachDaoTaoModel.setUser2(rs.getString("User2"));							
				keHoachDaoTaoModel.setUser3(rs.getString("User3"));
				keHoachDaoTaoModel.setUser4(rs.getString("User4"));
				keHoachDaoTaoModel.setUser5(rs.getString("User5"));
				keHoachDaoTaoModel.setTenNguoiLap(rs.getString("NguoiLap"));
				keHoachDaoTaoModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				
				/*ArrayList<ChiTietKHDTModel> chiTietList = 
						ChiTietKHDTDAO.timChiTietKHDT(rs.getString("MaKeHoachDaoTao"));
				keHoachDaoTaoModel.setChiTietKHDTList(chiTietList);
				if(keHoachDaoTaoModel.getChiTietKHDTList().size() > 0)
					Constant.NUM_ROWS = chiTietList.size();	
				else
					Constant.NUM_ROWS = 1;*/
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return keHoachDaoTaoModel;
	}

	public static Boolean insertKeHoachDaoTao(KeHoachDaoTaoModel keHoachDaoTaoModel) {
		Boolean result = false;
		String maKeHoachDaoTaoNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertKeHoachDaoTao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.registerOutParameter("Ten",java.sql.Types.VARCHAR);
			//csmt.setString("Ten", keHoachDaoTaoModel.getTenKeHoachDaoTao());
			csmt.setString("Nam1", keHoachDaoTaoModel.getNam1());
			csmt.setString("Nam2", keHoachDaoTaoModel.getNam2());
			csmt.setString("Nam3", keHoachDaoTaoModel.getNam3());
			csmt.setString("Nam4", keHoachDaoTaoModel.getNam4());
			csmt.setString("Nam5", keHoachDaoTaoModel.getNam5());
			csmt.setString("Nam6", keHoachDaoTaoModel.getNam6());			
			csmt.setNString("Nhiem_vu_1", keHoachDaoTaoModel.getNhiemVu1());
			csmt.setNString("Nhiem_vu_2", keHoachDaoTaoModel.getNhiemVu2());
			csmt.setNString("Nhiem_vu_3", keHoachDaoTaoModel.getNhiemVu3());
			csmt.setNString("Nhiem_vu_4", keHoachDaoTaoModel.getNhiemVu4());
			csmt.setString("Ma_nguoi_lap", keHoachDaoTaoModel.getMaNguoiLap());
			csmt.setString("Ngay_lap", null);
			csmt.setString("Ma_nguoi_duyet", null);
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Tinh_trang", Constant.TINHTRANG_NEW);
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.VARCHAR);
			csmt.setNString("Ly_do_reject", keHoachDaoTaoModel.getLyDoReject());
			csmt.setString("Ngay_gui", null);
			csmt.setString("Bo_sung", keHoachDaoTaoModel.getBoSung());
			csmt.setString("User1", keHoachDaoTaoModel.getUser1());
			csmt.setString("User2", keHoachDaoTaoModel.getUser2());
			csmt.setString("User3", keHoachDaoTaoModel.getUser3());
			csmt.setString("User4", keHoachDaoTaoModel.getUser4());
			csmt.setString("User5", keHoachDaoTaoModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				maKeHoachDaoTaoNew = csmt.getString("ID");
				keHoachDaoTaoModel.setMaKeHoachDaoTao(maKeHoachDaoTaoNew);
				keHoachDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(csmt.getString("Ngay_cap_nhat_cuoi")));
				keHoachDaoTaoModel.setTenKeHoachDaoTao(csmt.getString("Ten"));
				
				ArrayList<ChiTietKHDTModel> chiTietKHDTList = keHoachDaoTaoModel.getChiTietKHDTList();
				ArrayList<ChiTietKHDTModel> chiTietKHDTListAfterAdded = new ArrayList<ChiTietKHDTModel>();
				
				/*for (ChiTietKHDTModel obj : chiTietKHDTList) {
					obj.setMaKeHoach(maKeHoachDaoTaoNew);
					if (ChiTietKHDTDAO.insertChiTietKHDT(obj)) {
						chiTietKHDTListAfterAdded.add(obj);
					}
				}*/
				
				keHoachDaoTaoModel.setChiTietKHDTList(chiTietKHDTListAfterAdded);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}

	public static Boolean updateKeHoachDaoTao(KeHoachDaoTaoModel keHoachDaoTaoModel) {
		Boolean result = false;	
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateKeHoachDaoTao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", keHoachDaoTaoModel.getMaKeHoachDaoTao());
			csmt.setString("Ten", keHoachDaoTaoModel.getTenKeHoachDaoTao());
			csmt.setString("Nam1", keHoachDaoTaoModel.getNam1());
			csmt.setString("Nam2", keHoachDaoTaoModel.getNam2());
			csmt.setString("Nam3", keHoachDaoTaoModel.getNam3());
			csmt.setString("Nam4", keHoachDaoTaoModel.getNam4());
			csmt.setString("Nam5", keHoachDaoTaoModel.getNam5());
			csmt.setString("Nam6", keHoachDaoTaoModel.getNam6());
			csmt.setNString("Nhiem_vu_1", keHoachDaoTaoModel.getNhiemVu1());
			csmt.setNString("Nhiem_vu_2", keHoachDaoTaoModel.getNhiemVu2());
			csmt.setNString("Nhiem_vu_3", keHoachDaoTaoModel.getNhiemVu3());
			csmt.setNString("Nhiem_vu_4", keHoachDaoTaoModel.getNhiemVu4());
			csmt.setString("Ma_nguoi_lap", keHoachDaoTaoModel.getMaNguoiLap());
			//csmt.setString("Ngay_lap", keHoachDaoTaoModel.getNgayLap());
			csmt.setString("Ma_nguoi_duyet", keHoachDaoTaoModel.getMaNguoiDuyet());
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Tinh_trang", keHoachDaoTaoModel.getTinhTrang());			
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.VARCHAR);
			csmt.setNString("Ly_do_reject", null);
			csmt.setString("Bo_sung", keHoachDaoTaoModel.getBoSung());
			if(keHoachDaoTaoModel.getNgayGui().equals(""))
				csmt.setString("Ngay_gui", null);
			else
				csmt.setString("Ngay_gui", DateUtil.setDate(keHoachDaoTaoModel.getNgayGui()) + " " + keHoachDaoTaoModel.getGioGui());
			csmt.setString("User1", keHoachDaoTaoModel.getUser1());
			csmt.setString("User2", keHoachDaoTaoModel.getUser2());
			csmt.setString("User3", keHoachDaoTaoModel.getUser3());
			csmt.setString("User4", keHoachDaoTaoModel.getUser4());
			csmt.setString("User5", keHoachDaoTaoModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update "KE HOACH DAO TAO" thanh cong				
				keHoachDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(csmt.getString("Ngay_cap_nhat_cuoi")));
				
				ArrayList<ChiTietKHDTModel> chiTietKHDTList = keHoachDaoTaoModel.getChiTietKHDTList();
				ArrayList<ChiTietKHDTModel> chiTietKHDTListAfterUpdated = new ArrayList<ChiTietKHDTModel>();
				for (ChiTietKHDTModel obj : chiTietKHDTList) {	
					obj.setMaKeHoach(keHoachDaoTaoModel.getMaKeHoachDaoTao());
					if (obj.getId() != null) { // Cap nhat "CHI TIET KE HOACH DAO TAO" da ton tai
						ChiTietKHDTDAO.updateChiTietKHDT(obj);
					} else { // Them moi "CHI TIET KE HOACH DAO TAO"
						ChiTietKHDTDAO.insertChiTietKHDT(obj);
					}
					
					chiTietKHDTListAfterUpdated.add(obj);
				}
				
				keHoachDaoTaoModel.setChiTietKHDTList(chiTietKHDTListAfterUpdated);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static int duyetKeHoachDaoTao(String maNguoiDuyet, String maKeHoachDaoTao, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.duyetKeHoachDaoTaoByMaKeHoach"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maKeHoachDaoTao);
			result = preparedStatement.executeUpdate();
			return result;
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	
	
	public static Boolean checkNamOfKeHoachDaoTao(String nam) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_FindKeHoachDaoTaoByYear(?,?)}");
			csmt.setString("Nam1", nam);
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
	
	public static ArrayList<KeHoachDaoTaoModel> getAllKeHoachDaoTaoApproved() {
		ArrayList<KeHoachDaoTaoModel> keHoachDaoTaoModelList = new ArrayList<KeHoachDaoTaoModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllKeHoachDaoTaoApproved"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				KeHoachDaoTaoModel keHoachDaoTaoModel = new KeHoachDaoTaoModel();
				
				keHoachDaoTaoModel.setMaKeHoachDaoTao(rs.getString("MaKeHoachDaoTao"));
				keHoachDaoTaoModel.setTenKeHoachDaoTao(rs.getString("TenKeHoachDaoTao"));
				keHoachDaoTaoModel.setNam1(rs.getString("Nam1"));
				keHoachDaoTaoModel.setNam2(rs.getString("Nam2"));
				keHoachDaoTaoModel.setMaNguoiLap(rs.getString("MaNguoiLap"));
				
				keHoachDaoTaoModelList.add(keHoachDaoTaoModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return keHoachDaoTaoModelList;
	}
	
	public static ArrayList<KeHoachDaoTaoModel> getAllKeHoachDaoTaoNewOrReject() {
		ArrayList<KeHoachDaoTaoModel> keHoachDaoTaoModelList = new ArrayList<KeHoachDaoTaoModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllKeHoachDaoTaoNewOrReject"));
			preparedStatement.setString(1, Constant.TINHTRANG_NEW);
			preparedStatement.setString(2, Constant.TINHTRANG_REJECT);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				KeHoachDaoTaoModel keHoachDaoTaoModel = new KeHoachDaoTaoModel();
				
				keHoachDaoTaoModel.setMaKeHoachDaoTao(rs.getString("MaKeHoachDaoTao"));
				keHoachDaoTaoModel.setTenKeHoachDaoTao(rs.getString("TenKeHoachDaoTao"));
				keHoachDaoTaoModel.setNam1(rs.getString("Nam1"));
				keHoachDaoTaoModel.setNam2(rs.getString("Nam2"));
				keHoachDaoTaoModel.setMaNguoiLap(rs.getString("MaNguoiLap"));
				
				keHoachDaoTaoModelList.add(keHoachDaoTaoModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return keHoachDaoTaoModelList;
	}
	
	public static int getCountKeHoachDaoTao(String tinhtrang, String maBoPhan) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountKeHoachDaoTao(?,?,?)}");
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_PDT", Constant.BO_PHAN_PDT);
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
	public static ArrayList<KeHoachDaoTaoModel> getKeHoachDaoTao(int totalRows, String currenPage, String tinhTrang, String maBoPhan) {
		ArrayList<KeHoachDaoTaoModel> keHoachDaoTaoModelsList = new ArrayList<KeHoachDaoTaoModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_GetKeHoachDaoTao(?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_PDT", Constant.BO_PHAN_PDT);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				KeHoachDaoTaoModel keHoachDaoTaoModel = new KeHoachDaoTaoModel();
				keHoachDaoTaoModel.setMaKeHoachDaoTao(rs.getString("MaKeHoachDaoTao"));
				keHoachDaoTaoModel.setTenKeHoachDaoTao(rs.getString("TenKeHoachDaoTao"));
				keHoachDaoTaoModel.setTenNguoiLap(rs.getString("TenNguoiLap"));
				keHoachDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				keHoachDaoTaoModel.setTinhTrang(rs.getString("TinhTrang"));
				keHoachDaoTaoModel.setLyDoReject(rs.getString("LyDoReject"));
				keHoachDaoTaoModelsList.add(keHoachDaoTaoModel);
			}
			Constant.CHECK_ROWS = keHoachDaoTaoModelsList.size();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return keHoachDaoTaoModelsList;
	}
	public static boolean boSungKHDT(KeHoachDaoTaoModel keHoach) {
		boolean result = true;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_BoSungKHDT(?,?,?)}");
			csmt.setString("ID", keHoach.getMaKeHoachDaoTao());
			csmt.setString("Tinh_trang", Constant.TINHTRANG_BO_SUNG);
			csmt.registerOutParameter("Bo_sung", java.sql.Types.INTEGER);
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				keHoach.setBoSung(csmt.getString("Bo_sung"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	public static boolean khongBoSungKHDT(KeHoachDaoTaoModel keHoach) {
		boolean result = true;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_KhongBoSungKHDT(?,?,?)}");
			csmt.setString("ID", keHoach.getMaKeHoachDaoTao());
			csmt.setString("Tinh_trang", Constant.TINHTRANG_APPROVE);
			csmt.registerOutParameter("Bo_sung", java.sql.Types.INTEGER);
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				keHoach.setBoSung(csmt.getString("Bo_sung"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	// Ham join 5 table
	public static KeHoachDaoTaoModel getAllKeHoachOfTableByID(String id){
		KeHoachDaoTaoModel keHoachDaoTaoModel = new KeHoachDaoTaoModel();
		System.out.println(keHoachDaoTaoModel.hashCode());
		String maKeHoach = "na", maBoPhan = "na", maCongTac = "na", maChiTiet = "na";
		ArrayList<NguoiThucHienModel> listNguoiThucHien = new ArrayList<NguoiThucHienModel>();
		ArrayList<BoPhanThucHienKHDTModel> boPhanList = new ArrayList<BoPhanThucHienKHDTModel>();
		ArrayList<NoiDungChiTietKHDTModel> noiDungList = new ArrayList<NoiDungChiTietKHDTModel>();
		ArrayList<ChiTietKHDTModel> chiTietList = new ArrayList<ChiTietKHDTModel>(); 
		//int count = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllKeHoachOfTableByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				if(!rs.getString("MaKeHoachDaoTao").equals(maKeHoach)) {
					keHoachDaoTaoModel.setMaKeHoachDaoTao(rs.getString("MaKeHoachDaoTao"));
					keHoachDaoTaoModel.setTenKeHoachDaoTao(rs.getString("TenKeHoachDaoTao"));
					keHoachDaoTaoModel.setNam1(rs.getString("Nam1"));
					keHoachDaoTaoModel.setNam2(rs.getString("Nam2"));
					keHoachDaoTaoModel.setNam3(rs.getString("Nam3"));
					keHoachDaoTaoModel.setNam4(rs.getString("Nam4"));
					keHoachDaoTaoModel.setNam5(rs.getString("Nam5"));
					keHoachDaoTaoModel.setNam6(rs.getString("Nam6"));
					keHoachDaoTaoModel.setNhiemVu1(rs.getString("NhiemVu1"));
					keHoachDaoTaoModel.setNhiemVu2(rs.getString("NhiemVu2"));
					keHoachDaoTaoModel.setNhiemVu3(rs.getString("NhiemVu3"));
					keHoachDaoTaoModel.setNhiemVu4(rs.getString("NhiemVu4"));
					keHoachDaoTaoModel.setMaNguoiLap(rs.getString("MaNguoiLap"));
					keHoachDaoTaoModel.setNgayLap(DateUtil.setDate(rs.getString("NgayLap")));
					keHoachDaoTaoModel.setGioLap(rs.getString("GioLap"));
					keHoachDaoTaoModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
					keHoachDaoTaoModel.setNgayDuyet(DateUtil.setDate(rs.getString("NgayDuyet")));
					keHoachDaoTaoModel.setGioDuyet(rs.getString("GioDuyet"));
					keHoachDaoTaoModel.setTinhTrang(rs.getString("TinhTrang"));
					keHoachDaoTaoModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
					keHoachDaoTaoModel.setGioCapNhatCuoi(rs.getString("GioCapNhatCuoi"));
					keHoachDaoTaoModel.setLyDoReject(rs.getString("LyDoReject"));
					keHoachDaoTaoModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
					keHoachDaoTaoModel.setGioGui(rs.getString("GioGui"));
					keHoachDaoTaoModel.setBoSung(rs.getString("BoSungTableKHDT"));
					keHoachDaoTaoModel.setUser1(rs.getString("User1TableKHDT"));
					keHoachDaoTaoModel.setUser2(rs.getString("User2TableKHDT"));							
					//keHoachDaoTaoModel.setUser3(rs.getString("User3TableKHDT"));
					//keHoachDaoTaoModel.setUser4(rs.getString("User4TableKHDT"));
					//keHoachDaoTaoModel.setUser5(rs.getString("User5TableKHDT"));
					keHoachDaoTaoModel.setTenNguoiLap(rs.getString("NguoiLap"));
					keHoachDaoTaoModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
					
					keHoachDaoTaoModel.setChiTietKHDTList(chiTietList);
					maKeHoach = keHoachDaoTaoModel.getMaKeHoachDaoTao();
				}
				if(rs.getString("MaChiTietKHDT") != null) {
					if(!maChiTiet.equals(rs.getString("MaChiTietKHDT"))) {
						ChiTietKHDTModel chiTiet = new ChiTietKHDTModel();
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
						
						chiTietList.add(chiTiet);
					}
				}
				if(rs.getString("MaNoiDungChiTietKHDT") != null) {
					if(!maCongTac.equals(rs.getString("MaNoiDungChiTietKHDT")) || !maChiTiet.equals(rs.getString("MaChiTietKHDT"))) {
						//if(!rs.getString("BoSungTableNoiDungKHDT").equals("1")) {
							NoiDungChiTietKHDTModel noiDung = new NoiDungChiTietKHDTModel();
							noiDung.setMaNoiDungChiTietKHDT(rs.getString("MaNoiDungChiTietKHDT"));
							noiDung.setMaCongTac(rs.getString("MaCongTac"));
							noiDung.setKhoa(rs.getString("Khoa"));
							noiDung.setNoiDungCongTac(rs.getString("NoiDungCongTac"));
							noiDung.setTinhTrangThucHien(rs.getString("TinhTrangThucHienTableNoiDungKHDT"));
							noiDung.setBoSung(rs.getString("BoSungTableNoiDungKHDT"));
							if(rs.getString("ThoiGian") != null) {
								noiDung.setThoiGian(rs.getString("ThoiGian").replaceAll("\r\n", "<-XUONGDONG->"));
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
					//	}
					}
				}
				if(rs.getString("MaBoPhanThucHien") != null) {
					if(!maBoPhan.equals(rs.getString("MaBoPhanThucHien")) || !maChiTiet.equals(rs.getString("MaChiTietKHDT")) || !maCongTac.equals(rs.getString("MaNoiDungChiTietKHDT"))) {
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
				if(rs.getString("MaChiTietKHDT") != null)
					maChiTiet = rs.getString("MaChiTietKHDT");
				else
					maChiTiet = "na";
				if(rs.getString("MaNoiDungChiTietKHDT") != null)
					maCongTac = rs.getString("MaNoiDungChiTietKHDT");
				else
					maCongTac = "na";
				if(rs.getString("MaBoPhanThuchien") != null)
					maBoPhan = rs.getString("MaBoPhanThuchien");
				else
					maBoPhan = "na";
			}
			if(keHoachDaoTaoModel.getChiTietKHDTList() != null && keHoachDaoTaoModel.getChiTietKHDTList().size() > 0)
				Constant.NUM_ROWS = chiTietList.size();	
			else
				Constant.NUM_ROWS = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return keHoachDaoTaoModel;
	}
	
	
	
	
	
}
