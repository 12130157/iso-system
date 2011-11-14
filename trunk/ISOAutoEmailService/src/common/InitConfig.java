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
		Constant.listGio = new String[24];
		Constant.listPhut = new String[60];
		Constant.listThu = new String[7];
		for (int i = 0; i < 60; i++) {
			Constant.listPhut[i] = i+"";
		}
		for (int i = 0; i < 24; i++) {
			Constant.listGio[i] = i+"";
		}
		Constant.listThu[0] = "Chủ Nhật";
		Constant.listThu[1] = "Thứ 2";
		Constant.listThu[2] = "Thứ 3";
		Constant.listThu[3] = "Thứ 4";
		Constant.listThu[4] = "Thứ 5";
		Constant.listThu[5] = "Thứ 6";
		Constant.listThu[6] = "Thứ 7";
		
		String [] n = Constant.SETTING_RES.getString("mailCC").split(";");
		for (String mail : n) {
			Constant.mailCC.add(mail);
		}
		System.out.println("Khởi tạo biến thành công !!!");
	}
}
