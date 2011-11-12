import common.Constant;
import common.InitConfig;
import controller.ThongBao;

import view.AutoEmailService;


public class ISOAutoEmailService {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		InitConfig.init();
		new AutoEmailService();
	}

}
