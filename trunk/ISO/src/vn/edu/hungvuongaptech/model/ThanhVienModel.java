/**
 * 
 */
package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * @author ThienVD
 *
 */
public class ThanhVienModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maThanhVien;
	private String hoThanhVien;
	private String tenLot;
	private String tenThanhVien;
	private String tenDangNhap;
	private String matKhau;	
	private String maVaiTro;
	private String ngayTao;
	private String ngayTruyCapCuoi;
	private String ngayCapNhatCuoi;
	private String tenVaiTro;
	private String tinhTrang;	
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String email;
	private String maBoPhan;
	private String tenBoPhan;
	ArrayList<MonHocModel> monHocList;
	ArrayList<DiemDanhModel> diemDanhList;
	
	public ArrayList<DiemDanhModel> getDiemDanhList() {
		return diemDanhList;
	}
	public void setDiemDanhList(ArrayList<DiemDanhModel> diemDanhList) {
		this.diemDanhList = diemDanhList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ArrayList<MonHocModel> getMonHocList() {
		return monHocList;
	}
	public void setMonHocList(ArrayList<MonHocModel> monHocList) {
		this.monHocList = monHocList;
	}
	public String getTenBoPhan() {
		return tenBoPhan;
	}
	public void setTenBoPhan(String tenBoPhan) {
		this.tenBoPhan = tenBoPhan;
	}
	public String getMaBoPhan() {
		return maBoPhan;
	}
	public void setMaBoPhan(String maBoPhan) {
		this.maBoPhan = maBoPhan;
	}
	
	public String getMaThanhVien() {
		return maThanhVien;
	}
	public void setMaThanhVien(String maThanhVien) {
		this.maThanhVien = maThanhVien;
	}
	public String getHoThanhVien() {
		return hoThanhVien;
	}
	public void setHoThanhVien(String hoThanhVien) {
		this.hoThanhVien = hoThanhVien;
	}
	public String getTenLot() {
		return tenLot;
	}
	public void setTenLot(String tenLot) {
		this.tenLot = tenLot;
	}
	public String getTenThanhVien() {
		return tenThanhVien;
	}
	public void setTenThanhVien(String tenThanhVien) {
		this.tenThanhVien = tenThanhVien;
	}
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getMaVaiTro() {
		return maVaiTro;
	}
	public void setMaVaiTro(String maVaiTro) {
		this.maVaiTro = maVaiTro;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getNgayTruyCapCuoi() {
		return ngayTruyCapCuoi;
	}
	public void setNgayTruyCapCuoi(String ngayTruyCapCuoi) {
		this.ngayTruyCapCuoi = ngayTruyCapCuoi;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getTenVaiTro() {
		return tenVaiTro;
	}
	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
