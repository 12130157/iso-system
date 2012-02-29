package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietDiemModel;
import vn.edu.hungvuongaptech.model.DangKyMonHocModel;
import vn.edu.hungvuongaptech.model.SoDiemMonHocModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class SoDiemMonHocDAO {
	public static SoDiemMonHocModel getSoDiemMonHocByMaMonHocTKB(String maMonHocTKB) {
		// TODO Auto-generated method stub
		SoDiemMonHocModel soDiemMonHoc = new SoDiemMonHocModel();
		String maDangKyMonHoc = "na", maChiTietDiem = "na";
		
		ArrayList<DangKyMonHocModel> dangKyMonHocList = new ArrayList<DangKyMonHocModel>();
		ArrayList<ChiTietDiemModel> chiTietDiemList = new ArrayList<ChiTietDiemModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.getSoDiemMonHocByMaMonHocTKB"));
			preparedStatement.setString(1, maMonHocTKB);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				// Bang dang ky mon hoc
				//dangKyMonHoc.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				soDiemMonHoc.setMaSoDiemMonHoc(rs.getString("MaSoDiemMonHoc"));
				soDiemMonHoc.setTinhTrang(rs.getString("TinhTrang"));
				if(!maDangKyMonHoc.equals(rs.getString("MaDangKyMonHoc")))
				{
					DangKyMonHocModel dangKyMonHoc = new DangKyMonHocModel();
					
					dangKyMonHoc.setMaDangKyMonHoc(rs.getString("MaDangKyMonHoc"));
					dangKyMonHoc.setMaHocVien(rs.getString("MaHocVien"));
					dangKyMonHoc.setTenHocVien(rs.getNString("HoTenSinhVien"));
					dangKyMonHoc.setDiemTrungBinh(rs.getString("DiemTBMon"));
					chiTietDiemList = new ArrayList<ChiTietDiemModel>();
					dangKyMonHoc.setChiTietDiemList(chiTietDiemList);
					
					maDangKyMonHoc = rs.getString("MaDangKyMonHoc");
					dangKyMonHocList.add(dangKyMonHoc);
				}
				// Bang chi tiet diem
				if(rs.getString("MaChiTietDiem") != null) {
					if(!maChiTietDiem.equals(rs.getString("MaChiTietDiem"))) {
						ChiTietDiemModel chiTietDiem = new ChiTietDiemModel();
						chiTietDiem.setMaDangKyMonHoc(rs.getString("MaDangKyMonHoc"));
						chiTietDiem.setMaBaiKiemTra(rs.getString("MaBaiKiemTra"));
						chiTietDiem.setMaChiTietDiem(rs.getString("MaChiTietDiem"));
						chiTietDiem.setDiem(rs.getString("Diem"));
						maChiTietDiem = rs.getString("MaChiTietDiem");
						chiTietDiemList.add(chiTietDiem);
					}
				}
			}
			soDiemMonHoc.setDangKyMonHocList(dangKyMonHocList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return soDiemMonHoc;
	}
	public static SoDiemMonHocModel getSoDiemMonHocByMaMonHocTKBSimple(String maMonHocTKB) {
		// TODO Auto-generated method stub
		SoDiemMonHocModel soDiemMonHoc = new SoDiemMonHocModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.getSoDiemMonHocByMaMonHocTKBSimple"));
			preparedStatement.setString(1, maMonHocTKB);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				// Bang dang ky mon hoc
				//dangKyMonHoc.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				soDiemMonHoc.setNamHoc(rs.getString("NamHoc"));
				soDiemMonHoc.setTenChuyenNganh(rs.getNString("TenChuyenNganh"));
				soDiemMonHoc.setTenGiaoVien(rs.getNString("TenGiaoVien"));
				soDiemMonHoc.setTenMonHoc(rs.getNString("TenMonHoc"));
				soDiemMonHoc.setKiHieuLop(rs.getNString("KiHieuLop"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return soDiemMonHoc;
	}
	public static int guiSoDiemMonHocChoGVCN(String maSoDiem) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("XemDiem.sql.guiSoDiemMonHocChoGVCN"));
			preparedStatement.setString(1, maSoDiem);
			result = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
}
