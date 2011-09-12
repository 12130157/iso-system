package vn.edu.hungvuongaptech.model;

import java.util.Date;

public class ThoiGianGiangDayModel {
	private String batDau;
	private String ketThuc;
	private Date timeBatDau;
	private Date timeKetThuc;
	private String time;
	public String getBatDau() {
		return batDau;
	}
	public void setBatDau(String batDau) {
		this.batDau = batDau;
	}
	public String getKetThuc() {
		return ketThuc;
	}
	public void setKetThuc(String ketThuc) {
		this.ketThuc = ketThuc;
	}
	public Date getTimeBatDau() {
		return timeBatDau;
	}
	public void setTimeBatDau(Date timeBatDau) {
		this.timeBatDau = timeBatDau;
	}
	public Date getTimeKetThuc() {
		return timeKetThuc;
	}
	public void setTimeKetThuc(Date timeKetThuc) {
		this.timeKetThuc = timeKetThuc;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
