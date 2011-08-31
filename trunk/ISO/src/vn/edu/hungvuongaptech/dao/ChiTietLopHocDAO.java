package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.ChiTietLopHocModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ChiTietLopHocDAO {
	public static ArrayList<ChiTietLopHocModel> getLopDaChuNhiemByMaThanhVien(String maThanhVien){
		ArrayList<ChiTietLopHocModel> list = new ArrayList<ChiTietLopHocModel>();
		try {
			String sql = "SELECT B.*,(CAST(D.Nam_bat_dau AS VARCHAR)+' - '+CAST(D.Nam_ket_thuc AS VARCHAR)) as Nam_hoc,C.Ki_hieu as Ten_lop_hoc,E.Ten_chuyen_nganh "
						+" FROM THANHVIEN A INNER JOIN CHITIETLOPHOC B ON A.ID=B.GV_chu_nhiem "
						+" INNER JOIN LOPHOC C ON B.Ma_lop_hoc=C.ID "
						+" INNER JOIN NAMHOC D ON B.Ma_nam_hoc=D.ID "
						+" INNER JOIN CHUYENNGANH E ON C.Ma_chuyen_nganh=E.ID"
						+" WHERE A.ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChiTietLopHocModel model = new ChiTietLopHocModel();
				model.setID(rs.getString("ID"));
				model.setMaNamHoc(rs.getString("Ma_nam_hoc"));
				model.setMaLopHoc(rs.getString("Ma_lop_hoc"));
				model.setGvChuNhiem(rs.getString("GV_chu_nhiem"));
				model.setNgayCapNhatCuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				model.setUser1(rs.getString("User1"));
				model.setUser2(rs.getString("User2"));
				model.setUser3(rs.getString("User3"));
				model.setUser4(rs.getString("User4"));
				model.setUser5(rs.getString("User5"));
				model.setTenLopHoc(rs.getString("Ten_lop_hoc"));
				model.setChuyenNganh(rs.getString("Ten_chuyen_nganh"));
				model.setNamHoc(rs.getString("Nam_hoc"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
