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

	//Tác gi?: La Qu?c Chuong
	public static boolean themSoLuocLyLich(String tenDangNhap,String matKhau,int maVaiTro,int maBoPhan,String soTaiKhoan,
											String nganHang,String ngayLapThe,String soNha,String duong,String phuong,
											String quan,String thanhPho,String dtNha,String loaiBang,String truongCap,
											String loaiTotNghiep,String ho,String tenLot,String ten,String ngaySinh,
											String email,String dtdd,String cmnd,String hoTenKhaiSinh,String tenThuongGoi,
											String queQuan,String danToc,String trinhDoHocVanTruocKhiVaoHoc,
											String ngayChinhThuc,String hoTenBo,String ngheNghiepBo,String hoTenMe,
											String ngheNghiepMe,String hoTenVoChong,String ngheNghiepVoChong,
											String doiTuongThuocDienChinhSach,String ngheNghiepLamTruocKhiVaoHoc,
											String nguyenVong,int gioiTinh,String noiSinh,String noiDangKyThuongTru,
											String tonGiao,String ngayThamGiaDang,String ngayKetNapDoan)
	{
		boolean bo = false;
		try {
			CallableStatement cs = DataUtil.getConnection().prepareCall("{call SP_QLSV_ThemMoiSoLuocLyLich(?,?,?,?,?,?,?,?,?,?," +
					"																					  ?,?,?,?,?,?,?,?,?,?," +
					"																					  ?,?,?,?,?,?,?,?,?,?," +
					"																					  ?,?,?,?,?,?,?,?,?,?," +
					"																					  ?,?,?,?,?)}");
			cs.setString(1, tenDangNhap);
			cs.setString(2, matKhau);
			cs.setInt(3, maVaiTro);
			cs.setInt(4, maBoPhan);
			cs.setString(5, soTaiKhoan);
			cs.setString(6, nganHang);
			cs.setString(7, ngayLapThe);
			cs.setString(8, soNha);
			cs.setString(9, duong);
			cs.setString(10, phuong);
			cs.setString(11, quan);
			cs.setString(12, thanhPho);
			cs.setString(13, dtNha);
			cs.setString(14, loaiBang);
			cs.setString(15, truongCap);
			cs.setString(16, loaiTotNghiep);
			cs.setString(17, ho);
			cs.setString(18, tenLot);
			cs.setString(19, ten);
			cs.setString(20, ngaySinh);
			cs.setString(21, email);
			cs.setString(22, dtdd);
			cs.setString(23, cmnd);
			cs.setString(24, hoTenKhaiSinh);
			cs.setString(25, tenThuongGoi);
			cs.setString(26, queQuan);
			cs.setString(27, danToc);
			cs.setString(28, trinhDoHocVanTruocKhiVaoHoc);
			cs.setString(29, ngayChinhThuc);
			cs.setString(30, hoTenBo);
			cs.setString(31, ngheNghiepBo);
			cs.setString(32, hoTenMe);
			cs.setString(33, ngheNghiepMe);
			cs.setString(34, hoTenVoChong);
			cs.setString(35, ngheNghiepVoChong);
			cs.setString(36, doiTuongThuocDienChinhSach);
			cs.setString(37, ngheNghiepLamTruocKhiVaoHoc);
			cs.setString(38, nguyenVong);
			cs.setInt(39, gioiTinh);
			cs.setString(40, noiSinh);
			cs.setString(41, noiDangKyThuongTru);
			cs.setString(42, tonGiao);
			cs.setString(43, ngayThamGiaDang);
			cs.setString(44, ngayKetNapDoan);
			cs.registerOutParameter(45, java.sql.Types.INTEGER);
			cs.execute();
			int i = cs.getInt("ketQua");
			if(i == 1)
				bo = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bo;
	}

	//Tác gia: La Quoc Chuong
	public static boolean kiemTraMaThanhVien(String maThanhVien)
	{
		boolean bo = false;
		ChiTietThanhVienModel d = XemChiTietThanhVienByMaThanhVien(maThanhVien);
		if(d.getMaVaiTro().equals("8") || d.getMaVaiTro().equals("9"))
			bo = true;
		return bo;
	}

	//Tác gia: La Quoc Chuong
	public static ArrayList<ChiTietThanhVienModel> timSinhVien(String ho,String tenLot,String ten,String soNha,String duong,String phuongXa,String quanHuyen,String tinhTP,String ngaySinh,String email,String boPhan,String maLopHoc)
	{
		ArrayList<ChiTietThanhVienModel> arr = new ArrayList<ChiTietThanhVienModel>();
		try{
			CallableStatement c = DataUtil.getConnection().prepareCall("{call SP_QLSV_TIMKIEM_SINHVIEN(?,?,?,?,?,?,?,?,?,?,?,?)}");
			c.setString("HO", ho);
			c.setString("TEN_LOT", tenLot);
			c.setString("TEN", ten);
			c.setString("SO_NHA", soNha);
			c.setString("DUONG", duong);
			c.setString("PHUONG_XA", phuongXa);
			c.setString("QUAN_HUYEN", quanHuyen);
			c.setString("TINH_TP", tinhTP);
			c.setString("NGAYSINH", ngaySinh);
			c.setString("EMAIL", email);
			c.setString("BOPHAN", boPhan);
			c.setString("MALOPHOC", maLopHoc);
			ResultSet rs = c.executeQuery();
			while(rs.next())
			{
				ChiTietThanhVienModel m = new ChiTietThanhVienModel();
				m.setMaThanhVien(rs.getString("ID"));
				m.setHoTen(rs.getString("HOTEN"));
				m.setDiaChi(rs.getString("DIACHI"));
				m.setNgaySinh(rs.getString("NGAYSINH"));
				m.setEmail(rs.getString("EMAIL"));
				m.setTenKhoa(rs.getString("BOPHAN"));
				m.setTenVaiTro(rs.getString("VAITRO"));
				arr.add(m);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		return arr;
	}

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
	
	//Tác gi?: La Qu?c Chuong
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

	//Tác gi?: La Qu?c Chuong
	/*update chi tiet thanh vien in quan ly sinh vien LQChuong*/
	public static Boolean updateChiTietSinhVien(ChiTietThanhVienModel chiTietThanhVienModel) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call SP_QLSV_UPDATE_SINHVIEN(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			csmt.setString("MaThanhVien", chiTietThanhVienModel.getMaThanhVien());
			csmt.setString("HoThanhVien", chiTietThanhVienModel.getHoTen());
			csmt.setString("SoNha", chiTietThanhVienModel.getSoNha());
			csmt.setString("TenLot", chiTietThanhVienModel.getTenLot());
			csmt.setString("Duong", chiTietThanhVienModel.getDuong());
			csmt.setString("Ten", chiTietThanhVienModel.getTenThanhVien());
			csmt.setString("Phuong", chiTietThanhVienModel.getPhuongXa());
			csmt.setString("NgaySinh", chiTietThanhVienModel.getNgaySinh());
			csmt.setString("Quan", chiTietThanhVienModel.getQuanHuyen());
			csmt.setString("Email", chiTietThanhVienModel.getEmail());
			csmt.setString("ThanhPho", chiTietThanhVienModel.getThanhPho());
			csmt.setString("CMND", chiTietThanhVienModel.getChungMinhNhanDan());
			csmt.setString("DTNha", chiTietThanhVienModel.getDienThoaiNha());
			csmt.setString("DTDD", chiTietThanhVienModel.getDienThoaiDiDong());
			csmt.setString("SoTK", chiTietThanhVienModel.getSoTaiKhoan());
			csmt.setString("NganHang", chiTietThanhVienModel.getNganHang());
			csmt.setString("LoaiBang", chiTietThanhVienModel.getLoaiBang());
			csmt.setString("TruongCap", chiTietThanhVienModel.getTruongCap());
			csmt.setString("NgayLapThe",chiTietThanhVienModel.getNgayLapThe());
			csmt.setString("LoaiTotNghiep", chiTietThanhVienModel.getLoaiTotNghiep());
			
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
	 public static ArrayList<ChiTietThanhVienModel> getAllSNhanSu(String SHo,String STen_lot,String STen, String SNgaySinh,String SNgayVaoLam,String SEmail,String SBangCap,String SSoNha,String STenDuong,String SPhuongXa, String SQuanHuyen,String STinhTP,String SBoPhan,String SVaiTro){
		 ArrayList<ChiTietThanhVienModel> listNS = new ArrayList<ChiTietThanhVienModel>();
		 try {
			 CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_TimKiemNhanSu(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			 csmt.setString("HO", SHo );
			 csmt.setString("TEN_LOT", STen_lot );
			 csmt.setString("TEN", STen);
			 csmt.setString("SO_NHA", SSoNha);
			 csmt.setString("DUONG", STenDuong );
			 csmt.setString("PHUONG_XA", SPhuongXa);
			 csmt.setString("QUAN_HUYEN", SQuanHuyen );
			 csmt.setString("TINH_TP", STinhTP);
			 csmt.setString("NGAYSINH", SNgaySinh);
			 csmt.setString("NGAYVAOLAM", SNgayVaoLam);
			 csmt.setString("EMAIL", SEmail);
			 csmt.setString("BOPHAN", SBoPhan);
			 csmt.setString("VAITRO", SVaiTro);
			 csmt.setString("BANGCAP", SBangCap);
			 ResultSet rs = csmt.executeQuery();
			 while(rs.next()){
				 ChiTietThanhVienModel model = new ChiTietThanhVienModel();
				 model.setMaThanhVien(rs.getString("ID"));
				 model.setsHoTen(rs.getString("HOTEN"));
				 model.setsDiaChi(rs.getString("DIACHI"));
				 model.setsNgaySinh(rs.getString("NGAYSINH"));
				 model.setsNgayVaoLam(rs.getString("NGAYVAOLAM"));
				 model.setsEmail(rs.getString("EMAIL"));
				 model.setsBoPhan(rs.getString("BOPHAN"));
				 model.setsVaiTro(rs.getString("VAITRO"));
				 model.setsBangCap(rs.getString("BANGCAP"));
				 listNS.add(model);
		 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return listNS;
	 }
	 
	 public static ArrayList<ChiTietThanhVienModel> getAllNhanSu(int x,int y){
		 ArrayList<ChiTietThanhVienModel> listNS = new ArrayList<ChiTietThanhVienModel>();
		 try {
			 CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_getAllNhanSu(?,?)}");
			 csmt.setInt("NUMROWS", x);
			 csmt.setInt("NUMPAGES", y);
			 ResultSet rs = csmt.executeQuery();
			 while(rs.next()){
				 ChiTietThanhVienModel model = new ChiTietThanhVienModel();
				 model.setMaThanhVien(rs.getString("ID"));
				 model.setsHoTen(rs.getString("HOTEN"));
				 model.setsDiaChi(rs.getString("DIACHI"));
				 model.setsNgaySinh(rs.getString("NGAYSINH"));
				 model.setsNgayVaoLam(rs.getString("NGAYVAOLAM"));
				 model.setsEmail(rs.getString("EMAIL"));
				 model.setsBoPhan(rs.getString("BOPHAN"));
				 model.setsVaiTro(rs.getString("VAITRO"));
				 model.setsBangCap(rs.getString("BANGCAP"));
				 listNS.add(model);
		 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return listNS;
	 }
	 
	 public static float getTotalNhanSu(){
		 float kq = 0;
			try {
				PreparedStatement preparedStatement = DataUtil
						.getConnection()
						.prepareStatement(
								Constant.SQL_RES
										.getString("admin.sql.countThanhVien"));
				ResultSet rs = preparedStatement.executeQuery();
				if (rs.next()) {
					kq = Integer.parseInt(rs.getString("TotalRows"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 return kq;
	 }	
	
	 
	 public static ArrayList<String> getAllTenDangNhap(){
		 ArrayList<String> list= new ArrayList<String>();
		 try {
			String sql = "SELECT * FROM THANHVIEN";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				list.add(rs.getString("TEN_DN"));
			}
		 } catch (Exception e) {
			e.printStackTrace();
		 }
		 return list;
	 }
	 
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
	 
	 public static ChiTietThanhVienModel getThongTinByMaThanhVien(String maThanhVien){
		 ChiTietThanhVienModel chiTietThanhVienModel = null;
		 try {
			String sql = "SELECT A.ID,A.Ten_DN,A.Mat_khau,A.Ma_vai_tro,F.Ten_vai_tro,A.Ma_bo_phan,G.Ten as Ten_bo_phan,(B.Ho+' '+B.Ten_lot+' '+B.Ten) as Ho_ten,CONVERT(VARCHAR(10),B.Ngay_sinh,105) as Ngay_sinh,J.So_nha,J.Duong,J.Phuong_xa,J.Quan_huyen,J.Tinh_ThanhPho,J.Dien_thoai_nha,B.Email,B.Dien_thoai_dd,K.So_tai_khoan,K.Ngan_hang,K.Ngay_lap_the,B.Chung_minh_nhan_dan,B.Ma_lop_hoc,B.Tinh_trang,CONVERT(VARCHAR(10),D.Bat_dau,105) as Ngay_thu_viec ,CONVERT(VARCHAR(10),E.Bat_dau,105) as Ngay_bat_dau_lam "
						+" FROM THANHVIEN A INNER JOIN CHITIETTHANHVIEN B ON A.Ten_DN=B.Ten_dang_nhap "
						+" LEFT JOIN HOSODUTUYEN C ON A.Ten_DN=C.Ten_dang_nhap "
						+" LEFT JOIN DENGHIKTV D ON C.ID=D.Nguoi_du_tuyen "
						+" LEFT JOIN HOPDONGLAODONG E ON C.ID=E.Nguoi_du_tuyen "
						+" INNER JOIN VAITRO F ON A.Ma_vai_tro=F.ID "
						+" INNER JOIN KHOA_TRUNGTAM G ON A.Ma_bo_phan=G.ID "
						+" LEFT JOIN DIACHI J ON B.Ma_dia_chi=J.ID "
						+" LEFT JOIN TAIKHOAN K ON B.Ma_tai_khoan=K.ID"
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				chiTietThanhVienModel = new ChiTietThanhVienModel();
				chiTietThanhVienModel.setMaThanhVien(rs.getString("ID"));
				chiTietThanhVienModel.setTenDangNhap(rs.getString("Ten_DN"));
				chiTietThanhVienModel.setMatKhau(rs.getString("Mat_khau"));
				chiTietThanhVienModel.setSoTaiKhoan(rs.getString("So_tai_khoan"));
				chiTietThanhVienModel.setNganHang(rs.getString("Ngan_hang"));
				chiTietThanhVienModel.setNgayLapThe(rs.getString("Ngay_lap_the"));
				chiTietThanhVienModel.setHoTen(rs.getString("Ho_ten"));
				chiTietThanhVienModel.setMaVaiTro(rs.getString("Ma_vai_tro"));
				chiTietThanhVienModel.setTenVaiTro(rs.getString("Ten_vai_tro"));
				chiTietThanhVienModel.setMaKhoa(rs.getString("Ma_bo_phan"));
				chiTietThanhVienModel.setTenKhoa(rs.getString("Ten_bo_phan"));
				chiTietThanhVienModel.setNgaySinh(rs.getString("Ngay_sinh"));
				chiTietThanhVienModel.setTinhTrang(rs.getString("Tinh_trang"));
				chiTietThanhVienModel.setEmail(rs.getString("Email"));
				chiTietThanhVienModel.setDienThoaiDiDong(rs.getString("Dien_thoai_dd"));
				chiTietThanhVienModel.setDienThoaiNha(rs.getString("Dien_thoai_nha"));
				chiTietThanhVienModel.setSoNha(rs.getString("So_nha"));
				chiTietThanhVienModel.setDuong(rs.getString("Duong"));
				chiTietThanhVienModel.setPhuongXa(rs.getString("Phuong_xa"));
				chiTietThanhVienModel.setQuanHuyen(rs.getString("Quan_huyen"));
				chiTietThanhVienModel.setThanhPho(rs.getString("Tinh_thanhpho"));
				chiTietThanhVienModel.setChungMinhNhanDan(rs.getString("Chung_minh_nhan_dan"));
				chiTietThanhVienModel.setNgayThuViec(rs.getString("Ngay_thu_viec"));
				chiTietThanhVienModel.setNgayVaoLam(rs.getString("Ngay_bat_dau_lam"));
			}
			chiTietThanhVienModel.setListThamNien(ChiTietCongViecThanhVienDAO.getThamNienByMaThanhVien(chiTietThanhVienModel.getMaThanhVien()));
			chiTietThanhVienModel.setListKhenThuongKyLuat(ChiTietCongViecThanhVienDAO.getKhenThuongKyLuatByMaThanhVien(chiTietThanhVienModel.getMaThanhVien()));
			chiTietThanhVienModel.setListLopHocChuNhiem(ChiTietLopHocDAO.getLopDaChuNhiemByMaThanhVien(chiTietThanhVienModel.getMaThanhVien()));
			chiTietThanhVienModel.setListLopHocGiangDay(KeHoachGiangDayDAO.getThoiGianGiangDayByMaThanhVien(chiTietThanhVienModel.getMaThanhVien()));
			chiTietThanhVienModel.setListChucVu(ChiTietCongViecThanhVienDAO.getChucVuByMaThanhVien(chiTietThanhVienModel.getMaThanhVien()));
			chiTietThanhVienModel.setListBangCap(BangCapDAO.getAllBangCapByMaThanhVien(chiTietThanhVienModel.getMaThanhVien()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return chiTietThanhVienModel;
	 }
	 
	 public static String getMaChucVuByMaThanhVien(String maThanhVien){
		 String kq = "";
		 try {
			String sql = "SELECT * FROM THANHVIEN WHERE ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				kq = rs.getString("Ma_vai_tro");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return kq;
	 }
	 
	 public static String getMaThanhVienByHoSoDuTuyen(String id){
		 String kq = "";
		 try {
			String sql = "SELECT A.ID FROM THANHVIEN A INNER JOIN HOSODUTUYEN B ON A.TEN_DN=B.TEN_DANG_NHAP WHERE B.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				kq = rs.getString("ID");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return kq;
	 }
	 
	 public static ChiTietThanhVienModel updateTinhTrangNhanSu(String tinhTrang, String tenDangNhap) {
			try {
				PreparedStatement preparedStatement = DataUtil
						.getConnection()
						.prepareStatement(
								Constant.SQL_RES
										.getString("admin.sql.updateTinhTrangByTenDangNhap"));
				preparedStatement.setString(1, tinhTrang);
				preparedStatement.setString(2, tenDangNhap);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
}

