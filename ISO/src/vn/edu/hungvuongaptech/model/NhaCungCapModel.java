package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class NhaCungCapModel implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String stt;
	private String maNhaCungCap;
	private String ten;
	private String diaChi;
	private String dienThoai;
	private String email;
	private String ghiChu;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private TaiKhoanModel taiKhoan;
	
	public NhaCungCapModel()
	{
		taiKhoan=new TaiKhoanModel();
		this.stt="";
		this.maNhaCungCap="";
		this.ten="";
		this.diaChi="";
		this.dienThoai="";
		this.email="";
		this.ghiChu="";
		this.ngayCapNhatCuoi="";
		this.user1="";
		this.user2="";
		this.user3="";
		this.user4="";
		this.user5="";	
	}
	
	public void setSTT(String stt){
		this.stt=stt;
	}
	
	public String getSTT(){
		return this.stt;
	}
	
	public String getMaNhaCungCap(){
		return this.maNhaCungCap;
	}
	public void setMaNhaCungCap(String maNhaCungCap){
		this.maNhaCungCap=maNhaCungCap;
	}
	
	public String getTen(){
		return this.ten;
	}
	public void setTen(String ten){
		this.ten=ten;
	}
	
	public TaiKhoanModel getTaiKhoan(){
		return taiKhoan;
	}
	
	public void setTaiKhoan(TaiKhoanModel taiKhoanModel){
		this.taiKhoan=taiKhoanModel;
	}
	
	public String getDiaChi(){
		return this.diaChi;
	}
	public void setDiaChi(String diaChi){
		
		this.diaChi=diaChi;
	}
	
	public String getEmail(){
		return this.email;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	
	public String getGhiChu(){
		return this.ghiChu;
	}
	
	public void setGhiChu(String ghiChu){
		this.ghiChu=ghiChu;
	}
	
	public String getDienThoai(){
		return this.dienThoai;
	}
	
	public void setDienThoai(String dienThoai){
		this.dienThoai=dienThoai;
	}
	
	public String getNgayCapNhatCuoi(){
		return this.ngayCapNhatCuoi;
	}
	
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi){
		this.ngayCapNhatCuoi=ngayCapNhatCuoi;
	}
	
	public String getUser1(){
		return	this.user1;
	}
	public String getUser2(){
		return	this.user2;
	}
	public String getUser3(){
		return	this.user3;
	}
	public String getUser4(){
		return	this.user4;
	}
	public String getUser5(){
		return	this.user5;
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
}
