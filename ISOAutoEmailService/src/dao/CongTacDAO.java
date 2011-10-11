package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DataUtil;
import util.MailUtil;

public class CongTacDAO {
	public static void emailGiaoAnDelay(String ngayDelay) {
		ArrayList<String> mailTO = new ArrayList<String>();
		String subject = "[ISO] Thong Bao - Nhac nho thuc hien giao an";
		String content = " <p> Hệ thống ISO xin thông báo. </p> <p> Danh sách lớp sắp đến tiến độ giảng dạy nhưng giáo án chưa được soạn. </p><br/>";

		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall(
					"{call sp_ISO_GetGiaoAnDelayList(?)}");
			csmt.setNString("Day", ngayDelay);
			csmt.execute();
			
			PreparedStatement ps = DataUtil.getConnection().prepareStatement("SELECT * FROM GiaoAnDelayList");
			ResultSet rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					mailTO.add(rs.getString("Email"));
					content += "<br/><table border=1>";
					content += "<tr> <td>Họ tên giáo viên</td><td>"
							+ rs.getString("Ho_ten_giao_vien") + "</td></tr>";
					content += "<tr> <td>Lớp</td><td>"
							+ rs.getString("Ten_lop") + "</td></tr>";
					content += "<tr> <td>Môn học</td><td>"
							+ rs.getString("Ten_mon_hoc") + "</td></tr>";
					content += "<tr> <td>Giáo án số </td><td>"
							+ rs.getString("Giao_an_so") + "</td></tr>";
					content += "<tr> <td>Ngày dạy</td><td>"
							+ rs.getString("Ngay_day") + "</td></tr>";
					content += "<tr> <td>Nhóm</td><td>" + rs.getString("Nhom")
							+ "</td></tr>";
					content += "</table>";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		content += "<br/> Hãy vào hệ thống ISO để nhập GIÁO ÁN.<br/>";

		content += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		if (mailTO.size() > 0) {
			MailUtil.sendEmailToBoPhan(mailTO, new ArrayList<String>(),
					subject, content);
		}
	}
}
