
package vn.edu.hungvuongaptech.common;

import java.util.ResourceBundle;


public class Constant {
	
	public static String NUM_ROWS_ADMIN = "20";
	public static String NUM_ROWS_THIETBI = "2";
	public static String USERID_ATT = "maThanhVien";
	public static String USERNAME_ATT = "tenDangNhap";
	public static String FULLNAME_ATT = "tenThanhVien";
	public static String PASSWORD_ATT = "matKhau";
	public static String EMAIL_ATT = "email";
	public static String ROLE_ATT = "maVaiTro";
	public static String ROLE_NAME_ATT = "tenVaiTro";
	public static String MA_BO_PHAN_ATT = "maBoPhan"; // ma bo phan cua thanh vien
	public static String TEN_BO_PHAN_ATT = "tenBoPhan"; // ten bo phan cua thanh vien
	public static String MA_LOP = "maLop"; //ma lop cua thanh vien
	public static String Ki_Hieu_Lop = "kiHieuLop";//ki hieu lop cua sinh vien
	public static String ROLE_APP_LIST_ATT = "roleAppList";
	public static String ROLE_MENU_LIST_ATT = "roleMenuList";
	public static String INTRO_ATT = "intro";
	public static String KE_HOACH_DAO_TAO_ATT = "keHoachDaoTao";
	public static String CHUONG_TRINH_DAO_TAO_ATT = "chuongTrinhDaoTao";
	public static String THOI_KHOA_BIEU_ATT = "thoiKhoaBieu";
	public static String QUYET_DINH_ATT = "quyetDinh";
	public static String KE_HOACH_GIANG_DAY_ATT = "kehoachgiangday";
	public static String DE_CUONG_MON_HOC_ATT = "deCuongMonHoc";
	public static String MON_HOC_TKB_ATT = "monHocTKB";
	public static String KE_HOACH_THANG_ATT = "keHoachThang";

	public static String MA_VAI_TRO_GV = "8";
	public static String MA_VAI_TRO_TK = "5";
	public static String MA_VAI_TRO_PK = "6";
	public static String MA_VAI_TRO_TBM = "7";
	public static String MA_VAI_TRO_HS = "9";
	
	public static String CHI_TIET_KHDT_ATT = "chiTietKHDT";

	
	public static ResourceBundle SETTING_RES = null;
	public static ResourceBundle PATH_RES = null;
	public static ResourceBundle SQL_RES = null;
	public static ResourceBundle MESSAGE_RES = null;
	
	public static Integer NUM_ROWS = 1;
	
	public static String ADMIN = "0";
	public static String HIEU_TRUONG = "1";
	public static String HIEU_PHO = "2";
	public static String TRUONG_PHONG = "3";
	public static String PHO_PHONG = "4";
	public static String TRUONG_KHOA = "5";
	public static String PHO_KHOA = "6";
	public static String TRUONG_BO_MON = "7";
	public static String GIAO_VIEN = "8";
	public static String SINH_VIEN = "9";
	
	public static String PHONG_HANH_CHANH = "";
	public static String PHONG_DAO_TAO = "7";
	
	public static String TINHTRANG_NEW = "0";
	public static String TINHTRANG_SEND = "1";
	public static String TINHTRANG_APPROVE = "2";
	public static String TINHTRANG_REJECT = "3";
	public static String TINHTRANG_PENDING = "4"; // Tinh trang chuong trinh khi duoc gui cho Phong kiem dinh

	public static String TINHTRANG_TK_APPROVE = "1";
	public static String TINHTRANG_TK_REJECT = "3";
	public static String TINHTRANG_TK_SEND = "2";
	public static String TINHTRANG_BO_SUNG = "4";
	public static String TINHTRANG_HT_NEW="0";
	public static String TINHTRANG_HT_SEND="1";
	public static String TINHTRANG_HT_APPROVE="2";
	public static String TINHTRANG_HT_REJECT="3";
	
	public static Integer RECORDS_PER_PAGE = 30;
	public static Integer CHECK_ROWS = 0;
	public static Integer ALL_RECORDS = 0;
	
	public static String CHUCNANG_KEHOACHDAOTAO = "0";
	public static String CHUCNANG_QUYETDINHDAOTAO = "1";
	public static String CHUCNANG_DECUONGMONHOC = "2";
	public static String CHUCNANG_CHUONGTRINHDAOTAO = "3";
	public static String CHUCNANG_THOIKHOABIEU = "4";
	public static String CHUCNANG_KEHOACHGIANGDAY = "5";
	public static String CHUCNANG_GIAOAN="6";
	public static String CHUCNANG_KEHOACHTHANG = "7";
	public static String CHUCNANG_TOTRINH = "14";
	public static String CHUCNANG_BANGPHANCONG = "15";
	
	public static String CHUCNANG_ADMIN_MENU="18";
	
	//public static String CHUCNANG_DIEMDANH_MENU="2";
	
	public static String APP_ADMIN = "0";
	public static String APP_ISO = "1";
	public static String APP_DIEMDANH = "2";
	public static String APP_XEMDIEM = "3";
	public static String APP_FEEDBACK = "4";
	//public static String APP_BAOCAO = "5";
	public static String APP_QUANLYTHIETBI = "5";
	public static String APP_QUANLYSINHVIEN = "7";	
	
	public static Integer NUM_ROWS_PHAN_1 = 1;
	public static Integer NUM_ROWS_PHAN_2 = 1;
	public static Integer NUM_ROWS_PHAN_3 = 1;
	
	public static Integer DELAY_DAYS = 3;
	public static String phutQDLT="45";
	public static String phutQDTH="60";
	public static String phutQDTHop="45";
	
	
	public static String ADMINROLE="Admin";
	
	public static String COHIEULT="0";
	public static String COHIEUTH="1";
	public static String COHIEUTHOP="5";
	public static String COHIEUKT="4";
	
	
	public static String BO_PHAN_BGH = "0";
	public static String BO_PHAN_PDT = "1";
	public static String BO_PHAN_PHC = "2";
	public static String BO_PHAN_ADMIN = "16";
	public static String BO_PHAN_PKID = "4"; //Phong kiem dinh
	
	public static String MA_MENU_THEM_CONG_TAC_ISO = "9";
	
	public static int NUM_RECORD_QLTB=10;
	public static int NUM_RECORD_TIMGIAOAN=30;
	
	//diem danh

	public static int NUM_STRING_BEGIN = 2;// ky tu bat dau de kay chuoi
	public static int NUM_STRING_GET = 18;//do dai chuoi muon lay
	
	//bien cho Admin
	
	public static String MON_HOC = "monHoc";
	public static Integer NUM_ROW_1 = 0;
	
	
	public static String CongViecChuanBi_Start="0";
	
	public static String TINHTRANG_CHUATHUCHIEN="5";
	
	public static String DANG_KY_MON_HOC_LIST = "dangKyMonHocList";

	public static String THIET_BI_MODEL_LIST = "thietBiModelList";
	public static String NHA_CUNG_CAP_MODEL_LIST = "nhaCungCapModelList";
	public static String PHIEU_MUON_THIET_BI_MODEL = "phieuMuonThietBiModel";
	
	public static String THANH_VIEN_MODEL_LIST = "thanhVienModelList";

	public static String THIET_BI = "thietBi";
	public static String CHI_TIET_THIET_BI = "chiTietThietBi";
	public static String THIET_BI_LIST = "thietBiList";
	public static String THIET_BI_LIST_1 = "thietBiList1";
	public static String THIET_BI_LIST_2 = "thietBiList2";
	public static String THANH_VIEN_LIST_1 = "thietVienList1";
	public static String THANH_VIEN_LIST_2 = "thietVienList2";
	public static String PHONG_BAN = "phongBan";
	
	//*****************************Cong viec chuan bi************************************************
	public static String MALOAI_CVCBTRUOCKHIGIANGDAY="0";
	public static String MALOAI_DODUNGPHUONGTIENDAYHOC="1";
	public static String MALOAI_ONDINHLOPHOC="2";
	public static String MALOAI_DANNHAP="3";
	public static String MALOAI_HDDANNHAPCUAGV="4";
	public static String MALOAI_HDDANNHAPCUAHS="5";
	public static String MALOAI_GIANGBAIMOI="6";
	public static String MALOAI_HDGIANGBAIMOIGV="7";
	public static String MALOAI_HDGIANGBAIMOIHS="8";
	public static String MALOAI_CUNGCOKIENTHUCVAKETTHUCBAI="9";
	public static String MALOAI_HDCUNGCOKIENTHUCVAKETTHUCBAIGV="10";
	public static String MALOAI_HDCUNGCOKIENTHUCVAKETTHUCBAIHS="11";
	public static String MALOAI_HUONGDANTUHOC1="12";
	public static String MALOAI_HDHUONGDANTUHOCGV1="13";
	public static String MALOAI_HDHUONGDANTUHOCHS1="14";
	public static String MALOAI_HINHTHUCTOCHUCDAYHOC="15";
	public static String MALOAI_HUONGDANBANDAU="16";
	public static String MALOAI_HDHUONGDANBANDAUGV="17";
	public static String MALOAI_HDHUONGDANBANDAUHS="18";
	public static String MALOAI_HUONGDANTHUONGXUYEN="19";
	public static String MALOAI_HDHUONGDANTHUONGXUYENGV="20";
	public static String MALOAI_HDHUONGDANTHUONGXUYENHS="21";
	public static String MALOAI_HUONGDANKETTHUC="22";
	public static String MALOAI_HDHUONGDANKETTHUCGV="23";
	public static String MALOAI_HDHUONGDANKETTHUCHS="24";
	public static String MALOAI_RUTKINHNGHIEMTOCHUCTHUCHIEN="25";
	public static String MALOAI_GIOITHIEUCHUDE="26";
	public static String MALOAI_HDGIOITHIEUCHUDEGV="27";
	public static String MALOAI_HDGIOITHIEUCHUDEHS="28";
	public static String MALOAI_GIAIQUYETVANDE="29";
	public static String MALOAI_HDGIAIQUYETVANDEGV="30";
	public static String MALOAI_HDGIAIQUYETVANDEHS="31";
	public static String MALOAI_KETTHUCVANDE="32";
	public static String MALOAI_HDKETTHUCVANDEGV="33";
	public static String MALOAI_HDKETTHUCVANDEHS="34";
	public static String MALOAI_HUONGDANTUHOC2="35";
	public static String MALOAI_HDHUONGDANTUHOCGV2="36";
	public static String MALOAI_HDHUONGDANTUHOCHS2="37";
	public static String MALOAI_HUONGDANRENLUYEN="38";
	public static String MALOAI_HUONGDANRENLUYENCHUNG="39";
	public static String MALOAI_TAILIEUTHAMKHAO="40";
	
	//***********************************************************************************************
	
	
	public static final String MACHUONGTRINH_GIAOAN="1";
	public static final String MACHUONGTRINH_KHGD="0";
	
	//***********************************************************************************************
	public static final String TINHTRANGTHIETBIRANH = "0";
	public static final String TINHTRANGTHIETBIBAN = "1";
	public static final String TINHTRANGTHIETBIBAOTRI = "2";
	public static final String TINHTRANGTHIETBIBAOHANH = "3";
	public static final String TINHTRANGTHIETBIHONG = "4";


	//***********************************************************************************************
	public static final String MADIEMMIENG = "0";
	public static final String MADIEM15	= "1";
	public static final String MADIEM1TIET = "2";
	public static final String MADIEMTHI = "3";

	public static final String MAILTO_THANHVIENNHACNHO="phamhongtam27989@gmail.com";

	//*****************************He thong quan ly nhan su *****************************************
	public static String NGUOI_DU_TUYEN = "14";	
	public static String TINHTRANG_TK_APPROVE_DNTNS="1";
	public static String TINHTRANG_PDT_APPROVE_DNTNS="2";
	public static String TINHTRANG_PHC_APPROVE_DNTNS="3";
	public static String TINHTRANG_BGH_APPROVE_DNTNS="4";
	public static String TINHTRANG_ALL_APPROVE_DNTNS="5";
	public static String TINHTRANG_HSDT_APPROVE = "1";
	public static String TINHTRANG_HSDT_REJECT = "2";
	public static String CHUCNANG_DENGHINHANSU = "8";
	public static String CHUCNANG_DENGHIKHOANTHUVIEC = "9";
	public static String CHUCNANG_NHANXETKETQUATHUVIEC = "10";
	public static String CHUCNANG_KYHOPDONGLANDAU = "11";
	public static String CHUCNANG_HOSODUTUYEN = "12";
	public static String CHUCNANG_KEHOACHTNS = "13";
	public static String APP_QUANLYNHANSU = "6";
	public static String CHUCNANG_DONXINTHOIVIEC = "16";
	
	public static char[] SPECIAL_CHARACTERS = {' ', '!', '"', '#', '$', '%',
	  	'*', '+', ',', ':', '<', '=', '>', '?', '@', '[', '\\', ']', '^',
	   '`', '|', '~', 'À', 'Á', 'Â', 'Ã', 'È', 'É', 'Ê', 'Ì', 'Í', 'Ò',
	   'Ó', 'Ô', 'Õ', 'Ù', 'Ú', 'Ý', 'à', 'á', 'â', 'ã', 'è', 'é', 'ê',
	   'ì', 'í', 'ò', 'ó', 'ô', 'õ', 'ù', 'ú', 'ý', 'Ă', 'ă', 'Đ', 'đ',
	   'Ĩ', 'ĩ', 'Ũ', 'ũ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ạ', 'ạ', 'Ả', 'ả', 'Ấ',
	   'ấ', 'Ầ', 'ầ', 'Ẩ', 'ẩ', 'Ẫ', 'ẫ', 'Ậ', 'ậ', 'Ắ', 'ắ', 'Ằ', 'ằ',
	   'Ẳ', 'ẳ', 'Ẵ', 'ẵ', 'Ặ', 'ặ', 'Ẹ', 'ẹ', 'Ẻ', 'ẻ', 'Ẽ', 'ẽ', 'Ế',
	   'ế', 'Ề', 'ề', 'Ể', 'ể', 'Ễ', 'ễ', 'Ệ', 'ệ', 'Ỉ', 'ỉ', 'Ị', 'ị',
	   'Ọ', 'ọ', 'Ỏ', 'ỏ', 'Ố', 'ố', 'Ồ', 'ồ', 'Ổ', 'ổ', 'Ỗ', 'ỗ', 'Ộ',
	   'ộ', 'Ớ', 'ớ', 'Ờ', 'ờ', 'Ở', 'ở', 'Ỡ', 'ỡ', 'Ợ', 'ợ', 'Ụ', 'ụ',
	   'Ủ', 'ủ', 'Ứ', 'ứ', 'Ừ', 'ừ', 'Ử', 'ử', 'Ữ', 'ữ', 'Ự', 'ự', };
	 
	public static char[] REPLACEMENTS = {' ', '\0', '\0', '\0', '\0', '\0',
	   '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
	   '\0', '\0', '\0', '\0', '\0', 'A', 'A', 'A', 'A', 'E', 'E', 'E',
	   'I', 'I', 'O', 'O', 'O', 'O', 'U', 'U', 'Y', 'a', 'a', 'a', 'a',
	   'e', 'e', 'e', 'i', 'i', 'o', 'o', 'o', 'o', 'u', 'u', 'y', 'A',
	   'a', 'D', 'd', 'I', 'i', 'U', 'u', 'O', 'o', 'U', 'u', 'A', 'a',
	   'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A',
	   'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'E', 'e', 'E', 'e',
	   'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'I',
	   'i', 'I', 'i', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
	   'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O',
	   'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
	   'U', 'u', };
	//***********************************************************************************************
	//*****************************He thong quan ly thiet bi *****************************************
	public static int NUM_RECORD_THIETBI = 10;
}
