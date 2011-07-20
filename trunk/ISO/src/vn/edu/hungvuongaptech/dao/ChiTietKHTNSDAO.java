package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;

import vn.edu.hungvuongaptech.model.ChiTietKHTNSModel;
import vn.edu.hungvuongaptech.model.ThoiGianTuyenDungModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ChiTietKHTNSDAO {
	public static int InsertChiTietKHTNS(String maKeHoach,String maDeNghi){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertChiTietKHTNS(?,?,?)}");
			csmt.setString("Ma_ke_hoach", maKeHoach);
			csmt.setString("Ma_de_nghi", maDeNghi);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int UpdateChiTietKHTNS(String id,String ghiChu){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_UpdateChiTietKHTNS(?,?,?)}");
			csmt.setString("ID", id);
			csmt.setString("Ghi_chu", ghiChu);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static int TangSoLuongDaTuyenChiTietKHTNS(String id){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_TangSoLuongDaTuyenKHTNS(?,?)}");
			csmt.setString("ID", id);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return kq;
	}
	
	public static int GiamSoLuongDaTuyenChiTietKHTNS(String id){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_GiamSoLuongDaTuyenKHTNS(?,?)}");
			csmt.setString("ID", id);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return kq;
	}
	
	public static int DeleteChiTietKHTNS(String id){
		int kq = 0;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_DeleteChiTietKHTNS(?,?)}");
			csmt.setString("ID", id);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getInt("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return kq;
	}
	
	public static ArrayList<ChiTietKHTNSModel> getAllCTKHTNSByMaKeHoach(String maKeHoach){
		ArrayList<ChiTietKHTNSModel> list = new ArrayList<ChiTietKHTNSModel>();
		try {
			String sql = "SELECT A.ID,A.Ma_ke_hoach,A.Ma_de_nghi,A.Ghi_chu,C.Ten as BoPhan,D.Ten_vai_tro as VaiTro,B.so_luong as So_luong "
			+" FROM ChiTietKHTNS A LEFT JOIN DeNghiNhanSu B on A.Ma_de_nghi=B.ID"
			+" LEFT JOIN KHOA_TRUNGTAM C ON B.Ma_bo_phan=C.ID"
			+" LEFT JOIN VAITRO D ON B.Chuc_danh=D.ID WHERE A.Ma_ke_hoach=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maKeHoach);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChiTietKHTNSModel model = new ChiTietKHTNSModel();
				model.setId(rs.getString("ID"));
				model.setMa_ke_hoach(rs.getString("Ma_ke_hoach"));
				model.setMa_de_nghi(rs.getString("Ma_de_nghi"));
				model.setGhi_chu(rs.getString("Ghi_chu"));
				model.setUser1(rs.getString("BoPhan"));
				model.setUser2(rs.getString("VaiTro"));
				model.setSoLuong(rs.getString("So_luong"));
				list.add(model);
			}
			for (ChiTietKHTNSModel chiTietKHTNSModel : list) {
				chiTietKHTNSModel.setList_thoi_gian(ChiTietKHTNSDAO.listThoiGianByMaCTKHTNS(chiTietKHTNSModel.getId()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ChiTietKHTNSModel getCTKHTNSByID(String id){
		ChiTietKHTNSModel model = null;
		try {
			String sql = "SELECT A.*, "
						+" CONVERT(VARCHAR(10),A.Ngay_cap_nhat_cuoi,101) as Ngay_cap_nhat_cuoi_mdy, "
						+" C.Ten as BoPhan, "
						+" D.Ten_vai_tro as VaiTro "
						+" FROM ChiTietKHTNS A LEFT JOIN DeNghiNhanSu B on A.Ma_de_nghi=B.ID "
						+" LEFT JOIN KHOA_TRUNGTAM C ON B.Ma_bo_phan=C.ID "
						+" LEFT JOIN VAITRO D ON B.Chuc_danh=D.ID "
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new ChiTietKHTNSModel();
				model.setId(rs.getString("ID"));
				model.setMa_ke_hoach(rs.getString("Ma_ke_hoach"));
				model.setMa_de_nghi(rs.getString("Ma_de_nghi"));
				model.setGhi_chu(rs.getString("Ghi_chu"));
				model.setNgay_cap_nhat_cuoi(rs.getString("Ngay_cap_nhat_cuoi_mdy"));
				model.setBoPhan(rs.getString("BoPhan"));
				model.setVaiTro(rs.getString("VaiTro"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static ArrayList<ThoiGianTuyenDungModel> listThoiGianByMaCTKHTNS(String maKeHoach){
		ArrayList<ThoiGianTuyenDungModel> list = new ArrayList<ThoiGianTuyenDungModel>();
		try {
			String sql = "SELECT * FROM THOIGIANTUYENDUNG WHERE MA_CTKHTDNS=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maKeHoach);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				ThoiGianTuyenDungModel model = new ThoiGianTuyenDungModel();
				model.setMa_CTKHTDNS(rs.getString("Ma_CTKHTDNS"));
				model.setThoi_gian(rs.getString("Thoi_gian"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static ArrayList<ChiTietKHTNSModel> getAllCTKHTNSCoDK(){
		ArrayList<ChiTietKHTNSModel> list = new ArrayList<ChiTietKHTNSModel>();
		try {
			String sql = "SELECT A.ID,D.Ten_vai_tro as Ten_vai_tro,C.Ten as Ten_bo_phan "
						+" FROM ChiTietKHTNS A LEFT JOIN DeNghiNhanSu B on A.Ma_de_nghi=B.ID "
						+" LEFT JOIN KHOA_TRUNGTAM C ON B.Ma_bo_phan=C.ID "
						+" LEFT JOIN VAITRO D ON B.Chuc_danh=D.ID "
						+" LEFT JOIN ThoiGianTuyenDung E on A.ID=E.Ma_CTKHTDNS "
						+" WHERE A.Ma_ke_hoach in (SELECT ID FROM KEHOACHTNS WHERE Tinh_trang='2' AND Nam=YEAR(GETDATE())) AND B.So_luong > A.So_luong_da_tuyen "
						+" GROUP BY A.ID,D.Ten_vai_tro,C.Ten "
						+" HAVING MONTH(getdate())<MAX(E.Thoi_gian) ";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChiTietKHTNSModel model = new ChiTietKHTNSModel();
				model.setId(rs.getString("ID"));
				model.setUser1(rs.getString("Ten_vai_tro"));
				model.setUser2(rs.getString("Ten_bo_phan"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<ChiTietKHTNSModel> getAllCTKHTNS(){
		ArrayList<ChiTietKHTNSModel> list = new ArrayList<ChiTietKHTNSModel>();
		try {
			String sql = "SELECT A.ID,D.Ten_vai_tro as Ten_vai_tro,C.Ten as Ten_bo_phan "
						+" FROM ChiTietKHTNS A LEFT JOIN DeNghiNhanSu B on A.Ma_de_nghi=B.ID "
						+" LEFT JOIN KHOA_TRUNGTAM C ON B.Ma_bo_phan=C.ID "
						+" LEFT JOIN VAITRO D ON B.Chuc_danh=D.ID ";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChiTietKHTNSModel model = new ChiTietKHTNSModel();
				model.setId(rs.getString("ID"));
				model.setUser1(rs.getString("Ten_vai_tro"));
				model.setUser2(rs.getString("Ten_bo_phan"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
