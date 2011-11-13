import view.AutoEmailService;

import common.InitConfig;


public class ISOAutoEmailService {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		InitConfig.init();
		new AutoEmailService();
	}

}
