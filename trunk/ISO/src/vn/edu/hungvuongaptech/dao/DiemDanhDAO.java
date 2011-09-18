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
import vn.edu.hungvuongaptech.model.NhomModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThoiGianGiangDayModel;
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
	
	public static ArrayList<KhoaModel> getThongTinGiaoVienReport(String maThanhVien, String maVaiTro, String maBoPhan) {
		String dkMaGiaoVien = "";
		String dkMaKhoa = "";
		if(maVaiTro.equals("5") || maVaiTro.equals("6")){
			dkMaKhoa = " AND E.ID = " + maBoPhan;
		}
		if(maVaiTro.equals("8")){
			dkMaGiaoVien = " AND H.ID = " + maThanhVien;
		}
		ArrayList<KhoaModel> khoaList = new ArrayList<KhoaModel>();
		try {
			String sql = "select distinct e.id As MaKhoa, e.Ten as TenKhoa "
						+" from thoikhoabieu a inner join NamHoc b on b.Nam_bat_dau = a.Nam_bat_dau " 
						+" inner join LopHoc c on c.ID = a.Ma_lop inner join ChuyenNganh d on d.ID = c.Ma_chuyen_nganh " 
						+" inner join Khoa_trungtam e on e.ID = d.Ma_khoaTT inner join monhoctkb as f on a.id = f.Ma_tkb " 
						+" inner join monhoc as g on f.ma_mon_hoc = g.id inner join thanhvien as h on f.ma_giao_vien = h.id " 
						+" inner join chitietthanhvien as i on h.Ten_dn = i.ten_dang_nhap where a.tinh_trang = 2 "+dkMaGiaoVien+dkMaKhoa
						+" order by e.id,e.Ten";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				KhoaModel khoa = new KhoaModel();
				khoa.setMaKhoa(rs.getString("MaKhoa"));
				khoa.setTenKhoa(rs.getString("TenKhoa"));
				khoaList.add(khoa);
			}
			for (KhoaModel khoa : khoaList) {
				khoa.setLopHocList(getThongTinGiaoVienReport(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa()));
				for (LopHocModel lop : khoa.getLopHocList()) {
					lop.setNamHocList(getThongTinGiaoVienReport(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc()));
					for (NamHocModel nam : lop.getNamHocList()) {
						nam.setThanhVienList(getThongTinGiaoVienReport(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc(), nam.getMaNamHoc()));
						for (ThanhVienModel thanhVien : nam.getThanhVienList()) {
							thanhVien.setMonHocList(getThongTinGiaoVienReport(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc(), nam.getMaNamHoc(), thanhVien.getMaThanhVien()));
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return khoaList;
	}
	
	public static ArrayList<LopHocModel> getThongTinGiaoVienReport(String maThanhVien, String maVaiTro, String maBoPhan, String khoa) {
		String dkMaGiaoVien = "";
		String dkMaKhoa = "";
		
		if(maVaiTro.equals("5") || maVaiTro.equals("6")){
			dkMaKhoa = " AND E.ID = " + maBoPhan;
		}
		
		if(maVaiTro.equals("8")){
			dkMaGiaoVien = " AND H.ID = " + maThanhVien;
		}
		
		ArrayList<LopHocModel> lopHocList = new ArrayList<LopHocModel>();
		try {
			String sql = "select distinct c.id AS MaLop, c.Ki_hieu AS KiHieuLop, d.Ten_chuyen_nganh "
						+" from thoikhoabieu a inner join NamHoc b on b.Nam_bat_dau = a.Nam_bat_dau "
						+" inner join LopHoc c on c.ID = a.Ma_lop inner join ChuyenNganh d on d.ID = c.Ma_chuyen_nganh "
						+" inner join Khoa_trungtam e on e.ID = d.Ma_khoaTT inner join monhoctkb as f on a.id = f.Ma_tkb "
						+" inner join monhoc as g on f.ma_mon_hoc = g.id inner join thanhvien as h on f.ma_giao_vien = h.id " 
						+" inner join chitietthanhvien as i on h.Ten_dn = i.ten_dang_nhap " 
						+" where a.tinh_trang = 2 and e.id = ? "+dkMaGiaoVien+dkMaKhoa
						+" order by c.id";
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				LopHocModel lopHoc = new LopHocModel();
				lopHoc.setMaLopHoc(rs.getString("MaLop"));
				lopHoc.setKiHieu(rs.getString("KiHieuLop"));
				lopHocList.add(lopHoc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return lopHocList;
	}
	
	
	public static ArrayList<NamHocModel> getThongTinGiaoVienReport(String maThanhVien, String maVaiTro, String maBoPhan, String khoa, String lop) {
		String dkMaGiaoVien = "";
		String dkMaKhoa = "";
		
		if(maVaiTro.equals("5") || maVaiTro.equals("6")){
			dkMaKhoa = " AND E.ID = " + maBoPhan;
		}
		
		if(maVaiTro.equals("8")){
			dkMaGiaoVien = " AND H.ID = " + maThanhVien;
		}
		
		ArrayList<NamHocModel> namHocList = new ArrayList<NamHocModel>();
		try {
			String sql = "select distinct b.id as MaNamHoc, b.Nam_bat_dau as NamBatdau, b.Nam_ket_thuc as NamKetThuc "
						+" from thoikhoabieu a inner join NamHoc b on b.Nam_bat_dau = a.Nam_bat_dau "
						+" inner join LopHoc c on c.ID = a.Ma_lop inner join ChuyenNganh d on d.ID = c.Ma_chuyen_nganh " 
						+" inner join Khoa_trungtam e on e.ID = d.Ma_khoaTT inner join monhoctkb as f on a.id = f.Ma_tkb " 
						+" inner join monhoc as g on f.ma_mon_hoc = g.id inner join thanhvien as h on f.ma_giao_vien = h.id " 
						+" inner join chitietthanhvien as i on h.Ten_dn = i.ten_dang_nhap "
						+" where a.tinh_trang = 2 and e.id =? and c.id=? "+dkMaGiaoVien+dkMaKhoa
						+" order by b.id ";
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			preparedStatement.setString(2, lop);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				NamHocModel namHoc = new NamHocModel();
				namHoc.setMaNamHoc(rs.getString("MaNamHoc"));
				namHoc.setNamBatDau(rs.getString("NamBatDau"));
				namHoc.setNamKetThuc(rs.getString("NamKetThuc"));
				namHocList.add(namHoc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return namHocList;
	}
	
	public static ArrayList<ThanhVienModel> getThongTinGiaoVienReport(String maThanhVien, String maVaiTro, String maBoPhan, String khoa, String lop, String nam) {
		String dkMaGiaoVien = "";
		String dkMaKhoa = "";
		
		if(maVaiTro.equals("5") || maVaiTro.equals("6")){
			dkMaKhoa = " AND E.ID = " + maBoPhan;
		}
		
		if(maVaiTro.equals("8")){
			dkMaGiaoVien = " AND H.ID = " + maThanhVien;
		}
		
		ArrayList<ThanhVienModel> thanhVienList = new ArrayList<ThanhVienModel>();
		try {
			String sql = "select distinct h.id As MaThanhVien, IsNull(i.Ho,'') AS Ho, IsNull(i.Ten_Lot,'') As TenLot, IsNull(i.Ten,'') As Ten "
						+" from thoikhoabieu a inner join NamHoc b on b.Nam_bat_dau = a.Nam_bat_dau "
						+" inner join LopHoc c on c.ID = a.Ma_lop inner join ChuyenNganh d on d.ID = c.Ma_chuyen_nganh " 
						+" inner join Khoa_trungtam e on e.ID = d.Ma_khoaTT inner join monhoctkb as f on a.id = f.Ma_tkb "
						+" inner join monhoc as g on f.ma_mon_hoc = g.id inner join thanhvien as h on f.ma_giao_vien = h.id " 
						+" inner join chitietthanhvien as i on h.Ten_dn = i.ten_dang_nhap "
						+" where a.tinh_trang=2 and e.id=? and c.id=? and b.id=? "+dkMaGiaoVien+dkMaKhoa
						+" order by h.id ";
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			preparedStatement.setString(2, lop);
			preparedStatement.setString(3, nam);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThanhVienModel thanhVien = new ThanhVienModel();
				thanhVien.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVien.setTenThanhVien(rs.getString("Ho") + " " + rs.getString("TenLot") + " " + rs.getString("Ten"));
				thanhVienList.add(thanhVien);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return thanhVienList;
	}
	
	public static ArrayList<MonHocModel> getThongTinGiaoVienReport(String maThanhVien, String maVaiTro, String maBoPhan, String khoa, String lop, String nam,String thanhVien) {
		String dkMaGiaoVien = "";
		String dkMaKhoa = "";
		
		if(maVaiTro.equals("5") || maVaiTro.equals("6")){
			dkMaKhoa = " AND E.ID = " + maBoPhan;
		}
		
		if(maVaiTro.equals("8")){
			dkMaGiaoVien = " AND H.ID = " + maThanhVien;
		}
		
		ArrayList<MonHocModel> monHocList = new ArrayList<MonHocModel>();
		try {
			String sql = "select distinct g.id AS MaMonHoc, g.Ten_mon_hoc AS TenMonHoc "
						+" from thoikhoabieu a inner join NamHoc b on b.Nam_bat_dau = a.Nam_bat_dau "
						+" inner join LopHoc c on c.ID = a.Ma_lop inner join ChuyenNganh d on d.ID = c.Ma_chuyen_nganh " 
						+" inner join Khoa_trungtam e on e.ID = d.Ma_khoaTT inner join monhoctkb as f on a.id = f.Ma_tkb " 
						+" inner join monhoc as g on f.ma_mon_hoc = g.id inner join thanhvien as h on f.ma_giao_vien = h.id " 
						+" inner join chitietthanhvien as i on h.Ten_dn = i.ten_dang_nhap "
						+" where a.tinh_trang=2 and e.id=? and c.id=? and b.id=? and h.id=? "+dkMaGiaoVien+dkMaKhoa
						+" order by g.id ";
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			preparedStatement.setString(2, lop);
			preparedStatement.setString(3, nam);
			preparedStatement.setString(4, thanhVien);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				MonHocModel monHoc= new MonHocModel();
				monHoc.setMaMonHoc(rs.getString("MaMonHoc"));
				monHoc.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocList.add(monHoc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return monHocList;
	}
	
	public static ArrayList<KhoaModel> getThongTinHocSinhReport(String maThanhVien, String maVaiTro, String maBoPhan) {
		String dkMaHocSinh = "";
		if(maVaiTro.equals("9")){
			dkMaHocSinh = " AND D.ID = " + maThanhVien;
		}
		ArrayList<KhoaModel> khoaList = new ArrayList<KhoaModel>();
		try {
			String sql = "SELECT DISTINCT F.ID AS MAKHOA,F.TEN AS TENKHOA "
						+" FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID "
						+" INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID "
						+" INNER JOIN THANHVIEN D ON B.MA_THANH_VIEN=D.ID "
						+" INNER JOIN CHITIETTHANHVIEN E ON D.TEN_DN=E.TEN_DANG_NHAP "
						+" INNER JOIN THANHVIEN G ON C.MA_GIAO_VIEN=G.ID "
						+" INNER JOIN CHITIETTHANHVIEN H ON G.TEN_DN=H.TEN_DANG_NHAP "
						+" INNER JOIN MONHOC J ON C.MA_MON_HOC=J.ID "
						+" INNER JOIN LOPHOC K ON C.MA_LOP_HOC=K.ID "
						+" INNER JOIN CHUYENNGANH M ON K.MA_CHUYEN_NGANH=M.ID "
						+" INNER JOIN KHOA_TRUNGTAM F ON M.MA_KHOATT=F.ID "
						+" INNER JOIN THOIKHOABIEU L ON C.MA_CT_TKB = L.ID "
						+" WHERE L.TINH_TRANG='2' "+dkMaHocSinh;
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				KhoaModel khoa = new KhoaModel();
				khoa.setMaKhoa(rs.getString("MAKHOA"));
				khoa.setTenKhoa(rs.getString("TENKHOA"));
				khoaList.add(khoa);
			}
			for (KhoaModel khoa : khoaList) {
				khoa.setLopHocList(getThongTinHocSinhReport(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa()));
				for (LopHocModel lop : khoa.getLopHocList()) {
					lop.setNamHocList(getThongTinHocSinhReport(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc()));
					for (NamHocModel nam : lop.getNamHocList()) {
						nam.setNhomList(getThongTinHocSinhReport(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc(), nam.getMaNamHoc()));
						if(nam.getNhomList().size()==0){
							NhomModel nhom = new NhomModel();
							nhom.setNhom("");
							nhom.setMonHocList(getThongTinHocSinhReportMonHoc(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc(), nam.getMaNamHoc(), ""));
							nhom.setThanhVienList(getThongTinHocSinhReportHocSinh(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc(), nam.getMaNamHoc(), ""));
							nam.getNhomList().add(nhom);
						}
						else{
							for (NhomModel nhomModel : nam.getNhomList()) {
								nhomModel.setMonHocList(getThongTinHocSinhReportMonHoc(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc(), nam.getMaNamHoc(), nhomModel.getNhom()));
								nhomModel.setThanhVienList(getThongTinHocSinhReportHocSinh(maThanhVien, maVaiTro, maBoPhan, khoa.getMaKhoa(), lop.getMaLopHoc(), nam.getMaNamHoc(), nhomModel.getNhom()));
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return khoaList;
	}
	
	public static ArrayList<LopHocModel> getThongTinHocSinhReport(String maThanhVien, String maVaiTro, String maBoPhan, String khoa) {
		String dkMaHocSinh = "";
		if(maVaiTro.equals("9")){
			dkMaHocSinh = " AND D.ID = " + maThanhVien;
		}
		
		ArrayList<LopHocModel> lopHocList = new ArrayList<LopHocModel>();
		try {
			String sql = "SELECT DISTINCT K.ID AS MALOP, K.KI_HIEU AS TENLOP " 
						+" FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID "
						+" INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID "
						+" INNER JOIN THANHVIEN D ON B.MA_THANH_VIEN=D.ID "
						+" INNER JOIN CHITIETTHANHVIEN E ON D.TEN_DN=E.TEN_DANG_NHAP "
						+" INNER JOIN THANHVIEN G ON C.MA_GIAO_VIEN=G.ID "
						+" INNER JOIN CHITIETTHANHVIEN H ON G.TEN_DN=H.TEN_DANG_NHAP "
						+" INNER JOIN MONHOC J ON C.MA_MON_HOC=J.ID "
						+" INNER JOIN LOPHOC K ON C.MA_LOP_HOC=K.ID "
						+" INNER JOIN CHUYENNGANH M ON K.MA_CHUYEN_NGANH=M.ID "
						+" INNER JOIN KHOA_TRUNGTAM F ON M.MA_KHOATT=F.ID "
						+" INNER JOIN THOIKHOABIEU L ON C.MA_CT_TKB = L.ID "
						+" WHERE L.TINH_TRANG='2' AND F.ID=? "+dkMaHocSinh;
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				LopHocModel lopHoc = new LopHocModel();
				lopHoc.setMaLopHoc(rs.getString("MALOP"));
				lopHoc.setKiHieu(rs.getString("TENLOP"));
				lopHocList.add(lopHoc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return lopHocList;
	}
	
	public static ArrayList<NamHocModel> getThongTinHocSinhReport(String maThanhVien, String maVaiTro, String maBoPhan, String khoa, String lop) {
		String dkMaHocSinh = "";
		if(maVaiTro.equals("9")){
			dkMaHocSinh = " AND D.ID = " + maThanhVien;
		}
		
		ArrayList<NamHocModel> namHocList = new ArrayList<NamHocModel>();
		try {
			String sql = "SELECT DISTINCT L.NAM_BAT_DAU AS MANAMHOC,(CAST(L.NAM_BAT_DAU AS VARCHAR)+'-'+ CAST(L.NAM_KET_THUC AS VARCHAR)) AS NIENKHOA "
						+" FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID "
						+" INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID "
						+" INNER JOIN THANHVIEN D ON B.MA_THANH_VIEN=D.ID "
						+" INNER JOIN CHITIETTHANHVIEN E ON D.TEN_DN=E.TEN_DANG_NHAP "
						+" INNER JOIN THANHVIEN G ON C.MA_GIAO_VIEN=G.ID "
						+" INNER JOIN CHITIETTHANHVIEN H ON G.TEN_DN=H.TEN_DANG_NHAP "
						+" INNER JOIN MONHOC J ON C.MA_MON_HOC=J.ID "
						+" INNER JOIN LOPHOC K ON C.MA_LOP_HOC=K.ID "
						+" INNER JOIN CHUYENNGANH M ON K.MA_CHUYEN_NGANH=M.ID "
						+" INNER JOIN KHOA_TRUNGTAM F ON M.MA_KHOATT=F.ID "
						+" INNER JOIN THOIKHOABIEU L ON C.MA_CT_TKB = L.ID "
						+" WHERE L.TINH_TRANG='2' AND F.ID=? AND K.ID=? "+dkMaHocSinh;
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			preparedStatement.setString(2, lop);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				NamHocModel namHoc = new NamHocModel();
				namHoc.setMaNamHoc(rs.getString("MANAMHOC"));
				namHoc.setNamBatDau(rs.getString("NIENKHOA"));
				namHocList.add(namHoc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return namHocList;
	}
	
	public static ArrayList<NhomModel> getThongTinHocSinhReport(String maThanhVien, String maVaiTro, String maBoPhan, String khoa, String lop, String nam) {
		String dkMaHocSinh = "";
		if(maVaiTro.equals("9")){
			dkMaHocSinh = " AND D.ID = " + maThanhVien;
		}
		
		ArrayList<NhomModel> nhomList = new ArrayList<NhomModel>();
		try {
			String sql = "SELECT DISTINCT B.USER1 AS NHOM "
						+" FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID "
						+" INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID "
						+" INNER JOIN THANHVIEN D ON B.MA_THANH_VIEN=D.ID "
						+" INNER JOIN CHITIETTHANHVIEN E ON D.TEN_DN=E.TEN_DANG_NHAP "
						+" INNER JOIN THANHVIEN G ON C.MA_GIAO_VIEN=G.ID "
						+" INNER JOIN CHITIETTHANHVIEN H ON G.TEN_DN=H.TEN_DANG_NHAP "
						+" INNER JOIN MONHOC J ON C.MA_MON_HOC=J.ID "
						+" INNER JOIN LOPHOC K ON C.MA_LOP_HOC=K.ID "
						+" INNER JOIN CHUYENNGANH M ON K.MA_CHUYEN_NGANH=M.ID "
						+" INNER JOIN KHOA_TRUNGTAM F ON M.MA_KHOATT=F.ID "
						+" INNER JOIN THOIKHOABIEU L ON C.MA_CT_TKB = L.ID "
						+" WHERE L.TINH_TRANG='2' AND F.ID=? AND K.ID=? AND L.NAM_BAT_DAU=? "+dkMaHocSinh;
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			preparedStatement.setString(2, lop);
			preparedStatement.setString(3, nam);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				NhomModel model = new NhomModel();
				model.setNhom(rs.getString("NHOM"));
				nhomList.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return nhomList;
	}
	
	public static ArrayList<MonHocModel> getThongTinHocSinhReportMonHoc(String maThanhVien, String maVaiTro, String maBoPhan, String khoa, String lop, String nam, String nhom) {
		String dkMaHocSinh = "";
		if(maVaiTro.equals("9")){
			dkMaHocSinh = " AND D.ID = " + maThanhVien;
		}
		
		ArrayList<MonHocModel> monHocList = new ArrayList<MonHocModel>();
		try {
			String sql = "SELECT DISTINCT J.ID AS MAMONHOC,J.TEN_MON_HOC AS TENMONHOC,G.ID AS MAGIAOVIEN,(H.HO+' '+H.TEN_LOT+' '+H.TEN) AS TENGIAOVIEN "
						+" FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID "
						+" INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID "
						+" INNER JOIN THANHVIEN D ON B.MA_THANH_VIEN=D.ID "
						+" INNER JOIN CHITIETTHANHVIEN E ON D.TEN_DN=E.TEN_DANG_NHAP "
						+" INNER JOIN THANHVIEN G ON C.MA_GIAO_VIEN=G.ID "
						+" INNER JOIN CHITIETTHANHVIEN H ON G.TEN_DN=H.TEN_DANG_NHAP "
						+" INNER JOIN MONHOC J ON C.MA_MON_HOC=J.ID "
						+" INNER JOIN LOPHOC K ON C.MA_LOP_HOC=K.ID "
						+" INNER JOIN CHUYENNGANH M ON K.MA_CHUYEN_NGANH=M.ID "
						+" INNER JOIN KHOA_TRUNGTAM F ON M.MA_KHOATT=F.ID "
						+" INNER JOIN THOIKHOABIEU L ON C.MA_CT_TKB = L.ID "
						+" WHERE L.TINH_TRANG='2' AND F.ID=? AND K.ID=? AND L.NAM_BAT_DAU=? AND B.USER1=? "+dkMaHocSinh;
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			preparedStatement.setString(2, lop);
			preparedStatement.setString(3, nam);
			preparedStatement.setString(4, nhom);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				MonHocModel monHoc= new MonHocModel();
				monHoc.setMaMonHoc(rs.getString("MaMonHoc"));
				monHoc.setTenMonHoc(rs.getString("TenMonHoc"));
				monHoc.setUser1(rs.getString("MAGIAOVIEN"));
				monHoc.setUser2(rs.getString("TENGIAOVIEN"));
				monHocList.add(monHoc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return monHocList;
	}
	
	
	
	public static ArrayList<ThanhVienModel> getThongTinHocSinhReportHocSinh(String maThanhVien, String maVaiTro, String maBoPhan, String khoa, String lop, String nam, String nhom) {
		String dkMaHocSinh = "";
		if(maVaiTro.equals("9")){
			dkMaHocSinh = " AND D.ID = " + maThanhVien;
		}
		
		ArrayList<ThanhVienModel> thanhVienList = new ArrayList<ThanhVienModel>();
		try {
			String sql = "SELECT DISTINCT D.ID AS MAHOCSINH,(E.HO+' '+E.TEN_LOT+' '+E.TEN) AS TENHOCSINH "
						+" FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID "
						+" INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID "
						+" INNER JOIN THANHVIEN D ON B.MA_THANH_VIEN=D.ID "
						+" INNER JOIN CHITIETTHANHVIEN E ON D.TEN_DN=E.TEN_DANG_NHAP "
						+" INNER JOIN THANHVIEN G ON C.MA_GIAO_VIEN=G.ID "
						+" INNER JOIN CHITIETTHANHVIEN H ON G.TEN_DN=H.TEN_DANG_NHAP "
						+" INNER JOIN MONHOC J ON C.MA_MON_HOC=J.ID "
						+" INNER JOIN LOPHOC K ON C.MA_LOP_HOC=K.ID "
						+" INNER JOIN CHUYENNGANH M ON K.MA_CHUYEN_NGANH=M.ID "
						+" INNER JOIN KHOA_TRUNGTAM F ON M.MA_KHOATT=F.ID "
						+" INNER JOIN THOIKHOABIEU L ON C.MA_CT_TKB = L.ID "
						+" WHERE L.TINH_TRANG='2' AND F.ID=? AND K.ID=? AND L.NAM_BAT_DAU=? AND B.USER1=? "+dkMaHocSinh;
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);
			preparedStatement.setString(1, khoa);
			preparedStatement.setString(2, lop);
			preparedStatement.setString(3, nam);
			preparedStatement.setString(4, nhom);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThanhVienModel thanhVien = new ThanhVienModel();
				thanhVien.setMaThanhVien(rs.getString("MAHOCSINH"));
				thanhVien.setTenThanhVien(rs.getString("TENHOCSINH"));
				thanhVienList.add(thanhVien);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return thanhVienList;
	}
	
	
	
	@SuppressWarnings("deprecation")
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
			model.setMaThanhVienDiemDanh(rs.getString("MaGiaoVien"));
			model.setNhom(rs.getString("NHOM"));
			list.add(model);
		}
		
		for (DiemDanhModel diemDanh : list) {
			ThoiGianGiangDayModel model = getThoiGianGiangDayByMaGiaoVien(diemDanh.getMaThanhVienDiemDanh(), diemDanh.getNgayBatDau(), diemDanh.getBuoi());
			if(model.getTimeBatDau()!=null){
				if(model.getTimeBatDau().getHours()!=0){
					diemDanh.setGioBatDau(model.getTimeBatDau().getHours()+":"+model.getTimeBatDau().getMinutes());
				}
			}
			if( model.getTimeKetThuc()!=null){
				if(model.getTimeKetThuc().getHours()!=0){
					diemDanh.setGioKetThuc(model.getTimeKetThuc().getHours()+":"+model.getTimeKetThuc().getMinutes());
				}
			}
			if(model.getTimeBatDau()!=null && model.getTimeKetThuc()!=null){
				if(model.getTimeBatDau().getHours()!=0 && model.getTimeKetThuc().getHours()!=0){
					diemDanh.setGioGiangDay(model.getTime());
				}
			}
			
			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
					
	return list;
	}
	
	@SuppressWarnings("deprecation")
	public static ThoiGianGiangDayModel getThoiGianGiangDayByMaGiaoVien(String id, String ngayHoc, String buoi){
		ThoiGianGiangDayModel model = null;
		String dkBuoi = "";
		if(ngayHoc.equals("")){
			return null;
		}
		if(buoi!=null){
			dkBuoi = " AND E.Buoi LIKE N'%"+buoi+"%'";
		}
		try {
			String sql = "select MIN(Gio_bat_dau) as Gio_bat_dau,MIN(Gio_ket_thuc) as Gio_ket_thuc "
						+" from chitietdiemdanh where id in (SELECT E.ID " 
						+" FROM diemdanh C "
						+" INNER JOIN thanhviendiemdanh D on C.ID = D.Ma_diem_danh "
						+" INNER JOIN chitietdiemdanh E on E.Ma_TVDD = D.ID "
						+" WHERE Convert(varchar(10),E.Ngay_hoc,105) = ? " 
						+" AND C.Ma_giao_vien = ? "+dkBuoi+")";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, ngayHoc);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new ThoiGianGiangDayModel();
				model.setBatDau(rs.getString("Gio_bat_dau"));
				model.setKetThuc(rs.getString("Gio_ket_thuc"));
			}
			int total = 0;
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			if(model.getBatDau()!=null){
				model.setTimeBatDau(format.parse(model.getBatDau()));
			}
			if(model.getKetThuc()!=null){
				model.setTimeKetThuc(format.parse(model.getKetThuc()));
			}
			if(model.getBatDau()!=null && model.getKetThuc()!=null){
				total = (model.getTimeKetThuc().getHours()*60+model.getTimeKetThuc().getMinutes())-(model.getTimeBatDau().getHours()*60+model.getTimeBatDau().getMinutes());
			}
			
			String time = "";
			if(total!=0){
				time = total/60+"h"+total%60;
			}
			model.setTime(time);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
}
