package vn.edu.hungvuongaptech.model;
import java.io.Serializable;
import java.util.ArrayList;
public class DiemDanhModel {
	private String ngayBatDau;
	private String ngayKetThuc;
	private String tenMonHoc;
	private String ngayHienTai;
	private String dayOfWeek;
	private String tenKhoa;
	private String hoGiaoVien;
	private String tenLotGiaoVien;
	private String tenGiaoVien;
	private String tinhTrang;
	private String maThanhVienDiemDanh;
	private String buoi;
	private String hinhThucDay;
	private String tenDangNhap;
	private String id;
	private String tenPhong;
	private String tenLop;
	private String gioBatDau;
	private String gioKetThuc;
	private String gioGiangDay;
	private String nhom;
	private String tenHocSinh;
	
	
	public String getTenHocSinh() {
		return tenHocSinh;
	}
	public void setTenHocSinh(String tenHocSinh) {
		this.tenHocSinh = tenHocSinh;
	}
	public String getNhom() {
		return nhom;
	}
	public void setNhom(String nhom) {
		this.nhom = nhom;
	}
	public String getGioBatDau() {
		return gioBatDau;
	}
	public void setGioBatDau(String gioBatDau) {
		this.gioBatDau = gioBatDau;
	}
	public String getGioKetThuc() {
		return gioKetThuc;
	}
	public void setGioKetThuc(String gioKetThuc) {
		this.gioKetThuc = gioKetThuc;
	}
	public String getGioGiangDay() {
		return gioGiangDay;
	}
	public void setGioGiangDay(String gioGiangDay) {
		this.gioGiangDay = gioGiangDay;
	}
	public String getTenLop() {
		return tenLop;
	}
	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}
	public String getTenPhong() {
		return tenPhong;
	}
	public void setTenPhong(String tenPhong) {
		this.tenPhong = tenPhong;
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
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}
	public String getNgayHienTai() {
		return ngayHienTai;
	}
	public void setNgayHienTai(String ngayHienTai) {
		this.ngayHienTai = ngayHienTai;
	}
	public String getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public String getTenKhoa() {
		return tenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	public String getHoGiaoVien() {
		return hoGiaoVien;
	}
	public void setHoGiaoVien(String hoGiaoVien) {
		this.hoGiaoVien = hoGiaoVien;
	}
	public String getTenLotGiaoVien() {
		return tenLotGiaoVien;
	}
	public void setTenLotGiaoVien(String tenLotGiaoVien) {
		this.tenLotGiaoVien = tenLotGiaoVien;
	}
	public String getTenGiaoVien() {
		return tenGiaoVien;
	}
	public void setTenGiaoVien(String tenGiaoVien) {
		this.tenGiaoVien = tenGiaoVien;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getMaThanhVienDiemDanh() {
		return maThanhVienDiemDanh;
	}
	public void setMaThanhVienDiemDanh(String maThanhVienDiemDanh) {
		this.maThanhVienDiemDanh = maThanhVienDiemDanh;
	}
	public String getBuoi() {
		return buoi;
	}
	public void setBuoi(String buoi) {
		this.buoi = buoi;
	}
	public String getHinhThucDay() {
		return hinhThucDay;
	}
	public void setHinhThucDay(String hinhThucDay) {
		this.hinhThucDay = hinhThucDay;
	}
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private ArrayList<KhoaModel> KhoaModelList;
	
	public ArrayList<KhoaModel> getKhoaModelList() {
		return KhoaModelList;
	}
	public void setKhoaModelList(
			ArrayList<KhoaModel> noiDungChiTietKHDTModelList) {
		this.KhoaModelList = KhoaModelList;
	}
	
}
