package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import org.zefer.cache.d;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.DeCuongMonHocModel;
import vn.edu.hungvuongaptech.model.NoiDungDCMHModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class DeCuongMonHocDAO {
	public static ArrayList<DeCuongMonHocModel> getAllDeCuongMonHocAndTenNguoiTao() {
		ArrayList<DeCuongMonHocModel> deCuongMonHocModelList = new ArrayList<DeCuongMonHocModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllDeCuongMonHocAndTenNguoiTao"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();
				deCuongMonHocModel.setMaDeCuongMonHoc(rs.getString("MaDeCuongMonHoc"));
				deCuongMonHocModel.setTenDeCuongMonHoc(rs.getString("TenDeCuongMonHoc"));
				deCuongMonHocModel.setTenNguoiTao(rs.getString("TenNguoiTao"));
				deCuongMonHocModel.setNgayTao(rs.getString("NgayTao"));
				deCuongMonHocModel.setTinhTrang(rs.getString("TinhTrang"));
				deCuongMonHocModel.setLyDoReject(rs.getString("LyDoReject"));
				deCuongMonHocModelList.add(deCuongMonHocModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deCuongMonHocModelList;
	}
	
	public static ArrayList<DeCuongMonHocModel> getAllDeCuongMonHocAndTenNguoiTaoByMaNguoiTao(String maNguoiTao) {
		ArrayList<DeCuongMonHocModel> deCuongMonHocModelList = new ArrayList<DeCuongMonHocModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllDeCuongMonHocAndTenNguoiTaoByMaNguoiTao"));
			preparedStatement.setString(1, maNguoiTao);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();
				deCuongMonHocModel.setMaDeCuongMonHoc(rs.getString("MaDeCuongMonHoc"));
				deCuongMonHocModel.setTenDeCuongMonHoc(rs.getString("TenDeCuongMonHoc"));
				deCuongMonHocModel.setTenNguoiTao(rs.getString("NguoiTao"));
				deCuongMonHocModel.setNgayTao(rs.getString("NgayTao"));
				deCuongMonHocModel.setTinhTrang(rs.getString("TinhTrang"));
				deCuongMonHocModel.setLyDoReject(rs.getString("LyDoReject"));
				deCuongMonHocModelList.add(deCuongMonHocModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deCuongMonHocModelList;
	}
	
	public static DeCuongMonHocModel getDeCuongMonHocByID(String maDeCuongMonHoc) {
		DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getDeCuongMonHocByID"));
			preparedStatement.setString(1, maDeCuongMonHoc);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				deCuongMonHocModel.setMaChuongTrinh(rs.getString("MaChuongTrinh"));
				deCuongMonHocModel.setMaDeCuongMonHoc(rs.getString("MaDeCuongMonHoc"));
				deCuongMonHocModel.setTenDeCuongMonHoc(rs.getString("TenDeCuongMonHoc"));
				deCuongMonHocModel.setSoTietHocMotBuoi(rs.getString("SoTiet"));
				deCuongMonHocModel.setSoBuoiHocTrongTuan(rs.getString("SoBuoi"));
				deCuongMonHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				deCuongMonHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				deCuongMonHocModel.setLyThuyet(rs.getString("LyThuyet"));
				deCuongMonHocModel.setThucHanh(rs.getString("ThucHanh"));
				deCuongMonHocModel.setKiemTra(rs.getString("KiemTra"));
				deCuongMonHocModel.setViTriMonHoc(rs.getString("ViTriMonHoc"));
				deCuongMonHocModel.setTinhChatMonHoc(rs.getString("TinhChatMonHoc"));
				deCuongMonHocModel.setMucTieu1(rs.getString("MucTieu1"));
				deCuongMonHocModel.setMucTieu2(rs.getString("MucTieu2"));
				deCuongMonHocModel.setMucTieu3(rs.getString("MucTieu3"));
				deCuongMonHocModel.setMucTieu4(rs.getString("MucTieu4"));
				deCuongMonHocModel.setDieuKien1(rs.getString("DieuKien1"));
				deCuongMonHocModel.setDieuKien2(rs.getString("DieuKien2"));
				deCuongMonHocModel.setDieuKien3(rs.getString("DieuKien3"));
				deCuongMonHocModel.setDieuKien4(rs.getString("DieuKien4"));
				deCuongMonHocModel.setPhuongPhap1(rs.getString("PhuongPhap1"));
				deCuongMonHocModel.setPhuongPhap2(rs.getString("PhuongPhap2"));
				deCuongMonHocModel.setPhuongPhap3(rs.getString("PhuongPhap3"));
				deCuongMonHocModel.setNgayTao(rs.getString("NgayTao"));
				deCuongMonHocModel.setGioTao(rs.getString("GioTao"));
				deCuongMonHocModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				deCuongMonHocModel.setGioCapNhatCuoi(rs.getString("GioCapNhatCuoi"));
				deCuongMonHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				deCuongMonHocModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				deCuongMonHocModel.setNgayDuyet(DateUtil.setDate(rs.getString("NgayDuyet")));
				deCuongMonHocModel.setGioDuyet(rs.getString("GioDuyet"));
				deCuongMonHocModel.setTinhTrang(rs.getString("TinhTrang"));
				deCuongMonHocModel.setLyDoReject(rs.getString("LyDoReject"));
				deCuongMonHocModel.setTenKhoa(rs.getString("TenKhoa"));
				deCuongMonHocModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
				deCuongMonHocModel.setGioGui(rs.getString("GioGui"));
				deCuongMonHocModel.setUser1(rs.getString("User1"));
				deCuongMonHocModel.setUser2(rs.getString("User2"));
				deCuongMonHocModel.setUser3(rs.getString("User3"));
				deCuongMonHocModel.setUser4(rs.getString("User4"));
				deCuongMonHocModel.setUser5(rs.getString("User5"));
				deCuongMonHocModel.setTenNguoiTao(rs.getString("NguoiTao"));
				deCuongMonHocModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				deCuongMonHocModel.setKieuBienSoan(rs.getString("KieuBienSoan"));
				deCuongMonHocModel.setStatus(rs.getString("TinhTrangChuongTrinh"));
				deCuongMonHocModel.setMaNguoiTaoChuongTrinh(rs.getString("MaNguoiTaoChuongTrinh"));
				
				ArrayList<NoiDungDCMHModel> noiDungDCMHModelsList = NoiDungDCMHDAO.getAllNoiDungDCMHByMaDeCuong(deCuongMonHocModel.getMaDeCuongMonHoc());
				deCuongMonHocModel.setNoiDungDCMHModelsList(noiDungDCMHModelsList);
			}
			return deCuongMonHocModel;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int duyetDeCuongMonHoc(String maNguoiDuyet, String maDeCuongMonHoc, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.duyetDeCuongMonHocByMaDeCuong"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maDeCuongMonHoc);
			result = preparedStatement.executeUpdate();
			return result;
		}catch(Exception e){e.printStackTrace();}
		return result;
	}	
	
	public static Boolean insertDeCuongMonHoc(DeCuongMonHocModel deCuongMonHocModel) {
		boolean result = false;
		String maDeCuongMonHocNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertDeCuongMonHoc(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.registerOutParameter("Ten",java.sql.Types.NVARCHAR);
			csmt.setNString("Ma_mon_hoc", deCuongMonHocModel.getMaMonHoc());
			csmt.setNString("Ly_thuyet", deCuongMonHocModel.getLyThuyet());
			csmt.setNString("Thuc_hanh", deCuongMonHocModel.getThucHanh());
			csmt.setNString("Kiem_tra", deCuongMonHocModel.getKiemTra());
			csmt.setNString("Tinh_chat_mon_hoc", deCuongMonHocModel.getTinhChatMonHoc());
			csmt.setNString("Vi_tri_mon_hoc", deCuongMonHocModel.getViTriMonHoc());
			csmt.setNString("Muc_tieu_1", deCuongMonHocModel.getMucTieu1());
			csmt.setNString("Muc_tieu_2", deCuongMonHocModel.getMucTieu2());
			csmt.setNString("Muc_tieu_3", deCuongMonHocModel.getMucTieu3());
			csmt.setNString("Muc_tieu_4", deCuongMonHocModel.getMucTieu4());
			csmt.setNString("Dieu_kien_1", deCuongMonHocModel.getDieuKien1());
			csmt.setNString("Dieu_kien_2", deCuongMonHocModel.getDieuKien2());
			csmt.setNString("Dieu_kien_3", deCuongMonHocModel.getDieuKien3());
			csmt.setNString("Dieu_kien_4", deCuongMonHocModel.getDieuKien4());
			csmt.setNString("Phuong_phap_1", deCuongMonHocModel.getPhuongPhap1());
			csmt.setNString("Phuong_phap_2", deCuongMonHocModel.getPhuongPhap2());
			csmt.setNString("Phuong_phap_3", deCuongMonHocModel.getPhuongPhap3());
			csmt.setString("Ngay_tao",deCuongMonHocModel.getNgayTao());
			csmt.setString("Ma_nguoi_tao", deCuongMonHocModel.getMaNguoiTao());
			csmt.setString("Ma_nguoi_duyet", null);
			csmt.setString("Ngay_duyet", null);
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.VARCHAR);
			csmt.setString("Tinh_trang", Constant.TINHTRANG_NEW);
			csmt.setNString("Ly_do_reject", null);
			csmt.setString("So_buoi_hoc_trong_tuan", deCuongMonHocModel.getSoBuoiHocTrongTuan());
			csmt.setString("So_tiet_hoc_mot_buoi", deCuongMonHocModel.getSoTietHocMotBuoi());
			csmt.setString("Ma_chuong_trinh", deCuongMonHocModel.getMaChuongTrinh());
			csmt.setString("Kieu_bien_soan", deCuongMonHocModel.getKieuBienSoan());
			csmt.setNString("Ten_khoa", deCuongMonHocModel.getTenKhoa());
			csmt.setString("Ngay_gui", null);
			csmt.setString("User1", deCuongMonHocModel.getUser1());
			csmt.setString("User2", deCuongMonHocModel.getUser2());
			csmt.setString("User3", deCuongMonHocModel.getUser3());
			csmt.setString("User4", deCuongMonHocModel.getUser4());
			csmt.setString("User5", deCuongMonHocModel.getUser5());
			csmt.registerOutParameter("Ma_nguoi_tao_chuong_trinh", java.sql.Types.VARCHAR);
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				maDeCuongMonHocNew = csmt.getString("ID");
				deCuongMonHocModel.setMaDeCuongMonHoc(maDeCuongMonHocNew);
				deCuongMonHocModel.setTenDeCuongMonHoc(csmt.getNString("Ten"));
				deCuongMonHocModel.setNgayCapNhatCuoi(DateUtil.setDate(csmt.getString("Ngay_cap_nhat_cuoi")));
				deCuongMonHocModel.setMaNguoiTaoChuongTrinh(csmt.getString("Ma_nguoi_tao_chuong_trinh"));
				
				ArrayList<NoiDungDCMHModel> noiDungDCMHModelList = deCuongMonHocModel.getNoiDungDCMHModelsList();
				ArrayList<NoiDungDCMHModel> noiDungDCMHModelListAfterAdded = new ArrayList<NoiDungDCMHModel>();
				
				for (NoiDungDCMHModel obj : noiDungDCMHModelList) {
					obj.setMaDeCuong(maDeCuongMonHocNew);
					if (NoiDungDCMHDAO.insertNoiDungDCMH(obj)) {
						noiDungDCMHModelListAfterAdded.add(obj);
					}
				}
				
				deCuongMonHocModel.setNoiDungDCMHModelsList(noiDungDCMHModelListAfterAdded);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	public static Boolean updateDeCuongMonHoc(DeCuongMonHocModel deCuongMonHocModel) {
		boolean result = false;
		String maDeCuongMonHocNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateDeCuongMonHoc(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", deCuongMonHocModel.getMaDeCuongMonHoc());
			csmt.setNString("Ten", deCuongMonHocModel.getTenDeCuongMonHoc());
			csmt.setString("Ma_mon_hoc", deCuongMonHocModel.getMaMonHoc());
			csmt.setNString("Ly_thuyet", deCuongMonHocModel.getLyThuyet());
			csmt.setNString("Thuc_hanh", deCuongMonHocModel.getThucHanh());
			csmt.setNString("Kiem_tra", deCuongMonHocModel.getKiemTra());
			csmt.setNString("Vi_tri_mon_hoc", deCuongMonHocModel.getViTriMonHoc());
			csmt.setNString("Tinh_chat_mon_hoc", deCuongMonHocModel.getTinhChatMonHoc());
			csmt.setNString("Muc_tieu_1", deCuongMonHocModel.getMucTieu1());
			csmt.setNString("Muc_tieu_2", deCuongMonHocModel.getMucTieu2());
			csmt.setNString("Muc_tieu_3", deCuongMonHocModel.getMucTieu3());
			csmt.setNString("Muc_tieu_4", deCuongMonHocModel.getMucTieu4());
			csmt.setNString("Dieu_kien_1", deCuongMonHocModel.getDieuKien1());
			csmt.setNString("Dieu_kien_2", deCuongMonHocModel.getDieuKien2());
			csmt.setNString("Dieu_kien_3", deCuongMonHocModel.getDieuKien3());
			csmt.setNString("Dieu_kien_4", deCuongMonHocModel.getDieuKien4());
			csmt.setNString("Phuong_phap_1", deCuongMonHocModel.getPhuongPhap1());
			csmt.setNString("Phuong_phap_2", deCuongMonHocModel.getPhuongPhap2());
			csmt.setNString("Phuong_phap_3", deCuongMonHocModel.getPhuongPhap3());
			//csmt.setString("Ngay_tao", DateUtil.setDate(deCuongMonHocModel.getNgayTao()));
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.VARCHAR);
			csmt.setString("Ma_nguoi_tao", deCuongMonHocModel.getMaNguoiTao());
			csmt.setString("Ma_nguoi_duyet", deCuongMonHocModel.getMaNguoiDuyet());
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Tinh_trang", deCuongMonHocModel.getTinhTrang());
			csmt.setNString("Ly_do_reject", null);
			csmt.setString("So_buoi_hoc_trong_tuan", deCuongMonHocModel.getSoBuoiHocTrongTuan());
			csmt.setString("So_tiet_hoc_mot_buoi", deCuongMonHocModel.getSoTietHocMotBuoi());
			csmt.setString("Ma_chuong_trinh", deCuongMonHocModel.getMaChuongTrinh());
			csmt.setString("Kieu_bien_soan", deCuongMonHocModel.getKieuBienSoan());
			csmt.setNString("Ten_khoa", deCuongMonHocModel.getTenKhoa());
			if(deCuongMonHocModel.getNgayGui().equals(""))
				csmt.setString("Ngay_gui", null);
			else
				csmt.setString("Ngay_gui", DateUtil.setDate(deCuongMonHocModel.getNgayGui()) + " " + deCuongMonHocModel.getGioGui());
			csmt.setString("User1", deCuongMonHocModel.getUser1());
			csmt.setString("User2", deCuongMonHocModel.getUser2());
			csmt.setString("User3", deCuongMonHocModel.getUser3());
			csmt.setString("User4", deCuongMonHocModel.getUser4());
			csmt.setString("User5", deCuongMonHocModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Update "KE HOACH DAO TAO" thanh cong				
				deCuongMonHocModel.setNgayCapNhatCuoi(DateUtil.setDate(csmt.getString("Ngay_cap_nhat_cuoi")));
				
				ArrayList<NoiDungDCMHModel> noiDungDCMHModelList = deCuongMonHocModel.getNoiDungDCMHModelsList();
				ArrayList<NoiDungDCMHModel> noiDungDCMHModelListAfterAdded = new ArrayList<NoiDungDCMHModel>();
				for (NoiDungDCMHModel obj : noiDungDCMHModelList) {	
					if (obj.getMaNoiDungDeCuong() != null) { // Cap nhat "Noi dung DCMH" da ton tai
						NoiDungDCMHDAO.updateNoiDungDCMH(obj);
					} else { // Them moi "Noi dung DCMH"
						obj.setMaDeCuong(deCuongMonHocModel.getMaDeCuongMonHoc());
						NoiDungDCMHDAO.insertNoiDungDCMH(obj);
					}
					
					noiDungDCMHModelListAfterAdded.add(obj);
				}
				
				deCuongMonHocModel.setNoiDungDCMHModelsList(noiDungDCMHModelListAfterAdded);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	public static int getCountDeCuongMonHoc(String tinhtrang, String maNguoiTao, String maBoPhan, String maVaiTro, String tenMonHoc) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountDeCuongMonHoc(?,?,?,?,?,?,?)}");
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.setString("Ma_nguoi_tao", maNguoiTao);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
			csmt.setString("Ma_pho_khoa", Constant.PHO_KHOA);
			csmt.setString("Ma_vai_tro", maVaiTro);//quyền trưởng khoa
			csmt.setString("Ten_mon_hoc", tenMonHoc);
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
	public static ArrayList<DeCuongMonHocModel> getDeCuongMonHoc(int totalRows, String currenPage, String tinhTrang, String maNguoiTao, String maBoPhan, String maVaiTro, String tenMonHoc) {
		ArrayList<DeCuongMonHocModel> deCuongMonHocModelsList = new ArrayList<DeCuongMonHocModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetDeCuongMonHoc(?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_nguoi_tao", maNguoiTao);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
			csmt.setString("Ma_pho_khoa", Constant.PHO_KHOA);
			csmt.setString("Ma_vai_tro", maVaiTro);//quyền trưởng khoa
			csmt.setString("Ten_mon_hoc", tenMonHoc);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();
				deCuongMonHocModel.setMaDeCuongMonHoc(rs.getString("MaDeCuongMonHoc"));
				deCuongMonHocModel.setTenDeCuongMonHoc(rs.getString("TenDeCuongMonHoc"));
				deCuongMonHocModel.setTenNguoiTao(rs.getString("TenNguoiTao"));
				deCuongMonHocModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				deCuongMonHocModel.setTinhTrang(rs.getString("TinhTrang"));
				deCuongMonHocModel.setLyDoReject(rs.getString("LyDoReject"));
				deCuongMonHocModel.setStatus(rs.getString("TinhTrangChuongTrinh"));
				
				deCuongMonHocModelsList.add(deCuongMonHocModel);
				
			}
			Constant.CHECK_ROWS = deCuongMonHocModelsList.size(); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return deCuongMonHocModelsList;
	}
	public static Boolean checkMonHocAndChuongTrinh(String maChuongTrinh, String maMonHoc) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_CheckMonHocAndChuongTrinh(?,?,?)}");
			csmt.setString("Ma_chuong_trinh", maChuongTrinh);
			csmt.setString("Ma_mon_hoc", maMonHoc);
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
	public static ArrayList<DeCuongMonHocModel> getAllDeCuongMonHocApproved() {
		ArrayList<DeCuongMonHocModel> deCuongMonHocModelList = new ArrayList<DeCuongMonHocModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllDeCuongMonHocApproved"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();
				deCuongMonHocModel.setMaDeCuongMonHoc(rs.getString("MaDeCuongMonHoc"));
				deCuongMonHocModel.setTenDeCuongMonHoc(rs.getString("TenDeCuongMonHoc"));
				deCuongMonHocModel.setSoTietHocMotBuoi(rs.getString("SoTiet"));
				deCuongMonHocModel.setSoBuoiHocTrongTuan(rs.getString("SoBuoi"));
				deCuongMonHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				deCuongMonHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				deCuongMonHocModel.setLyThuyet(rs.getString("LyThuyet"));
				deCuongMonHocModel.setThucHanh(rs.getString("ThucHanh"));
				deCuongMonHocModel.setKiemTra(rs.getString("KiemTra"));
				deCuongMonHocModel.setViTriMonHoc(rs.getString("ViTriMonHoc"));
				deCuongMonHocModel.setTinhChatMonHoc(rs.getString("TinhChatMonHoc"));
				deCuongMonHocModel.setMucTieu1(rs.getString("MucTieu1"));
				deCuongMonHocModel.setMucTieu2(rs.getString("MucTieu2"));
				deCuongMonHocModel.setMucTieu3(rs.getString("MucTieu3"));
				deCuongMonHocModel.setMucTieu4(rs.getString("MucTieu4"));
				deCuongMonHocModel.setDieuKien1(rs.getString("DieuKien1"));
				deCuongMonHocModel.setDieuKien2(rs.getString("DieuKien2"));
				deCuongMonHocModel.setDieuKien3(rs.getString("DieuKien3"));
				deCuongMonHocModel.setDieuKien4(rs.getString("DieuKien4"));
				deCuongMonHocModel.setPhuongPhap1(rs.getString("PhuongPhap1"));
				deCuongMonHocModel.setPhuongPhap2(rs.getString("PhuongPhap2"));
				deCuongMonHocModel.setPhuongPhap3(rs.getString("PhuongPhap3"));
				deCuongMonHocModel.setNgayTao(rs.getString("NgayTao"));
				deCuongMonHocModel.setGioTao(rs.getString("GioTao"));
				deCuongMonHocModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				deCuongMonHocModel.setGioCapNhatCuoi(rs.getString("GioCapNhatCuoi"));
				deCuongMonHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				deCuongMonHocModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				deCuongMonHocModel.setNgayDuyet(DateUtil.setDate(rs.getString("NgayDuyet")));
				deCuongMonHocModel.setGioDuyet(rs.getString("GioDuyet"));
				deCuongMonHocModel.setTinhTrang(rs.getString("TinhTrang"));
				deCuongMonHocModel.setLyDoReject(rs.getString("LyDoReject"));
				deCuongMonHocModel.setTenKhoa(rs.getString("TenKhoa"));
				deCuongMonHocModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
				deCuongMonHocModel.setMaChuongTrinh(rs.getString("MaChuongTrinh"));
				deCuongMonHocModel.setUser1(rs.getString("User1"));
				deCuongMonHocModel.setUser2(rs.getString("User2"));
				deCuongMonHocModel.setUser3(rs.getString("User3"));
				deCuongMonHocModel.setUser4(rs.getString("User4"));
				deCuongMonHocModel.setUser5(rs.getString("User5"));
				deCuongMonHocModel.setTenNguoiTao(rs.getString("NguoiTao"));
				deCuongMonHocModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				deCuongMonHocModel.setKieuBienSoan(rs.getString("KieuBienSoan"));
				deCuongMonHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				deCuongMonHocModelList.add(deCuongMonHocModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deCuongMonHocModelList;
	}
	
	public static ArrayList<DeCuongMonHocModel> getAllDeCuongMonHocApprovedByMaChuongTrinh(String maChuongTrinh, String hocKi) {
		ArrayList<DeCuongMonHocModel> deCuongMonHocModelList = new ArrayList<DeCuongMonHocModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllDeCuongMonHocApprovedByMaChuongTrinh"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			preparedStatement.setString(2, maChuongTrinh);
			//preparedStatement.setString(3, hocKi);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();
				deCuongMonHocModel.setMaDeCuongMonHoc(rs.getString("MaDeCuongMonHoc"));
				deCuongMonHocModel.setTenDeCuongMonHoc(rs.getString("TenDeCuongMonHoc"));
				deCuongMonHocModel.setLyThuyet(rs.getString("LyThuyet"));
				deCuongMonHocModel.setThucHanh(rs.getString("ThucHanh"));
				deCuongMonHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				deCuongMonHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				deCuongMonHocModel.setKiemTra(rs.getString("KiemTra"));
				deCuongMonHocModel.setKieuBienSoan(rs.getString("KieuBienSoan"));
				deCuongMonHocModel.setSoTietHocMotBuoi(rs.getString("SoTiet"));
				deCuongMonHocModel.setLyThuyetCTMH(rs.getString("LyThuyetCTMH"));
				deCuongMonHocModel.setThucHanhCTMH(rs.getString("ThucHanhCTMH"));
				deCuongMonHocModelList.add(deCuongMonHocModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deCuongMonHocModelList;
	}
	public static String getSoDongByMaChuongTrinh(String maChuongTrinh) {
		String result = "";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getSoDongByMaChuongTrinh"));
			preparedStatement.setString(1, maChuongTrinh);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				result = (String) rs.getString("SoDong");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return result;
	}
	
	public static ArrayList<DeCuongMonHocModel> getAllDeCuongMonHocByThoiKhoaBieu(String malop) {
		ArrayList<DeCuongMonHocModel> deCuongMonHocModelList = new ArrayList<DeCuongMonHocModel>();		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetDeCuongMonHocByThoiKhoaBieu(?,?)}");
			csmt.setString("malop", malop);
			csmt.setString("tinhtrang", Constant.TINHTRANG_APPROVE);
			ResultSet rs = DataUtil.executeStore(csmt);
			while (rs.next()) {
				DeCuongMonHocModel deCuongMonHocModel = new DeCuongMonHocModel();
				deCuongMonHocModel.setMaDeCuongMonHoc(rs.getString("MaDeCuongMonHoc"));
				deCuongMonHocModel.setTenDeCuongMonHoc(rs.getString("TenDeCuongMonHoc"));
				deCuongMonHocModel.setSoTietHocMotBuoi(rs.getString("SoTiet"));
				deCuongMonHocModel.setSoBuoiHocTrongTuan(rs.getString("SoBuoi"));
				deCuongMonHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				deCuongMonHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				deCuongMonHocModel.setLyThuyet(rs.getString("LyThuyet"));
				deCuongMonHocModel.setThucHanh(rs.getString("ThucHanh"));
				deCuongMonHocModel.setKiemTra(rs.getString("KiemTra"));
				deCuongMonHocModel.setViTriMonHoc(rs.getString("ViTriMonHoc"));
				deCuongMonHocModel.setTinhChatMonHoc(rs.getString("TinhChatMonHoc"));
				deCuongMonHocModel.setMucTieu1(rs.getString("MucTieu1"));
				deCuongMonHocModel.setMucTieu2(rs.getString("MucTieu2"));
				deCuongMonHocModel.setMucTieu3(rs.getString("MucTieu3"));
				deCuongMonHocModel.setMucTieu4(rs.getString("MucTieu4"));
				deCuongMonHocModel.setDieuKien1(rs.getString("DieuKien1"));
				deCuongMonHocModel.setDieuKien2(rs.getString("DieuKien2"));
				deCuongMonHocModel.setDieuKien3(rs.getString("DieuKien3"));
				deCuongMonHocModel.setDieuKien4(rs.getString("DieuKien4"));
				deCuongMonHocModel.setPhuongPhap1(rs.getString("PhuongPhap1"));
				deCuongMonHocModel.setPhuongPhap2(rs.getString("PhuongPhap2"));
				deCuongMonHocModel.setPhuongPhap3(rs.getString("PhuongPhap3"));
				deCuongMonHocModel.setNgayTao(rs.getString("NgayTao"));
				deCuongMonHocModel.setGioTao(rs.getString("GioTao"));
				deCuongMonHocModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				deCuongMonHocModel.setGioCapNhatCuoi(DateUtil.setDate(rs.getString("GioCapNhatCuoi")));
				deCuongMonHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				deCuongMonHocModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				deCuongMonHocModel.setNgayDuyet(DateUtil.setDate(rs.getString("NgayDuyet")));
				deCuongMonHocModel.setGioDuyet(rs.getString("GioDuyet"));
				deCuongMonHocModel.setTinhTrang(rs.getString("TinhTrang"));
				deCuongMonHocModel.setLyDoReject(rs.getString("LyDoReject"));
				deCuongMonHocModel.setTenKhoa(rs.getString("TenKhoa"));
				deCuongMonHocModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
				deCuongMonHocModel.setUser1(rs.getString("User1"));
				deCuongMonHocModel.setUser2(rs.getString("User2"));
				deCuongMonHocModel.setUser3(rs.getString("User3"));
				deCuongMonHocModel.setUser4(rs.getString("User4"));
				deCuongMonHocModel.setUser5(rs.getString("User5"));
				deCuongMonHocModel.setTenNguoiTao(rs.getString("NguoiTao"));
				deCuongMonHocModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				deCuongMonHocModel.setKieuBienSoan(rs.getString("KieuBienSoan"));
				deCuongMonHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				deCuongMonHocModelList.add(deCuongMonHocModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deCuongMonHocModelList;
	}
	public static Boolean deleteDCMH(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteDCMH(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static DeCuongMonHocModel getDCMHApproveByMaCTDTAndMaMonHoc(String maCTDT,String maMonHoc) {
		DeCuongMonHocModel deCuongMonHocModel=new DeCuongMonHocModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getDCMHApproveByMaCTDTAndMaMonHoc"));
			preparedStatement.setString(1,maMonHoc);
			
			preparedStatement.setString(2,maCTDT);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				deCuongMonHocModel.setMaDeCuongMonHoc(rs.getString("MaDeCuongMonHoc"));
				deCuongMonHocModel.setTenDeCuongMonHoc(rs.getString("TenDeCuongMonHoc"));
				deCuongMonHocModel.setSoTietHocMotBuoi(rs.getString("SoTiet"));
				deCuongMonHocModel.setSoBuoiHocTrongTuan(rs.getString("SoBuoi"));
				deCuongMonHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				deCuongMonHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				deCuongMonHocModel.setLyThuyet(rs.getString("LyThuyet"));
				deCuongMonHocModel.setThucHanh(rs.getString("ThucHanh"));
				deCuongMonHocModel.setKiemTra(rs.getString("KiemTra"));
				deCuongMonHocModel.setViTriMonHoc(rs.getString("ViTriMonHoc"));
				deCuongMonHocModel.setTinhChatMonHoc(rs.getString("TinhChatMonHoc"));
				deCuongMonHocModel.setMucTieu1(rs.getString("MucTieu1"));
				deCuongMonHocModel.setMucTieu2(rs.getString("MucTieu2"));
				deCuongMonHocModel.setMucTieu3(rs.getString("MucTieu3"));
				deCuongMonHocModel.setMucTieu4(rs.getString("MucTieu4"));
				deCuongMonHocModel.setDieuKien1(rs.getString("DieuKien1"));
				deCuongMonHocModel.setDieuKien2(rs.getString("DieuKien2"));
				deCuongMonHocModel.setDieuKien3(rs.getString("DieuKien3"));
				deCuongMonHocModel.setDieuKien4(rs.getString("DieuKien4"));
				deCuongMonHocModel.setPhuongPhap1(rs.getString("PhuongPhap1"));
				deCuongMonHocModel.setPhuongPhap2(rs.getString("PhuongPhap2"));
				deCuongMonHocModel.setPhuongPhap3(rs.getString("PhuongPhap3"));
				deCuongMonHocModel.setNgayTao(rs.getString("NgayTao"));
				deCuongMonHocModel.setGioTao(rs.getString("GioTao"));
				deCuongMonHocModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				deCuongMonHocModel.setGioCapNhatCuoi(rs.getString("GioCapNhatCuoi"));
				deCuongMonHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				deCuongMonHocModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				deCuongMonHocModel.setNgayDuyet(DateUtil.setDate(rs.getString("NgayDuyet")));
				deCuongMonHocModel.setGioDuyet(rs.getString("GioDuyet"));
				deCuongMonHocModel.setTinhTrang(rs.getString("TinhTrang"));
				deCuongMonHocModel.setLyDoReject(rs.getString("LyDoReject"));
				deCuongMonHocModel.setTenKhoa(rs.getString("TenKhoa"));
				deCuongMonHocModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
				deCuongMonHocModel.setMaChuongTrinh(rs.getString("MaChuongTrinh"));
				deCuongMonHocModel.setUser1(rs.getString("User1"));
				deCuongMonHocModel.setUser2(rs.getString("User2"));
				deCuongMonHocModel.setUser3(rs.getString("User3"));
				deCuongMonHocModel.setUser4(rs.getString("User4"));
				deCuongMonHocModel.setUser5(rs.getString("User5"));
				deCuongMonHocModel.setTenNguoiTao(rs.getString("NguoiTao"));
				deCuongMonHocModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				deCuongMonHocModel.setKieuBienSoan(rs.getString("KieuBienSoan"));
				deCuongMonHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return deCuongMonHocModel;
	}
	
}
