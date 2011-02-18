package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.model.MonHocModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.SuDungModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class MonHocTKBDAO {
	public static Boolean insertMonHocTKB(MonHocTKBModel monHocTKBModel) {
		
		Boolean result = false;
		String maMonHocTKBNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertMonHocTKB(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("So_noi_dung", monHocTKBModel.getSoNoiDung());
			csmt.setString("So_ca_thuc_hanh", monHocTKBModel.getSoCaThucHanh());
			csmt.setString("Ma_TKB", monHocTKBModel.getMaTKB());
			csmt.setString("Ma_mon_hoc", monHocTKBModel.getMaMonHoc());
			csmt.setString("Ma_giao_vien", monHocTKBModel.getMaGiaoVien());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);
			csmt.registerOutParameter("Ngay_bat_dau_LT",java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ngay_bat_dau_TH",java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ngay_ket_thuc_LT",java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ngay_ket_thuc_TH",java.sql.Types.VARCHAR);
			csmt.setString("Tuan_bat_dau_LT", monHocTKBModel.getTuanBatDauLT());
			csmt.setString("Tuan_bat_dau_TH", monHocTKBModel.getTuanBatDauTH());
			csmt.setString("Tuan_ket_thuc_LT", monHocTKBModel.getTuanKetThucLT());
			csmt.setString("Tuan_ket_thuc_TH", monHocTKBModel.getTuanKetThucTH());
			csmt.setNString("Ghi_chu", monHocTKBModel.getGhiChu());
			//csmt.setString("Ten_mon_hoc", monHocTKBModel.getTenMonHoc());
			//csmt.setString("Ten_giao_vien", monHocTKBModel.getTenGiaoVien());
			csmt.setString("User1", monHocTKBModel.getUser1());
			csmt.setString("User2", monHocTKBModel.getUser2());
			csmt.setString("User3", monHocTKBModel.getSoTietHoc1Buoi());
			csmt.setString("User4", monHocTKBModel.getUser4());
			csmt.setString("User5", monHocTKBModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				maMonHocTKBNew = csmt.getString("ID");
				monHocTKBModel.setMaMonHocTKB(maMonHocTKBNew);
				monHocTKBModel.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				monHocTKBModel.setNgayBatDauLT(DateUtil.setDate(csmt.getString("Ngay_bat_dau_LT")));
				monHocTKBModel.setNgayBatDauTH(DateUtil.setDate(csmt.getString("Ngay_bat_dau_TH")));
				monHocTKBModel.setNgayKetThucLT(DateUtil.setDate(csmt.getString("Ngay_ket_thuc_LT")));
				monHocTKBModel.setNgayKetThucTH(DateUtil.setDate(csmt.getString("Ngay_ket_thuc_TH")));
				
				ArrayList<ChiTietTKBModel> chiTietTKBList = monHocTKBModel.getChiTietTKBModelList();
				//ArrayList<SuDungModel> suDungList = monHocTKBModel.getSuDungModelList();//monHocTKBModel.getSuDungModelList();
				ArrayList<ChiTietTKBModel> chiTietTKBListAfterAdded = new ArrayList<ChiTietTKBModel>();
				int count = 0;
				for (ChiTietTKBModel obj : chiTietTKBList) {
					obj.setMaMonHocTKB(maMonHocTKBNew);
					obj.setMaThoiKhoaBieu(monHocTKBModel.getMaTKB());
					//suDungList.get(count).setMaMonHocTKB(maMonHocTKBNew);
					if (ChiTietTKBDAO.insertChiTietTKB(obj)) {
						//SuDungDAO.insertSuDung(suDungList.get(count));
						chiTietTKBListAfterAdded.add(obj);
						count++;
					}
				}
				
				monHocTKBModel.setChiTietTKBModelList(chiTietTKBListAfterAdded);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	public static Boolean updateMonHocTKB(MonHocTKBModel monHocTKBModel) {
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateMonHocTKBByID(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", monHocTKBModel.getMaMonHocTKB());
			csmt.setString("So_noi_dung", monHocTKBModel.getSoNoiDung());
			csmt.setString("So_ca_thuc_hanh", monHocTKBModel.getSoCaThucHanh());
			csmt.setString("Ma_TKB", monHocTKBModel.getMaTKB());
			csmt.setString("Ma_mon_hoc", monHocTKBModel.getMaMonHoc());
			csmt.setString("Ma_giao_vien", monHocTKBModel.getMaGiaoVien());
			csmt.setString("Ngay_cap_nhat_cuoi",null);
			csmt.registerOutParameter("Ngay_bat_dau_LT",java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ngay_bat_dau_TH",java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ngay_ket_thuc_LT",java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ngay_ket_thuc_TH",java.sql.Types.VARCHAR);
			csmt.setString("Tuan_bat_dau_LT", monHocTKBModel.getTuanBatDauLT());
			csmt.setString("Tuan_bat_dau_TH", monHocTKBModel.getTuanBatDauTH());
			csmt.setString("Tuan_ket_thuc_LT", monHocTKBModel.getTuanKetThucLT());
			csmt.setString("Tuan_ket_thuc_TH", monHocTKBModel.getTuanKetThucTH());
			csmt.setNString("Ghi_chu", monHocTKBModel.getGhiChu());
			//csmt.setString("Ten_mon_hoc", monHocTKBModel.getTenMonHoc());
			//csmt.setString("Ten_giao_vien", monHocTKBModel.getTenGiaoVien());
			csmt.setString("User1", monHocTKBModel.getUser1());
			csmt.setString("User2", monHocTKBModel.getUser2());
			csmt.setString("User3", monHocTKBModel.getSoTietHoc1Buoi());
			csmt.setString("User4", monHocTKBModel.getUser4());
			csmt.setString("User5", monHocTKBModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				monHocTKBModel.setNgayBatDauLT(DateUtil.setDate(csmt.getString("Ngay_bat_dau_LT")));
				monHocTKBModel.setNgayBatDauTH(DateUtil.setDate(csmt.getString("Ngay_bat_dau_TH")));
				monHocTKBModel.setNgayKetThucLT(DateUtil.setDate(csmt.getString("Ngay_ket_thuc_LT")));
				monHocTKBModel.setNgayKetThucTH(DateUtil.setDate(csmt.getString("Ngay_ket_thuc_TH")));
				
				ArrayList<ChiTietTKBModel> chiTietTKBList = monHocTKBModel.getChiTietTKBModelList();
				ArrayList<ChiTietTKBModel> chiTietTKBListAfterAdded = new ArrayList<ChiTietTKBModel>();
				//ArrayList<SuDungModel> suDungList = monHocTKBModel.getSuDungModelList();
				//ArrayList<SuDungModel> suDungListAfterAdded = new ArrayList<SuDungModel>();
				int count = 0;
				for (ChiTietTKBModel obj : chiTietTKBList) {	
					if (obj.getMaChiTietTKB() != null) { 
						ChiTietTKBDAO.updateChiTietTKB(obj);
						//SuDungDAO.updateSuDung(suDungList.get(count));
					} else { 
						obj.setMaMonHocTKB(monHocTKBModel.getMaMonHocTKB());
						ChiTietTKBDAO.insertChiTietTKB(obj);
						//SuDungDAO.insertSuDung(suDungList.get(count));
					}
					chiTietTKBListAfterAdded.add(obj);
					//suDungListAfterAdded.add(suDungList.get(count));
					count++;
				}
				//monHocTKBModel.setSuDungModelList(suDungListAfterAdded);
				monHocTKBModel.setChiTietTKBModelList(chiTietTKBListAfterAdded);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	public static ArrayList<MonHocTKBModel> getAllMonHocTKB() {
		ArrayList<MonHocTKBModel> monHocTKBModelList = new ArrayList<MonHocTKBModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getAllMonHocTKB"));
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				MonHocTKBModel monHocTKBModel = new MonHocTKBModel();
				monHocTKBModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				monHocTKBModel.setMaTKB(rs.getString("MaTKB"));
				monHocTKBModel.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocTKBModel.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocTKBModel.setMaGiaoVien(rs.getString("MaGiaoVien"));
				monHocTKBModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
				monHocTKBModel.setSoCaThucHanh(rs.getString("SoCaTH"));
				monHocTKBModel.setTuanBatDauLT(rs.getString("TuanBatDauLT"));
				monHocTKBModel.setTuanKetThucLT(rs.getString("TuanKetThucLT"));
				monHocTKBModel.setTuanBatDauTH(rs.getString("TuanBatDauTH"));
				monHocTKBModel.setTuanKetThucTH(rs.getString("TuanKetThucTH"));
				monHocTKBModelList.add(monHocTKBModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return monHocTKBModelList;
	}
	
	public static ArrayList<MonHocTKBModel> getMonHocTKBByMaTKB(String maThoiKhoaBieu) {
		ArrayList<MonHocTKBModel> monHocTKBModelList = new ArrayList<MonHocTKBModel>();
		String chuoiThuTrongTuan = "";
		int count = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getMonHocTKBByMaTKB"));
			preparedStatement.setString(1, maThoiKhoaBieu);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				count++;
				MonHocTKBModel monHocTKBModel = new MonHocTKBModel();
				monHocTKBModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				monHocTKBModel.setMaTKB(rs.getString("MaTKB"));
				monHocTKBModel.setMaGiaoVien(rs.getString("MaGiaoVien"));
				monHocTKBModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
				monHocTKBModel.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocTKBModel.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocTKBModel.setSoCaThucHanh(rs.getString("SoCaThucHanh"));
				monHocTKBModel.setSoNoiDung(rs.getString("SoNoiDung"));
				if(rs.getString("TuanBatDauLT") == null)
					monHocTKBModel.setTuanBatDauLT("0");
				else
					monHocTKBModel.setTuanBatDauLT(rs.getString("TuanBatDauLT"));
				if(rs.getString("TuanBatDauTH") == null)
					monHocTKBModel.setTuanBatDauTH("0");
				else
					monHocTKBModel.setTuanBatDauTH(rs.getString("TuanBatDauTH"));
				monHocTKBModel.setNgayBatDauLT(DateUtil.setDate(rs.getString("NgayBatDauLT")));
				monHocTKBModel.setNgayBatDauTH(DateUtil.setDate(rs.getString("NgayBatDauTH")));
				monHocTKBModel.setNgayKetThucLT(DateUtil.setDate(rs.getString("NgayKetThucLT")));
				monHocTKBModel.setNgayKetThucTH(DateUtil.setDate(rs.getString("NgayKetThucTH")));
				monHocTKBModel.setGhiChu(rs.getNString("GhiChu"));
				monHocTKBModel.setKieuBienSoan(rs.getString("KieuBienSoan"));
				monHocTKBModel.setLyThuyetCTMH(rs.getString("LyThuyetCTMH"));
				monHocTKBModel.setThucHanhCTMH(rs.getString("ThucHanhCTMH"));
				monHocTKBModel.setUser1(rs.getString("MaPhongLT"));
				monHocTKBModel.setUser2(rs.getString("MaPhongTH"));
				monHocTKBModel.setSoTietHoc1Buoi(rs.getString("SoTiet1Buoi"));
				monHocTKBModel.setUser4(rs.getString("SoCaLyThuyet"));
				
				ArrayList<ChiTietTKBModel> chiTietTKBList = new ArrayList<ChiTietTKBModel>();
				//ArrayList<SuDungModel> suDungList = SuDungDAO.getAllSuDungPhongByMaMonHocTKB(monHocTKBModel.getMaMonHocTKB());
				monHocTKBModel.setChiTietTKBModelList(chiTietTKBList);
				//monHocTKBModel.setSuDungModelList(suDungList);
				//monHocTKBModel.setChuoiThuTrongTuan(chuoiThuTrongTuan);
				
				monHocTKBModelList.add(monHocTKBModel);
			}
			for(int i=0;i<count;i++) {
				ChiTietTKBDAO.getThuTrongTuanCuaMonHocByMaMonHocTKB(monHocTKBModelList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return monHocTKBModelList;
	}
	public static Boolean deleteMonHocTKB(String maMonHocTKB) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteMonHocTKB(?)}");		
			csmt.setString("Ma_mon_hoc_TKB", maMonHocTKB);
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	

	public static MonHocTKBModel getMonHocTKBByMaTKBAndMaMonHoc(String maThoiKhoaBieu,String maMonHoc) {
		MonHocTKBModel monHocTKBModel= new MonHocTKBModel();;
		String chuoiThuTrongTuan = "";
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getMonHocTKBByMaTKBAndMaMonHoc"));
			preparedStatement.setString(1,maThoiKhoaBieu);
			preparedStatement.setString(2,maMonHoc);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				monHocTKBModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				monHocTKBModel.setMaTKB(rs.getString("MaTKB"));
				monHocTKBModel.setMaGiaoVien(rs.getString("MaGiaoVien"));
				monHocTKBModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
				monHocTKBModel.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocTKBModel.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocTKBModel.setNgayBatDauLT(DateUtil.setDate(rs.getString("NgayBatDauLT")));
				monHocTKBModel.setNgayBatDauTH(DateUtil.setDate(rs.getString("NgayBatDauTH")));
				monHocTKBModel.setNgayKetThucLT(DateUtil.setDate(rs.getString("NgayKetThucLT")));
				monHocTKBModel.setNgayKetThucTH(DateUtil.setDate(rs.getString("NgayKetThucTH")));
				monHocTKBModel.setGhiChu(rs.getString("GhiChu"));
				monHocTKBModel.setKieuBienSoan(rs.getString("KieuBienSoan"));
				monHocTKBModel.setLyThuyetCTMH(rs.getString("LyThuyetCTMH"));
				monHocTKBModel.setThucHanhCTMH(rs.getString("ThucHanhCTMH"));
				monHocTKBModel.setSoCaThucHanh(rs.getString("SoCaThucHanh"));
				
				//chuoiThuTrongTuan = ChiTietTKBDAO.getThuTrongTuanCuaMonHocByMaMonHocTKB(monHocTKBModel.getMaMonHocTKB());
				monHocTKBModel.setChuoiThuTrongTuan(chuoiThuTrongTuan);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return monHocTKBModel;
	}
	
	public static ArrayList<MonHocTKBModel> getMonHocTKBByMaTKBAndMaGiaoVien(String maThoiKhoaBieu,String maGiaoVien) {
		ArrayList<MonHocTKBModel> monHocTKBModelList = new ArrayList<MonHocTKBModel>();
		String chuoiThuTrongTuan = "";
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getMonHocTKBByMaTKBAndMaGiaoVien"));
			preparedStatement.setString(1, maThoiKhoaBieu);
			preparedStatement.setString(2, maGiaoVien);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				MonHocTKBModel monHocTKBModel = new MonHocTKBModel();
				monHocTKBModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				monHocTKBModel.setMaTKB(rs.getString("MaTKB"));
				monHocTKBModel.setMaGiaoVien(rs.getString("MaGiaoVien"));
				monHocTKBModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
				monHocTKBModel.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocTKBModel.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocTKBModel.setNgayBatDauLT(DateUtil.setDate(rs.getString("NgayBatDauLT")));
				monHocTKBModel.setNgayBatDauTH(DateUtil.setDate(rs.getString("NgayBatDauTH")));
				monHocTKBModel.setNgayKetThucLT(DateUtil.setDate(rs.getString("NgayKetThucLT")));
				monHocTKBModel.setNgayKetThucTH(DateUtil.setDate(rs.getString("NgayKetThucTH")));
				monHocTKBModel.setGhiChu(rs.getString("GhiChu"));
				monHocTKBModel.setKieuBienSoan(rs.getString("KieuBienSoan"));
				monHocTKBModel.setLyThuyetCTMH(rs.getString("LyThuyetCTMH"));
				monHocTKBModel.setThucHanhCTMH(rs.getString("ThucHanhCTMH"));
				
				//chuoiThuTrongTuan = ChiTietTKBDAO.getThuTrongTuanCuaMonHocByMaMonHocTKB(monHocTKBModel.getMaMonHocTKB());
				monHocTKBModel.setChuoiThuTrongTuan(chuoiThuTrongTuan);
				
				monHocTKBModelList.add(monHocTKBModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return monHocTKBModelList;
	}
	
	public static ArrayList<LopHocModel> getLopHocByMaGiaoVien(String maGiaoVien) {
		ArrayList<LopHocModel> lopHocList = new ArrayList<LopHocModel>();
		LopHocModel lopHocModel;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getLopHocByGiaoVien"));
			preparedStatement.setString(1, maGiaoVien);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				lopHocModel=new LopHocModel();
				lopHocModel.setMaLopHoc(rs.getString("MaLop"));
				lopHocModel.setKiHieu(rs.getString("KiHieu"));
				
				lopHocList.add(lopHocModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lopHocList;
	}
	
	public static ArrayList<MonHocModel> getMonHocByMaLopAndMaGiaoVien(String maLop,String maGiaoVien) {
		ArrayList<MonHocModel> monHocList = new ArrayList<MonHocModel>();
		MonHocModel monHocModel;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getMonHocByMaLopAndMaGiaoVien"));
			preparedStatement.setString(1, maLop);
			preparedStatement.setString(2, maGiaoVien);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				monHocModel=new MonHocModel();
				monHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocModel.setTenMonHoc(MonHocDAO.getTenMonHocByMaMonHoc(rs.getString("MaMonHoc")));
				monHocList.add(monHocModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return monHocList;
	}

}
