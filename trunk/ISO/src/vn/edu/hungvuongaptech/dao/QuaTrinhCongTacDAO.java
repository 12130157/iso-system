package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.QuaTrinhCongTacModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class QuaTrinhCongTacDAO {
	public static String insertQuaTrinhCongTac(String maThanhVien,String ngayNhanChuc,String chucVu){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_NhanSu_InsertQuaTrinhCongTac(?,?,?,?)}");
			csmt.setString("Ma_thanh_vien", maThanhVien);
			csmt.setString("Ngay_nhan_chuc", ngayNhanChuc);
			csmt.setString("Chuc_vu", chucVu);
			csmt.registerOutParameter("KQ", java.sql.Types.INTEGER);
			csmt.executeUpdate();
			kq = csmt.getString("KQ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static ArrayList<QuaTrinhCongTacModel> getQuaTrinhCongTac(String maThanhVien){
		ArrayList<QuaTrinhCongTacModel> list = new ArrayList<QuaTrinhCongTacModel>();
		try {
			String sql = "SELECT A.ID,A.Ma_thanh_vien,CONVERT(VARCHAR(10),A.Ngay_nhan_chuc,105) as Ngay_nhan_chuc,A.Chuc_vu, B.Ten_vai_tro as Ten_Chuc_vu "
						+" FROM QUATRINHCONGTAC A INNER JOIN VAITRO B ON A.CHUC_VU=B.ID "
						+" WHERE A.Ma_thanh_vien=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				QuaTrinhCongTacModel model = new QuaTrinhCongTacModel();
				model.setId(rs.getString("ID"));
				model.setMaThanhVien(rs.getString("Ma_thanh_vien"));
				model.setNgayNhanChuc(rs.getString("Ngay_nhan_chuc"));
				model.setChucVu(rs.getString("Chuc_vu"));
				model.setTenChucVu(rs.getString("Ten_chuc_vu"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
