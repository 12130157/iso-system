/**
 * 
 */
package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;

/**
 * @author ThienVD
 *
 */
public class VaiTroDAO {

	public static VaiTroModel timVaiTro(String maVaiTro) {
		VaiTroModel vaiTroModel = new VaiTroModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getVaiTroByID"));
			preparedStatement.setString(1, maVaiTro);			
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				vaiTroModel.setMaVaiTro(rs.getString("MaVaiTro"));
				vaiTroModel.setTenVaiTro(rs.getString("TenVaiTro"));
				vaiTroModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				vaiTroModel.setUser1(rs.getString("User1"));
				vaiTroModel.setUser2(rs.getString("User2"));
				vaiTroModel.setUser3(rs.getString("User3"));
				vaiTroModel.setUser4(rs.getString("User4"));
				vaiTroModel.setUser5(rs.getString("User5"));
				
				return vaiTroModel;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}	

	public static ArrayList<VaiTroModel> timAllVaiTro() {
		ArrayList<VaiTroModel> listKetQua = new ArrayList<VaiTroModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllVaiTro"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				VaiTroModel vaiTroModel = new VaiTroModel();
				vaiTroModel.setMaVaiTro(rs.getString("MaVaiTro"));
				vaiTroModel.setTenVaiTro(rs.getString("TenVaiTro"));
				vaiTroModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				vaiTroModel.setUser1(rs.getString("User1"));
				vaiTroModel.setUser2(rs.getString("User2"));
				vaiTroModel.setUser3(rs.getString("User3"));
				vaiTroModel.setUser4(rs.getString("User4"));
				vaiTroModel.setUser5(rs.getString("User5"));
				
				listKetQua.add(vaiTroModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	public static ArrayList<VaiTroModel> showAllVaiTro() {
		ArrayList<VaiTroModel> listKetQua = new ArrayList<VaiTroModel>();			
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllVaiTro"));				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				VaiTroModel vaiTroModel = new VaiTroModel();
				vaiTroModel.setMaVaiTro(rs.getString("MaVaiTro"));
				vaiTroModel.setTenVaiTro(rs.getString("TenVaiTro"));
				vaiTroModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				
				listKetQua.add(vaiTroModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static Boolean TimTenVaiTro(String tenVaiTroInsert) {
		Boolean result = true;
		try {
			String temp = tenVaiTroInsert;
			String[] ten = null;
			String tenVaiTro = "";
			ten = temp.split(" ");
			for(int i =0; i < ten.length; i++){
				ten[i].replace(" ", "");
				if(!ten[i].equals("")){
					tenVaiTro+= ten[i] + " ";
				}
			}
			
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.getVaiTroBayTenVaiTro"));
			preparedStatement.setString(1, tenVaiTro);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				result = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static Boolean insertVaiTro(VaiTroModel vaiTroModel) {
		Boolean result = false;		
		try {
			
			String temp = vaiTroModel.getTenVaiTro();
			String[] ten = null;
			String tenVaiTro = "";
			ten = temp.split(" ");
			for(int i =0; i < ten.length; i++){
				ten[i].replace(" ", "");
				if(!ten[i].equals("")){
					tenVaiTro+= ten[i] + " ";
				}
			}
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_InsertVaiTro(?,?,?,?,?,?,?)}");
			csmt.setNString("Ten_vai_tro", tenVaiTro);
			csmt.setString("Ngay_cap_nhat_cuoi", vaiTroModel.getNgayCapNhatCuoi());
			csmt.setString("User1", null);
			csmt.setString("User2", null);
			csmt.setString("User3", null);
			csmt.setString("User4", null);
			csmt.setString("User5", null);
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // insert vai tro thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	
	public static Boolean updateVaiTro(VaiTroModel vaiTroModel) {
		Boolean result = false;		
		try {
			
			String temp = vaiTroModel.getTenVaiTro();
			String[] ten = null;
			String tenVaiTro = "";
			ten = temp.split(" ");
			for(int i =0; i < ten.length; i++){
				ten[i].replace(" ", "");
				if(!ten[i].equals("")){
					tenVaiTro+= ten[i] + " ";
				}
			}
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateVaiTro(?,?,?)}");
			csmt.setNString("ID", vaiTroModel.getMaVaiTro());
			csmt.setNString("Ten_vai_tro", tenVaiTro);
			csmt.setString("Ngay_cap_nhat_cuoi", vaiTroModel.getNgayCapNhatCuoi());
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update vai tro thanh cong
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}	
	
	public static ArrayList<VaiTroModel> getVaiTroDeNghiNhanSu() {
		ArrayList<VaiTroModel> listKetQua = new ArrayList<VaiTroModel>();			
		try {
			String sql = "select A.ID AS MaVaiTro,  A.ten_vai_tro AS TenVaiTro, A.ngay_cap_nhat_cuoi AS NgayCapNhatCuoi from vaitro A WHERE A.ID='8' OR A.ID='11' OR A.ID='6' OR A.ID='13' OR A.ID='7' order by A.ten_vai_tro";
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				VaiTroModel vaiTroModel = new VaiTroModel();
				vaiTroModel.setMaVaiTro(rs.getString("MaVaiTro"));
				vaiTroModel.setTenVaiTro(rs.getString("TenVaiTro"));
				vaiTroModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				
				listKetQua.add(vaiTroModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static ArrayList<VaiTroModel> getVaiTroKhongSinhVien() {
		ArrayList<VaiTroModel> listKetQua = new ArrayList<VaiTroModel>();			
		try {
			String sql = "select A.ID AS MaVaiTro,  A.ten_vai_tro AS TenVaiTro, A.ngay_cap_nhat_cuoi AS NgayCapNhatCuoi from vaitro A where A.ID <> 9 order by A.ten_vai_tro";
			PreparedStatement preparedStatement = DataUtil.getConnection().prepareStatement(sql);				
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				VaiTroModel vaiTroModel = new VaiTroModel();
				vaiTroModel.setMaVaiTro(rs.getString("MaVaiTro"));
				vaiTroModel.setTenVaiTro(rs.getString("TenVaiTro"));
				vaiTroModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				
				listKetQua.add(vaiTroModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
}
