package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class MonHocModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maMonHoc;
	private String tenMonHoc;
	private String lyThuyet;
	private String thucHanh;
	private String kiemTra;
	private String tinhChat;
	private String maHocPhan;
	private String tenHocPhan;
	private String maChuyenNganh; 
	private String tenChuyenNganh;
	private String maNguoiTao;
	private String nguoiTao;
	private String ngayTao;
	private String ngayCapNhatCuoi;
	private String maTruongBoMon;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String hocKi;
	
	public String getHocKi() {
		return hocKi;
	}
	public void setHocKi(String hocKi) {
		this.hocKi = hocKi;
	}
	ArrayList<BaiKiemTraModel> baiKiemTraList; 
	
	public ArrayList<BaiKiemTraModel> getBaiKiemTraList() {
		return baiKiemTraList;
	}
	public void setBaiKiemTraList(ArrayList<BaiKiemTraModel> baiKiemTraList) {
		this.baiKiemTraList = baiKiemTraList;
	}
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
	public String getLyThuyet() {
		return lyThuyet;
	}
	public void setLyThuyet(String lyThuyet) {
		this.lyThuyet = lyThuyet;
	}
	public String getThucHanh() {
		return thucHanh;
	}
	public void setThucHanh(String thucHanh) {
		this.thucHanh = thucHanh;
	}
	public String getKiemTra() {
		return kiemTra;
	}
	public void setKiemTra(String kiemTra) {
		this.kiemTra = kiemTra;
	}
	public String getTinhChat() {
		return tinhChat;
	}
	public void setTinhChat(String tinhChat) {
		this.tinhChat = tinhChat;
	}
	public String getMaHocPhan() {
		return maHocPhan;
	}
	public void setMaHocPhan(String maHocPhan) {
		this.maHocPhan = maHocPhan;
	}
	public String getTenHocPhan() {
		return tenHocPhan;
	}
	public void setTenHocPhan(String tenHocPhan) {
		this.tenHocPhan = tenHocPhan;
	}
	public String getMaChuyenNganh() {
		return maChuyenNganh;
	}
	public void setMaChuyenNganh(String maChuyenNganh) {
		this.maChuyenNganh = maChuyenNganh;
	}
	public String getTenChuyenNganh() {
		return tenChuyenNganh;
	}
	public void setTenChuyenNganh(String tenChuyenNganh) {
		this.tenChuyenNganh = tenChuyenNganh;
	}
	public String getMaNguoiTao() {
		return maNguoiTao;
	}
	public void setMaNguoiTao(String maNguoiTao) {
		this.maNguoiTao = maNguoiTao;
	}
	public String getNguoiTao() {
		return nguoiTao;
	}
	public void setNguoiTao(String nguoiTao) {
		this.nguoiTao = nguoiTao;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getMaTruongBoMon() {
		return maTruongBoMon;
	}
	public void setMaTruongBoMon(String maTruongBoMon) {
		this.maTruongBoMon = maTruongBoMon;
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
