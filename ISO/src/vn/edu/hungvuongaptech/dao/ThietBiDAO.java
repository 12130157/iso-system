package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.runner.Request;

import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.TinhTrangThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ThietBiDAO {
	
	
	
	public static Boolean insertThietBi(ThietBiModel thietBiModel){
		Boolean result=false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ten",thietBiModel.getTenThietBi());
			csmt.setString("Ma_loai",thietBiModel.getMaLoaiThietBi());
			csmt.setString("Ki_hieu",thietBiModel.getKiHieu());
			csmt.setString("Ma_tinh_trang", Constant.TINHTRANGTHIETBIRANH);
			csmt.setNString("Ghi_chu",thietBiModel.getGhiChu());
			csmt.setString("Ma_nguoi_tao",thietBiModel.getMaNguoiTao());
			csmt.setString("Ma_nha_cung_cap",thietBiModel.getMaNhaCungCap());
			csmt.setString("Ngay_san_xuat",thietBiModel.getNgaySanXuat());
			csmt.setString("Ngay_mua",thietBiModel.getNgayMua());			
			csmt.setString("Han_bao_hanh",thietBiModel.getHanBaoHanh());
			csmt.setString("Ngay_bat_dau_su_dung",thietBiModel.getNgayBatDauSuDung());
			csmt.setString("Tan_suat_toi_da",thietBiModel.getTanSuatToiDa());
			csmt.setString("Gia_mua",thietBiModel.getGiaMua());
			csmt.setNString("Dac_tinh_ky_thuat",thietBiModel.getDacTinhKyThuat());
			csmt.setNString("Nguyen_tac_su_dung",thietBiModel.getNguyenTacSuDung());
			csmt.setString("So_lan_su_dung", "0");
			csmt.setString("So_lan_bao_tri", "0");
			csmt.setString("Ma_tan_suat", thietBiModel.getMaTanSuat());
			csmt.setString("Tan_suat_su_dung", thietBiModel.getTanSuatSuDung());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1",thietBiModel.getUser1());
			csmt.setString("User2",thietBiModel.getUser2());
			csmt.setString("User3",thietBiModel.getUser3());
			csmt.setString("User4",thietBiModel.getUser4());
			csmt.setString("User5",thietBiModel.getUser5());
			
			csmt.setString("Ma_bo_phan",thietBiModel.getMaBoPhan());
			csmt.setString("Ma_phong",thietBiModel.getMaPhongBan());
			
			result = DataUtil.executeNonStore(csmt);
			if(result){
				thietBiModel.setMaThietBi(csmt.getString("ID"));
				//String maxID = csmt.getString("MaThietBi");
				/*ArrayList<ChiTietThietBiModel> chiTietThietBiList=thietBiModel.getChiTietThietBiList();
				ArrayList<ChiTietThietBiModel> chiTietThietBiListAfterInserted = new ArrayList<ChiTietThietBiModel>();
				int size=chiTietThietBiList.size();
				
				for(int j=0;j<size;j++){
					ChiTietThietBiModel chiTietThietBi = chiTietThietBiList.get(j);
					chiTietThietBi.setMaThietBi(thietBiModel.getMaThietBi());
					if(ChiTietThietBiDAO.insertChiTietThietBi(chiTietThietBiList.get(j))) {
						chiTietThietBiListAfterInserted.add(chiTietThietBi);
					} else
						result = false;
				}
				//if(result == true)
					thietBiModel.setChiTietThietBiList(chiTietThietBiListAfterInserted);*/
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return result;
	}
	
	public static Boolean updateThietBi(ThietBiModel thietBiModel) { // Cập nhật thiết bị
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_UpdateThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			csmt.setString("ID", thietBiModel.getMaThietBi());
			csmt.setNString("Ten",thietBiModel.getTenThietBi());
			csmt.setString("Ma_loai",thietBiModel.getMaLoaiThietBi());
			csmt.setString("Ki_hieu",thietBiModel.getKiHieu());
			csmt.setString("Ma_tinh_trang",thietBiModel.getMaTinhTrang());
			csmt.setNString("Ghi_chu",thietBiModel.getGhiChu());
			csmt.setString("Ma_nguoi_tao",thietBiModel.getMaNguoiTao());
			csmt.setString("Ma_nha_cung_cap",thietBiModel.getMaNhaCungCap());
			csmt.setString("Ngay_san_xuat",thietBiModel.getNgaySanXuat());
			csmt.setString("Ngay_mua",thietBiModel.getNgayMua());			
			csmt.setString("Han_bao_hanh",thietBiModel.getHanBaoHanh());
			csmt.setString("Ngay_bat_dau_su_dung",thietBiModel.getNgayBatDauSuDung());
			csmt.setString("Tan_suat_toi_da",thietBiModel.getTanSuatToiDa());
			csmt.setString("Gia_mua",thietBiModel.getGiaMua());
			csmt.setNString("Dac_tinh_ky_thuat",thietBiModel.getDacTinhKyThuat());
			csmt.setNString("Nguyen_tac_su_dung",thietBiModel.getNguyenTacSuDung());
			csmt.setString("So_lan_su_dung", thietBiModel.getSoLanSuDung());
			csmt.setString("So_lan_bao_tri", thietBiModel.getSoLanBaoTri());
			csmt.setString("Ma_tan_suat", thietBiModel.getMaTanSuat());
			csmt.setString("Tan_suat_su_dung", thietBiModel.getTanSuatSuDung());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1",thietBiModel.getUser1());
			csmt.setString("User2",thietBiModel.getUser2());
			csmt.setString("User3",thietBiModel.getUser3());
			csmt.setString("User4",thietBiModel.getUser4());
			csmt.setString("User5",thietBiModel.getUser5());
			result = DataUtil.executeNonStore(csmt);								
			/*if (result) { // Update thiet bi thanh cong
				ArrayList<ChiTietThietBiModel> chiTietThietBiList=thietBiModel.getChiTietThietBiList();
				ArrayList<ChiTietThietBiModel> chiTietThietBiListAfterUpdated = new ArrayList<ChiTietThietBiModel>();
				int size=chiTietThietBiList.size();
				
				for(int j=0;j<size;j++){
					ChiTietThietBiModel chiTietThietBi = chiTietThietBiList.get(j);
					if(chiTietThietBi.getMaChiTietThietBi() != null) {
						if(!ChiTietThietBiDAO.updateChiTietThietBi(chiTietThietBi));
							result = false;
					} else {
						chiTietThietBi.setMaThietBi(thietBiModel.getMaThietBi());
						if(ChiTietThietBiDAO.insertChiTietThietBi(chiTietThietBiList.get(j))) {
							chiTietThietBiListAfterUpdated.add(chiTietThietBi);
						} else
							result = false;
					}
				}
				//if(result == true)
					thietBiModel.setChiTietThietBiList(chiTietThietBiListAfterUpdated);
			}*/
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}						
		return result;
	}
	
	public static Boolean deleteThietBi(String maThietBi) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_DeleteThietBi(?)}");
			
			csmt.setString("ID",maThietBi);
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return result;
	}
	public static int getCountThietBi(String loaiThietBi, String phongBan, String tinhTrang, String tenThietBi) {
		int count = 0;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetCountThietBi(?,?,?,?)}");
			
			csmt.setString("Loai_thiet_bi",loaiThietBi);
			csmt.setString("Phong_ban", phongBan);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setNString("Ten_thiet_bi", tenThietBi);
			
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return count;
	}
	public static ArrayList<ThietBiModel> getAllThietBiByDieuKien(String loaiThietBi, String phongBan, String tinhTrang, 
					int count, String currentPage, String tenThietBi, String choice) {
		ArrayList<ThietBiModel> thietBiList = new ArrayList<ThietBiModel>();		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetThietBiByDieuKien(?,?,?,?,?,?,?,?)}");
			
			csmt.setString("Loai_thiet_bi",loaiThietBi);
			csmt.setString("Phong_ban", phongBan);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Num_row", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("Total_row", count + "");
			csmt.setString("CurrentPage", currentPage);
			csmt.setNString("Ten_thiet_bi", tenThietBi);
			csmt.setString("Choice", choice);
			ResultSet rs = DataUtil.executeStore(csmt);
			ThietBiModel thietBi = new ThietBiModel();
			if(choice.equals("1")) {
				while(rs.next()) {
					thietBi = new ThietBiModel();
					thietBi.setMaThietBi(rs.getString("MaThietBi"));
					thietBi.setTenThietBi(rs.getNString("tenThietBi"));
					thietBi.setKiHieu(rs.getString("KiHieu"));
					thietBi.setTenLoaiThietBi(rs.getNString("LoaiThietBi"));
					thietBi.setTenTinhTrang(rs.getNString("TenTinhTrang"));
					thietBi.setMaTinhTrang(rs.getString("MaTinhTrang"));
					thietBi.setTenPhongBan(rs.getNString("KiHieuPhong"));
					thietBiList.add(thietBi);
				}
			}
			else {
				String maThietBi = "na";
				while(rs.next()) {
					if(!maThietBi.equals(rs.getString("MaThietBi"))) {
						thietBi = new ThietBiModel();
						thietBi.setMaThietBi(rs.getString("MaThietBi"));
						thietBi.setTenThietBi(rs.getNString("tenThietBi"));
						thietBi.setKiHieu(rs.getString("KiHieu"));
						thietBi.setTenLoaiThietBi(rs.getNString("LoaiThietBi"));
						thietBi.setTenTinhTrang(rs.getNString("TenTinhTrang"));
						thietBi.setMaTinhTrang(rs.getString("MaTinhTrang"));
						thietBi.setTenPhongBan(rs.getNString("KiHieuPhong"));
						if(Integer.parseInt(rs.getString("SoLanSuDungThietBi")) > 0 || !(thietBi.getMaTinhTrang().equals(Constant.TINHTRANGTHIETBIRANH)))
							thietBi.setTinhTrangDuocXoa("2");
						else	
							thietBi.setTinhTrangDuocXoa("1");
						maThietBi = thietBi.getMaThietBi();
						thietBiList.add(thietBi);
					}
					if(rs.getString("MaChiTietThietBi") != null) {
						if(Integer.parseInt(rs.getString("SoLanSuDungChiTiet")) > 0 || !(rs.getString("MaTinhTrangChiTiet").equals(Constant.TINHTRANGTHIETBIRANH)))
							thietBi.setTinhTrangDuocXoa("2");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return thietBiList;
	}
	public static Boolean baoHuThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_baoHuThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}	
	public static Boolean xoaThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_DeleteThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean thayDoiThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_ThayDoiThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static ThietBiModel getThietBiSimpleByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiSimpleByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				thietBi.setMaThietBi(rs.getString("MaThietBi"));
				thietBi.setTenThietBi(rs.getString("TenThietBi"));
				thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
				thietBi.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
				thietBi.setNgaySanXuat(rs.getString("NgaySanXuat"));
				thietBi.setNgayMua(rs.getString("NgayMua"));
				thietBi.setHanBaoHanh(rs.getString("HanBaoHanh"));
				thietBi.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
				thietBi.setMaBoPhan(rs.getString("MaBoPhan"));
				thietBi.setMaPhongBan(rs.getString("MaPhong"));
				thietBi.setMaTanSuat(rs.getString("MaTanSuat"));
				thietBi.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static ThietBiModel getThietBiByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		ArrayList<ChiTietThietBiModel> chiTietThietBiList = new ArrayList<ChiTietThietBiModel>();
		String maThietBi = "na";
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if(!maThietBi.equals(rs.getString("MaThietBi"))) {
					thietBi.setMaThietBi(rs.getString("MaThietBi"));
					thietBi.setTenThietBi(rs.getString("TenThietBi"));
					thietBi.setMaBoPhan(rs.getString("MaBoPhan"));
					thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
					thietBi.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
					thietBi.setMaPhongBan(rs.getString("MaPhong"));
					thietBi.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
					thietBi.setNgaySanXuat(rs.getString("NgaySanXuat"));
					thietBi.setNgayMua(rs.getString("NgayMua"));
					thietBi.setHanBaoHanh(rs.getString("HanBaoHanh"));
					thietBi.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
					thietBi.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
					thietBi.setGiaMua(rs.getString("GiaMua"));
					thietBi.setNguyenTacSuDung(rs.getString("NguyenTacSuDung"));
					thietBi.setDacTinhKyThuat(rs.getNString("DacTinhKyThuat"));
					thietBi.setSoLanSuDung(rs.getString("SoLanSuDung"));
					thietBi.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
					thietBi.setGhiChu(rs.getString("GhiChu"));
					thietBi.setMaNguoiTao(rs.getString("MaNguoiTao"));
					thietBi.setMaTanSuat(rs.getString("MaTanSuat"));
					thietBi.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
					maThietBi = thietBi.getMaThietBi();
					thietBi.setChiTietThietBiList(chiTietThietBiList);
				}
				if(rs.getString("MaChiTietThietBi") != null) {
					ChiTietThietBiModel chiTietThietBi = new ChiTietThietBiModel();
					chiTietThietBi.setMaChiTietThietBi(rs.getString("MaChiTietThietBi"));
					chiTietThietBi.setTenChiTietThietBi(rs.getString("TenLinhKien"));
					chiTietThietBi.setKiHieu(rs.getString("KiHieuLinhKien"));
					chiTietThietBi.setSoLanBaoTri(rs.getString("SoLanBaoTriChiTiet"));
					chiTietThietBi.setSoLanSuDung(rs.getString("SoLanSuDungChiTiet"));
					chiTietThietBi.setTenNhaCungCap(rs.getNString("TenNhaCungCapLinhKien"));
					chiTietThietBiList.add(chiTietThietBi);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static ThietBiModel getThietBiBaoHuByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		ArrayList<ChiTietThietBiModel> chiTietThietBiList = new ArrayList<ChiTietThietBiModel>();
		String maThietBi = "na";
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiBaoHuByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if(!maThietBi.equals(rs.getString("MaThietBi"))) {
					thietBi.setMaThietBi(rs.getString("MaThietBi"));
					thietBi.setTenThietBi(rs.getString("TenThietBi"));
					thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
					
					maThietBi = thietBi.getMaThietBi();
					thietBi.setChiTietThietBiList(chiTietThietBiList);
				}
				if(rs.getString("MaChiTietThietBi") != null) {
					ChiTietThietBiModel chiTietThietBi = new ChiTietThietBiModel();
					chiTietThietBi.setMaChiTietThietBi(rs.getString("MaChiTietThietBi"));
					chiTietThietBi.setTenChiTietThietBi(rs.getString("TenLinhKien"));
					chiTietThietBi.setKiHieu(rs.getString("KiHieuLinhKien"));
					
					chiTietThietBiList.add(chiTietThietBi);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static Boolean updatePhieuMuonByID(String maPhieuMuon, String ghiChu) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_updatePhieuMuonThietBiByID(?,?)}");		
			csmt.setString("ID", maPhieuMuon);
			csmt.setNString("Ghi_chu", ghiChu);
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
}
