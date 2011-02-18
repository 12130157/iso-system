package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.MoChuyenNganhModel;
import vn.edu.hungvuongaptech.model.QuyetDinhModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class QuyetDinhDAO {
	public static ArrayList<QuyetDinhModel> getAllQuyetDinh() {
		ArrayList<QuyetDinhModel> quyetDinhModelList = new ArrayList<QuyetDinhModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllQuyetDinh"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				QuyetDinhModel quyetDinhModel = new QuyetDinhModel();
				
				quyetDinhModel.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				quyetDinhModel.setMaKHDT(rs.getString("MaKHDT"));
				quyetDinhModel.setKiHieu(rs.getString("KiHieu"));
				quyetDinhModel.setTenQuyetDinh(rs.getString("TenQuyetDinh"));
				quyetDinhModel.setMaKhoa(rs.getString("MaKhoa"));
				quyetDinhModel.setNamBatDau(rs.getString("NamBatDau"));
				quyetDinhModel.setMaHeDaoTao(rs.getString("MaHeDaoTao"));
				quyetDinhModel.setTenHeDaoTao(rs.getString("TenHeDaoTao"));
				quyetDinhModel.setSoNamDaoTao(rs.getString("SoNamDaoTao"));
				quyetDinhModel.setThongTinChung(rs.getString("ThongTinChung"));
				quyetDinhModel.setDieuMot(rs.getString("DieuMot"));
				quyetDinhModel.setTuThang(rs.getString("TuThang"));
				quyetDinhModel.setDenThang(rs.getString("DenThang"));
				quyetDinhModel.setMaNguoiLap(rs.getString("MaNguoiLap"));
				quyetDinhModel.setTenNguoiLap(rs.getString("TenNguoiLap"));
				quyetDinhModel.setNgayLap(rs.getString("NgayLap"));
				quyetDinhModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				quyetDinhModel.setTenNguoiDuyet(rs.getString("TenNguoiDuyet"));
				quyetDinhModel.setNgayDuyet(rs.getString("NgayDuyet"));
				quyetDinhModel.setTinhTrang(rs.getString("TinhTrang"));
				quyetDinhModel.setNoiNhan(rs.getString("NoiNhan"));
				quyetDinhModel.setQuyetDinhSo(rs.getString("QuyetDinhSo"));
				quyetDinhModel.setNgayRaQuyetDinh(rs.getString("NgayRaQD"));
				quyetDinhModel.setTongSoHocSinh(rs.getString("TongSoHocSinh"));
				quyetDinhModel.setTongSoChuyenNganh(rs.getString("TongSoChuyenNganh"));
				quyetDinhModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				quyetDinhModel.setUser1(rs.getString("User1"));
				quyetDinhModel.setUser2(rs.getString("User2"));
				quyetDinhModel.setUser3(rs.getString("User3"));
				quyetDinhModel.setUser4(rs.getString("User4"));
				quyetDinhModel.setUser5(rs.getString("User5"));			
				quyetDinhModel.setLyDoReject(rs.getString("LyDoReject"));
				
				quyetDinhModelList.add(quyetDinhModel);
			}
			return quyetDinhModelList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<QuyetDinhModel> getAllQuyetDinhByNguoiLap(String maNguoiLap) {
		ArrayList<QuyetDinhModel> quyetDinhModelList = new ArrayList<QuyetDinhModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllQuyetDinhByNguoiLap"));
			preparedStatement.setString(1, maNguoiLap);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				QuyetDinhModel quyetDinhModel = new QuyetDinhModel();
				
				quyetDinhModel.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				quyetDinhModel.setMaKHDT(rs.getString("MaKHDT"));
				quyetDinhModel.setKiHieu(rs.getString("KiHieu"));
				quyetDinhModel.setTenQuyetDinh(rs.getString("TenQuyetDinh"));
				quyetDinhModel.setMaKhoa(rs.getString("MaKhoa"));
				quyetDinhModel.setNamBatDau(rs.getString("NamBatDau"));
				quyetDinhModel.setMaHeDaoTao(rs.getString("MaHeDaoTao"));
				quyetDinhModel.setTenHeDaoTao(rs.getString("TenHeDaoTao"));
				quyetDinhModel.setSoNamDaoTao(rs.getString("SoNamDaoTao"));
				quyetDinhModel.setThongTinChung(rs.getString("ThongTinChung"));
				quyetDinhModel.setDieuMot(rs.getString("DieuMot"));
				quyetDinhModel.setTuThang(rs.getString("TuThang"));
				quyetDinhModel.setDenThang(rs.getString("DenThang"));
				quyetDinhModel.setMaNguoiLap(rs.getString("MaNguoiLap"));
				quyetDinhModel.setTenNguoiLap(rs.getString("TenNguoiLap"));
				quyetDinhModel.setNgayLap(rs.getString("NgayLap"));
				quyetDinhModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				quyetDinhModel.setTenNguoiDuyet(rs.getString("TenNguoiDuyet"));
				quyetDinhModel.setNgayDuyet(rs.getString("NgayDuyet"));
				quyetDinhModel.setTinhTrang(rs.getString("TinhTrang"));
				quyetDinhModel.setNoiNhan(rs.getString("NoiNhan"));
				quyetDinhModel.setQuyetDinhSo(rs.getString("QuyetDinhSo"));
				quyetDinhModel.setNgayRaQuyetDinh(rs.getString("NgayRaQD"));
				quyetDinhModel.setTongSoHocSinh(rs.getString("TongSoHocSinh"));
				quyetDinhModel.setTongSoChuyenNganh(rs.getString("TongSoChuyenNganh"));
				quyetDinhModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				quyetDinhModel.setUser1(rs.getString("User1"));
				quyetDinhModel.setUser2(rs.getString("User2"));
				quyetDinhModel.setUser3(rs.getString("User3"));
				quyetDinhModel.setUser4(rs.getString("User4"));
				quyetDinhModel.setUser5(rs.getString("User5"));			
				quyetDinhModel.setLyDoReject(rs.getString("LyDoReject"));
				
				quyetDinhModelList.add(quyetDinhModel);
			}
			return quyetDinhModelList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static QuyetDinhModel getQuyetDinhByMaQuyetDinh(String maQuyetDinh) {
		QuyetDinhModel quyetDinhModel = new QuyetDinhModel();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetQuyetDinhByMaQuyetDinh"));
			preparedStatement.setString(1, maQuyetDinh);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				quyetDinhModel.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				quyetDinhModel.setMaKHDT(rs.getString("MaKHDT"));
				quyetDinhModel.setKiHieu(rs.getString("KiHieu"));
				quyetDinhModel.setTenQuyetDinh(rs.getString("TenQuyetDinh"));
				quyetDinhModel.setMaKhoa(rs.getString("MaKhoa"));
				quyetDinhModel.setNamBatDau(rs.getString("NamBatDau"));
				quyetDinhModel.setMaHeDaoTao(rs.getString("MaHeDaoTao"));
				quyetDinhModel.setTenHeDaoTao(rs.getString("TenHeDaoTao"));
				quyetDinhModel.setSoNamDaoTao(rs.getString("SoNamDaoTao"));
				quyetDinhModel.setThongTinChung(rs.getString("ThongTinChung"));
				quyetDinhModel.setDieuMot(rs.getString("DieuMot"));
				quyetDinhModel.setTuThang(rs.getString("TuThang"));
				quyetDinhModel.setDenThang(rs.getString("DenThang"));
				quyetDinhModel.setMaNguoiLap(rs.getString("MaNguoiLap"));
				quyetDinhModel.setTenNguoiLap(rs.getString("TenNguoiLap"));
				quyetDinhModel.setNgayLap(rs.getString("NgayLap"));
				quyetDinhModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				quyetDinhModel.setTenNguoiDuyet(rs.getString("TenNguoiDuyet"));
				quyetDinhModel.setNgayDuyet(rs.getString("NgayDuyet"));
				quyetDinhModel.setTinhTrang(rs.getString("TinhTrang"));
				quyetDinhModel.setNoiNhan(rs.getString("NoiNhan"));
				quyetDinhModel.setQuyetDinhSo(rs.getString("QuyetDinhSo"));
				quyetDinhModel.setNgayRaQuyetDinh(rs.getString("NgayRaQD"));
				quyetDinhModel.setTongSoHocSinh(rs.getString("TongSoHocSinh"));
				quyetDinhModel.setTongSoChuyenNganh(rs.getString("TongSoChuyenNganh"));
				quyetDinhModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				quyetDinhModel.setGioLap(rs.getString("GioLap"));
				quyetDinhModel.setGioDuyet(rs.getString("GioDuyet"));
				quyetDinhModel.setGioCapNhat(rs.getString("GioCapNhat"));
				quyetDinhModel.setUser1(rs.getString("User1"));
				quyetDinhModel.setUser2(rs.getString("User2"));
				quyetDinhModel.setUser3(rs.getString("User3"));
				quyetDinhModel.setUser4(rs.getString("User4"));
				quyetDinhModel.setUser5(rs.getString("User5"));			
				quyetDinhModel.setLyDoReject(rs.getString("LyDoReject"));
				
				ArrayList<MoChuyenNganhModel> moChuyenNganhList = MoChuyenNganhDAO.getMoChuyenNganhByMaQuyetDinh(rs.getString("MaQuyetDinh"));
				quyetDinhModel.setMoChuyenNganhList(moChuyenNganhList);
				Constant.NUM_ROWS = moChuyenNganhList.size();
			}
			return quyetDinhModel;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int duyetQuyetDinh(String maNguoiDuyet, String maQuyetDinh, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.duyetQuyetDinhByMaQuyetDinh"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maQuyetDinh);
			result = preparedStatement.executeUpdate();
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	
	public static Boolean checkNamAndHeDaoTaoOfQuyetDinh(String namBatDau, String maHeDaoTao) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_FindQuyetDinhByYearAndHeDaoTao(?,?,?)}");
			csmt.setString("Nam", namBatDau);
			csmt.setString("HeDaoTao", maHeDaoTao);
			csmt.registerOutParameter("result", java.sql.Types.VARCHAR);
			if (DataUtil.executeNonStore(csmt)) {
				String kq = csmt.getString("result");
				if (kq.equals("1")) {
					result = false;
				}
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static Boolean updateQuyetDinh(QuyetDinhModel quyetDinhModel){
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateQuyetDinhMoLop(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", quyetDinhModel.getMaQuyetDinh());
			csmt.setString("Ten", quyetDinhModel.getTenQuyetDinh());
			csmt.setString("Ma_KHDT", quyetDinhModel.getMaKHDT());
			csmt.setNString("Ki_hieu", quyetDinhModel.getKiHieu());
			csmt.setString("Ma_khoa", quyetDinhModel.getMaKhoa());
			csmt.setString("Nam_bat_dau", quyetDinhModel.getNamBatDau());
			csmt.setString("Ma_he_dao_tao", quyetDinhModel.getMaHeDaoTao());			
			csmt.setNString("Thong_tin_chung", quyetDinhModel.getThongTinChung());
			csmt.setNString("Dieu_mot", quyetDinhModel.getDieuMot());
			csmt.setNString("Tu_thang", quyetDinhModel.getTuThang());
			csmt.setNString("Den_thang", quyetDinhModel.getDenThang());
			csmt.setString("Ma_nguoi_lap", quyetDinhModel.getMaNguoiLap());
			csmt.setString("Ma_nguoi_duyet", null);
			//csmt.setString("Ngay_duyet", null);
			csmt.setString("Tinh_trang", quyetDinhModel.getTinhTrang());
			csmt.setNString("Noi_nhan", quyetDinhModel.getNoiNhan());
			csmt.setString("Quyet_dinh_so", quyetDinhModel.getQuyetDinhSo());
			csmt.setString("Ngay_ra_QD_UBND", DateUtil.setDate(quyetDinhModel.getNgayRaQuyetDinh()));
			csmt.setString("Tong_so_hoc_sinh", quyetDinhModel.getTongSoHocSinh());
			csmt.setString("Tong_so_chuyen_nganh", quyetDinhModel.getTongSoChuyenNganh());		
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);
			csmt.setNString("Ly_do_reject", null);
			csmt.setString("User1", quyetDinhModel.getUser1());
			csmt.setString("User2", quyetDinhModel.getUser2());
			csmt.setString("User3", quyetDinhModel.getUser3());
			csmt.setString("User4", quyetDinhModel.getUser4());
			csmt.setString("User5", quyetDinhModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update "Quyet Dinh" thanh cong
				quyetDinhModel.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi").toString());
				
				ArrayList<MoChuyenNganhModel> moChuyenNganhList = quyetDinhModel.getMoChuyenNganhList();
				ArrayList<MoChuyenNganhModel> moChuyenNganhListAfterUpdated = new ArrayList<MoChuyenNganhModel>();
				for (MoChuyenNganhModel obj : moChuyenNganhList) {	
					if (obj.getId() != null) { // Cap nhat "Quyet Dinh" da ton tai
						MoChuyenNganhDAO.updateMoChuyenNganh(obj);
					} else { // Them moi "Quyet Dinh"
						obj.setMaQuyetDinh(quyetDinhModel.getMaQuyetDinh());
						MoChuyenNganhDAO.insertMoChuyenNganh(obj);
					}
					
					moChuyenNganhListAfterUpdated.add(obj);
				}
				
				quyetDinhModel.setMoChuyenNganhList(moChuyenNganhListAfterUpdated);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static Boolean insertQuyetDinh(QuyetDinhModel quyetDinhModel){
		Boolean result = false;
		String maQuyetDinhNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertQuyetDinhMoLop(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Ma_ke_hoach", quyetDinhModel.getMaKHDT());
			csmt.setNString("Ki_hieu", quyetDinhModel.getKiHieu());
			csmt.setString("Ma_khoa", quyetDinhModel.getMaKhoa());
			csmt.setString("Nam_bat_dau", quyetDinhModel.getNamBatDau());
			csmt.setString("Ma_he_dao_tao", quyetDinhModel.getMaHeDaoTao());			
			csmt.setNString("Thong_tin_chung", quyetDinhModel.getThongTinChung());
			csmt.setNString("Dieu_mot", quyetDinhModel.getDieuMot());
			csmt.setNString("Tu_thang", quyetDinhModel.getTuThang());
			csmt.setNString("Den_thang", quyetDinhModel.getDenThang());
			csmt.setString("Ma_nguoi_lap", quyetDinhModel.getMaNguoiLap());
			csmt.setString("Ngay_lap", quyetDinhModel.getNgayLap());
			csmt.setString("Ma_nguoi_duyet", null);
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Tinh_trang", Constant.TINHTRANG_NEW);
			csmt.setNString("Noi_nhan", quyetDinhModel.getNoiNhan());
			csmt.setNString("Ly_do_reject", quyetDinhModel.getLyDoReject());
			csmt.setString("Quyet_dinh_so", quyetDinhModel.getQuyetDinhSo());
			csmt.setString("Ngay_ra_QD_UBND", DateUtil.setDate(quyetDinhModel.getNgayRaQuyetDinh()));
			csmt.setString("Tong_so_hoc_sinh", quyetDinhModel.getTongSoHocSinh());
			csmt.setString("Tong_so_chuyen_nganh", quyetDinhModel.getTongSoChuyenNganh());
			csmt.setString("User1", quyetDinhModel.getUser1());
			csmt.setString("User2", quyetDinhModel.getUser2());
			csmt.setString("User3", quyetDinhModel.getUser3());
			csmt.setString("User4", quyetDinhModel.getUser4());
			csmt.setString("User5", quyetDinhModel.getUser5());
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.registerOutParameter("Ten",java.sql.Types.NVARCHAR);
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.DATE);
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			
			if (ketQua) { // Insert thanh cong
				maQuyetDinhNew = csmt.getString("ID");
				quyetDinhModel.setMaQuyetDinh(maQuyetDinhNew);
				quyetDinhModel.setNgayCapNhatCuoi(csmt.getString("Ngay_cap_nhat_cuoi"));
				quyetDinhModel.setTenQuyetDinh(csmt.getString("Ten"));
				
				ArrayList<MoChuyenNganhModel> moChuyenNganhModel = quyetDinhModel.getMoChuyenNganhList();
				ArrayList<MoChuyenNganhModel> moChuyenNganhModelAfterAdd = new ArrayList<MoChuyenNganhModel>();
				
				for (MoChuyenNganhModel obj : moChuyenNganhModel) {
					obj.setMaQuyetDinh(maQuyetDinhNew);
					if (MoChuyenNganhDAO.insertMoChuyenNganh(obj)) {
						moChuyenNganhModelAfterAdd.add(obj);
					}
				}
				
				quyetDinhModel.setMoChuyenNganhList(moChuyenNganhModelAfterAdd);				
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static int getCountQuyetDinhDaoTao(String tinhtrang, String maBoPhan) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountQuyetDinhDaoTao(?,?,?)}");
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_PHC", Constant.BO_PHAN_PHC);
			//csmt.registerOutParameter("Count", java.sql.Types.INTEGER);
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public static ArrayList<QuyetDinhModel> getQuyetDinhDaoTao(int totalRows, String currenPage, String tinhTrang, String maBoPhan) {
		ArrayList<QuyetDinhModel> quyetDinhDaoTaoModelsList = new ArrayList<QuyetDinhModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetQuyetDinhDaoTao(?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_PHC", Constant.BO_PHAN_PHC);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				QuyetDinhModel quyetDinhModel = new QuyetDinhModel();
				quyetDinhModel.setMaQuyetDinh(rs.getString("MaQuyetDinhDaoTao"));
				quyetDinhModel.setTenQuyetDinh(rs.getString("TenQuyetDinhDaoTao"));
				quyetDinhModel.setTenNguoiLap(rs.getString("TenNguoiLap"));
				quyetDinhModel.setNgayLap(rs.getString("NgayLap"));
				quyetDinhModel.setTinhTrang(rs.getString("TinhTrang"));
				quyetDinhModel.setLyDoReject(rs.getString("LyDoReject"));
				quyetDinhDaoTaoModelsList.add(quyetDinhModel);
			}
			Constant.CHECK_ROWS = quyetDinhDaoTaoModelsList.size()-1; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return quyetDinhDaoTaoModelsList;
	}
	
	public static ArrayList<QuyetDinhModel> getAllQuyetDinhDaoTaoApproved() {
		ArrayList<QuyetDinhModel> quyetDinhModelList = new ArrayList<QuyetDinhModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllQuyetDinhApproved"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				QuyetDinhModel quyetDinhModel = new QuyetDinhModel();
				quyetDinhModel.setMaQuyetDinh(rs.getString("MaQuyetDinh"));
				quyetDinhModel.setTenQuyetDinh(rs.getString("TenQuyetDinh"));
				quyetDinhModel.setMaNguoiLap(rs.getString("MaNguoiLap"));
				quyetDinhModelList.add(quyetDinhModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return quyetDinhModelList;
	}
}
