package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class ThangModel {
	private String thang;
	private String nam;
	private String tongNgayNghi;
	private ArrayList<ThanhVienModel> listHocSinh;
	
	
	public String getTongNgayNghi() {
		return tongNgayNghi;
	}
	public void setTongNgayNghi(String tongNgayNghi) {
		this.tongNgayNghi = tongNgayNghi;
	}
	public String getThang() {
		return thang;
	}
	public void setThang(String thang) {
		this.thang = thang;
	}
	public String getNam() {
		return nam;
	}
	public void setNam(String nam) {
		this.nam = nam;
	}
	public ArrayList<ThanhVienModel> getListHocSinh() {
		return listHocSinh;
	}
	public void setListHocSinh(ArrayList<ThanhVienModel> listHocSinh) {
		this.listHocSinh = listHocSinh;
	}
	
	
	
}
