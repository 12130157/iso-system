package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import util.DataUtil;
import util.MailUtil;

import common.Constant;

public class GiaoAnDAO {
	public static void soanGiaoAn(String ngayDelay) {		
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall(
					"{call sp_ISO_GetGiaoAnDelayList(?)}");
			csmt.setNString("Day", ngayDelay);
			csmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void emailGiaoAnNhacNho(){
		ArrayList<String> mailTO = new ArrayList<String>();
		ArrayList<String> mailCC = new ArrayList<String>();
		String result = "";
		//String subject = "[ISO] - Thong Bao - Thuc Hien - GIAO AN";
		String subject = "[ISO] - Thong Bao - Nhac Nho - GIAO AN";
		 
		result += " <p> Hệ thống ISO xin thông báo. </p>";
		result += "<p>Danh sách các giáo viên yêu cầu: </p>";
		// ********************************************************
		result = result
				+ "<table border='1'><tr><th>Giáo viên</th><th>Chương trình</th><th>Ngày dạy</th></tr>";
		try {
			String sql = "SELECT * FROM GiaoAnDelayList WHERE Co_hieu=1";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				mailTO.add(rs.getString("Email"));
				String mes = "Đã gửi Email Nhắc Nhở đến "+rs.getString("Email")+" thành công !!!";
				System.out.println(mes);
				Constant.model.addElement(mes);
				
				result = result + "<tr><td>";
				result = result
					+ rs.getString("Ho_ten_giao_vien") + "</td><td>"
					+ "GIÁO ÁN - Giáo án số "+rs.getString("Giao_an_so")+" thuộc "+rs.getString("Ten_mon_hoc")+" - "+rs.getString("Ten_lop") + "</td><td>"
					+ rs.getString("Ngay_day") + "</td></tr>";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
			
		result = result + "</table>";
		Format formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date nowDate = new Date();
		result = result
			+ "<br/><br/>Hiện tại đã là ngày: "
			+ formatter.format(nowDate)
			+ " nhưng giáo viên vẫn chưa hoàn thành.";

		result += "<br/> Hãy vào hệ thống ISO (http://its.hungvuongtech.edu.vn:8080/HungVuongISO) để duyệt chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";
		if (mailTO.size() > 0) {
			MailUtil.sendEmailToBoPhan(mailTO, mailCC,
				subject, result);
		}
	}
	
	public static void emailGiaoAnThucHien(){
		ArrayList<String> mailTO = new ArrayList<String>();
		ArrayList<String> mailCC = new ArrayList<String>();
		mailTO.add(Constant.SETTING_RES.getString("mailHungVuongSystem"));
		mailCC.add(Constant.SETTING_RES.getString("mailCC"));
		String result = "";
		String subject = "[ISO] - Thong Bao - Thuc Hien - GIAO AN";
		 
		result += " <p> Hệ thống ISO xin thông báo. </p>";
		result += "<p>Danh sách các giáo viên yêu cầu: </p>";
		// ********************************************************
		result = result
				+ "<table border='1'><tr><th>Giáo viên</th><th>Chương trình</th><th>Ngày dạy</th><th>Ngày gửi</th></tr>";
	
		try {
			String sql = "SELECT * FROM GiaoAnDelayList WHERE Co_hieu=2";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if(rs.getString("Ngay_gui").equals("")){
					result += "<tr style='background-color: red;'><td>";
				}else{
					result += "<tr><td>";
				}
				
				result += rs.getString("Ho_ten_giao_vien") + "</td><td>"
					+ "GIÁO ÁN - Giáo án số "+rs.getString("Giao_an_so")+" thuộc "+rs.getString("Ten_mon_hoc")+" - "+rs.getString("Ten_lop") + "</td><td>"
					+ rs.getString("Ngay_day") + "</td><td>"
					+ rs.getString("Ngay_gui") + "</td></tr>"; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
			
		result = result + "</table>";
		Format formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date nowDate = new Date();
		result = result
			+ "<br/><br/>Hiện tại đã là ngày: "
			+ formatter.format(nowDate)
			+ " nhưng giáo viên vẫn chưa hoàn thành.";

		result += "<br/> Hãy vào hệ thống ISO (http://its.hungvuongtech.edu.vn:8080/HungVuongISO) để duyệt chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";
		
		MailUtil.sendEmailToBoPhan(mailTO, mailCC, subject, result);
		System.out.println("Đã gửi Email Thực Hiện Giáo Án thành công !!!");
	}
}
