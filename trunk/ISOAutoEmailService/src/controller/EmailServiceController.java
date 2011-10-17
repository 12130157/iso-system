package controller;

import java.util.Date;
import java.util.TimerTask;

import dao.GiaoAnDAO;

public class EmailServiceController extends TimerTask {
	private String thu;
	private String gio;
	private String phut;
	
	/*
	 * Gửi liên tục nhắc nhở trong vòng 7 ngày cho Giáo Viên chưa làm Giáo Án, tính từ ngày hiện tại với ngày dạy
	 * Mỗi tuần sẽ gửi cả trường danh sách không hoàn thành Giáo Án
	 */
	public EmailServiceController(String thu, String gio, String phut) {
		this.thu = thu;
		this.gio = gio;
		this.phut = phut;
	}
	
	@Override
	public void run() {
		System.out.println("Running...!!!");
		System.out.println(thu);
		System.out.println(gio);
		System.out.println(phut);
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
				GiaoAnDAO.emailGiaoAnDelay("7","1");
			}
		}else {
			System.out.println("Thời gian nhập vào không đúng qui định !!!");
		}
		
				
		if(nowDate.getDay()==6 && nowDate.getHours()==11 && nowDate.getMinutes()==30){
			GiaoAnDAO.emailGiaoAnDelay("7","2");
		}

	}
	
	public String getThu() {
		return thu;
	}
	public void setThu(String thu) {
		this.thu = thu;
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
