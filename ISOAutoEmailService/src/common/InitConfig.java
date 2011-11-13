package common;

import java.util.ResourceBundle;

import javax.swing.DefaultListModel;

import controller.ThongBao;

public class InitConfig {
	public InitConfig() {
	
	}
	
	public static void init(){
		Constant.SETTING_RES = ResourceBundle.getBundle("setting");
		Constant.thongBao = new ThongBao();
		Constant.model = new DefaultListModel();
		System.out.println("Khởi tạo biến thành công !!!");
	}
}
