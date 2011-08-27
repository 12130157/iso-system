package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BangPhanCongModel;
import vn.edu.hungvuongaptech.model.ChiTietBangPhanCongModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class BangPhanCongDAO {
	public static boolean insertBangPhanCong(BangPhanCongModel bangPhanCong) {
		boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertBangPhanCong(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ten", bangPhanCong.getTen());
			csmt.setString("Ma_khoa", bangPhanCong.getMaKhoa());
			csmt.setString("Hoc_ki", bangPhanCong.getHocKi());
			csmt.setString("Ma_he_dao_tao", bangPhanCong.getMaHeDaoTao());
			csmt.setString("Ma_nam_hoc", bangPhanCong.getMaNamHoc());
			csmt.setString("Tinh_trang", bangPhanCong.getTinhTrang());
			csmt.setString("Ngay_tao", bangPhanCong.getNgayTao());
			csmt.setString("Nguoi_tao", bangPhanCong.getMaNguoiTao());
			csmt.setString("Ngay_duyet", bangPhanCong.getNgayDuyet());
			csmt.setString("Nguoi_duyet", bangPhanCong.getMaNguoiDuyet());
			csmt.setString("Ngay_gui", bangPhanCong.getNgayGui());
			csmt.setString("Ngay_cap_nhat_cuoi", bangPhanCong.getNgayCapNhatCuoi());
			csmt.setNString("Ly_do_reject", bangPhanCong.getLyDoReject());
			csmt.setString("Hoc_ki_nam_hoc", bangPhanCong.getHocKiNamHoc());
			csmt.setString("Ma_quyet_dinh", bangPhanCong.getMaQuyetDinh());
			csmt.setString("User1", bangPhanCong.getUser1());
			csmt.setString("User2", bangPhanCong.getUser2());
			csmt.setString("User3", bangPhanCong.getUser3());
			csmt.setString("User4", bangPhanCong.getUser4());
			csmt.setString("User5", bangPhanCong.getUser5());
			csmt.setString("Tinh_trang_approved", Constant.TINHTRANG_APPROVE);
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				bangPhanCong.setId(csmt.getString("ID"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
	public static String kiemTraBangPhanCongDaTao(String maNamHoc, String hocKi, String maKhoa, String maHeDaoTao, String maQuyetDinh) {
		String kq = "";
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_FindBangPhanCongDaTao(?,?,?,?,?,?,?)}");
			csmt.setString("Ma_nam_hoc", maNamHoc);
			csmt.setString("Hoc_ki", hocKi);
			csmt.setString("Ma_khoa", maKhoa);
			csmt.setString("Ma_he_dao_tao", maHeDaoTao);
			csmt.setString("Tinh_trang_approved", Constant.TINHTRANG_APPROVE);
			csmt.setString("Ma_quyet_dinh", maQuyetDinh);
			csmt.registerOutParameter("result", java.sql.Types.VARCHAR);
			if (DataUtil.executeNonStore(csmt)) {
				kq = csmt.getString("result");
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
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
					bangPhanCong.setMaHeDaoTao(rs.getString("MaHeDaoTao"));
					bangPhanCong.setTenHeDaoTao(rs.getNString("TenHeDaoTao"));
					bangPhanCong.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
					bangPhanCong.setNamBatDau(rs.getString("NamBatDau"));
					bangPhanCong.setNamKetThuc(rs.getString("NamKetThuc"));
					bangPhanCong.setSoDong("");
					id = bangPhanCong.getId();
					bangPhanCong.setChiTietBangPhanCongList(chiTietBangPhanCongList);
				}
				if(status.equals("Print")) {
					if(!maGiaoVien.equals(rs.getString("MaGiaoVien")) || !maLop.equals(rs.getString("MaLop"))) {
						if(bangPhanCong.getChiTietBangPhanCongList().size() != 0 && !maGiaoVien.equals("na"))
							bangPhanCong.setSoDong(bangPhanCong.getSoDong() + "/" + countGiaoVien);
						countGiaoVien = 1;
						maGiaoVien = rs.getString("MaGiaoVien");
					} else
						countGiaoVien++;
					if(!maLop.equals(rs.getString("MaLop"))) {
						if(bangPhanCong.getChiTietBangPhanCongList().size() != 0) {
							bangPhanCong.setSoDong(bangPhanCong.getSoDong() + "-" + countLop);
						}
						countLop = 1;
						countGiaoVien = 1;
						maLop = rs.getString("MaLop");
					} else {
						countLop++;
					}
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
				bangPhanCong.setSoDong(bangPhanCong.getSoDong() + "/" + countGiaoVien);
				bangPhanCong.setSoDong(bangPhanCong.getSoDong() + "-" + countLop);
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
	public static ArrayList<BangPhanCongModel> getBangPhanCongApprovedByHocKiAndMaNamHoc(String hocKi, String namBatDau) {
		// TODO Auto-generated method stub
		ArrayList<BangPhanCongModel> bangPhanCongList = new ArrayList<BangPhanCongModel>();
		String maLop = "na", maBangPhanCong = "na";
		ArrayList<ChiTietBangPhanCongModel> chiTietList = new ArrayList<ChiTietBangPhanCongModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getBangPhanCongApprovedByHocKiAndMaNamHoc"));
			preparedStatement.setString(1, namBatDau);
			preparedStatement.setString(2, hocKi);
			preparedStatement.setString(3, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				if(!maBangPhanCong.equals(rs.getString("MaBangPhanCong"))) {
					BangPhanCongModel bangPhanCong = new BangPhanCongModel();
					bangPhanCong.setId(rs.getString("MaBangPhanCong"));
					bangPhanCong.setTen(rs.getNString("TenBangPhanCong"));
					
					bangPhanCong.setHocKiNamHoc(rs.getString("HocKiNamHoc"));
					maBangPhanCong = rs.getString("MaBangPhanCong");
					maLop = "na";
					chiTietList = new ArrayList<ChiTietBangPhanCongModel>();
					bangPhanCong.setChiTietBangPhanCongList(chiTietList);
					bangPhanCongList.add(bangPhanCong);
				}
				
				ChiTietBangPhanCongModel chiTiet = new ChiTietBangPhanCongModel();
				chiTiet.setMaLop(rs.getString("MaLop"));
				chiTiet.setKiHieuLop(rs.getString("KiHieuLop"));
				chiTiet.setTenChuyenNganh(rs.getNString("tenChuyenNganh"));
				chiTiet.setMaChuongTrinh(rs.getString("MaChuongTrinh"));
				chiTiet.setSoHocSinh(rs.getString("SoHocSinh"));
				chiTietList.add(chiTiet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bangPhanCongList;
	}
}
