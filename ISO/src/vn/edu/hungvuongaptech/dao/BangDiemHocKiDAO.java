package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BangDiemHocKiModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.LogUtil;

public class BangDiemHocKiDAO {
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	public static Boolean insertBangDiemHocKi(BangDiemHocKiModel bangDiemHocKi)
	{
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_XemDiem_InsertBangDiemHocKi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_hoc_ki_tung_lop", bangDiemHocKi.getMaHocKiTungLop());
			csmt.setString("Ma_hoc_vien", bangDiemHocKi.getMaHocVien());
			csmt.setString("Diem_trung_binh", bangDiemHocKi.getDiemTrungBinh());
			csmt.setString("Diem_ren_luyen", bangDiemHocKi.getDiemRenLuyen());
			csmt.setString("Diem_TB_hoc_ki", bangDiemHocKi.getDiemTBHocKi());
			csmt.setString("Hoc_luc", bangDiemHocKi.getHocLuc());
			csmt.setString("Hanh_kiem", bangDiemHocKi.getHanhKiem());
			csmt.setNString("Ghi_chu", bangDiemHocKi.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", bangDiemHocKi.getNgayCapNhatCuoi());		
			csmt.setString("User1", bangDiemHocKi.getUser1());
			csmt.setString("User2", bangDiemHocKi.getUser2());
			csmt.setString("User3", bangDiemHocKi.getUser3());
			csmt.setString("User4", bangDiemHocKi.getUser4());
			csmt.setString("User5", bangDiemHocKi.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) {
				bangDiemHocKi.setMaBangDiemHocKi(csmt.getString("ID"));				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
			result = false;
		}
						
		return result;
	}
	public static Boolean updateBangDiemHocKi(BangDiemHocKiModel bangDiemHocKi)
	{
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_XemDiem_UpdateBangDiemHocKi(?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", bangDiemHocKi.getMaBangDiemHocKi());
			//csmt.setString("Ma_hoc_ki_tung_lop", bangDiemHocKi.getMaHocKiTungLop());
			//csmt.setString("Ma_hoc_vien", bangDiemHocKi.getMaHocVien());
			csmt.setString("Diem_trung_binh", bangDiemHocKi.getDiemTrungBinh());
			csmt.setString("Diem_ren_luyen", bangDiemHocKi.getDiemRenLuyen());
			csmt.setString("Diem_TB_hoc_ki", bangDiemHocKi.getDiemTBHocKi());
			csmt.setString("Hoc_luc", bangDiemHocKi.getHocLuc());
			csmt.setString("Hanh_kiem", bangDiemHocKi.getHanhKiem());
			csmt.setNString("Ghi_chu", bangDiemHocKi.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", bangDiemHocKi.getNgayCapNhatCuoi());		
			csmt.setString("User1", bangDiemHocKi.getUser1());
			csmt.setString("User2", bangDiemHocKi.getUser2());
			csmt.setString("User3", bangDiemHocKi.getUser3());
			csmt.setString("User4", bangDiemHocKi.getUser4());
			csmt.setString("User5", bangDiemHocKi.getUser5());
			
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
			result = false;
		}
						
		return result;
	}
	// lấy bảng điểm HK của tất cả SV 
	// DK : MaHocKiTungLop
	public static ArrayList<BangDiemHocKiModel> getAllBangDiemHocKiByMaHocKiTungLop(String maHocKiTungLop) {
		// TODO Auto-generated method stub
		ArrayList<BangDiemHocKiModel> bangDiemHocKiList = new ArrayList<BangDiemHocKiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.getAllBangDiemHocKiByMaHocKiTungLop"));
			preparedStatement.setString(1, maHocKiTungLop);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				BangDiemHocKiModel bangDiemHocKi = new BangDiemHocKiModel();
				bangDiemHocKi.setMaHocVien(rs.getString("MaHocVien"));
				bangDiemHocKi.setDiemRenLuyen(rs.getString("DiemRenLuyen"));
				bangDiemHocKi.setDiemTrungBinh(rs.getString("DiemTrungBinh"));
				bangDiemHocKi.setHanhKiem(rs.getNString("HanhKiem"));
				bangDiemHocKi.setHocLuc(rs.getNString("HocLuc"));
				bangDiemHocKi.setMaBangDiemHocKi(rs.getString("MaBangDiemHocKi"));
				bangDiemHocKi.setDiemTBHocKi(rs.getString("DiemTBHocKi"));
				bangDiemHocKiList.add(bangDiemHocKi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bangDiemHocKiList;
	}
	
	// lấy bảng điểm HK của 1 SV 
	// DK : MaHocKiTungLop, maSinhVien
	public static BangDiemHocKiModel getBangDiemHocKiByHocKiAndMaLopAndMaNamHocAndMaSinhVien(String maNamHoc, String maSinhVien, String hocKi, String maLop) {
		// TODO Auto-generated method stub
		BangDiemHocKiModel bangDiemHocKi = new BangDiemHocKiModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.getBangDiemHocKiByHocKiAndMaLopAndMaNamHocAndMaSinhVien"));
			preparedStatement.setString(1, maSinhVien);
			preparedStatement.setString(2, maNamHoc);
			preparedStatement.setString(3, hocKi);
			preparedStatement.setString(4, maLop);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				
				bangDiemHocKi.setDiemRenLuyen(rs.getString("DiemRenLuyen"));
				bangDiemHocKi.setDiemTrungBinh(rs.getString("DiemTrungBinh"));
				bangDiemHocKi.setHanhKiem(rs.getNString("HanhKiem"));
				bangDiemHocKi.setHocLuc(rs.getNString("HocLuc"));
				bangDiemHocKi.setDiemTBHocKi(rs.getString("DiemTBHocKi"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bangDiemHocKi;
	}
	
}
