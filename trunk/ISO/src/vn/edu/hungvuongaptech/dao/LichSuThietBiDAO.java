package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.LichSuThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class LichSuThietBiDAO {
	public static String insertLichSuThietBi(String maThietBi,String nguoiThucHien,String maHanhDong,String ghiChu,String vatTuThayThe){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_InsertLichSuThietBi(?,?,?,?,?,?)}");
			csmt.setString("Ma_thiet_bi", maThietBi);
			csmt.setString("Nguoi_thuc_hien", nguoiThucHien);
			csmt.setString("Ma_hanh_dong", maHanhDong);
			csmt.setString("Ghi_chu", ghiChu);
			csmt.setString("Vat_tu_thay_the", vatTuThayThe);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static ArrayList<LichSuThietBiModel> getLichSuThietBiByMaThietBi(String maThietBi){
		ArrayList<LichSuThietBiModel> list = new ArrayList<LichSuThietBiModel>();
		LichSuThietBiModel model = null;
		try {
			String sql = "SELECT A.ID,A.Ma_thiet_bi as MaThietBi,B.Ten_thiet_bi as TenThietBi, "
						+" CONVERT(VARCHAR(10),A.Ngay,105) as NgayThucHien,CONVERT(VARCHAR(10),A.Ngay,108) as GioThucHien, "
						+" A.Nguoi_thuc_hien as NguoiThucHien,(F.Ho+' '+F.Ten_lot+' '+F.Ten) as TenNguoiThucHien, "
						+" A.Ma_hanh_dong as MaHanhDong,C.Ten_hanh_dong as TenHanhDong, "
						+" A.Vat_tu_thay_the as VatTuThayThe,D.Ten_thiet_bi as TenVatTuThayThe, "
						+" A.Ghi_chu as GhiChu "
						+" FROM LICHSUTHIETBI A INNER JOIN THIETBI B ON A.Ma_thiet_bi=B.ID "
						+" INNER JOIN HANHDONG C ON A.Ma_hanh_dong=C.ID "
						+" LEFT JOIN THIETBI D ON A.Vat_tu_thay_the=D.ID "
						+" INNER JOIN THANHVIEN E ON A.Nguoi_thuc_hien=E.ID "
						+" INNER JOIN CHITIETTHANHVIEN F ON E.Ten_DN=F.Ten_dang_nhap "
						+" WHERE A.Ma_thiet_bi=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThietBi);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new LichSuThietBiModel();
				model.setMaLichSuThietBi("ID");
				model.setMaThietBi("MaThietBi");
				model.setTenThietBi("TenThietBi");
				model.setMaHanhDong("MaHanhDong");
				model.setTenHanhDong("TenHanhDong");
				model.setNgayThucHien("NgayThucHien");
				model.setGioThucHien("GioThucHien");
				model.setNguoiThucHien("NguoiThucHien");
				model.setHoTenNguoiThucHien("TenNguoiThucHien");
				model.setGhiChu("GhiChu");
				model.setVatTuThayThe("VatTuThayThe");
				model.setTenVatTuThayThe("TenVatTuThayThe");
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
