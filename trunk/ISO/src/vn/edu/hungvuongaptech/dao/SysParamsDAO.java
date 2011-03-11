package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.SysParamsModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class SysParamsDAO {
	public static SysParamsModel getSysParams() {
		SysParamsModel sysParamsModel = new SysParamsModel();
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_getSysParams()}");					
			
		    ResultSet rs = DataUtil.executeStore(csmt);
		    
		    if (rs.next()) {
		    	sysParamsModel.setGioHeThong(rs.getString("GioHeThong"));		    	
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sysParamsModel;
	}
	public static SysParamsModel getNgayGioHeThong() {
		SysParamsModel sysParamsModel = new SysParamsModel();
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_getNgayGioHeThong()}");					
			
		    ResultSet rs = DataUtil.executeStore(csmt);
		    
		    if (rs.next()) {
		    	sysParamsModel.setNgayHeThong(DateUtil.setDate(rs.getString("NgayHeThong")));	
		    	sysParamsModel.setGioHeThong(rs.getString("GioHeThong"));		    	
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sysParamsModel;
	}
	
	public static SysParamsModel getNgayGioHeThongXML() {
		SysParamsModel sysParamsModel = new SysParamsModel();
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_getNgayGioHeThongXML()}");					
			
		    ResultSet rs = DataUtil.executeStore(csmt);
		    
		    if (rs.next()) {
		    	sysParamsModel.setNgayHeThong(DateUtil.setDate(rs.getString("NgayHeThong")));	
		    	sysParamsModel.setGioHeThong(rs.getString("GioHeThong"));		    	
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sysParamsModel;
	}
	public static String getNamHeThong() {
		String namHeThong = "0";
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.getNamHeThong"));
			ResultSet rs = preparedStatement.executeQuery();
			    
		    if (rs.next()) {
		    	namHeThong = rs.getString("NamHeThong");	    	
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return namHeThong;
	}
}
