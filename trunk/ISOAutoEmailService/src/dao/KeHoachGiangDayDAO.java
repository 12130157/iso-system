package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import common.Constant;

import util.DataUtil;
import util.MailUtil;

public class KeHoachGiangDayDAO {
	public static void soanKHGDDelay(){
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ISO_GetKHGDDelayList}");
			csmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void emailKHGDNhacNho(){
		ArrayList<String> mailTO = new ArrayList<String>();
		Format formatter2 = new SimpleDateFormat("h:mm:ss dd-MM-yyyy");
		String result = "";
		String subject = "[ISO] - Thong Bao - Nhac Nho - KE HOACH GIANG DAY";
		 
		result += " <p> Hệ thống ISO xin thông báo. </p>";
		result += "<p>Danh sách các giáo viên yêu cầu: </p>";
		// ********************************************************
		result = result
				+ "<table border='1'><tr><th>Giáo viên</th><th>Chương trình</th><th>Ngày Bắt Đầu</th></tr>";
		try {
			String sql = "SELECT B.Ten_mon_hoc,(C1.Ho+' '+C1.Ten_lot+' '+C1.Ten) as Giao_vien,C1.Email,D.Ki_hieu as Lop,A.Nam_bat_dau,A.Nam_ket_thuc,A.Hoc_ki "
						+" FROM KHGDDelayList A INNER JOIN MONHOC B ON B.ID=A.MA_MON_HOC "
						+" INNER JOIN THANHVIEN C ON C.ID=A.MA_GIAO_VIEN "
						+" INNER JOIN CHITIETTHANHVIEN C1 ON C1.TEN_DANG_NHAP=C.TEN_DN "
						+" INNER JOIN LOPHOC D ON D.ID=A.LOP "
						+" WHERE Co_hieu=1 AND DATEDIFF(DAY,GETDATE(),A.Ngay_day) >= 0 " 
						+" AND DATEDIFF(DAY,GETDATE(),A.Ngay_day) < "+Constant.SETTING_RES.getString("ngayDelay");
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				mailTO.add(rs.getString("Email"));
				String mes = "Đã gửi Email Nhắc Nhở đến "+rs.getString("Email")+" thành công vào lúc "+ formatter2.format(new Date());
				System.out.println(mes);
				Constant.model.addElement(mes);
				
				result = result + "<tr><td>";
				result = result
					+ rs.getString("Giao_vien") + "</td><td>"
					+ "KẾ HOẠCH GIẢNG DẠY học kỳ "+ rs.getString("Hoc_ki")+" niên khóa "+rs.getString("Nam_bat_dau")+"-"+rs.getString("Nam_ket_thuc")+" lớp "+rs.getString("Lop")+" môn "+rs.getString("Ten_mon_hoc")+"</td><td>"
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

		result += "<br/> Hãy vào hệ thống ISO (http://its.hungvuongtech.edu.vn:8080/HungVuongISO) để thực hiện chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";
		if (mailTO.size() > 0) {
			MailUtil.sendEmailToBoPhan(mailTO, Constant.mailCC,
				subject, result);
		}
	}
}
