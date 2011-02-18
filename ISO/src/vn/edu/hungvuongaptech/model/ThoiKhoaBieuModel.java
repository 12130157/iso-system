package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class ThoiKhoaBieuModel implements Serializable {

	// TODO Auto-generated method stub
	private static final long serialVersionUID = 1L;
	private String maThoiKhoaBieu;
	private String tenThoiKhoaBieu;
	private String maLop;
	private String kiHieuLop;
	private String hocKi;
	private String nam1;
	private String nam2;
	private String tenChuyenNganh;
	private String tuanBatDau;
	private String tuanKetThuc;
	private String ngayBatDau;
	private String ngayKetThuc;
	private String maNguoiTao;
	private String ngayTao;
	private String maNguoiDuyet;
	private String ngayDuyet;
	private String gioDuyet;
	private String ngayCapNhatCuoi;
	private String lyDoReject;
	private String tinhTrang;
	private String ngayGui;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String tenNguoiTao;
	private String tenNguoiDuyet;
	ArrayList<MonHocTKBModel> monHocTKBModelList;
	ArrayList<ChiTietTKBModel> chiTietTKBModelList;
	private String tenKhoa;
	private String gioGui;
	private String tenSinhVien;
	private String maSinhVien;
	
	public String getMaSinhVien() {
		return maSinhVien;
	}
	public void setMaSinhVien(String maSinhVien) {
		this.maSinhVien = maSinhVien;
	}
	public String getTenSinhVien() {
		return tenSinhVien;
	}
	public void setTenSinhVien(String tenSinhVien) {
		this.tenSinhVien = tenSinhVien;
	}
	public String getGioGui() {
		return gioGui;
	}
	public void setGioGui(String gioGui) {
		this.gioGui = gioGui;
	}
	public String getTenKhoa() {
		return tenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	public String getGioDuyet() {
		return gioDuyet;
	}
	public void setGioDuyet(String gioDuyet) {
		this.gioDuyet = gioDuyet;
	}
	public String getKiHieuLop() {
		return kiHieuLop;
	}
	public void setKiHieuLop(String kiHieuLop) {
		this.kiHieuLop = kiHieuLop;
	}
	public String getTenChuyenNganh() {
		return tenChuyenNganh;
	}
	public void setTenChuyenNganh(String tenChuyenNganh) {
		this.tenChuyenNganh = tenChuyenNganh;
	}
	public String getNam1() {
		return nam1;
	}
	public void setNam1(String nam1) {
		this.nam1 = nam1;
	}
	public String getNam2() {
		return nam2;
	}
	public void setNam2(String nam2) {
		this.nam2 = nam2;
	}
	public String getHocKi() {
		return hocKi;
	}
	public void setHocKi(String hocKi) {
		this.hocKi = hocKi;
	}
	public String getTenThoiKhoaBieu() {
		return tenThoiKhoaBieu;
	}
	public void setTenThoiKhoaBieu(String tenThoiKhoaBieu) {
		this.tenThoiKhoaBieu = tenThoiKhoaBieu;
	}
	
	public ArrayList<MonHocTKBModel> getMonHocTKBModelList() {
		return monHocTKBModelList;
	}
	public void setMonHocTKBModelList(ArrayList<MonHocTKBModel> monHocTKBModelList) {
		this.monHocTKBModelList = monHocTKBModelList;
	}
	
	public ArrayList<ChiTietTKBModel> getChiTietTKBModelList() {
		return chiTietTKBModelList;
	}
	public void setChiTietTKBModelList(
			ArrayList<ChiTietTKBModel> chiTietTKBModelList) {
		this.chiTietTKBModelList = chiTietTKBModelList;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getLyDoReject() {
		return lyDoReject;
	}
	public void setLyDoReject(String lyDoReject) {
		this.lyDoReject = lyDoReject;
	}
	public String getMaThoiKhoaBieu() {
		return maThoiKhoaBieu;
	}
	public void setMaThoiKhoaBieu(String maThoiKhoaBieu) {
		this.maThoiKhoaBieu = maThoiKhoaBieu;
	}
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}
	public String getTuanBatDau() {
		return tuanBatDau;
	}
	public void setTuanBatDau(String tuanBatDau) {
		this.tuanBatDau = tuanBatDau;
	}
	public String getTuanKetThuc() {
		return tuanKetThuc;
	}
	public void setTuanKetThuc(String tuanKetThuc) {
		this.tuanKetThuc = tuanKetThuc;
	}
	public String getNgayBatDau() {
		return ngayBatDau;
	}
	public void setNgayBatDau(String ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}
	public String getNgayKetThuc() {
		return ngayKetThuc;
	}
	public void setNgayKetThuc(String ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}
	public String getMaNguoiTao() {
		return maNguoiTao;
	}
	public void setMaNguoiTao(String maNguoiTao) {
		this.maNguoiTao = maNguoiTao;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getMaNguoiDuyet() {
		return maNguoiDuyet;
	}
	public void setMaNguoiDuyet(String maNguoiDuyet) {
		this.maNguoiDuyet = maNguoiDuyet;
	}
	public String getNgayDuyet() {
		return ngayDuyet;
	}
	public void setNgayDuyet(String ngayDuyet) {
		this.ngayDuyet = ngayDuyet;
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
	public String getTenNguoiTao() {
		return tenNguoiTao;
	}
	public void setTenNguoiTao(String tenNguoiTao) {
		this.tenNguoiTao = tenNguoiTao;
	}
	public String getTenNguoiDuyet() {
		return tenNguoiDuyet;
	}
	public void setTenNguoiDuyet(String tenNguoiDuyet) {
		this.tenNguoiDuyet = tenNguoiDuyet;
	}
	
	
	
	public Boolean validateModel() {
		Boolean result = true;
		if (maLop == null || maLop.equals("")) {
			result = false;
		} else if (tuanBatDau == null || tuanBatDau.equals("")) {
			result = false;
		} else if (tuanKetThuc == null || tuanKetThuc.equals("")) {
			result = false;
		} else if (ngayBatDau == null || ngayBatDau.equals("")) {
			result = false;
		} else if (ngayKetThuc == null || ngayKetThuc.equals("")) {
			result = false;			
		} else if (nam1 == null || nam1.equals("")) {
			result = false;			
		} else if (nam2 == null || nam2.equals("")) {
			result = false;			
		} else if (hocKi == null || hocKi.equals("")) {
			result = false;			
		}
		
		return result;
	}
	public String getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(String ngayGui) {
		this.ngayGui = ngayGui;
	}
}
