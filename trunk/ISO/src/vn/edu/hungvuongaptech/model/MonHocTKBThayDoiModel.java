package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class MonHocTKBThayDoiModel   implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;
	private String maMonHocTKB;
	private String maGiaoVien;
	private String maToTrinh;
	private String maNguoiTao;
	private String tinhTrang;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	
	private String maGiaoVienThayDoi;
	private String tenGiaoVienThayDoi;
	private String tenGiaoVien;
	private String maMonHoc;
	private String tenMonHoc;
	
	public String getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}
	private ArrayList<ChiTietTKBThayDoiModel> chiTietTKBThayDoi;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public ArrayList<ChiTietTKBThayDoiModel> getChiTietTKBThayDoi() {
		return chiTietTKBThayDoi;
	}
	public void setChiTietTKBThayDoi(
			ArrayList<ChiTietTKBThayDoiModel> chiTietTKBThayDoi) {
		this.chiTietTKBThayDoi = chiTietTKBThayDoi;
	}
	public String getMaMonHocTKB() {
		return maMonHocTKB;
	}
	public void setMaMonHocTKB(String maMonHocTKB) {
		this.maMonHocTKB = maMonHocTKB;
	}
	public String getMaGiaoVien() {
		return maGiaoVien;
	}
	public void setMaGiaoVien(String maGiaoVien) {
		this.maGiaoVien = maGiaoVien;
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
	public String getMaToTrinh() {
		return maToTrinh;
	}
	public void setMaToTrinh(String maToTrinh) {
		this.maToTrinh = maToTrinh;
	}
	public String getMaGiaoVienThayDoi() {
		return maGiaoVienThayDoi;
	}
	public void setMaGiaoVienThayDoi(String maGiaoVienThayDoi) {
		this.maGiaoVienThayDoi = maGiaoVienThayDoi;
	}
	public String getTenGiaoVienThayDoi() {
		return tenGiaoVienThayDoi;
	}
	public void setTenGiaoVienThayDoi(String tenGiaoVienThayDoi) {
		this.tenGiaoVienThayDoi = tenGiaoVienThayDoi;
	}
	public String getTenGiaoVien() {
		return tenGiaoVien;
	}
	public void setTenGiaoVien(String tenGiaoVien) {
		this.tenGiaoVien = tenGiaoVien;
	}
	public String getMaNguoiTao() {
		return maNguoiTao;
	}
	public void setMaNguoiTao(String maNguoiTao) {
		this.maNguoiTao = maNguoiTao;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	
}
