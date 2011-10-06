package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class ThangTheoDoiModel {
	private String thang;
	private String nam;
	private ArrayList<ThanhVienDiemDanhModel> thanhVienDiemDanhModelList;
	public String getThang() {
		return thang;
	}
	public void setThang(String thang) {
		this.thang = thang;
	}
	public ArrayList<ThanhVienDiemDanhModel> getThanhVienDiemDanhModelList() {
		return thanhVienDiemDanhModelList;
	}
	public void setThanhVienDiemDanhModelList(
			ArrayList<ThanhVienDiemDanhModel> thanhVienDiemDanhModelList) {
		this.thanhVienDiemDanhModelList = thanhVienDiemDanhModelList;
	}
	public String getNam() {
		return nam;
	}
	public void setNam(String nam) {
		this.nam = nam;
	}
	
}
