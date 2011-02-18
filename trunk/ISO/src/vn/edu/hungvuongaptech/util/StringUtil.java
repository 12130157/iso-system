/**
 * 
 */
package vn.edu.hungvuongaptech.util;

import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO;
import vn.edu.hungvuongaptech.model.ChiTietKHGDModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;

/**
 * @author ThienVD
 *
 */
public class StringUtil {
	public static String toUTF8(String isoString) {
		  String utf8String = null;
		  if (null != isoString && !isoString.equals("")) {
		   try {
		    byte[] stringBytesISO = isoString.getBytes("ISO-8859-1");
		    utf8String = new String(stringBytesISO, "UTF-8");
		   }
		   catch(UnsupportedEncodingException e) {	   
			   System.out.println("UnsupportedEncodingException is: " + e.getMessage());
			   utf8String = isoString;
		   }
		  } else {
			  utf8String = isoString;
		  }
		  return utf8String;
	}
	
	public static Boolean isNumber(char c)
    {
        String str = "0123456789";
        int i;
        for (i = 0; i < str.length(); i++)
        {
            if (c == str.charAt(i))
                i = str.length();
        }
        if (i == str.length() + 1)
            return true;
        return false;
    }
	
	public static String isNull(String a){
		
		if(a == null){
			a = "";
		}
		return a;
	}
	
	public static String toTrim (String textTrim){
		String a = null ;
		if (null != textTrim && !textTrim.equals("")) {
			try {
				String temp = textTrim;
				String[] ten = null;
				String b = "";
				ten = temp.split(" ");
				for(int i =0; i < ten.length; i++){
					ten[i].replace(" ", "");
					if(!ten[i].equals("")){
						b+= ten[i] + " ";
					}
				}
				a = b;
			}
			catch(Exception e) {	   
					   System.out.println("UnsupportedEncodingException is: " + e.getMessage());
					   a = textTrim;
			 }
		}else{
			a = textTrim;
		}
		return a;
	}
	
	public static ArrayList<String> cutTenChuong(String tenChuongList){
		
		String[] listChuong=tenChuongList.split("\r\n");
				
		String tenChuong="";
		
		for(int i=0;i<listChuong.length;i++)
		{
			if(i==0)
				tenChuong=listChuong[i];
			else
				tenChuong+=" "+listChuong[i];
		}
		
		ArrayList<String> lstTenChuong=new ArrayList<String>();	
		int i=0;
		
		while(i<tenChuong.length())
        {
            if(StringUtil.isNumber(tenChuong.charAt(i)))
            {
                i++;
                while(i<tenChuong.length()&&StringUtil.isNumber(tenChuong.charAt(i)))
                {
                    i++;
                }

                if (i<tenChuong.length()&&tenChuong.charAt(i) == '/')
                {
                    i++;
                    String temp = "";
                    Boolean a = true;
                    while (i < tenChuong.length() && a == true)
                    {
                        if (StringUtil.isNumber(tenChuong.charAt(i)))
                        {
                            int k = i;
                            i++;
                            while (i <tenChuong.length() &&StringUtil.isNumber(tenChuong.charAt(i)))
                            {
                                i++;
                            }

                            if (i < tenChuong.length() && tenChuong.charAt(i) == '.')
                            {
                                a = false;
                            }
                            else if(i < tenChuong.length() && tenChuong.charAt(i) == '/')
                            {
                                a = false;
                                i = k-2;
                            }
                            else
                            {
                                while (k < i)
                                {
                                    temp += tenChuong.charAt(k);
                                    k++;
                                }
                            }
                        }
                        else
                        {
                            temp += tenChuong.charAt(i);
                        }
                        i++;
                    }
                    if (temp != "")
                        lstTenChuong.add(temp);
                }
                
            }

            i++;
        }
		
		return lstTenChuong;
	}
	
}
