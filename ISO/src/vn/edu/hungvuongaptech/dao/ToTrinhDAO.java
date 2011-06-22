package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.zefer.html.doc.t;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.ChiTietTKBThayDoiModel;
import vn.edu.hungvuongaptech.model.MonHocTKBThayDoiModel;
import vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel;
import vn.edu.hungvuongaptech.model.ToTrinhModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;


public class ToTrinhDAO {
	public static Boolean guiToTrinh(ToTrinhModel toTrinh) {
		
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GuiToTrinh(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", toTrinh.getId());
			csmt.registerOutParameter("Ten", java.sql.Types.NVARCHAR);
			csmt.setString("Ma_nguoi_tao", toTrinh.getMaNguoiTao());
			csmt.setString("Ma_nguoi_duyet", toTrinh.getMaNguoiDuyet());
			csmt.setString("Ngay_cap_nhat_cuoi", toTrinh.getNgayCapNhatCuoi());
			csmt.setString("Ngay_duyet", toTrinh.getNgayDuyet());
			csmt.setString("Ngay_gui", toTrinh.getNgayGui());
			csmt.setString("Ly_do_reject", toTrinh.getLyDoReject());
			csmt.setString("Tinh_trang", Constant.TINHTRANG_SEND);
			csmt.setString("User1", toTrinh.getUser1());
			csmt.setString("User2", toTrinh.getUser2());
			csmt.setString("User3", toTrinh.getUser3());
			csmt.setString("User4", toTrinh.getUser4());
			csmt.setString("User5", toTrinh.getUser5()); // user5 = ngay dau tien hoc
			csmt.registerOutParameter("Ngay_gui_output", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Gio_gui_output", java.sql.Types.VARCHAR);
			
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				toTrinh.setTen(csmt.getNString("Ten"));
				toTrinh.setNgayGui(csmt.getString("Ngay_gui_output"));
				toTrinh.setGioGui(csmt.getString("Gio_gui_output"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	public static boolean duyetToTrinh(String maToTrinh, String maNguoiTao, String tinhTrang, String maNguoiDuyet, String lyDoReject) {
		boolean result = true;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DuyetToTrinh(?,?,?,?,?)}");
			csmt.setString("Ma_to_trinh", maToTrinh);
			csmt.setString("Ma_nguoi_tao", maNguoiTao);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_nguoi_duyet", maNguoiDuyet);
			csmt.setString("Ly_do_reject", lyDoReject);
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	public static ArrayList<ToTrinhModel> getToTrinh(int totalRows, String currenPage, String tinhTrang, String maBoPhan) {
		ArrayList<ToTrinhModel> toTrinhList = new ArrayList<ToTrinhModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetToTrinh(?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				ToTrinhModel toTrinh = new ToTrinhModel();
				toTrinh.setId(rs.getString("MaToTrinh"));
				toTrinh.setTen(rs.getString("Ten"));
				toTrinh.setTenNguoiTao(rs.getString("TenNguoiTao"));
				toTrinh.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				toTrinh.setTinhTrang(rs.getString("TinhTrang"));
				toTrinh.setLyDoReject(rs.getString("LyDoReject"));
				toTrinh.setMaNguoiTao(rs.getString("MaNguoiTao"));
				toTrinhList.add(toTrinh);
			}
			Constant.CHECK_ROWS = toTrinhList.size(); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return toTrinhList;
	}
	public static int getCountToTrinh(String tinhtrang, String maBoPhan) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountToTrinh(?,?,?)}");
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
	public static ToTrinhModel getToTrinhAndMonHocTKBThayDoiByIDToTrinh(String id) {
		// TODO Auto-generated method stub
		ToTrinhModel toTrinh = new ToTrinhModel();
		ArrayList<ChiTietTKBThayDoiModel> chiTietTKBThayDoiList = ChiTietTKBThayDoiDAO.getChiTietTKBThayDoiByMaToTrinh(id);
		ArrayList<MonHocTKBThayDoiModel>  monHocTKBThayDoiList = new ArrayList<MonHocTKBThayDoiModel>();
		String maToTrinh = "na";
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_GetToTrinhAndMonHocTKBThayDoiByIDToTrinh(?)}");
			csmt.setString("ID", id);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next()) {
				if(!rs.getString("MaToTrinh").equals(maToTrinh)) {
					toTrinh.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
					toTrinh.setMaNguoiTao(rs.getString("MaNguoiTao"));
					toTrinh.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
					toTrinh.setTenNguoiDuyet(rs.getString("TenNguoiDuyet"));
					toTrinh.setTenNguoiTao(rs.getString("TenNguoiTao"));
					toTrinh.setTen(rs.getString("Ten"));
					toTrinh.setTinhTrang(rs.getString("TinhTrang"));
					toTrinh.setId(rs.getString("MaToTrinh"));
					
					maToTrinh = toTrinh.getId();
					toTrinh.setChiTietTKBThayDoiList(chiTietTKBThayDoiList);
					toTrinh.setMonHocTKBThayDoiList(monHocTKBThayDoiList);
				}
				
				if(rs.getString("MaMonHocTKBThayDoi") != null) {
					MonHocTKBThayDoiModel monHocTKBThayDoi = new MonHocTKBThayDoiModel();
					monHocTKBThayDoi.setMaGiaoVien(rs.getString("MaGiaoVien"));
					monHocTKBThayDoi.setTenGiaoVien(rs.getString("TenGiaoVien"));
					
					monHocTKBThayDoi.setMaGiaoVienThayDoi(rs.getString("MaGiaoVienThayDoi"));
					monHocTKBThayDoi.setTenGiaoVienThayDoi(rs.getString("TenGiaoVienThayDoi"));
					
					monHocTKBThayDoi.setTenMonHoc(rs.getString("TenMonHoc"));
					monHocTKBThayDoiList.add(monHocTKBThayDoi);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return toTrinh;
	}
	public static int getCountThayDoi() {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountThayDoi(?)}");
			csmt.registerOutParameter("Count", java.sql.Types.INTEGER);
			//csmt.registerOutParameter("Count", java.sql.Types.INTEGER);
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("CountThayDoi"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public static boolean guiLaiToTrinh(ToTrinhModel toTrinh) {
		boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_GuiLaiToTrinh(?,?,?,?)}");
			csmt.setString("ID", toTrinh.getId());
			csmt.setString("Tinh_trang_gui", Constant.TINHTRANG_SEND);
			csmt.registerOutParameter("Ngay_gui_output", java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Gio_gui_output", java.sql.Types.VARCHAR);
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				toTrinh.setNgayGui(csmt.getString("Ngay_gui_output"));
				toTrinh.setGioGui(csmt.getString("Gio_gui_output"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public static ToTrinhModel getToTrinhSimpleByID(String id) {
		// TODO Auto-generated method stub
		ToTrinhModel toTrinh = new ToTrinhModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getToTrinhSimpleByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				toTrinh.setId(rs.getString("MaToTrinh"));
				toTrinh.setTen(rs.getNString("Ten"));
				toTrinh.setTenNguoiTao(rs.getNString("TenNguoiTao"));
				toTrinh.setNgayGui(rs.getString("NgayGui"));
				toTrinh.setGioGui(rs.getString("GioGui"));
				toTrinh.setTenNguoiDuyet(rs.getNString("TenNguoiDuyet"));
				toTrinh.setNgayDuyet(rs.getString("NgayDuyet"));
				toTrinh.setGioDuyet(rs.getString("GioDuyet"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return toTrinh;
	}
}
