package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class KeHoachDaoTaoModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maKeHoachDaoTao;
	private String tenKeHoachDaoTao;
	private String nam1;
	private String nam2;
	private String nam3;
	private String nam4;
	private String nam5;
	private String nam6;
	private String nhiemVu1;
	private String nhiemVu2;
	private String nhiemVu3;
	private String nhiemVu4;
	private String maNguoiLap;
	private String ngayLap;
	private String gioLap;
	private String maNguoiDuyet;
	private String ngayDuyet;
	private String gioDuyet;
	private String ngayGui;
	private String boSung;
	private String gioGui;
	private String tuanBatDau;
	private String tuanKetThuc;
	
	public String getTuanBatDau() {
		return tuanBatDau;
	}
	public void setTuanBatDau(String tuanBatDau) {
		this.tuanBatDau = tuanBatDau;
	}
	public String getTuanKetThuc() {
		return tuanKetThuc;
	}
	public void setTuanKetThuc(String tuanKetThuc) {
		this.tuanKetThuc = tuanKetThuc;
	}
	public String getGioGui() {
		return gioGui;
	}
	public void setGioGui(String gioGui) {
		this.gioGui = gioGui;
	}
	public String getBoSung() {
		return boSung;
	}
	public void setBoSung(String boSung) {
		this.boSung = boSung;
	}
	public String getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(String ngayGui) {
		this.ngayGui = ngayGui;
	}
	public String getGioLap() {
		return gioLap;
	}
	public void setGioLap(String gioLap) {
		this.gioLap = gioLap;
	}
	public String getGioDuyet() {
		return gioDuyet;
	}
	public void setGioDuyet(String gioDuyet) {
		this.gioDuyet = gioDuyet;
	}
	private String tinhTrang;
	private String ngayCapNhatCuoi;
	private String gioCapNhatCuoi;
	public String getGioCapNhatCuoi() {
		return gioCapNhatCuoi;
	}
	public void setGioCapNhatCuoi(String gioCapNhatCuoi) {
		this.gioCapNhatCuoi = gioCapNhatCuoi;
	}
	private String lyDoReject;
	private ArrayList<ChiTietKHDTModel> chiTietKHDTList;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String tenNguoiLap;
	private String tenNguoiDuyet;
	
	public String getTenNguoiDuyet() {
		return tenNguoiDuyet;
	}
	public void setTenNguoiDuyet(String tenNguoiDuyet) {
		this.tenNguoiDuyet = tenNguoiDuyet;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getNam1() {
		return nam1;
	}
	public void setNam1(String nam1) {
		this.nam1 = nam1;
	}
	public String getNam2() {
		return nam2;
	}
	public void setNam2(String nam2) {
		this.nam2 = nam2;
	}
	public String getNam3() {
		return nam3;
	}
	public void setNam3(String nam3) {
		this.nam3 = nam3;
	}
	public String getNam4() {
		return nam4;
	}
	public void setNam4(String nam4) {
		this.nam4 = nam4;
	}
	public String getNam5() {
		return nam5;
	}
	public void setNam5(String nam5) {
		this.nam5 = nam5;
	}
	public String getNam6() {
		return nam6;
	}
	public void setNam6(String nam6) {
		this.nam6 = nam6;
	}
	public ArrayList<ChiTietKHDTModel> getChiTietKHDTList() {
		return chiTietKHDTList;
	}
	public void setChiTietKHDTList(ArrayList<ChiTietKHDTModel> chiTietKHDTList) {
		this.chiTietKHDTList = chiTietKHDTList;
	}
	public String getLyDoReject() {
		return lyDoReject;
	}
	public void setLyDoReject(String lyDoReject) {
		this.lyDoReject = lyDoReject;
	}		
	public String getMaKeHoachDaoTao() {
		return maKeHoachDaoTao;
	}
	public void setMaKeHoachDaoTao(String maKeHoachDaoTao) {
		this.maKeHoachDaoTao = maKeHoachDaoTao;
	}
	
	public String getTenKeHoachDaoTao() {
		return tenKeHoachDaoTao;
	}
	public void setTenKeHoachDaoTao(String tenKeHoachDaoTao) {
		this.tenKeHoachDaoTao = tenKeHoachDaoTao;
	}	
	public String getNhiemVu1() {
		return nhiemVu1;
	}
	public void setNhiemVu1(String nhiemVu1) {
		this.nhiemVu1 = nhiemVu1;
	}
	public String getNhiemVu2() {
		return nhiemVu2;
	}
	public void setNhiemVu2(String nhiemVu2) {
		this.nhiemVu2 = nhiemVu2;
	}
	public String getNhiemVu3() {
		return nhiemVu3;
	}
	public void setNhiemVu3(String nhiemVu3) {
		this.nhiemVu3 = nhiemVu3;
	}
	public String getNhiemVu4() {
		return nhiemVu4;
	}
	public void setNhiemVu4(String nhiemVu4) {
		this.nhiemVu4 = nhiemVu4;
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
	
	public String getTenNguoiLap() {
		return tenNguoiLap;
	}
	public void setTenNguoiLap(String tenNguoiLap) {
		this.tenNguoiLap = tenNguoiLap;
	}
	public Boolean validateModel() {
		Boolean result = true;
		
		if (nam1 == null || nam1.equals("")) {
			result = false;
		} else if (nam2 == null || nam2.equals("")) {
			result = false;
		} else if (nam3 == null || nam3.equals("")) {
			result = false;
		} else if (nam4 == null || nam4.equals("")) {
			result = false;
		} else if (nam5 == null || nam5.equals("")) {
			result = false;
		} else if (nam6 == null || nam6.equals("")) {
			result = false;
		} else if (nhiemVu1 == null || nhiemVu1.equals("")) {
			result = false;
		} else if (nhiemVu2 == null || nhiemVu2.equals("")) {
			result = false;
		} else if (nhiemVu3 == null || nhiemVu3.equals("")) {
			result = false;
		} else if (nhiemVu4 == null || nhiemVu4.equals("")) {
			result = false;
		}
		
	/*	for(ChiTietKHDTModel obj : chiTietKHDTList) {
			if (!obj.validateModel()) {
				result = obj.validateModel();
				break;
			}
		}*/
		
		return result;
	}
}
