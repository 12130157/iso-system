package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.SuDungModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class SuDungDAO {
	public static ArrayList<SuDungModel> getAllSuDungPhongByNamHoc(String namBatDau, String maMonHocTKB) {
		ArrayList<SuDungModel> suDungModelList = new ArrayList<SuDungModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetAllSuDungPhongByNamHoc"));
			preparedStatement.setString(1, namBatDau);
			preparedStatement.setString(2, maMonHocTKB);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				SuDungModel suDungModel = new SuDungModel();
				suDungModel.setMaSuDung(rs.getString("MaSuDung"));
				suDungModel.setMaPhong(rs.getString("MaPhong"));
				suDungModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				suDungModel.setMaNamHoc(rs.getString("MaNamHoc"));
				suDungModel.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				suDungModel.setThuTuTuan(rs.getString("ThuTuTuan"));
				suDungModel.setBuoi(rs.getString("Buoi"));
				suDungModel.setUser1(rs.getString("User1"));
				suDungModel.setUser1(rs.getString("User2"));
				suDungModel.setUser1(rs.getString("User3"));
				suDungModel.setUser1(rs.getString("User4"));
				suDungModel.setUser1(rs.getString("User5"));
				
				suDungModelList.add(suDungModel);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return suDungModelList;
	}
	
	public static Boolean insertSuDung(SuDungModel suDungModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertSuDung(?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_phong", suDungModel.getMaPhong());
			csmt.setString("Ma_mon_hoc_TKB", suDungModel.getMaMonHocTKB());
			csmt.setString("Ma_nam_hoc", suDungModel.getMaNamHoc());
			csmt.setString("STT_tuan", suDungModel.getThuTuTuan());	
			csmt.setString("Thu_trong_tuan", suDungModel.getThuTrongTuan());
			csmt.setNString("Buoi", suDungModel.getBuoi());
			csmt.setString("User1", suDungModel.getUser1());
			csmt.setString("User2", suDungModel.getUser2());
			csmt.setString("User3", suDungModel.getUser3());
			csmt.setString("User4", suDungModel.getUser4());
			csmt.setString("User5", suDungModel.getUser5());
			
			boolean ketQua = DataUtil.executeNonStore(csmt);
			if(ketQua) {
				suDungModel.setMaSuDung(csmt.getString("ID"));
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean updateSuDung(SuDungModel suDungModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateSuDung(?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", suDungModel.getMaSuDung());
			csmt.setString("Ma_phong", suDungModel.getMaPhong());
			csmt.setString("Ma_mon_hoc_TKB", suDungModel.getMaMonHocTKB());
			csmt.setString("Ma_nam_hoc", suDungModel.getMaNamHoc());
			csmt.setNString("STT_tuan", suDungModel.getThuTuTuan());	
			csmt.setNString("Thu_trong_tuan", suDungModel.getThuTrongTuan());
			csmt.setNString("Buoi", suDungModel.getBuoi());
			csmt.setString("User1", suDungModel.getUser1());
			csmt.setString("User2", suDungModel.getUser2());
			csmt.setString("User3", suDungModel.getUser3());
			csmt.setString("User4", suDungModel.getUser4());
			csmt.setString("User5", suDungModel.getUser5());
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean deleteSuDung(String maMonHocTKB) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteSuDung(?)}");		
			csmt.setString("Ma_mon_hoc_TKB", maMonHocTKB);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static ArrayList<SuDungModel> getAllSuDungPhongByMaMonHocTKB(String maMonHocTKB) {
		ArrayList<SuDungModel> suDungModelList = new ArrayList<SuDungModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetAllSuDungPhongByMaMonHocTKB"));
			preparedStatement.setString(1, maMonHocTKB);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				SuDungModel suDungModel = new SuDungModel();
				suDungModel.setMaSuDung(rs.getString("MaSuDung"));
				
				suDungModelList.add(suDungModel);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return suDungModelList;
	}
	
	public static ArrayList<ArrayList<SuDungModel>> getAllSuDungPhongByTuan(String maTuanLe) {
		ArrayList<ArrayList<SuDungModel>> list = new ArrayList<ArrayList<SuDungModel>>();
		for(int i=0;i<14;i++)
			list.add(null);
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetAllSuDungPhongByTuan"));
			preparedStatement.setString(1, maTuanLe);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				
				SuDungModel suDungModel = new SuDungModel();
				suDungModel.setKiHieuPhong(rs.getString("KiHieuPhong"));
				suDungModel.setNhom(rs.getString("Nhom"));
				suDungModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
				suDungModel.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				suDungModel.setTenMonHoc(rs.getString("TenMonHoc"));
				suDungModel.setBuoi(rs.getString("Buoi"));
				
				if(suDungModel.getBuoi().equals("Sang"))
					list.get(Integer.parseInt(suDungModel.getThuTrongTuan())-1).add(suDungModel);
				else
					list.get(Integer.parseInt(suDungModel.getThuTrongTuan())-1 + 7).add(suDungModel);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<SuDungModel> getLichSuDungPhongByDieuKien(String maPhong, String maNamHoc, String kiHieuTuan, String maKhoa) {
		ArrayList<SuDungModel> list = new ArrayList<SuDungModel>();		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetLichSuDungPhong(?,?,?,?)}");		
			csmt.setString("Phong", maPhong);
			csmt.setString("Khoa", maKhoa);
			csmt.setString("Tuan", kiHieuTuan);
			csmt.setString("Nam_hoc", maNamHoc);
			
			ResultSet rs = DataUtil.executeStore(csmt);	
			while(rs.next()) {
				SuDungModel suDungModel = new SuDungModel();
				suDungModel.setKiHieuPhong(rs.getString("KiHieuPhong"));
				suDungModel.setNhom(rs.getString("Nhom"));
				suDungModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
				suDungModel.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				suDungModel.setTenMonHoc(rs.getString("TenMonHoc"));
				suDungModel.setBuoi(rs.getString("Buoi"));
				suDungModel.setKhoa(rs.getString("TenKhoa"));
				suDungModel.setNgayHoc(DateUtil.setDate(rs.getString("NgayHoc")));
				list.add(suDungModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return list;
	}
}
