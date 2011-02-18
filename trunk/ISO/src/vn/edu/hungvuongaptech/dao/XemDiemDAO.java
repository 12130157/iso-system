package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietDiemModel;
import vn.edu.hungvuongaptech.model.DangKyMonHocModel;
import vn.edu.hungvuongaptech.model.HocKyModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.NamHocModel;
import vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class XemDiemDAO {

	public static ArrayList<KhoaModel> getDieuKienXemDiemOfGiaoVien() {

		// TODO Auto-generated method stub
		String maKhoa = "na", maLop = "na", maNamHoc = "na", hocKi = "na";
		ArrayList<KhoaModel> khoaList = new ArrayList<KhoaModel>();
		ArrayList<LopHocModel> lopHocList = new ArrayList<LopHocModel>();
		ArrayList<NamHocModel> namHocList = new ArrayList<NamHocModel>();
		ArrayList<HocKyModel> hocKiList = new ArrayList<HocKyModel>();
		ArrayList<MonHocTKBModel> monHocTKBList = new ArrayList<MonHocTKBModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getDieuKienXemDiemOfGiaoVien"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				if(!maKhoa.equals(rs.getString("MaKhoa"))) {
					KhoaModel khoa = new KhoaModel();
					khoa.setMaKhoa(rs.getString("MaKhoa"));
					khoa.setTenKhoa(rs.getString("TenKhoa"));
					lopHocList = new ArrayList<LopHocModel>();
					khoa.setLopHocList(lopHocList);
					khoaList.add(khoa);
				}
				if(!maLop.equals(rs.getString("MaLop")) || !maKhoa.equals(rs.getString("MaKhoa"))) {
					LopHocModel lopHoc = new LopHocModel();
					lopHoc.setMaLopHoc(rs.getString("MaLop"));
					lopHoc.setKiHieu(rs.getString("KiHieuLop"));
					namHocList = new ArrayList<NamHocModel>();
					lopHoc.setNamHocList(namHocList);
					lopHocList.add(lopHoc);
				}
				if(!maNamHoc.equals(rs.getString("MaNamHoc")) || !maLop.equals(rs.getString("MaLop")) || !maKhoa.equals(rs.getString("MaKhoa"))) {
					NamHocModel namHoc = new NamHocModel();
					namHoc.setMaNamHoc(rs.getString("MaNamHoc"));
					namHoc.setNamBatDau(rs.getString("NamBatDau"));
					namHoc.setNamKetThuc(rs.getString("NamKetThuc"));
					hocKiList = new ArrayList<HocKyModel>();
					namHoc.setHocKyList(hocKiList);
					namHocList.add(namHoc);
				}
				if(!hocKi.equals(rs.getString("HocKy")) || !maNamHoc.equals(rs.getString("MaNamHoc")) || !maLop.equals(rs.getString("MaLop")) || !maKhoa.equals(rs.getString("MaKhoa"))) {
					HocKyModel hocKy = new HocKyModel();
					hocKy.setHocKy(rs.getString("HocKy"));
					monHocTKBList = new ArrayList<MonHocTKBModel>();
					hocKy.setMonHocTKBList(monHocTKBList);
					hocKiList.add(hocKy);
				}
				MonHocTKBModel monHocTKB = new MonHocTKBModel();
				monHocTKB.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				monHocTKB.setMaMonHoc(rs.getString("MaMonHoc"));
				monHocTKB.setTenMonHoc(rs.getString("TenMonHoc"));
				monHocTKB.setHocKi(rs.getString("HocKy"));
				monHocTKB.setMaGiaoVien(rs.getString("MaThanhVien"));
				monHocTKB.setTenGiaoVien(rs.getString("Ho") + " " + rs.getString("TenLot") + " " + rs.getString("Ten"));
				monHocTKBList.add(monHocTKB);
				maKhoa = rs.getString("MaKhoa");
				maLop = rs.getString("MaLop");
				maNamHoc = rs.getString("MaNamHoc");
				hocKi = rs.getString("HocKy");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return khoaList;
	}
	

	

	public static ArrayList<ThoiKhoaBieuModel> getDieuKienXemDiemOfSinhVien(String maLop) {
		
		ArrayList<ThoiKhoaBieuModel> thoiKhoaBieuList = new ArrayList<ThoiKhoaBieuModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getDieuKienXemDiemOfSinhVien"));
			preparedStatement.setString(1, maLop);
			preparedStatement.setString(2, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThoiKhoaBieuModel thoiKhoaBieu = new ThoiKhoaBieuModel();
				thoiKhoaBieu.setMaLop(rs.getString("MaLop"));
				thoiKhoaBieu.setKiHieuLop(rs.getString("KiHieu"));
				thoiKhoaBieu.setHocKi(rs.getString("HocKi"));
				thoiKhoaBieu.setMaSinhVien(rs.getString("MaThanhVien"));
				thoiKhoaBieu.setTenSinhVien(rs.getString("HoTV") + " " + rs.getString("Tenlot") + " " + rs.getString("TenTV"));
				
				thoiKhoaBieuList.add(thoiKhoaBieu);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}	
		return thoiKhoaBieuList;
	}
	
	public static ArrayList<DangKyMonHocModel> getShowDiem(String maMonHocTKB) {
		// TODO Auto-generated method stub
		String maDangKyMonHoc = "na", maChiTietDiem = "na";
		
		ArrayList<DangKyMonHocModel> dangKyMonHocList = new ArrayList<DangKyMonHocModel>();
		ArrayList<ChiTietDiemModel> chiTietDiemList = new ArrayList<ChiTietDiemModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getShowDiem"));
			preparedStatement.setString(1, maMonHocTKB);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				// Bang dang ky mon hoc
				if(!maDangKyMonHoc.equals(rs.getString("MaDangKyMonHoc")))
				{
					DangKyMonHocModel dangKyMonHoc = new DangKyMonHocModel();
					
					dangKyMonHoc.setDiemTrungBinh(rs.getString("DiemTrungBinh"));
					dangKyMonHoc.setHanhKiem(rs.getString("HanhKiem"));
					dangKyMonHoc.setHocLuc(rs.getString("HocLuc"));
					dangKyMonHoc.setDanhHieu(rs.getString("DanhHieu"));
					dangKyMonHoc.setMaDangKyMonHoc(rs.getString("MaDangKyMonHoc"));
					//dangKyMonHoc.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
					dangKyMonHoc.setMaHocVien(rs.getString("MaHocVien"));
					dangKyMonHoc.setTenDangNhap(rs.getString("TenDangNhap"));
					chiTietDiemList = new ArrayList<ChiTietDiemModel>();
					dangKyMonHoc.setChiTietDiemList(chiTietDiemList);
					dangKyMonHoc.setTenHocVien(rs.getString("Ho") + " " + rs.getString("TenLot") + " " + rs.getString("Ten"));
					
					maDangKyMonHoc = rs.getString("MaDangKyMonHoc");
					dangKyMonHocList.add(dangKyMonHoc);
				}
				// Bang chi tiet diem
				if(rs.getString("MaChiTietDiem") != null) {
					if(!maChiTietDiem.equals(rs.getString("MaChiTietDiem"))) {
						ChiTietDiemModel chiTietDiem = new ChiTietDiemModel();
						//chiTietDiem.setMaDangKyMonHoc(rs.getString("MaDangKyMonHoc"));
						chiTietDiem.setMaBaiKiemTra(rs.getString("MaBaiKiemTra"));
						chiTietDiem.setMaChiTietDiem(rs.getString("MaChiTietDiem"));
						chiTietDiem.setDiem(rs.getString("Diem"));
						
						maChiTietDiem = rs.getString("MaChiTietDiem");
						chiTietDiemList.add(chiTietDiem);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dangKyMonHocList;
	}
	public static ArrayList<DangKyMonHocModel> getShowDiemSinhVien(String maHocVien, String hocKi, String maLop) {
		// TODO Auto-generated method stub
		String maDangKyMonHoc = "na", maChiTietDiem = "na";
		
		ArrayList<DangKyMonHocModel> dangKyMonHocList = new ArrayList<DangKyMonHocModel>();
		ArrayList<ChiTietDiemModel> chiTietDiemList = new ArrayList<ChiTietDiemModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getShowDiemSinhVien"));
			preparedStatement.setString(1, maHocVien);
			preparedStatement.setString(2, hocKi);
			preparedStatement.setString(3, maLop);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				// Bang dang ky mon hoc
				if(!maDangKyMonHoc.equals(rs.getString("MaDangKyMonHoc")))
				{
					DangKyMonHocModel dangKyMonHoc = new DangKyMonHocModel();
					
					dangKyMonHoc.setDiemTrungBinh(rs.getString("DiemTrungBinh"));
					dangKyMonHoc.setHanhKiem(rs.getString("HanhKiem"));
					dangKyMonHoc.setHocLuc(rs.getString("HocLuc"));
					dangKyMonHoc.setDanhHieu(rs.getString("DanhHieu"));
					//dangKyMonHoc.setMaDangKyMonHoc(rs.getString("MaDangKyMonHoc"));
					//dangKyMonHoc.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
					dangKyMonHoc.setTenMonHoc(rs.getString("TenMonHoc"));
					chiTietDiemList = new ArrayList<ChiTietDiemModel>();
					dangKyMonHoc.setChiTietDiemList(chiTietDiemList);
					
					maDangKyMonHoc = rs.getString("MaDangKyMonHoc");
					dangKyMonHocList.add(dangKyMonHoc);
				}
				// Bang chi tiet diem
				if(rs.getString("MaChiTietDiem") != null) {
					if(!maChiTietDiem.equals(rs.getString("MaChiTietDiem"))) {
						ChiTietDiemModel chiTietDiem = new ChiTietDiemModel();
						//chiTietDiem.setMaDangKyMonHoc(rs.getString("MaDangKyMonHoc"));
						chiTietDiem.setTenBaiKiemTra(rs.getString("TenBaiKiemTra"));
						chiTietDiem.setMaChiTietDiem(rs.getString("MaChiTietDiem"));
						chiTietDiem.setDiem(rs.getString("Diem"));
						
						maChiTietDiem = rs.getString("MaChiTietDiem");
						chiTietDiemList.add(chiTietDiem);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dangKyMonHocList;
	}
}
