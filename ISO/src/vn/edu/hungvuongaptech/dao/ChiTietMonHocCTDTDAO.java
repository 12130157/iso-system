package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietMonHocCTDTModel;
import vn.edu.hungvuongaptech.model.ChuongTrinhDaoTaoModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ChiTietMonHocCTDTDAO {
	public static void getChiTietCTDTByMaChuongTrinh(ChuongTrinhDaoTaoModel chuongTrinh) {
		ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList1 = new ArrayList<ChiTietMonHocCTDTModel>();
		ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList2 = new ArrayList<ChiTietMonHocCTDTModel>();
		ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList3 = new ArrayList<ChiTietMonHocCTDTModel>();
		/*Constant.NUM_ROWS_PHAN_1 = 0;
		Constant.NUM_ROWS_PHAN_2 = 0;
		Constant.NUM_ROWS_PHAN_3 = 0;*/
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetChiTietCTDTByMaChuongTrinh"));
			preparedStatement.setString(1, chuongTrinh.getMaChuongTrinhDaoTao());
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ChiTietMonHocCTDTModel chiTietMonHocCTDTModel = new ChiTietMonHocCTDTModel();
				chiTietMonHocCTDTModel.setMaChiTietCTDT(rs.getString("MaChiTietCTDT"));
				chiTietMonHocCTDTModel.setMaChuongTrinh(rs.getString("MaChuongTrinh"));
				chiTietMonHocCTDTModel.setMaMonHoc(rs.getString("MaMonHoc"));
				chiTietMonHocCTDTModel.setTenMonHoc(rs.getString("TenMonHoc"));
				chiTietMonHocCTDTModel.setLyThuyet(rs.getString("LyThuyet"));
				chiTietMonHocCTDTModel.setThucHanh(rs.getString("ThucHanh"));
				chiTietMonHocCTDTModel.setHocKi(rs.getString("HocKi"));
				chiTietMonHocCTDTModel.setNamHoc(rs.getString("NamHoc"));
				chiTietMonHocCTDTModel.setLTTH(rs.getString("LTTH"));
				chiTietMonHocCTDTModel.setTTSX(rs.getString("TTSX"));
				chiTietMonHocCTDTModel.setMaHocPhan(rs.getString("MaHocPhan"));
				chiTietMonHocCTDTModel.setThuTu(rs.getString("ThuTu"));
				chiTietMonHocCTDTModel.setTinhChat(rs.getString("TinhChat"));
				chiTietMonHocCTDTModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				chiTietMonHocCTDTModel.setTinhTrang(rs.getString("TinhTrang"));
				chiTietMonHocCTDTModel.setMaDeCuong(rs.getString("MaDeCuong"));
				chiTietMonHocCTDTModel.setMaNguoiTaoDeCuong(rs.getString("MaNguoiTaoDeCuong"));
				//
				chiTietMonHocCTDTModel.setLyThuyetBeforeUpdate(rs.getString("LyThuyet"));
				chiTietMonHocCTDTModel.setThucHanhBeforeUpdate(rs.getString("ThucHanh"));
				//
				chiTietMonHocCTDTModel.setUser1(rs.getString("User1"));
				chiTietMonHocCTDTModel.setUser2(rs.getString("User2"));
				chiTietMonHocCTDTModel.setUser3(rs.getString("User3"));
				chiTietMonHocCTDTModel.setUser4(rs.getString("User4"));
				chiTietMonHocCTDTModel.setUser5(rs.getString("User5"));

				
//				MonHocModel monHocModel = MonHocDAO.getMonHocByID(chiTietMonHocCTDTModel.gnetMaMonHoc());
//				chiTietMonHocCTDTModel.setMonHocModel(monHocModel);
				if(chiTietMonHocCTDTModel.getMaHocPhan().equals("1"))
					chiTietMonHocCTDTModelList1.add(chiTietMonHocCTDTModel);
				else if(chiTietMonHocCTDTModel.getMaHocPhan().equals("2"))
					chiTietMonHocCTDTModelList2.add(chiTietMonHocCTDTModel);
				else
					chiTietMonHocCTDTModelList3.add(chiTietMonHocCTDTModel);
				/*
				if(chiTietMonHocCTDTModel.getMaHocPhan().equals("1"))
					Constant.NUM_ROWS_PHAN_1++;
				else if (chiTietMonHocCTDTModel.getMaHocPhan().equals("2"))
					Constant.NUM_ROWS_PHAN_2++;
				else
					Constant.NUM_ROWS_PHAN_3++;*/
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		chuongTrinh.setChiTietMonHocCTDTModelList1(chiTietMonHocCTDTModelList1);
		chuongTrinh.setChiTietMonHocCTDTModelList2(chiTietMonHocCTDTModelList2);
		chuongTrinh.setChiTietMonHocCTDTModelList3(chiTietMonHocCTDTModelList3);
	}
	public static Boolean deleteChiTietMonHocCTDT(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteChiTietMonHocCTDT(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static Boolean insertChiTietMonHocCTDT(ChiTietMonHocCTDTModel chiTietMonHocCTDTModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertChiTietMonHocCTDT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");	
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_chuong_trinh", chiTietMonHocCTDTModel.getMaChuongTrinh());
			csmt.setString("Thu_tu", chiTietMonHocCTDTModel.getThuTu());
			csmt.setString("Ma_mon_hoc", chiTietMonHocCTDTModel.getMaMonHoc());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietMonHocCTDTModel.getNgayCapNhatCuoi());
			csmt.setString("Ly_thuyet", chiTietMonHocCTDTModel.getLyThuyet());
			csmt.setString("Thuc_hanh", chiTietMonHocCTDTModel.getThucHanh());
			csmt.setString("LT_TH", chiTietMonHocCTDTModel.getLTTH());
			csmt.setString("TTSX", chiTietMonHocCTDTModel.getTTSX());
			csmt.setString("Tinh_chat", chiTietMonHocCTDTModel.getTinhChat());
			csmt.setString("Nam_hoc", chiTietMonHocCTDTModel.getNamHoc());
			csmt.setString("Hoc_ky", chiTietMonHocCTDTModel.getHocKi());
			csmt.setString("Ma_hoc_phan", chiTietMonHocCTDTModel.getMaHocPhan());
			csmt.setString("User1", chiTietMonHocCTDTModel.getUser1());
			csmt.setString("User2", chiTietMonHocCTDTModel.getUser2());
			csmt.setString("User3", chiTietMonHocCTDTModel.getUser3());
			csmt.setString("User4", chiTietMonHocCTDTModel.getUser4());
			csmt.setString("User5", chiTietMonHocCTDTModel.getUser5());
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				String id = csmt.getString("ID");
				chiTietMonHocCTDTModel.setMaChiTietCTDT(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static Boolean updateChiTietMonHocCTDT(ChiTietMonHocCTDTModel chiTietMonHocCTDTModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateChiTietMonHocCTDT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");	
			csmt.setString("ID", chiTietMonHocCTDTModel.getMaChiTietCTDT());
			csmt.setString("Ma_chuong_trinh", chiTietMonHocCTDTModel.getMaChuongTrinh());
			csmt.setString("Thu_tu", chiTietMonHocCTDTModel.getThuTu());
			csmt.setString("Ma_mon_hoc", chiTietMonHocCTDTModel.getMaMonHoc());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietMonHocCTDTModel.getNgayCapNhatCuoi());
			csmt.setString("Ly_thuyet", chiTietMonHocCTDTModel.getLyThuyet());
			csmt.setString("Thuc_hanh", chiTietMonHocCTDTModel.getThucHanh());
			csmt.setString("LT_TH", chiTietMonHocCTDTModel.getLTTH());
			csmt.setString("TTSX", chiTietMonHocCTDTModel.getTTSX());
			csmt.setString("Tinh_chat", chiTietMonHocCTDTModel.getTinhChat());
			csmt.setString("Nam_hoc", chiTietMonHocCTDTModel.getNamHoc());
			csmt.setString("Hoc_ky", chiTietMonHocCTDTModel.getHocKi());
			csmt.setString("Ma_hoc_phan", chiTietMonHocCTDTModel.getMaHocPhan());
			csmt.setString("User1", chiTietMonHocCTDTModel.getUser1());
			csmt.setString("User2", chiTietMonHocCTDTModel.getUser2());
			csmt.setString("User3", chiTietMonHocCTDTModel.getUser3());
			csmt.setString("User4", chiTietMonHocCTDTModel.getUser4());
			csmt.setString("User5", chiTietMonHocCTDTModel.getUser5());
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static ArrayList<ChiTietMonHocCTDTModel> getAllChiTietCTDTChuaDuyet() {
		ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList = new ArrayList<ChiTietMonHocCTDTModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetAllChiTietCTDTChuaDuyet"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ChiTietMonHocCTDTModel chiTietMonHocCTDTModel = new ChiTietMonHocCTDTModel();
				chiTietMonHocCTDTModel.setMaChiTietCTDT(rs.getString("MaChiTietCTDT"));
				chiTietMonHocCTDTModel.setMaChuongTrinh(rs.getString("MaChuongTrinh"));
				chiTietMonHocCTDTModel.setMaMonHoc(rs.getString("MaMonHoc"));
				chiTietMonHocCTDTModel.setTenMonHoc(rs.getString("TenMonHoc"));
				chiTietMonHocCTDTModel.setLyThuyet(rs.getString("LyThuyet"));
				chiTietMonHocCTDTModel.setThucHanh(rs.getString("ThucHanh"));
				chiTietMonHocCTDTModel.setTenKhoa(rs.getString("TenKhoa"));
				chiTietMonHocCTDTModel.setTinhChat(rs.getString("TinhChat"));
				chiTietMonHocCTDTModelList.add(chiTietMonHocCTDTModel);
			}
				return chiTietMonHocCTDTModelList;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<ChiTietMonHocCTDTModel> getChiTietCTDTByMaDeCuong(String maDeCuong) {
		ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList = new ArrayList<ChiTietMonHocCTDTModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetChiTietCTDTByMaDeCuong"));
			preparedStatement.setString(1, maDeCuong);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ChiTietMonHocCTDTModel chiTietMonHocCTDTModel = new ChiTietMonHocCTDTModel();
				chiTietMonHocCTDTModel.setMaChiTietCTDT(rs.getString("MaChiTietCTDT"));
				chiTietMonHocCTDTModel.setMaChuongTrinh(rs.getString("MaChuongTrinh"));
				chiTietMonHocCTDTModel.setMaMonHoc(rs.getString("MaMonHoc"));
				chiTietMonHocCTDTModel.setTenMonHoc(rs.getString("TenMonHoc"));
				chiTietMonHocCTDTModel.setLyThuyet(rs.getString("LyThuyet"));
				chiTietMonHocCTDTModel.setThucHanh(rs.getString("ThucHanh"));
				chiTietMonHocCTDTModel.setTenKhoa(rs.getString("TenKhoa"));
				chiTietMonHocCTDTModel.setTinhChat(rs.getString("TinhChat"));
				chiTietMonHocCTDTModelList.add(chiTietMonHocCTDTModel);
			}
				return chiTietMonHocCTDTModelList;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
