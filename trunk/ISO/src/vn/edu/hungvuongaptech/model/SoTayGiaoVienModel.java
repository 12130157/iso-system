package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class SoTayGiaoVienModel {
	private String id;
	private String maKHGD;
	private String quanLyHocSinhCaBiet;
	private String danhGiaQuiTrinhGiangDay;
	private String tinhTrang;
	private String ngayCapNhatCuoi;
	private ArrayList<ThanhVienModel> listHocSinh;
	private ArrayList<DiemDanhModel> listDiemDanh;
	private ArrayList<String> listThang;
	
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMaKHGD() {
		return maKHGD;
	}
	public void setMaKHGD(String maKHGD) {
		this.maKHGD = maKHGD;
	}
	public String getQuanLyHocSinhCaBiet() {
		return quanLyHocSinhCaBiet;
	}
	public void setQuanLyHocSinhCaBiet(String quanLyHocSinhCaBiet) {
		this.quanLyHocSinhCaBiet = quanLyHocSinhCaBiet;
	}
	public String getDanhGiaQuiTrinhGiangDay() {
		return danhGiaQuiTrinhGiangDay;
	}
	public void setDanhGiaQuiTrinhGiangDay(String danhGiaQuiTrinhGiangDay) {
		this.danhGiaQuiTrinhGiangDay = danhGiaQuiTrinhGiangDay;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	
	public ArrayList<ThanhVienModel> getListHocSinh() {
		return listHocSinh;
	}
	public void setListHocSinh(ArrayList<ThanhVienModel> listHocSinh) {
		this.listHocSinh = listHocSinh;
	}
	public ArrayList<DiemDanhModel> getListDiemDanh() {
		return listDiemDanh;
	}
	public void setListDiemDanh(ArrayList<DiemDanhModel> listDiemDanh) {
		this.listDiemDanh = listDiemDanh;
	}
	public ArrayList<String> getListThang() {
		return listThang;
	}
	public void setListThang(ArrayList<String> listThang) {
		this.listThang = listThang;
	}
	
	
	
}
