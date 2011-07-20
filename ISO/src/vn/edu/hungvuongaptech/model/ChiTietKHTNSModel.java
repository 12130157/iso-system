package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class ChiTietKHTNSModel {
	private String id;
	private String ma_ke_hoach;
	private String ma_de_nghi;
	private String ghi_chu;
	private String ngay_cap_nhat_cuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String boPhan;
	private String vaiTro;
	private String soLuong;
	private ArrayList<ThoiGianTuyenDungModel> list_thoi_gian;
	private String soLuongDaTuyen;
	private String thangKetThuc;
	private String thangHienTai;
	

	public String getThangHienTai() {
		return thangHienTai;
	}
	public void setThangHienTai(String thangHienTai) {
		this.thangHienTai = thangHienTai;
	}
	public String getThangKetThuc() {
		return thangKetThuc;
	}
	public void setThangKetThuc(String thangKetThuc) {
		this.thangKetThuc = thangKetThuc;
	}
	public String getSoLuongDaTuyen() {
		return soLuongDaTuyen;
	}
	public void setSoLuongDaTuyen(String soLuongDaTuyen) {
		this.soLuongDaTuyen = soLuongDaTuyen;
	}
	public String getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}
	public String getBoPhan() {
		return boPhan;
	}
	public void setBoPhan(String boPhan) {
		this.boPhan = boPhan;
	}
	public String getVaiTro() {
		return vaiTro;
	}
	public void setVaiTro(String vaiTro) {
		this.vaiTro = vaiTro;
	}
	public ArrayList<ThoiGianTuyenDungModel> getList_thoi_gian() {
		return list_thoi_gian;
	}
	public void setList_thoi_gian(ArrayList<ThoiGianTuyenDungModel> listThoiGian) {
		list_thoi_gian = listThoiGian;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMa_ke_hoach() {
		return ma_ke_hoach;
	}
	public void setMa_ke_hoach(String maKeHoach) {
		ma_ke_hoach = maKeHoach;
	}
	public String getMa_de_nghi() {
		return ma_de_nghi;
	}
	public void setMa_de_nghi(String maDeNghi) {
		ma_de_nghi = maDeNghi;
	}
	public String getGhi_chu() {
		return ghi_chu;
	}
	public void setGhi_chu(String ghiChu) {
		ghi_chu = ghiChu;
	}
	public String getNgay_cap_nhat_cuoi() {
		return ngay_cap_nhat_cuoi;
	}
	public void setNgay_cap_nhat_cuoi(String ngayCapNhatCuoi) {
		ngay_cap_nhat_cuoi = ngayCapNhatCuoi;
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
