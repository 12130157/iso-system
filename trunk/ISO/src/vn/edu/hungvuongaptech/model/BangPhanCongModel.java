package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class BangPhanCongModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String ten;
	private String maKhoa;
	private String tenKhoa;
	private String hocKi;
	private String maNamHoc;
	private String tinhTrang;
	private String gioTao;
	private String ngayTao;
	private String maNguoiTao;
	private String tenNguoiTao;
	private String gioDuyet;
	private String ngayDuyet;
	private String maNguoiDuyet;
	private String tenNguoiDuyet;
	private String gioGui;
	private String ngayGui;
	private String gioCapNhatCuoi;
	private String ngayCapNhatCuoi;
	private String lyDoReject;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private ArrayList<ChiTietBangPhanCongModel> chiTietBangPhanCongList;
	private String soDong; 
	
	public String getSoDong() {
		return soDong;
	}
	public void setSoDong(String soDong) {
		this.soDong = soDong;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getHocKi() {
		return hocKi;
	}
	public void setHocKi(String hocKi) {
		this.hocKi = hocKi;
	}
	public String getMaNamHoc() {
		return maNamHoc;
	}
	public void setMaNamHoc(String maNamHoc) {
		this.maNamHoc = maNamHoc;
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
	public String getMaKhoa() {
		return maKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		this.maKhoa = maKhoa;
	}
	public String getTenKhoa() {
		return tenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getGioTao() {
		return gioTao;
	}
	public void setGioTao(String gioTao) {
		this.gioTao = gioTao;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
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
	public String getGioDuyet() {
		return gioDuyet;
	}
	public void setGioDuyet(String gioDuyet) {
		this.gioDuyet = gioDuyet;
	}
	public String getNgayDuyet() {
		return ngayDuyet;
	}
	public void setNgayDuyet(String ngayDuyet) {
		this.ngayDuyet = ngayDuyet;
	}
	public String getMaNguoiDuyet() {
		return maNguoiDuyet;
	}
	public void setMaNguoiDuyet(String maNguoiDuyet) {
		this.maNguoiDuyet = maNguoiDuyet;
	}
	public String getTenNguoiDuyet() {
		return tenNguoiDuyet;
	}
	public void setTenNguoiDuyet(String tenNguoiDuyet) {
		this.tenNguoiDuyet = tenNguoiDuyet;
	}
	public String getGioGui() {
		return gioGui;
	}
	public void setGioGui(String gioGui) {
		this.gioGui = gioGui;
	}
	public String getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(String ngayGui) {
		this.ngayGui = ngayGui;
	}
	public String getGioCapNhatCuoi() {
		return gioCapNhatCuoi;
	}
	public void setGioCapNhatCuoi(String gioCapNhatCuoi) {
		this.gioCapNhatCuoi = gioCapNhatCuoi;
	}
	
	public ArrayList<ChiTietBangPhanCongModel> getChiTietBangPhanCongList() {
		return chiTietBangPhanCongList;
	}
	public void setChiTietBangPhanCongList(
			ArrayList<ChiTietBangPhanCongModel> chiTietBangPhanCongList) {
		this.chiTietBangPhanCongList = chiTietBangPhanCongList;
	}
	public String getLyDoReject() {
		return lyDoReject;
	}
	public void setLyDoReject(String lyDoReject) {
		this.lyDoReject = lyDoReject;
	}
	
}
