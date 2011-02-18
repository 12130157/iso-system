package vn.edu.hungvuongaptech.model;

import java.io.Serializable;
import java.util.ArrayList;

public class ChuongTrinhDaoTaoModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maChuongTrinhDaoTao;
	private String tenChuongTrinhDaoTao;
	private String maQuyetDinh;
	private String tenNghe;
	private String maNghe;
	private String kiHieu;
	private String maTrinhDo;
	private String doiTuong1;
	private String doiTuong2;
	private String doiTuong3;
	private String bangCap;
	private String soLuongMonHoc;
	private String mucTieu1;
	private String mucTieu2;
	private String mucTieu3;
	private String mucTieu4;
	private String mucTieu5;
	private String phuongPhap1;
	private String phuongPhap2;
	private String phuongPhap3;
	private String thoiGian1;
	private String thoiGian2;
	private String thoiGian3;
	private String thoiGian4;
	private String thoiGian5;
	private String thoiGian6;
	private String thoiGian7;
	private String thoiGian8;
	private String phanBo1;
	private String phanBo2;
	private String phanBo3;
	private String phanBo4;
	private String phanBo5;
	private String phanBo6;
	private String thiHocKi;
	private String thiTotNghiep;
	private String thucTap;
	private String yKienDeXuat;
	private String ngayTao;
	private String gioTao;
	private String ngayCapNhatCuoi;
	private String gioCapNhatCuoi;
	private String maNguoiTao;
	private String maNguoiDuyet;
	private String ngayDuyet;
	private String gioDuyet;
	private String tinhTrang;
	private String lyDoReject;
	private String ngayGui;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	private String tenNguoiTao;
	private String tenNguoiDuyet;
	private String tenTrinhDo;
	private String gioGui;
	
	public String getGioGui() {
		return gioGui;
	}
	public void setGioGui(String gioGui) {
		this.gioGui = gioGui;
	}
	public String getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(String ngayGui) {
		this.ngayGui = ngayGui;
	}
	private ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList1;
	private ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList2;
	private ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList3;
	
	public String getTenTrinhDo() {
		return tenTrinhDo;
	}
	public void setTenTrinhDo(String tenTrinhDo) {
		this.tenTrinhDo = tenTrinhDo;
	}

	
	
	public String getGioTao() {
		return gioTao;
	}
	public void setGioTao(String gioTao) {
		this.gioTao = gioTao;
	}
	public String getGioCapNhatCuoi() {
		return gioCapNhatCuoi;
	}
	public void setGioCapNhatCuoi(String gioCapNhatCuoi) {
		this.gioCapNhatCuoi = gioCapNhatCuoi;
	}
	public String getGioDuyet() {
		return gioDuyet;
	}
	public void setGioDuyet(String gioDuyet) {
		this.gioDuyet = gioDuyet;
	}
	public String getMaChuongTrinhDaoTao() {
		return maChuongTrinhDaoTao;
	}
	public void setMaChuongTrinhDaoTao(String maChuongTrinhDaoTao) {
		this.maChuongTrinhDaoTao = maChuongTrinhDaoTao;
	}
	
	public String getTenChuongTrinhDaoTao() {
		return tenChuongTrinhDaoTao;
	}
	public void setTenChuongTrinhDaoTao(String tenChuongTrinhDaoTao) {
		this.tenChuongTrinhDaoTao = tenChuongTrinhDaoTao;
	}
	public String getTenNghe() {
		return tenNghe;
	}
	public void setTenNghe(String tenNghe) {
		this.tenNghe = tenNghe;
	}
	public String getMaNghe() {
		return maNghe;
	}
	public void setMaNghe(String maNghe) {
		this.maNghe = maNghe;
	}
	public String getMaTrinhDo() {
		return maTrinhDo;
	}
	public void setMaTrinhDo(String maTrinhDo) {
		this.maTrinhDo = maTrinhDo;
	}
	public String getDoiTuong1() {
		return doiTuong1;
	}
	public void setDoiTuong1(String doiTuong1) {
		this.doiTuong1 = doiTuong1;
	}
	public String getDoiTuong2() {
		return doiTuong2;
	}
	public void setDoiTuong2(String doiTuong2) {
		this.doiTuong2 = doiTuong2;
	}
	public String getDoiTuong3() {
		return doiTuong3;
	}
	public void setDoiTuong3(String doiTuong3) {
		this.doiTuong3 = doiTuong3;
	}
	
	public String getMaQuyetDinh() {
		return maQuyetDinh;
	}
	public void setMaQuyetDinh(String maQuyetDinh) {
		this.maQuyetDinh = maQuyetDinh;
	}
	public String getBangCap() {
		return bangCap;
	}
	public void setBangCap(String bangCap) {
		this.bangCap = bangCap;
	}
	public String getSoLuongMonHoc() {
		return soLuongMonHoc;
	}
	public void setSoLuongMonHoc(String soLuongMonHoc) {
		this.soLuongMonHoc = soLuongMonHoc;
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
	public String getMucTieu5() {
		return mucTieu5;
	}
	public void setMucTieu5(String mucTieu5) {
		this.mucTieu5 = mucTieu5;
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
	public String getThoiGian1() {
		return thoiGian1;
	}
	public void setThoiGian1(String thoiGian1) {
		this.thoiGian1 = thoiGian1;
	}
	public String getThoiGian2() {
		return thoiGian2;
	}
	public void setThoiGian2(String thoiGian2) {
		this.thoiGian2 = thoiGian2;
	}
	public String getThoiGian3() {
		return thoiGian3;
	}
	public void setThoiGian3(String thoiGian3) {
		this.thoiGian3 = thoiGian3;
	}
	public String getThoiGian4() {
		return thoiGian4;
	}
	public void setThoiGian4(String thoiGian4) {
		this.thoiGian4 = thoiGian4;
	}
	public String getPhanBo1() {
		return phanBo1;
	}
	public void setPhanBo1(String phanBo1) {
		this.phanBo1 = phanBo1;
	}
	public String getPhanBo2() {
		return phanBo2;
	}
	public void setPhanBo2(String phanBo2) {
		this.phanBo2 = phanBo2;
	}
	public String getPhanBo3() {
		return phanBo3;
	}
	public void setPhanBo3(String phanBo3) {
		this.phanBo3 = phanBo3;
	}
	public String getPhanBo4() {
		return phanBo4;
	}
	public void setPhanBo4(String phanBo4) {
		this.phanBo4 = phanBo4;
	}
	public String getPhanBo5() {
		return phanBo5;
	}
	public void setPhanBo5(String phanBo5) {
		this.phanBo5 = phanBo5;
	}
	public String getPhanBo6() {
		return phanBo6;
	}
	public void setPhanBo6(String phanBo6) {
		this.phanBo6 = phanBo6;
	}
	public String getThiHocKi() {
		return thiHocKi;
	}
	public void setThiHocKi(String thiHocKi) {
		this.thiHocKi = thiHocKi;
	}
	public String getThiTotNghiep() {
		return thiTotNghiep;
	}
	public void setThiTotNghiep(String thiTotNghiep) {
		this.thiTotNghiep = thiTotNghiep;
	}
	public String getThucTap() {
		return thucTap;
	}
	public void setThucTap(String thucTap) {
		this.thucTap = thucTap;
	}
	public String getyKienDeXuat() {
		return yKienDeXuat;
	}
	public void setyKienDeXuat(String yKienDeXuat) {
		this.yKienDeXuat = yKienDeXuat;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getNgayCapNhatCuoi() {
		return ngayCapNhatCuoi;
	}
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi) {
		this.ngayCapNhatCuoi = ngayCapNhatCuoi;
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
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
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
	public String getThoiGian5() {
		return thoiGian5;
	}
	public void setThoiGian5(String thoiGian5) {
		this.thoiGian5 = thoiGian5;
	}
	public String getThoiGian6() {
		return thoiGian6;
	}
	public void setThoiGian6(String thoiGian6) {
		this.thoiGian6 = thoiGian6;
	}
	public String getThoiGian7() {
		return thoiGian7;
	}
	public void setThoiGian7(String thoiGian7) {
		this.thoiGian7 = thoiGian7;
	}
	public String getThoiGian8() {
		return thoiGian8;
	}
	public void setThoiGian8(String thoiGian8) {
		this.thoiGian8 = thoiGian8;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
	
	
	public ArrayList<ChiTietMonHocCTDTModel> getChiTietMonHocCTDTModelList1() {
		return chiTietMonHocCTDTModelList1;
	}
	public void setChiTietMonHocCTDTModelList1(
			ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList1) {
		this.chiTietMonHocCTDTModelList1 = chiTietMonHocCTDTModelList1;
	}
	public ArrayList<ChiTietMonHocCTDTModel> getChiTietMonHocCTDTModelList2() {
		return chiTietMonHocCTDTModelList2;
	}
	public void setChiTietMonHocCTDTModelList2(
			ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList2) {
		this.chiTietMonHocCTDTModelList2 = chiTietMonHocCTDTModelList2;
	}
	public ArrayList<ChiTietMonHocCTDTModel> getChiTietMonHocCTDTModelList3() {
		return chiTietMonHocCTDTModelList3;
	}
	public void setChiTietMonHocCTDTModelList3(
			ArrayList<ChiTietMonHocCTDTModel> chiTietMonHocCTDTModelList3) {
		this.chiTietMonHocCTDTModelList3 = chiTietMonHocCTDTModelList3;
	}
	public Boolean validateModel() {
		Boolean result = true;
		
		if (maQuyetDinh == null || maQuyetDinh.equals("")) {
			result = false;
		} else if (maNghe == null || maNghe.equals("")) {
			result = false;
		} else if (maTrinhDo == null || maTrinhDo.equals("")) {
			result = false;
		} else if (doiTuong1 == null || doiTuong1.equals("")) {
			result = false;
		} else if (soLuongMonHoc == null || soLuongMonHoc.equals("")) {
			result = false;
		} else if (bangCap == null || bangCap.equals("")) {
			result = false;
		} else if (mucTieu1 == null || mucTieu1.equals("")) {
			result = false;
		} else if (mucTieu2 == null || mucTieu2.equals("")) {
			result = false;
		} else if (mucTieu3 == null || mucTieu3.equals("")) {
			result = false;
		} else if (mucTieu4 == null || mucTieu4.equals("")) {
			result = false;
		} else if (mucTieu5 == null || mucTieu5.equals("")) {
			result = false;
		} else if (phuongPhap1 == null || phuongPhap1.equals("")) {
			result = false;
		} else if (phuongPhap2 == null || phuongPhap2.equals("")) {
			result = false;
		} else if (phuongPhap3 == null || phuongPhap3.equals("")) {
			result = false;
		} else if (thoiGian1 == null || thoiGian1.equals("")) {
			result = false;
		} else if (thoiGian2 == null || thoiGian2.equals("")) {
			result = false;
		} else if (thoiGian3 == null || thoiGian3.equals("")) {
			result = false;
		} else if (thoiGian4 == null || thoiGian4.equals("")) {
			result = false;
		} else if (thoiGian5 == null || thoiGian5.equals("")) {
			result = false;
		} else if (thoiGian6 == null || thoiGian6.equals("")) {
			result = false;
		} else if (thoiGian7 == null || thoiGian7.equals("")) {
			result = false;
		} else if (thoiGian8 == null || thoiGian8.equals("")) {
			result = false;
		} else if (phanBo1 == null || phanBo1.equals("")) {
			result = false;
		} else if (phanBo2 == null || phanBo2.equals("")) {
			result = false;
		} else if (phanBo3 == null || phanBo3.equals("")) {
			result = false;
		} else if (phanBo4 == null || phanBo4.equals("")) {
			result = false;
		} else if (thiHocKi == null || thiHocKi.equals("")) {
			result = false;
		} else if (thiTotNghiep == null || thiTotNghiep.equals("")) {
			result = false;
		} else if (thucTap == null || thucTap.equals("")) {
			result = false;
		} else if (yKienDeXuat == null || yKienDeXuat.equals("")) {
			result = false;	
		} else if(bangCap == null || bangCap.equals("")) {
			result = false;
		}
		for(ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList1) {
			if (!obj.validateModel()) {
				result = obj.validateModel();
				break;
			}
		}
		if(result) {
			for(ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList2) {
				if (!obj.validateModel()) {
					result = obj.validateModel();
					break;
				}
			}
			for(ChiTietMonHocCTDTModel obj : chiTietMonHocCTDTModelList3) {
				if (!obj.validateModel()) {
					result = obj.validateModel();
					break;
				}
			}
		}
		return result;
	}
	public String getKiHieu() {
		return kiHieu;
	}
	public void setKiHieu(String kiHieu) {
		this.kiHieu = kiHieu;
	}
	
}
