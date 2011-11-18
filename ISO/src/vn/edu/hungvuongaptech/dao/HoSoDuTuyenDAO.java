package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.HoSoDuTuyenModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class HoSoDuTuyenDAO {
	public static int insertHoSoDuTuyen(String tendangnhap, String ho, String tenlot,String ten, String gioitinh,String ngaysinh,String cmnd,String ngayCap, String noiCap,String sonha,String duong,String phuongxa,String quanhuyen, String tinhtp,String dienthoainha,String email,String dienthoaidd,String trinhdovanhoa,String chuyenmon,String ngoaingu,String tinhoc,String tomtatbanthan,String vitridutuyen){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertHoSoDuTuyen(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Ten_dang_nhap", tendangnhap);
			csmt.setString("Ho", ho);
			csmt.setString("Ten_lot", tenlot);
			csmt.setString("Ten", ten);
			csmt.setString("Gioi_tinh", gioitinh);
			csmt.setString("Ngay_sinh", ngaysinh);
			csmt.setString("CMND", cmnd);
			csmt.setString("Ngay_cap", ngayCap);
			csmt.setString("Noi_cap", noiCap);
			csmt.setString("So_nha", sonha);
			csmt.setString("Duong", duong);
			csmt.setString("Phuong_xa", phuongxa);
			csmt.setString("Quan_huyen", quanhuyen);
			csmt.setString("Tinh_thanhpho", tinhtp);
			csmt.setString("Dien_thoai_nha",dienthoainha);
			csmt.setString("EMAIL",email);
			csmt.setString("Dien_thoai_dd", dienthoaidd);
			csmt.setString("Trinh_do_van_hoa", trinhdovanhoa);
			csmt.setString("Chuyen_mon", chuyenmon);
			csmt.setString("Tin_hoc", tinhoc);
			csmt.setString("Ngoai_ngu", ngoaingu);
			csmt.setString("Tom_tat_ban_than",tomtatbanthan);
			csmt.setString("Vi_tri_du_tuyen",vitridutuyen);
			csmt.registerOutParameter("KQ",java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static ArrayList<HoSoDuTuyenModel> getAllHoSo(){
		ArrayList<HoSoDuTuyenModel> list = new ArrayList<HoSoDuTuyenModel>();
		String gioitinh="";
		try {
			String sql = "SELECT A.*,(A.Ho+' '+A.Ten_lot+' '+A.Ten) as Ho_ten,(A.So_nha+' '+A.Duong+', P.'+A.Phuong_xa+', Q.'+A.Quan_huyen+', '+A.Tinh_thanhpho) as Dia_chi,D.Ten_vai_tro as Ten_vai_tro,E.Ten as Ten_bo_phan,E.Ma_truong_khoa as Ma_truong_khoa,CONVERT(VARCHAR(10),A.Ngay_cap,105) as ngay_cap_mdy,CONVERT(VARCHAR(10),A.Ngay_sinh,105) as ngay_sinh_mdy,B.So_luong_da_tuyen,C.So_luong  "
						+" FROM HOSODUTUYEN A LEFT JOIN CHITIETKHTNS B ON A.Vi_tri_du_tuyen=B.ID "
						+" LEFT JOIN DENGHINHANSU C ON B.Ma_de_nghi=C.ID "
						+" LEFT JOIN VAITRO D ON C.Chuc_danh=D.ID "
						+" LEFT JOIN KHOA_TRUNGTAM E ON C.Ma_bo_phan=E.ID"
						+" WHERE C.So_luong > B.So_luong_da_tuyen or A.Tinh_trang > 0"
						+" ORDER BY A.NGAY_CAP_NHAT_CUOI DESC";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getString("Gioi_tinh").equals("0")){
					gioitinh = "Nữ";
				}
				else if(rs.getString("Gioi_tinh").equals("1")){
					gioitinh = "Nam";
				}
				System.out.print(rs.getString("Gioi_tinh"));
				HoSoDuTuyenModel model = new HoSoDuTuyenModel();
				model.setId(rs.getString("ID"));
				model.setTen_dang_nhap(rs.getString("Ten_dang_nhap"));
				model.setHo(rs.getString("Ho"));
				model.setTen_lot(rs.getString("Ten_lot"));
				model.setTen(rs.getString("Ten"));
				model.setGioi_tinh(gioitinh);
				model.setNgay_sinh(rs.getString("Ngay_sinh"));
				model.setGhi_chu(rs.getString("Ghi_chu"));
				model.setCmnd(rs.getString("CMND"));
				model.setNgay_cap(rs.getString("ngay_cap_mdy"));
				model.setNoi_cap(rs.getString("Noi_cap"));
				model.setSo_nha(rs.getString("So_nha"));
				model.setDuong(rs.getString("Duong"));
				model.setPhuong_xa(rs.getString("Phuong_xa"));
				model.setQuan_huyen(rs.getString("Quan_huyen"));
				model.setTinh_thanhpho(rs.getString("Tinh_thanhpho"));
				model.setDien_thoai_nha(rs.getString("Dien_thoai_nha"));
				model.setEmail(rs.getString("Email"));
				model.setDien_thoai_dd(rs.getString("Dien_thoai_dd"));
				model.setTrinh_do_van_hoa(rs.getString("Trinh_do_van_hoa"));
				model.setChuyen_mon(rs.getString("Chuyen_mon"));
				model.setTin_hoc(rs.getString("Tin_hoc"));
				model.setNgoai_ngu(rs.getString("Ngoai_ngu"));
				model.setTom_tat_ban_than_area(rs.getString("Tom_tat_ban_than"));
				model.setTom_tat_ban_than(rs.getString("Tom_tat_ban_than").replace("\r\n", "<br/>"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setVi_tri_du_tuyen(rs.getString("Vi_tri_du_tuyen"));
				model.setMa_truong_khoa(rs.getString("Ma_truong_khoa"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_vai_tro(rs.getString("Ten_vai_tro"));
				model.setNgay_sinh_mdy(rs.getString("Ngay_sinh_mdy"));
				model.setDia_chi(rs.getString("Dia_chi"));
				model.setHo_ten(rs.getString("Ho_ten"));
				model.setSo_luong(rs.getString("So_luong"));
				model.setSo_luong_da_tuyen(rs.getString("So_luong_da_tuyen"));
				list.add(model);
			}
			for (HoSoDuTuyenModel model : list) {
				model.setDeNghiKTV(DeNghiKhoanThuViecDAO.getDeNghiKTVByNguoiDuTuyen(model.getId()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<HoSoDuTuyenModel> getAllHoSoByTinhTrang(String TinhTrang){
		ArrayList<HoSoDuTuyenModel> list = new ArrayList<HoSoDuTuyenModel>();
		String gioitinh="";
		String tinhTrang = "";
		if(!TinhTrang.equals("")){
			tinhTrang = " WHERE A.TINH_TRANG=? ";
		}
		try {
			String sql = "SELECT A.*,(A.Ho+' '+A.Ten_lot+' '+A.Ten) as Ho_ten,(A.So_nha+' '+A.Duong+', P.'+A.Phuong_xa+', Q.'+A.Quan_huyen+', '+A.Tinh_thanhpho) as Dia_chi,D.ID as Ma_vai_tro,D.Ten_vai_tro as Ten_vai_tro,E.Ten as Ten_bo_phan,E.Ma_truong_khoa as Ma_truong_khoa,CONVERT(VARCHAR(10),A.Ngay_cap,105) as ngay_cap_mdy,CONVERT(VARCHAR(10),A.Ngay_sinh,105) as ngay_sinh_mdy,B.So_luong_da_tuyen,C.So_luong "
						+" FROM HOSODUTUYEN A LEFT JOIN CHITIETKHTNS B ON A.Vi_tri_du_tuyen=B.ID "
						+" LEFT JOIN DENGHINHANSU C ON B.Ma_de_nghi=C.ID "
						+" LEFT JOIN VAITRO D ON C.Chuc_danh=D.ID "
						+" LEFT JOIN KHOA_TRUNGTAM E ON C.Ma_bo_phan=E.ID " 
						+ tinhTrang
						+" ORDER BY B.ID";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			if(!TinhTrang.equals("")){
				ps.setString(1, TinhTrang);
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getString("Gioi_tinh").equals("0")){
					gioitinh = "Nữ";
				}
				else if(rs.getString("Gioi_tinh").equals("1")){
					gioitinh = "Nam";
				}
				HoSoDuTuyenModel model = new HoSoDuTuyenModel();
				model.setId(rs.getString("ID"));
				model.setTen_dang_nhap(rs.getString("Ten_dang_nhap"));
				model.setHo(rs.getString("Ho"));
				model.setTen_lot(rs.getString("Ten_lot"));
				model.setTen(rs.getString("Ten"));
				model.setGioi_tinh(gioitinh);
				model.setNgay_sinh(rs.getString("Ngay_sinh"));
				model.setGhi_chu(rs.getString("Ghi_chu"));
				model.setCmnd(rs.getString("CMND"));
				model.setNgay_cap(rs.getString("ngay_cap_mdy"));
				model.setNoi_cap(rs.getString("Noi_cap"));
				model.setSo_nha(rs.getString("So_nha"));
				model.setDuong(rs.getString("Duong"));
				model.setPhuong_xa(rs.getString("Phuong_xa"));
				model.setQuan_huyen(rs.getString("Quan_huyen"));
				model.setTinh_thanhpho(rs.getString("Tinh_thanhpho"));
				model.setDien_thoai_nha(rs.getString("Dien_thoai_nha"));
				model.setEmail(rs.getString("Email"));
				model.setDien_thoai_dd(rs.getString("Dien_thoai_dd"));
				model.setTrinh_do_van_hoa(rs.getString("Trinh_do_van_hoa"));
				model.setChuyen_mon(rs.getString("Chuyen_mon"));
				model.setTin_hoc(rs.getString("Tin_hoc"));
				model.setNgoai_ngu(rs.getString("Ngoai_ngu"));
				model.setTom_tat_ban_than(rs.getString("Tom_tat_ban_than").replace("\r\n", "<br/>"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setVi_tri_du_tuyen(rs.getString("Vi_tri_du_tuyen"));
				model.setMa_truong_khoa(rs.getString("Ma_truong_khoa"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_vai_tro(rs.getString("Ten_vai_tro"));
				model.setNgay_sinh_mdy(rs.getString("Ngay_sinh_mdy"));
				model.setDia_chi(rs.getString("Dia_chi"));
				model.setHo_ten(rs.getString("Ho_ten"));
				model.setMa_vai_tro(rs.getString("Ma_vai_tro"));
				model.setSo_luong(rs.getString("So_luong"));
				model.setSo_luong_da_tuyen(rs.getString("So_luong_da_tuyen"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static HoSoDuTuyenModel getHoSoByID(String id){
		HoSoDuTuyenModel model = null;
		String gioitinh="";
		try {
			String sql = "SELECT A.*, "
						+" (A.Ho+' '+A.Ten_lot+' '+A.Ten) as Ho_ten, "
						+" (A.So_nha+' '+A.Duong+', P.'+A.Phuong_xa+', Q.'+A.Quan_huyen+', '+A.Tinh_thanhpho) as Dia_chi, "
						+" D.ID as Ma_vai_tro,D.Ten_vai_tro as Ten_vai_tro,E.ID as Ma_bo_phan,E.Ten as Ten_bo_phan, "
						+" E.Ma_truong_khoa as Ma_truong_khoa,CONVERT(VARCHAR(10),A.Ngay_sinh,105) as ngay_sinh_mdy, "
						+" (j.Ho+' '+j.Ten_lot+' '+j.Ten) as Ten_truong_khoa, CONVERT(VARCHAR(10),A.Ngay_cap,105) as ngay_cap_mdy, CONVERT(VARCHAR(10),GETDATE(),105) AS NGAY_HE_THONG "
						+" FROM HOSODUTUYEN A LEFT JOIN CHITIETKHTNS B ON A.Vi_tri_du_tuyen=B.ID "
						+" LEFT JOIN DENGHINHANSU C ON B.Ma_de_nghi=C.ID "
						+" LEFT JOIN VAITRO D ON C.Chuc_danh=D.ID "
						+" LEFT JOIN KHOA_TRUNGTAM E ON C.Ma_bo_phan=E.ID "
						+" LEFT JOIN THANHVIEN F ON E.MA_TRUONG_KHOA=F.ID "
						+" LEFT JOIN CHITIETTHANHVIEN J ON F.TEN_DN=J.TEN_DANG_NHAP "
						+" WHERE A.ID=? ";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new HoSoDuTuyenModel();
				if(rs.getString("Gioi_tinh").equals("0")){
					gioitinh = "Nữ";
				}
				else if(rs.getString("Gioi_tinh").equals("1")){
					gioitinh = "Nam";
				}
				model.setId(rs.getString("ID"));
				model.setTen_dang_nhap(rs.getString("Ten_dang_nhap"));
				model.setHo(rs.getString("Ho"));
				model.setTen_lot(rs.getString("Ten_lot"));
				model.setTen(rs.getString("Ten"));
				model.setGioi_tinh(gioitinh);
				model.setNgay_sinh(rs.getString("Ngay_sinh"));
				model.setGhi_chu(rs.getString("Ghi_chu"));
				model.setCmnd(rs.getString("CMND"));
				model.setNgay_cap(rs.getString("ngay_cap_mdy"));
				model.setNoi_cap(rs.getString("Noi_cap"));
				model.setSo_nha(rs.getString("So_nha"));
				model.setDuong(rs.getString("Duong"));
				model.setPhuong_xa(rs.getString("Phuong_xa"));
				model.setQuan_huyen(rs.getString("Quan_huyen"));
				model.setTinh_thanhpho(rs.getString("Tinh_thanhpho"));
				model.setDien_thoai_nha(rs.getString("Dien_thoai_nha"));
				model.setEmail(rs.getString("Email"));
				model.setDien_thoai_dd(rs.getString("Dien_thoai_dd"));
				model.setTrinh_do_van_hoa(rs.getString("Trinh_do_van_hoa"));
				model.setChuyen_mon(rs.getString("Chuyen_mon"));
				model.setTin_hoc(rs.getString("Tin_hoc"));
				model.setNgoai_ngu(rs.getString("Ngoai_ngu"));
				model.setTom_tat_ban_than_area(rs.getString("Tom_tat_ban_than"));
				model.setTom_tat_ban_than(rs.getString("Tom_tat_ban_than").replace("\r\n", "<br/>"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setVi_tri_du_tuyen(rs.getString("Vi_tri_du_tuyen"));
				model.setNgay_cap_nhat_cuoi(rs.getString("NGAY_HE_THONG"));
				model.setMa_truong_khoa(rs.getString("Ma_truong_khoa"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_vai_tro(rs.getString("Ten_vai_tro"));
				model.setNgay_sinh_mdy(rs.getString("Ngay_sinh_mdy"));
				model.setDia_chi(rs.getString("Dia_chi"));
				model.setHo_ten(rs.getString("Ho_ten"));
				model.setMa_bo_phan(rs.getString("Ma_bo_phan"));
				model.setMa_vai_tro(rs.getString("Ma_vai_tro"));
				model.setTenTruongKhoa(rs.getString("TEN_TRUONG_KHOA"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static String updateHSDT(String id,String ghichu,String tinhtrang){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateHoSoDuTuyen(?,?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ghi_chu",ghichu);
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String getTK(String id){
		String maTK = "";
		try {
			String sql = "SELECT D.MA_TRUONG_KHOA AS TRUONGKHOA"
						+" FROM HOSODUTUYEN A "
						+" INNER JOIN CHITIETKHTNS B ON A.VI_TRI_DU_TUYEN=B.ID "
						+" INNER JOIN DENGHINHANSU C ON B.MA_DE_NGHI=C.ID "
						+" INNER JOIN KHOA_TRUNGTAM D ON C.MA_BO_PHAN=D.ID "
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				maTK = rs.getString("TRUONGKHOA");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maTK;
	}
	
	public static HoSoDuTuyenModel getHoSoByTenDangNhap(String tenDangNhap){
		HoSoDuTuyenModel model = null;
		String gioitinh;
		try {
			String sql = "SELECT A.*,D.ID AS MA_VAI_TRO,E.ID AS MA_BO_PHAN,F.THOI_GIAN AS THOI_GIAN_THU_VIEC "
						+" FROM HOSODUTUYEN A LEFT JOIN CHITIETKHTNS B ON A.Vi_tri_du_tuyen=B.ID "
						+" LEFT JOIN DENGHINHANSU C ON B.Ma_de_nghi=C.ID "
						+" LEFT JOIN VAITRO D ON C.Chuc_danh=D.ID "
						+" LEFT JOIN KHOA_TRUNGTAM E ON C.Ma_bo_phan=E.ID "
						+" LEFT JOIN DENGHIKTV F ON F.NGUOI_DU_TUYEN=A.ID "
						+" WHERE A.TEN_DANG_NHAP=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, tenDangNhap);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new HoSoDuTuyenModel();
				if(rs.getString("Gioi_tinh").equals("0")){
					gioitinh = "Nữ";
				}
				else{
					gioitinh = "Nam";
				}
				model.setId(rs.getString("ID"));
				model.setTen_dang_nhap(rs.getString("Ten_dang_nhap"));
				model.setHo(rs.getString("Ho"));
				model.setTen_lot(rs.getString("Ten_lot"));
				model.setTen(rs.getString("Ten"));
				model.setGioi_tinh(gioitinh);
				model.setNgay_sinh(rs.getString("Ngay_sinh"));
				model.setGhi_chu(rs.getString("Ghi_chu"));
				model.setCmnd(rs.getString("CMND"));
				model.setNgay_cap(rs.getString("Ngay_cap"));
				model.setNoi_cap(rs.getString("Noi_cap"));
				model.setSo_nha(rs.getString("So_nha"));
				model.setDuong(rs.getString("Duong"));
				model.setPhuong_xa(rs.getString("Phuong_xa"));
				model.setQuan_huyen(rs.getString("Quan_huyen"));
				model.setTinh_thanhpho(rs.getString("Tinh_thanhpho"));
				model.setDien_thoai_nha(rs.getString("Dien_thoai_nha"));
				model.setEmail(rs.getString("Email"));
				model.setDien_thoai_dd(rs.getString("Dien_thoai_dd"));
				model.setTrinh_do_van_hoa(rs.getString("Trinh_do_van_hoa"));
				model.setChuyen_mon(rs.getString("Chuyen_mon"));
				model.setTin_hoc(rs.getString("Tin_hoc"));
				model.setNgoai_ngu(rs.getString("Ngoai_ngu"));
				model.setTom_tat_ban_than(rs.getString("Tom_tat_ban_than"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setVi_tri_du_tuyen(rs.getString("Vi_tri_du_tuyen"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setMa_bo_phan(rs.getString("Ma_bo_phan"));
				model.setMa_vai_tro(rs.getString("Ma_vai_tro"));
				model.setThoi_gian_thu_viec(rs.getString("Thoi_gian_thu_viec"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static ArrayList<String> getAllTenDangNhapInHoSoDuTuyen(){
		ArrayList<String> list = new ArrayList<String>();
		try {
			String sql = "SELECT * FROM HOSODUTUYEN";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				list.add(rs.getString("Ten_dang_nhap"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Boolean checkTenDangNhap(String tenDangNhap,ArrayList<String> list){
		for (String s : list) {
			if(s.equals(tenDangNhap)){
				return true;
			}
		}
		return false;
	}
	
	public static String getTenDangNhapByHoTen(String ho,String tenLot,String ten){
		String kq = "";
		ho = ho.toLowerCase();
		tenLot = tenLot.toLowerCase();
		ten = ten.toLowerCase();
		int maxLength = ten.length();
		for (int i = 0; i < maxLength; i++) {
			char ch = ten.charAt(i);
			int index = Arrays.binarySearch(Constant.SPECIAL_CHARACTERS, ch);
			if (index >= 0) {
				kq += Constant.REPLACEMENTS[index];
			} else {
				kq += ch;
			}
		}
		kq += "_"+ho.charAt(0);
		if(tenLot!=""){
			String []n = tenLot.split(" ");
			if(n.length > 1){
				for (String string : n) {
					kq += string.charAt(0);
				}
			}else{
				kq += tenLot.charAt(0);
			}
		}
		return kq;
	}
	
	public static HoSoDuTuyenModel getThongTinNhanSuByMaThanhVien(String maThanhVien){
		HoSoDuTuyenModel model = null;
		String gioitinh;
		try {
			String sql = "SELECT A.ID,A.MA_VAI_TRO,A.MA_BO_PHAN,B.HO,B.TEN_LOT,B.TEN,(B.HO+' '+B.TEN_LOT+' '+B.TEN) AS HOTEN, "
						+" CONVERT(VARCHAR(10),B.NGAY_SINH,105) AS NGAY_SINH,CONVERT(VARCHAR(10),B.NGAY_CAP,105) AS NGAY_CAP,B.NOI_CAP,B.EMAIL,B.DIEN_THOAI_DD,B.CHUNG_MINH_NHAN_DAN, "
						+" C.SO_NHA,C.DUONG,C.PHUONG_XA,C.QUAN_HUYEN,C.TINH_THANHPHO,C.DIEN_THOAI_NHA, "
						+" D.GIOI_TINH,CONVERT(VARCHAR(10),E.BAT_DAU,105) AS NGAY_THU_VIEC,CONVERT(VARCHAR(10),F.BAT_DAU,105) AS NGAY_VAO_LAM "
						+" FROM THANHVIEN A INNER JOIN CHITIETTHANHVIEN B ON A.TEN_DN=B.TEN_DANG_NHAP "
						+" LEFT JOIN DIACHI C ON B.MA_DIA_CHI=C.ID "
						+" LEFT JOIN HOSODUTUYEN D ON A.TEN_DN=D.TEN_DANG_NHAP "
						+" LEFT JOIN DENGHIKTV E ON D.ID=E.NGUOI_DU_TUYEN "
						+" LEFT JOIN HOPDONGLAODONG F ON D.ID=F.NGUOI_DU_TUYEN"
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new HoSoDuTuyenModel();
				if(rs.getString("GIOI_TINH")==null){
					gioitinh = "Nam";
				}
				else if(rs.getString("GIOI_TINH").equals("0")){
					gioitinh = "Nữ";
				}
				else if(rs.getString("GIOI_TINH").equals("1")){
					gioitinh = "Nam";	
					
				}else{
					gioitinh = "Khác";
				}
				model.setId(rs.getString("ID"));
				model.setHo(rs.getString("Ho"));
				model.setTen_lot(rs.getString("Ten_lot"));
				model.setTen(rs.getString("Ten"));
				model.setGioi_tinh(gioitinh);
				model.setNgay_sinh(rs.getString("NGAY_SINH"));
				model.setCmnd(rs.getString("CHUNG_MINH_NHAN_DAN"));
				model.setNgay_cap(rs.getString("NGAY_CAP"));
				model.setNoi_cap(rs.getString("NOI_CAP"));
				model.setSo_nha(rs.getString("So_nha"));
				model.setDuong(rs.getString("Duong"));
				model.setPhuong_xa(rs.getString("Phuong_xa"));
				model.setQuan_huyen(rs.getString("Quan_huyen"));
				model.setTinh_thanhpho(rs.getString("Tinh_thanhpho"));
				model.setDien_thoai_nha(rs.getString("Dien_thoai_nha"));
				model.setEmail(rs.getString("Email"));
				model.setDien_thoai_dd(rs.getString("Dien_thoai_dd"));
				model.setMa_bo_phan(rs.getString("Ma_bo_phan"));
				model.setMa_vai_tro(rs.getString("MA_VAI_TRO"));
				model.setNgayThuViec(rs.getString("NGAY_THU_VIEC"));
				model.setNgayVaoLam(rs.getString("NGAY_VAO_LAM"));
				model.setHo_ten(rs.getString("HOTEN"));	
			}
			model.setListBangCap(BangCapDAO.getAllBangCapByMaThanhVien(model.getId()));
			model.setListBangCapKhac(ChungChiBangCapKhacDAO.getDanhSachChungChiBangCapKhacCuaThanhVien(model.getId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	
	
	public static String insertThongTinThanhVien(String tenDangNhap,String ho,String tenLot,String ten,String gioiTinh,String ngaySinh,String CMND,String ngayCap,String noiCap,String soNha,String duong,String phuongXa,String quanHuyen,String tinhThanhPho,String dienThoaiNha,String email,String dienThoaiDD,String ngayThuViec,String ngayVaolam,String vaitro,String boPhan){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_NhapThongTin(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Ten_dang_nhap", tenDangNhap);
			csmt.setString("Ho", ho);
			csmt.setString("Ten_lot", tenLot);
			csmt.setString("Ten", ten);
			csmt.setString("Gioi_tinh", gioiTinh);
			csmt.setString("Ngay_sinh", ngaySinh);
			csmt.setString("CMND", CMND);
			csmt.setString("Ngay_cap", ngayCap);
			csmt.setString("Noi_cap", noiCap);
			csmt.setString("So_nha", soNha);
			csmt.setString("Duong", duong);
			csmt.setString("Phuong_xa", phuongXa);
			csmt.setString("Quan_huyen", quanHuyen);
			csmt.setString("Tinh_thanhpho", tinhThanhPho);
			csmt.setString("Dien_thoai_nha", dienThoaiNha);
			csmt.setString("Email", email);
			csmt.setString("Dien_thoai_dd", dienThoaiDD);
			csmt.setString("Ngay_thu_viec", ngayThuViec);
			csmt.setString("Ngay_vao_lam", ngayVaolam);
			csmt.setString("Vai_tro", vaitro);
			csmt.setString("Bo_phan", boPhan);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String updateHoSoDuTuyen(String id,String ho,String tenLot,String ten,String gioiTinh,String ngaySinh,String cmnd,String ngayCap,String noiCap,String soNha,String duong,String phuongXa,String quanHuyen,String tinhThanhPho,String dienThoaiNha,String email,String dienThoaiDD,String trinhDoVanHoa,String chuyenMon,String ngoaiNgu,String tinHoc,String tomTatBanThan){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateChiTietHoSoDuTuyen(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ho", ho);
			csmt.setString("Ten_lot", tenLot);
			csmt.setString("Ten", ten);
			csmt.setString("Gioi_tinh", gioiTinh);
			csmt.setString("Ngay_sinh", ngaySinh);
			csmt.setString("CMND", cmnd);
			csmt.setString("Ngay_cap", ngayCap);
			csmt.setString("Noi_cap", noiCap);
			csmt.setString("So_nha", soNha);
			csmt.setString("Duong", duong);
			csmt.setString("Phuong_xa", phuongXa);
			csmt.setString("Quan_huyen", quanHuyen);
			csmt.setString("Tinh_thanhpho", tinhThanhPho);
			csmt.setString("Dien_thoai_nha",dienThoaiNha);
			csmt.setString("EMAIL",email);
			csmt.setString("Dien_thoai_dd", dienThoaiDD);
			csmt.setString("Trinh_do_van_hoa", trinhDoVanHoa);
			csmt.setString("Chuyen_mon", chuyenMon);
			csmt.setString("Tin_hoc", tinHoc);
			csmt.setString("Ngoai_ngu", ngoaiNgu);
			csmt.setString("Tom_tat_ban_than",tomTatBanThan);
			csmt.registerOutParameter("KQ",java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	
	public static String updateThongTinThanhVien(String id,String ho,String tenLot,String ten,String gioiTinh,String ngaySinh,String CMND,String ngayCap,String noiCap,String soNha,String duong,String phuongXa,String quanHuyen,String tinhThanhPho,String dienThoaiNha,String email,String dienThoaiDD,String ngayThuViec,String ngayVaolam,String vaiTro, String boPhan){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_CapNhatThongTin(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ho", ho);
			csmt.setString("Ten_lot", tenLot);
			csmt.setString("Ten", ten);
			csmt.setString("Gioi_tinh", gioiTinh);
			csmt.setString("Ngay_sinh", ngaySinh);
			csmt.setString("CMND", CMND);
			csmt.setString("Ngay_cap", ngayCap);
			csmt.setString("Noi_cap", noiCap);
			csmt.setString("So_nha", soNha);
			csmt.setString("Duong", duong);
			csmt.setString("Phuong_xa", phuongXa);
			csmt.setString("Quan_huyen", quanHuyen);
			csmt.setString("Tinh_thanhpho", tinhThanhPho);
			csmt.setString("Dien_thoai_nha", dienThoaiNha);
			csmt.setString("Email", email);
			csmt.setString("Dien_thoai_dd", dienThoaiDD);
			csmt.setString("Ngay_thu_viec", ngayThuViec);
			csmt.setString("Ngay_vao_lam", ngayVaolam);
			csmt.setString("Vai_tro", vaiTro);
			csmt.setString("Bo_phan", boPhan);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static String getMaHSDTByMaThanhVien(String maThanhVien){
		String kq = "";
		try {
			String sql = "SELECT B.ID AS ID FROM THANHVIEN A INNER JOIN HOSODUTUYEN B ON A.TEN_DN=B.TEN_DANG_NHAP WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				kq = rs.getString("ID");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
}

