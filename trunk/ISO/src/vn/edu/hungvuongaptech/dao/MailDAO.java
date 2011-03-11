/**
 * 
 */
package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.SendMailListCongTacModel;
import vn.edu.hungvuongaptech.util.DataUtil;

/**
 * @author ThienVD
 * 
 */
public class MailDAO {
	public static String getMailListByMaVaiTro(String roleID) {
		String result = "";
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getEmailByMaVaiTro"));
			preparedStatement.setString(1, roleID);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if (!rs.getString("EMAIL").equals("")) {
					result += rs.getString("EMAIL") + ";";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.length() == 0 ? result : result.substring(0, result
				.length() - 1);
	}
	// get tap hop mail admin
	public static ArrayList<String> getMailListOfAdmin() {
		ArrayList<String> result = new ArrayList<String>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getEmailOfAdmin"));
			preparedStatement.setString(1, Constant.ADMIN);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if (!rs.getString("EMAIL").equals("")) {
					result.add(rs.getString("EMAIL"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// get tap hop mail thanh vien bang ma bo phan
	
	public static ArrayList<String> getMailListByMaBoPhan(String maBoPhan) {
		ArrayList<String> result = new ArrayList<String>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getEmailByMaBoPhan"));
			preparedStatement.setString(1, maBoPhan);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if (!rs.getString("EMAIL").equals("")) {
					result.add(rs.getString("EMAIL"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static ArrayList<String> getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(String maNguoiLap) {
		ArrayList<String> result = new ArrayList<String>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(?,?,?)}");
			csmt.setString("Ma_nguoi_lap", maNguoiLap);
			csmt.setString("Ma_truong_khoa", Constant.TRUONG_KHOA);
			csmt.setString("Ma_pho_khoa", Constant.PHO_KHOA);
			ResultSet rs = DataUtil.executeStore(csmt);
			while (rs.next()) {
				if (!rs.getString("EMAIL").equals("")) {
					result.add(rs.getString("EMAIL"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static String getMailByMaThanhVien(String maThanhVien) {
		String result = "";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getEmailByMaThanhVien"));
			preparedStatement.setString(1, maThanhVien);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				result += rs.getString("EMAIL");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.trim();
	}

	public static String getSubjectNhacNhoByChucNang(String maChucNang){
		if(maChucNang.equals(Constant.CHUCNANG_GIAOAN)){
			return "[ISO] - Thong Bao - Thuc Hien - GIAO AN";	
		}
		else if(maChucNang.equals(Constant.CHUCNANG_KEHOACHGIANGDAY)){
			return "[ISO] - Thong Bao - Thuc Hien - KE HOACH GIANG DAY";	
		}
		else {
			return "";
		}
	}
	
	public static String getSubjectReviewByChucNang(String maChucNang) {
		if (maChucNang.equals(Constant.CHUCNANG_KEHOACHDAOTAO)) {
			return "[ISO] - Thong Bao - Review - KE HOACH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHTHANG)) {
			return "[ISO] - Thong Bao - Review - KE HOACH THANG";
		} else if (maChucNang.equals(Constant.CHUCNANG_QUYETDINHDAOTAO)) {
			return "[ISO] - Thong Bao - Review - QUYET DINH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_DECUONGMONHOC)) {
			return "[ISO] - Thong Bao - Review - DE CUONG MON HOC";
		} else if (maChucNang.equals(Constant.CHUCNANG_CHUONGTRINHDAOTAO)) {
			return "[ISO] - Thong Bao - Review - CHUONG TRINH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_THOIKHOABIEU)) {
			return "[ISO] - Thong Bao - Review - THOI KHOA BIEU";
		} else if(maChucNang.equals(Constant.CHUCNANG_GIAOAN)){
			return "[ISO] - Thong Bao - Review - GIAO AN";	
		}
		else {
			return "[ISO] - Thong Bao - Review - KE HOACH GIANG DAY";
		}
	}

	public static String getSubjectApproveByChucNang(String maChucNang) {
		if (maChucNang.equals(Constant.CHUCNANG_KEHOACHDAOTAO)) {
			return "[ISO] - Thong Bao - Approve - KE HOACH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHTHANG)) {
			return "[ISO] - Thong Bao - Approve - KE HOACH THANG";
		} else if (maChucNang.equals(Constant.CHUCNANG_QUYETDINHDAOTAO)) {
			return "[ISO] - Thong Bao - Approve - QUYET DINH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_DECUONGMONHOC)) {
			return "[ISO] - Thong Bao - Approve - DE CUONG MON HOC";
		} else if (maChucNang.equals(Constant.CHUCNANG_CHUONGTRINHDAOTAO)) {
			return "[ISO] - Thong Bao - Approve - CHUONG TRINH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_THOIKHOABIEU)) {
			return "[ISO] - Thong Bao - Approve - THOI KHOA BIEU";
		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHGIANGDAY)) {
			return "[ISO] - Thong Bao - Approve - KE HOACH GIANG DAY";
		} else if (maChucNang.equals(Constant.CHUCNANG_GIAOAN)) {
			return "[ISO] - Thong Bao - Approve - GIAO AN";
		}else{
			return null;
		}
	}

	public static String getSubjectRejectByChucNang(String maChucNang) {
		if (maChucNang.equals(Constant.CHUCNANG_KEHOACHDAOTAO)) {
			return "[ISO] - Thong Bao - Reject - KE HOACH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHTHANG)) {
			return "[ISO] - Thong Bao - Reject - KE HOACH THANG";
		} else if (maChucNang.equals(Constant.CHUCNANG_QUYETDINHDAOTAO)) {
			return "[ISO] - Thong Bao - Reject - QUYET DINH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_DECUONGMONHOC)) {
			return "[ISO] - Thong Bao - Reject - DE CUONG MON HOC";
		} else if (maChucNang.equals(Constant.CHUCNANG_CHUONGTRINHDAOTAO)) {
			return "[ISO] - Thong Bao - Reject - CHUONG TRINH DAO TAO";
		} else if (maChucNang.equals(Constant.CHUCNANG_THOIKHOABIEU)) {
			return "[ISO] - Thong Bao - Reject - THOI KHOA BIEU";
		}else if(maChucNang.equals(Constant.CHUCNANG_KEHOACHGIANGDAY)) {
			return "[ISO] - Thong Bao - Reject - KE HOACH GIANG DAY";
		}else if(maChucNang.equals(Constant.CHUCNANG_GIAOAN)){
			return "[ISO] - Thong Bao - Reject - GIAO AN";
		}
		else
			return "";
		
	}

	public static String getContentReviewByChucNang(String maChucNang,
			String ten, String tenNguoiLap, String ngayGui) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr></table>";

		result += "<br/> Hãy vào hệ thống ISO để duyệt chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}

	public static String getContentApproveByChucNang(String maChucNang,
			String ten, String tenNguoiLap, String ngayGui,
			String tenNguoiDuyet, String ngayDuyet) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr>";
		result += "<tr><td>Được approved bởi: </td><td><b>" + tenNguoiDuyet
				+ "</b></td></tr>";
		result += "<tr><td>Ngày approved: </td><td></b>" + ngayDuyet
				+ "</b></td></tr></table>";

		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	public static String getContentGetPass(String ten, String teDangNhap, String matKhau) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chào bạn  </td><td><b>" + ten
		+ "</b></td></tr>";
		result += "<tr><td>Tên đăng nhập của bạn : </td><td><b>" + teDangNhap
				+ "</b></td></tr>";
		result += "<tr><td>Mật khẩu của bạn : </td><td></b>" + matKhau
				+ "</b></td></tr></table>";

		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}

	public static String getContentRejectByChucNang(String maChucNang,
					String ten, String tenNguoiLap, String ngayGui,
						String tenNguoiDuyet, String ngayDuyet) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr>";
		result += "<tr><td>Được rejected bởi: </td><td><b>" + tenNguoiDuyet
				+ "</b></td></tr>";
		result += "<tr><td>Ngày rejected: </td><td></b>" + ngayDuyet
				+ "</b></td></tr></table>";

		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại chương trình này.<br/>";

		result += "<p><i> Đây là mai tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	public static String getContentUpdateByChucNang(String maChucNang,
			String ten, String tenNguoiLap, String ngayGui,
			String tenMonHoc) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr>";
		result += "<tr><td>Nội dung: </td><td><b>Chương trình đã được cập nhật, hãy vào hệ thống để kiểm tra và sửa lại Đề cương môn học " + tenMonHoc + " của chương trình này</b></td></tr></table>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	public static String getContentSendMailListCongTacNamHoc(String boSung,
			String ten, String tenNguoiLap, String ngayGui,
			String tenNguoiThucHien, ArrayList<SendMailListCongTacModel> listCongtac) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";
		String ngayBatDau = "";
		
		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + boSung + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr>";
		result += "<tr><td>Người thực hiện: </td><td><b>" + tenNguoiThucHien + "</b></td></tr></table>";

		for(int i=0;i<listCongtac.size();i++) {
			if(!listCongtac.get(i).getTuNgay().equals(ngayBatDau)) {
				result += "<u><p><b>Từ ngày " + listCongtac.get(i).getTuNgay() + " đến ngày " + listCongtac.get(i).getDenNgay() + "</b></p></u>";
				ngayBatDau = listCongtac.get(i).getTuNgay();
			}
			result += "<p>  - " + listCongtac.get(i).getNoiDungCongTac() + "</p>";
		}
		
		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	public static String getContentSendMailListCongTacTuan( String ngayGui,
			 String maChiTiet) {
		ChiTietKHDTModel chiTietKHDTModel = ChiTietKHDTDAO.timChiTietKHDTByID(maChiTiet);
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";
		String thu = "", buoi = "";
		String thuBangChu = "", buoiBangChu = "";
		
		result += "<table border=1><tr><td> Chương trình: </td><td><b>LỊCH CÔNG TÁC TUẦN</b></td></tr>";
		
		result += "<tr><td>Thời gian: </td><td><b>Từ ngày " + chiTietKHDTModel.getTuNgay() + " đến ngày " + chiTietKHDTModel.getDenNgay()
				+ "</b></td></tr>";
		result += "<tr><td>Được gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr></table>";
		//result += "<tr><td>Người thực hiện: </td><td><b>" + tenNguoiThucHien + "</b></td></tr></table>";

		for(int i=0;i<chiTietKHDTModel.getNoiDungChiTietKHDTModelList().size();i++) {
			if(chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getTinhTrangPhanCong().equals("1")) {
				if(!chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getThu().equals(thu)) {
					thu = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getThu();
					buoi = "";
					if(thu.equals("1")) {
						thuBangChu = "Thứ Hai";
					} else if(thu.equals("2")) {
						thuBangChu = "Thứ Ba";
					} else if(thu.equals("3")) {
						thuBangChu = "Thứ Tư";
					} else if(thu.equals("4")) {
						thuBangChu = "Thứ Năm";
					} else if(thu.equals("5")) {
						thuBangChu = "Thứ Sáu";
					} else if(thu.equals("6")) {
						thuBangChu = "Thứ Bảy";
					} else {
						thuBangChu = "Chủ Nhật";
					}
					result += "<u><p style='font-size: 22px'><b>" + thuBangChu + " " + chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getNgay() + "</b></p></u>";
				}
				if(!chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getBuoi().equals(buoi)) {
					buoi = chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getBuoi();
					if(buoi.equals("1"))
						buoiBangChu = "Sáng";
					else
						buoiBangChu = "Chiều";
					result += "<u><p style='font-size: 22px'>" + buoiBangChu + "</p></u>";
				}
				result += "<p style='font-size: 22px'>  - " + chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getGio() + "giờ" 
					+ chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getPhut() + "phút : " 
						+ chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getNoiDungCongTac();
				if(!chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getGhiChu().equals("") 
						&& chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getGhiChu() != null)
					result += "(" + chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i).getGhiChu() + ")";
				result += "</p>";
			}
		}
		result += "<p style='font-size: 22px'><b> Ghi chú </b> </p>";
		result += "<p style='font-size: 22px'><b> " + chiTietKHDTModel.getGhiChu().replaceAll("\n", "<br/>") + " </b> </p>";
		result += "<p style='font-size: 22px'><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	public static String getContentUpdateByChucNangAndDeleteMonHoc(String maChucNang,
			String ten, String tenNguoiLap, String ngayGui,
			String tenMonHoc) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr>";
		result += "<tr><td>Nội dung: </td><td><b>Chương trình đã được cập nhật, môn học " + tenMonHoc + " của chương trình và Đề cương môn học " + tenMonHoc + " đã bị xóa </b></td></tr></table>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	public static String mailPhongKiemDinhGuiHieuTruong(String maChucNang,
			String ten, String tenNguoiLap, String tenNguoiGui) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Được kiểm định bởi: </td><td></b>" + tenNguoiGui
				+ "</b></td></tr></table>";

		result += "<br/> Hãy vào hệ thống ISO để duyệt chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	
	public static String getContentEmailNhacNhoByChucNang(
			String ten, String tenNguoiLap, String ngayDay,String module) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Dạy ngày: </td><td></b>" + ngayDay
				+ "</b></td></tr></table>";
		
		result  = result+ "<br/><br/>Hiện tại đã là ngày: "+ SysParamsDAO.getSysParams().getGioHeThong()+" nhưng giáo viên vẫn chưa hoàn thành "+module+".";

		result += "<br/> Hãy vào hệ thống ISO (http://its.hungvuongtech.edu.vn:8080/HungVuongISO) để duyệt chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	
}
