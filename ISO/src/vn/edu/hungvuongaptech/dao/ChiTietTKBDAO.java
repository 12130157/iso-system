package vn.edu.hungvuongaptech.dao;

import java.awt.List;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.TuanLeModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class ChiTietTKBDAO {
	public static Boolean insertChiTietTKB(ChiTietTKBModel chiTietTKBModel) {
		Boolean result = false;		
		String tenChuong = "", mucTieu = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertChiTietTKB(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_TKB", chiTietTKBModel.getMaThoiKhoaBieu());
			csmt.setString("Thu_trong_tuan", chiTietTKBModel.getThuTrongTuan());
			csmt.setNString("Buoi", chiTietTKBModel.getBuoi());
			csmt.setNString("Hinh_thuc_day", chiTietTKBModel.getHinhThucDay());		
			csmt.setString("Nhom", chiTietTKBModel.getNhom());
			csmt.setString("Ma_phong", chiTietTKBModel.getMaPhong());
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietTKBModel.getNgayCapNhatCuoi());
			csmt.setString("Ma_mon_hoc_TKB", chiTietTKBModel.getMaMonHocTKB());
			csmt.setString("So_thu_tu", chiTietTKBModel.getSoThuTu());
			csmt.setString("Tuan", chiTietTKBModel.getTuan());
			csmt.setString("Ngay_hoc", null);
			csmt.setString("STT_noi_dung", chiTietTKBModel.getsTTNoiDung());
			csmt.setString("Co_hieu", chiTietTKBModel.getCoHieu());
			csmt.setString("User1", chiTietTKBModel.getMaNamHoc());
			csmt.setString("User2", chiTietTKBModel.getTietBatDau());
			csmt.setString("User4", chiTietTKBModel.getUser4());
			csmt.setString("User5", chiTietTKBModel.getUser5());
			if(chiTietTKBModel.getTenChuong() == null) {
				csmt.setString("Ten_chuong", null);
				csmt.setString("User3", null);
			} else {
				tenChuong = chiTietTKBModel.getTenChuong().replace("-DAUNHAY-", "'");
				tenChuong = tenChuong.replace("-DAUNHAY1-", "\"");
				csmt.setNString("Ten_chuong", tenChuong.replace("<+++>", "\r\n"));
				csmt.setNString("User3", tenChuong.replace("<+++>", "\r\n"));
			}
			if(chiTietTKBModel.getMucTieu() == null || chiTietTKBModel.getMucTieu().equals("null"))
				csmt.setString("Muc_tieu", "");
				
			else {
				mucTieu = chiTietTKBModel.getMucTieu().replace("-DAUNHAY-", "'");
				mucTieu = mucTieu.replace("-DAUNHAY1-", "\"");
				csmt.setNString("Muc_tieu", mucTieu.replace("<+++>", "\r\n"));
			}
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				String id = csmt.getString("ID");
				chiTietTKBModel.setMaChiTietTKB(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean updateChiTietTKB(ChiTietTKBModel chiTietTKBModel) {
		Boolean result = false;	
		String tenChuong = "", mucTieu = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateChiTietTKB(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.setString("ID", chiTietTKBModel.getMaChiTietTKB());
			csmt.setString("Ma_TKB", chiTietTKBModel.getMaThoiKhoaBieu());
			csmt.setString("Thu_trong_tuan", chiTietTKBModel.getThuTrongTuan());
			csmt.setNString("Buoi", chiTietTKBModel.getBuoi());
			csmt.setNString("Hinh_thuc_day", chiTietTKBModel.getHinhThucDay());		
			csmt.setString("Nhom", chiTietTKBModel.getNhom());
			csmt.setString("Ma_phong", chiTietTKBModel.getMaPhong());
			csmt.setString("Ma_mon_hoc_TKB", chiTietTKBModel.getMaMonHocTKB());
			csmt.setString("So_thu_tu", chiTietTKBModel.getSoThuTu());
			csmt.setString("Tuan", chiTietTKBModel.getTuan());
			csmt.setString("Ngay_hoc", null);
			csmt.setString("Ngay_cap_nhat_cuoi", chiTietTKBModel.getNgayCapNhatCuoi());
			csmt.setString("STT_noi_dung", chiTietTKBModel.getsTTNoiDung());
			csmt.setString("Co_hieu", chiTietTKBModel.getCoHieu());
			csmt.setString("User1", chiTietTKBModel.getMaNamHoc());
			csmt.setString("User2", chiTietTKBModel.getTietBatDau());
			csmt.setString("User4", chiTietTKBModel.getUser4());
			csmt.setString("User5", chiTietTKBModel.getUser5());
			if(chiTietTKBModel.getTenChuong() == null) {
				csmt.setString("Ten_chuong", null);
				csmt.setString("User3", null);
			} else {
				tenChuong = chiTietTKBModel.getTenChuong().replace("-DAUNHAY-", "'");
				tenChuong = tenChuong.replace("-DAUNHAY1-", "\"");
				csmt.setString("Ten_chuong", tenChuong.replace("<+++>", "\r\n"));
				csmt.setString("User3", tenChuong.replace("<+++>", "\r\n"));
			}
			if(chiTietTKBModel.getMucTieu() == null || chiTietTKBModel.getMucTieu().equals("null"))
				csmt.setString("Muc_tieu", "");
			else {
				mucTieu = chiTietTKBModel.getMucTieu().replace("-DAUNHAY-", "'");
				mucTieu = mucTieu.replace("-DAUNHAY1-", "\"");
				csmt.setNString("Muc_tieu", mucTieu.replace("<+++>", "\r\n"));
			}
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean deleteChiTietTKB(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteChiTietTKB(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	
	public static ArrayList<ChiTietTKBModel> timChiTietTKB(String maThoiKhoaBieu) {
		ArrayList<ChiTietTKBModel> list = new ArrayList<ChiTietTKBModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getChiTietTKBByMaTKB"));
			preparedStatement.setString(1, maThoiKhoaBieu);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietTKBModel chiTietTKBModel = new ChiTietTKBModel();
				
				chiTietTKBModel.setMaChiTietTKB(rs.getString("MaChiTietTKB"));
				chiTietTKBModel.setMaThoiKhoaBieu(rs.getString("MaThoiKhoaBieu"));
				chiTietTKBModel.setBuoi(rs.getString("Buoi"));
				chiTietTKBModel.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				chiTietTKBModel.setNhom(rs.getString("Nhom"));
				chiTietTKBModel.setHinhThucDay(rs.getString("HinhThucDay"));
				chiTietTKBModel.setMaPhong(rs.getString("MaPhong"));
				chiTietTKBModel.setPhong(rs.getString("KiHieuPhong"));
				chiTietTKBModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				chiTietTKBModel.setUser1(rs.getString("User1"));
				chiTietTKBModel.setUser2(rs.getString("User2"));
				chiTietTKBModel.setUser3(rs.getString("User3"));
				chiTietTKBModel.setUser4(rs.getString("User4"));
				chiTietTKBModel.setUser5(rs.getString("User5"));
				
				list.add(chiTietTKBModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<ChiTietTKBModel> countSoTuanChiTietTKB() {
		ArrayList<ChiTietTKBModel> list = new ArrayList<ChiTietTKBModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getSoTuanMonHocTKB"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietTKBModel chiTietTKBModel = new ChiTietTKBModel();
				chiTietTKBModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				chiTietTKBModel.setSoTuan(rs.getString("SoTuan"));
				list.add(chiTietTKBModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//Lenh sql bi sua
	//code bi sua
	public static void getThuTrongTuanCuaMonHocByMaMonHocTKB(MonHocTKBModel monHocTKB) {
		ArrayList<ChiTietTKBModel> chiTietList = new ArrayList<ChiTietTKBModel>();
		String chuoiThu = "";
		String str = "";
		String chuoiPhongLT = "";
		String chuoiPhongTH = "";
		String chuoi = "";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThuTrongTuanCuaMonHocByMaMonHocTKB"));
			preparedStatement.setString(1, monHocTKB.getMaMonHocTKB());			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietTKBModel chiTiet = new ChiTietTKBModel();
				chiTiet.setMaChiTietTKB(rs.getString("MaChiTiet"));
				chiTiet.setBuoi(rs.getString("Buoi"));
				chiTiet.setCoHieu(rs.getString("CoHieu"));
				chiTiet.setHinhThucDay(rs.getString("HinhThucDay"));
				chiTiet.setsTTNoiDung(rs.getString("STTNoiDung"));
				chiTiet.setMaPhong(rs.getString("MaPhong"));
				chiTiet.setTuan(rs.getString("Tuan"));
				chiTiet.setSoThuTu(rs.getString("SoThuTu"));
				chiTiet.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				chiTiet.setNhom(rs.getString("Nhom"));
				chiTiet.setTietBatDau(rs.getString("TietBatDau"));
				if(rs.getString("TenChuong") != null) {
					chiTiet.setTenChuong(rs.getString("TenChuong").replaceAll("\r\n", "<+++>"));
					chiTiet.setTenChuong(chiTiet.getTenChuong().replace("'", "-DAUNHAY-"));
					chiTiet.setTenChuong(chiTiet.getTenChuong().replace("\"", "-DAUNHAY1-"));
				} else
					chiTiet.setTenChuong(rs.getString("TenChuong"));
				if(rs.getString("MucTieu") != null && !rs.getString("MucTieu").equals("")) {
					chiTiet.setMucTieu(rs.getString("MucTieu").replaceAll("\r\n", "<+++>"));
					chiTiet.setMucTieu(chiTiet.getMucTieu().replace("'", "-DAUNHAY-"));
					chiTiet.setMucTieu(chiTiet.getMucTieu().replace("\"", "-DAUNHAY1-"));
				} else
					chiTiet.setMucTieu(null);
				chuoi = rs.getString("Buoi") + "/" + rs.getString("ThuTrongTuan") + "/" + rs.getString("HinhThucDay");
				if(chuoiThu.matches(".*" + chuoi + ".*") == false)
				{
					chuoiThu += str + chuoi;
				}
				if(rs.getString("HinhThucDay").equals("LT")) {
					if(chuoiPhongLT.matches(".*" + rs.getNString("KiHieuPhong") + ".*") == false) {
						if(chuoiPhongLT.equals(""))
							chuoiPhongLT += rs.getNString("KiHieuPhong");
						else
							chuoiPhongLT += "-" + rs.getNString("KiHieuPhong");
					}
				} else {
					if(chuoiPhongTH.matches(".*" + rs.getNString("KiHieuPhong") + ".*") == false) {
						if(chuoiPhongTH.equals(""))
							chuoiPhongTH += rs.getNString("KiHieuPhong");
						else
							chuoiPhongTH += "-" + rs.getNString("KiHieuPhong");
					}
				}
				str = "-";
				chiTietList.add(chiTiet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		monHocTKB.setChuoiThuTrongTuan(chuoiThu);
		monHocTKB.setChuoiPhongLT(chuoiPhongLT);
		monHocTKB.setChuoiPhongTH(chuoiPhongTH);
		monHocTKB.setChiTietTKBModelList(chiTietList);
	}
	
	public static ArrayList<ChiTietTKBModel> getAllChiTietTKB() {
		ArrayList<ChiTietTKBModel> list = new ArrayList<ChiTietTKBModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllChiTietTKB"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietTKBModel chiTietTKBModel = new ChiTietTKBModel();
				
				chiTietTKBModel.setMaChiTietTKB(rs.getString("MaChiTietTKB"));
				chiTietTKBModel.setMaThoiKhoaBieu(rs.getString("MaThoiKhoaBieu"));
				chiTietTKBModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				chiTietTKBModel.setBuoi(rs.getString("Buoi"));
				chiTietTKBModel.setSoThuTu(rs.getString("SoThuTu"));
				chiTietTKBModel.setsTTNoiDung(rs.getString("STTNoiDung"));
				chiTietTKBModel.setTuan(rs.getString("Tuan"));
				chiTietTKBModel.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				chiTietTKBModel.setNhom(rs.getString("Nhom"));
				chiTietTKBModel.setHinhThucDay(rs.getString("HinhThucDay"));
				chiTietTKBModel.setMaPhong(rs.getString("MaPhong"));
				chiTietTKBModel.setPhong(rs.getString("KiHieuPhong"));
				chiTietTKBModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				chiTietTKBModel.setUser1(rs.getString("User1"));
				chiTietTKBModel.setUser2(rs.getString("User2"));
				chiTietTKBModel.setUser3(rs.getString("User3"));
				chiTietTKBModel.setUser4(rs.getString("User4"));
				chiTietTKBModel.setUser5(rs.getString("User5"));
				
				list.add(chiTietTKBModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public static ArrayList<String> getAllSoTuanByMaMonHocTKBAndMaTKB(String maMonHocTKB,String maTKB)
	{

		ArrayList<String> list = new ArrayList<String>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllSoTuanByMaMonHocTKBAndMaTKB"));
			preparedStatement.setString(1,maMonHocTKB);
			preparedStatement.setString(2,maTKB);
			
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				list.add(rs.getString("Tuan"));		
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}
	//Hàm này dùng để lấy chi tiết tất cả các phòng đã lên thời khóa biểu sử dụng
	public static ArrayList<ChiTietTKBModel> getAllSuDungPhongByNamHoc(String maNamHoc, String maMonHocTKB, String tuTuan, String denTuan) {
		ArrayList<ChiTietTKBModel> chiTietTKBModelList = new ArrayList<ChiTietTKBModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.GetAllSuDungPhongByNamHoc"));
			preparedStatement.setString(1, maNamHoc);
			preparedStatement.setString(2, tuTuan);
			preparedStatement.setString(3, denTuan);
			preparedStatement.setString(4, maMonHocTKB);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ChiTietTKBModel chiTietTKBModel = new ChiTietTKBModel();
				//chiTietTKBModel.setMaChiTietTKB(rs.getString("MaChiTietTKB"));
				chiTietTKBModel.setMaPhong(rs.getString("MaPhong"));
				chiTietTKBModel.setMaMonHoc(rs.getString("MaMonHoc"));
				//chiTietTKBModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				//chiTietTKBModel.setMaNamHoc(rs.getString("MaNamHoc"));
				chiTietTKBModel.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				chiTietTKBModel.setTuan(rs.getString("Tuan"));
				chiTietTKBModel.setBuoi(rs.getString("Buoi"));
				chiTietTKBModel.setMaGiaoVien(rs.getString("MaGiaoVien"));
				chiTietTKBModel.setSoTietHoc1Buoi(rs.getString("SoTiet1Buoi"));
				chiTietTKBModel.setTietBatDau(rs.getString("TietBatDau"));
				chiTietTKBModel.setMaLop(rs.getString("MaLop"));
				chiTietTKBModel.setNhom(rs.getString("Nhom"));
				//chiTietTKBModel.setUser1(rs.getString("User2"));
				//chiTietTKBModel.setUser1(rs.getString("User3"));
				//chiTietTKBModel.setUser1(rs.getString("User4"));
				//chiTietTKBModel.setUser1(rs.getString("User5"));
				
				chiTietTKBModelList.add(chiTietTKBModel);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return chiTietTKBModelList;
	}
	// tìm kiếm phòng
	public static ArrayList<ChiTietTKBModel> getLichSuDungPhongByDieuKien(String maPhong, String maNamHoc, 
				String kiHieuTuan, String maKhoa, String maMonHoc) {
		ArrayList<ChiTietTKBModel> list = new ArrayList<ChiTietTKBModel>();		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetLichSuDungPhong(?,?,?,?,?)}");		
			csmt.setString("Phong", maPhong);
			csmt.setString("Khoa", maKhoa);
			csmt.setString("Tuan", kiHieuTuan);
			csmt.setString("Nam_hoc", maNamHoc);
			csmt.setString("Mon_hoc", maMonHoc);
			
			ResultSet rs = DataUtil.executeStore(csmt);	
			while(rs.next()) {
				ChiTietTKBModel chiTietTKBModel = new ChiTietTKBModel();
				chiTietTKBModel.setPhong(rs.getString("KiHieuPhong"));
				chiTietTKBModel.setNhom(rs.getString("Nhom"));
				chiTietTKBModel.setTenGiaoVien(rs.getString("TenGiaoVien"));
				chiTietTKBModel.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				chiTietTKBModel.setTenMonHoc(rs.getString("TenMonHoc"));
				chiTietTKBModel.setBuoi(rs.getString("Buoi"));
				chiTietTKBModel.setKhoa(rs.getString("TenKhoa"));
				chiTietTKBModel.setKiHieuLop(rs.getString("KiHieuLop"));
				chiTietTKBModel.setNgayHoc(DateUtil.setDate(rs.getString("NgayHoc")));
				chiTietTKBModel.setSoThuTuTuan(rs.getString("SoThuTu"));
				chiTietTKBModel.setNgayBatDauTuan(rs.getString("NgayBatDauTuan"));
				chiTietTKBModel.setNgayKetThucTuan(rs.getString("NgayKetThucTuan"));
				list.add(chiTietTKBModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return list;
	}
	
	
	public static ArrayList<ChiTietTKBModel> getChiTietTKBByMaTKBAndMaMonHocTKB(String maTKB,String maMonHocTKB)
	{
		ArrayList<ChiTietTKBModel> arrayChiTiet=new ArrayList<ChiTietTKBModel>();
		ChiTietTKBModel chiTietTKBModel;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getChiTietTKBByMaTKBAndMaMonHocTKB"));
			preparedStatement.setString(1, maTKB);
			preparedStatement.setString(2, maMonHocTKB);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				chiTietTKBModel = new ChiTietTKBModel();
				chiTietTKBModel.setMaChiTietTKB(rs.getString("MaChiTietTKB"));
				chiTietTKBModel.setMaThoiKhoaBieu(rs.getString("MaThoiKhoaBieu"));
				chiTietTKBModel.setMaMonHocTKB(rs.getString("MaMonHocTKB"));
				chiTietTKBModel.setBuoi(rs.getString("Buoi"));
				chiTietTKBModel.setSoThuTu(rs.getString("SoThuTu"));
				chiTietTKBModel.setsTTNoiDung(rs.getString("STTNoiDung"));
				chiTietTKBModel.setTuan(rs.getString("Tuan"));
				chiTietTKBModel.setThuTrongTuan(rs.getString("ThuTrongTuan"));
				chiTietTKBModel.setNhom(rs.getString("Nhom"));
				chiTietTKBModel.setHinhThucDay(rs.getString("HinhThucDay"));
				chiTietTKBModel.setMaPhong(rs.getString("MaPhong"));
				chiTietTKBModel.setCoHieu(rs.getString("CoHieu"));
				chiTietTKBModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				chiTietTKBModel.setNgayHoc(DateUtil.setDate2(rs.getString("NgayHoc")));
				chiTietTKBModel.setPhong(rs.getString("KiHieuPhong"));
				chiTietTKBModel.setTenChuong(rs.getString("TenChuong"));
				chiTietTKBModel.setMucTieu(rs.getNString("MucTieu"));
				chiTietTKBModel.setUser1(rs.getString("User1"));
				chiTietTKBModel.setUser2(rs.getString("User2"));
				chiTietTKBModel.setUser3(rs.getString("User3"));
				chiTietTKBModel.setUser4(rs.getString("User4"));
				chiTietTKBModel.setUser5(rs.getString("User5"));
				arrayChiTiet.add(chiTietTKBModel);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}	
		
		return arrayChiTiet;
	}
	
	public static ArrayList<TuanLeModel> getTuanByMaTKBAndMaMonHocTKB(String maTKB,String maMonHocTKB)
	{
		ArrayList<TuanLeModel> tuanList=new ArrayList<TuanLeModel>();
		
		ArrayList<ChiTietTKBModel> chiTietTKBList=getChiTietTKBByMaTKBAndMaMonHocTKB(maTKB, maMonHocTKB);
		int i=0;
		String tempTuan="-1";
		TuanLeModel tuanModel;
		do{

			tuanModel=new TuanLeModel();
			if(!tempTuan.equals(chiTietTKBList.get(i).getTuan()))
			{
				tempTuan=chiTietTKBList.get(i).getTuan();
				tuanModel.setMaTuanLe(tempTuan);
				tuanModel.setTuNgay(chiTietTKBList.get(i).getNgayHoc());
				
				while(i<chiTietTKBList.size()&&tempTuan.equals(chiTietTKBList.get(i).getTuan())){
					i++;
				}
				i--;
				tuanModel.setDenNgay(DateUtil.setDate2(DateUtil.addDate("0",DateUtil.setDate(chiTietTKBList.get(i).getNgayHoc()))));
				tuanList.add(tuanModel);
			}
			
			
			i++;
		}
		while(i<chiTietTKBList.size());
		
		
		
		return tuanList;
	}
	
	public static ArrayList<ArrayList<ChiTietTKBModel>> getGroupNoiDungChiTietTKBByMaTKBAndMaMonHocTKB(String maTKB,String maMonHocTKB)
	{
		ArrayList<ArrayList<ChiTietTKBModel>> arrayList=new ArrayList<ArrayList<ChiTietTKBModel>>();
		ArrayList<ChiTietTKBModel> chiTietList1=getChiTietTKBByMaTKBAndMaMonHocTKB(maTKB, maMonHocTKB);
		ArrayList<ChiTietTKBModel> chiTietList2=new ArrayList<ChiTietTKBModel>();
		
		int i=0;
		String tempTuan="-1";
		do{
			tempTuan=chiTietList1.get(i).getTuan();

			String tempSTTND="-1";
			String coHieu="-1";
			chiTietList2=new ArrayList<ChiTietTKBModel>();
			while(i<chiTietList1.size()&&tempTuan.equals(chiTietList1.get(i).getTuan()))
			{
				if(!tempSTTND.equals(chiTietList1.get(i).getsTTNoiDung())){
					chiTietList2.add(chiTietList1.get(i));
					tempSTTND=chiTietList1.get(i).getsTTNoiDung();
					coHieu=chiTietList1.get(i).getCoHieu();
				}
				else if(tempSTTND.equals(chiTietList1.get(i).getsTTNoiDung())&&!coHieu.equals(chiTietList1.get(i).getCoHieu())){
					chiTietList2.add(chiTietList1.get(i));
					tempSTTND=chiTietList1.get(i).getsTTNoiDung();
					coHieu=chiTietList1.get(i).getCoHieu();
				}
				
				
				i++;
			}
			arrayList.add(chiTietList2);
			
		}
		while(i<chiTietList1.size());
		
		
		return arrayList;
	}
	
	
	public static ArrayList<ArrayList<ArrayList<ChiTietTKBModel>>> getGroupNhomChiTietTKBByMaTKBAndMaMonHocTKB(String maTKB,String maMonHocTKB)
	{
		ArrayList<ArrayList<ArrayList<ChiTietTKBModel>>> arrayArrayList=new ArrayList<ArrayList<ArrayList<ChiTietTKBModel>>>();
		ArrayList<ChiTietTKBModel> chiTietList1=getChiTietTKBByMaTKBAndMaMonHocTKB(maTKB, maMonHocTKB);
		ArrayList<ChiTietTKBModel> chiTietList2=new ArrayList<ChiTietTKBModel>();
		ArrayList<ArrayList<ChiTietTKBModel>> arrayList=new ArrayList<ArrayList<ChiTietTKBModel>>();
		
		int i=0;
		String tempTuan="-1";
		do{
			tempTuan=chiTietList1.get(i).getTuan();

			String tempSTTND="-1";
			
			chiTietList2=new ArrayList<ChiTietTKBModel>();

			arrayList=new ArrayList<ArrayList<ChiTietTKBModel>>();
			while(i<chiTietList1.size()&&tempTuan.equals(chiTietList1.get(i).getTuan())){
				
				tempSTTND=chiTietList1.get(i).getsTTNoiDung();
				String coHieu=chiTietList1.get(i).getCoHieu();
				chiTietList2=new ArrayList<ChiTietTKBModel>();
				String tempNhom="-1";
				while(i<chiTietList1.size()&&tempTuan.equals(chiTietList1.get(i).getTuan())&&tempSTTND.equals(chiTietList1.get(i).getsTTNoiDung())&&coHieu.equals(chiTietList1.get(i).getCoHieu())){
					
					if(!tempNhom.equals(chiTietList1.get(i).getNhom())){
						chiTietList2.add(chiTietList1.get(i));
						tempNhom=chiTietList1.get(i).getNhom();
						coHieu=chiTietList1.get(i).getCoHieu();
					}
					i++;
				}

				arrayList.add(chiTietList2);
			}
			arrayArrayList.add(arrayList);
			
		}
		while(i<chiTietList1.size());
		
		
		return arrayArrayList;
	}
	public static int capNhatTomTatNoiDung(String maChiTietTKB, String noiDung) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.capNhatTomTatNoiDung"));
			preparedStatement.setString(1, noiDung);
			preparedStatement.setString(2, maChiTietTKB);
			result = preparedStatement.executeUpdate();
			return result;
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
}
