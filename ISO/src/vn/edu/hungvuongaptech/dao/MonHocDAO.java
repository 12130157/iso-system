package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.BaiKiemTraModel;
import vn.edu.hungvuongaptech.model.MonHocModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class MonHocDAO {
	public static MonHocModel getMonHocByID(String maMonHoc) {
		MonHocModel monHocModel = new MonHocModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getMonHocByID"));
			preparedStatement.setString(1, maMonHoc);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				monHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocModel.setLyThuyet(rs.getString("LyThuyet"));
				monHocModel.setThucHanh(rs.getString("ThucHanh"));
				monHocModel.setKiemTra(rs.getString("KiemTra"));
				monHocModel.setTenMonHoc(rs.getString("TinhChat"));
				monHocModel.setMaHocPhan(rs.getString("MaHocPhan"));
				monHocModel.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				monHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				monHocModel.setNgayTao(rs.getString("NgayTao"));
				monHocModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				monHocModel.setUser1(rs.getString("User1"));
				monHocModel.setUser2(rs.getString("User2"));
				monHocModel.setUser3(rs.getString("User3"));
				monHocModel.setUser4(rs.getString("User4"));
				monHocModel.setUser5(rs.getString("User5"));
			}
			return monHocModel;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<MonHocModel> getMonHoc() {
		ArrayList<MonHocModel> monHocModelList = new ArrayList<MonHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetMonHoc"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				MonHocModel monHocModel = new MonHocModel();
				monHocModel.setMaMonHoc(rs.getString("MaMonHoc"));				
				monHocModel.setTenMonHoc(rs.getString("TenMonHoc"));				
				monHocModel.setLyThuyet(rs.getString("LyThuyet"));
				monHocModel.setThucHanh(rs.getString("ThucHanh"));
				monHocModel.setTinhChat(rs.getString("TinhChat"));
				
				monHocModelList.add(monHocModel);
				//System.out.print(monHocModelList.get(0).getThucHanh());
//				System.out.print("\n RS= " + rs.getString("TenMonHoc") + "\n");
//				System.out.print("\n Ten mon hoc: " + monHocModel.getTenMonHoc() + "\n");
//				System.out.print("Thuc hanh: " + monHocModel.getThucHanh() + "\n");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return monHocModelList;
	}
	public static ArrayList<MonHocModel> getMonHocByTruongBoMon(String truongBoMon) {
	
		ArrayList<MonHocModel> monHocModelList = new ArrayList<MonHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetMonHocByTruongBoMon"));
			preparedStatement.setString(1, truongBoMon);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				MonHocModel monHocModel = new MonHocModel();
				monHocModel.setMaMonHoc(rs.getString("MaMonHoc"));				
				monHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocModelList.add(monHocModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return monHocModelList;
	}
	
		public static ArrayList<MonHocModel> showAllMonHoc() {
	
		ArrayList<MonHocModel> listKetQua = new ArrayList<MonHocModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllMonHoc"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				MonHocModel MonHocModel = new MonHocModel();
				MonHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				MonHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				MonHocModel.setLyThuyet(rs.getString("LyThuyet"));
				MonHocModel.setThucHanh(rs.getString("ThucHanh"));
				MonHocModel.setKiemTra(rs.getString("KiemTra"));
				MonHocModel.setTinhChat(rs.getString("TinhChat"));
				MonHocModel.setTenChuyenNganh (rs.getString("TenChuyenNganh"));
				MonHocModel.setTenHocPhan (rs.getString("TenHocPhan"));
				
								
				listKetQua.add(MonHocModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static String getMaMonHocByTruongBoMon(String truongBoMon) {	
		String maMonHoc = "";		
			try {
				PreparedStatement preparedStatement = DataUtil
						.getConnection()
						.prepareStatement(
								Constant.SQL_RES
										.getString("iso.sql.getMaMonHocByTruongBoMon"));
				preparedStatement.setString(1, truongBoMon);
				ResultSet rs = preparedStatement.executeQuery();
				if(rs.next()) {
					maMonHoc = rs.getString("MaMonHoc");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return maMonHoc;
	}
	public static MonHocModel getMonHocByMaMonHoc(String maMonHoc) {
		MonHocModel monHocModel = new MonHocModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.getMonHocByID"));
			preparedStatement.setString(1, maMonHoc);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				monHocModel.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocModel.setMaHocPhan(rs.getString("MaHocPhan"));
				monHocModel.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocModel.setLyThuyet(rs.getString("LyThuyet"));
				monHocModel.setThucHanh(rs.getString("ThucHanh"));
				monHocModel.setKiemTra(rs.getString("KiemTra"));
				monHocModel.setTinhChat(rs.getString("TinhChat"));
				monHocModel.setMaChuyenNganh(rs.getString("MaChuyenNganh"));
				monHocModel.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				monHocModel.setTenHocPhan(rs.getString("TenHocPhan"));
				monHocModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				monHocModel.setMaTruongBoMon(rs.getString("MaTruongBoMon"));
				
				ArrayList<BaiKiemTraModel> baiKiemTraModelList = BaiKiemTraDAO.getBaiKiemTraByMaMonHoc(maMonHoc);
				
				monHocModel.setBaiKiemTraList(baiKiemTraModelList);
			}
			return monHocModel;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Boolean updateMonHoc(MonHocModel monHocModel) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateMonHoc(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", monHocModel.getMaMonHoc());
			csmt.setString("Ten_mon_hoc", StringUtil.toTrim(monHocModel.getTenMonHoc()));
			csmt.setString("Ly_thuyet", monHocModel.getLyThuyet());
			csmt.setString("Thuc_hanh", monHocModel.getThucHanh());
			csmt.setString("Kiem_tra", monHocModel.getKiemTra());
			csmt.setString("Tinh_chat", StringUtil.toTrim(monHocModel.getTinhChat()));
			csmt.setString("Ma_hoc_phan", monHocModel.getMaHocPhan());
			csmt.setString("Ma_chuyen_nganh", monHocModel.getMaChuyenNganh());
			csmt.setString("Ngay_tao", monHocModel.getNgayTao());
			csmt.setString("Ma_nguoi_tao", monHocModel.getMaNguoiTao());
			csmt.setString("Ngay_cap_nhat_cuoi", monHocModel.getNgayCapNhatCuoi());
			csmt.setString("He_so", monHocModel.getUser1());
			if(monHocModel.getMaTruongBoMon() == ""){
				csmt.setString("Ma_truong_bo_mon", null);
			}else{
				csmt.setString("Ma_truong_bo_mon", monHocModel.getMaTruongBoMon());
			}

			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update mon hoc thanh cong
				ArrayList<BaiKiemTraModel> baiKiemTraList = monHocModel.getBaiKiemTraList();
				ArrayList<BaiKiemTraModel> baiKiemTraListAfterUpdate = new ArrayList<BaiKiemTraModel>();
				
				for(int i = 0; i < baiKiemTraList.size(); i++){
					BaiKiemTraModel obj = baiKiemTraList.get(i);
					if(obj.getMaBaiKiemTra() != null){
						BaiKiemTraDAO.updateBaiKiemTra(obj);
					}
					else {
						obj.setMaMonHoc(monHocModel.getMaMonHoc());
						BaiKiemTraDAO.insertBaiKiemTra(obj);
					}
					baiKiemTraListAfterUpdate.add(obj);
				}
				monHocModel.setBaiKiemTraList(baiKiemTraListAfterUpdate);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static Boolean insertMonHoc(MonHocModel monHocModel) {
		Boolean result = false;		
		try {
			
			
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_InsertMonHoc(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ten_mon_hoc", StringUtil.toTrim(monHocModel.getTenMonHoc()));
			csmt.setNString("Ly_thuyet", StringUtil.toTrim(monHocModel.getLyThuyet()));
			csmt.setNString("Thuc_hanh", StringUtil.toTrim(monHocModel.getThucHanh()));
			csmt.setNString("Kiem_tra", StringUtil.toTrim(monHocModel.getKiemTra()));
			csmt.setNString("Tinh_chat", StringUtil.toTrim(monHocModel.getTinhChat()));
			csmt.setNString("Ma_hoc_phan", monHocModel.getMaHocPhan());
			csmt.setNString("Ma_chuyen_nganh", monHocModel.getMaChuyenNganh());
			csmt.setNString("Ngay_tao", monHocModel.getNgayTao());
			csmt.setNString("Ma_nguoi_tao", monHocModel.getMaNguoiTao());
			csmt.setNString("Ngay_cap_nhat_cuoi", monHocModel.getNgayCapNhatCuoi());
			csmt.setNString("Ma_truong_bo_mon", monHocModel.getMaTruongBoMon());
			csmt.setNString("He_so", monHocModel.getUser1());

			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // insert mon hoc thanh cong
				monHocModel.setMaMonHoc(csmt.getString("ID"));
				ArrayList<BaiKiemTraModel> baiKiemTraList = monHocModel.getBaiKiemTraList();
				ArrayList<BaiKiemTraModel> baiKiemTraListAfterInsert = new ArrayList<BaiKiemTraModel>();
				
				for(int i = 0; i < baiKiemTraList.size(); i++){
					BaiKiemTraModel obj = baiKiemTraList.get(i);
					
					obj.setMaMonHoc(monHocModel.getMaMonHoc());
					BaiKiemTraDAO.insertBaiKiemTra(obj);
					baiKiemTraListAfterInsert.add(obj);
				}
				monHocModel.setBaiKiemTraList(baiKiemTraListAfterInsert);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static String getTenMonHocByMaMonHoc(String maMonHoc) {
	String ten="";
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getTenMonHocByID"));
			preparedStatement.setString(1, maMonHoc);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				
				ten=rs.getString("TenMonHoc");
				
			}
			return ten;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
