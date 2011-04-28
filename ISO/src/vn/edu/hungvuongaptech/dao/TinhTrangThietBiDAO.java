package vn.edu.hungvuongaptech.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.SuDungModel;
import vn.edu.hungvuongaptech.model.TinhTrangThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class TinhTrangThietBiDAO {
	public static ArrayList<TinhTrangThietBiModel> getAllTinhTrangThietBi() {
		ArrayList<TinhTrangThietBiModel> tinhTrangThietBiList = new ArrayList<TinhTrangThietBiModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("qltb.sql.GetAllTinhTrangThietBi"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				TinhTrangThietBiModel tinhTrangThietBi = new TinhTrangThietBiModel();
				tinhTrangThietBi.setMaTinhTrang(rs.getString("MaTinhTrang"));
				tinhTrangThietBi.setTenTinhTrang(rs.getNString("TenTinhTrang"));
				tinhTrangThietBiList.add(tinhTrangThietBi);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return tinhTrangThietBiList;
	}
}
