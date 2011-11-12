package controller;

import java.util.Date;
import java.util.TimerTask;

import common.Constant;

import dao.GiaoAnDAO;

public class EmailServiceController extends TimerTask {
	private String gio;
	private String phut;
	
	/*
	 * Gửi liên tục nhắc nhở trong vòng 7 ngày cho Giáo Viên chưa làm Giáo Án, tính từ ngày hiện tại với ngày dạy
	 * Mỗi tuần sẽ gửi cả trường danh sách không hoàn thành Giáo Án
	 */
	public EmailServiceController(String gio, String phut) {
		this.gio = gio;
		this.phut = phut;
	}
	
	@Override
	public void run() {
		System.out.println("Running...!!!");
		System.out.println(gio);
		System.out.println(phut);
		System.out.println(new Date());
		Date nowDate = new Date();
		String regex = "[0-9]*"; 
		
		if(gio.equals("") || phut.equals("")){
			gio = "0";
			phut = "0";
		}
		
		if(gio.matches(regex) && phut.matches(regex)){
			
			if(Integer.parseInt(gio) > 23){
				gio = "0";
			}
			
			if(Integer.parseInt(phut) > 59){
				phut = "0";
			}
			
			if(nowDate.getHours()==Integer.parseInt(gio) && nowDate.getMinutes()==Integer.parseInt(phut)){
				System.out.println("Đang kiểm tra giáo án !!!");
				GiaoAnDAO.soanGiaoAn(Constant.SETTING_RES.getString("ngayDelay"));
				System.out.println("Email Nhắc Nhở");
				GiaoAnDAO.emailGiaoAnNhacNho();
				System.out.println("------------------------------------------------------------");
				System.out.println("Email Thực Hiện");
				GiaoAnDAO.emailGiaoAnThucHien();
			}
		}else {
			System.out.println("Thời gian nhập vào không đúng qui định !!!");
		}
	}
	
	public String getGio() {
		return gio;
	}
	public void setGio(String gio) {
		this.gio = gio;
	}
	public String getPhut() {
		return phut;
	}
	public void setPhut(String phut) {
		this.phut = phut;
	}
	
	
}
