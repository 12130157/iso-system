package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class IntroModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String tenKHDT;
	private String maNoiDungChiTietKHDT;
	private String maBoPhan;
	private String noiDungCongTac;
	private String tenBoPhan;
	private String maNguoiThucHien;
	private String tenThanhVien;
	private String email;
	private String tuNgay;
	private String denNgay;
	private String tinhTrang;
	
	public String getTenKHDT() {
		return tenKHDT;
	}
	public void setTenKHDT(String tenKHDT) {
		this.tenKHDT = tenKHDT;
	}
	public String getNoiDungCongTac() {
		return noiDungCongTac;
	}
	public void setNoiDungCongTac(String noiDungCongTac) {
		this.noiDungCongTac = noiDungCongTac;
	}
	public String getTenBoPhan() {
		return tenBoPhan;
	}
	public void setTenBoPhan(String tenBoPhan) {
		this.tenBoPhan = tenBoPhan;
	}
	public String getTenThanhVien() {
		return tenThanhVien;
	}
	public void setTenThanhVien(String tenThanhVien) {
		this.tenThanhVien = tenThanhVien;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTuNgay() {
		return tuNgay;
	}
	public void setTuNgay(String tuNgay) {
		this.tuNgay = tuNgay;
	}
	public String getDenNgay() {
		return denNgay;
	}
	public void setDenNgay(String denNgay) {
		this.denNgay = denNgay;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setMaBoPhan(String maBoPhan) {
		this.maBoPhan = maBoPhan;
	}
	public String getMaBoPhan() {
		return maBoPhan;
	}
	public void setMaNguoiThucHien(String maNguoiThucHien) {
		this.maNguoiThucHien = maNguoiThucHien;
	}
	public String getMaNguoiThucHien() {
		return maNguoiThucHien;
	}
	public void setMaNoiDungChiTietKHDT(String maNoiDungChiTietKHDT) {
		this.maNoiDungChiTietKHDT = maNoiDungChiTietKHDT;
	}
	public String getMaNoiDungChiTietKHDT() {
		return maNoiDungChiTietKHDT;
	}
}
