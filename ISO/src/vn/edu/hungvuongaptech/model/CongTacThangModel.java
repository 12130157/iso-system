package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class CongTacThangModel  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maCongTacThang;
	private String maKeHoachThang;
	private String maCongTac;
	private String ngayCapNhatCuoi;
	private String baoCao;
	private String ghiChu;
	private String boPhanThucHien;
	private String noiDungCongTac;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private ArrayList<TinhTrangCongTacModel> tinhTrangCongTacList;
	public String getMaCongTacThang() {
		return maCongTacThang;
	}
	public void setMaCongTacThang(String maCongTacThang) {
		this.maCongTacThang = maCongTacThang;
	}
	public String getMaKeHoachThang() {
		return maKeHoachThang;
	}
	public void setMaKeHoachThang(String maKeHoachThang) {
		this.maKeHoachThang = maKeHoachThang;
	}
	public String getMaCongTac() {
		return maCongTac;
	}
	public void setMaCongTac(String maCongTac) {
		this.maCongTac = maCongTac;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getBaoCao() {
		return baoCao;
	}
	public void setBaoCao(String baoCao) {
		this.baoCao = baoCao;
	}
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	
	public String getNoiDungCongTac() {
		return noiDungCongTac;
	}
	public void setNoiDungCongTac(String noiDungCongTac) {
		this.noiDungCongTac = noiDungCongTac;
	}
	public String getBoPhanThucHien() {
		return boPhanThucHien;
	}
	public void setBoPhanThucHien(String boPhanThucHien) {
		this.boPhanThucHien = boPhanThucHien;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ArrayList<TinhTrangCongTacModel> getTinhTrangCongTacList() {
		return tinhTrangCongTacList;
	}
	public void setTinhTrangCongTacList(
			ArrayList<TinhTrangCongTacModel> tinhTrangCongTacList) {
		this.tinhTrangCongTacList = tinhTrangCongTacList;
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
