package vn.edu.hungvuongaptech.util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.common.DateType;

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
	
	
	public static String setDate(String value,DateType type){
		//value is must dd-mm-yyyy
		String str="";
		if(!value.equals("")){
			String[] strs=value.split("-");
			if(strs.length==3){
				if(type==DateType.TYPE_1){
					str=strs[2]+"/"+strs[1]+"/"+strs[0];
				}else if(type==DateType.TYPE_2){
					str=strs[1]+"/"+strs[0]+"/"+strs[2];
				} else if(type==DateType.TYPE_3){
					str=strs[0]+"/"+strs[1]+"/"+strs[2];
					
				}
			}
		}
		
		return str;
	}
	

	/*
	 * HE THONG QUAN LY NHAN SU
	 * AUTHOR: THANHTC
	 * CREATE DATE : 20/7/2011
	 */
	
	public static String changeDMYtoMDY(String dmy){
		String result = "";
		if(dmy != null && !dmy.equals("")){
			String[] arrayValue = dmy.split("-");
			result = arrayValue[1] + "-" + arrayValue[0] + "-" + arrayValue[2];
		}
		return result;
	}
	
	
	public static ArrayList<String> getMonthByTwoDate(String batdau,String ketthuc){
		ArrayList<String> list = new ArrayList<String>();
		String ngaybatdau[] = batdau.split("-");
		String ngayketthuc[] = ketthuc.split("-");
		int thangbatdau = Integer.parseInt(ngaybatdau[1]);
		int thangketthuc = Integer.parseInt(ngayketthuc[1]);
		int nambatdau = Integer.parseInt(ngaybatdau[2]);
		int namketthuc = Integer.parseInt(ngayketthuc[2]);
		int n = namketthuc-nambatdau;
		if(n>0){
			thangketthuc += 12*n;
			int count = 1;
			for (int i = thangbatdau; i <= thangketthuc; i++) {
				int tmp = i-12*(count-1);
				list.add(tmp+"-"+nambatdau);
				if(i==12*count){
					nambatdau+=1;
					count++;
				}
			}
		}else{
			for (int i = thangbatdau; i <= thangketthuc; i++) {
				String tmp = i+"-"+nambatdau;
				list.add(tmp);
			}
		}
		return list;
	}
}
