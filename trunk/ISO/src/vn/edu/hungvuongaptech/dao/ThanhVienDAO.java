/**
 * 
 */
package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.model.QuyetDinhModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

/**
 * @author ThienVD
 *
 */
public class ThanhVienDAO {
	public static ThanhVienModel timThanhVien(String username, String password) {
		ThanhVienModel thanhVienModel = new ThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThanhVienByTenDangNhapAndMatKhau"));
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				if(rs.getString("MaBoPhan") == null) {
					thanhVienModel.setMaBoPhan("");
					thanhVienModel.setTenBoPhan("");
				}
				else {
					thanhVienModel.setMaBoPhan(rs.getString("MaBoPhan"));// lay ma bo phan cua thanh vien
					thanhVienModel.setTenBoPhan(rs.getString("TenBoPhan"));
					if(thanhVienModel.getMaBoPhan().equals(Constant.BO_PHAN_BGH) || thanhVienModel.getMaBoPhan().equals(Constant.BO_PHAN_ADMIN))
						thanhVienModel.setTenBoPhan("");
				}
				return thanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
		
	public static ArrayList<ThanhVienModel> timThanhVienByMaVaiTro(String maVaiTro) {
		
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThanhVienByMaVaiTro"));
			preparedStatement.setString(1, maVaiTro);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setTinhTrang(rs.getString("TinhTrang"));	
				thanhVienModel.setEmail(rs.getString("Email"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				
				listKetQua.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	/*chi tiet thanh vien*/
	public static ChiTietThanhVienModel XemChiTietThanhVienByMaThanhVien(String maThanhVien) {
		ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getChiTietThanhVienByMaThanhVien"));
			preparedStatement.setString(1, maThanhVien);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				chiTietThanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				chiTietThanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				chiTietThanhVienModel.setMatKhau(rs.getString("MatKhau"));
				chiTietThanhVienModel.setSoTaiKhoan(rs.getString("SoTaiKhoan"));
				chiTietThanhVienModel.setNganHang(rs.getString("NganHang"));
				chiTietThanhVienModel.setNgayLapThe(rs.getString("NgayLapThe"));
				chiTietThanhVienModel.setHoThanhVien(rs.getString("Ho"));
				chiTietThanhVienModel.setTenLot(rs.getString("TenLot"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("Ten"));
				chiTietThanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				chiTietThanhVienModel.setTenVaiTro(rs.getString("TenVaitro"));
				chiTietThanhVienModel.setMaKhoa(rs.getString("MaKhoa"));
				chiTietThanhVienModel.setNgaySinh(rs.getString("NgaySinh"));
				chiTietThanhVienModel.setTinhTrang(rs.getString("TinhTrang"));
				chiTietThanhVienModel.setEmail(rs.getString("Email"));
				chiTietThanhVienModel.setDienThoaiDiDong(rs.getString("DienThoaiDD"));
				chiTietThanhVienModel.setDienThoaiNha(rs.getString("DienThoaiNha"));
				chiTietThanhVienModel.setSoNha(rs.getString("SoNha"));
				chiTietThanhVienModel.setDuong(rs.getString("Duong"));
				chiTietThanhVienModel.setPhuongXa(rs.getString("PhuongXa"));
				chiTietThanhVienModel.setQuanHuyen(rs.getString("QuanHuyen"));
				chiTietThanhVienModel.setThanhPho(rs.getString("ThanhPho"));
				chiTietThanhVienModel.setLoaiBang(rs.getString("LoaiBang"));
				chiTietThanhVienModel.setTruongCap(rs.getString("TruongCap"));
				chiTietThanhVienModel.setNamTotNghiep(rs.getString("NamTotNghiep"));
				chiTietThanhVienModel.setLoaiTotNghiep(rs.getString("LoaiTotNghiep"));
				chiTietThanhVienModel.setChungMinhNhanDan(rs.getString("CMNN"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietThanhVienModel;
	}
	
	/*get all thanh vien*/
		/*co vai tro*/
	public static ArrayList<ThanhVienModel> timKiemThanhVienCoVaiTro( String vaiTro , String hoTen , String email) {
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.TimThanhVienByMaVaiTro"));	
			preparedStatement.setString(1, vaiTro);
			preparedStatement.setString(2, hoTen);
			preparedStatement.setString(3, email);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setTinhTrang(rs.getString("TinhTrang"));	
				thanhVienModel.setEmail(rs.getString("Email"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				
				listKetQua.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
		/*Khong co vai tro*/
	public static ArrayList<ThanhVienModel> timKiemThanhVien( String hoTen , String email) {
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.TimThanhVien"));	
			preparedStatement.setString(1, hoTen);
			preparedStatement.setString(2, email);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setTinhTrang(rs.getString("TinhTrang"));	
				thanhVienModel.setEmail(rs.getString("Email"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				
				listKetQua.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	/*tim thanh vien by ma vai tro va by txt*/
	
	public static ArrayList<ThanhVienModel> timAllThanhVien() {
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllThanhVien"));			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setTinhTrang(rs.getString("TinhTrang"));	
				thanhVienModel.setEmail(rs.getString("Email"));
				thanhVienModel.setMaBoPhan(rs.getString("MaBoPhan"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				
				listKetQua.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	/*nhung thanh vien la giao vien*/
	
	public static ArrayList<ThanhVienModel> timAllThanhVienLaGiaoVien() {
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllThanhVienByVaiTro"));	
			preparedStatement.setString(1, Constant.MA_VAI_TRO_GV);
			preparedStatement.setString(2, Constant.MA_VAI_TRO_TK);
			preparedStatement.setString(3, Constant.MA_VAI_TRO_TBM);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setTinhTrang(rs.getString("TinhTrang"));	
				thanhVienModel.setEmail(rs.getString("Email"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				
				listKetQua.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<ThanhVienModel> timAllThanhVienLaHocSinh() {
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllThanhVienByVaiTroSV"));	
			preparedStatement.setString(1, Constant.MA_VAI_TRO_HS);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setTinhTrang(rs.getString("TinhTrang"));	
				thanhVienModel.setEmail(rs.getString("Email"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				
				listKetQua.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	/*tim ten dang nhap*/
	
	public static ThanhVienModel timThanhVienGP(String username) {
		ThanhVienModel thanhVienModel = new ThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThanhVienByTenDangNhap"));
			preparedStatement.setString(1, username);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setHoThanhVien(rs.getString("hoThanhVien"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				thanhVienModel.setEmail(rs.getString("Email"));
				return thanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/*tim mat khau*/
	public static ThanhVienModel timMatKhauGP(String username) {
		ThanhVienModel thanhVienModel = new ThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getMatKhauByTenDangNhap"));
			preparedStatement.setString(1, username);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				return thanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/*update mat khau*/
	public static Boolean updateMatKhauTV(ThanhVienModel thanhVienModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateMatKhauTV(?,?)}");
			csmt.setString("Ten_dn", thanhVienModel.getTenDangNhap());
			csmt.setString("mat_khau", thanhVienModel.getMatKhau());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update mat khau thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}						
		return result;
	}
	
	/*update tinh trang thanh vien*/
	
	public static ChiTietThanhVienModel updateTinhTrang(String tinhTrang, String tenDangNhap) {
		ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.updateTinhTrangByTenDangNhap"));
			preparedStatement.setString(1, tinhTrang);
			preparedStatement.setString(2, tenDangNhap);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				chiTietThanhVienModel.setTenDangNhap("maThanhVien");
				chiTietThanhVienModel.setTenDangNhap("tenDangNhap");
				chiTietThanhVienModel.setTenDangNhap("tinhTrang");
				return chiTietThanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/*insert chi tiet thanh vien */
	
	public static Boolean insertChiTietThanhVien(ChiTietThanhVienModel chiTietThanhVienModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_InsertThanhVien(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Mat_khau", chiTietThanhVienModel.getMatKhau());
			csmt.setString("Ma_vai_tro", chiTietThanhVienModel.getMaVaiTro());
			csmt.setString("Ma_bo_phan", chiTietThanhVienModel.getMaKhoa());
			csmt.setString("Ngay_tao", chiTietThanhVienModel.getNgayTao());
			csmt.setString("Ngay_truy_cap_cuoi", chiTietThanhVienModel.getNgayTruyCapCuoi());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietThanhVienModel.getNgayCapNhatCuoi());
			csmt.setString("Ten_dang_nhap", chiTietThanhVienModel.getTenDangNhap());
			csmt.setString("Ho", chiTietThanhVienModel.getHoThanhVien());
			csmt.setString("Ten_lot", chiTietThanhVienModel.getTenLot());
			csmt.setString("Ten", chiTietThanhVienModel.getTenThanhVien());
			csmt.setString("Ngay_sinh", chiTietThanhVienModel.getNgaySinh());
			csmt.setString("Email", chiTietThanhVienModel.getEmail());
			csmt.setString("Dien_thoai_dd", chiTietThanhVienModel.getDienThoaiDiDong());
			csmt.setString("Ngay_bat_dau", chiTietThanhVienModel.getNgayBatDau());
			csmt.setString("Ngay_ket_thuc", chiTietThanhVienModel.getNgayKetThuc());
			csmt.setString("Tinh_trang", chiTietThanhVienModel.getTinhTrang());
			csmt.setString("Chung_minh_nhan_dan", chiTietThanhVienModel.getChungMinhNhanDan());
			csmt.setString("Ma_lop_hoc", chiTietThanhVienModel.getMaLopHoc());
			csmt.setString("So_nha", chiTietThanhVienModel.getSoNha());
			csmt.setString("Duong", chiTietThanhVienModel.getDuong());
			csmt.setString("Phuong_xa", chiTietThanhVienModel.getPhuongXa());
			csmt.setString("Quan_huyen", chiTietThanhVienModel.getQuanHuyen());
			csmt.setString("Tinh_Thanhpho", chiTietThanhVienModel.getThanhPho());
			csmt.setString("Dien_thoai_nha", chiTietThanhVienModel.getDienThoaiNha());
			csmt.setString("Lan_cap_nhat_cuoi", chiTietThanhVienModel.getNgayCapNhatCuoi());
			csmt.setString("Loai_bang", chiTietThanhVienModel.getLoaiBang());
			csmt.setString("Truong_cap", chiTietThanhVienModel.getTruongCap());
			csmt.setString("Nam_tot_nghiep", chiTietThanhVienModel.getNamTotNghiep());
			csmt.setString("Loai_tot_nghiep", chiTietThanhVienModel.getLoaiTotNghiep());
			csmt.setString("So_tai_khoan", chiTietThanhVienModel.getSoTaiKhoan());
			csmt.setString("Ngan_hang", chiTietThanhVienModel.getNganHang());
			csmt.setString("Ngay_lap_the", chiTietThanhVienModel.getNgayLapThe());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update mat khau thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}						
		return result;
	}
	
	/*update chi tiet thanh vien*/
	public static Boolean updateChiTietThanhVien(ChiTietThanhVienModel chiTietThanhVienModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateThanhVien(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			csmt.setString("Ten_DN", chiTietThanhVienModel.getTenDangNhap());
			csmt.setString("Mat_khau", chiTietThanhVienModel.getMatKhau());
			csmt.setString("Ma_vai_tro", chiTietThanhVienModel.getMaVaiTro());
			csmt.setString("Ma_bo_phan", chiTietThanhVienModel.getMaKhoa());
			csmt.setString("Ngay_tao", chiTietThanhVienModel.getNgayTao());
			csmt.setString("Ngay_truy_cap_cuoi", chiTietThanhVienModel.getNgayTruyCapCuoi());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietThanhVienModel.getNgayCapNhatCuoi());
			csmt.setString("id", chiTietThanhVienModel.getMaThanhVien());
			csmt.setString("Ho", chiTietThanhVienModel.getHoThanhVien());
			csmt.setString("Ten_lot", chiTietThanhVienModel.getTenLot());
			csmt.setString("Ten", chiTietThanhVienModel.getTenThanhVien());
			csmt.setString("Ngay_sinh", chiTietThanhVienModel.getNgaySinh());
			csmt.setString("Email", chiTietThanhVienModel.getEmail());
			csmt.setString("Dien_thoai_dd", chiTietThanhVienModel.getDienThoaiDiDong());
			csmt.setString("Ngay_bat_dau", chiTietThanhVienModel.getNgayBatDau());
			csmt.setString("Ngay_ket_thuc", chiTietThanhVienModel.getNgayKetThuc());
			csmt.setString("Tinh_trang", chiTietThanhVienModel.getTinhTrang());
			csmt.setString("Chung_minh_nhan_dan", chiTietThanhVienModel.getChungMinhNhanDan());
			csmt.setString("So_nha", chiTietThanhVienModel.getSoNha());
			csmt.setString("Duong", chiTietThanhVienModel.getDuong());
			csmt.setString("Phuong_xa", chiTietThanhVienModel.getPhuongXa());
			csmt.setString("Quan_huyen", chiTietThanhVienModel.getQuanHuyen());
			csmt.setString("Tinh_Thanhpho", chiTietThanhVienModel.getThanhPho());
			csmt.setString("Dien_thoai_nha", chiTietThanhVienModel.getDienThoaiNha());
			csmt.setString("Lan_cap_nhat_cuoi", chiTietThanhVienModel.getNgayCapNhatCuoi());
			csmt.setString("Loai_bang", chiTietThanhVienModel.getLoaiBang());
			csmt.setString("Truong_cap", chiTietThanhVienModel.getTruongCap());
			csmt.setString("Nam_tot_nghiep", chiTietThanhVienModel.getNamTotNghiep());
			csmt.setString("Loai_tot_nghiep", chiTietThanhVienModel.getLoaiTotNghiep());
			csmt.setString("So_tai_khoan", chiTietThanhVienModel.getSoTaiKhoan());
			csmt.setString("Ngan_hang", chiTietThanhVienModel.getNganHang());
			csmt.setString("Ngay_lap_the", chiTietThanhVienModel.getNgayLapThe());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update mat khau thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}

	
	public static int countThanhVien() {
		Integer count=0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.countThanhVien"));
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				count = Integer.parseInt(rs.getString("TotalRows"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public static ArrayList<ThanhVienModel> getThanhVien(Integer totalRows) {
		ArrayList<ThanhVienModel> ListKetQua = new ArrayList<ThanhVienModel>();
		//int totalRows = countThanhVien();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_ShowThanhVien(?,?)}");
			csmt.setString("numRows", Constant.NUM_ROWS_ADMIN);
			csmt.setString("totalPages", totalRows.toString());
			//csmt.setString("CurrentPage", currenPage);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setMaBoPhan(rs.getString("MaBoPhan"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setTenBoPhan(rs.getString("TenBoPhan"));
				thanhVienModel.setTinhTrang(rs.getString("TinhTrang"));	
				thanhVienModel.setEmail(rs.getString("Email"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				
				ListKetQua.add(thanhVienModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ListKetQua;
	}
	
	public static ArrayList<ThanhVienModel> getThanhVienByMaBoPhan(String maBoPhan, String ten) {
		ArrayList<ThanhVienModel> ListKetQua = new ArrayList<ThanhVienModel>();
		//int totalRows = countThanhVien();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_ShowThanhVienByMaBoPhan(?,?)}");
	
			csmt.setString("MaBoPhan", maBoPhan);
			csmt.setString("Ten", ten);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setTenDangNhap(rs.getString("TenDangNhap"));
				thanhVienModel.setMatKhau(rs.getString("MatKhau"));
				thanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				thanhVienModel.setMaBoPhan(rs.getString("MaBoPhan"));
				thanhVienModel.setNgayTao(rs.getString("NgayTao"));
				thanhVienModel.setNgayTruyCapCuoi(rs.getString("NgayTruyCapCuoi"));
				thanhVienModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				thanhVienModel.setTenBoPhan(rs.getString("TenBoPhan"));
				thanhVienModel.setTinhTrang(rs.getString("TinhTrang"));	
				thanhVienModel.setEmail(rs.getString("Email"));
				thanhVienModel.setUser1(rs.getString("User1"));
				thanhVienModel.setUser2(rs.getString("User2"));
				thanhVienModel.setUser3(rs.getString("User3"));
				thanhVienModel.setUser4(rs.getString("User4"));
				thanhVienModel.setUser5(rs.getString("User5"));
				
				ListKetQua.add(thanhVienModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ListKetQua;
	}
	
	

	public static String getMaAdmin(){
		String str="";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getMaAdmin"));
			preparedStatement.setString(1,Constant.ADMINROLE);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				str=rs.getString("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	public static String getTenThanhVien(String maThanhVien){
		String str="";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTenThanhVien"));
			preparedStatement.setString(1,maThanhVien);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				str=rs.getString("Ho")+" "+rs.getString("Ten_lot")+" "+rs.getString("Ten");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return str;

	}
	public static ArrayList<ThanhVienModel> getAllGiaoVienOrderByTen() {
		ArrayList<ThanhVienModel> thanhVienModelList = new ArrayList<ThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllGiaoVienOrderByTen"));
			preparedStatement.setString(1, Constant.SINH_VIEN);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				thanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("TenLot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModel.setMaBoPhan(rs.getString("MaBoPhan"));
				thanhVienModelList.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thanhVienModelList;
	}
	
	public static ArrayList<ThanhVienModel> getThanhVienByMaBoPhan(String maBoPhan) {
		ArrayList<ThanhVienModel> thanhVienModelList = new ArrayList<ThanhVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThanhVienByMaKhoa"));
			preparedStatement.setString(1,maBoPhan);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThanhVienModel thanhVienModel = new ThanhVienModel();
				thanhVienModel.setMaThanhVien(rs.getString("ID"));
				thanhVienModel.setHoThanhVien(rs.getString("Ho"));
				thanhVienModel.setTenLot(rs.getString("Ten_Lot"));
				thanhVienModel.setTenThanhVien(rs.getString("Ten"));
				thanhVienModelList.add(thanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thanhVienModelList;
	}
	
	
	public static ArrayList<ThanhVienModel> getThanhVienByMaLop(String lopHoc) {
		ArrayList<ThanhVienModel> thanhVienModelList = new ArrayList<ThanhVienModel>();
		try {
			/*if (lopHoc==null) {
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("iso.sql.SelectTopIDLopHoc"));
				ResultSet rs = preparedStatement.executeQuery();
				if (rs.next()) {
					lopHoc = rs.getString("id");
				}
				
			}*/
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getThanhVienByMaLopHoc"));
			preparedStatement.setString(1, lopHoc);
			//preparedStatement.setString(2, "0");
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThanhVienModel thanhvienModel = new ThanhVienModel();
				thanhvienModel.setMaThanhVien(rs.getString("ID"));
				thanhvienModel.setTenLot(rs.getString("Ten_lot"));
				thanhvienModel.setTenThanhVien(rs.getString("Ten"));
				thanhvienModel.setHoThanhVien(rs.getString("Ho"));
				thanhvienModel.setUser2(rs.getString("User2"));
				thanhVienModelList.add(thanhvienModel);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return thanhVienModelList;
	}
	
	/*public static ArrayList<ThanhVienModel> getThanhVienCa1ByMaLopHoc(String lopHoc) {
		ArrayList<ThanhVienModel> thanhVienModelList = new ArrayList<ThanhVienModel>();
		try {
			if (lopHoc==null) {
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("iso.sql.SelectTopIDLopHoc"));
				ResultSet rs = preparedStatement.executeQuery();
				if (rs.next()) {
					lopHoc = rs.getString("id");
				}
				
			}
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getThanhVienCa1ByMaLopHoc"));
			preparedStatement.setString(1, lopHoc);
			preparedStatement.setString(2, "1");
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThanhVienModel thanhvienModel = new ThanhVienModel();
				thanhvienModel.setMaThanhVien(rs.getString("ID"));
				thanhvienModel.setTenLot(rs.getString("Ten_lot"));
				thanhvienModel.setTenThanhVien(rs.getString("Ten"));
				thanhvienModel.setHoThanhVien(rs.getString("Ho"));
				thanhvienModel.setUser2(rs.getString("User2"));
				thanhVienModelList.add(thanhvienModel);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return thanhVienModelList;
	}
	
	public static ArrayList<ThanhVienModel> getThanhVienCa2ByMaLop(String lopHoc) {
		ArrayList<ThanhVienModel> thanhVienModelList = new ArrayList<ThanhVienModel>();
		try {
			if (lopHoc==null) {
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("iso.sql.SelectTopIDLopHoc"));
				ResultSet rs = preparedStatement.executeQuery();
				if (rs.next()) {
					lopHoc = rs.getString("id");
				}
				
			}
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getThanhVienCa2ByMaLopHoc"));
			preparedStatement.setString(1, lopHoc);
			preparedStatement.setString(2, "2");
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThanhVienModel thanhvienModel = new ThanhVienModel();
				thanhvienModel.setMaThanhVien(rs.getString("ID"));
				thanhvienModel.setTenLot(rs.getString("Ten_lot"));
				thanhvienModel.setTenThanhVien(rs.getString("Ten"));
				thanhvienModel.setHoThanhVien(rs.getString("Ho"));
				thanhvienModel.setUser2(rs.getString("User2"));
				thanhVienModelList.add(thanhvienModel);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return thanhVienModelList;
	}*/
	public static Boolean phanCa(ThanhVienModel thanhVienModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_PhanCa(?,?)}");
			csmt.setString("ID", thanhVienModel.getMaThanhVien());
			csmt.setString("User2", thanhVienModel.getUser2());
			
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update User2 thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static ThanhVienModel getThanhVienByMaDiemDanh(String maDiemDanh) {
		ThanhVienModel thanhVienModel = new ThanhVienModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThanhVienByMaDiemDanh"));
			preparedStatement.setString(1, maDiemDanh);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				thanhVienModel.setMaThanhVien(rs.getString("ID"));
				thanhVienModel.setMaVaiTro(rs.getString("VaiTro"));
				return thanhVienModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thanhVienModel;
	}
	
	/*
	 * HE THONG QUAN LY NHAN SU
	 * AUTHOR: THANHTC
	 * CREATE DATE : 20/7/2011
	 */
	public static void UpdateVaiTroTV(String maVaiTro,String tenDangNhap){
		 try {
			String sql = "UPDATE THANHVIEN SET MA_VAI_TRO=? WHERE TEN_DN=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maVaiTro);
			ps.setString(2, tenDangNhap);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }
}

