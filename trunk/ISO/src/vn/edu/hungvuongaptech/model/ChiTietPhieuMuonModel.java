package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class ChiTietPhieuMuonModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private String maCTPM;
	private String maPhieuMuon;
	private String maThietBi;
	private String tenThietBi;
	private String tinhTrang;
	private String thoiGianMuon;
	private String thoiGianTra;
	private String phanLoai;
	private String ghiChu;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	
	public String getMaCTPM(){
		return this.maCTPM;
	}
	public void setMaCTPM(String maCTPM){
		this.maCTPM=maCTPM;
	}
	public String getMaPhieuMuon(){
		return this.maPhieuMuon;
	}
	
	public void setMaPhieuMuon(String maPhieuMuon){
		this.maPhieuMuon=maPhieuMuon;
	}
	public String getMaThietBi(){
		return this.maThietBi;
	}
	public void setMaThietBi(String maThietBi){
		this.maThietBi=maThietBi;
	}
	public String getTenThietBi(){
		return this.tenThietBi;
	}
	public void setTenThietBi(String tenThietBi){
		this.tenThietBi=tenThietBi;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getGhiChu(){
		return this.ghiChu;
	}	
	public void setGhiChu(String ghiChu){
		this.ghiChu=ghiChu;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public void setUser1(String user1){
		this.user1=user1;
	}
	public void setUser2(String user2){
		this.user2=user2;
	}
	public void setUser3(String user3){
		this.user3=user3;
	}
	public void setUser4(String user4){
		this.user4=user4;
	}
	public void setUser5(String user5){
		this.user5=user5;
	}
	
	public String getUser1(){
		return this.user1;
	}
	public String getUser2(){
		return this.user2;
	}
	public String getUser3(){
		return this.user3;
	}
	public String getUser4(){
		return this.user4;
	}
	public String getUser5(){
		return this.user5;
	}
	public String getThoiGianMuon() {
		return thoiGianMuon;
	}
	public void setThoiGianMuon(String thoiGianMuon) {
		this.thoiGianMuon = thoiGianMuon;
	}
	
	public String getThoiGianTra() {
		return thoiGianTra;
	}
	public void setThoiGianTra(String thoiGianTra) {
		this.thoiGianTra = thoiGianTra;
	}
	public String getPhanLoai() {
		return phanLoai;
	}
	public void setPhanLoai(String phanLoai) {
		this.phanLoai = phanLoai;
	}
	
}
