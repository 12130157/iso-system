package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.SoLenLopModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class SoLenLopDAO {
	public static SoLenLopModel getBangTomTatNoiDungByMaTKB(String maTKB, String maGiaoVien){
		SoLenLopModel soLenLop = new SoLenLopModel();
		int count = 0;
		String maSoLenLop = "na", maMonHocTKB = "na", maChiTietTKB = "na";
		ArrayList<MonHocTKBModel> monHocTKBList = new ArrayList<MonHocTKBModel>();
		ArrayList<ChiTietTKBModel> chiTietTKBList = new ArrayList<ChiTietTKBModel>();
		ChiTietTKBModel chiTietTKB = new ChiTietTKBModel();
		ResultSet rs = null;
		try {
			if(maGiaoVien.equals("")) {
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("iso.sql.getSoLenLopByMaTKB"));
				preparedStatement.setString(1, maTKB);
				preparedStatement.setString(2, maTKB);
				rs = preparedStatement.executeQuery();
			} else {
				PreparedStatement preparedStatement = DataUtil
				.getConnection()
				.prepareStatement(
						Constant.SQL_RES
								.getString("iso.sql.getSoLenLopByMaTKBAndMaGiaoVien"));
				preparedStatement.setString(1, maTKB);
				preparedStatement.setString(2, maTKB);
				preparedStatement.setString(3, maGiaoVien);
				rs = preparedStatement.executeQuery();
			}
			while(rs.next()) {
				if(!rs.getString("MaSoLenLop").equals(maSoLenLop)) {
					soLenLop.setMaTKB(rs.getString("MaTKB"));
					soLenLop.setMaSoLenLop(rs.getString("MaSoLenLop"));
					soLenLop.setTenNghe(rs.getString("TenNghe"));
					soLenLop.setTenTrinhDo(rs.getString("TenTrinhDo"));
					soLenLop.setKhoa(rs.getString("Khoa"));
					soLenLop.setKiHieuLop(rs.getString("KiHieuLop"));
					soLenLop.setNamBatDau(rs.getString("NamBatDau"));
					monHocTKBList = new ArrayList<MonHocTKBModel>();
					soLenLop.setMonHocTKBList(monHocTKBList);
					maSoLenLop = soLenLop.getMaSoLenLop();
				}
				if(!rs.getString("MaMonHocTKB").equals(maMonHocTKB)) {
					MonHocTKBModel monHocTKB = new MonHocTKBModel();
					monHocTKB.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
					monHocTKB.setMaGiaoVien(rs.getString("MaGiaoVien"));
					monHocTKB.setTenGiaoVien(rs.getNString("TenGiaoVien"));
					monHocTKB.setMaMonHoc(rs.getString("MaMonHoc"));
					monHocTKB.setTenMonHoc(rs.getNString("TenMonHoc"));
					maMonHocTKB = monHocTKB.getMaMonHocTKB();
					chiTietTKBList = new ArrayList<ChiTietTKBModel>();
					monHocTKB.setChiTietTKBModelList(chiTietTKBList);
					monHocTKBList.add(monHocTKB);
				}
				if(!rs.getString("MaChiTietTKB").equals(maChiTietTKB)) {
					if(!maChiTietTKB.equals("na"))
						chiTietTKB.setSoSVVangMat(count + "");
					count = 0;
					chiTietTKB = new ChiTietTKBModel();
					chiTietTKB.setMaChiTietTKB(rs.getString("MaChiTietTKB"));
					chiTietTKB.setCoHieu(rs.getString("CoHieu"));
					chiTietTKB.setSoTietHoc1Buoi(rs.getString("SoTiet"));
					chiTietTKB.setNoiDungBaiDay(rs.getNString("NoiDungBaiDay"));
					chiTietTKB.setNgayHoc(rs.getString("NgayHoc"));
					chiTietTKBList.add(chiTietTKB);
					maChiTietTKB = chiTietTKB.getMaChiTietTKB();
				}
				if(rs.getString("TinhTrangDiHoc").equals("4"))
					chiTietTKB.setTinhTrangDiDay("1");
				else
					count++;                                    
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		chiTietTKB.setSoSVVangMat(count + "");
		return soLenLop;
	}
}
