package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import vn.edu.hungvuongaptech.model.HoSoDuTuyenModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class HoSoDuTuyenDAO {
	public static int insertHoSoDuTuyen(String tendangnhap, String ho, String tenlot,String ten, String gioitinh,String ngaysinh,String cmnd,String sonha,String duong,String phuongxa,String quanhuyen, String tinhtp,String dienthoainha,String email,String dienthoaidd,String trinhdovanhoa,String chuyenmon,String ngoaingu,String tinhoc,String tomtatbanthan,String vitridutuyen){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertHoSoDuTuyen(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Ten_dang_nhap", tendangnhap);
			csmt.setString("Ho", ho);
			csmt.setString("Ten_lot", tenlot);
			csmt.setString("Ten", ten);
			csmt.setString("Gioi_tinh", gioitinh);
			csmt.setString("Ngay_sinh", ngaysinh);
			csmt.setString("CMND", cmnd);
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
			String sql = "SELECT A.*,REPLACE(A.Tom_tat_ban_than,char(13) + char(10),'<br/>') as Tom_tat_ban_than2,(A.Ho+' '+A.Ten_lot+' '+A.Ten) as Ho_ten,(A.So_nha+' '+A.Duong+', P.'+A.Phuong_xa+', Q.'+A.Quan_huyen+', '+A.Tinh_thanhpho) as Dia_chi,D.Ten_vai_tro as Ten_vai_tro,E.Ten as Ten_bo_phan,E.Ma_truong_khoa as Ma_truong_khoa,CONVERT(VARCHAR(10),A.Ngay_sinh,101) as ngay_sinh_mdy,B.So_luong_da_tuyen,C.So_luong  "
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
				model.setTom_tat_ban_than(rs.getString("Tom_tat_ban_than2"));
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
			String sql = "SELECT A.*,REPLACE(A.Tom_tat_ban_than,char(13) + char(10),'<br/>') as Tom_tat_ban_than2,(A.Ho+' '+A.Ten_lot+' '+A.Ten) as Ho_ten,(A.So_nha+' '+A.Duong+', P.'+A.Phuong_xa+', Q.'+A.Quan_huyen+', '+A.Tinh_thanhpho) as Dia_chi,D.ID as Ma_vai_tro,D.Ten_vai_tro as Ten_vai_tro,E.Ten as Ten_bo_phan,E.Ma_truong_khoa as Ma_truong_khoa,CONVERT(VARCHAR(10),A.Ngay_sinh,105) as ngay_sinh_mdy,B.So_luong_da_tuyen,C.So_luong "
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
				model.setTom_tat_ban_than(rs.getString("Tom_tat_ban_than2"));
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
			String sql = "SELECT A.*,REPLACE(A.Tom_tat_ban_than,char(13) + char(10),'<br/>') as Tom_tat_ban_than2,(A.Ho+' '+A.Ten_lot+' '+A.Ten) as Ho_ten,(A.So_nha+' '+A.Duong+', P.'+A.Phuong_xa+', Q.'+A.Quan_huyen+', '+A.Tinh_thanhpho) as Dia_chi,D.ID as Ma_vai_tro,D.Ten_vai_tro as Ten_vai_tro,E.ID as Ma_bo_phan,E.Ten as Ten_bo_phan,E.Ma_truong_khoa as Ma_truong_khoa,CONVERT(VARCHAR(10),A.Ngay_sinh,105) as ngay_sinh_mdy "
						+" FROM HOSODUTUYEN A LEFT JOIN CHITIETKHTNS B ON A.Vi_tri_du_tuyen=B.ID "
						+" LEFT JOIN DENGHINHANSU C ON B.Ma_de_nghi=C.ID "
						+" LEFT JOIN VAITRO D ON C.Chuc_danh=D.ID "
						+" LEFT JOIN KHOA_TRUNGTAM E ON C.Ma_bo_phan=E.ID" 
						+" WHERE A.ID=?";
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
				model.setTom_tat_ban_than(rs.getString("Tom_tat_ban_than2"));
				model.setTinh_trang(rs.getString("Tinh_trang"));
				model.setVi_tri_du_tuyen(rs.getString("Vi_tri_du_tuyen"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setMa_truong_khoa(rs.getString("Ma_truong_khoa"));
				model.setTen_bo_phan(rs.getString("Ten_bo_phan"));
				model.setTen_vai_tro(rs.getString("Ten_vai_tro"));
				model.setNgay_sinh_mdy(rs.getString("Ngay_sinh_mdy"));
				model.setDia_chi(rs.getString("Dia_chi"));
				model.setHo_ten(rs.getString("Ho_ten"));
				model.setMa_bo_phan(rs.getString("Ma_bo_phan"));
				model.setMa_vai_tro(rs.getString("Ma_vai_tro"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static int updateHSDT(String id,String ghichu,String tinhtrang){
		int kq =0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateHoSoDuTuyen(?,?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ghi_chu",ghichu);
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
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
				if(rs.getString("Gioi_tinh").equals('0')){
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
	
}

