package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class ChiTietMonHocCTDTModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maChiTietCTDT;
	private String maChuongTrinh;
	private String thuTu;
	private String maMonHoc;
	private String tenMonHoc;
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}
	private String namHoc;
	private String hocKi;
	private String lyThuyet;
	private String thucHanh;
	private String LTTH;
	private String TTSX;
	private String tinhChat;
	private String maHocPhan;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String tenKhoa;
	private String tinhTrang;
	private String maDeCuong;
	private String maNguoiTaoDeCuong;
	private String kiemTraTrung;
	private String lyThuyetBeforeUpdate;
	private String thucHanhBeforeUpdate;
	
	
	public String getLyThuyetBeforeUpdate() {
		return lyThuyetBeforeUpdate;
	}
	public void setLyThuyetBeforeUpdate(String lyThuyetBeforeUpdate) {
		this.lyThuyetBeforeUpdate = lyThuyetBeforeUpdate;
	}
	public String getThucHanhBeforeUpdate() {
		return thucHanhBeforeUpdate;
	}
	public void setThucHanhBeforeUpdate(String thucHanhBeforeUpdate) {
		this.thucHanhBeforeUpdate = thucHanhBeforeUpdate;
	}
	public String getKiemTraTrung() {
		return kiemTraTrung;
	}
	public void setKiemTraTrung(String kiemTraTrung) {
		this.kiemTraTrung = kiemTraTrung;
	}
	public String getMaNguoiTaoDeCuong() {
		return maNguoiTaoDeCuong;
	}
	public void setMaNguoiTaoDeCuong(String maNguoiTaoDeCuong) {
		this.maNguoiTaoDeCuong = maNguoiTaoDeCuong;
	}
	public String getMaDeCuong() {
		return maDeCuong;
	}
	public void setMaDeCuong(String maDeCuong) {
		this.maDeCuong = maDeCuong;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getTenKhoa() {
		return tenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	public String getTTSX() {
		return TTSX;
	}
	public void setTTSX(String tTSX) {
		TTSX = tTSX;
	}
	
	public String getMaChiTietCTDT() {
		return maChiTietCTDT;
	}
	public void setMaChiTietCTDT(String maChiTietCTDT) {
		this.maChiTietCTDT = maChiTietCTDT;
	}
	public String getMaChuongTrinh() {
		return maChuongTrinh;
	}
	public void setMaChuongTrinh(String maChuongTrinh) {
		this.maChuongTrinh = maChuongTrinh;
	}
	public String getThuTu() {
		return thuTu;
	}
	public void setThuTu(String thuTu) {
		this.thuTu = thuTu;
	}
	public String getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
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
	
	public String getNamHoc() {
		return namHoc;
	}
	public void setNamHoc(String namHoc) {
		this.namHoc = namHoc;
	}
	public String getHocKi() {
		return hocKi;
	}
	public void setHocKi(String hocKi) {
		this.hocKi = hocKi;
	}
	public String getLyThuyet() {
		return lyThuyet;
	}
	public void setLyThuyet(String lyThuyet) {
		this.lyThuyet = lyThuyet;
	}
	public String getThucHanh() {
		return thucHanh;
	}
	public void setThucHanh(String thucHanh) {
		this.thucHanh = thucHanh;
	}
	public String getLTTH() {
		return LTTH;
	}
	public void setLTTH(String lTTH) {
		LTTH = lTTH;
	}
	public String getTinhChat() {
		return tinhChat;
	}
	public void setTinhChat(String tinhChat) {
		this.tinhChat = tinhChat;
	}
	public String getMaHocPhan() {
		return maHocPhan;
	}
	public void setMaHocPhan(String maHocPhan) {
		this.maHocPhan = maHocPhan;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Boolean validateModel() {
		Boolean result = true;
		if(maMonHoc == null || maMonHoc.equals("")) {
			result = false;
		} else if (namHoc == null || namHoc.equals("")) {
			result = false;
		} else if (hocKi == null || hocKi.equals("")) {
			result = false;
		} else if (lyThuyet == null || lyThuyet.equals("")) {
			result = false;
		} else if (thucHanh == null || thucHanh.equals("")) {
			result = false;
		} else if (tinhChat == null || tinhChat.equals("")) {
			result = false;
		} else if (user1 == null || user1.equals("")) {
			result = false;
		} 
		
		return result;
	}		
}
