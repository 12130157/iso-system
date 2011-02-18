package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class KeHoachGiangDayModel implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maKHGD;
	private String tenKHGD;
	private String maMonHoc;
	private String tenMonHoc;
	private String thoiKhoaBieu;
	private String maGiaoVien;
	private String tenGiaoVien;
	private String maLop;
	private String kiHieuLop;
	private String hocKi;
	private String maNamHoc;
	private String namHoc;
	private String soCaThucHanh;
	private String maNguoiTao;
	private String tenNguoiTao;
	private String ngayTao;
	private String gioTao;
	private String maNguoiDuyet;
	private String tenNguoiDuyet;
	private String ngayDuyet;
	private String maTruongKhoa;
	private String tenTruongKhoa;
	private String ngayTKDuyet;
	private String gioTKDuyet;
	private String gioDuyet;
	private String ngayCapNhatCuoi;
	private String gioCapNhatCuoi;
	private String tinhTrang;
	private String soBuoiHocTrongTuan;
	private String soGioMonHoc;
	private String soGioLT;
	private String soGioTH;
	private String noiDungKTThucHien;
	private String maNguoiKiemTra;
	private String lyDoReject;
	private String soTietMoiBuoi;
	private ArrayList<ChiTietKHGDModel> chiTietKHGDModelList;
	public String tinhTrangHT;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	
	public String getMaTruongKhoa() {
		return maTruongKhoa;
	}
	public void setMaTruongKhoa(String maTruongKhoa) {
		this.maTruongKhoa = maTruongKhoa;
	}
	public String getTenTruongKhoa() {
		return tenTruongKhoa;
	}
	public void setTenTruongKhoa(String tenTruongKhoa) {
		this.tenTruongKhoa = tenTruongKhoa;
	}
	public String getNgayTKDuyet() {
		return ngayTKDuyet;
	}
	public void setNgayTKDuyet(String ngayTKDuyet) {
		this.ngayTKDuyet = ngayTKDuyet;
	}
	public String getMaKHGD() {
		return maKHGD;
	}
	public void setMaKHGD(String maKHGD) {
		this.maKHGD = maKHGD;
	}
	public String getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}
	public String getHocKi() {
		return hocKi;
	}
	public void setHocKi(String hocKi) {
		this.hocKi = hocKi;
	}
	public String getMaNamHoc() {
		return maNamHoc;
	}
	public void setMaNamHoc(String maNamHoc) {
		this.maNamHoc = maNamHoc;
	}
	public String getSoCaThucHanh() {
		return soCaThucHanh;
	}
	public void setSoCaThucHanh(String soCaThucHanh) {
		this.soCaThucHanh = soCaThucHanh;
	}
	public String getMaNguoiTao() {
		return maNguoiTao;
	}
	public void setMaNguoiTao(String maNguoiTao) {
		this.maNguoiTao = maNguoiTao;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getSoBuoiHocTrongTuan() {
		return soBuoiHocTrongTuan;
	}
	public void setSoBuoiHocTrongTuan(String soBuoiHocTrongTuan) {
		this.soBuoiHocTrongTuan = soBuoiHocTrongTuan;
	}
	public String getNoiDungKTThucHien() {
		return noiDungKTThucHien;
	}
	public void setNoiDungKTThucHien(String noiDungKTThucHien) {
		this.noiDungKTThucHien = noiDungKTThucHien;
	}
	public String getMaNguoiKiemTra() {
		return maNguoiKiemTra;
	}
	public void setMaNguoiKiemTra(String maNguoiKiemTra) {
		this.maNguoiKiemTra = maNguoiKiemTra;
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
	public void setTenKHGD(String tenKHGD) {
		this.tenKHGD = tenKHGD;
	}
	public String getTenKHGD() {
		return tenKHGD;
	}
	public String getTenNguoiTao() {
		return tenNguoiTao;
	}
	public void setTenNguoiTao(String tenNguoiTao) {
		this.tenNguoiTao = tenNguoiTao;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public void setLyDoReject(String lyDoReject) {
		this.lyDoReject = lyDoReject;
	}
	public String getLyDoReject() {
		return lyDoReject;
	}
	public String getMaNguoiDuyet() {
		return maNguoiDuyet;
	}
	public void setMaNguoiDuyet(String maNguoiDuyet) {
		this.maNguoiDuyet = maNguoiDuyet;
	}
	public String getTenNguoiDuyet() {
		return tenNguoiDuyet;
	}
	public void setTenNguoiDuyet(String tenNguoiDuyet) {
		this.tenNguoiDuyet = tenNguoiDuyet;
	}
	public String getNgayDuyet() {
		return ngayDuyet;
	}
	public void setNgayDuyet(String ngayDuyet) {
		this.ngayDuyet = ngayDuyet;
	}
	public void setKiHieuLop(String kiHieuLop) {
		this.kiHieuLop = kiHieuLop;
	}
	public String getKiHieuLop() {
		return kiHieuLop;
	}
	public void setNamHoc(String namHoc) {
		this.namHoc = namHoc;
	}
	public String getNamHoc() {
		return namHoc;
	}
	public void setGioTao(String gioTao) {
		this.gioTao = gioTao;
	}
	public String getGioTao() {
		return gioTao;
	}
	public void setGioDuyet(String gioDuyet) {
		this.gioDuyet = gioDuyet;
	}
	public String getGioDuyet() {
		return gioDuyet;
	}
	public void setGioCapNhatCuoi(String gioCapNhatCuoi) {
		this.gioCapNhatCuoi = gioCapNhatCuoi;
	}
	public String getGioCapNhatCuoi() {
		return gioCapNhatCuoi;
	}
	public String getSoGioLT() {
		return soGioLT;
	}
	public void setSoGioLT(String soGioLT) {
		this.soGioLT = soGioLT;
	}
	public String getSoGioTH() {
		return soGioTH;
	}
	public void setSoGioTH(String soGioTH) {
		this.soGioTH = soGioTH;
	}
	public void setSoGioMonHoc(String soGioMonHoc) {
		this.soGioMonHoc = soGioMonHoc;
	}
	public String getSoGioMonHoc() {
		return soGioMonHoc;
	}
	public void setMaGiaoVien(String maGiaoVien) {
		this.maGiaoVien = maGiaoVien;
	}
	public String getMaGiaoVien() {
		return maGiaoVien;
	}
	public void setTenGiaoVien(String tenGiaoVien) {
		this.tenGiaoVien = tenGiaoVien;
	}
	public String getTenGiaoVien() {
		return tenGiaoVien;
	}
	public void setSoTietMoiBuoi(String soTietMoiBuoi) {
		this.soTietMoiBuoi = soTietMoiBuoi;
	}
	public String getSoTietMoiBuoi() {
		return soTietMoiBuoi;
	}
	public void setChiTietKHGDModelList(ArrayList<ChiTietKHGDModel> chiTietKHGDModelList) {
		this.chiTietKHGDModelList = chiTietKHGDModelList;
	}
	public ArrayList<ChiTietKHGDModel> getChiTietKHGDModelList() {
		return chiTietKHGDModelList;
	}
	public void setGioTKDuyet(String gioTKDuyet) {
		this.gioTKDuyet = gioTKDuyet;
	}
	public String getGioTKDuyet() {
		return gioTKDuyet;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setThoiKhoaBieu(String thoiKhoaBieu) {
		this.thoiKhoaBieu = thoiKhoaBieu;
	}
	public String getThoiKhoaBieu() {
		return thoiKhoaBieu;
	}
	public String getTinhTrangHT(){
		return tinhTrangHT;
	}
	
	public void setTinhTrangHT(String tinhTrangHT){
		this.tinhTrangHT=tinhTrangHT;
	}
	
	
	public Boolean validateModel() {
		Boolean result = true;
		if (maLop == null || maLop.trim().equals("")) {
			result = false;
		} else if (maMonHoc == null || maMonHoc.equals("")) {
			result = false;
		} else if (thoiKhoaBieu == null || thoiKhoaBieu.equals("")) {
			result = false;
		}
		return result;
	}
}
