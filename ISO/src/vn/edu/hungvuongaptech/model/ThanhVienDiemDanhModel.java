package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class ThanhVienDiemDanhModel {
	private String maDiemDanh;
	private String maTVDD;
	private String maThanhVien;
	private String tenThanhVien;
	private ArrayList<ChiTietDiemDanhModel> chiTietDiemDanhList;
	
	
	public ArrayList<ChiTietDiemDanhModel> getChiTietDiemDanhList() {
		return chiTietDiemDanhList;
	}
	public void setChiTietDiemDanhList(
			ArrayList<ChiTietDiemDanhModel> chiTietDiemDanhList) {
		this.chiTietDiemDanhList = chiTietDiemDanhList;
	}
	public String getMaDiemDanh() {
		return maDiemDanh;
	}
	public void setMaDiemDanh(String maDiemDanh) {
		this.maDiemDanh = maDiemDanh;
	}
	public String getMaTVDD() {
		return maTVDD;
	}
	public void setMaTVDD(String maTVDD) {
		this.maTVDD = maTVDD;
	}
	public String getMaThanhVien() {
		return maThanhVien;
	}
	public void setMaThanhVien(String maThanhVien) {
		this.maThanhVien = maThanhVien;
	}
	public String getTenThanhVien() {
		return tenThanhVien;
	}
	public void setTenThanhVien(String tenThanhVien) {
		this.tenThanhVien = tenThanhVien;
	}
	
}
