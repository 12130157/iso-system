package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.DanhSachThietBiModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.LoaiThietBiModel;
import vn.edu.hungvuongaptech.model.PhongBanModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ThietBiDAO {
	
	
	
	public static Boolean insertThietBi(ThietBiModel thietBiModel){
		Boolean result=false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ten",thietBiModel.getTenThietBi());
			csmt.setString("Ma_loai",thietBiModel.getMaLoaiThietBi());
			csmt.setString("Ki_hieu",thietBiModel.getKiHieu());
			csmt.setString("Ma_tinh_trang", Constant.TINHTRANGTHIETBIRANH);
			csmt.setNString("Ghi_chu",thietBiModel.getGhiChu());
			csmt.setString("Ma_nguoi_tao",thietBiModel.getMaNguoiTao());
			csmt.setString("Ma_nha_cung_cap",thietBiModel.getMaNhaCungCap());
			csmt.setString("Ngay_san_xuat",thietBiModel.getNgaySanXuat());
			csmt.setString("Ngay_mua",thietBiModel.getNgayMua());			
			csmt.setString("Han_bao_hanh",thietBiModel.getHanBaoHanh());
			csmt.setString("Ngay_bat_dau_su_dung",thietBiModel.getNgayBatDauSuDung());
			csmt.setString("Tan_suat_toi_da",thietBiModel.getTanSuatToiDa());
			csmt.setString("Gia_mua",thietBiModel.getGiaMua());
			csmt.setNString("Dac_tinh_ky_thuat",thietBiModel.getDacTinhKyThuat());
			csmt.setNString("Nguyen_tac_su_dung",thietBiModel.getNguyenTacSuDung());
			csmt.setString("So_lan_su_dung", "0");
			csmt.setString("So_lan_bao_tri", "0");
			csmt.setString("Ma_tan_suat", thietBiModel.getMaTanSuat());
			csmt.setString("Tan_suat_su_dung", thietBiModel.getTanSuatSuDung());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1",thietBiModel.getUser1());
			csmt.setString("User2",thietBiModel.getUser2());
			csmt.setString("User3",thietBiModel.getUser3());
			csmt.setString("User4",thietBiModel.getUser4());
			csmt.setString("User5",thietBiModel.getUser5());
			
			csmt.setString("Ma_bo_phan",thietBiModel.getMaBoPhan());
			csmt.setString("Ma_phong",thietBiModel.getMaPhongBan());
			
			result = DataUtil.executeNonStore(csmt);
			if(result){
				thietBiModel.setMaThietBi(csmt.getString("ID"));
				//String maxID = csmt.getString("MaThietBi");
				/*ArrayList<ChiTietThietBiModel> chiTietThietBiList=thietBiModel.getChiTietThietBiList();
				ArrayList<ChiTietThietBiModel> chiTietThietBiListAfterInserted = new ArrayList<ChiTietThietBiModel>();
				int size=chiTietThietBiList.size();
				
				for(int j=0;j<size;j++){
					ChiTietThietBiModel chiTietThietBi = chiTietThietBiList.get(j);
					chiTietThietBi.setMaThietBi(thietBiModel.getMaThietBi());
					if(ChiTietThietBiDAO.insertChiTietThietBi(chiTietThietBiList.get(j))) {
						chiTietThietBiListAfterInserted.add(chiTietThietBi);
					} else
						result = false;
				}
				//if(result == true)
					thietBiModel.setChiTietThietBiList(chiTietThietBiListAfterInserted);*/
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return result;
	}
	
	public static Boolean updateThietBi(ThietBiModel thietBiModel) { // Cập nhật thiết bị
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_UpdateThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			csmt.setString("ID", thietBiModel.getMaThietBi());
			csmt.setNString("Ten",thietBiModel.getTenThietBi());
			csmt.setString("Ma_loai",thietBiModel.getMaLoaiThietBi());
			csmt.setString("Ki_hieu",thietBiModel.getKiHieu());
			csmt.setString("Ma_tinh_trang",thietBiModel.getMaTinhTrang());
			csmt.setNString("Ghi_chu",thietBiModel.getGhiChu());
			csmt.setString("Ma_nguoi_tao",thietBiModel.getMaNguoiTao());
			csmt.setString("Ma_nha_cung_cap",thietBiModel.getMaNhaCungCap());
			csmt.setString("Ngay_san_xuat",thietBiModel.getNgaySanXuat());
			csmt.setString("Ngay_mua",thietBiModel.getNgayMua());			
			csmt.setString("Han_bao_hanh",thietBiModel.getHanBaoHanh());
			csmt.setString("Ngay_bat_dau_su_dung",thietBiModel.getNgayBatDauSuDung());
			csmt.setString("Tan_suat_toi_da",thietBiModel.getTanSuatToiDa());
			csmt.setString("Gia_mua",thietBiModel.getGiaMua());
			csmt.setNString("Dac_tinh_ky_thuat",thietBiModel.getDacTinhKyThuat());
			csmt.setNString("Nguyen_tac_su_dung",thietBiModel.getNguyenTacSuDung());
			csmt.setString("So_lan_su_dung", thietBiModel.getSoLanSuDung());
			csmt.setString("So_lan_bao_tri", thietBiModel.getSoLanBaoTri());
			csmt.setString("Ma_tan_suat", thietBiModel.getMaTanSuat());
			csmt.setString("Tan_suat_su_dung", thietBiModel.getTanSuatSuDung());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1",thietBiModel.getUser1());
			csmt.setString("User2",thietBiModel.getUser2());
			csmt.setString("User3",thietBiModel.getUser3());
			csmt.setString("User4",thietBiModel.getUser4());
			csmt.setString("User5",thietBiModel.getUser5());
			result = DataUtil.executeNonStore(csmt);								
			/*if (result) { // Update thiet bi thanh cong
				ArrayList<ChiTietThietBiModel> chiTietThietBiList=thietBiModel.getChiTietThietBiList();
				ArrayList<ChiTietThietBiModel> chiTietThietBiListAfterUpdated = new ArrayList<ChiTietThietBiModel>();
				int size=chiTietThietBiList.size();
				
				for(int j=0;j<size;j++){
					ChiTietThietBiModel chiTietThietBi = chiTietThietBiList.get(j);
					if(chiTietThietBi.getMaChiTietThietBi() != null) {
						if(!ChiTietThietBiDAO.updateChiTietThietBi(chiTietThietBi));
							result = false;
					} else {
						chiTietThietBi.setMaThietBi(thietBiModel.getMaThietBi());
						if(ChiTietThietBiDAO.insertChiTietThietBi(chiTietThietBiList.get(j))) {
							chiTietThietBiListAfterUpdated.add(chiTietThietBi);
						} else
							result = false;
					}
				}
				//if(result == true)
					thietBiModel.setChiTietThietBiList(chiTietThietBiListAfterUpdated);
			}*/
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}						
		return result;
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
	
	public static ArrayList<KhoaModel> getComboBoxDanhSachThietBi(){
		ArrayList<KhoaModel> listBoPhan = new ArrayList<KhoaModel>();
		ArrayList<PhongBanModel> listPhongBan = new ArrayList<PhongBanModel>();
		ArrayList<LoaiThietBiModel> listLoaiThietBi = new ArrayList<LoaiThietBiModel>();
		String maBoPhan = "";
		String maPhongBan = "";
		String maLoaiThietBi = "";
		try {
			String sql = "SELECT C.ID AS MaBoPhan,C.TEN AS TenBoPhan,D.ID AS MaPhongBan,D.KI_HIEU_PHONG AS TenPhongBan, "
				+" E.ID AS MaLoaiThietBi,E.TEN_LOAI_THIET_BI AS TenLoaiThietBi "
				+" FROM THIETBI A INNER JOIN LYLICHTHIETBI B ON B.MA_THIET_BI=A.ID "
				+" INNER JOIN KHOA_TRUNGTAM C ON B.BO_PHAN_NHAN=C.ID "
				+" INNER JOIN PHONGBAN D ON A.VI_TRI_LAP_DAT=D.ID "
				+" INNER JOIN LOAITHIETBI E ON A.MA_LOAI_THIET_BI=E.ID "
				+" ORDER BY C.ID,D.ID,E.ID";
			
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int check = 0;
				if(!maBoPhan.equals(rs.getString("MaBoPhan"))){
					KhoaModel boPhan = new KhoaModel();
					boPhan.setMaKhoa(rs.getString("MaBoPhan"));
					boPhan.setTenKhoa(rs.getString("TenBoPhan"));
					listBoPhan.add(boPhan);
					listPhongBan = new ArrayList<PhongBanModel>();
					boPhan.setListPhongBan(listPhongBan);
					maBoPhan = rs.getString("MaBoPhan");
					maPhongBan = "";
				}
				
				if(!maPhongBan.equals(rs.getString("MaPhongBan"))){
					check = 0;
					PhongBanModel phongBan = new PhongBanModel();
					phongBan.setMaPhongBan(rs.getString("MaPhongBan"));
					phongBan.setKiHieu(rs.getString("TenPhongBan"));
					for (PhongBanModel model : listPhongBan) {
						if(phongBan.getMaPhongBan().equals(model.getMaPhongBan())){
							check = 1;
						}
					}
					if(check==0){
						listPhongBan.add(phongBan);
					}
					
					listLoaiThietBi = new ArrayList<LoaiThietBiModel>();
					phongBan.setListLoaiThietBi(listLoaiThietBi);
					maPhongBan = rs.getString("MaPhongBan");
					maLoaiThietBi = "";
				}
				
				if(!maLoaiThietBi.equals(rs.getString("MaLoaiThietBi"))){
					check = 0;
					LoaiThietBiModel thietBi = new LoaiThietBiModel();
					thietBi.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
					thietBi.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
					for (LoaiThietBiModel model : listLoaiThietBi) {
						if(thietBi.getMaLoaiThietBi().equals(model.getMaLoaiThietBi())){
							check = 1;
						}
					}
					if(check==0){
						listLoaiThietBi.add(thietBi);
					}
					maLoaiThietBi = rs.getString("MaLoaiThietBi");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(listBoPhan.size());
		return listBoPhan;
	}
	
	public static String countDanhSachThietBi(String phong,String khoa,String loaiThietBi,
	String tinhTrang, String hienTrang, String gioBD, String phutBD, String gioKT,
	String phutKT, String ngayBD, String ngayKT){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ThietBi_countDanhSachThietBi(?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Phong", phong);
			csmt.setString("Khoa", khoa);
			csmt.setString("Loai_thiet_bi", loaiThietBi);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Hien_trang", hienTrang);
			csmt.setString("Gio_bd", gioBD);
			csmt.setString("Phut_bd", phutBD);
			csmt.setString("Gio_kt", gioKT);
			csmt.setString("Phut_kt", phutKT);
			csmt.setString("Ngay_bd", ngayBD);
			csmt.setString("Ngay_kt", ngayKT);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				kq = rs.getString("KQ");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static DanhSachThietBiModel getDanhSachThietBi(String phong,String khoa,String loaiThietBi,
			String tinhTrang, String hienTrang, String gioBD, String phutBD, String gioKT,
			String phutKT, String ngayBD, String ngayKT, String numPage, String numRecord){
		if(phong==null) phong="";
		if(khoa==null) khoa="";
		if(loaiThietBi==null) loaiThietBi="";
		if(tinhTrang==null) tinhTrang="";
		if(hienTrang==null) hienTrang="";
		if(gioBD==null) gioBD="";
		if(phutBD==null) phutBD="";
		if(gioKT==null) gioKT="";
		if(phutKT==null) phutKT="";
		if(ngayBD==null) ngayBD="";
		if(ngayKT==null) ngayKT="";
		DanhSachThietBiModel model = new DanhSachThietBiModel();
		ArrayList<ThietBiModel> listThietBi = new ArrayList<ThietBiModel>();
		try {
			
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ThietBi_DanhSachThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Phong", phong);
			csmt.setString("Khoa", khoa);
			csmt.setString("Loai_thiet_bi", loaiThietBi);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Hien_trang", hienTrang);
			csmt.setString("Gio_bd", gioBD);
			csmt.setString("Phut_bd", phutBD);
			csmt.setString("Gio_kt", gioKT);
			csmt.setString("Phut_kt", phutKT);
			csmt.setString("Ngay_bd", ngayBD);
			csmt.setString("Ngay_kt", ngayKT);
			csmt.setString("NUM_PAGE", numPage);
			csmt.setString("NUM_RECORD", numRecord);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				ThietBiModel m = new ThietBiModel();
				m.setMaThietBi(rs.getString("MaThietBi"));
				m.setTenThietBi(rs.getString("TenThietBi"));
				m.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
				m.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				m.setMa(rs.getString("Ma"));
				m.setKiHieu(rs.getString("KiHieu"));
				m.setMaPhongBan(rs.getString("MaPhongBan"));
				m.setTenPhongBan(rs.getString("TenPhongBan"));
				m.setMaTinhTrang(rs.getString("MaTinhTrang"));
				m.setTenTinhTrang(rs.getString("TenTinhTrang"));
				m.setMaHienTrang(rs.getString("MaHienTrang"));
				m.setTenHienTrang(rs.getString("TenHienTrang"));
				listThietBi.add(m);
			}
			model.setDanhSachThietBi(listThietBi);
			model.setTongSoThietBi(countDanhSachThietBi(phong, khoa, loaiThietBi, tinhTrang, hienTrang, gioBD, phutBD, gioKT, phutKT, ngayBD, ngayKT));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static Boolean baoHuThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_baoHuThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}	
	public static Boolean xoaThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_DeleteThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean thayDoiThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_ThayDoiThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static ThietBiModel getThietBiSimpleByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiSimpleByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				thietBi.setMaThietBi(rs.getString("MaThietBi"));
				thietBi.setTenThietBi(rs.getString("TenThietBi"));
				thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
				thietBi.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
				thietBi.setNgaySanXuat(rs.getString("NgaySanXuat"));
				thietBi.setNgayMua(rs.getString("NgayMua"));
				thietBi.setHanBaoHanh(rs.getString("HanBaoHanh"));
				thietBi.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
				thietBi.setMaBoPhan(rs.getString("MaBoPhan"));
				thietBi.setMaPhongBan(rs.getString("MaPhong"));
				thietBi.setMaTanSuat(rs.getString("MaTanSuat"));
				thietBi.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static ThietBiModel getThietBiByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		ArrayList<ChiTietThietBiModel> chiTietThietBiList = new ArrayList<ChiTietThietBiModel>();
		String maThietBi = "na";
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if(!maThietBi.equals(rs.getString("MaThietBi"))) {
					thietBi.setMaThietBi(rs.getString("MaThietBi"));
					thietBi.setTenThietBi(rs.getString("TenThietBi"));
					thietBi.setMaBoPhan(rs.getString("MaBoPhan"));
					thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
					thietBi.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
					thietBi.setMaPhongBan(rs.getString("MaPhong"));
					thietBi.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
					thietBi.setNgaySanXuat(rs.getString("NgaySanXuat"));
					thietBi.setNgayMua(rs.getString("NgayMua"));
					thietBi.setHanBaoHanh(rs.getString("HanBaoHanh"));
					thietBi.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
					thietBi.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
					thietBi.setGiaMua(rs.getString("GiaMua"));
					thietBi.setNguyenTacSuDung(rs.getString("NguyenTacSuDung"));
					thietBi.setDacTinhKyThuat(rs.getNString("DacTinhKyThuat"));
					thietBi.setSoLanSuDung(rs.getString("SoLanSuDung"));
					thietBi.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
					thietBi.setGhiChu(rs.getString("GhiChu"));
					thietBi.setMaNguoiTao(rs.getString("MaNguoiTao"));
					thietBi.setMaTanSuat(rs.getString("MaTanSuat"));
					thietBi.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
					maThietBi = thietBi.getMaThietBi();
//					thietBi.setChiTietThietBiList(chiTietThietBiList);
				}
				if(rs.getString("MaChiTietThietBi") != null) {
					ChiTietThietBiModel chiTietThietBi = new ChiTietThietBiModel();
					chiTietThietBi.setMaChiTietThietBi(rs.getString("MaChiTietThietBi"));
					chiTietThietBi.setTenChiTietThietBi(rs.getString("TenLinhKien"));
					chiTietThietBi.setKiHieu(rs.getString("KiHieuLinhKien"));
					chiTietThietBi.setSoLanBaoTri(rs.getString("SoLanBaoTriChiTiet"));
					chiTietThietBi.setSoLanSuDung(rs.getString("SoLanSuDungChiTiet"));
					chiTietThietBi.setTenNhaCungCap(rs.getNString("TenNhaCungCapLinhKien"));
					chiTietThietBiList.add(chiTietThietBi);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static ThietBiModel getThietBiBaoHuByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		ArrayList<ChiTietThietBiModel> chiTietThietBiList = new ArrayList<ChiTietThietBiModel>();
		String maThietBi = "na";
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiBaoHuByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if(!maThietBi.equals(rs.getString("MaThietBi"))) {
					thietBi.setMaThietBi(rs.getString("MaThietBi"));
					thietBi.setTenThietBi(rs.getString("TenThietBi"));
					thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
					
					maThietBi = thietBi.getMaThietBi();
//					thietBi.setChiTietThietBiList(chiTietThietBiList);
				}
				if(rs.getString("MaChiTietThietBi") != null) {
					ChiTietThietBiModel chiTietThietBi = new ChiTietThietBiModel();
					chiTietThietBi.setMaChiTietThietBi(rs.getString("MaChiTietThietBi"));
					chiTietThietBi.setTenChiTietThietBi(rs.getString("TenLinhKien"));
					chiTietThietBi.setKiHieu(rs.getString("KiHieuLinhKien"));
					
					chiTietThietBiList.add(chiTietThietBi);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static Boolean updatePhieuMuonByID(String maPhieuMuon, String ghiChu) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_updatePhieuMuonThietBiByID(?,?)}");		
			csmt.setString("ID", maPhieuMuon);
			csmt.setNString("Ghi_chu", ghiChu);
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
}
