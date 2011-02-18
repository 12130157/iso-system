package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class HocKyModel {

	private String hocKy;
	private String maKhoa;
	private String maNamHoc;
	private String maLop;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	ArrayList<MonHocTKBModel> monHocTKBList;
	
	public ArrayList<MonHocTKBModel> getMonHocTKBList() {
		return monHocTKBList;
	}
	public void setMonHocTKBList(ArrayList<MonHocTKBModel> monHocTKBList) {
		this.monHocTKBList = monHocTKBList;
	}
	public String getHocKy() {
		return hocKy;
	}
	public void setHocKy(String hocKy) {
		this.hocKy = hocKy;
	}
	public String getMaKhoa() {
		return maKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		this.maKhoa = maKhoa;
	}
	public String getMaNamHoc() {
		return maNamHoc;
	}
	public void setMaNamHoc(String maNamHoc) {
		this.maNamHoc = maNamHoc;
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
	
}
