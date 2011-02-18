package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class QuyetDinhModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maQuyetDinh;
	private String maKHDT;
	private String tenQuyetDinh;
	private String kiHieu;
	private String maKhoa;
	private String namBatDau;
	private String maHeDaoTao;
	private String tenHeDaoTao;
	private String soNamDaoTao;
	private String thongTinChung;
	private String dieuMot;
	private String tuThang;
	private String denThang;
	private String maNguoiLap;
	private String tenNguoiLap;
	private String ngayLap;
	private String maNguoiDuyet;
	private String tenNguoiDuyet;
	private String ngayDuyet;
	private String tinhTrang;
	private String noiNhan;
	private String quyetDinhSo;
	private String ngayRaQuyetDinh;
	private String tongSoHocSinh;
	private String tongSoChuyenNganh;
	private String ngayCapNhatCuoi;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String lyDoReject;
	private String gioDuyet;
	private String gioLap;
	private String gioCapNhat;
	
	private ArrayList<MoChuyenNganhModel> moChuyenNganhList;
	
	public String getMaQuyetDinh() {
		return maQuyetDinh;
	}
	public void setMaQuyetDinh(String maQuyetDinh) {
		this.maQuyetDinh = maQuyetDinh;
	}
	public String getMaKHDT() {
		return maKHDT;
	}
	public void setMaKHDT(String maKHDT) {
		this.maKHDT = maKHDT;
	}
	public String getKiHieu() {
		return kiHieu;
	}
	public void setKiHieu(String kiHieu) {
		this.kiHieu = kiHieu;
	}
	public String getMaKhoa() {
		return maKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		this.maKhoa = maKhoa;
	}
	public String getThongTinChung() {
		return thongTinChung;
	}
	public void setThongTinChung(String thongTinChung) {
		this.thongTinChung = thongTinChung;
	}
	public String getDieuMot() {
		return dieuMot;
	}
	public void setDieuMot(String dieuMot) {
		this.dieuMot = dieuMot;
	}
	public String getTuThang() {
		return tuThang;
	}
	public void setTuThang(String tuThang) {
		this.tuThang = tuThang;
	}
	public String getDenThang() {
		return denThang;
	}
	public void setDenThang(String denThang) {
		this.denThang = denThang;
	}
	public String getMaNguoiLap() {
		return maNguoiLap;
	}
	public void setMaNguoiLap(String maNguoiLap) {
		this.maNguoiLap = maNguoiLap;
	}
	public String getNgayLap() {
		return ngayLap;
	}
	public void setNgayLap(String ngayLap) {
		this.ngayLap = ngayLap;
	}
	public String getMaNguoiDuyet() {
		return maNguoiDuyet;
	}
	public void setMaNguoiDuyet(String maNguoiDuyet) {
		this.maNguoiDuyet = maNguoiDuyet;
	}
	public String getNgayDuyet() {
		return ngayDuyet;
	}
	public void setNgayDuyet(String ngayDuyet) {
		this.ngayDuyet = ngayDuyet;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getNoiNhan() {
		return noiNhan;
	}
	public void setNoiNhan(String noiNhan) {
		this.noiNhan = noiNhan;
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
	public void setMoChuyenNganhList(ArrayList<MoChuyenNganhModel> moChuyenNganhList) {
		this.moChuyenNganhList = moChuyenNganhList;
	}
	public ArrayList<MoChuyenNganhModel> getMoChuyenNganhList() {
		return moChuyenNganhList;
	}
	public String getNamBatDau() {
		return namBatDau;
	}
	public void setNamBatDau(String namBatDau) {
		this.namBatDau = namBatDau;
	}
	public String getMaHeDaoTao() {
		return maHeDaoTao;
	}
	public void setMaHeDaoTao(String maHeDaoTao) {
		this.maHeDaoTao = maHeDaoTao;
	}
	public void setTenQuyetDinh(String tenQuyetDinh) {
		this.tenQuyetDinh = tenQuyetDinh;
	}
	public String getTenQuyetDinh() {
		return tenQuyetDinh;
	}
	public void setTenNguoiLap(String tenNguoiLap) {
		this.tenNguoiLap = tenNguoiLap;
	}
	public String getTenNguoiLap() {
		return tenNguoiLap;
	}
	public void setLyDoReject(String lyDoReject) {
		this.lyDoReject = lyDoReject;
	}
	public String getLyDoReject() {
		return lyDoReject;
	}
	public String getQuyetDinhSo() {
		return quyetDinhSo;
	}
	public void setQuyetDinhSo(String quyetDinhSo) {
		this.quyetDinhSo = quyetDinhSo;
	}
	public String getNgayRaQuyetDinh() {
		return ngayRaQuyetDinh;
	}
	public void setNgayRaQuyetDinh(String ngayRaQuyetDinh) {
		this.ngayRaQuyetDinh = ngayRaQuyetDinh;
	}
	public void setTenHeDaoTao(String tenHeDaoTao) {
		this.tenHeDaoTao = tenHeDaoTao;
	}
	public String getTenHeDaoTao() {
		return tenHeDaoTao;
	}
	public void setSoNamDaoTao(String soNamDaoTao) {
		this.soNamDaoTao = soNamDaoTao;
	}
	public String getSoNamDaoTao() {
		return soNamDaoTao;
	}
	public String getTongSoHocSinh() {
		return tongSoHocSinh;
	}
	public void setTongSoHocSinh(String tongSoHocSinh) {
		this.tongSoHocSinh = tongSoHocSinh;
	}
	public String getTongSoChuyenNganh() {
		return tongSoChuyenNganh;
	}
	public void setTongSoChuyenNganh(String tongSoChuyenNganh) {
		this.tongSoChuyenNganh = tongSoChuyenNganh;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setTenNguoiDuyet(String tenNguoiDuyet) {
		this.tenNguoiDuyet = tenNguoiDuyet;
	}
	public String getTenNguoiDuyet() {
		return tenNguoiDuyet;
	}
	public String getGioDuyet() {
		return gioDuyet;
	}
	public void setGioDuyet(String gioDuyet) {
		this.gioDuyet = gioDuyet;
	}
	public String getGioLap() {
		return gioLap;
	}
	public void setGioLap(String gioLap) {
		this.gioLap = gioLap;
	}
	public String getGioCapNhat() {
		return gioCapNhat;
	}
	public void setGioCapNhat(String gioCapNhat) {
		this.gioCapNhat = gioCapNhat;
	}
	public Boolean validateModel() {
		Boolean result = true;
		
		if (kiHieu == null || kiHieu.trim().equals("")) {
			result = false;
		} else if (ngayRaQuyetDinh == null || ngayRaQuyetDinh.equals("")) {
			result = false;
		} else if (noiNhan == null || noiNhan.trim().equals("")) {
			result = false;
		} else if (quyetDinhSo == null || quyetDinhSo.trim().equals("")) {
			result = false;
		} else if (tongSoHocSinh == null || tongSoHocSinh.trim().equals("")) {
			result = false;
		} else if (tongSoChuyenNganh == null || tongSoChuyenNganh.trim().equals("")) {
			result = false;
		}
		
		for(MoChuyenNganhModel obj : moChuyenNganhList) {
			if (!obj.validateModel()) {
				result = obj.validateModel();
				break;
			}
		}
		
		return result;
	}
}
