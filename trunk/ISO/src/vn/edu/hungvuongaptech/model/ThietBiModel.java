package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class ThietBiModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String maThietBi;
	private String tenThietBi;
	private String maLoaiThietBi;
	private String tenLoaiThietBi;
	private String kiHieu;
	private String maTinhTrang;
	private String tenTinhTrang;	
	private String ghiChu;
	private String maBoPhan;
	private String tenBoPhan;	
	private String maNguoiTao;
	private String tenNguoiTao;
	private String maPhongBan;
	private String tenPhongBan;
	private String maNhaCungCap;
	private String ngaySanXuat;
	private String ngayMua;
	private String hanBaoHanh;
	private String ngayBatDauSuDung;
	private String tanSuatToiDa;
	private String maTanSuat;
	private String tanSuatSuDung;
	private String phuKien;
	private String giaMua;
	private String nguyenTacSuDung;
	private String dacTinhKyThuat;
	private String ngayCapNhatCuoi;
	private String soLanSuDung;
	private String soLanBaoTri;
	private String kiemTraTonTai;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	
	private String maThietBiTruoc;
	private String soLuong;
	private String tinhTrangDuocXoa;
	
	private ArrayList<ChiTietThietBiModel> chiTietThietBiList;
	
	public String getTinhTrangDuocXoa() {
		return tinhTrangDuocXoa;
	}

	public void setTinhTrangDuocXoa(String tinhTrangDuocXoa) {
		this.tinhTrangDuocXoa = tinhTrangDuocXoa;
	}

	public String getKiemTraTonTai() {
		return kiemTraTonTai;
	}

	public void setKiemTraTonTai(String kiemTraTonTai) {
		this.kiemTraTonTai = kiemTraTonTai;
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


	public String getMaThietBiTruoc() {
		return maThietBiTruoc;
	}

	public void setMaThietBiTruoc(String maThietBiTruoc) {
		this.maThietBiTruoc = maThietBiTruoc;
	}

	public ArrayList<ChiTietThietBiModel> getChiTietThietBiList() {
		return chiTietThietBiList;
	}

	public void setChiTietThietBiList(
			ArrayList<ChiTietThietBiModel> chiTietThietBiList) {
		this.chiTietThietBiList = chiTietThietBiList;
	}

	public String getMaThietBi() {
		return maThietBi;
	}

	public void setMaThietBi(String maThietBi) {
		this.maThietBi = maThietBi;
	}

	public String getTenThietBi() {
		return tenThietBi;
	}

	public void setTenThietBi(String tenThietBi) {
		this.tenThietBi = tenThietBi;
	}

	public String getMaLoaiThietBi() {
		return maLoaiThietBi;
	}

	public void setMaLoaiThietBi(String maLoaiThietBi) {
		this.maLoaiThietBi = maLoaiThietBi;
	}

	public String getTenLoaiThietBi() {
		return tenLoaiThietBi;
	}

	public void setTenLoaiThietBi(String tenLoaiThietBi) {
		this.tenLoaiThietBi = tenLoaiThietBi;
	}

	public String getKiHieu() {
		return kiHieu;
	}

	public void setKiHieu(String kiHieu) {
		this.kiHieu = kiHieu;
	}

	public String getMaTinhTrang() {
		return maTinhTrang;
	}

	public void setMaTinhTrang(String maTinhTrang) {
		this.maTinhTrang = maTinhTrang;
	}

	public String getTenTinhTrang() {
		return tenTinhTrang;
	}

	public void setTenTinhTrang(String tenTinhTrang) {
		this.tenTinhTrang = tenTinhTrang;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public String getMaBoPhan() {
		return maBoPhan;
	}

	public void setMaBoPhan(String maBoPhan) {
		this.maBoPhan = maBoPhan;
	}

	public String getTenBoPhan() {
		return tenBoPhan;
	}

	public void setTenBoPhan(String tenBoPhan) {
		this.tenBoPhan = tenBoPhan;
	}

	public String getMaNguoiTao() {
		return maNguoiTao;
	}

	public void setMaNguoiTao(String maNguoiTao) {
		this.maNguoiTao = maNguoiTao;
	}

	public String getTenNguoiTao() {
		return tenNguoiTao;
	}

	public void setTenNguoiTao(String tenNguoiTao) {
		this.tenNguoiTao = tenNguoiTao;
	}

	public String getMaPhongBan() {
		return maPhongBan;
	}

	public void setMaPhongBan(String maPhongBan) {
		this.maPhongBan = maPhongBan;
	}

	public String getTenPhongBan() {
		return tenPhongBan;
	}

	public void setTenPhongBan(String tenPhongBan) {
		this.tenPhongBan = tenPhongBan;
	}

	public String getMaNhaCungCap() {
		return maNhaCungCap;
	}

	public void setMaNhaCungCap(String maNhaCungCap) {
		this.maNhaCungCap = maNhaCungCap;
	}

	public String getNgaySanXuat() {
		return ngaySanXuat;
	}

	public void setNgaySanXuat(String ngaySanXuat) {
		this.ngaySanXuat = ngaySanXuat;
	}

	public String getNgayMua() {
		return ngayMua;
	}

	public void setNgayMua(String ngayMua) {
		this.ngayMua = ngayMua;
	}

	public String getHanBaoHanh() {
		return hanBaoHanh;
	}

	public void setHanBaoHanh(String hanBaoHanh) {
		this.hanBaoHanh = hanBaoHanh;
	}

	public String getNgayBatDauSuDung() {
		return ngayBatDauSuDung;
	}

	public void setNgayBatDauSuDung(String ngayBatDauSuDung) {
		this.ngayBatDauSuDung = ngayBatDauSuDung;
	}

	public String getTanSuatToiDa() {
		return tanSuatToiDa;
	}

	public void setTanSuatToiDa(String tanSuatToiDa) {
		this.tanSuatToiDa = tanSuatToiDa;
	}

	public String getTanSuatSuDung() {
		return tanSuatSuDung;
	}

	public void setTanSuatSuDung(String tanSuatSuDung) {
		this.tanSuatSuDung = tanSuatSuDung;
	}

	public String getPhuKien() {
		return phuKien;
	}

	public void setPhuKien(String phuKien) {
		this.phuKien = phuKien;
	}

	public String getGiaMua() {
		return giaMua;
	}

	public void setGiaMua(String giaMua) {
		this.giaMua = giaMua;
	}

	public String getNguyenTacSuDung() {
		return nguyenTacSuDung;
	}

	public void setNguyenTacSuDung(String nguyenTacSuDung) {
		this.nguyenTacSuDung = nguyenTacSuDung;
	}

	public String getDacTinhKyThuat() {
		return dacTinhKyThuat;
	}

	public void setDacTinhKyThuat(String dacTinhKyThuat) {
		this.dacTinhKyThuat = dacTinhKyThuat;
	}

	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}

	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}

	public String getSoLanSuDung() {
		return soLanSuDung;
	}

	public void setSoLanSuDung(String soLanSuDung) {
		this.soLanSuDung = soLanSuDung;
	}

	public String getSoLanBaoTri() {
		return soLanBaoTri;
	}

	public void setSoLanBaoTri(String soLanBaoTri) {
		this.soLanBaoTri = soLanBaoTri;
	}

	public String getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}

	public String getMaTanSuat() {
		return maTanSuat;
	}

	public void setMaTanSuat(String maTanSuat) {
		this.maTanSuat = maTanSuat;
	}

}
