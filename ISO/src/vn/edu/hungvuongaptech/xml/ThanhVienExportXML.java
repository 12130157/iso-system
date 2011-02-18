package vn.edu.hungvuongaptech.xml;

import java.util.ArrayList;

import vn.edu.hungvuongaptech.util.XmlUtil;


public class ThanhVienExportXML {

	/**
	 * @param args
	 */
	public static void main(String[] args) {		
		ArrayList<ThanhVienNewBean> listObject = new ArrayList<ThanhVienNewBean>();
		
		ThanhVienNewBean val1 = new ThanhVienNewBean("Null","manual","1","0","0","1","AnhHX","hungvuong","","Xuân Ánh","Hồ","xuan@gmail.com","0","","","","","","","","","","","HCM","VN","en_utf8","","99","0","0","0","0","","","0","","Null","1","0","2","1","1","1","0","0","0","Null","0");		
		listObject.add(val1);
		
		XmlUtil.exportThemMoiThanhVienXmlFile(listObject, "HungVuongISOOutput", "mdl_user");
		
		
		ArrayList<ThanhVienNewBean> listObject_1 = new ArrayList<ThanhVienNewBean>();
		
		ThanhVienNewBean val2 = new ThanhVienNewBean("3","manual","1","0","0","1","AnhHX","hungvuong","","ho xuan anh","Ho Xuan Anh","xuan@gmail.com","0","","","","","","","","","","","HCM","VN","en_utf8","","99","0","0","0","0","","","0","","Null","1","0","2","1","1","1","0","0","0","Null","0");						
		listObject_1.add(val2);

		XmlUtil.exportUpdateThanhVienXmlFile(listObject_1, "HungVuongISOOutput", "mdl_user");
	}

}
