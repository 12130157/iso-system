package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class SoDiemMonHocModel implements Serializable{
	// TODO Auto-generated method stub
	private static final long serialVersionUID = 1L;
	private String maSoDiemMonHoc;
	private String maMonHocTKB;
	private String maHocKiTungLop;
	private String tinhTrang;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	public String getMaSoDiemMonHoc() {
		return maSoDiemMonHoc;
	}
	public void setMaSoDiemMonHoc(String maSoDiemMonHoc) {
		this.maSoDiemMonHoc = maSoDiemMonHoc;
	}
	public String getMaMonHocTKB() {
		return maMonHocTKB;
	}
	public void setMaMonHocTKB(String maMonHocTKB) {
		this.maMonHocTKB = maMonHocTKB;
	}
	public String getMaHocKiTungLop() {
		return maHocKiTungLop;
	}
	public void setMaHocKiTungLop(String maHocKiTungLop) {
		this.maHocKiTungLop = maHocKiTungLop;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
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
	ArrayList<DangKyMonHocModel> dangKyMonHocList;
	public ArrayList<DangKyMonHocModel> getDangKyMonHocList() {
		return dangKyMonHocList;
	}
	public void setDangKyMonHocList(ArrayList<DangKyMonHocModel> dangKyMonHocList) {
		this.dangKyMonHocList = dangKyMonHocList;
	}
	
	private String tenGiaoVien;
	private String tenMonHoc;
	private String tenChuyenNganh;
	private String kiHieuLop;
	private String namHoc;
	private String maMon;
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
	public String getTenChuyenNganh() {
		return tenChuyenNganh;
	}
	public void setTenChuyenNganh(String tenChuyenNganh) {
		this.tenChuyenNganh = tenChuyenNganh;
	}
	public String getKiHieuLop() {
		return kiHieuLop;
	}
	public void setKiHieuLop(String kiHieuLop) {
		this.kiHieuLop = kiHieuLop;
	}
	public String getNamHoc() {
		return namHoc;
	}
	public void setNamHoc(String namHoc) {
		this.namHoc = namHoc;
	}
	public String getMaMon() {
		return maMon;
	}
	public void setMaMon(String maMon) {
		this.maMon = maMon;
	}
	
}
