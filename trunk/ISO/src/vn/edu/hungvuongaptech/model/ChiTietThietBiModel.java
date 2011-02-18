package vn.edu.hungvuongaptech.model;

public class ChiTietThietBiModel extends ThietBiModel{
	private String maCTTB;
	private String maThietBi;
	private String maKhoa;
	private String tenKhoa; 
	private String tenLinhKien;
	private String maNhaCungCap;
	private String dungLuong;
	private String maTinhTrang;
	private String ghiChu;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	
	public ChiTietThietBiModel(){
		this.maCTTB="";
		this.maThietBi="";
		this.maKhoa="";
		this.tenKhoa="";
		this.tenLinhKien="";
		this.maNhaCungCap="";
		this.dungLuong="";
		this.maTinhTrang="";
		this.ghiChu="";
		this.user1="";
		this.user2="";
		this.user3="";
		this.user4="";
		this.user5="";
	}
	
	public String getMaCTTB(){
		return this.maCTTB;
	}
	public void setMaCTTB(String maCT){
		this.maCTTB=maCT;
	}
	public String getMaThietBi() {
		return maThietBi;
	}
	public void setMaThietBi(String maThietBi) {
		this.maThietBi = maThietBi;
	}
	public String getMaKhoa() {
		return maKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		this.maKhoa = maKhoa;
	}
	public String getTenKhoa() {
		return tenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	public String getTenLinhKien(){
		return this.tenLinhKien;
	}	
	public void setTenLinhKien(String tenLinhKien){
		this.tenLinhKien=tenLinhKien;
	}
	public String getMaNhaCungCap(){
		return this.maNhaCungCap;
	}
	public void setMaNhaCungCap(String maNhaCungCap){
		this.maNhaCungCap=maNhaCungCap;
	}
	public String getDungLuong(){
		return this.dungLuong;
	}
	public void setDungLuong(String dungLuong){
		this.dungLuong=dungLuong;
	}
	public String getMaTinhTrang(){
		return this.maTinhTrang;
	}
	public  void setMaTinhTrang(String maTinhTrang){
		this.maTinhTrang=maTinhTrang;
	}
	
	public String getGhiChu(){
		return this.ghiChu;
	}
	
	public void setGhiChu(String ghiChu){
		this.ghiChu=ghiChu;
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
