package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BaiKiemTraModel;
import vn.edu.hungvuongaptech.model.ChiTietDiemModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ChiTietDiemDAO {
	
	public static ArrayList<ChiTietDiemModel> getAllChiTietDiem() {
		// TODO Auto-generated method stub
		ArrayList<ChiTietDiemModel> chiTietDiemModelList = new ArrayList<ChiTietDiemModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllChiTietDiem"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ChiTietDiemModel chiTietDiemModel = new ChiTietDiemModel();
				
				chiTietDiemModel.setMaChiTietDiem(rs.getString("chiTietDiem"));
				chiTietDiemModel.setMaDangKyMonHoc(rs.getString("maDangKyMonHoc"));
				chiTietDiemModel.setMaBaiKiemTra(rs.getString("maBaiKiemTra"));
				chiTietDiemModel.setDiem(rs.getString("diem"));
				chiTietDiemModel.setGhiChu(rs.getString("ghiChu"));
				chiTietDiemModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));
				chiTietDiemModelList.add(chiTietDiemModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return chiTietDiemModelList;
	}
	public static Boolean insertChiTietDiem(ChiTietDiemModel chiTietDiem) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_XemDiem_InsertChiTietDiem(?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ma_dang_ky_mon_hoc", chiTietDiem.getMaDangKyMonHoc());
			csmt.setNString("Ma_bai_kiem_tra", chiTietDiem.getMaBaiKiemTra());
			csmt.setNString("Diem", chiTietDiem.getDiem());
			csmt.setNString("Ghi_chu", chiTietDiem.getGhiChu());
			csmt.setNString("Ngay_cap_nhat_cuoi", chiTietDiem.getNgayCapNhatCuoi());

			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // insert chi tiet diem thanh cong
				chiTietDiem.setMaChiTietDiem(csmt.getString("ID"));
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	public static Boolean updateChiTietDiem(ChiTietDiemModel chiTietDiem) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_XemDiem_UpdateChiTietDiem(?,?,?,?,?,?)}");
			csmt.setString("ID", chiTietDiem.getMaChiTietDiem());
			csmt.setString("Ma_dang_ky_mon_hoc", chiTietDiem.getMaDangKyMonHoc());
			csmt.setString("Ma_bai_kiem_tra", chiTietDiem.getMaBaiKiemTra());
			csmt.setString("Diem", chiTietDiem.getDiem());
			csmt.setNString("Ghi_chu", chiTietDiem.getGhiChu());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietDiem.getNgayCapNhatCuoi());

			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // insert chi tiet diem thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	public static Boolean deleteChiTietDiem(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_XemDiem_DeleteChiTietDiem(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
}
