package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.org.apache.bcel.internal.generic.GETSTATIC;
import com.sun.org.apache.regexp.internal.recompile;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BangPhanCongModel;
import vn.edu.hungvuongaptech.model.ChiTietBangPhanCongModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class BangPhanCongDAO {
	public static boolean insertBangPhanCong(BangPhanCongModel bangPhanCong) {
		boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertBangPhanCong(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ten", bangPhanCong.getTen());
			csmt.setString("Ma_khoa", bangPhanCong.getMaKhoa());
			csmt.setString("Hoc_ki", bangPhanCong.getHocKi());
			csmt.setString("Ma_nam_hoc", bangPhanCong.getMaNamHoc());
			csmt.setString("Tinh_trang", bangPhanCong.getTinhTrang());
			csmt.setString("Ngay_tao", bangPhanCong.getNgayTao());
			csmt.setString("Nguoi_tao", bangPhanCong.getMaNguoiTao());
			csmt.setString("Ngay_duyet", bangPhanCong.getNgayDuyet());
			csmt.setString("Nguoi_duyet", bangPhanCong.getMaNguoiDuyet());
			csmt.setString("Ngay_gui", bangPhanCong.getNgayGui());
			csmt.setString("Ngay_cap_nhat_cuoi", bangPhanCong.getNgayCapNhatCuoi());
			csmt.setNString("Ly_do_reject", bangPhanCong.getLyDoReject());
			csmt.setString("User1", bangPhanCong.getUser1());
			csmt.setString("User2", bangPhanCong.getUser2());
			csmt.setString("User3", bangPhanCong.getUser3());
			csmt.setString("User4", bangPhanCong.getUser4());
			csmt.setString("User5", bangPhanCong.getUser5());
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				bangPhanCong.setId(csmt.getString("ID"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
	public static Boolean kiemTraBangPhanCongDaTao(String maNamHoc, String hocKi, String maKhoa) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_FindBangPhanCongDaTao(?,?,?,?)}");
			csmt.setString("Ma_nam_hoc", maNamHoc);
			csmt.setString("Hoc_ki", hocKi);
			csmt.setString("Ma_khoa", maKhoa);
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
	public static int getCountBangPhanCong(String tinhtrang, String maBoPhan) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountBangPhanCong(?,?,?)}");
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
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
	public static ArrayList<BangPhanCongModel> getBangPhanCong(int totalRows, String currenPage, String tinhTrang, String maBoPhan) {
		ArrayList<BangPhanCongModel> bangPhanCongList = new ArrayList<BangPhanCongModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetBangPhanCong(?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				BangPhanCongModel bangPhanCong = new BangPhanCongModel();
				bangPhanCong.setId(rs.getString("MaBangPhanCong"));
				bangPhanCong.setTen(rs.getString("TenBangPhanCong"));
				bangPhanCong.setTenNguoiTao(rs.getString("TenNguoiTao"));
				bangPhanCong.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				bangPhanCong.setTinhTrang(rs.getString("TinhTrang"));
				bangPhanCong.setLyDoReject(rs.getString("LyDoReject"));
				bangPhanCongList.add(bangPhanCong);
			}
			Constant.CHECK_ROWS = bangPhanCongList.size(); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bangPhanCongList;
	}
	public static BangPhanCongModel getBangPhanCongByID(String maBangPhanCong, String status) {
		BangPhanCongModel bangPhanCong = new BangPhanCongModel();
		String id = "na", maGiaoVien = "na", maLop = "na";
		int countLop = 1, countGiaoVien = 1;
		ArrayList<ChiTietBangPhanCongModel> chiTietBangPhanCongList = new ArrayList<ChiTietBangPhanCongModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetBangPhanCongByID"));
			preparedStatement.setString(1, maBangPhanCong);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				if(!id.equals(rs.getString("MaBangPhanCong"))) {
					bangPhanCong.setId(rs.getString("MaBangPhanCong"));
					bangPhanCong.setTen(rs.getNString("TenBangPhanCong"));
					bangPhanCong.setHocKi(rs.getString("HocKi"));
					bangPhanCong.setMaNamHoc(rs.getString("MaNamHoc"));
					bangPhanCong.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
					bangPhanCong.setNgayDuyet(rs.getString("NgayDuyet"));
					bangPhanCong.setTinhTrang(rs.getString("TinhTrang"));
					bangPhanCong.setMaNguoiTao(rs.getString("MaNguoiTao"));
					bangPhanCong.setTenNguoiTao(rs.getNString("TenNguoiTao"));
					bangPhanCong.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
					bangPhanCong.setTenNguoiDuyet(rs.getNString("TenNguoiDuyet"));
					bangPhanCong.setTenKhoa(rs.getNString("TenKhoa"));
					bangPhanCong.setMaKhoa(rs.getString("MaKhoa"));
					
					id = bangPhanCong.getId();
					bangPhanCong.setChiTietBangPhanCongList(chiTietBangPhanCongList);
				}
				if(status.equals("Print")) {
					if(!maLop.equals(rs.getString("MaLop"))) {
						if(bangPhanCong.getChiTietBangPhanCongList().size() != 0) {
							bangPhanCong.setSoDong("/" + bangPhanCong.getSoDong() + countGiaoVien);
							bangPhanCong.setSoDong("-" + bangPhanCong.getSoDong() + countLop);
						}
						countLop = 1;
						countGiaoVien = 1;
						maLop = rs.getString("MaLop");
						maGiaoVien = "na";
					} else {
						countLop++;
					}
					if(!maGiaoVien.equals(rs.getString("MaGiaoVien"))) {
						if(bangPhanCong.getChiTietBangPhanCongList().size() != 0 && !maGiaoVien.equals("na"))
							bangPhanCong.setSoDong("/" + bangPhanCong.getSoDong() + countGiaoVien);
						countGiaoVien = 1;
						maGiaoVien = rs.getString("MaGiaoVien");
					} else
						countGiaoVien++;
				}
				ChiTietBangPhanCongModel chiTiet = new ChiTietBangPhanCongModel();
				chiTiet.setTenGiaoVien(rs.getNString("TenGiaoVien"));
				chiTiet.setTenMonHoc(rs.getNString("TenMonHoc"));
				chiTiet.setId(rs.getString("MaChiTietBangPhanCong"));
				chiTiet.setGhiChu(rs.getNString("GhiChu"));
				chiTiet.setNhiemVu(rs.getNString("NhiemVu"));
				chiTiet.setLyThuyet(rs.getString("LyThuyet"));
				chiTiet.setThucHanh(rs.getString("ThucHanh"));
				chiTiet.setKiHieuLop(rs.getString("KiHieuLop"));
				chiTiet.setMaLop(rs.getString("MaLop"));
				chiTiet.setMaGiaoVien(rs.getString("MaGiaoVien"));
				
				chiTietBangPhanCongList.add(chiTiet);
			}
			if(status.equals("Print")) {
				bangPhanCong.setSoDong("-" + bangPhanCong.getSoDong() + countLop);
				bangPhanCong.setSoDong("/" + bangPhanCong.getSoDong() + countGiaoVien);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bangPhanCong;
	}
	public static int duyetBangPhanCong(String maNguoiDuyet, String maBangPhanCong, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.duyetBangPhanCongByID"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maBangPhanCong);
			result = preparedStatement.executeUpdate();
			return result;
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	public static BangPhanCongModel getBangPhanCongSimpleByID(String id) {
		// TODO Auto-generated method stub
		BangPhanCongModel bangPhanCong = new BangPhanCongModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getBangPhanCongSimpleByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				bangPhanCong.setId(rs.getString("MaBangPhanCong"));
				bangPhanCong.setTen(rs.getNString("TenBangPhanCong"));
				bangPhanCong.setTenNguoiTao(rs.getNString("TenNguoiTao"));
				bangPhanCong.setNgayGui(rs.getString("NgayGui"));
				bangPhanCong.setGioGui(rs.getString("GioGui"));
				bangPhanCong.setTenNguoiDuyet(rs.getNString("TenNguoiDuyet"));
				bangPhanCong.setNgayDuyet(rs.getString("NgayDuyet"));
				bangPhanCong.setGioDuyet(rs.getString("GioDuyet"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bangPhanCong;
	}
	public static int guiHieuTruongByID(String id, String ngayGui) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GuiHieuTruongByID"));
			preparedStatement.setString(1, ngayGui);
			preparedStatement.setString(2, Constant.TINHTRANG_SEND);
			preparedStatement.setString(3, id);
			result = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return result;
	}
	public static ArrayList<BangPhanCongModel> getBangPhanCongByHocKiAndMaNamHoc(String hocKi, String maNamHoc) {
		// TODO Auto-generated method stub
		ArrayList<BangPhanCongModel> bangPhanCongList = new ArrayList<BangPhanCongModel>();
		String maLop = "na", maBangPhanCong = "na";
		ArrayList<ChiTietBangPhanCongModel> chiTietList = new ArrayList<ChiTietBangPhanCongModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getBangPhanCongByHocKiAndMaNamHoc"));
			preparedStatement.setString(1, hocKi);
			preparedStatement.setString(2, maNamHoc);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				if(maBangPhanCong.equals(rs.getString("MaBangPhanCong"))) {
					BangPhanCongModel bangPhanCong = new BangPhanCongModel();
					bangPhanCong.setId(rs.getString("MaBangPhanCong"));
					bangPhanCong.setTen(rs.getNString("TenBangPhanCong"));
					bangPhanCong.setChiTietBangPhanCongList(chiTietList);
					maBangPhanCong = rs.getString("MaBangPhanCong");
					maLop = "na";
					chiTietList = new ArrayList<ChiTietBangPhanCongModel>();
					bangPhanCongList.add(bangPhanCong);
				}
				
				ChiTietBangPhanCongModel chiTiet = new ChiTietBangPhanCongModel();
				chiTiet.setMaLop(rs.getString("MaLop"));
				chiTiet.setKiHieuLop(rs.getString("KiHieuLop"));
				chiTietList.add(chiTiet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bangPhanCongList;
	}
}
