package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.zefer.html.doc.p;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietPhieuBaoTriModel;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.TinhTrangThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class PhieuMuonThietBiDAO {				
	public static Boolean insertPhieuMuonThietBi(PhieuMuonThietBiModel phieuMuon) { // Tạo mới phiếu mượn khi chưa có
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertPhieuMuonThietBi(?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setString("Nguoi_muon", phieuMuon.getMaNguoiMuon());
			csmt.setString("Ma_lop", phieuMuon.getMaLop());
			csmt.setString("Ghi_chu", phieuMuon.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", phieuMuon.getNgayCapNhatCuoi());
			csmt.setString("User1", phieuMuon.getUser1());
			csmt.setString("User2", phieuMuon.getUser2());
			csmt.setString("User3", phieuMuon.getUser3());
			csmt.setString("User4", phieuMuon.getUser4());
			csmt.setString("User5", phieuMuon.getUser5());
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				phieuMuon.setMaPhieuMuon(csmt.getNString("ID"));
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	public static Boolean updatePhieuMuonThietBi(PhieuMuonThietBiModel phieuMuon) { // Tạo mới phiếu mượn khi chưa có
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_UpdatePhieuMuonThietBi(?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", phieuMuon.getMaPhieuMuon());
			//csmt.setString("Nguoi_muon", phieuMuon.getMaNguoiMuon());
			//csmt.setString("Ma_lop", phieuMuon.getMaLop());
			csmt.setString("Ghi_chu", phieuMuon.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", phieuMuon.getNgayCapNhatCuoi());
			csmt.setString("User1", phieuMuon.getUser1());
			csmt.setString("User2", phieuMuon.getUser2());
			csmt.setString("User3", phieuMuon.getUser3());
			csmt.setString("User4", phieuMuon.getUser4());
			csmt.setString("User5", phieuMuon.getUser5());
			result = DataUtil.executeNonStore(csmt);
			if(result) {
				ArrayList<ChiTietPhieuMuonModel> chiTietPhieuMuonList = phieuMuon.getChiTietPhieuMuonList();
				ArrayList<ChiTietPhieuMuonModel> chiTietPhieuMuonListAfterUpdated = new ArrayList<ChiTietPhieuMuonModel>();
				for(ChiTietPhieuMuonModel obj : chiTietPhieuMuonList) {
					if(ChiTietPhieuMuonDAO.updateChiTietPhieuMuonThietBi(obj))
						chiTietPhieuMuonListAfterUpdated.add(obj);
					else
						result = false;
				}
				if(result)
					phieuMuon.setChiTietPhieuMuonList(chiTietPhieuMuonListAfterUpdated);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			result = false;
		}
		return result;
	}
	
	public static int getCountPhieuMuonThietBi(String ten, String ngay, String khoa) {
		int count = 0;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetCountPhieuMuonThietBi(?,?,?)}");
			
			csmt.setString("Khoa",khoa);
			csmt.setString("Ngay", ngay);
			csmt.setString("Ten", ten);
			
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return count;
	}
	public static ArrayList<PhieuMuonThietBiModel> getAllPhieuMuonThietBiByDieuKien(String ten, String ngay, String khoa, int totalRow, String currentPage) {
		ArrayList<PhieuMuonThietBiModel> phieuMuonList = new ArrayList<PhieuMuonThietBiModel>();		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetPhieuMuonThietBiByDieuKien(?,?,?,?,?,?)}");
			
			csmt.setString("Ten",ten);
			csmt.setString("Ngay", ngay);
			csmt.setString("Khoa", khoa);
			csmt.setString("Num_row", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("Total_row", totalRow + "");
			csmt.setString("CurrentPage", currentPage);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next()) {
				PhieuMuonThietBiModel phieuMuonThietBi = new PhieuMuonThietBiModel();
				phieuMuonThietBi.setMaPhieuMuon(rs.getString("MaPhieuMuon"));
				phieuMuonThietBi.setMaNguoiMuon(rs.getString("MaNguoiMuon"));
				phieuMuonThietBi.setTenNguoiMuon(rs.getNString("TenNguoiMuon"));
				phieuMuonThietBi.setNgayMuon(rs.getString("NgayMuon"));
				phieuMuonThietBi.setKhoa(rs.getNString("TenKhoa"));
				phieuMuonThietBi.setKiHieuLop(rs.getString("KiHieuLop"));
				phieuMuonList.add(phieuMuonThietBi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return phieuMuonList;
	}
	public static Boolean checkNguoiMuonAndNgayMuonANDMaLopOfPhieuMuonThietBi(String maNguoiMuon, String maLop) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_QLTB_FindPhieuMuonThietBiByNguoiMuonAndNgayMuonANDMaLop(?,?,?,?)}");
			csmt.setString("Nguoi_muon", maNguoiMuon);
			csmt.setString("Ma_lop", maLop);
			csmt.registerOutParameter("Result", java.sql.Types.VARCHAR);
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
	public static Boolean muonThietBi(ChiTietPhieuMuonModel chiTietPhieuMuon) {
		Boolean result = false;		
		result = ChiTietPhieuMuonDAO.insertChiTietPhieuMuonThietBi(chiTietPhieuMuon);		
		return result;
	}
	public static PhieuMuonThietBiModel getPhieuMuonByID(String id) {
		PhieuMuonThietBiModel phieuMuon = new PhieuMuonThietBiModel();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getPhieuMuonByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				phieuMuon.setMaPhieuMuon(rs.getString("MaPhieuMuon"));
				phieuMuon.setTenNguoiMuon(rs.getString("TenNguoiMuon"));
				phieuMuon.setKiHieuLop(rs.getString("KiHieuLop"));
				phieuMuon.setNgayMuon(rs.getString("NgayMuon"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return phieuMuon;
	}
	public static ArrayList<PhieuMuonThietBiModel> getAllPhieuMuonHienTai() {
		ArrayList<PhieuMuonThietBiModel> phieuMuonList = new ArrayList<PhieuMuonThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllPhieuMuonHienTai"));
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				PhieuMuonThietBiModel phieuMuon = new PhieuMuonThietBiModel();
				phieuMuon.setMaNguoiMuon(rs.getString("MaNguoiMuon"));
				phieuMuonList.add(phieuMuon);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return phieuMuonList;
	}
}
