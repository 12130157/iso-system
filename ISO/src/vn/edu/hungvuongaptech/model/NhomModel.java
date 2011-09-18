package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class NhomModel {
	private String nhom;
	private ArrayList<MonHocModel> monHocList;
	private ArrayList<ThanhVienModel> thanhVienList;
	public String getNhom() {
		return nhom;
	}
	public void setNhom(String nhom) {
		this.nhom = nhom;
	}
	public ArrayList<MonHocModel> getMonHocList() {
		return monHocList;
	}
	public void setMonHocList(ArrayList<MonHocModel> monHocList) {
		this.monHocList = monHocList;
	}
	public ArrayList<ThanhVienModel> getThanhVienList() {
		return thanhVienList;
	}
	public void setThanhVienList(ArrayList<ThanhVienModel> thanhVienList) {
		this.thanhVienList = thanhVienList;
	}
}
