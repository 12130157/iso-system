package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class DeCuongMonHocModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private String maDeCuongMonHoc;
	private String tenDeCuongMonHoc;
	private String maMonHoc;
	private String soBuoiHocTrongTuan;
	private String soTietHocMotBuoi;
	private String lyThuyet;
	private String thucHanh;
	private String kiemTra;
	private String tinhChatMonHoc;
	private String viTriMonHoc;
	private String mucTieu1;
	private String mucTieu2;
	private String mucTieu3;
	private String mucTieu4;
	private String dieuKien1;
	private String dieuKien2;
	private String dieuKien3;
	private String dieuKien4;
	private String phuongPhap1;
	private String phuongPhap2;
	private String phuongPhap3;
	private String ngayTao;
	private String gioTao;
	private String maNguoiTao;
	private String maNguoiDuyet;
	private String ngayDuyet;
	private String gioDuyet;
	private String ngayCapNhatCuoi;
	private String gioCapNhatCuoi;
	private String tinhTrang;
	private String lyDoReject;
	private String maChuongTrinh;
	private String kieuBienSoan;
	private String tenKhoa;
	private String tenMonHoc;
	private String ngayGui;
	private String lyThuyetCTMH;
	private String thucHanhCTMH;
	private String gioGui;
	private String maNguoiTaoChuongTrinh;
	
	public String getMaNguoiTaoChuongTrinh() {
		return maNguoiTaoChuongTrinh;
	}
	public void setMaNguoiTaoChuongTrinh(String maNguoiTaoChuongTrinh) {
		this.maNguoiTaoChuongTrinh = maNguoiTaoChuongTrinh;
	}
	public String getGioGui() {
		return gioGui;
	}
	public void setGioGui(String gioGui) {
		this.gioGui = gioGui;
	}
	public String getLyThuyetCTMH() {
		return lyThuyetCTMH;
	}
	public void setLyThuyetCTMH(String lyThuyetCTMH) {
		this.lyThuyetCTMH = lyThuyetCTMH;
	}
	public String getThucHanhCTMH() {
		return thucHanhCTMH;
	}
	public void setThucHanhCTMH(String thucHanhCTMH) {
		this.thucHanhCTMH = thucHanhCTMH;
	}
	public String getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(String ngayGui) {
		this.ngayGui = ngayGui;
	}
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}
	public String getGioTao() {
		return gioTao;
	}
	public void setGioTao(String gioTao) {
		this.gioTao = gioTao;
	}
	public String getGioDuyet() {
		return gioDuyet;
	}
	public void setGioDuyet(String gioDuyet) {
		this.gioDuyet = gioDuyet;
	}
	public String getGioCapNhatCuoi() {
		return gioCapNhatCuoi;
	}
	public void setGioCapNhatCuoi(String gioCapNhatCuoi) {
		this.gioCapNhatCuoi = gioCapNhatCuoi;
	}
	public String getTenKhoa() {
		return tenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	public String getKieuBienSoan() {
		return kieuBienSoan;
	}
	public void setKieuBienSoan(String kieuBienSoan) {
		this.kieuBienSoan = kieuBienSoan;
	}
	public String getMaChuongTrinh() {
		return maChuongTrinh;
	}
	public void setMaChuongTrinh(String maChuongTrinh) {
		this.maChuongTrinh = maChuongTrinh;
	}
	public void setSoBuoiHocTrongTuan(String soBuoiHocTrongTuan) {
		this.soBuoiHocTrongTuan = soBuoiHocTrongTuan;
	}
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String tenNguoiTao;
	private String tenNguoiDuyet;
	private String status;
	private ArrayList<NoiDungDCMHModel> noiDungDCMHModelsList;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public ArrayList<NoiDungDCMHModel> getNoiDungDCMHModelsList() {
		return noiDungDCMHModelsList;
	}
	public void setNoiDungDCMHModelsList(
			ArrayList<NoiDungDCMHModel> noiDungDCMHModelsList) {
		this.noiDungDCMHModelsList = noiDungDCMHModelsList;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getLyDoReject() {
		return lyDoReject;
	}
	public void setLyDoReject(String lyDoReject) {
		this.lyDoReject = lyDoReject;
	}
	
	public String getTenNguoiTao() {
		return tenNguoiTao;
	}
	public void setTenNguoiTao(String tenNguoiTao) {
		this.tenNguoiTao = tenNguoiTao;
	}
	public String getTenNguoiDuyet() {
		return tenNguoiDuyet;
	}
	public void setTenNguoiDuyet(String tenNguoiDuyet) {
		this.tenNguoiDuyet = tenNguoiDuyet;
	}
	public String getMaDeCuongMonHoc() {
		return maDeCuongMonHoc;
	}
	public void setMaDeCuongMonHoc(String maDeCuongMonHoc) {
		this.maDeCuongMonHoc = maDeCuongMonHoc;
	}
	public String getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(String maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	public String getTenDeCuongMonHoc() {
		return tenDeCuongMonHoc;
	}
	public void setTenDeCuongMonHoc(String tenDeCuongMonHoc) {
		this.tenDeCuongMonHoc = tenDeCuongMonHoc;
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
	public String getKiemTra() {
		return kiemTra;
	}
	public void setKiemTra(String kiemTra) {
		this.kiemTra = kiemTra;
	}
	public String getViTriMonHoc() {
		return viTriMonHoc;
	}
	public void setViTriMonHoc(String viTriMonHoc) {
		this.viTriMonHoc = viTriMonHoc;
	}
	public String getTinhChatMonHoc() {
		return tinhChatMonHoc;
	}
	public void setTinhChatMonHoc(String tinhChatMonHoc) {
		this.tinhChatMonHoc = tinhChatMonHoc;
	}
	public String getMucTieu1() {
		return mucTieu1;
	}
	public void setMucTieu1(String mucTieu1) {
		this.mucTieu1 = mucTieu1;
	}
	public String getMucTieu2() {
		return mucTieu2;
	}
	public void setMucTieu2(String mucTieu2) {
		this.mucTieu2 = mucTieu2;
	}
	public String getMucTieu3() {
		return mucTieu3;
	}
	public void setMucTieu3(String mucTieu3) {
		this.mucTieu3 = mucTieu3;
	}
	public String getMucTieu4() {
		return mucTieu4;
	}
	public void setMucTieu4(String mucTieu4) {
		this.mucTieu4 = mucTieu4;
	}
	public String getDieuKien1() {
		return dieuKien1;
	}
	public void setDieuKien1(String dieuKien1) {
		this.dieuKien1 = dieuKien1;
	}
	public String getDieuKien2() {
		return dieuKien2;
	}
	public void setDieuKien2(String dieuKien2) {
		this.dieuKien2 = dieuKien2;
	}
	public String getDieuKien3() {
		return dieuKien3;
	}
	public void setDieuKien3(String dieuKien3) {
		this.dieuKien3 = dieuKien3;
	}
	public String getDieuKien4() {
		return dieuKien4;
	}
	public void setDieuKien4(String dieuKien4) {
		this.dieuKien4 = dieuKien4;
	}
	public String getPhuongPhap1() {
		return phuongPhap1;
	}
	public void setPhuongPhap1(String phuongPhap1) {
		this.phuongPhap1 = phuongPhap1;
	}
	public String getPhuongPhap2() {
		return phuongPhap2;
	}
	public void setPhuongPhap2(String phuongPhap2) {
		this.phuongPhap2 = phuongPhap2;
	}
	public String getPhuongPhap3() {
		return phuongPhap3;
	}
	public void setPhuongPhap3(String phuongPhap3) {
		this.phuongPhap3 = phuongPhap3;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getMaNguoiTao() {
		return maNguoiTao;
	}
	public void setMaNguoiTao(String maNguoiTao) {
		this.maNguoiTao = maNguoiTao;
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
	
	public String getSoBuoiHocTrongTuan() {
		return soBuoiHocTrongTuan;
	}
	public void setSoBuoiHoc(String soBuoiHocTrongTuan) {
		this.soBuoiHocTrongTuan = soBuoiHocTrongTuan;
	}
	public String getSoTietHocMotBuoi() {
		return soTietHocMotBuoi;
	}
	public void setSoTietHocMotBuoi(String soTietHocMotBuoi) {
		this.soTietHocMotBuoi = soTietHocMotBuoi;
	}
	public boolean validateModel() {
		// TODO Auto-generated method stub
		boolean result = true;
		if(maMonHoc == null || maMonHoc.equals("")) {
			result = false;
		} else if(viTriMonHoc == null || viTriMonHoc.equals("")) {
			result = false;
		} else if(mucTieu1 == null || mucTieu1.equals("")) {
			result = false;
		} else if(mucTieu2 == null || mucTieu2.equals("")) {
			result = false;
		} else if(mucTieu3 == null || mucTieu3.equals("")) {
			result = false;
		} else if(mucTieu4 == null || mucTieu4.equals("")) {
			result = false;
		} else if(dieuKien1 == null || dieuKien1.equals("")) {
			result = false;
		} else if(dieuKien2 == null || dieuKien2.equals("")) {
			result = false;
		} else if(dieuKien3 == null || dieuKien3.equals("")) {
			result = false;
		} else if(dieuKien4 == null || dieuKien4.equals("")) {
			result = false;
		} else if(phuongPhap1 == null || phuongPhap1.equals("")) {
			result = false;
		} else if(phuongPhap2 == null || phuongPhap2.equals("")) {
			result = false;
		} else if(phuongPhap3 == null || phuongPhap3.equals("")) {
			result = false;
		}
		for(NoiDungDCMHModel obj : noiDungDCMHModelsList) {
			if (!obj.validateModel()) {
				result = obj.validateModel();
				break;
			}
		}
		return result;
	}
	
	
	
}
