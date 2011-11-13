package common;

import java.util.ResourceBundle;

import javax.swing.DefaultListModel;

public class InitConfig {
	public InitConfig() {
	
	}
	
	public static void init(){
		Constant.SETTING_RES = ResourceBundle.getBundle("setting");
		Constant.model = new DefaultListModel();
		System.out.println("Khởi tạo biến thành công !!!");
	}
}
