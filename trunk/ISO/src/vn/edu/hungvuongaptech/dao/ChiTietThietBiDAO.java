package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel;
import vn.edu.hungvuongaptech.model.PhongBanModel;
import vn.edu.hungvuongaptech.model.SysRoleMenuModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.TinhTrangThietBiModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ChiTietThietBiDAO {
	
	public static ArrayList<ThanhVienModel> timAllThanhVienByMaKhoa() {
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllThanhVien"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				thanhVienModel.setMaBoPhan(rs.getString("MaKhoa"));
				thanhVienModel.setTenBoPhan(rs.getString("TenKhoa"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));

				listKetQua.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<ThanhVienModel> getAllThanhVienMuonThietBi(String maKhoa) {
		ArrayList<ThanhVienModel> thanhVienModelList = new ArrayList<ThanhVienModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getThanhVienByMaKhoa"));						
			preparedStatement.setNString(1,maKhoa);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				thanhVienModel.setMaBoPhan(rs.getString("MaKhoa"));
				thanhVienModel.setTenBoPhan(rs.getString("TenKhoa"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				
				thanhVienModelList.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thanhVienModelList;
	}
	public static Boolean insertChiTietThietBi(ChiTietThietBiModel chiTietThietBi) { // Thêm chi tiết thiết bị
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertChiTietThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ten_linh_kien",chiTietThietBi.getTenChiTietThietBi());
			csmt.setString("Ma_loai_linh_kien",chiTietThietBi.getMaLoaiChiTietThietBi());
			csmt.setString("Ki_hieu",chiTietThietBi.getKiHieu());
			csmt.setString("Ma_tinh_trang",chiTietThietBi.getMaTinhTrang());
			csmt.setNString("Ghi_chu",chiTietThietBi.getGhiChu());
			csmt.setString("Ma_nguoi_tao",chiTietThietBi.getMaNguoiTao());
			csmt.setString("Ma_nha_cung_cap",chiTietThietBi.getMaNhaCungCap());
			csmt.setString("Ngay_san_xuat",chiTietThietBi.getNgaySanXuat());
			csmt.setString("Ngay_mua",chiTietThietBi.getNgayMua());			
			csmt.setString("Han_bao_hanh",chiTietThietBi.getHanBaoHanh());
			csmt.setString("Ngay_bat_dau_su_dung",chiTietThietBi.getNgayBatDauSuDung());
			csmt.setString("Tan_suat_toi_da",chiTietThietBi.getTanSuatToiDa());
			csmt.setString("Gia_mua",chiTietThietBi.getGiaMua());
			csmt.setNString("Dac_tinh_ky_thuat",chiTietThietBi.getDacTinhKyThuat());
			csmt.setNString("Nguyen_tac_su_dung",chiTietThietBi.getNguyenTacSuDung());
			csmt.setString("So_lan_su_dung", "0");
			csmt.setString("So_lan_bao_tri", "0");
			csmt.setString("Ma_tan_suat", chiTietThietBi.getMaTanSuat());
			csmt.setString("Tan_suat_su_dung", chiTietThietBi.getTanSuatSuDung());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1",chiTietThietBi.getUser1());
			csmt.setString("User2",chiTietThietBi.getUser2());
			csmt.setString("User3",chiTietThietBi.getUser3());
			csmt.setString("User4",chiTietThietBi.getUser4());
			csmt.setString("User5",chiTietThietBi.getUser5());
			
			csmt.setString("Ma_thiet_bi", chiTietThietBi.getMaThietBi());
			csmt.setString("Ma_bo_phan",chiTietThietBi.getMaBoPhan());
			csmt.setString("Ma_phong",chiTietThietBi.getMaPhongBan());
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				String maChiTietThietBi = csmt.getString("ID");
				chiTietThietBi.setMaChiTietThietBi(maChiTietThietBi);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	public static Boolean updateChiTietThietBi(ChiTietThietBiModel chiTietThietBi) { // Cập nhật chi tiết thiết bị
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_UpdateChiTietThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", chiTietThietBi.getMaChiTietThietBi());
			csmt.setNString("Ten_linh_kien",chiTietThietBi.getTenChiTietThietBi());
			csmt.setString("Ma_loai_linh_kien",chiTietThietBi.getMaLoaiChiTietThietBi());
			csmt.setString("Ki_hieu",chiTietThietBi.getKiHieu());
			csmt.setString("Ma_tinh_trang",chiTietThietBi.getMaTinhTrang());
			csmt.setNString("Ghi_chu",chiTietThietBi.getGhiChu());
			csmt.setString("Ma_nguoi_tao",chiTietThietBi.getMaNguoiTao());
			csmt.setString("Ma_nha_cung_cap",chiTietThietBi.getMaNhaCungCap());
			csmt.setString("Ngay_san_xuat",chiTietThietBi.getNgaySanXuat());
			csmt.setString("Ngay_mua",chiTietThietBi.getNgayMua());			
			csmt.setString("Han_bao_hanh",chiTietThietBi.getHanBaoHanh());
			csmt.setString("Ngay_bat_dau_su_dung",chiTietThietBi.getNgayBatDauSuDung());
			csmt.setString("Tan_suat_toi_da",chiTietThietBi.getTanSuatToiDa());
			csmt.setString("Gia_mua",chiTietThietBi.getGiaMua());
			csmt.setNString("Dac_tinh_ky_thuat",chiTietThietBi.getDacTinhKyThuat());
			csmt.setNString("Nguyen_tac_su_dung",chiTietThietBi.getNguyenTacSuDung());
			csmt.setString("So_lan_su_dung", "0");
			csmt.setString("So_lan_bao_tri", "0");
			csmt.setString("Ma_tan_suat", chiTietThietBi.getMaTanSuat());
			csmt.setString("Tan_suat_su_dung", chiTietThietBi.getTanSuatSuDung());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1",chiTietThietBi.getUser1());
			csmt.setString("User2",chiTietThietBi.getUser2());
			csmt.setString("User3",chiTietThietBi.getUser3());
			csmt.setString("User4",chiTietThietBi.getUser4());
			csmt.setString("User5",chiTietThietBi.getUser5());
			result = DataUtil.executeNonStore(csmt);
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	public static Boolean deleteChiTietThietBiByID(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteChiTietThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static ChiTietThietBiModel getLinhKienByID(String id) {
		ChiTietThietBiModel linhKien = new ChiTietThietBiModel();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getLinhKienByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				linhKien.setMaChiTietThietBi(rs.getString("MaChiTietThietBi"));
				linhKien.setMaThietBi(rs.getString("MaThietBi"));
				linhKien.setTenThietBi(rs.getNString("TenThietBi"));
				linhKien.setKiHieuThietBi(rs.getString("KiHieuThietBi"));
				linhKien.setTenChiTietThietBi(rs.getString("TenLinhKien"));
				linhKien.setMaBoPhan(rs.getString("MaBoPhan"));
				linhKien.setKiHieu(rs.getString("KiHieu"));
				linhKien.setMaLoaiChiTietThietBi(rs.getString("MaLoailinhKien"));
				linhKien.setMaPhongBan(rs.getString("MaPhong"));
				linhKien.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
				linhKien.setNgaySanXuat(rs.getString("NgaySanXuat"));
				linhKien.setNgayMua(rs.getString("NgayMua"));
				linhKien.setHanBaoHanh(rs.getString("HanBaoHanh"));
				linhKien.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
				linhKien.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				linhKien.setGiaMua(rs.getString("GiaMua"));
				linhKien.setNguyenTacSuDung(rs.getString("NguyenTacSuDung"));
				linhKien.setDacTinhKyThuat(rs.getNString("DacTinhKyThuat"));
				linhKien.setSoLanSuDung(rs.getString("SoLanSuDung"));
				linhKien.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				linhKien.setGhiChu(rs.getString("GhiChu"));
				linhKien.setMaNguoiTao(rs.getString("MaNguoiTao"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return linhKien;
	}
	public static int getCountChiTietThietBi(String loaiLinhKien, String phongBan, String tinhTrang, String tenLinhKien) {
		int count = 0;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetCountChiTietThietBi(?,?,?,?)}");
			
			csmt.setString("Loai_linh_kien",loaiLinhKien);
			csmt.setString("Phong_ban", phongBan);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setNString("Ten_linh_kien", tenLinhKien);
			
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return count;
	}
	public static ArrayList<ChiTietThietBiModel> getAllChiTietThietBiByDieuKien(String loaiLinhKien, String phongBan, String tinhTrang, 
					int count, String currentPage, String tenLinhKien) {
		ArrayList<ChiTietThietBiModel> linhKienList = new ArrayList<ChiTietThietBiModel>();		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetChiTietThietBiByDieuKien(?,?,?,?,?,?,?)}");
			
			csmt.setString("Loai_thiet_bi",loaiLinhKien);
			csmt.setString("Phong_ban", phongBan);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Num_row", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("Total_row", count + "");
			csmt.setString("CurrentPage", currentPage);
			csmt.setNString("Ten_thiet_bi", tenLinhKien);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next()) {
				ChiTietThietBiModel linhKien = new ChiTietThietBiModel();
				linhKien.setMaChiTietThietBi(rs.getString("MaLinhKien"));
				linhKien.setTenThietBi(rs.getNString("tenLinhKien"));
				linhKien.setKiHieu(rs.getString("KiHieu"));
				linhKien.setTenLoaiChiTietThietBi(rs.getNString("LoaiLinhKien"));
				linhKien.setTenTinhTrang(rs.getNString("TenTinhTrang"));
				linhKien.setMaTinhTrang(rs.getString("MaTinhTrang"));
				linhKienList.add(linhKien);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return linhKienList;
	}
	public static boolean thayDoiChiTietThietBiByID(String maLinhKien) {
		boolean result = false;		
			try {
		CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_QLTB_ThayDoiChiTietThietBiByID(?)}");
		
		csmt.setString("Ma_linh_kien",maLinhKien);
		result = DataUtil.executeNonStore(csmt);
		
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return result;
	}
}
