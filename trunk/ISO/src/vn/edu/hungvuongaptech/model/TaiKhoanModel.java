package vn.edu.hungvuongaptech.model;

public class TaiKhoanModel {
	private String maTaiKhoan;
	private String soTaiKhoan;
	private String nganHang;
	private String ngayLapThe;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	
	public TaiKhoanModel(){
		this.maTaiKhoan="";
		this.soTaiKhoan="";
		this.nganHang="";
		this.ngayLapThe="";
		this.user1="";
		this.user2="";
		this.user3="";
		this.user4="";
		this.user5="";
	}
	
	public void setMaTaiKhoan(String maTaiKhoan){
		this.maTaiKhoan=maTaiKhoan;
	}
	public String getMaTaiKhoan(){
		return this.maTaiKhoan;
	}
	
	public void setSoTaiKhoan(String soTaiKhoan){
		this.soTaiKhoan=soTaiKhoan;
	}
	
	public String getSoTaiKhoan(){
		return this.soTaiKhoan;
	}
	public void setNganhang(String nganHang){
		this.nganHang=nganHang;
	}
	public String getNganHang(){
		return this.nganHang;
	}
	public void setNgayLapThe(String ngayLapThe){
		this.ngayLapThe=ngayLapThe;
	}
	public String getNgayLapThe(){
		return this.ngayLapThe;
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
}
