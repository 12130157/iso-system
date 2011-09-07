package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietTKBModel;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.PhanCongGiaoVienModel;
import vn.edu.hungvuongaptech.model.ThoiKhoaBieuModel;
import vn.edu.hungvuongaptech.model.ToTrinhModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class ThoiKhoaBieuDAO {

	public static Boolean insertThoiKhoaBieu(ThoiKhoaBieuModel thoiKhoaBieuModel) {
		Boolean result = false;
		String maThoiKhoaBieuNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertThoiKhoaBieu(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("Ma_lop", thoiKhoaBieuModel.getMaLop());
			csmt.setString("Tuan_bat_dau", thoiKhoaBieuModel.getTuanBatDau());
			csmt.setString("Tuan_ket_thuc", thoiKhoaBieuModel.getTuanKetThuc());
			csmt.setString("Ngay_bat_dau",DateUtil.setDate(thoiKhoaBieuModel.getNgayBatDau()));
			csmt.setString("Ngay_ket_thuc",DateUtil.setDate(thoiKhoaBieuModel.getNgayKetThuc()));
			csmt.setString("Ma_nguoi_tao", thoiKhoaBieuModel.getMaNguoiTao());
			csmt.setString("Ngay_tao",DateUtil.setDate(thoiKhoaBieuModel.getNgayTao()));
			csmt.setString("Ma_nguoi_duyet", null);
			csmt.setString("Ngay_duyet", null);
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.VARCHAR);
			csmt.registerOutParameter("Ten",java.sql.Types.VARCHAR);
			csmt.setString("Tinh_trang", Constant.TINHTRANG_NEW);
			csmt.setNString("Ly_do_reject", thoiKhoaBieuModel.getLyDoReject());
			csmt.setString("Hoc_ki", thoiKhoaBieuModel.getHocKi());
			csmt.setString("Nam_bat_dau", thoiKhoaBieuModel.getNam1());
			csmt.setString("Nam_ket_thuc", thoiKhoaBieuModel.getNam2());
			csmt.setString("Ngay_gui", null);
			csmt.setString("User1", thoiKhoaBieuModel.getUser1());
			csmt.setString("User2", thoiKhoaBieuModel.getUser2());
			csmt.setString("User3", thoiKhoaBieuModel.getUser3());
			csmt.setString("User4", thoiKhoaBieuModel.getUser4());
			csmt.setString("User5", thoiKhoaBieuModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				maThoiKhoaBieuNew = csmt.getString("ID");
				thoiKhoaBieuModel.setMaThoiKhoaBieu(maThoiKhoaBieuNew);
				thoiKhoaBieuModel.setNgayCapNhatCuoi(DateUtil.setDate(csmt.getString("Ngay_cap_nhat_cuoi")));
				thoiKhoaBieuModel.setTenThoiKhoaBieu(csmt.getNString("Ten"));
				
				/*ArrayList<ChiTietTKBModel> chiTietTKBList = thoiKhoaBieuModel.getChiTietTKBModelList();
				ArrayList<ChiTietTKBModel> chiTietTKBListAfterAdded = new ArrayList<ChiTietTKBModel>();
				
				for (ChiTietTKBModel obj : chiTietTKBList) {
					obj.setMaThoiKhoaBieu(maThoiKhoaBieuNew);
					if (ChiTietTKBDAO.insertChiTietTKB(obj)) {
						chiTietTKBListAfterAdded.add(obj);
					}
				}
				
				thoiKhoaBieuModel.setChiTietTKBModelList(chiTietTKBListAfterAdded);	*/
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	
	public static boolean updateThoiKhoaBieu(ThoiKhoaBieuModel thoiKhoaBieuModel) {
		// TODO Auto-generated method stub
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateThoiKhoaBieu(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", thoiKhoaBieuModel.getMaThoiKhoaBieu());
			csmt.setString("Ma_lop", thoiKhoaBieuModel.getMaLop());
			csmt.setString("Tuan_bat_dau", thoiKhoaBieuModel.getTuanBatDau());
			csmt.setString("Tuan_ket_thuc", thoiKhoaBieuModel.getTuanKetThuc());
			csmt.setString("Ngay_bat_dau", DateUtil.setDate(thoiKhoaBieuModel.getNgayBatDau()));
			csmt.setString("Ngay_ket_thuc", DateUtil.setDate(thoiKhoaBieuModel.getNgayKetThuc()));
			csmt.setString("Ma_nguoi_tao", thoiKhoaBieuModel.getMaNguoiTao());
			//csmt.setString("Ngay_tao", DateUtil.setDate(thoiKhoaBieuModel.getNgayTao()));
			csmt.setString("Ma_nguoi_duyet", thoiKhoaBieuModel.getMaNguoiDuyet());
			csmt.setString("Ngay_duyet", null);
			csmt.setString("Tinh_trang", thoiKhoaBieuModel.getTinhTrang());
			csmt.registerOutParameter("Ngay_cap_nhat_cuoi",java.sql.Types.VARCHAR);
			csmt.setNString("Ten", thoiKhoaBieuModel.getTenThoiKhoaBieu());
			csmt.setString("Hoc_ki", thoiKhoaBieuModel.getHocKi());
			csmt.setNString("Ly_do_reject", null);
			csmt.setString("Nam_bat_dau", thoiKhoaBieuModel.getNam1());
			csmt.setString("Nam_ket_thuc", thoiKhoaBieuModel.getNam2());
			if(thoiKhoaBieuModel.getNgayGui().equals(""))
				csmt.setString("Ngay_gui", null);
			else
				csmt.setString("Ngay_gui", DateUtil.setDate(thoiKhoaBieuModel.getNgayGui()) + " " + thoiKhoaBieuModel.getGioGui());
			csmt.setString("User1", thoiKhoaBieuModel.getUser1());
			csmt.setString("User2", thoiKhoaBieuModel.getUser2());
			csmt.setString("User3", thoiKhoaBieuModel.getUser3());
			csmt.setString("User4", thoiKhoaBieuModel.getUser4());
			csmt.setString("User5", thoiKhoaBieuModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				thoiKhoaBieuModel.setNgayCapNhatCuoi(DateUtil.setDate(csmt.getString("Ngay_cap_nhat_cuoi")));
				
				/*ArrayList<MonHocTKBModel> monHocTKBList = thoiKhoaBieuModel.getMonHocTKBModelList();
				ArrayList<MonHocTKBModel> monHocTKBListAfterUpdated = new ArrayList<MonHocTKBModel>();
				for (MonHocTKBModel obj : monHocTKBList) {	
					if (obj.getMaMonHocTKB() != null) { // Cap nhat "CHI TIET THOI KHOA BIEU" da ton tai
						MonHocTKBDAO.updateMonHocTKB(obj);
					} else { // Them moi "CHI TIET KE HOACH DAO TAO"
						obj.setMaTKB(thoiKhoaBieuModel.getMaThoiKhoaBieu());
						MonHocTKBDAO.insertMonHocTKB(obj);
					}
					
					monHocTKBListAfterUpdated.add(obj);
				}
				
				thoiKhoaBieuModel.setMonHocTKBModelList(monHocTKBListAfterUpdated);*/
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}	
			
		return result;
	}
	public static ThoiKhoaBieuModel getThoiKhoaBieuSimpleByID(String id) {
		// TODO Auto-generated method stub
		ThoiKhoaBieuModel thoiKhoaBieu = new ThoiKhoaBieuModel();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getThoiKhoaBieuSimpleByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				thoiKhoaBieu.setMaThoiKhoaBieu(rs.getString("MaThoiKhoaBieu"));
				thoiKhoaBieu.setTenThoiKhoaBieu(rs.getNString("TenThoiKhoaBieu"));
				thoiKhoaBieu.setMaNguoiTao(rs.getString("MaNguoiTao"));
				thoiKhoaBieu.setTenNguoiTao(rs.getNString("TenNguoiTao"));
				thoiKhoaBieu.setNgayGui(rs.getString("NgayGui"));
				thoiKhoaBieu.setGioGui(rs.getString("GioGui"));
				thoiKhoaBieu.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				thoiKhoaBieu.setTenNguoiDuyet(rs.getNString("TenNguoiDuyet"));
				thoiKhoaBieu.setNgayDuyet(rs.getString("NgayDuyet"));
				thoiKhoaBieu.setGioDuyet(rs.getString("GioDuyet"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return thoiKhoaBieu;
	}
	public static ThoiKhoaBieuModel getThoiKhoaBieuByID(String maThoiKhoaBieu) {
		// TODO Auto-generated method stub
		ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThoiKhoaBieuByID"));
			preparedStatement.setString(1, maThoiKhoaBieu);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				thoiKhoaBieuModel.setMaThoiKhoaBieu(rs.getString("MaThoiKhoaBieu"));
				thoiKhoaBieuModel.setTenThoiKhoaBieu(rs.getString("TenThoiKhoaBieu"));
				thoiKhoaBieuModel.setHocKi(rs.getString("HocKi"));
				thoiKhoaBieuModel.setMaLop(rs.getString("MaLop"));
				thoiKhoaBieuModel.setKiHieuLop(rs.getString("KiHieuLop"));
				thoiKhoaBieuModel.setNam1(rs.getString("NamBatDau"));
				thoiKhoaBieuModel.setNam2(rs.getString("NamKetThuc"));
				thoiKhoaBieuModel.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				thoiKhoaBieuModel.setTuanBatDau(rs.getString("TuanBatDau"));
				thoiKhoaBieuModel.setTuanKetThuc(rs.getString("TuanKetThuc"));
				thoiKhoaBieuModel.setNgayBatDau(DateUtil.setDate(rs.getString("NgayBatDau")));
				thoiKhoaBieuModel.setNgayKetThuc(DateUtil.setDate(rs.getString("NgayKetThuc")));
				thoiKhoaBieuModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				thoiKhoaBieuModel.setTenNguoiTao(rs.getString("NguoiTao"));
				thoiKhoaBieuModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				thoiKhoaBieuModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				thoiKhoaBieuModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				thoiKhoaBieuModel.setTinhTrang(rs.getString("TinhTrang"));
				thoiKhoaBieuModel.setLyDoReject(rs.getString("LyDoReject"));
				thoiKhoaBieuModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
				thoiKhoaBieuModel.setGioGui(rs.getString("GioGui"));
				thoiKhoaBieuModel.setTenKhoa(rs.getString("TenKhoa"));
				thoiKhoaBieuModel.setNgayDuyet(rs.getString("NgayDuyet"));
				thoiKhoaBieuModel.setGioDuyet(rs.getString("GioDuyet"));
				thoiKhoaBieuModel.setUser2(rs.getString("User2"));
				
				ArrayList<MonHocTKBModel> monHocTKBModelList = MonHocTKBDAO.getMonHocTKBANDChiTietTKBByMaTKB(thoiKhoaBieuModel.getMaThoiKhoaBieu());
				thoiKhoaBieuModel.setMonHocTKBModelList(monHocTKBModelList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return thoiKhoaBieuModel;
	}

	public static ArrayList<ThoiKhoaBieuModel> getAllThoiKhoaBieuApprove() {
		// TODO Auto-generated method stub
		ArrayList<ThoiKhoaBieuModel> thoiKhoaBieuModelList = new ArrayList<ThoiKhoaBieuModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllThoiKhoaBieuApprove"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
				thoiKhoaBieuModel.setMaThoiKhoaBieu(rs.getString("MaThoiKhoaBieu"));
				thoiKhoaBieuModel.setTenThoiKhoaBieu(rs.getString("TenThoiKhoaBieu"));
				thoiKhoaBieuModel.setHocKi(rs.getString("HocKi"));
				thoiKhoaBieuModel.setMaLop(rs.getString("MaLop"));
				thoiKhoaBieuModel.setKiHieuLop(rs.getString("KiHieuLop"));
				thoiKhoaBieuModel.setNam1(rs.getString("NamBatDau"));
				thoiKhoaBieuModel.setNam2(rs.getString("NamKetThuc"));
				thoiKhoaBieuModel.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				thoiKhoaBieuModel.setTuanBatDau(rs.getString("TuanBatDau"));
				thoiKhoaBieuModel.setTuanKetThuc(rs.getString("TuanKetThuc"));
				thoiKhoaBieuModel.setNgayBatDau(rs.getString("NgayBatDau"));
				thoiKhoaBieuModel.setNgayKetThuc(rs.getString("NgayKetThuc"));
				thoiKhoaBieuModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				thoiKhoaBieuModel.setTenNguoiTao(rs.getString("NguoiTao"));
				thoiKhoaBieuModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				thoiKhoaBieuModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				thoiKhoaBieuModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				thoiKhoaBieuModel.setTinhTrang(rs.getString("TinhTrang"));
				thoiKhoaBieuModel.setLyDoReject(rs.getString("LyDoReject"));
				thoiKhoaBieuModel.setNgayGui(rs.getString("NgayGui"));
				
				ArrayList<ChiTietTKBModel> chiTietTKBModelList = ChiTietTKBDAO.timChiTietTKB(thoiKhoaBieuModel.getMaThoiKhoaBieu());
				thoiKhoaBieuModel.setChiTietTKBModelList(chiTietTKBModelList);
				thoiKhoaBieuModelList.add(thoiKhoaBieuModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return thoiKhoaBieuModelList;
	}
	
	public static int duyetThoiKhoaBieu(String maNguoiDuyet, String maThoiKhoaBieu, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.duyetThoiKhoaBieuByMaThoiKhoaBieu"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maThoiKhoaBieu);
			result = preparedStatement.executeUpdate();
			return result;
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	public static int getCountThoiKhoaBieu(String tinhtrang, String maBoPhan) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountThoiKhoaBieu(?,?,?)}");
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
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
	public static ArrayList<ThoiKhoaBieuModel> getThoiKhoaBieu(int totalRows, String currenPage, String tinhTrang, String maBoPhan) {
		ArrayList<ThoiKhoaBieuModel> thoiKhoaBieuModelList = new ArrayList<ThoiKhoaBieuModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetThoiKhoaBieu(?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
				thoiKhoaBieuModel.setMaThoiKhoaBieu(rs.getString("MaThoiKhoaBieu"));
				thoiKhoaBieuModel.setTenThoiKhoaBieu(rs.getString("TenThoiKhoaBieu"));
				thoiKhoaBieuModel.setTenNguoiTao(rs.getString("TenNguoiTao"));
				thoiKhoaBieuModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				thoiKhoaBieuModel.setTinhTrang(rs.getString("TinhTrang"));
				thoiKhoaBieuModel.setLyDoReject(rs.getString("LyDoReject"));
				thoiKhoaBieuModelList.add(thoiKhoaBieuModel);
			}
			Constant.CHECK_ROWS = thoiKhoaBieuModelList.size(); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return thoiKhoaBieuModelList;
	}
	
	public static Boolean deleteThoiKhoaBieu(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_DeleteThoiKhoaBieu(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static int capNhatThoiKhoaBieu(String maTKB) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.capNhatThoiKhoaBieu"));
			preparedStatement.setString(1, maTKB);
			result = preparedStatement.executeUpdate();
			return result;
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	
	public static ArrayList<ThoiKhoaBieuModel> getThoiKhoaBieuApproveByMaLop(String maLop){
		ArrayList<ThoiKhoaBieuModel> thoiKhoaBieuModelList=new ArrayList<ThoiKhoaBieuModel>();
		ThoiKhoaBieuModel thoiKhoaBieuModel;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getThoiKhoaBieuApproveByMaLop"));
			preparedStatement.setString(1, maLop);
			preparedStatement.setString(2, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				thoiKhoaBieuModel = new ThoiKhoaBieuModel();
				thoiKhoaBieuModel.setMaThoiKhoaBieu(rs.getString("MaThoiKhoaBieu"));
				thoiKhoaBieuModel.setTenThoiKhoaBieu(rs.getString("TenThoiKhoaBieu"));
				thoiKhoaBieuModel.setHocKi(rs.getString("HocKi"));
				thoiKhoaBieuModel.setMaLop(rs.getString("MaLop"));
				thoiKhoaBieuModel.setKiHieuLop(rs.getString("KiHieuLop"));
				thoiKhoaBieuModel.setNam1(rs.getString("NamBatDau"));
				thoiKhoaBieuModel.setNam2(rs.getString("NamKetThuc"));
				thoiKhoaBieuModel.setTenChuyenNganh(rs.getString("TenChuyenNganh"));
				thoiKhoaBieuModel.setTuanBatDau(rs.getString("TuanBatDau"));
				thoiKhoaBieuModel.setTuanKetThuc(rs.getString("TuanKetThuc"));
				thoiKhoaBieuModel.setNgayBatDau(DateUtil.setDate(rs.getString("NgayBatDau")));
				thoiKhoaBieuModel.setNgayKetThuc(DateUtil.setDate(rs.getString("NgayKetThuc")));
				thoiKhoaBieuModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				thoiKhoaBieuModel.setTenNguoiTao(rs.getString("NguoiTao"));
				thoiKhoaBieuModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				thoiKhoaBieuModel.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				thoiKhoaBieuModel.setNgayCapNhatCuoi(DateUtil.setDate(rs.getString("NgayCapNhatCuoi")));
				thoiKhoaBieuModel.setTinhTrang(rs.getString("TinhTrang"));
				thoiKhoaBieuModel.setLyDoReject(rs.getString("LyDoReject"));
				thoiKhoaBieuModel.setNgayGui(DateUtil.setDate(rs.getString("NgayGui")));
				thoiKhoaBieuModel.setGioGui(rs.getString("GioGui"));
				thoiKhoaBieuModel.setTenKhoa(rs.getString("TenKhoa"));
				thoiKhoaBieuModel.setNgayDuyet(rs.getString("NgayDuyet"));
				thoiKhoaBieuModel.setGioDuyet(rs.getString("GioDuyet"));
				thoiKhoaBieuModel.setUser1(rs.getString("User1"));
				thoiKhoaBieuModelList.add(thoiKhoaBieuModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return thoiKhoaBieuModelList;
		
	}
	
	public static Boolean checkThoiKhoaBieuTrung(String hocKi, String maLop, String namBatDau) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_FindThoiKhoaBieu(?,?,?,?)}");
			csmt.setString("Hoc_ki", hocKi);
			csmt.setString("Ma_lop", maLop);
			csmt.setString("Nam_bat_dau", namBatDau);
			csmt.registerOutParameter("result", java.sql.Types.VARCHAR);
			if (DataUtil.executeNonStore(csmt)) {
				String kq = csmt.getString("result");
				if (kq.equals("0")) {
					result = false;
				}
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static ArrayList<ThoiKhoaBieuModel> getAllThoiKhoaBieuApproveByMaLop(String maLop){ // lay nam hoc va hoc ki cho phan xem diem
		ArrayList<ThoiKhoaBieuModel> thoiKhoaBieuModelList=new ArrayList<ThoiKhoaBieuModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("xemDiem.sql.getAllThoiKhoaBieuApproveByMaLop"));
			preparedStatement.setString(1, maLop);
			preparedStatement.setString(2, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
				thoiKhoaBieuModel.setNam1(rs.getString("NamBatDau"));
				thoiKhoaBieuModel.setNam2(rs.getString("NamKetThuc"));
				thoiKhoaBieuModel.setHocKi(rs.getString("HocKi"));
				thoiKhoaBieuModelList.add(thoiKhoaBieuModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return thoiKhoaBieuModelList;
	}
	// ham phan cong giao vien
	public static ArrayList<LopHocModel> getPhanCongGiaoVien(String khoa, String namHoc, String hocKi){ 
		ArrayList<LopHocModel> lopHocList = new ArrayList<LopHocModel>();
		String maLop = "na";
		ArrayList<PhanCongGiaoVienModel> phanCongGiaoVienList = new ArrayList<PhanCongGiaoVienModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllThoiKhoaBieuApproveByMaLop"));
			preparedStatement.setString(1, khoa);
			preparedStatement.setString(2, namHoc);
			preparedStatement.setString(3, hocKi);
			preparedStatement.setString(4, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				if(!rs.getString("MaLop").equals(maLop)) {
					LopHocModel lopHoc = new LopHocModel();
					lopHoc.setMaLopHoc(rs.getString("MaLop"));
					lopHoc.setKiHieu(rs.getString("KiHieuLop"));
					lopHoc.setKhoa(rs.getString("TenKhoa"));
					maLop = lopHoc.getMaLopHoc();
					phanCongGiaoVienList = new ArrayList<PhanCongGiaoVienModel>();
					lopHoc.setPhanCongGiaoVienList(phanCongGiaoVienList);
					lopHocList.add(lopHoc);
				}
				PhanCongGiaoVienModel phanCong = new PhanCongGiaoVienModel();
				phanCong.setMaGiaoVien(rs.getString("MaGiaoVien"));
				phanCong.setTenGiaoVien(rs.getString("TenGiaoVien"));
				phanCong.setMaMonHoc(rs.getString("MaMonHoc"));
				phanCong.setTenMonHoc(rs.getString("TenMonHoc"));
				phanCong.setLyThuyet(rs.getString("LyThuyet"));
				phanCong.setThucHanh(rs.getString("ThucHanh"));
				
				phanCongGiaoVienList.add(phanCong);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lopHocList;
	}
	
	public static ArrayList<ThoiKhoaBieuModel> getThoiKhoaBieuByMaGVAndMaMH(String maGV,String maMH){
		ArrayList<ThoiKhoaBieuModel> arrayList=new ArrayList<ThoiKhoaBieuModel>();
		ThoiKhoaBieuModel model;
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getThoiKhoaBieuByMaGVAndMaMH"));
			preparedStatement.setString(1, maGV);
			preparedStatement.setString(2, maMH);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				model=new ThoiKhoaBieuModel();
				
				model.setMaThoiKhoaBieu(rs.getString("MaTKB"));
				model.setTenThoiKhoaBieu(rs.getString("ten"));
				model.setNam1(rs.getString("NamBatDau"));
				arrayList.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrayList;
	}
}
