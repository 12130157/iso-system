package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

public class ThietBiModel {
	private String stt;
	private String maThietBi;
	private String tenThietBi;
	private String maLoaiThietBi;
	private String tenLoaiThietBi;
	private String kiHieu;
	private String maTinhTrang;
	private String tenTinhTrang;	
	private String ghiChu;
	private String maBoPhan;
	private String tenBoPhan;	
	private String maNguoiTao;
	private String tenNguoiTao;
	private String maPhongBan;
	private String tenPhongBan;
	private String maNhaCungCap;
	private String ten;
	private String ngaySanXuat;
	private String ngayMua;
	private String ngayBaoHanh;
	private String ngayBatDauSuDung;
	private String maDonViTinh;
	private String tenDonViTinh;
	private String tanSuatToiDa;
	private String tanSuatSuDung;
	private String maDonViTanSuat;
	private String tenDonViTanSuat;
	private String phuKien;
	private String giaMua;
	private String nguyenTacSuDung;
	private String dacTinhKyThuat;
	private String ngayCapNhatCuoi;
	private String soLanSuDung;
	private String soLanBaoTri;
	private String maThanhVien;
	private String hoThanhVien;
	private String tenLot;
	private String tenThanhVien;
	private String soMay;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private ArrayList<ChiTietThietBiModel> chiTietThietBiList;
	
	public ThietBiModel(){
			stt="";
			maThietBi="";
			tenThietBi="";
			maLoaiThietBi="";
			tenLoaiThietBi="";
			kiHieu="";	 
			maTinhTrang="";
			tenTinhTrang="";		 
			ghiChu="";
			maBoPhan="";
			tenBoPhan="";		 
			maNguoiTao="";
			tenNguoiTao="";
			maPhongBan="";
			tenPhongBan="";
			maNhaCungCap="";
			ten="";
			ngaySanXuat="";
			ngayMua="";
			ngayBaoHanh="";
			ngayBatDauSuDung="";
			maDonViTinh="";
			tenDonViTinh="";
			tanSuatToiDa="";
			tanSuatSuDung="";
			maDonViTanSuat="";
			tenDonViTanSuat="";
			phuKien="";
			giaMua="";
			nguyenTacSuDung="";
			dacTinhKyThuat="";
			ngayCapNhatCuoi="";
			soLanSuDung="";
			soLanBaoTri="";
			maThanhVien = "";
			hoThanhVien="";
			tenLot="";
			tenThanhVien="";
			soMay="";
			user1="";
			user2="";
			user3="";
			user4="";
			user5="";
		 chiTietThietBiList=new ArrayList<ChiTietThietBiModel>();
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

	public void setStt(String stt) {this.stt = stt;}
	public void setMaThietBi(String maThietBi){this.maThietBi=maThietBi; }
	public void setTenThietBi(String tenThietBi){this.tenThietBi=tenThietBi; }
	public void setMaLoaiThietBi(String maLoaiThietBi){this.maLoaiThietBi=maLoaiThietBi; }
	public void setTenLoaiThietBi(String tenLoaiThietBi){this.tenLoaiThietBi=tenLoaiThietBi; }
	public void setKiHieu(String kiHieu){ this.kiHieu=kiHieu; }
	public void setMaTinhTrang(String maTinhTrang){this.maTinhTrang=maTinhTrang; }
	public void setTenTinhTrang(String tenTinhTrang){this.tenTinhTrang = tenTinhTrang;}	
	public void setGhiChu(String ghiChu){this.ghiChu=ghiChu; }
	public void setMaBoPhan(String maBoPhan) {this.maBoPhan = maBoPhan;}
	public void setTenBoPhan(String tenBoPhan) {this.tenBoPhan = tenBoPhan;}	
	public void setMaNguoiTao(String maNguoiTao){this.maNguoiTao=maNguoiTao; }
	public void setTenNguoiTao(String tenNguoiTao){this.tenNguoiTao=tenNguoiTao; }

	public void setMaPhongBan(String maPhongBan){this.maPhongBan=maPhongBan; }
	public void setTenPhongBan(String tenPhongBan){this.tenPhongBan=tenPhongBan; }
	public void setMaNhaCungCap(String maNhaCungCap){this.maNhaCungCap=maNhaCungCap; }
	public void setTenNhaCungCap(String ten){this.ten=ten; }
	public void setNgaySanXuat(String ngaySanXuat){this.ngaySanXuat=ngaySanXuat; }
	public void setNgayMua(String ngayMua){this.ngayMua=ngayMua; }
	public void setNgayBaoHanh(String ngayBaoHanh){this.ngayBaoHanh=ngayBaoHanh; }
	public void setNgayBatDauSuDung(String ngayBatDauSuDung){this.ngayBatDauSuDung=ngayBatDauSuDung; }
	public void setMaDonViTinh(String maDonViTinh){this.maDonViTinh=maDonViTinh; }
	public void setTenDonViTinh(String tenDonViTinh){this.tenDonViTinh=tenDonViTinh; }
	public void setTanSuatToiDa(String tanSuatToiDa){this.tanSuatToiDa=tanSuatToiDa; }
	public void setTanSuatSuDung(String tanSuatSuDung){this.tanSuatSuDung=tanSuatSuDung; }
	public void setMaDonViTanSuat(String maDonViTanSuat){this.maDonViTanSuat=maDonViTanSuat; }
	public void setTenDonViTanSuat(String tenDonViTanSuat){this.tenDonViTanSuat=tenDonViTanSuat; }
	public void setPhuKien(String phuKien){this.phuKien=phuKien; }
	public void setGiaMua(String giaMua){this.giaMua=giaMua; }
	public void setNguyenTacSuDung(String nguyenTacSuDung){this.nguyenTacSuDung=nguyenTacSuDung; }
	public void setDacTinhKyThuat(String dacTinhKyThuat){this.dacTinhKyThuat=dacTinhKyThuat; }
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi){this.ngayCapNhatCuoi=ngayCapNhatCuoi; }
	public void setSoLanSuDung(String soLanSuDung){this.soLanSuDung=soLanSuDung; }
	public void setSoLanBaoTri(String soLanBaoTri){this.soLanBaoTri=soLanBaoTri; }
	public void setMaThanhVien(String maThanhVien) {this.maThanhVien = maThanhVien;}
	public void setHoThanhVien(String hoThanhVien) {this.hoThanhVien = hoThanhVien;}
	public void setTenLot(String tenLot) {this.tenLot = tenLot;}	
	public void setTenThanhVien(String tenThanhVien) {this.tenThanhVien = tenThanhVien;}
	public void setSoMay(String soMay){this.soMay=soMay; }

	public void setListChiTietThietBi(ArrayList<ChiTietThietBiModel> chiTiet){this.chiTietThietBiList=chiTiet;}	
	
	public String getStt() {return stt;}
	public String getMaThietBi(){return this.maThietBi; }
	public String getTenThietBi(){return this.tenThietBi; }
	public String getMaLoaiThietBi(){return this.maLoaiThietBi; }
	public String getTenLoaiThietBi(){return this.tenLoaiThietBi; }
	public String getKiHieu(){return this.kiHieu;}
	public String getMaTinhTrang(){return this.maTinhTrang; }
	public String getTenTinhTrang() {return tenTinhTrang;}	
	public String getGhiChu(){return this.ghiChu; }
	public String getMaBoPhan() {	return maBoPhan;	}
	public String getTenBoPhan() {return tenBoPhan;	}	
	public String getMaNguoiTao(){return this.maNguoiTao; }
	public String getTenNguoiTao(){return this.tenNguoiTao; }
	public String getMaPhongBan(){return this.maPhongBan; }
	public String getTenPhongBan(){return this.tenPhongBan; }
	public String getMaNhaCungCap(){return this.maNhaCungCap; }
	public String getTenNhaCungCap(){return this.ten; }
	public String getNgaySanXuat(){return this.ngaySanXuat; }
	public String getNgayMua(){return this.ngayMua; }
	public String getNgayBaoHanh(){return this.ngayBaoHanh; }
	public String getNgayBatDauSuDung(){return this.ngayBatDauSuDung; }
	public String getMaDonViTinh(){return this.maDonViTinh; }
	public String getTenDonViTinh(){return this.tenDonViTinh; }
	public String getTanSuatToiDa(){return this.tanSuatToiDa; }
	public String getTanSuatSuDung(){return this.tanSuatSuDung; }
	public String getMaDonViTanSuat(){return this.maDonViTanSuat; }
	public String getTenDonViTanSuat(){return this.tenDonViTanSuat; }
	public String getPhuKien(){return this.phuKien; }
	public String getGiaMua(){return this.giaMua; }
	public String getNguyenTacSuDung(){return this.nguyenTacSuDung; }
	public String getDacTinhKyThuat(){return this.dacTinhKyThuat; }
	public String getNgayCapNhatCuoi(){return this.ngayCapNhatCuoi; }
	public String getSoLanSuDung(){return this.soLanSuDung; }
	public String getSoLanBaoTri(){return this.soLanBaoTri; }
	public String getMaThanhVien() {return maThanhVien;}
	public String getHoThanhVien() {return hoThanhVien;}
	public String getTenLot() {return tenLot;}
	public String getTenThanhVien() {return tenThanhVien;}
	public String getSoMay(){return this.soMay; }
	public ArrayList<ChiTietThietBiModel> getListChiTietThietBi(){return chiTietThietBiList;}
	
}
