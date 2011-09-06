/**
 * 
 */
package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * @author ThienVD
 *
 */
public class ChiTietThanhVienModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String maThanhVien;
	private String tenDangNhap;
	private String matKhau;
	private String hoThanhVien;
	private String tenLot;
	private String tenThanhVien;
	private String ngaySinh;
	private String maDiaChi;
	private String soNha;
	private String duong;
	private String phuongXa;
	private String quanHuyen;
	private String thanhPho;
	private String email;
	private String dienThoaiDiDong;
	private String dienThoaiNha;
	private String maBangCap;
	private String loaiBang;
	private String truongCap;
	private String namTotNghiep;
	private String loaiTotNghiep;
	private String ngayBatDau;
	private String ngayKetThuc;
	private String maTaiKhoan;
	private String soTaiKhoan;
	private String nganHang;
	private String ngayLapThe;
	private String tinhTrang;
	private String chungMinhNhanDan;
	private String maLopHoc;
	private String kiHieuLop;
	private String maVaiTro;
	private String tenVaiTro;
	private String maKhoa;
	private String tenKhoa;
	private String ngayTao;
	private String ngayTruyCapCuoi;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String maMonHoc;
	private String sHoTen;
	private String sDiaChi;
	private String sNgaySinh;
	private String sNgayVaoLam;
	private String sEmail;
	private String sBoPhan;
	private String sVaiTro;
	private String sBangCap;
	private String hoTen;
	
	private String ngayThuViec;
	private String ngayVaoLam;
	
	private ArrayList<ChiTietCongViecThanhVienModel> listThamNien;
	private ArrayList<ChiTietCongViecThanhVienModel> listKhenThuongKyLuat;
	private ArrayList<ChiTietLopHocModel> listLopHocChuNhiem;
	private ArrayList<BangCapModel> listBangCap;
	private ArrayList<KeHoachGiangDayModel> listLopHocGiangDay;
	private ArrayList<String> listChucVu;
	private ArrayList<LuongModel> listLuong;
	
	private String ngayCap;
	private String noiCap;
	
	

	public ArrayList<LuongModel> getListLuong() {
		return listLuong;
	}

	public void setListLuong(ArrayList<LuongModel> listLuong) {
		this.listLuong = listLuong;
	}

	public String getsHoTen() {
		return sHoTen;
	}

	public void setsHoTen(String sHoTen) {
		this.sHoTen = sHoTen;
	}

	public String getsDiaChi() {
		return sDiaChi;
	}

	public void setsDiaChi(String sDiaChi) {
		this.sDiaChi = sDiaChi;
	}

	public String getsNgaySinh() {
		return sNgaySinh;
	}

	public void setsNgaySinh(String sNgaySinh) {
		this.sNgaySinh = sNgaySinh;
	}

	public String getsNgayVaoLam() {
		return sNgayVaoLam;
	}

	public void setsNgayVaoLam(String sNgayVaoLam) {
		this.sNgayVaoLam = sNgayVaoLam;
	}

	public String getsEmail() {
		return sEmail;
	}

	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}

	public String getsBoPhan() {
		return sBoPhan;
	}

	public void setsBoPhan(String sBoPhan) {
		this.sBoPhan = sBoPhan;
	}

	public String getsVaiTro() {
		return sVaiTro;
	}

	public void setsVaiTro(String sVaiTro) {
		this.sVaiTro = sVaiTro;
	}

	public String getsBangCap() {
		return sBangCap;
	}

	public void setsBangCap(String sBangCap) {
		this.sBangCap = sBangCap;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getNgayThuViec() {
		return ngayThuViec;
	}

	public void setNgayThuViec(String ngayThuViec) {
		this.ngayThuViec = ngayThuViec;
	}

	public String getNgayVaoLam() {
		return ngayVaoLam;
	}

	public void setNgayVaoLam(String ngayVaoLam) {
		this.ngayVaoLam = ngayVaoLam;
	}

	public ArrayList<ChiTietCongViecThanhVienModel> getListThamNien() {
		return listThamNien;
	}

	public void setListThamNien(
			ArrayList<ChiTietCongViecThanhVienModel> listThamNien) {
		this.listThamNien = listThamNien;
	}

	public ArrayList<ChiTietCongViecThanhVienModel> getListKhenThuongKyLuat() {
		return listKhenThuongKyLuat;
	}

	public void setListKhenThuongKyLuat(
			ArrayList<ChiTietCongViecThanhVienModel> listKhenThuongKyLuat) {
		this.listKhenThuongKyLuat = listKhenThuongKyLuat;
	}

	public ArrayList<ChiTietLopHocModel> getListLopHocChuNhiem() {
		return listLopHocChuNhiem;
	}

	public void setListLopHocChuNhiem(
			ArrayList<ChiTietLopHocModel> listLopHocChuNhiem) {
		this.listLopHocChuNhiem = listLopHocChuNhiem;
	}

	public ArrayList<BangCapModel> getListBangCap() {
		return listBangCap;
	}

	public void setListBangCap(ArrayList<BangCapModel> listBangCap) {
		this.listBangCap = listBangCap;
	}

	public ArrayList<KeHoachGiangDayModel> getListLopHocGiangDay() {
		return listLopHocGiangDay;
	}

	public void setListLopHocGiangDay(
			ArrayList<KeHoachGiangDayModel> listLopHocGiangDay) {
		this.listLopHocGiangDay = listLopHocGiangDay;
	}

	public ArrayList<String> getListChucVu() {
		return listChucVu;
	}

	public void setListChucVu(ArrayList<String> listChucVu) {
		this.listChucVu = listChucVu;
	}

	public String getNgayCap() {
		return ngayCap;
	}

	public void setNgayCap(String ngayCap) {
		this.ngayCap = ngayCap;
	}

	public String getNoiCap() {
		return noiCap;
	}

	public void setNoiCap(String noiCap) {
		this.noiCap = noiCap;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getKiHieuLop() {
		return kiHieuLop;
	}

	public void setKiHieuLop(String kiHieuLop) {
		this.kiHieuLop = kiHieuLop;
	}
	public String getMaMonHoc() {
		return maMonHoc;
	}

	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}

	public ChiTietThanhVienModel() {
		this.maThanhVien= "";
		this.tenDangNhap= "";
		this.matKhau= "";
		this.hoThanhVien= "";
		this.tenLot= "";
		this.tenThanhVien= "";
		this.ngaySinh= "";
		this.maDiaChi= "";
		this.soNha= "";
		this.duong= "";
		this.phuongXa= "";
		this.quanHuyen= "";
		this.thanhPho= "";
		this.email= "";
		this.dienThoaiDiDong= "";
		this.dienThoaiNha= "";
		this.maBangCap= "";
		this.loaiBang= "";
		this.truongCap= "";
		this.namTotNghiep= "";
		this.loaiTotNghiep= "";
		this.ngayBatDau= "";
		this.ngayKetThuc= "";
		this.maTaiKhoan= "";
		this.soTaiKhoan= "";
		this.nganHang= "";
		this.ngayLapThe= "";
		this.tinhTrang= "";
		this.chungMinhNhanDan= "";
		this.maLopHoc= "";
		this.maVaiTro= "";
		this.tenVaiTro= "";
		this.maKhoa= "";
		this.tenKhoa= "";
		this.ngayTao= "";
		this.ngayTruyCapCuoi= "";
		this.ngayCapNhatCuoi= "";
		this.user1= "";
		this.user2= "";
		this.user3= "";
		this.user4= "";
		this.user5= "";
	}
	
	public String getMaKhoa() {
		return maKhoa;
	}

	public void setMaKhoa(String maKhoa) {
		this.maKhoa = maKhoa;
	}

	public String getTenKhoa() {
		return tenKhoa;
	}

	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}

	public String getNgayTruyCapCuoi() {
		return ngayTruyCapCuoi;
	}
	public void setNgayTruyCapCuoi(String ngayTruyCapCuoi) {
		this.ngayTruyCapCuoi = ngayTruyCapCuoi;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getSoTaiKhoan() {
		return soTaiKhoan;
	}
	public void setSoTaiKhoan(String soTaiKhoan) {
		this.soTaiKhoan = soTaiKhoan;
	}
	public String getNganHang() {
		return nganHang;
	}
	public void setNganHang(String nganHang) {
		this.nganHang = nganHang;
	}
	public String getNgayLapThe() {
		return ngayLapThe;
	}
	public void setNgayLapThe(String ngayLapThe) {
		this.ngayLapThe = ngayLapThe;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getDienThoaiNha() {
		return dienThoaiNha;
	}
	public void setDienThoaiNha(String dienThoaiNha) {
		this.dienThoaiNha = dienThoaiNha;
	}
	public String getMaVaiTro() {
		return maVaiTro;
	}
	public void setMaVaiTro(String maVaiTro) {
		this.maVaiTro = maVaiTro;
	}
	public String getTenVaiTro() {
		return tenVaiTro;
	}
	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}
	public String getMaThanhVien() {
		return maThanhVien;
	}
	public void setMaThanhVien(String maThanhVien) {
		this.maThanhVien = maThanhVien;
	}
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getHoThanhVien() {
		return hoThanhVien;
	}
	public void setHoThanhVien(String hoThanhVien) {
		this.hoThanhVien = hoThanhVien;
	}
	public String getTenLot() {
		return tenLot;
	}
	public void setTenLot(String tenLot) {
		this.tenLot = tenLot;
	}
	public String getTenThanhVien() {
		return tenThanhVien;
	}
	public void setTenThanhVien(String tenThanhVien) {
		this.tenThanhVien = tenThanhVien;
	}
	public String getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getMaDiaChi() {
		return maDiaChi;
	}
	public void setMaDiaChi(String maDiaChi) {
		this.maDiaChi = maDiaChi;
	}
	public String getSoNha() {
		return soNha;
	}
	public void setSoNha(String soNha) {
		this.soNha = soNha;
	}
	public String getDuong() {
		return duong;
	}
	public void setDuong(String duong) {
		this.duong = duong;
	}
	public String getPhuongXa() {
		return phuongXa;
	}
	public void setPhuongXa(String phuongXa) {
		this.phuongXa = phuongXa;
	}
	public String getQuanHuyen() {
		return quanHuyen;
	}
	public void setQuanHuyen(String quanHuyen) {
		this.quanHuyen = quanHuyen;
	}
	public String getThanhPho() {
		return thanhPho;
	}
	public void setThanhPho(String thanhPho) {
		this.thanhPho = thanhPho;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDienThoaiDiDong() {
		return dienThoaiDiDong;
	}
	public void setDienThoaiDiDong(String dienThoaiDiDong) {
		this.dienThoaiDiDong = dienThoaiDiDong;
	}
	public String getMaBangCap() {
		return maBangCap;
	}
	public void setMaBangCap(String maBangCap) {
		this.maBangCap = maBangCap;
	}
	public String getLoaiBang() {
		return loaiBang;
	}
	public void setLoaiBang(String loaiBang) {
		this.loaiBang = loaiBang;
	}
	public String getTruongCap() {
		return truongCap;
	}
	public void setTruongCap(String truongCap) {
		this.truongCap = truongCap;
	}
	public String getNamTotNghiep() {
		return namTotNghiep;
	}
	public void setNamTotNghiep(String namTotNghiep) {
		this.namTotNghiep = namTotNghiep;
	}
	public String getLoaiTotNghiep() {
		return loaiTotNghiep;
	}
	public void setLoaiTotNghiep(String loaiTotNghiep) {
		this.loaiTotNghiep = loaiTotNghiep;
	}
	public String getNgayBatDau() {
		return ngayBatDau;
	}
	public void setNgayBatDau(String ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}
	public String getNgayKetThuc() {
		return ngayKetThuc;
	}
	public void setNgayKetThuc(String ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}
	public String getMaTaiKhoan() {
		return maTaiKhoan;
	}
	public void setMaTaiKhoan(String maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getChungMinhNhanDan() {
		return chungMinhNhanDan;
	}
	public void setChungMinhNhanDan(String chungMinhNhanDan) {
		this.chungMinhNhanDan = chungMinhNhanDan;
	}
	public String getMaLopHoc() {
		return maLopHoc;
	}
	public void setMaLopHoc(String maLopHoc) {
		this.maLopHoc = maLopHoc;
	}
	public String getUser1() {
		return user1;
	}
	public void setUser1(String user1) {
		this.user1 = user1;
	}
	public String getUser2() {
		return user2;
	}
	public void setUser2(String user2) {
		this.user2 = user2;
	}
	public String getUser3() {
		return user3;
	}
	public void setUser3(String user3) {
		this.user3 = user3;
	}
	public String getUser4() {
		return user4;
	}
	public void setUser4(String user4) {
		this.user4 = user4;
	}
	public String getUser5() {
		return user5;
	}
	public void setUser5(String user5) {
		this.user5 = user5;
	}
		
}
