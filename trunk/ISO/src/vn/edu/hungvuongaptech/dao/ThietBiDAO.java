package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sun.tools.jar.resources.jar;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.PhongBanModel;
import vn.edu.hungvuongaptech.model.SysRoleMenuModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.TinhTrangThietBiModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ThietBiDAO {
	
	public static ArrayList<ThietBiModel> showAllThietBi() {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaTinhTrang(rs.getString("MaTinhTrang"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));

				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<ThietBiModel> showAllMuonThietBi() {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getMuonThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
				
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));

				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	
	public static ArrayList<ThietBiModel> getAllThietBi() {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
				
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setMaTinhTrang(rs.getString("MaTinhTrang"));	
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));				
				thietBiModel.setGhiChu(rs.getString("GhiChu"));
				thietBiModel.setMaBoPhan(rs.getString("MaBoPhan"));
				thietBiModel.setTenBoPhan(rs.getString("TenBoPhan"));
				thietBiModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				thietBiModel.setTenNguoiTao(rs.getString("TenNguoiTao"));
				thietBiModel.setMaPhongBan(rs.getString("MaPhongBan"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				thietBiModel.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
				thietBiModel.setTenNhaCungCap(rs.getString("TenNhaCungCap"));				
				thietBiModel.setNgaySanXuat(rs.getString("NgaySanXuat"));
				thietBiModel.setNgayMua(rs.getString("NgayMua"));
				thietBiModel.setNgayBaoHanh(rs.getString("NgayBaoHanh"));
				thietBiModel.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
				thietBiModel.setMaDonViTinh(rs.getString("MaDonViTinh"));	
				thietBiModel.setTenDonViTinh(rs.getString("TenDonViTinh"));				
				thietBiModel.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				thietBiModel.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
				thietBiModel.setMaDonViTanSuat(rs.getString("MaDonViTanSuat"));
				thietBiModel.setTenDonViTanSuat(rs.getString("TenDonViTanSuat"));				
				thietBiModel.setPhuKien(rs.getString("PhuKien"));
				thietBiModel.setGiaMua(rs.getString("GiaMua"));
				thietBiModel.setNguyenTacSuDung(rs.getString("NguyenTacSuDung"));
				thietBiModel.setDacTinhKyThuat(rs.getString("DacTinhKyThuat"));
				thietBiModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));				
				thietBiModel.setSoLanSuDung(rs.getString("SoLanSuDung"));
				thietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				thietBiModel.setSoMay(rs.getString("SoMay"));				

				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<ThietBiModel> getKiHieuThietBi() {
		ArrayList<ThietBiModel> kiHieuList = new ArrayList<ThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("QLTB.sql.getKiHieuThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
				
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));				
				
				kiHieuList.add(thietBiModel);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return kiHieuList;
	}
	
	
	
/*hien thi tat ca thanh vien tru sinh vien*/
	
	public static ArrayList<ThanhVienModel> timAllNguoiTao() {
		ArrayList<ThanhVienModel> listKetQua = new ArrayList<ThanhVienModel>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllThanhVien"));	
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThanhVienModel chiTietThanhVienModel = new ThanhVienModel();
				
				chiTietThanhVienModel.setMaThanhVien(rs.getString("MaThanhVien"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));
				chiTietThanhVienModel.setMaVaiTro(rs.getString("MaVaiTro"));
				chiTietThanhVienModel.setTenVaiTro(rs.getString("TenVaiTro"));
				chiTietThanhVienModel.setMaBoPhan(rs.getString("MaKhoa"));
				chiTietThanhVienModel.setTenBoPhan(rs.getString("TenKhoa"));
				chiTietThanhVienModel.setHoThanhVien(rs.getString("HoThanhVien"));
				chiTietThanhVienModel.setTenLot(rs.getString("TenLot"));
				chiTietThanhVienModel.setTenThanhVien(rs.getString("TenThanhVien"));

				listKetQua.add(chiTietThanhVienModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	
	public Boolean insertThietBi(ThietBiModel thietBiModel){
		Boolean result=true;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("MaThietBi",thietBiModel.getMaThietBi());
			
			csmt.setNString("Ten",thietBiModel.getTenThietBi());
			csmt.setString("MaLoai",thietBiModel.getMaLoaiThietBi());
			csmt.setNString("GhiChu",thietBiModel.getGhiChu());
			csmt.setString("MaBoPhan",thietBiModel.getMaBoPhan());
			csmt.setString("MaNguoiTao",thietBiModel.getMaNguoiTao());
			
			csmt.setString("MaPhong",thietBiModel.getMaPhongBan());
			csmt.setString("MaNhaCungCap",thietBiModel.getMaNhaCungCap());
			csmt.setString("NgaySanXuat",thietBiModel.getNgaySanXuat());
			csmt.setString("NgayMua",thietBiModel.getNgayMua());			
			csmt.setString("NgayBaoHanh",thietBiModel.getNgayBaoHanh());
			
			csmt.setString("MaDonViTinh",thietBiModel.getMaDonViTinh());
			csmt.setString("TanSuatToiDa",thietBiModel.getTanSuatToiDa());
			csmt.setString("MaDonViTanSuat",thietBiModel.getMaDonViTanSuat());
			csmt.setNString("PhuKien",thietBiModel.getPhuKien());
			csmt.setString("GiaMua",thietBiModel.getGiaMua());
			
			csmt.setNString("NguyenTacSuDung",thietBiModel.getNguyenTacSuDung());
			csmt.setNString("DacTinhKyThuat",thietBiModel.getDacTinhKyThuat());
			csmt.setString("KiHieu",thietBiModel.getKiHieu());
			csmt.setNString("User1",thietBiModel.getUser1());
			csmt.setString("User2",thietBiModel.getUser2());
			
			csmt.setNString("User3",thietBiModel.getUser3());
			csmt.setNString("User4",thietBiModel.getUser4());
			csmt.setString("User5",thietBiModel.getUser5());
			
			
			result = DataUtil.executeNonStore(csmt);	
			if(result){
				String maxID=getMaxIDThietBi();
				//String maxID = csmt.getString("MaThietBi");
				ArrayList<ChiTietThietBiModel> chiTietThietBiList=thietBiModel.getListChiTietThietBi();
				int size=chiTietThietBiList.size();
				
				for(int j=0;j<size;j++){
					chiTietThietBiList.get(j).setMaThietBi(maxID);
					if(!insertChiTietThietBi(chiTietThietBiList.get(j)))
						return false;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return result;
	}
	
	private Boolean insertChiTietThietBi(ChiTietThietBiModel chiTiet){
		Boolean result=true;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertChiTietThietBi(?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("MaChiTietThietBi", java.sql.Types.INTEGER);
			csmt.setString("MaThietBi",chiTiet.getMaThietBi());
			csmt.setNString("TenLinhKien",chiTiet.getTenLinhKien());
			csmt.setString("MaNhaCungCap",chiTiet.getMaNhaCungCap());
			csmt.setString("DungLuong",chiTiet.getDungLuong());
			csmt.setNString("GhiChu",chiTiet.getGhiChu());
			
			csmt.setString("User1",chiTiet.getMaThietBi());
			csmt.setString("User2",chiTiet.getUser2());
			csmt.setString("User3",chiTiet.getUser3());
			csmt.setString("User4",chiTiet.getUser4());
			csmt.setString("User5",chiTiet.getUser5());
			
			result = DataUtil.executeNonStore(csmt);	
			if(result) {
				String maChiTietThietBi = csmt.getString("MaChiTietThietBi");
				chiTiet.setMaCTTB(maChiTietThietBi);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return result;
	}
	
	private String getMaxIDThietBi(){
		String maxID="";
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("QLTB.sql.getMaxIDThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				maxID=rs.getString("MAX");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return maxID;
	}
	
	public static Boolean deleteThietBi(String maThietBi) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_DeleteThietBi(?)}");
			
			csmt.setString("ID",maThietBi);
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return result;
	}
	
	public static ArrayList<ThietBiModel> getAllThietBiByMaTinhTrang(String maTinhTrang) {
		ArrayList<ThietBiModel> thietBiModelList = new ArrayList<ThietBiModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getThietBiByMaTinhTrang"));						
			preparedStatement.setNString(1,maTinhTrang);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaTinhTrang(rs.getString("MaTinhTrang"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhong"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				
				thietBiModelList.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBiModelList;
	}
	
	public static ArrayList<ThietBiModel> getAllThietBiByKiHieuTB(String maThietBi) {
		ArrayList<ThietBiModel> thietBiModelList = new ArrayList<ThietBiModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getThietBiByKiHieu"));						
			preparedStatement.setNString(1,maThietBi);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaTinhTrang(rs.getString("MaTinhTrang"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhong"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				
				thietBiModelList.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBiModelList;
	}
	
	public static ArrayList<ThietBiModel> showThietBiHu() {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiHu"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
				
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setHoThanhVien(rs.getString("Ho"));
				thietBiModel.setTenLot(rs.getString("TenLot"));
				thietBiModel.setTenThanhVien(rs.getString("Ten"));
				thietBiModel.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
				thietBiModel.setNgayBaoHanh(rs.getString("NgayBaoHanh"));
				thietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				thietBiModel.setNgayMua(rs.getString("NgayMua"));

				listKetQua.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	
	
	public static ArrayList<ThietBiModel> getTimThietBiMuon(String tenThietBi) {
		ArrayList<ThietBiModel> listKetQua = new ArrayList<ThietBiModel>();
		//int totalRows = countThanhVien();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_ShowThietBiMuon(?)}");
	
			csmt.setString("ID", tenThietBi);

			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				ThietBiModel thietBiModel = new ThietBiModel();
				
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));

				listKetQua.add(thietBiModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<TinhTrangThietBiModel> showAllTinhTrangTB() {
		ArrayList<TinhTrangThietBiModel> listKetQua = new ArrayList<TinhTrangThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllTinhTrang"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				TinhTrangThietBiModel TinhTrangTBModel = new TinhTrangThietBiModel();
				TinhTrangTBModel.setMaTinhTrang(rs.getString("MaTinhTrang"));
				TinhTrangTBModel.setTenTinhTrang(rs.getString("TenTinhTrang"));

				listKetQua.add(TinhTrangTBModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<ThietBiModel> getAllThietBiDiChuyen(String maPhong) {
		ArrayList<ThietBiModel> thietBiModelList = new ArrayList<ThietBiModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllThietBiDiChuyen"));						
			preparedStatement.setNString(1,maPhong);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ThietBiModel thietBiModel = new ThietBiModel();
								
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				
				thietBiModelList.add(thietBiModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBiModelList;
	}
	
	public static ArrayList<ThietBiModel> getAllThietBiByPhongAndLoaiTB(String maPhongBan, String maLoaiThietBi) {
		ArrayList<ThietBiModel> thietBiModelList = new ArrayList<ThietBiModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_getThietBiByPhongAndLoaiTB(?,?)}");
	
			csmt.setString("MaPhongBan", maPhongBan);
			csmt.setString("MaLoaiThietBi", maLoaiThietBi);
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				ThietBiModel thietBiModel = new ThietBiModel();
				
				thietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				thietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				thietBiModel.setMaTinhTrang(rs.getString("MaTinhTrang"));
				thietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));
				thietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				thietBiModel.setKiHieu(rs.getString("KiHieu"));
				thietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				
				thietBiModelList.add(thietBiModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return thietBiModelList;
	}
	/*chi tiet thiet bi*/
	public static ChiTietThietBiModel XemChiTietThietBiByMaThietBi(String maThietBi) {
		ChiTietThietBiModel chiTietThietBiModel = new ChiTietThietBiModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getChiTietThietBiByMaThietBi"));
			preparedStatement.setString(1, maThietBi);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				chiTietThietBiModel.setMaThietBi(rs.getString("MaThietBi"));
				chiTietThietBiModel.setTenThietBi(rs.getString("TenThietBi"));
				chiTietThietBiModel.setTenLinhKien(rs.getString("TenLinhKien"));
				chiTietThietBiModel.setDungLuong(rs.getString("DungLuong"));
				chiTietThietBiModel.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
				chiTietThietBiModel.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				chiTietThietBiModel.setKiHieu(rs.getString("KiHieu"));
				chiTietThietBiModel.setMaTinhTrang(rs.getString("MaTinhTrang"));	
				chiTietThietBiModel.setTenTinhTrang(rs.getString("TenTinhTrang"));				
				chiTietThietBiModel.setGhiChu(rs.getString("GhiChu"));
				chiTietThietBiModel.setMaBoPhan(rs.getString("MaKhoa"));
				chiTietThietBiModel.setTenBoPhan(rs.getString("TenKhoa"));
				chiTietThietBiModel.setMaNguoiTao(rs.getString("MaNguoiTao"));		
				chiTietThietBiModel.setMaPhongBan(rs.getString("MaPhongBan"));
				chiTietThietBiModel.setTenPhongBan(rs.getString("TenPhongBan"));
				chiTietThietBiModel.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
				chiTietThietBiModel.setTenNhaCungCap(rs.getString("TenNhaCungCap"));				
				chiTietThietBiModel.setNgaySanXuat(rs.getString("NgaySanXuat"));
				chiTietThietBiModel.setNgayMua(rs.getString("NgayMua"));
				chiTietThietBiModel.setNgayBaoHanh(rs.getString("NgayBaoHanh"));
				chiTietThietBiModel.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
				chiTietThietBiModel.setMaDonViTinh(rs.getString("MaDonViTinh"));	
				chiTietThietBiModel.setTenDonViTinh(rs.getString("TenDonViTinh"));				
				chiTietThietBiModel.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
				chiTietThietBiModel.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
				chiTietThietBiModel.setMaDonViTanSuat(rs.getString("MaDonViTanSuat"));
				chiTietThietBiModel.setTenDonViTanSuat(rs.getString("TenDonViTanSuat"));				
				chiTietThietBiModel.setPhuKien(rs.getString("PhuKien"));
				chiTietThietBiModel.setGiaMua(rs.getString("GiaMua"));
				chiTietThietBiModel.setNguyenTacSuDung(rs.getString("NguyenTacSuDung"));
				chiTietThietBiModel.setDacTinhKyThuat(rs.getString("DacTinhKyThuat"));
				chiTietThietBiModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));				
				chiTietThietBiModel.setSoLanSuDung(rs.getString("SoLanSuDung"));
				chiTietThietBiModel.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
				chiTietThietBiModel.setSoMay(rs.getString("SoMay"));
				chiTietThietBiModel.setMaThanhVien(rs.getString("MaThanhVien"));
				chiTietThietBiModel.setHoThanhVien(rs.getString("HoThanhVien"));
				chiTietThietBiModel.setTenLot(rs.getString("TenLot"));
				chiTietThietBiModel.setTenThanhVien(rs.getString("TenThanhVien"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietThietBiModel;
	}
	
	public static ArrayList<KhoaModel> showAllKhoa() {
		ArrayList<KhoaModel> listKetQua = new ArrayList<KhoaModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllKhoa"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				KhoaModel KhoaModel = new KhoaModel();
				KhoaModel.setMaKhoa(rs.getString("MaKhoa"));
				KhoaModel.setTenKhoa(rs.getString("TenKhoa"));

				listKetQua.add(KhoaModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
}
