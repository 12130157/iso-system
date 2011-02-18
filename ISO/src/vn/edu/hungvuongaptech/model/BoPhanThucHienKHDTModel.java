package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class BoPhanThucHienKHDTModel {
	private String maBoPhanThucHienKHDT;
	private String maNoiDungChiTietKHDT;
	private String maKhoa;
	private String tenBoPhan; //tenBoPhan = tenKhoa
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private ArrayList<NguoiThucHienModel> nguoiThucHienModelList;
	private String ngayCapNhatCuoi;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTenBoPhan() {
		return tenBoPhan;
	}
	public void setTenBoPhan(String tenBoPhan) {
		this.tenBoPhan = tenBoPhan;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public ArrayList<NguoiThucHienModel> getNguoiThucHienModelList() {
		return nguoiThucHienModelList;
	}
	public void setNguoiThucHienModelList(
			ArrayList<NguoiThucHienModel> nguoiThucHienModelList) {
		this.nguoiThucHienModelList = nguoiThucHienModelList;
	}
	public String getMaBoPhanThucHienKHDT() {
		return maBoPhanThucHienKHDT;
	}
	public void setMaBoPhanThucHienKHDT(String maBoPhanThucHienKHDT) {
		this.maBoPhanThucHienKHDT = maBoPhanThucHienKHDT;
	}
	public String getMaNoiDungChiTietKHDT() {
		return maNoiDungChiTietKHDT;
	}
	public void setMaNoiDungChiTietKHDT(String maNoiDungChiTietKHDT) {
		this.maNoiDungChiTietKHDT = maNoiDungChiTietKHDT;
	}
	public String getMaKhoa() {
		return maKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		this.maKhoa = maKhoa;
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
