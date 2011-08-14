package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class CTDT_BangPhanCongModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String maBangPhanCong;
	private String maChuongTrinh;
	private String maLop;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private ArrayList<ChiTietBangPhanCongModel> chiTietBangPhanCongList;
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
	public String getMaChuongTrinh() {
		return maChuongTrinh;
	}
	public void setMaChuongTrinh(String maChuongTrinh) {
		this.maChuongTrinh = maChuongTrinh;
	}
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
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
	public ArrayList<ChiTietBangPhanCongModel> getChiTietBangPhanCongList() {
		return chiTietBangPhanCongList;
	}
	public void setChiTietBangPhanCongList(
			ArrayList<ChiTietBangPhanCongModel> chiTietBangPhanCongList) {
		this.chiTietBangPhanCongList = chiTietBangPhanCongList;
	}
}
