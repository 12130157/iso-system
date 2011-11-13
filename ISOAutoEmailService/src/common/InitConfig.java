package common;

import java.util.ArrayList;
import java.util.ResourceBundle;

import javax.swing.DefaultListModel;

public class InitConfig {
	public InitConfig() {
	
	}
	
	public static void init(){
		Constant.SETTING_RES = ResourceBundle.getBundle("setting");
		Constant.model = new DefaultListModel();
		Constant.mailCC = new ArrayList<String>();
		String [] n = Constant.SETTING_RES.getString("mailCC").split(";");
		for (String mail : n) {
			Constant.mailCC.add(mail);
		}
		System.out.println("Khởi tạo biến thành công !!!");
	}
}
