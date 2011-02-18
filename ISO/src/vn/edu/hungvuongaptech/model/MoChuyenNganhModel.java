package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class MoChuyenNganhModel implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String maChuyenNganh;
	private String tenChuyenNganh;
	private String maQuyetDinh;
	private String ngayCapNhatCuoi;
	private String ghiChu;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMaChuyenNganh() {
		return maChuyenNganh;
	}
	public void setMaChuyenNganh(String maChuyenNganh) {
		this.maChuyenNganh = maChuyenNganh;
	}
	public String getMaQuyetDinh() {
		return maQuyetDinh;
	}
	public void setMaQuyetDinh(String maQuyetDinh) {
		this.maQuyetDinh = maQuyetDinh;
	}
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
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
	public void setTenChuyenNganh(String tenChuyenNganh) {
		this.tenChuyenNganh = tenChuyenNganh;
	}
	public String getTenChuyenNganh() {
		return tenChuyenNganh;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	
	public Boolean validateModel() {
		Boolean result = true;
		if (ghiChu == null || ghiChu.equals("")) {
			result = false;
		}
		return result;
	}
}
