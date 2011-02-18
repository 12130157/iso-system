package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class PhieuMuonThietBiModel {
	
	private String maThietBi;
	private String tenThietBi;
	private String maPhieuMuon;
	private String nguoiMuon;
	private String thoiGianMuon;
	private String thoiGianTra;
	private String maTinhTrang;
	private String tenTinhTrang;
	private String ghiChu;
	private String ngayCapNhatCuoi;
	private String hoThanhVien;
	private String tenLot;
	private String tenThanhVien;
	private String maKhoa;
	private String tenKhoa;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private ArrayList<ChiTietPhieuMuonModel> chiTietPhieuMuonList;
	
	public PhieuMuonThietBiModel(){
	
			maThietBi="";
			tenThietBi="";
			maPhieuMuon="";
			nguoiMuon="";
			thoiGianMuon="";
			thoiGianTra="";
			maTinhTrang="";
			tenTinhTrang="";		 
			ghiChu="";
			ngayCapNhatCuoi="";
			hoThanhVien="";
			tenLot="";
			tenThanhVien="";
			maKhoa="";
			tenKhoa="";
			user1="";
			user2="";
			user3="";
			user4="";
			user5="";
		 chiTietPhieuMuonList=new ArrayList<ChiTietPhieuMuonModel>();
	}
	
	public void setMaThietBi(String maThietBi){this.maThietBi=maThietBi; }
	public void setTenThietBi(String tenThietBi){this.tenThietBi=tenThietBi; }
	public void setMaPhieuMuon(String maPhieuMuon){this.maPhieuMuon=maPhieuMuon; }
	public void setNguoiMuon(String nguoiMuon){this.nguoiMuon=nguoiMuon; }
	public void setThoiGianMuon(String thoiGianMuon){this.thoiGianMuon=thoiGianMuon; }
	public void setThoiGianTra(String thoiGianTra){this.thoiGianTra=thoiGianTra; }	
	public void setMaTinhTrang(String maTinhTrang){this.maTinhTrang=maTinhTrang; }
	public void setTenTinhTrang(String tenTinhTrang){this.tenTinhTrang = tenTinhTrang;}	
	public void setGhiChu(String ghiChu){this.ghiChu=ghiChu; }
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi){this.ngayCapNhatCuoi=ngayCapNhatCuoi; }
	public void setHoThanhVien(String hoThanhVien) {this.hoThanhVien = hoThanhVien;}
	public void setTenLot(String tenLot) {this.tenLot = tenLot;}	
	public void setTenThanhVien(String tenThanhVien) {this.tenThanhVien = tenThanhVien;}
	public void setMaKhoa(String maKhoa) {this.maKhoa = maKhoa;}
	public void setTenKhoa(String tenKhoa) {this.tenKhoa = tenKhoa;}
	public void setUser1(String user1){this.user1=user1; }
	public void setUser2(String user2){this.user2=user2; }
	public void setUser3(String user3){this.user3=user3; }
	public void setUser4(String user4){this.user4=user4; }
	public void setUser5(String user5){this.user5=user5; }
	public void setListChiTietPhieuMuon(ArrayList<ChiTietPhieuMuonModel> chiTiet){this.chiTietPhieuMuonList=chiTiet;}	
	
	
	public String getMaThietBi(){return this.maThietBi; }
	public String getTenThietBi(){return this.tenThietBi; }
	public String getMaPhieuMuon(){return this.maPhieuMuon; }
	public String getNguoiMuon(){return this.nguoiMuon; }
	public String getThoiGianMuon(){return this.thoiGianMuon; }
	public String getThoiGianTra(){return this.thoiGianTra; }
	public String getMaTinhTrang(){return this.maTinhTrang; }
	public String getTenTinhTrang() {return tenTinhTrang;}	
	public String getGhiChu(){return this.ghiChu; }
	public String getNgayCapNhatCuoi(){return this.ngayCapNhatCuoi; }
	public String getHoThanhVien() {return hoThanhVien;}
	public String getTenLot() {return tenLot;}
	public String getTenThanhVien() {return tenThanhVien;}
	public String getMaKhoa() {return maKhoa;}
	public String getTenKhoa() {return tenKhoa;	}
	public String getUser1(){return this.user1; }
	public String getUser2(){return this.user2; }
	public String getUser3(){return this.user3; }
	public String getUser4(){return this.user4; }
	public String getUser5(){return this.user5; }
	public ArrayList<ChiTietPhieuMuonModel> getListChiTietPhieuMuon(){return chiTietPhieuMuonList;}
	
}
