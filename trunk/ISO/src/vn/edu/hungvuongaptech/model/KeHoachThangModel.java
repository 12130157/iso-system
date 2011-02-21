package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class KeHoachThangModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maKeHoachThang;
	private String thang;
	private String noiNhan;
	private String maNguoiTao;
	private String tenNguoiTao;
	private String ngayCapNhatCuoi;
	private String gioCapNhatCuoi;
	private String ngayTao;
	private String gioTao;
	private String maNguoiDuyet;
	private String ngayDuyet;
	private String gioDuyet;
	private String tenNguoiDuyet;
	private String nam;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String tenKeHoach;
	private String lyDoReject;
	private String ngayGui;
	private String gioGui;
	private String tinhTrang;
	private ArrayList<CongTacThangModel> congTacThangList;
	public String getMaKeHoachThang() {
		return maKeHoachThang;
	}
	public void setMaKeHoachThang(String maKeHoachThang) {
		this.maKeHoachThang = maKeHoachThang;
	}
	public String getThang() {
		return thang;
	}
	public void setThang(String thang) {
		this.thang = thang;
	}
	public String getNoiNhan() {
		return noiNhan;
	}
	public void setNoiNhan(String noiNhan) {
		this.noiNhan = noiNhan;
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
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getMaNguoiDuyet() {
		return maNguoiDuyet;
	}
	public void setMaNguoiDuyet(String maNguoiDuyet) {
		this.maNguoiDuyet = maNguoiDuyet;
	}
	public String getNgayDuyet() {
		return ngayDuyet;
	}
	public void setNgayDuyet(String ngayDuyet) {
		this.ngayDuyet = ngayDuyet;
	}
	public String getTenNguoiDuyet() {
		return tenNguoiDuyet;
	}
	public void setTenNguoiDuyet(String tenNguoiDuyet) {
		this.tenNguoiDuyet = tenNguoiDuyet;
	}
	public String getNam() {
		return nam;
	}
	public void setNam(String nam) {
		this.nam = nam;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ArrayList<CongTacThangModel> getCongTacThangList() {
		return congTacThangList;
	}
	public void setCongTacThangList(ArrayList<CongTacThangModel> congTacThangList) {
		this.congTacThangList = congTacThangList;
	}
	public String getGioCapNhatCuoi() {
		return gioCapNhatCuoi;
	}
	public void setGioCapNhatCuoi(String gioCapNhatCuoi) {
		this.gioCapNhatCuoi = gioCapNhatCuoi;
	}
	public String getGioTao() {
		return gioTao;
	}
	public void setGioTao(String gioTao) {
		this.gioTao = gioTao;
	}
	public String getGioDuyet() {
		return gioDuyet;
	}
	public void setGioDuyet(String gioDuyet) {
		this.gioDuyet = gioDuyet;
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
	public String getTenKeHoach() {
		return tenKeHoach;
	}
	public void setTenKeHoach(String tenKeHoach) {
		this.tenKeHoach = tenKeHoach;
	}
	public String getLyDoReject() {
		return lyDoReject;
	}
	public void setLyDoReject(String lyDoReject) {
		this.lyDoReject = lyDoReject;
	}
	public String getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(String ngayGui) {
		this.ngayGui = ngayGui;
	}
	public String getGioGui() {
		return gioGui;
	}
	public void setGioGui(String gioGui) {
		this.gioGui = gioGui;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public boolean validateModel() {
		boolean check = true;
		return check;
	}
}
