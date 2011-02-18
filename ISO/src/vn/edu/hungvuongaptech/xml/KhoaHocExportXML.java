package vn.edu.hungvuongaptech.xml;

import java.util.ArrayList;

import vn.edu.hungvuongaptech.util.XmlUtil;


public class KhoaHocExportXML {

	/**
	 * @param args
	 */
	public static void main(String[] args) {		
		ArrayList<KhoaHocNewBean> listObject = new ArrayList<KhoaHocNewBean>();
		
		KhoaHocNewBean val1 = new KhoaHocNewBean("Null","1","100","","Course Fullname 301","CF301","","Null","Weeks","1","Null","1","Teacher","Teachers","Student","Students","0","0","0","3","0","0","0","1","0","0","0","0","","","","USD","0","0","0","0","0","0","0","1","0","0","","0","");		
		listObject.add(val1);

		XmlUtil.exportThemMoiKhoaHocXmlFile(listObject, "HungVuongISOOutput", "mdl_course");
		
		ArrayList<KhoaHocNewBean> listObject_1 = new ArrayList<KhoaHocNewBean>();
		
		KhoaHocNewBean val2 = new KhoaHocNewBean("12","1","100","","Course Fullname 909","CF301","","Null","Weeks","1","Null","1","Teacher","Teachers","Student","Students","0","0","0","3","0","0","0","1","0","0","0","0","","","","USD","0","0","0","0","0","0","0","1","0","0","","0","");		
		listObject_1.add(val2);
		
		XmlUtil.exportUpdateKhoaHocXmlFile(listObject_1, "HungVuongISOOutput", "mdl_course");
		
		ArrayList<DeleteKhoaHocNewBean> listObj = new ArrayList<DeleteKhoaHocNewBean>();
		
		DeleteKhoaHocNewBean val3 = new DeleteKhoaHocNewBean("12");
		listObj.add(val3);
		
		XmlUtil.exportDeleteKhoaHocXmlFile(listObj, "HungVuongISOOutput", "mdl_course");
	}

}
