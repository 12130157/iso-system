/**
 * 
 */
package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.common.DateType;
import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.SendMailListCongTacModel;
import vn.edu.hungvuongaptech.model.ThanhVienNhacNhoModel;
import vn.edu.hungvuongaptech.model.ThanhVienNhacNhoModel2;
import vn.edu.hungvuongaptech.taglib.ChangeStringTaglib;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

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

	public static ArrayList<String> getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(
			String maNguoiLap) {
		ArrayList<String> result = new ArrayList<String>();
		try {
			CallableStatement csmt = DataUtil
					.getConnection()
					.prepareCall(
							"{call sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(?,?,?)}");
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

	public static String getSubjectNhacNhoByChucNang(String maChucNang) {
		if (maChucNang.equals(Constant.CHUCNANG_GIAOAN)) {
			return "[ISO] - Thong Bao - Thuc Hien - GIAO AN";

		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHGIANGDAY)) {
			return "[ISO] - Thong Bao - Thuc Hien - KE HOACH GIANG DAY";

		} else if (maChucNang.equals(Constant.CHUCNANG_KYHOPDONGLANDAU)) {
			return "[ISO] - Thong Bao - Thuc Hien - DE XUAT KY HOP DONG";
		}

		else if (maChucNang.equals(Constant.CHUCNANG_DENGHIKHOANTHUVIEC)) {
			return "[ISO] - Thong Bao - Thuc Hien - DE NGHI KHOAN THU VIEC";
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
		} else if (maChucNang.equals(Constant.CHUCNANG_GIAOAN)) {
			return "[ISO] - Thong Bao - Review - GIAO AN";
		} else if (maChucNang.equals(Constant.CHUCNANG_DENGHINHANSU)) {
			return "[ISO] - Thong Bao - Review - DE NGHI NHAN SU";
		} else if (maChucNang.equals(Constant.CHUCNANG_DENGHIKHOANTHUVIEC)) {
			return "[ISO] - Thong Bao - Review - DE NGHI KHOAN THU VIEC";
		} else if (maChucNang.equals(Constant.CHUCNANG_NHANXETKETQUATHUVIEC)) {
			return "[ISO] - Thong Bao - Review - NHAN XET KET QUA THU VIEC";
		} else if (maChucNang.equals(Constant.CHUCNANG_KYHOPDONGLANDAU)) {
			return "[ISO] - Thong Bao - Review - KY HOP DONG LAN DAU";
		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHTNS)) {
			return "[ISO] - Thong Bao - Review - KE HOACH TUYEN NHAN SU";
		} else if (maChucNang.equals(Constant.CHUCNANG_BANGPHANCONG)) {
			return "[ISO] - Thong Bao - Review - PHAN CONG GIAO VIEN";
		} else {
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
		} else if (maChucNang.equals(Constant.CHUCNANG_DENGHINHANSU)) {
			return "[ISO] - Thong Bao - Approve - DE NGHI NHAN SU";
		} else if (maChucNang.equals(Constant.CHUCNANG_DENGHIKHOANTHUVIEC)) {
			return "[ISO] - Thong Bao - Approve - DE NGHI KHOAN THU VIEC";
		} else if (maChucNang.equals(Constant.CHUCNANG_KYHOPDONGLANDAU)) {
			return "[ISO] - Thong Bao - Approve - KY HOP DONG LAN DAU";
		} else if (maChucNang.equals(Constant.CHUCNANG_NHANXETKETQUATHUVIEC)) {
			return "[ISO] - Thong Bao - Approve - NHAN XET KET QUA THU VIEC";
		} else if (maChucNang.equals(Constant.CHUCNANG_HOSODUTUYEN)) {
			return "[ISO] - Thong Bao - Approve - HO SO DU TUYEN";
		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHTNS)) {
			return "[ISO] - Thong Bao - Approve - KE HOACH TUYEN NHAN SU";
		} else if (maChucNang.equals(Constant.CHUCNANG_BANGPHANCONG)) {
			return "[ISO] - Thong Bao - Approve - PHAN CONG GIAO VIEN";
		} else if(maChucNang.equals(Constant.CHUCNANG_DONXINTHOIVIEC)){
			return "[ISO] - Thong Bao - Approve - DON XIN THOI VIEC";	
		} else {
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
		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHGIANGDAY)) {
			return "[ISO] - Thong Bao - Reject - KE HOACH GIANG DAY";
		} else if (maChucNang.equals(Constant.CHUCNANG_GIAOAN)) {
			return "[ISO] - Thong Bao - Reject - GIAO AN";
		} else if (maChucNang.equals(Constant.CHUCNANG_DENGHINHANSU)) {
			return "[ISO] - Thong Bao - Reject - DE NGHI NHAN SU";
		} else if (maChucNang.equals(Constant.CHUCNANG_DENGHIKHOANTHUVIEC)) {
			return "[ISO] - Thong Bao - Reject - DE NGHI KHOAN THU VIEC";
		} else if (maChucNang.equals(Constant.CHUCNANG_NHANXETKETQUATHUVIEC)) {
			return "[ISO] - Thong Bao - Reject - NHAN XET KET QUA THU VIEC";
		} else if (maChucNang.equals(Constant.CHUCNANG_KYHOPDONGLANDAU)) {
			return "[ISO] - Thong Bao - Reject - KY HOP DONG LAN DAU";
		} else if (maChucNang.equals(Constant.CHUCNANG_KEHOACHTNS)) {
			return "[ISO] - Thong Bao - Reject - KE HOACH TUYEN NHAN SU";
		} else if (maChucNang.equals(Constant.CHUCNANG_BANGPHANCONG)) {
			return "[ISO] - Thong Bao - Reject - PHAN CONG GIAO VIEN";
		} else if(maChucNang.equals(Constant.CHUCNANG_DONXINTHOIVIEC)){
			return "[ISO] - Thong Bao - Reject - DON XIN THOI VIEC";	
		} else
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

	public static String getContentGetPass(String ten, String teDangNhap,
			String matKhau) {
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
			String ten, String tenNguoiLap, String ngayGui, String tenMonHoc) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr>";
		result += "<tr><td>Nội dung: </td><td><b>Chương trình đã được cập nhật, hãy vào hệ thống để kiểm tra và sửa lại Đề cương môn học "
				+ tenMonHoc + " của chương trình này</b></td></tr></table>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}

	public static String getContentSendMailListCongTacNamHoc(String boSung,
			String ten, String tenNguoiLap, String ngayGui,
			String tenNguoiThucHien,
			ArrayList<SendMailListCongTacModel> listCongtac) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";
		String ngayBatDau = "";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>"
				+ boSung + ten + "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr>";
		result += "<tr><td>Người thực hiện: </td><td><b>" + tenNguoiThucHien
				+ "</b></td></tr></table>";

		for (int i = 0; i < listCongtac.size(); i++) {
			if (!listCongtac.get(i).getTuNgay().equals(ngayBatDau)) {
				result += "<u><p><b>Từ ngày " + listCongtac.get(i).getTuNgay()
						+ " đến ngày " + listCongtac.get(i).getDenNgay()
						+ "</b></p></u>";
				ngayBatDau = listCongtac.get(i).getTuNgay();
			}
			result += "<p>  - " + listCongtac.get(i).getNoiDungCongTac()
					+ "</p>";
		}

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}

	public static String getContentSendMailListCongTacTuan(String ngayGui,
			String maChiTiet) {
		ChiTietKHDTModel chiTietKHDTModel = ChiTietKHDTDAO
				.timChiTietKHDTByID(maChiTiet);
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";
		String thu = "", buoi = "";
		String thuBangChu = "", buoiBangChu = "";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>LỊCH CÔNG TÁC TUẦN</b></td></tr>";

		result += "<tr><td>Thời gian: </td><td><b>Từ ngày "
				+ chiTietKHDTModel.getTuNgay() + " đến ngày "
				+ chiTietKHDTModel.getDenNgay() + "</b></td></tr>";
		result += "<tr><td>Được gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr></table>";
		// result += "<tr><td>Người thực hiện: </td><td><b>" + tenNguoiThucHien
		// + "</b></td></tr></table>";

		for (int i = 0; i < chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
				.size(); i++) {
			if (chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i)
					.getTinhTrangPhanCong().equals("1")) {
				if (!chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i)
						.getThu().equals(thu)) {
					thu = chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
							.get(i).getThu();
					buoi = "";
					if (thu.equals("1")) {
						thuBangChu = "Thứ Hai";
					} else if (thu.equals("2")) {
						thuBangChu = "Thứ Ba";
					} else if (thu.equals("3")) {
						thuBangChu = "Thứ Tư";
					} else if (thu.equals("4")) {
						thuBangChu = "Thứ Năm";
					} else if (thu.equals("5")) {
						thuBangChu = "Thứ Sáu";
					} else if (thu.equals("6")) {
						thuBangChu = "Thứ Bảy";
					} else {
						thuBangChu = "Chủ Nhật";
					}
					result += "<u><p style='font-size: 18px'><b>"
							+ thuBangChu
							+ " "
							+ chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
									.get(i).getNgay() + "</b></p></u>";
				}
				if (!chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i)
						.getBuoi().equals(buoi)) {
					buoi = chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
							.get(i).getBuoi();
					if (buoi.equals("1"))
						buoiBangChu = "Sáng";
					else
						buoiBangChu = "Chiều";
					result += "<u><p style='font-size: 18px'>" + buoiBangChu
							+ "</p></u>";
				}
				result += "<p style='font-size: 18px'>  - "
						+ chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
								.get(i).getGio()
						+ "giờ"
						+ chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
								.get(i).getPhut()
						+ "phút : "
						+ chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
								.get(i).getNoiDungCongTac();
				if (!chiTietKHDTModel.getNoiDungChiTietKHDTModelList().get(i)
						.getGhiChu().equals("")
						&& chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
								.get(i).getGhiChu() != null)
					result += "("
							+ chiTietKHDTModel.getNoiDungChiTietKHDTModelList()
									.get(i).getGhiChu() + ")";
				result += "</p>";
			}
		}
		result += "<p style='font-size: 18px'><b> Ghi chú </b> </p>";
		result += "<p style='font-size: 18px'><b> "
				+ chiTietKHDTModel.getGhiChu().replaceAll("\n", "<br/>")
				+ " </b> </p>";
		result += "<p style='font-size: 18px'><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}

	public static String getContentUpdateByChucNangAndDeleteMonHoc(
			String maChucNang, String ten, String tenNguoiLap, String ngayGui,
			String tenMonHoc) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td></b>" + ngayGui
				+ "</b></td></tr>";
		result += "<tr><td>Nội dung: </td><td><b>Chương trình đã được cập nhật, môn học "
				+ tenMonHoc
				+ " của chương trình và Đề cương môn học "
				+ tenMonHoc + " đã bị xóa </b></td></tr></table>";

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

	public static String getContentEmailNhacNhoByChucNang(String ten,
			String tenNguoiLap, String ngayDay, String module) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Dạy ngày: </td><td></b>" + ngayDay
				+ "</b></td></tr></table>";

		result = result + "<br/><br/>Hiện tại đã là ngày: "
				+ SysParamsDAO.getSysParams().getGioHeThong()
				+ " nhưng giáo viên vẫn chưa hoàn thành " + module + ".";

		result += "<br/> Hãy vào hệ thống ISO (http://its.hungvuongtech.edu.vn:8080/HungVuongISO) để duyệt chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}

	/* public static String getContentEmailNhacNho2ByChucNang(
			ArrayList<ThanhVienNhacNhoModel> thanhVienList) {
		String result = "";
		result = " <p> Hệ thống ISO xin thông báo. </p><br/>";
		result = result + "<p>Danh sách các giáo viên yêu cầu: </p>";
		// ********************************************************
		result = result
				+ "<table border='1'><tr><th>Giáo viên</th><th>Chương trình</th><th>Ngày dạy</th></tr>";
		for (int i = 0; i < thanhVienList.size(); i++) {
			String tenChuongTrinh = thanhVienList.get(i).getTenChuongTrinh();
			result = result + "<tr><td>"
					+ thanhVienList.get(i).getTenThanhVien() + "</td><td>"
					+ tenChuongTrinh + "</td><td>"
					+ thanhVienList.get(i).getNgayDay() + "</td></tr>";
		}
		result = result + "</table>";

		// ********************************************************
		result = result
				+ "<br/><br/>Hiện tại đã là ngày: "
				+ DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong(),
						DateType.TYPE_2)
				+ " nhưng giáo viên vẫn chưa hoàn thành.";

		result += "<br/> Hãy vào hệ thống ISO (http://its.hungvuongtech.edu.vn:8080/HungVuongISO) để duyệt chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";
		return result;
	} */
	
	public static String getContentEmailNhacNho2ByChucNang(String tenChucNang,
			ArrayList<ThanhVienNhacNhoModel2> thanhVienList) {
		String result = "";
		result = " <p> Hệ thống ISO xin thông báo. </p><br/>";
		result = result + "<p>Danh sách các giáo viên yêu cầu: </p>";
		// ********************************************************
		result = result
				+ "<table border='1'><tr><th>Giáo viên</th><th>Chương trình</th><th>Ngày dạy</th></tr>";
		for (int i = 0; i < thanhVienList.size(); i++) {
			String tenChuongTrinh = tenChucNang + " - " +thanhVienList.get(i).getTenChuongTrinh();
			result = result + "<tr><td>"
					+ thanhVienList.get(i).getTenThanhVien() + "</td><td>"
					+ tenChuongTrinh + "</td><td>"
					+ thanhVienList.get(i).getNgayDay() + "</td></tr>";
		}
		result = result + "</table>";

		// ********************************************************
		result = result
				+ "<br/><br/>Hiện tại đã là ngày: "
				+ DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong(),
						DateType.TYPE_2)
				+ " nhưng giáo viên vẫn chưa hoàn thành.";

		result += "<br/> Hãy vào hệ thống ISO (http://its.hungvuongtech.edu.vn:8080/HungVuongISO) để duyệt chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";
		return result;
	}

	/******************** ++ HỆ THỐNG QUẢN LÝ NHÂN SỰ **************************/

	/*
	 * Author : ThanhTC CreateDate : 20/7/2011 Review By : ThienVD
	 */

	public static String getContentApproveByChucNang_NhanSu(String maChucNang,
			String ten, String tenNguoiLap, String ngayGui,
			String tk,String tkDuyet,
			String pdt, String pdtDuyet,
			String phc, String phcDuyet,
			String ht,String htDuyet) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";

		result += "<table border=1><tr><td> Chương trình: </td><td><b>" + ten
				+ "</b></td></tr>";
		result += "<tr><td>Được tạo bởi: </td><td><b>" + tenNguoiLap
				+ "</b></td></tr>";
		result += "<tr><td>Đã gửi ngày: </td><td><b>" + ngayGui
				+ "</b></td></tr>";
		if(tk!=null){
			result += "<tr><td>Trưởng Khoa approved: </td><td><b>" + tk
					+ "</b></td></tr>";
			result += "<tr><td>Ngày approved: </td><td><b>" + tkDuyet
					+ "</b></td></tr>";
		}
		
		if(pdt!=null){
			result += "<tr><td>Phòng Đào Tạo approved: </td><td><b>" + pdt
					+ "</b></td></tr>";
			result += "<tr><td>Ngày approved: </td><td><b>" + pdtDuyet
					+ "</b></td></tr>";
		}
		if(phc!=null){
			result += "<tr><td>Phòng Hành Chánh approved: </td><td><b>" + phc
					+ "</b></td></tr>";
			result += "<tr><td>Ngày approved: </td><td><b>" + phcDuyet
					+ "</b></td></tr>";
		}
		if(ht!=null){
			result += "<tr><td>Hiệu Trưởng approved: </td><td><b>" + ht
					+ "</b></td></tr>";
			result += "<tr><td>Ngày approved: </td><td><b>" + htDuyet
					+ "</b></td></tr>";
		}
		result += "</table>";
		
		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	public static String getContentApproveHoSoDuTuyen(String hoTen,
			String tenDangNhap, String matKhau,
			String tenNguoiDuyet, String ngayDuyet) {
		String result = " <p> Hệ thống ISO xin thông báo. </p><br/>";
		result += "Chào "+hoTen+", Bạn đã được tuyển dụng tại trường TCNKTCN Hùng Vương !!! <br/>";
		result += "<table border=1><tr><td> Họ tên : </td><td><b>" + hoTen
				+ "</b></td></tr>";
		result += "<tr><td>Tên đăng nhập của bạn : </td><td><b>" + tenDangNhap
				+ "</b></td></tr>";
		result += "<tr><td>Mật khẩu của bạn : </td><td><b>" + matKhau
				+ "</b></td></tr>";
		result += "<tr><td>Được tuyển dụng bởi: </td><td><b>" + tenNguoiDuyet
				+ "</b></td></tr>";
		result += "<tr><td>Vào lúc : </td><td></b>" + ngayDuyet
				+ "</b></td></tr></table>";

		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	public static String getContentApproveNhanXetKetQuaThuViec(String maChucNang,
			String ten, String tenNguoiLap, String ngayGui,
			String tenNguoiDuyet, String ngayDuyet, String ghiChu) {
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
				+ "</b></td></tr>";
		result += "<tr><td>Nhận Xét và yêu cầu <br/>Trưởng Bộ Phận </td><td><b>" + ghiChu
				+ "</b></td></tr></table>";

		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	public static String getContentApproveHopDongLaoDong(String maChucNang,
			String ten, String tenNguoiLap, String ngayGui,
			String tenNguoiDuyet, String ngayDuyet, String tenVaiTro, String tenBoPhan, String ngayBatDau, String ngayKetThuc) {
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
		
		result += "<br/> Chúc mừng, từ nay bạn đã là Nhân Viên Chính Thức <br/>";
		result += "<br/> Vai trò "+tenVaiTro+" thuộc Khoa "+tenBoPhan+"<br/>";
		result += "<br/> Bạn sẽ bắt đầu công việc vào ngày "+ngayBatDau+" đến hết ngày "+ngayKetThuc+"<br/>";
		
		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	public static String getContentApproveDeNghiKhoanThuViec(String maChucNang,
			String ten, String tenNguoiLap, String ngayGui,
			String tenNguoiDuyet, String ngayDuyet, String tenVaiTro, String tenBoPhan, String ngayBatDau, String ngayKetThuc, String Luong) {
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
		
		result += "<br/> Chúc mừng, từ nay bạn đã là Nhân Viên Thử Việc <br/>";
		result += "<br/> Vai trò "+tenVaiTro+" thuộc Khoa "+tenBoPhan+"<br/>";
		result += "<br/> Bạn sẽ bắt đầu công việc vào ngày "+ngayBatDau+" đến hết ngày "+ngayKetThuc+"<br/>";
		result += "<br/> Tiền Lương : "+Luong+"/ tháng <br/>";
		
		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại chương trình này.<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}

	public static String getContentDeXuatKyHopDongLanDau(String hoTenNDT,
			String tenNguoiDuyet, String ngayDuyet, String ghiChu) {
		String result = " <p> Hệ thống ISO xin thông báo </p><br/>";

		result += "<table border=1><tr><td> Người Dự Tuyển: </td><td><b>"
				+ hoTenNDT + "</b></td></tr>";
		result += "<tr><td>Được đánh giá nhận xét bởi: </td><td><b>"
				+ tenNguoiDuyet + "</b></td></tr>";
		result += "<tr><td>Được đánh giá nhận xét ngày: </td><td></b>"
				+ ngayDuyet + "</b></td></tr>";
		result += "<tr><td>Nội Dung Nhận Xét: </td><td></b>" + ghiChu
				+ "</b></td></tr></table>";

		result += "<br/> Hãy vào hệ thống ISO để kiểm tra và Lập Bản Ký Hợp Đồng Lần Đầu đối với "
				+ hoTenNDT + ".<br/>";

		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";

		return result;
	}
	
	public static String getContentRejectByChucNangCoLyDoReject(String maChucNang,
		String ten, String tenNguoiLap, String ngayGui,
		String tenNguoiDuyet, String ngayDuyet, String lyDoReject) {
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
					+ "</b></td></tr>";
		result += "<tr><td>Lý do rejected: </td><td></b>" + lyDoReject
					+ "</b></td></tr></table>";
			
		result += "<br/> Hãy vào hệ thống ISO để kiểm tra lại chương trình này.<br/>";
			
		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";
			
		return result;
	}

	public static String getContentDeNghiKhoanThuViec(String hoTenNDT,
		String tenNguoiDuyet, String ngayDuyet, String tenBoPhan) {
		String result = " <p> Hệ thống ISO xin thông báo Trưởng Khoa "+tenBoPhan+". </p><br/>";
			
		result += "<table border=1><tr><td> Người Dự Tuyển: </td><td><b>" + hoTenNDT
					+ "</b></td></tr>";
		result += "<tr><td>Được tuyển dụng bởi: </td><td><b>" + tenNguoiDuyet
					+ "</b></td></tr>";
		result += "<tr><td>Đã tuyển ngày: </td><td></b>" + ngayDuyet
					+ "</b></td></tr></table>";
			
		result += "<br/> Hãy vào hệ thống ISO để kiểm tra và Lập Đề Nghị Khoán Thử Việc cho "+hoTenNDT+".<br/>";
			
		result += "<p><i> Đây là mail tự động của hệ thống, xin vui lòng đừng hồi âm. </i> </p>";
			
		return result;
	}


	/******************** -- HỆ THỐNG QUẢN LÝ NHÂN SỰ **************************/
}
