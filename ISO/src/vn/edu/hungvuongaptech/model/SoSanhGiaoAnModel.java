package vn.edu.hungvuongaptech.model;

public class SoSanhGiaoAnModel {
	private String maCTKHGD;
	private String soGiaoAn;
	private String hocKi;
	private String namBatDau;
	private String giaoVienTao;
	private String tenMonHoc;
	private String lopHoc;
	private String maGiaoAn;
	private String maKHGD;
	public SoSanhGiaoAnModel(){
		this.maCTKHGD="";
		this.maKHGD="";
		this.lopHoc="";
		this.soGiaoAn="";
		this.hocKi="";
		this.namBatDau="";
		this.giaoVienTao="";
		this.tenMonHoc="";
		this.maGiaoAn="";
	}
	
	public String getMaKHGD(){
		return this.maKHGD;
	}
	
	public String getMaGiaoAn(){
		return this.maGiaoAn;
	}
	
	
	public String getMaCTKHGD(){
		return this.maCTKHGD;
	}
	
	public String getSoGiaoAn(){
		return this.soGiaoAn;
	}
	
	public String getHocKi(){
		return this.hocKi;
	}
	
	public String getNamBatDau(){
		return this.namBatDau;
	}
	
	public String getLopHoc(){
		return this.lopHoc;
	}
	
	public String getGiaoVienTao(){
		return this.giaoVienTao;
	}
	
	public String getTenMonHoc(){
		return this.tenMonHoc;
	}
	
		
	public void setMaCTKHGD(String maCTKHGD){
		this.maCTKHGD=maCTKHGD;
	}
	
	public void setSoGiaoAn(String soGiaoAn){
		this.soGiaoAn=soGiaoAn;
	}
	
	public void setHocKi(String hocKi){
		this.hocKi=hocKi;
	}
	
	public void setLopHoc(String lopHoc){
		this.lopHoc=lopHoc;
	}
	
	public void setNamBatDau(String namBatDau){
		this.namBatDau=namBatDau;
	}
	
	public void setGiaoVienTao(String giaoVienTao){
		this.giaoVienTao=giaoVienTao;
	}
	
	public void setTenMonHoc(String tenMonHoc){
		this.tenMonHoc=tenMonHoc;
	}

	public void setMaGiaoAn(String maGiaoAn){
		this.maGiaoAn=maGiaoAn;
	}
	
	public void setMaKHGD(String maKHGD){
		this.maKHGD=maKHGD;
	}
}
