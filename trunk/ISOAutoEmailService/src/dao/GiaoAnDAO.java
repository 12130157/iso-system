package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import util.DataUtil;
import util.MailUtil;

public class GiaoAnDAO {
	public static void emailGiaoAnDelay(String ngayDelay, String coHieu) {
		ArrayList<String> mailTO = new ArrayList<String>();
		String result = "";
		String subject = "[ISO] - Thong Bao - Thuc Hien - GIAO AN";
		if(coHieu.equals("1")){
			subject = "[ISO] - Thong Bao - Nhac Nho - GIAO AN";
		}
		 
		result += " <p> Hệ thống ISO xin thông báo. </p>";
		result += "<p>Danh sách các giáo viên yêu cầu: </p>";
		// ********************************************************
		result = result
				+ "<table border='1'><tr><th>Giáo viên</th><th>Chương trình</th><th>Ngày dạy</th>";
				if(coHieu.equals("2")){
					result += "<th>Ngày gửi</th></tr>"; 
				}else {
					result += "</tr>";
				}
				
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall(
					"{call sp_ISO_GetGiaoAnDelayList(?)}");
			csmt.setNString("Day", ngayDelay);
			csmt.execute();
			
			PreparedStatement ps = DataUtil.getConnection().prepareStatement("SELECT * FROM GiaoAnDelayList WHERE Co_hieu=?");
			ps.setString(1, coHieu);
			ResultSet rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					mailTO.add(rs.getString("Email"));
					if(rs.getString("Ngay_gui").equals("") && coHieu.equals("2")){
						result = result + "<tr style='background-color: red;'><td>";
					}else{
						result = result + "<tr><td>";
					}
					result = result
					+ rs.getString("Ho_ten_giao_vien") + "</td><td>"
					+ "GIÁO ÁN - Giáo án số "+rs.getString("Giao_an_so")+" thuộc "+rs.getString("Ten_mon_hoc")+" - "+rs.getString("Ten_lop") + "</td><td>"
					+ rs.getString("Ngay_day") + "</td>";
					if(coHieu.equals("2")){
						result += "<td>"+rs.getString("Ngay_gui") + "</td></tr>"; 
					}else{
						result += "</tr>";
					}
				}
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
		if(coHieu.equals("1")){
			if (mailTO.size() > 0) {
				MailUtil.sendEmailToBoPhan(mailTO, new ArrayList<String>(),
						subject, result);
			}
		}else{
			ArrayList<String> mail = new ArrayList<String>();
			mail.add("thanhtc.hv@gmail.com");
			MailUtil.sendEmailToBoPhan(mail, new ArrayList<String>(),
					subject, result);
		}
		
	}
}
