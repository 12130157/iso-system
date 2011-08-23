package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class ChiTietBangPhanCongModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String maBangPhanCong;
	private String maChiTietCTDT;
	private String maLop;
	private String kiHieuLop;
	private String maGiaoVien;
	private String tenGiaoVien;
	private String maMonHoc;
	private String tenMonHoc;
	private String nhiemVu;
	private String ghiChu;
	private String lyThuyet;
	private String thucHanh;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String tenChuyenNganh;
	private String maChuongTrinh;
	private String soHocSinh; // so hoc sinh cua moi lop
	
	public String getSoHocSinh() {
		return soHocSinh;
	}
	public void setSoHocSinh(String soHocSinh) {
		this.soHocSinh = soHocSinh;
	}
	public String getMaChuongTrinh() {
		return maChuongTrinh;
	}
	public void setMaChuongTrinh(String maChuongTrinh) {
		this.maChuongTrinh = maChuongTrinh;
	}
	public String getTenChuyenNganh() {
		return tenChuyenNganh;
	}
	public void setTenChuyenNganh(String tenChuyenNganh) {
		this.tenChuyenNganh = tenChuyenNganh;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMaBangPhanCong() {
		return maBangPhanCong;
	}
	public void setMaBangPhanCong(String maBangPhanCong) {
		this.maBangPhanCong = maBangPhanCong;
	}
	public String getMaChiTietCTDT() {
		return maChiTietCTDT;
	}
	public void setMaChiTietCTDT(String maChiTietCTDT) {
		this.maChiTietCTDT = maChiTietCTDT;
	}
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}
	public String getMaGiaoVien() {
		return maGiaoVien;
	}
	public void setMaGiaoVien(String maGiaoVien) {
		this.maGiaoVien = maGiaoVien;
	}
	public String getNhiemVu() {
		return nhiemVu;
	}
	public void setNhiemVu(String nhiemVu) {
		this.nhiemVu = nhiemVu;
	}
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
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
	public String getLyThuyet() {
		return lyThuyet;
	}
	public void setLyThuyet(String lyThuyet) {
		this.lyThuyet = lyThuyet;
	}
	public String getThucHanh() {
		return thucHanh;
	}
	public void setThucHanh(String thucHanh) {
		this.thucHanh = thucHanh;
	}
	public String getKiHieuLop() {
		return kiHieuLop;
	}
	public void setKiHieuLop(String kiHieuLop) {
		this.kiHieuLop = kiHieuLop;
	}
	public String getTenGiaoVien() {
		return tenGiaoVien;
	}
	public void setTenGiaoVien(String tenGiaoVien) {
		this.tenGiaoVien = tenGiaoVien;
	}
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}
	public String getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	
}
