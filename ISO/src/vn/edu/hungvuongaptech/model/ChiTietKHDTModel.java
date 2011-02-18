/**
 * 
 */
package vn.edu.hungvuongaptech.model;

import java.util.ArrayList;

/**
 * @author ThienVD
 *
 */
public class ChiTietKHDTModel {
	private String id;
	private String maKeHoach;
	private String tuNgay;
	private String denNgay;
	private String tuan;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String ngayCapNhatCuoi;
	private String maNamHoc;
	private String thuTuTuan;
	private String tinhTrangPhanCongTac;
	private String closeDate;
	private String ghiChu;
	
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	public String getTinhTrangPhanCongTac() {
		return tinhTrangPhanCongTac;
	}
	public void setTinhTrangPhanCongTac(String tinhTrangPhanCongTac) {
		this.tinhTrangPhanCongTac = tinhTrangPhanCongTac;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public String getThuTuTuan() {
		return thuTuTuan;
	}
	public void setThuTuTuan(String thuTuTuan) {
		this.thuTuTuan = thuTuTuan;
	}
	public String getMaNamHoc() {
		return maNamHoc;
	}
	public void setMaNamHoc(String maNamHoc) {
		this.maNamHoc = maNamHoc;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
	}

	private ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietKHDTModelList;
	
	public ArrayList<NoiDungChiTietKHDTModel> getNoiDungChiTietKHDTModelList() {
		return noiDungChiTietKHDTModelList;
	}
	public void setNoiDungChiTietKHDTModelList(
			ArrayList<NoiDungChiTietKHDTModel> noiDungChiTietKHDTModelList) {
		this.noiDungChiTietKHDTModelList = noiDungChiTietKHDTModelList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMaKeHoach() {
		return maKeHoach;
	}
	public void setMaKeHoach(String maKeHoach) {
		this.maKeHoach = maKeHoach;
	}
	public String getTuNgay() {
		return tuNgay;
	}
	public void setTuNgay(String tuNgay) {
		this.tuNgay = tuNgay;
	}
	public String getDenNgay() {
		return denNgay;
	}
	public void setDenNgay(String denNgay) {
		this.denNgay = denNgay;
	}
	
	public String getTuan() {
		return tuan;
	}
	public void setTuan(String tuan) {
		this.tuan = tuan;
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
	
	/*public Boolean validateModel() {
		Boolean result = true;
		
		if (tuNgay == null || tuNgay.equals("")) {
			result = false;
		} else if (denNgay == null || denNgay.equals("")) {
			result = false;
		} else if (denNgay == null || denNgay.equals("")) {
			result = false;
		} 
		
		return result;
	}*/		
}
