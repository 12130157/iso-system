package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class LoaiLinhKienModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private String maLoaiLinhKien;
	private String tenLoaiLinhKien;
	private String ghiChu;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	public String getMaLoaiLinhKien() {
		return maLoaiLinhKien;
	}
	public void setMaLoaiLinhKien(String maLoaiLinhKien) {
		this.maLoaiLinhKien = maLoaiLinhKien;
	}
	public String getTenLoaiLinhKien() {
		return tenLoaiLinhKien;
	}
	public void setTenLoaiLinhKien(String tenLoaiLinhKien) {
		this.tenLoaiLinhKien = tenLoaiLinhKien;
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
	
}