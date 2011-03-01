package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class PhanCongGiaoVienModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private String maGiaoVien;
	private String tenGiaoVien;
	private String maMonHoc;
	private String tenMonHoc;
	private String lyThuyet;
	private String thucHanh;
	
	public String getMaGiaoVien() {
		return maGiaoVien;
	}
	public void setMaGiaoVien(String maGiaoVien) {
		this.maGiaoVien = maGiaoVien;
	}
	public String getTenGiaoVien() {
		return tenGiaoVien;
	}
	public void setTenGiaoVien(String tenGiaoVien) {
		this.tenGiaoVien = tenGiaoVien;
	}
	public String getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
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
	
}
