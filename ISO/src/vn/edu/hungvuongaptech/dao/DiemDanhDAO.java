package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.Format;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.Calendar;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.DiemDanhModel;
import vn.edu.hungvuongaptech.model.HocKyModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.model.MonHocModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.NamHocModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.TuanLeModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

/**
 * @author TuanHQ
 *
 */

public class DiemDanhDAO  {

	public static Boolean UpdateTinhTrangDiemDanhGV(String ID) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_DiemDanh_UpdateTinhTrangDiemDanhGV(?)}");
			csmt.setNString("ID", ID);
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update vai tro thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	public static DiemDanhModel GetDiemDanhModel()
	{
		DiemDanhModel model = new DiemDanhModel();
		Format formatter;
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		formatter = new SimpleDateFormat("yyyy-mm-dd");
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getDiemDanhModel"));
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				java.util.Date ngayBatDau = df.parse(rs.getString("ngay_bat_dau")); 
				String s = formatter.format(ngayBatDau);
				model.setNgayBatDau(s);
				java.util.Date ngayKetThuc = df.parse(rs.getString("ngay_ket_thuc"));
				String nKT = formatter.format(ngayKetThuc);
				model.setNgayKetThuc(nKT);
				java.util.Date ngayHienTai = df.parse(rs.getString("ngay_hien_tai"));
				String nHT = formatter.format(ngayHienTai);
				model.setNgayHienTai(nHT);
				model.setDayOfWeek(rs.getString("DayOfWeek"));
				model.setTenMonHoc(rs.getString("ten_mon_hoc"));
				
			}
		
		}
		 catch (Exception e) {
				e.printStackTrace();
		}
	
		return model;
	
	}
	private static String format(String string) {
		// TODO Auto-generated method stub
		return null;
	}
	public static ThanhVienModel getMaThanhVienByMaThe(String IDCard) {
		ThanhVienModel thanhVienModel = new ThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("diemDanh.sql.getMaGiaoVienByMaThe"));
			preparedStatement.setString(1, IDCard);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				
				return thanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static DiemDanhModel GetGiaoVienById(String id)
	{
		DiemDanhModel ddModel = new DiemDanhModel();
		Format formatter;
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		formatter = new SimpleDateFormat("dd-mm-yyyy");
		SimpleDateFormat sdf = new SimpleDateFormat("H");
		String dateSql = "";
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	    Calendar cal = Calendar.getInstance();
		                
	    //bat dau lay gio sql
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getTime"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
					dateSql = rs.getString("Time");	
					java.util.Date parsedDate = sdf1.parse(dateSql);
					cal.setTime(parsedDate);
			}
			
		}
		catch (Exception e) {
				e.printStackTrace();
		}
		
		//ket thuc lay gio 
		
		//set lay gio sang hay chieu 
		String dateFormat = sdf.format(cal.getTime());
		if(dateFormat.equalsIgnoreCase("6")
				||dateFormat.equalsIgnoreCase("7")
				||dateFormat.equalsIgnoreCase("8")
				||dateFormat.equalsIgnoreCase("9")
				||dateFormat.equalsIgnoreCase("10")
				||dateFormat.equalsIgnoreCase("11")
				||dateFormat.equalsIgnoreCase("12"))
		{
			try{
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("iso.sql.getGiaoVienByIdSang"));
				preparedStatement.setString(1, "Sáng");
				preparedStatement.setString(2, id);
				ResultSet rs = preparedStatement.executeQuery();
				if(rs.next()) {
					ddModel.setTenKhoa(rs.getString("BoPhan"));
					ddModel.setTenMonHoc(rs.getString("ten_mon_hoc"));
					ddModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
							java.util.Date ngayHienTai = df.parse(rs.getString("NgayHienTai"));
							String nHT = formatter.format(ngayHienTai);
							ddModel.setNgayHienTai(nHT);
							java.util.Date ngayBatDau = df.parse(rs.getString("Ngay_bat_dau")); 
							String s = formatter.format(ngayBatDau);
							ddModel.setNgayBatDau(s);
							java.util.Date ngayKetThuc = df.parse(rs.getString("Ngay_ket_thuc"));
							String nKT = formatter.format(ngayKetThuc);
							ddModel.setNgayKetThuc(nKT);
							ddModel.setDayOfWeek(rs.getString("DayOfWeek"));
							ddModel.setBuoi(rs.getString("buoi"));
							ddModel.setHinhThucDay(rs.getString("hinh_Thuc_day"));
							ddModel.setTenPhong(rs.getString("Ten_phong"));
				}
			
			}
			 catch (Exception e) {
					e.printStackTrace();
					return null;
			}
			
		}
		else if(dateFormat.equalsIgnoreCase("13")
				||dateFormat.equalsIgnoreCase("14")
				||dateFormat.equalsIgnoreCase("15")
				||dateFormat.equalsIgnoreCase("16")
				||dateFormat.equalsIgnoreCase("17"))
		{
			try{
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("iso.sql.getGiaoVienByIdChieu"));
				preparedStatement.setString(1, "Chiều");
				preparedStatement.setString(2, id);
				ResultSet rs = preparedStatement.executeQuery();
				if(rs.next()) {
					ddModel.setTenKhoa(rs.getString("BoPhan"));
					ddModel.setTenMonHoc(rs.getString("ten_mon_hoc"));
					ddModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
							java.util.Date ngayHienTai = df.parse(rs.getString("NgayHienTai"));
							String nHT = formatter.format(ngayHienTai);
							ddModel.setNgayHienTai(nHT);
							java.util.Date ngayBatDau = df.parse(rs.getString("Ngay_bat_dau")); 
							String s = formatter.format(ngayBatDau);
							ddModel.setNgayBatDau(s);
							java.util.Date ngayKetThuc = df.parse(rs.getString("Ngay_ket_thuc"));
							String nKT = formatter.format(ngayKetThuc);
							ddModel.setNgayKetThuc(nKT);
							ddModel.setDayOfWeek(rs.getString("DayOfWeek"));
							ddModel.setBuoi(rs.getString("buoi"));
							ddModel.setHinhThucDay(rs.getString("hinh_Thuc_day"));
							ddModel.setTenPhong(rs.getString("Ten_phong"));
				}
			
			}
			 catch (Exception e) {
					e.printStackTrace();
					return null;
			}
			 
		}
		 return ddModel;
		//return model;
	}
	
	public static ArrayList<DiemDanhModel> GetThanhVienByIdGiaoVien(String id)
	{
		ArrayList<DiemDanhModel> list = new ArrayList<DiemDanhModel>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("H");
		String dateSql = "";
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	    Calendar cal = Calendar.getInstance();
		                
	    //bat dau lay gio sql
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getTime"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
					dateSql = rs.getString("Time");	
					java.util.Date parsedDate = sdf1.parse(dateSql);
					cal.setTime(parsedDate);
			}
			
		}
		catch (Exception e) {
				e.printStackTrace();
		}
		String dateFormat = sdf.format(cal.getTime());
		
		// ket thuc lay gio sql
		if(dateFormat.equalsIgnoreCase("6")
			||dateFormat.equalsIgnoreCase("7")
			||dateFormat.equalsIgnoreCase("8")
			||dateFormat.equalsIgnoreCase("9")
			||dateFormat.equalsIgnoreCase("10")
			||dateFormat.equalsIgnoreCase("11")
			||dateFormat.equalsIgnoreCase("12"))
		{
			try{
				String sql = Constant.SQL_RES.getString("iso.sql.getThanhVienByIdGiaoVienSang");
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(sql);
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, "Sáng");				
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()) {
							DiemDanhModel model = new DiemDanhModel();
							model.setId(rs.getString("ID"));
							model.setTenDangNhap(rs.getString("TenDangNhap"));
							model.setMaThanhVienDiemDanh(rs.getString("ma_tvdd"));
							model.setTinhTrang(rs.getString("TinhTrang"));
							model.setHoGiaoVien(rs.getString("ho"));
							model.setTenLotGiaoVien(rs.getString("ten_lot"));
							model.setTenGiaoVien(rs.getString("ten"));
							
							list.add(model);
							
				}
			
			}
			 catch (Exception e) {
					e.printStackTrace();
			}	
		}
		else if(dateFormat.equalsIgnoreCase("13")
				||dateFormat.equalsIgnoreCase("14")
				||dateFormat.equalsIgnoreCase("15")
				||dateFormat.equalsIgnoreCase("16")
				||dateFormat.equalsIgnoreCase("17"))
		{
			try{
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("iso.sql.getThanhVienByIdGiaoVienChieu"));
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, "Chiều");
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()) {
						DiemDanhModel model = new DiemDanhModel();
							model.setId(rs.getString("ID"));
							model.setTenDangNhap(rs.getString("TenDangNhap"));
							model.setMaThanhVienDiemDanh(rs.getString("ma_tvdd"));
							model.setTinhTrang(rs.getString("TinhTrang"));
							model.setHoGiaoVien(rs.getString("ho"));
							model.setTenLotGiaoVien(rs.getString("ten_lot"));
							model.setTenGiaoVien(rs.getString("ten"));
							list.add(model);
				}
			
			}
			 catch (Exception e) {
					e.printStackTrace();
			}		 
		}
		return list;	
	}
	
	public static DiemDanhModel getMaTVDDByMaThanhVien(String maThanhVien,String maGiaoVien) {
		DiemDanhModel diemDanhModel = new DiemDanhModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getMaTVDDByMaThanhVien"));
			preparedStatement.setString(1, maThanhVien);
			preparedStatement.setString(2, maGiaoVien);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				diemDanhModel.setMaThanhVienDiemDanh(rs.getString("ID"));
				diemDanhModel.setTinhTrang(rs.getString("TinhTrang"));
				return diemDanhModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Boolean updateTinhTrangSinhVien(DiemDanhModel model) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_DiemDanh_UpdateTinhTrang(?)}");
			csmt.setNString("MaTVDD", model.getMaThanhVienDiemDanh());
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { 
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	
	public static Boolean updateTinhTrangSinhVien2(DiemDanhModel model) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_DiemDanh_UpdateTinhTrang2(?)}");
			csmt.setNString("MaTVDD", model.getMaThanhVienDiemDanh());
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { 
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static Boolean UpdateTinhTrangDiemDanhGV2(String ID) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_DiemDanh_UpdateTinhTrangDiemDanhGV2(?)}");
			csmt.setNString("ID", ID);
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update vai tro thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	public static Boolean updateSinhVienOnline(DiemDanhModel model) {
		Boolean result = false;		
		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_DiemDanh_UpdateSinhVien(?)}");
			csmt.setNString("MaTVDD", model.getMaThanhVienDiemDanh());
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { 
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	public static ThanhVienModel getThanhVienByCard(String ID) {
		ThanhVienModel thanhVienModel = new ThanhVienModel();
			try {
				PreparedStatement preparedStatement = DataUtil
						.getConnection()
						.prepareStatement(
								Constant.SQL_RES
										.getString("diemDanh.sql.getThanhVienByID"));
				preparedStatement.setString(1, ID);
				ResultSet rs = preparedStatement.executeQuery();
				if (rs.next()) {
					thanhVienModel.setTenLot(rs.getString("Ten_Lot"));
					thanhVienModel.setHoThanhVien(rs.getString("Ho"));
					thanhVienModel.setTenThanhVien(rs.getString("Ten"));
					thanhVienModel.setUser1(rs.getString("Hinh_Thanh_Vien"));
					return thanhVienModel;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return null;
	}
	
	public static ArrayList<KhoaModel> getThongTinGiaoVienReport() {

		// TODO Auto-generated method stub
		String maKhoa = "na", maLop = "na", maNamHoc = "na", tenGiaoVien = "na",maMonHoc="na";
		ArrayList<KhoaModel> khoaList = new ArrayList<KhoaModel>();
		ArrayList<LopHocModel> lopHocList = new ArrayList<LopHocModel>();
		ArrayList<NamHocModel> namHocList = new ArrayList<NamHocModel>();
		ArrayList<ThanhVienModel> thanhVienList = new ArrayList<ThanhVienModel>();
		ArrayList<MonHocModel> monHocList = new ArrayList<MonHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThongTinReportGiaoVien"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				if(!maKhoa.equals(rs.getString("MaKhoa"))) {
					KhoaModel khoa = new KhoaModel();
					khoa.setMaKhoa(rs.getString("MaKhoa"));
					khoa.setTenKhoa(rs.getString("TenKhoa"));
					lopHocList = new ArrayList<LopHocModel>();
					khoa.setLopHocList(lopHocList);
					khoaList.add(khoa);
				}
				if(!maLop.equals(rs.getString("MaLop")) || !maKhoa.equals(rs.getString("MaKhoa"))) {
					LopHocModel lopHoc = new LopHocModel();
					lopHoc.setMaLopHoc(rs.getString("MaLop"));
					lopHoc.setKiHieu(rs.getString("KiHieuLop"));
					namHocList = new ArrayList<NamHocModel>();
					lopHoc.setNamHocList(namHocList);
					lopHocList.add(lopHoc);
				}
				if(!maNamHoc.equals(rs.getString("MaNamHoc")) || !maLop.equals(rs.getString("MaLop")) || !maKhoa.equals(rs.getString("MaKhoa"))) {
					NamHocModel namHoc = new NamHocModel();
					namHoc.setMaNamHoc(rs.getString("MaNamHoc"));
					namHoc.setNamBatDau(rs.getString("NamBatDau"));
					namHoc.setNamKetThuc(rs.getString("NamKetThuc"));
					thanhVienList = new ArrayList<ThanhVienModel>();
					namHoc.setThanhVienList(thanhVienList);
					namHocList.add(namHoc);
				}
				if(!maNamHoc.equals(rs.getString("MaNamHoc"))||!tenGiaoVien.equals(rs.getString("MaThanhVien"))||!maLop.equals(rs.getString("MaLop")) || !maKhoa.equals(rs.getString("MaKhoa")))
				{
					ThanhVienModel thanhVien = new ThanhVienModel();
					thanhVien.setMaThanhVien(rs.getString("MaThanhVien"));
					thanhVien.setTenThanhVien(rs.getString("Ho") + " " + rs.getString("TenLot") + " " + rs.getString("Ten"));
					monHocList = new ArrayList<MonHocModel>();
					thanhVien.setMonHocList(monHocList);
					thanhVienList.add(thanhVien);
				}
				if(!maMonHoc.equals(rs.getString("MaMonHoc"))||!maNamHoc.equals(rs.getString("MaNamHoc"))||!tenGiaoVien.equals(rs.getString("MaThanhVien"))||!maLop.equals(rs.getString("MaLop")) || !maKhoa.equals(rs.getString("MaKhoa")))
				{
					MonHocModel monHoc= new MonHocModel();
					monHoc.setMaMonHoc(rs.getString("MaMonHoc"));
					monHoc.setTenMonHoc(rs.getString("TenMonHoc"));
					monHocList.add(monHoc);
				}
				/*
				MonHocTKBModel monHocTKB = new MonHocTKBModel();
				monHocTKB.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				monHocTKB.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocTKB.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocTKB.setMaGiaoVien(rs.getString("MaThanhVien"));
				monHocTKB.setTenGiaoVien(rs.getString("Ho") + " " + rs.getString("TenLot") + " " + rs.getString("Ten"));
				monHocTKBList.add(monHocTKB);\
				*/
				maKhoa = rs.getString("MaKhoa");
				maLop = rs.getString("MaLop");
				maNamHoc = rs.getString("MaNamHoc");
				tenGiaoVien = rs.getString("MaThanhVien");
				maMonHoc = rs.getString("MaMonHoc");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return khoaList;
	}
	public static ArrayList<DiemDanhModel> getGiaoVienByDieuKien(String Khoa, String Lop, 
			String NamHoc, String GiaoVien, String MonHoc,String ThoiGian) {
	ArrayList<DiemDanhModel> list = new ArrayList<DiemDanhModel>();		
	try {
		CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_DiemDanh_GetGiaoVienByDieuKien(?,?,?,?,?,?)}");		
		csmt.setString("Khoa", Khoa);
		csmt.setString("Lop", Lop);
		csmt.setString("NamHoc", NamHoc);
		csmt.setString("GiaoVien", GiaoVien);
		csmt.setString("MonHoc", MonHoc);
		csmt.setString("ThoiGian", ThoiGian);
		ResultSet rs = DataUtil.executeStore(csmt);	
		while(rs.next()) {
			DiemDanhModel model = new DiemDanhModel();
			model.setTenPhong(rs.getString("KiHieuLop"));
			model.setTenGiaoVien(rs.getString("TenGiaoVien"));
			model.setTenMonHoc(rs.getString("TenMonHoc"));
			model.setTenPhong(rs.getString("KiHieuPhong"));
			model.setBuoi(rs.getString("Buoi"));
			model.setTenKhoa(rs.getString("TenKhoa"));
			model.setNgayBatDau(rs.getString("NgayHoc"));
			model.setHinhThucDay(rs.getString("HinhThucDay"));
			list.add(model);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
					
	return list;
}
}
