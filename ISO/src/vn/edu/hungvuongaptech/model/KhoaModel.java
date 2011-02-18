package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class KhoaModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String maKhoa;
	private String tenKhoa;
	private String maTruongKhoa;
	private String tenTruongKhoa;
	private String ngayTao;
	private String nguoiTao;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	ArrayList<LopHocModel> lopHocList;
	
	public ArrayList<LopHocModel> getLopHocList() {
		return lopHocList;
	}
	public void setLopHocList(ArrayList<LopHocModel> lopHocList) {
		this.lopHocList = lopHocList;
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
	public String getMaTruongKhoa() {
		return maTruongKhoa;
	}
	public void setMaTruongKhoa(String maTruongKhoa) {
		this.maTruongKhoa = maTruongKhoa;
	}
	public String getTenTruongKhoa() {
		return tenTruongKhoa;
	}
	public void setTenTruongKhoa(String tenTruongKhoa) {
		this.tenTruongKhoa = tenTruongKhoa;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getNguoiTao() {
		return nguoiTao;
	}
	public void setNguoiTao(String nguoiTao) {
		this.nguoiTao = nguoiTao;
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
	

	
	
}
