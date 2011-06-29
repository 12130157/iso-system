package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ChiTietPhieuMuonDAO {
	public static Boolean insertChiTietPhieuMuonThietBi(ChiTietPhieuMuonModel chiTietPhieuMuon) { // Thêm thiết bị vào phiếu mượn
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertChiTietPhieuMuon(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setString("Ma_phieu_muon", chiTietPhieuMuon.getMaPhieuMuon());
			csmt.setString("Ma_thiet_bi", chiTietPhieuMuon.getMaThietBi());
			csmt.setString("Tinh_trang", "1");
			csmt.setString("Ghi_chu", chiTietPhieuMuon.getGhiChu());
			csmt.setString("Thoi_gian_muon", chiTietPhieuMuon.getThoiGianMuon());
			csmt.setString("Thoi_gian_tra", chiTietPhieuMuon.getThoiGianTra());
			csmt.setString("Phan_loai", "1");
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietPhieuMuon.getNgayCapNhatCuoi());
			csmt.setString("User1", chiTietPhieuMuon.getUser1());
			csmt.setString("User2", chiTietPhieuMuon.getUser2());
			csmt.setString("User3", chiTietPhieuMuon.getUser3());
			csmt.setString("User4", chiTietPhieuMuon.getUser4());
			csmt.setString("User5", chiTietPhieuMuon.getUser5());
			
			csmt.setString("Choice", "2");
			result = DataUtil.executeNonStore(csmt);
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	public static Boolean updateChiTietPhieuMuonThietBi(ChiTietPhieuMuonModel chiTietPhieuMuon) { // Thêm thiết bị vào phiếu mượn
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_UpdateChiTietPhieuMuonByID(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", chiTietPhieuMuon.getMaCTPM());
			csmt.setString("Ma_phieu_muon", chiTietPhieuMuon.getMaPhieuMuon());
			csmt.setString("Ma_thiet_bi", chiTietPhieuMuon.getMaThietBi());
			csmt.setString("Thoi_gian_tra", chiTietPhieuMuon.getThoiGianMuon());
			csmt.setString("Thoi_gian_muon", chiTietPhieuMuon.getThoiGianTra());
			csmt.setString("Tinh_trang", chiTietPhieuMuon.getTinhTrang());
			csmt.setString("Ghi_chu", chiTietPhieuMuon.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietPhieuMuon.getNgayCapNhatCuoi());
			csmt.setString("User1", chiTietPhieuMuon.getUser1());
			csmt.setString("User2", chiTietPhieuMuon.getUser2());
			csmt.setString("User3", chiTietPhieuMuon.getUser3());
			csmt.setString("User4", chiTietPhieuMuon.getUser4());
			csmt.setString("User5", chiTietPhieuMuon.getUser5());
			result = DataUtil.executeNonStore(csmt);
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return result;
	}
	public static Boolean xoaChiTietPhieuMuon(String maChiTietPhieuMuon) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_XoaChiTietPhieuMuonByID(?)}");		
			csmt.setString("Ma_chi_tiet_phieu_muon", maChiTietPhieuMuon);
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean traThietBi(String maChiTietPhieuMuon) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_TraChiTietPhieuMuonByID(?)}");		
			csmt.setString("Ma_chi_tiet_phieu_muon", maChiTietPhieuMuon);
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static int getCountChiTietPhieuMuon(String tinhTrang, String maPhieuMuon) {
		int count = 0;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetCountChiTietPhieuMuon(?,?)}");
			
			csmt.setString("Tinh_trang",tinhTrang);
			csmt.setString("Ma_phieu_muon", maPhieuMuon);
			
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return count;
	}
	public static PhieuMuonThietBiModel getChiTietPhieuMuonByDieuKien(String tinhTrang, String maPhieuMuon, int totalRow, String currentPage) {
		PhieuMuonThietBiModel phieuMuonThietBi = new PhieuMuonThietBiModel();
		ArrayList<ChiTietPhieuMuonModel> chiTietPhieuMuonList = new ArrayList<ChiTietPhieuMuonModel>();	
		String ID = "na";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetChiTietPhieuMuonByDieuKien(?,?,?,?,?)}");
			
			csmt.setString("Tinh_trang",tinhTrang);
			csmt.setString("Ma_phieu_muon", maPhieuMuon);
			csmt.setString("Num_row", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("Total_row", totalRow + "");
			csmt.setString("CurrentPage", currentPage);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next()) {
				if(!ID.equals(rs.getString("MaPhieuMuon"))) {
					phieuMuonThietBi.setMaPhieuMuon(rs.getString("MaPhieuMuon"));
					phieuMuonThietBi.setGhiChu(rs.getString("GhiChu"));
					
					phieuMuonThietBi.setChiTietPhieuMuonList(chiTietPhieuMuonList);
					ID = phieuMuonThietBi.getMaPhieuMuon();
				}
				
				ChiTietPhieuMuonModel chiTietPhieuMuon = new ChiTietPhieuMuonModel();
				chiTietPhieuMuon.setMaCTPM(rs.getString("MaChiTietPhieuMuon"));
				if(rs.getString("PhanLoai").equals("1"))
					chiTietPhieuMuon.setTenThietBi(rs.getNString("TenThietBi"));
				else
					chiTietPhieuMuon.setTenThietBi(rs.getNString("TenLinhKien"));
				chiTietPhieuMuon.setNgayMuon(rs.getString("NgayMuon"));
				chiTietPhieuMuon.setGioMuon(rs.getString("GioMuon"));
				chiTietPhieuMuon.setPhutMuon(rs.getString("PhutMuon"));
				chiTietPhieuMuon.setNgayTra(rs.getString("NgayTra"));
				chiTietPhieuMuon.setGioTra(rs.getString("GioTra"));
				chiTietPhieuMuon.setPhutTra(rs.getString("PhutTra"));
				chiTietPhieuMuon.setGhiChu(rs.getString("GhiChuChiTiet"));
				chiTietPhieuMuon.setTinhTrang(rs.getString("TinhTrang"));
				chiTietPhieuMuonList.add(chiTietPhieuMuon);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return phieuMuonThietBi;
	}
	public static String kiemTraThietBiMuon(String thoiGianMuon, String thoiGianTra) {
		System.out.println(thoiGianMuon);
		String listMaThietBi =  "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_kiemTraThietBiMuon(?,?)}");		
			csmt.setString("Thoi_gian_muon", thoiGianMuon);
			csmt.setString("Thoi_gian_tra", thoiGianTra);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next()) {
				listMaThietBi += "-" + (rs.getString("ID"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return listMaThietBi;
	}
}
