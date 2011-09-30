package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.PhongBanModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class KhoaDAO {

	//Tac gia: La Quoc Chuong
	public static ArrayList<KhoaModel> getAllKhoa_QLSV(){
		ArrayList<KhoaModel> list = new ArrayList<KhoaModel>();
		KhoaModel model;
		try {
			String sql = "SELECT * "
						+" FROM KHOA_TRUNGTAM "
						+" WHERE ID='6' OR ID='7' OR ID='8' OR ID='9' OR ID='11' OR ID='10' OR ID='11' OR ID='12' OR ID='13' OR ID='14'";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model=new KhoaModel();
				model.setMaKhoa(rs.getString("ID"));
				model.setTenKhoa(rs.getString("Ten"));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static ArrayList<KhoaModel> showAllKhoa() {
		ArrayList<KhoaModel> listKetQua = new ArrayList<KhoaModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("admin.sql.getAllKhoa"));
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

	public static Boolean updateKhoaTT(KhoaModel model) {
		Boolean result = false;
		try {
			
			CallableStatement csmt = DataUtil.getConnection().prepareCall(
					"{call sp_Admin_UpdateKhoaTT(?,?,?,?)}");
			csmt.setString("ID", model.getMaKhoa());
			csmt.setNString("Ten", StringUtil.toTrim(model.getTenKhoa()));
			csmt.setString("Ma_truong_khoa", model.getMaTruongKhoa());
			csmt.setString("Nguoi_tao", model.getNguoiTao());

			result = DataUtil.executeNonStore(csmt);

		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}

		return result;
	}
	
	public static Boolean insertKhoaTT(KhoaModel model) {
		Boolean result = false;		
		try {	
			
			CallableStatement csmt = DataUtil.getConnection()
				.prepareCall("{call sp_Admin_InsertKhoaTT(?,?,?)}");
			csmt.setNString("Ten", StringUtil.toTrim(model.getTenKhoa()));
			csmt.setString("Ma_truong_khoa", model.getMaTruongKhoa());
			csmt.setString("Nguoi_tao", model.getNguoiTao());
			
			
			result = DataUtil.executeNonStore(csmt);

		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}

		return result;
	}
	
	public static ArrayList<KhoaModel> getAllKhoaCoSinhVien() {
		ArrayList<KhoaModel> listKetQua = new ArrayList<KhoaModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("admin.sql.getAllKhoaCoSinhVien"));
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
	
	//muon thiet bi
	public static ArrayList<KhoaModel> getAllKhoa(String maKhoa) {
		ArrayList<KhoaModel> khoaModelList = new ArrayList<KhoaModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.getAllKhoa"));						
			preparedStatement.setNString(1,maKhoa);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				KhoaModel KhoaModel = new KhoaModel();
				
				KhoaModel.setMaKhoa(rs.getString("MaKhoa"));
				KhoaModel.setTenKhoa(rs.getString("TenKhoa"));
				
				khoaModelList.add(KhoaModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return khoaModelList;
	}
	
	public static ArrayList<KhoaModel> showKhoaTrungTam() {
		ArrayList<KhoaModel> listKetQua = new ArrayList<KhoaModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("QLTB.sql.showKhoaTrungTam"));				
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
	
	public static ArrayList<KhoaModel> getKhoaByBoPhan(int maBoPhan) {
		ArrayList<KhoaModel> khoaList=new ArrayList<KhoaModel>();
		KhoaModel khoa;
		try {	
			
			CallableStatement csmt = DataUtil.getConnection()
				.prepareCall("{call sp_ISO_GetKhoaByBoPhan(?)}");
			csmt.setInt("MaBoPhan",maBoPhan);
			
			ResultSet result= DataUtil.executeStore(csmt);
			while(result.next()){
				khoa=new KhoaModel();
				khoa.setMaKhoa(result.getString("MaKhoa"));

				khoa.setTenKhoa(result.getString("Ten"));

				khoa.setMaTruongKhoa(result.getString("MaTruongKhoa"));
				khoaList.add(khoa);
			}

		} catch (Exception e) {
			e.printStackTrace();
			khoaList = null;
		}

		return khoaList;
	}

	
	/*
	 * HE THONG QUAN LY NHAN SU
	 * AUTHOR: THANHTC
	 * CREATE DATE : 20/7/2011
	 */
	public static KhoaModel getKhoaByMaBoPhan(String maBoPhan){
		KhoaModel model = null;
		try {
			String sql = "SELECT * FROM KHOA_TRUNGTAM WHERE ID=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maBoPhan);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				model = new KhoaModel();
				model.setMaKhoa(rs.getString("ID"));
				model.setTenKhoa(rs.getString("Ten"));
				model.setMaTruongKhoa(rs.getString("Ma_truong_khoa"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	
	/* QuanLySinhVien
	 * Tác gi?: Q.Chuong
	 * Ngày: 26/09/2011
	 * Tên dao: getListKhoaTrungTam
	 * Tham s? truy?n vào: 1 m?ng id khoa trung tâm
	 * M?c dích: l?y danh sách khoa trung tâm có tham s? truy?n vào 1 m?ng id khoa trung tâm
	 * Tr? v?: 1 m?ng danh sách khoa trung tâm
	 * */
	public static ArrayList<KhoaModel> getListKhoaTrungTam(ArrayList<Integer> arr)
	{
		ArrayList<KhoaModel> arrKhoaTT = new ArrayList<KhoaModel>();
		try{
			for(int i = 0; i <arr.size(); i ++)
			{
				String query = "select * from khoa_trungtam where id = ?";
				PreparedStatement ps = DataUtil.getConnection().prepareStatement(query);
				ps.setInt(1, arr.get(i));
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
					KhoaModel model = new KhoaModel();
					model.setMaKhoa(rs.getString("ID"));
					model.setTenKhoa(rs.getString("Ten"));
					model.setMaTruongKhoa(rs.getString("Ma_truong_khoa"));
					arrKhoaTT.add(model);
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return arrKhoaTT;
	}
}
