/**
 * 
 */
package vn.edu.hungvuongaptech.taglib;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import vn.edu.hungvuongaptech.common.DateType;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

/**
 * @author ThienVD
 *
 */
public class ChangeStringTaglib {
	
	/**
	 * <ul>
	 * <li> Ham nay se them Tag <p> vao chuoi gia tri lay len tu database
	 * </ul>
	 * 
	 * @author 	ThienVD
	 * @param 	value		Gia tri chuoi dau vao
	 * @return	String		Gia tri duoc noi them tag <p> o giua ngay dau '-'
	 * @throws
	 */
	public static String appendPTag(String value) {		
		String result = "";
		String[] arrayValue = value.split("\n");
		for (int i = 0; i< arrayValue.length; i++) {
			if(arrayValue[i].charAt(0) == '-')
				result += "<p>&nbsp;&nbsp;&nbsp;" + arrayValue[i] + "</p>" ;
			else
				result += "<p>&nbsp;&nbsp;&nbsp;- " + arrayValue[i] + "</p>" ;
		}
		return result;
	}
	public static String appendPTagWithColor(String value) {		
		String result = "";
		String[] arrayValue = value.split("\n");
		for (int i = 0; i< arrayValue.length; i++) {
			if(arrayValue[i].charAt(0) == '-')
				result += "<p style='background-color: yellow;'>&nbsp;&nbsp;&nbsp;" + arrayValue[i] + "</p>" ;
			else
				result += "<p style='background-color: yellow;'>&nbsp;&nbsp;&nbsp;- " + arrayValue[i] + "</p>" ;
		}
		/*if (arrayValue.length == 1) { // Chuoi khong chua ki tu "-"
			result = "<p style='background-color: yellow;'>-" + value + "</p>";
		}*/
		return result;
	}
	
	/**
	 * <ul>
	 * <li> Ham nay se tra ve phan tu duoc chon trong mang
	 * Vi du : Array input : 09-04-2010 chon 0 => 09, chon 1=> 04, chon 2 => 2010
	 * sig: la dau hieu muon cat trong array
	 * </ul>
	 * 
	 * @author 	ThienVD
	 * @param 	value		Gia tri array input
	 * @param 	no			Thu tu muon extract ra trong array
	 * @param 	sig			Dau hieu muon split trong array
	 * @return	String		Ngay duoc extract ra
	 * @throws
	 */
	public static String getElement(String value, Integer no, String sig) {
		String result = "";
		String[] arrayValue = value.split(sig);
		if (no < arrayValue.length) {
			result = arrayValue[no];
		}		
		return result;
	}
	
	/**
	 * <ul>
	 * <li> Ham nay se tra ve phan tu duoc chon trong mang
	 * Vi du : Array input : 09-04-2010 chon 0 => 09, chon 1=> 04, chon 2 => 2010
	 * sig: la dau hieu muon cat trong array
	 * </ul>
	 * 
	 * @author 	ThienVD
	 * @param 	value		Gia tri array input
	 * @param 	no			Thu tu muon extract ra trong array
	 * @param 	sig			Dau hieu muon split trong array
	 * @return	String		Ngay duoc extract ra
	 * @throws
	 */
	
	public static String upperString(String value) {
		return value.toUpperCase();
	}
	
	public static String[] splitString1(String value) {
		String[] result = value.split("</>");
		return result;
	}
	
	public static String[] splitString2(String value) {
		String[] result = value.split("-");
		return result;
	}
	public static String[] splitString3(String value) {
		String[] result = value.split("/");
		return result;
	}
	/**
	 * 
	 * @param value1 ngày hiện tại
	 * @param value2 ngày bắt đầu của tuần
	 * @return true khi ngày hiện tại trước ngày bắt đầu
	 */
	public static boolean compareDate(String value1, String value2) {
		boolean result = false;
		if(value2 != null) {
			String[] arr = value2.split("/");
			if(arr.length > 2) {
				value2 = value2.replaceAll("/", "-");
			}
			DateFormat df = new SimpleDateFormat("dd-MM-yy");
			try {
				Date d1 = (Date)df.parse(value1);
				Date d2 = (Date)df.parse(value2);
				result = d1.after(d2);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return result;
		}
		else
			return result;
	}
	public static int convertToInt(Double value) {
		return (int) Math.round(value);
	}
	public static String changeString(String value) {
		value = value.replaceAll("-", "/");
		return value;
	}
	public static String appendBrTag(String value) {		
		String result = "";
		String br = "<br/>";
		String[] arrayValue = value.split("\n");
		for (int i = 0; i< arrayValue.length; i++) {
			result += arrayValue[i] + br;
			br = "<br/>";
		}
		if (arrayValue.length == 1) { 
			result = value;
		}
		return result;
	}
	
	public static String appendBrTag2(String value) {		
		String result = "";
		String br = "\r\n";
		String line = "---";
		String[] arrayValue = value.split(line);
		for (int i = 0; i< arrayValue.length; i++) {
			result += arrayValue[i] + br;
			if (i != arrayValue.length -1 ) {
				br = "\r\n";
			}
		}
		if (arrayValue.length == 1) { 
			result = value;
		}
		return result;
	}
	public static String replaceString(String value) {
		return value.replaceAll("<--->", "<br/>-");
	}
	public static String getThu(String a){
		String thu = "";
		if(a.equals("1")) 
			thu = StringUtil.toUTF8("Thu Hai");
		else if(a.equals("2"))
			thu = StringUtil.toUTF8("Thu Ba");
		else if(a.equals("3"))
			thu = StringUtil.toUTF8("Thu Tu");
		else if(a.equals("4"))
			thu = StringUtil.toUTF8("Thu Nam");
		else if(a.equals("5"))
			thu = StringUtil.toUTF8("Thu Sau");
		else if(a.equals("6"))
			thu = StringUtil.toUTF8("Thu Bay");
		else
			thu = StringUtil.toUTF8("Chu Nhat");
		return thu;
	}
	
	public static String appendBrTag3(String value){
		String result = "";
		String br = "<br/>";
		String line = "\r\n";
		String[] arrayValue = value.split(line);
		for (int i = 0; i< arrayValue.length; i++) {
			result += arrayValue[i] + br;
			if (i != arrayValue.length -1 ) {
				br = "<br/>";
			}
		}
		if (arrayValue.length == 1) { 
			result = value;
		}
		return result;
	}
	
	public static String setFormatDate(String value){
		String[] str=value.split("-");
		if(str.length==3)
			return "Ngày "+str[0]+" Tháng "+ str[1]+" Năm "+ str[2];
		return value;
	}

	public static Integer diffDate(String value1,String value2){
		int result=0;
		String soNgay=DateUtil.diffDate(value1, value2);
		if(!soNgay.equals(""))
			result=Integer.parseInt(soNgay);
		return result;
	}
	
	public static String setFormatDate2(String value,DateType type){
		return DateUtil.setDate(value, type);
	}
	
	public static ArrayList<String> splitTenChuong(String tenChuong) {
		ArrayList<String> str = new ArrayList<String>();
		str.add(tenChuong.substring(0, tenChuong.indexOf("1.")));
		str.add(tenChuong.substring(tenChuong.indexOf("1."), tenChuong.length()));
		return str;
	}
}
