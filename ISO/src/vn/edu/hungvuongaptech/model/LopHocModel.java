package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class LopHocModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maLopHoc;
	private String maChuyenNganh;
	private String kiHieu;
	private String maLopTruong;
	private String maQuyetDinh;
	private String tenQuyetDinh;
	private String hoTenLopTruong;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String tenChuyenNganh;
	private String maChuongtrinh;
	private String namBatDau;
	private String soHocSinh;
	ArrayList<NamHocModel> namHocList;
	ArrayList<PhanCongGiaoVienModel> phanCongGiaoVienList;
	private String khoa;
	
	
	public String getKhoa() {
		return khoa;
	}
	public void setKhoa(String khoa) {
		this.khoa = khoa;
	}
	public ArrayList<NamHocModel> getNamHocList() {
		return namHocList;
	}
	public void setNamHocList(ArrayList<NamHocModel> namHocList) {
		this.namHocList = namHocList;
	}
	public String getTenQuyetDinh() {
		return tenQuyetDinh;
	}
	public void setTenQuyetDinh(String tenQuyetDinh) {
		this.tenQuyetDinh = tenQuyetDinh;
	}
	public String getHoTenLopTruong() {
		return hoTenLopTruong;
	}
	public void setHoTenLopTruong(String hoTenLopTruong) {
		this.hoTenLopTruong = hoTenLopTruong;
	}
	public String getSoHocSinh() {
		return soHocSinh;
	}
	public void setSoHocSinh(String soHocSinh) {
		this.soHocSinh = soHocSinh;
	}
	public String getMaQuyetDinh() {
		return maQuyetDinh;
	}
	public void setMaQuyetDinh(String maQuyetDinh) {
		this.maQuyetDinh = maQuyetDinh;
	}
	public String getTenChuyenNganh() {
		return tenChuyenNganh;
	}
	public void setTenChuyenNganh(String tenChuyenNganh) {
		this.tenChuyenNganh = tenChuyenNganh;
	}
	public String getMaChuongtrinh() {
		return maChuongtrinh;
	}
	public void setMaChuongtrinh(String maChuongtrinh) {
		this.maChuongtrinh = maChuongtrinh;
	}
	public String getNamBatDau() {
		return namBatDau;
	}
	public void setNamBatDau(String namBatDau) {
		this.namBatDau = namBatDau;
	}
	public String getMaLopHoc() {
		return maLopHoc;
	}
	public void setMaLopHoc(String maLopHoc) {
		this.maLopHoc = maLopHoc;
	}
	public String getMaChuyenNganh() {
		return maChuyenNganh;
	}
	public void setMaChuyenNganh(String maChuyenNganh) {
		this.maChuyenNganh = maChuyenNganh;
	}
	public String getKiHieu() {
		return kiHieu;
	}
	public void setKiHieu(String kiHieu) {
		this.kiHieu = kiHieu;
	}
	public String getMaLopTruong() {
		return maLopTruong;
	}
	public void setMaLopTruong(String maLopTruong) {
		this.maLopTruong = maLopTruong;
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
	public ArrayList<PhanCongGiaoVienModel> getPhanCongGiaoVienList() {
		return phanCongGiaoVienList;
	}
	public void setPhanCongGiaoVienList(
			ArrayList<PhanCongGiaoVienModel> phanCongGiaoVienList) {
		this.phanCongGiaoVienList = phanCongGiaoVienList;
	}
	
}
