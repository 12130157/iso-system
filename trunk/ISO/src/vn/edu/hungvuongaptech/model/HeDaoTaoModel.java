package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class HeDaoTaoModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maHeDaoTao;
	private String tenHeDaoTao;
	private String soNam;
	private String User1;
	private String User2;
	private String User3;
	private String User4;
	private String User5;
	private String maChuongtrinh;
	
	public String getMaChuongtrinh() {
		return maChuongtrinh;
	}
	public void setMaChuongtrinh(String maChuongtrinh) {
		this.maChuongtrinh = maChuongtrinh;
	}
	public String getMaHeDaoTao() {
		return maHeDaoTao;
	}
	public void setMaHeDaoTao(String maHeDaoTao) {
		this.maHeDaoTao = maHeDaoTao;
	}
	public String getTenHeDaoTao() {
		return tenHeDaoTao;
	}
	public void setTenHeDaoTao(String tenHeDaoTao) {
		this.tenHeDaoTao = tenHeDaoTao;
	}
	public String getSoNam() {
		return soNam;
	}
	public void setSoNam(String soNam) {
		this.soNam = soNam;
	}
	public String getUser1() {
		return User1;
	}
	public void setUser1(String user1) {
		User1 = user1;
	}
	public String getUser2() {
		return User2;
	}
	public void setUser2(String user2) {
		User2 = user2;
	}
	public String getUser3() {
		return User3;
	}
	public void setUser3(String user3) {
		User3 = user3;
	}
	public String getUser4() {
		return User4;
	}
	public void setUser4(String user4) {
		User4 = user4;
	}
	public String getUser5() {
		return User5;
	}
	public void setUser5(String user5) {
		User5 = user5;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
