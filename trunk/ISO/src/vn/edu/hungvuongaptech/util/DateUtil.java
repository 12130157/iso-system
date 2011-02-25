package vn.edu.hungvuongaptech.util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.edu.hungvuongaptech.common.Constant;

public class DateUtil {
	public static String setDate(String value) {
		String result = "";
		if(value != null && !value.equals("")) {
			String[] arrayValue = value.split("-");
			result = arrayValue[1] + "-" + arrayValue[0] + "-" + arrayValue[2];
		}
		return result;
	}
	public static String addDate(String so,String value){
		String result="";
		
		try {
			
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.addDate"));
			preparedStatement.setInt(1,Integer.parseInt(so));
			preparedStatement.setString(2,value);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				result=rs.getString("NamThangNgay");
			}
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	
	public static String getDate(String value){
		String result="";
		
		try {
			
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getDate"));
			preparedStatement.setString(1,value);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				result=rs.getString("NgayHeThong");
			}
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
		
	
	public static String diffDate(String value1,String value2){
		String result="";
		try {
			
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.diffDate"));
			preparedStatement.setString(1,value1);
			preparedStatement.setString(2,value2);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				result=rs.getString("SoNgay");
			}
		}catch(Exception e){e.printStackTrace();}
		
		return result;	
	
	}
	
	public static String setDate2(String value) {
		String result = "";
		if(value != null && !value.equals("")) {
			String[] arrayValue = value.split("-");
			result = arrayValue[2].substring(0,2) + "-" + arrayValue[1] + "-" + arrayValue[0];
		}
		return result;
	}
	
	public static String setDate3(String value) {
		String result = "";
		if(value != null && !value.equals("")) {
			String[] arrayValue = value.split("-");
			result = arrayValue[1] + "-" + arrayValue[0] + "-" + arrayValue[2].substring(0,4);
		}
		return result;
	}
	

	
}
