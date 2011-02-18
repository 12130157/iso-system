package vn.edu.hungvuongaptech.model;

public class TinhTrangThietBiModel {
	
	private String maTinhTrang;
	private String tenTinhTrang;
	private String ghiChu;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;	
	
	public TinhTrangThietBiModel(){
	
		 maTinhTrang="";
		 tenTinhTrang="";
		 ghiChu="";
		 ngayCapNhatCuoi="";
		 user1="";
		 user2="";
		 user3="";
		 user4="";
		 user5="";
	}
	
	public void setMaTinhTrang(String maTinhTrang){this.maTinhTrang=maTinhTrang; }
	public void setTenTinhTrang(String tenTinhTrang){this.tenTinhTrang=tenTinhTrang; }
	public void setGhiChu(String ghiChu){this.ghiChu=ghiChu; }
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi){this.ngayCapNhatCuoi=ngayCapNhatCuoi; }
	public void setUser1(String user1){this.user1=user1; }
	public void setUser2(String user2){this.user2=user2; }
	public void setUser3(String user3){this.user3=user3; }
	public void setUser4(String user4){this.user4=user4; }
	public void setUser5(String user5){this.user5=user5; }
	
	public String getMaTinhTrang(){return this.maTinhTrang; }
	public String getTenTinhTrang(){return this.tenTinhTrang; }
	public String getGhiChu(){return this.ghiChu; }
	public String getNgayCapNhatCuoi(){return this.ngayCapNhatCuoi; }
	public String getUser1(){return this.user1; }
	public String getUser2(){return this.user2; }
	public String getUser3(){return this.user3; }
	public String getUser4(){return this.user4; }
	public String getUser5(){return this.user5; }
}
