package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class NoiDungDCMHModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maNoiDungDeCuong;
	private String soThuTu;
	private String soBuoi;
	private String maDeCuong;
	private String tenChuong;
	private String coHieu;
	private String soTiet;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String maMonHoc;
	private String mucTieu;
	
	public String getMucTieu() {
		return mucTieu;
	}
	public void setMucTieu(String mucTieu) {
		this.mucTieu = mucTieu;
	}
	public String getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	public String getMaNoiDungDeCuong() {
		return maNoiDungDeCuong;
	}
	public void setMaNoiDungDeCuong(String maNoiDungDeCuong) {
		this.maNoiDungDeCuong = maNoiDungDeCuong;
	}
	public String getMaDeCuong() {
		return maDeCuong;
	}
	public void setMaDeCuong(String maDeCuong) {
		this.maDeCuong = maDeCuong;
	}
	public String getTenChuong() {
		return tenChuong;
	}
	public void setTenChuong(String tenChuong) {
		this.tenChuong = tenChuong;
	}
	public String getCoHieu() {
		return coHieu;
	}
	public void setCoHieu(String coHieu) {
		this.coHieu = coHieu;
	}
	public String getSoBuoi() {
		return soBuoi;
	}
	public void setSoBuoi(String soBuoi) {
		this.soBuoi = soBuoi;
	}
	public String getSoTiet() {
		return soTiet;
	}
	public void setSoTiet(String soTiet) {
		this.soTiet = soTiet;
	}
	public String getSoThuTu() {
		return soThuTu;
	}
	public void setSoThuTu(String soThuTu) {
		this.soThuTu = soThuTu;
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
	public boolean validateModel() {
		// TODO Auto-generated method stub\
		boolean result = true;
		if(soThuTu.equals("1")) {
			if(tenChuong == null || tenChuong.equals("")) {
				result = false;
			}
		}
		return result;
	}
	
	
}
