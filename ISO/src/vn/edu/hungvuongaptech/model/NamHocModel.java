package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class NamHocModel {
	private String maNamHoc;
	private String namBatDau;
	private String namKetThuc;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	ArrayList<HocKyModel> hocKyList;
	ArrayList<NhomModel> nhomList;
	ArrayList<ThanhVienModel> thanhVienList;
	

	public ArrayList<NhomModel> getNhomList() {
		return nhomList;
	}
	public void setNhomList(ArrayList<NhomModel> nhomList) {
		this.nhomList = nhomList;
	}
	public ArrayList<ThanhVienModel> getThanhVienList() {
		return thanhVienList;
	}
	public void setThanhVienList(ArrayList<ThanhVienModel> thanhVienList) {
		this.thanhVienList = thanhVienList;
	}
	public ArrayList<HocKyModel> getHocKyList() {
		return hocKyList;
	}
	public void setHocKyList(ArrayList<HocKyModel> hocKyList) {
		this.hocKyList = hocKyList;
	}
	public String getMaNamHoc() {
		return maNamHoc;
	}
	public void setMaNamHoc(String maNamHoc) {
		this.maNamHoc = maNamHoc;
	}
	public String getNamBatDau() {
		return namBatDau;
	}
	public void setNamBatDau(String namBatDau) {
		this.namBatDau = namBatDau;
	}
	public String getNamKetThuc() {
		return namKetThuc;
	}
	public void setNamKetThuc(String namKetThuc) {
		this.namKetThuc = namKetThuc;
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
