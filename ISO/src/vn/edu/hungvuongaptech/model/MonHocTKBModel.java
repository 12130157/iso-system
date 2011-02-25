package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class MonHocTKBModel  implements Serializable{
	private static final long serialVersionUID = 1L;
	private String maMonHocTKB;
	private String maTKB;
	private String maMonHoc;
	private String maGiaoVien;
	private String tenMonHoc;
	private String tenGiaoVien;
	private String soCaThucHanh;
	private String soNoiDung;
	private String ngayCapNhatCuoi;
	private String tuanBatDauLT;
	private String tuanKetThucLT;
	private String tuanBatDauTH;
	private String tuanKetThucTH;
	private String ngayBatDauLT;
	private String ngayKetThucLT;
	private String ngayBatDauTH;
	private String ngayKetThucTH;
	private String ghiChu;
	private String user1; // ma Phong LT
	private String user2; // ma Phong TH
	private String user3; // so tiet hoc 1 buoi
	private String soTietHoc1Buoi; // cột user3
	private String user4; // so ca ly thuyet
	private String user5;
	private String chuoiThuTrongTuan;
	private String kieuBienSoan;
	private String lyThuyetCTMH;
	private String thucHanhCTMH;
	private String chuoiPhongLT;
	private String chuoiPhongTH;
	private String hocKi;
	
	
	public String getSoTietHoc1Buoi() {
		return soTietHoc1Buoi;
	}
	public void setSoTietHoc1Buoi(String soTietHoc1Buoi) {
		this.soTietHoc1Buoi = soTietHoc1Buoi;
	}
	public String getHocKi() {
		return hocKi;
	}
	public void setHocKi(String hocKi) {
		this.hocKi = hocKi;
	}
	ArrayList<ChiTietTKBModel> chiTietTKBModelList;
	ArrayList<SuDungModel> suDungModelList;
	
	
	public String getChuoiPhongLT() {
		return chuoiPhongLT;
	}
	public void setChuoiPhongLT(String chuoiPhongLT) {
		this.chuoiPhongLT = chuoiPhongLT;
	}
	public String getChuoiPhongTH() {
		return chuoiPhongTH;
	}
	public void setChuoiPhongTH(String chuoiPhongTH) {
		this.chuoiPhongTH = chuoiPhongTH;
	}
	public ArrayList<SuDungModel> getSuDungModelList() {
		return suDungModelList;
	}
	public void setSuDungModelList(ArrayList<SuDungModel> suDungModelList) {
		this.suDungModelList = suDungModelList;
	}
	public String getKieuBienSoan() {
		return kieuBienSoan;
	}
	public void setKieuBienSoan(String kieuBienSoan) {
		this.kieuBienSoan = kieuBienSoan;
	}
	public String getLyThuyetCTMH() {
		return lyThuyetCTMH;
	}
	public void setLyThuyetCTMH(String lyThuyetCTMH) {
		this.lyThuyetCTMH = lyThuyetCTMH;
	}
	public String getThucHanhCTMH() {
		return thucHanhCTMH;
	}
	public void setThucHanhCTMH(String thucHanhCTMH) {
		this.thucHanhCTMH = thucHanhCTMH;
	}
	public String getChuoiThuTrongTuan() {
		return chuoiThuTrongTuan;
	}
	public void setChuoiThuTrongTuan(String chuoiThuTrongTuan) {
		this.chuoiThuTrongTuan = chuoiThuTrongTuan;
	}
	public String getNgayBatDauLT() {
		return ngayBatDauLT;
	}
	public void setNgayBatDauLT(String ngayBatDauLT) {
		this.ngayBatDauLT = ngayBatDauLT;
	}
	public String getNgayKetThucLT() {
		return ngayKetThucLT;
	}
	public void setNgayKetThucLT(String ngayKetThucLT) {
		this.ngayKetThucLT = ngayKetThucLT;
	}
	public String getNgayBatDauTH() {
		return ngayBatDauTH;
	}
	public void setNgayBatDauTH(String ngayBatDauTH) {
		this.ngayBatDauTH = ngayBatDauTH;
	}
	public String getNgayKetThucTH() {
		return ngayKetThucTH;
	}
	public void setNgayKetThucTH(String ngayKetThucTH) {
		this.ngayKetThucTH = ngayKetThucTH;
	}
	public String getTuanBatDauLT() {
		return tuanBatDauLT;
	}
	public void setTuanBatDauLT(String tuanBatDauLT) {
		this.tuanBatDauLT = tuanBatDauLT;
	}
	public String getTuanKetThucLT() {
		return tuanKetThucLT;
	}
	public void setTuanKetThucLT(String tuanKetThucLT) {
		this.tuanKetThucLT = tuanKetThucLT;
	}
	public String getTuanBatDauTH() {
		return tuanBatDauTH;
	}
	public void setTuanBatDauTH(String tuanBatDauTH) {
		this.tuanBatDauTH = tuanBatDauTH;
	}
	public String getTuanKetThucTH() {
		return tuanKetThucTH;
	}
	public void setTuanKetThucTH(String tuanKetThucTH) {
		this.tuanKetThucTH = tuanKetThucTH;
	}
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	public ArrayList<ChiTietTKBModel> getChiTietTKBModelList() {
		return chiTietTKBModelList;
	}
	public void setChiTietTKBModelList(
			ArrayList<ChiTietTKBModel> chiTietTKBModelList) {
		this.chiTietTKBModelList = chiTietTKBModelList;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getMaMonHocTKB() {
		return maMonHocTKB;
	}
	public void setMaMonHocTKB(String maMonHocTKB) {
		this.maMonHocTKB = maMonHocTKB;
	}
	public String getMaTKB() {
		return maTKB;
	}
	public void setMaTKB(String maTKB) {
		this.maTKB = maTKB;
	}
	public String getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	public String getMaGiaoVien() {
		return maGiaoVien;
	}
	public void setMaGiaoVien(String maGiaoVien) {
		this.maGiaoVien = maGiaoVien;
	}
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}
	public String getTenGiaoVien() {
		return tenGiaoVien;
	}
	public void setTenGiaoVien(String tenGiaoVien) {
		this.tenGiaoVien = tenGiaoVien;
	}
	public String getSoCaThucHanh() {
		return soCaThucHanh;
	}
	public void setSoCaThucHanh(String soCaThucHanh) {
		this.soCaThucHanh = soCaThucHanh;
	}
	public String getSoNoiDung() {
		return soNoiDung;
	}
	public void setSoNoiDung(String soNoiDung) {
		this.soNoiDung = soNoiDung;
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
