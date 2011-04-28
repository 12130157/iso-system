package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class PhieuMuonThietBiModel implements Serializable {	
	private static final long serialVersionUID = 1L;
	private String maPhieuMuon;
	private String maNguoiMuon;
	private String tenNguoiMuon;
	private String ngayMuon;
	private String maLop;
	private String kiHieuLop;
	private String ghiChu;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	ArrayList<ChiTietPhieuMuonModel> chiTietPhieuMuonList;
	
	private String khoa;
	private String tenKhoa;
	
	public String getKiHieuLop() {
		return kiHieuLop;
	}
	public void setKiHieuLop(String kiHieuLop) {
		this.kiHieuLop = kiHieuLop;
	}
	public String getTenKhoa() {
		return tenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	public String getMaPhieuMuon() {
		return maPhieuMuon;
	}
	public void setMaPhieuMuon(String maPhieuMuon) {
		this.maPhieuMuon = maPhieuMuon;
	}
	public String getMaNguoiMuon() {
		return maNguoiMuon;
	}
	public void setMaNguoiMuon(String maNguoiMuon) {
		this.maNguoiMuon = maNguoiMuon;
	}
	public String getTenNguoiMuon() {
		return tenNguoiMuon;
	}
	public void setTenNguoiMuon(String tenNguoiMuon) {
		this.tenNguoiMuon = tenNguoiMuon;
	}
	public String getNgayMuon() {
		return ngayMuon;
	}
	public void setNgayMuon(String ngayMuon) {
		this.ngayMuon = ngayMuon;
	}
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
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
	public String getKhoa() {
		return khoa;
	}
	public void setKhoa(String khoa) {
		this.khoa = khoa;
	}
	public ArrayList<ChiTietPhieuMuonModel> getChiTietPhieuMuonList() {
		return chiTietPhieuMuonList;
	}
	public void setChiTietPhieuMuonList(
			ArrayList<ChiTietPhieuMuonModel> chiTietPhieuMuonList) {
		this.chiTietPhieuMuonList = chiTietPhieuMuonList;
	}
	
}
