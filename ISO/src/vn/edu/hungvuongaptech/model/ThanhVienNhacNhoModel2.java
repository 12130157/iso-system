package vn.edu.hungvuongaptech.model;

public class ThanhVienNhacNhoModel2 {
	String tenThanhVien;
	String tenChuongTrinh;
	String ngayDay;
	String maThanhVien;
	String email;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public ThanhVienNhacNhoModel2(){
		this.tenChuongTrinh="";
		this.tenThanhVien="";
		this.maThanhVien="";
		this.ngayDay="";
	}
	
	public void setTenThanhVien(String tenThanhVien){
		this.tenThanhVien=tenThanhVien;
	}
	
	public String getTenThanhVien(){
		return this.tenThanhVien;
	}
	
	public void setTenChuongTrinh(String tenChuongTrinh){
		this.tenChuongTrinh=tenChuongTrinh;
	}
	
	public String getTenChuongTrinh(){
		return this.tenChuongTrinh;
	}
	
	public String getNgayDay(){
		return this.ngayDay;
	}
	
	public void setNgayDay(String ngayDay){
		this.ngayDay=ngayDay;
	}
	
	public void setMaThanhVien(String maThanhVien){
		this.maThanhVien=maThanhVien;
	}
	
	public String getMaThanhVien(){
		return this.maThanhVien;
	}
}
