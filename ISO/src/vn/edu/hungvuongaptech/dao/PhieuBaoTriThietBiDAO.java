package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;

import vn.edu.hungvuongaptech.model.PhieuBaoTriThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class PhieuBaoTriThietBiDAO {
	public static Boolean insertPhieuBaoTriThietBi(PhieuBaoTriThietBiModel phieuBaoTri) { // Bảo trì 1 thiết bị
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertPhieuBaoTriThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Ma_thiet_bi", phieuBaoTri.getMaThietBi());
			csmt.setString("Nguoi_de_xuat", phieuBaoTri.getNguoiDeXuat());
			csmt.setString("Ngay_bao_tri", phieuBaoTri.getNgayBaoTri());
			csmt.setString("Tinh_trang", phieuBaoTri.getTinhTrang());
			csmt.setString("Ghi_chu", phieuBaoTri.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", phieuBaoTri.getNgayCapNhatCuoi());
			csmt.setString("Ma_loai_bao_tri", phieuBaoTri.getMaLoaiBaoTri());
			csmt.setString("User1", phieuBaoTri.getUser1());
			csmt.setString("User2", phieuBaoTri.getUser2());
			csmt.setString("User3", phieuBaoTri.getUser3());
			csmt.setString("User4", phieuBaoTri.getUser4());
			csmt.setString("User5", phieuBaoTri.getUser5());
			Boolean ketQua = DataUtil.executeNonStore(csmt);
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
}	
