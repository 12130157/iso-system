package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.SendMailListCongTacModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class SendMailListCongTacDAO {
	public static ArrayList<SendMailListCongTacModel> getAllListCongTacByMaKeHoach(String maKeHoachDaoTao) {
		ArrayList<SendMailListCongTacModel> list = new ArrayList<SendMailListCongTacModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllListCongTacByMaKeHoach"));
			preparedStatement.setString(1, maKeHoachDaoTao);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				SendMailListCongTacModel congTac = new SendMailListCongTacModel();
				
				congTac.setTenKeHoach(rs.getString("Ten"));
				congTac.setNoiDungCongTac(rs.getString("NoiDungCongTac"));
				congTac.setTenBoPhan(rs.getString("TenBoPhan"));
				congTac.setTenThanhVien(rs.getString("TenThanhVien"));
				congTac.setMaThanhVien(rs.getString("MaThanhVien"));
				congTac.setEmail(rs.getString("Email"));				
				congTac.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
				congTac.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));
				
				
				list.add(congTac);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	public static ArrayList<SendMailListCongTacModel> getAllListCongTacTuanByMaChiTiet(String maChiTiet) {
		ArrayList<SendMailListCongTacModel> list = new ArrayList<SendMailListCongTacModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllListCongTacTuanByMaChiTiet"));
			preparedStatement.setString(1, maChiTiet);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				SendMailListCongTacModel congTac = new SendMailListCongTacModel();
				
				congTac.setNoiDungCongTac(rs.getString("NoiDungCongTac"));
				congTac.setTenBoPhan(rs.getString("TenBoPhan"));
				congTac.setTenThanhVien(rs.getString("TenThanhVien"));
				congTac.setMaThanhVien(rs.getString("MaThanhVien"));
				congTac.setEmail(rs.getString("Email"));				
				congTac.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
				congTac.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));
				congTac.setNgay(rs.getString("Ngay"));
				congTac.setThu(rs.getString("Thu"));
				congTac.setGio(rs.getString("Gio"));
				congTac.setPhut(rs.getString("Phut"));
				congTac.setGhiChu(rs.getString("GhiChu"));
				
				list.add(congTac);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	public static ArrayList<SendMailListCongTacModel> getAllListCongTacBoSungByMaKeHoachAndLanBoSung(String maKeHoachDaoTao, String lanBoSung) {
		ArrayList<SendMailListCongTacModel> list = new ArrayList<SendMailListCongTacModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllListCongTacBoSungByMaKeHoachAndLanBoSung"));
			preparedStatement.setString(1, maKeHoachDaoTao);	
			preparedStatement.setString(2, lanBoSung);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				SendMailListCongTacModel congTac = new SendMailListCongTacModel();
				
				congTac.setTenKeHoach(rs.getString("Ten"));
				congTac.setNoiDungCongTac(rs.getString("NoiDungCongTac"));
				congTac.setTenBoPhan(rs.getString("TenBoPhan"));
				congTac.setTenThanhVien(rs.getString("TenThanhVien"));
				congTac.setMaThanhVien(rs.getString("MaThanhVien"));
				congTac.setEmail(rs.getString("Email"));				
				congTac.setTuNgay(DateUtil.setDate(rs.getString("TuNgay")));
				congTac.setDenNgay(DateUtil.setDate(rs.getString("DenNgay")));
				
				
				list.add(congTac);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
}	
