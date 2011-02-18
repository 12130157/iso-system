package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
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
	
	
	public static ArrayList<ThietBiModel> getAllThietBiByPhongAndLoaiTB(String maPhongBan, String maLoaiThietBi) {
		ArrayList<ThietBiModel> thietBiModelList = new ArrayList<ThietBiModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_getThietBiByPhongAndLoaiTB(?,?)}");
	
			csmt.setString("MaPhongBan", maPhongBan);
			csmt.setString("MaLoaiThietBi", maLoaiThietBi);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				ThietBiModel thietBiModel = new ThietBiModel();
				
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaTinhTrang(rs.getString("MaTinhTrang"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				
				thietBiModelList.add(thietBiModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return thietBiModelList;
	}
	
	/*update chi tiet thiet bi*/
	public static Boolean updateChiTietThietBi(ChiTietThietBiModel chiTietThietBiModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_UpdateThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			csmt.setString("id", chiTietThietBiModel.getMaThietBi());
			csmt.setNString("Ten_thiet_bi", StringUtil.toUTF8(chiTietThietBiModel.getTenThietBi()));
			csmt.setString("Ma_don_vi_tan_suat", chiTietThietBiModel.getTenDonViTanSuat());
			csmt.setNString("Ten_linh_kien", StringUtil.toUTF8(chiTietThietBiModel.getTenLinhKien()));
			csmt.setString("Dung_luong", StringUtil.toUTF8(chiTietThietBiModel.getDungLuong()));
			
			csmt.setNString("Ki_hieu", StringUtil.toUTF8(chiTietThietBiModel.getKiHieu()));
			csmt.setString("So_may", chiTietThietBiModel.getSoMay());
			csmt.setString("Ngay_san_xuat", chiTietThietBiModel.getNgaySanXuat());
			csmt.setString("Ma_tinh_trang", chiTietThietBiModel.getTenTinhTrang());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietThietBiModel.getNgayCapNhatCuoi());
			
			csmt.setString("Gia_mua", StringUtil.toUTF8(chiTietThietBiModel.getGiaMua()));
			csmt.setString("Ngay_mua", chiTietThietBiModel.getNgayMua());
			csmt.setNString("Tan_Suat_Toi_Da", StringUtil.toUTF8(chiTietThietBiModel.getTanSuatToiDa()));
			csmt.setString("Ngay_bat_dau_su_dung", chiTietThietBiModel.getNgayBatDauSuDung());
			csmt.setNString("Tan_suat_su_dung", StringUtil.toUTF8(chiTietThietBiModel.getTanSuatSuDung()));
			
			csmt.setString("So_lan_su_dung", chiTietThietBiModel.getSoLanSuDung());
			csmt.setNString("Phu_kien", StringUtil.toUTF8(chiTietThietBiModel.getPhuKien()));
			csmt.setString("So_Lan_Bao_Tri", chiTietThietBiModel.getSoLanBaoTri());
			csmt.setString("Ngay_bao_hanh", chiTietThietBiModel.getNgayBaoHanh());
			csmt.setString("Nguyen_tac_su_dung", StringUtil.toUTF8(chiTietThietBiModel.getNguyenTacSuDung()));
			
			csmt.setNString("Dac_tinh_ky_thuat", StringUtil.toUTF8(chiTietThietBiModel.getDacTinhKyThuat()));
			csmt.setString("Ma_loai", chiTietThietBiModel.getTenLoaiThietBi());
			csmt.setString("Ma_phong", chiTietThietBiModel.getTenPhongBan());
			csmt.setString("Ma_bo_phan", chiTietThietBiModel.getTenBoPhan());//chua update duoc
			csmt.setString("Ma_nha_cung_cap", chiTietThietBiModel.getTenNhaCungCap());
			
			csmt.setString("Ma_don_vi_tinh", chiTietThietBiModel.getTenDonViTinh());
			csmt.setString("Ma_nguoi_tao", chiTietThietBiModel.getTenThanhVien());
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update thiet bi thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}						
		return result;
	}
	
	public static ArrayList<ChiTietThietBiModel> searchAllKhoa() {
		ArrayList<ChiTietThietBiModel> listKetQua = new ArrayList<ChiTietThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllKhoaTrungTam"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietThietBiModel chiTietThietBiModel = new ChiTietThietBiModel();
				chiTietThietBiModel.setMaKhoa(rs.getString("MaKhoa"));
				chiTietThietBiModel.setTenKhoa(rs.getString("TenKhoa"));

				listKetQua.add(chiTietThietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
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
}
