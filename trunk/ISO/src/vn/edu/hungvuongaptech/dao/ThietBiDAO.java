package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.DanhSachThietBiModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.model.LoaiThietBiModel;
import vn.edu.hungvuongaptech.model.LopHocModel;
import vn.edu.hungvuongaptech.model.PhongBanModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.util.DataUtil;

public class ThietBiDAO {
	
	//nguoi viet: Quoc Chuong
	//muc dich: insert data vao db table chitietmuonthietbi
	public static void insertChiTietMuonThietBi(
			int maChiTietPGNTB,int maThietBi,String thoiGianNhan,
			String thoiGianTra,int tinhTrang,String ngayCapNhatCuoi,
			String user1,String user2,String user3,String user4,String user5)
	{
		int i = DataUtil.executeUpdate("insert into chitietmuonthietbi (ma_chi_tiet_pgntb,ma_thiet_bi,thoi_gian_nhan,thoi_gian_tra,tinh_trang,ngay_cap_nhat_cuoi,user1,user2,user3,user4,user5) " +
				" values ("+maChiTietPGNTB+","+maThietBi+",'"+thoiGianNhan+"'," +
				"'"+thoiGianTra+"',"+tinhTrang+",'"+ngayCapNhatCuoi+"'," +
				"'"+user1+"','"+user2+"','"+user3+"','"+user4+"','"+user5+"')");
		
		//in ket qua i sau khi insert vao chitietmuonthietbi
		System.out.println("Ket qua sau khi insert vao chitietmuonthietbi : "+i);
		if(i == 1)
			System.out.println("Insert thanh cong vao table chitietmuonthietbi");
		else
			System.out.println("Insert that bai vao table chitietmuonthietbi");
	}
	
	
	//nguoi viet: Quoc Chuong
	//muc dich: insert data vao db table ChiTietPhieuGiaoNhanThietBi
	public static void insertChiTietPhieuGiaoNhanThietBi(
									int maSoGiaoNhan,String tenSoGiaoNhan,int nguoiNhan,
									int lop,String ngayNhan,int tinhTrangNhan,
									int kyNhan,int tinhTrangTra,int kyTra,
									String ghiChu,int tinhTrang,String ngayCapNhatCuoi,
									String user1,String user2,String user3,String user4,String user5)
	{
		int i = DataUtil.executeUpdate("insert into chitietphieugiaonhanthietbi (ma_so_giao_nhan,ten_so_giao_nhan,nguoi_nhan,lop,ngay_nhan,tinh_trang_nhan,ky_nhan,tinh_trang_tra,ky_tra,ghi_chu,tinh_trang,ngay_cap_nhat_cuoi,user1,user2,user3,user4,user5) " +
					"values ("+maSoGiaoNhan+",'"+tenSoGiaoNhan+"',"+nguoiNhan+","
					 +lop+",'"+ngayNhan+"',"+tinhTrangNhan+","+kyNhan+"," 
					 +tinhTrangTra+","+kyTra+",'"+ghiChu+"',"+tinhTrang+",'"+ngayCapNhatCuoi+"','"+
					 user1+"','"+user2+"','"+user3+"','"+user4+"','"+user5+"')")	;	
		//in ket qua i sau khi insert vao chitietphieugiaonhanthietbi
		System.out.println("Ket qua sau khi insert vao chitietphieugiaonhanthietbi : "+i);
		if(i == 1)
			System.out.println("Insert thanh cong vao table chitietphieugiaonhanthietbi");
		else
			System.out.println("Insert that bai vao table chitietphieugiaonhanthietbi");
		
		
	}
	
	
	//nguoi viet: Quoc Chuong
	//muc dich: lấy tất cả phòng ban load lên PhieuMuonThietBi.jsp in QuanLyThietBi/ThietBi/
	public static ArrayList<PhongBanModel> getAllPhongBan()
	{
		ArrayList<PhongBanModel> arr = new ArrayList<PhongBanModel>();
		ResultSet rs = DataUtil.executeQuery("select id,ki_hieu_phong from phongban");
		try {
			while(rs.next())
			{
				PhongBanModel model = new PhongBanModel();
				model.setMaPhongBan(String.valueOf(rs.getInt("id")));
				model.setKiHieu(rs.getString("ki_hieu_phong"));
				arr.add(model);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
	
	//nguoi viet: Quoc Chuong
	//muc dich: insert du lieu vao db table sogiaonhanthietbi
	//chu y 2 cột nguoi_lap (=tenDangNhap or nguoiMuon),ngay_lap(=ngayLap or thoiGianNgayMuon)
	public static void insertSoGiaoNhanThietBi(String phong,int hocKi,int nam,String ghiChu,
												int nguoiLap,String ngayLap,int nguoiDuyet,String ngayDuyet,
												int tinhTrang,String ngayCapNhatCuoi,String user1,String user2,
												String user3,String user4,String user5)
	{	
		 int i = DataUtil.executeUpdate("insert into sogiaonhanthietbi (phong,hoc_ki,nam,ghi_chu,nguoi_lap,ngay_lap,nguoi_duyet,ngay_duyet,tinh_trang,ngay_cap_nhat_cuoi,user1,user2,user3,user4,user5) " +
		 									"values ('"+phong+"',"+hocKi+","+nam+",'"+ghiChu+"',"+
		 									nguoiLap+",'"+ngayLap+"',"+nguoiDuyet+",'"+ngayDuyet+
		 									"',"+tinhTrang+",'"+ngayCapNhatCuoi+"','"+user1+
		 									"','"+user2+"','"+user3+"','"+user4+"','"+user5+"')");
		 //System.out.println("ket qua insert sogiaonhanthietbi: "+i);
		 if(i == 1)
			System.out.println("Insert thanh cong vao sogiaonhanthietbi");
		 else
			 System.out.println("Insert that bai vao sogiaonhanthietbi");
	}
	
	//nguoi viet: Quoc Chuong
	//muc dich: lay thong tin cua 1 thiet bi thong qua idThietBi do. 
	//chu y: su dung store SP_ThietBi_GetThietBiInfo nhan vao 1 tham so idThietBi 
	//load vao PhieuMuonThietBi.jsp in QuanLyThietBi/ThietBi/
	public static ThietBiModel getThietBiInfo(int idThietBi)
	{
		ThietBiModel model = new ThietBiModel();
		try {
			CallableStatement ca = DataUtil.getConnection().prepareCall("{call SP_ThietBi_GetThietBiInfo(?)}");
			ca.setInt(1, idThietBi);
			ResultSet rs = ca.executeQuery();
			while(rs.next())
			{
				model.setIdThietBi(rs.getString("id"));
				model.setTenThietBi(rs.getString("ten_thiet_bi"));
				model.setMa(rs.getString("ma"));
				model.setKiHieu(rs.getString("ki_hieu"));
				model.setTenLoaiThietBi(rs.getString("ten_loai_thiet_bi"));
				model.setMaPhongBan(rs.getString("maPhongBan"));
				model.setTenPhongBan(rs.getString("ki_hieu_phong"));//ten phong ban chinh la ki_hieu_phong trong store
				model.setTenTinhTrang(rs.getString("ten_tinh_trang"));
				model.setTenHienTrang(rs.getString("ten_hien_trang"));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return model;
	}
	
	//Nguoi viet: Quoc Chuong
	//muc dich: lấy tất cả lớp học load từ db lên PhieuMuonThietBi.jsp in QuanLyThietBi/ThietBi/
	public static ArrayList<LopHocModel> getAllLopHoc()
	{
		ArrayList<LopHocModel> arr = new ArrayList<LopHocModel>();
		ResultSet rs = DataUtil.executeQuery("select id, ki_hieu from lophoc");
		try {
			while(rs.next())
			{
				LopHocModel model = new LopHocModel();
				model.setMaLopHoc(rs.getString("id"));
				model.setKiHieu(rs.getString("ki_hieu"));
				arr.add(model);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
	
	//Nguoi viet: Quoc Chuong
	//Muc dich: lấy số phiếu (id) cuối cùng trong table sogiaonhanthietbi để load lên giao diện PhieuMuonThietBi.jsp in QuanLyThietBi/ThietBi/
	//Chu y: số phiếu load lên dc nhưng vẫn chưa dc insert vào csdl vì kiểu cột số phiếu tự tăng
	public static int getSoPhieu()
	{
		int soPhieu = 0;
		ResultSet rs = DataUtil.executeQuery("select top 1 id from sogiaonhanthietbi order by id desc");
		try {
			while(rs.next())
			{
				soPhieu = rs.getInt("id")+1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return soPhieu;
	}
	
	public static Boolean insertThietBi(ThietBiModel thietBiModel){
		Boolean result=false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID", java.sql.Types.INTEGER);
			csmt.setNString("Ten",thietBiModel.getTenThietBi());
			csmt.setString("Ma_loai",thietBiModel.getMaLoaiThietBi());
			csmt.setString("Ki_hieu",thietBiModel.getKiHieu());
			csmt.setString("Ma_tinh_trang", Constant.TINHTRANGTHIETBIRANH);
			csmt.setNString("Ghi_chu",thietBiModel.getGhiChu());
			csmt.setString("Ma_nguoi_tao",thietBiModel.getMaNguoiTao());
			csmt.setString("Ma_nha_cung_cap",thietBiModel.getMaNhaCungCap());
			csmt.setString("Ngay_san_xuat",thietBiModel.getNgaySanXuat());
			csmt.setString("Ngay_mua",thietBiModel.getNgayMua());			
			csmt.setString("Han_bao_hanh",thietBiModel.getHanBaoHanh());
			csmt.setString("Ngay_bat_dau_su_dung",thietBiModel.getNgayBatDauSuDung());
			csmt.setString("Tan_suat_toi_da",thietBiModel.getTanSuatToiDa());
			csmt.setString("Gia_mua",thietBiModel.getGiaMua());
			csmt.setNString("Dac_tinh_ky_thuat",thietBiModel.getDacTinhKyThuat());
			csmt.setNString("Nguyen_tac_su_dung",thietBiModel.getNguyenTacSuDung());
			csmt.setString("So_lan_su_dung", "0");
			csmt.setString("So_lan_bao_tri", "0");
			csmt.setString("Ma_tan_suat", thietBiModel.getMaTanSuat());
			csmt.setString("Tan_suat_su_dung", thietBiModel.getTanSuatSuDung());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1",thietBiModel.getUser1());
			csmt.setString("User2",thietBiModel.getUser2());
			csmt.setString("User3",thietBiModel.getUser3());
			csmt.setString("User4",thietBiModel.getUser4());
			csmt.setString("User5",thietBiModel.getUser5());
			
			csmt.setString("Ma_bo_phan",thietBiModel.getMaBoPhan());
			csmt.setString("Ma_phong",thietBiModel.getMaPhongBan());
			
			result = DataUtil.executeNonStore(csmt);
			if(result){
				thietBiModel.setMaThietBi(csmt.getString("ID"));
				//String maxID = csmt.getString("MaThietBi");
				/*ArrayList<ChiTietThietBiModel> chiTietThietBiList=thietBiModel.getChiTietThietBiList();
				ArrayList<ChiTietThietBiModel> chiTietThietBiListAfterInserted = new ArrayList<ChiTietThietBiModel>();
				int size=chiTietThietBiList.size();
				
				for(int j=0;j<size;j++){
					ChiTietThietBiModel chiTietThietBi = chiTietThietBiList.get(j);
					chiTietThietBi.setMaThietBi(thietBiModel.getMaThietBi());
					if(ChiTietThietBiDAO.insertChiTietThietBi(chiTietThietBiList.get(j))) {
						chiTietThietBiListAfterInserted.add(chiTietThietBi);
					} else
						result = false;
				}
				//if(result == true)
					thietBiModel.setChiTietThietBiList(chiTietThietBiListAfterInserted);*/
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return result;
	}
	
	public static Boolean updateThietBi(ThietBiModel thietBiModel) { // Cập nhật thiết bị
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_UpdateThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			
			csmt.setString("ID", thietBiModel.getMaThietBi());
			csmt.setNString("Ten",thietBiModel.getTenThietBi());
			csmt.setString("Ma_loai",thietBiModel.getMaLoaiThietBi());
			csmt.setString("Ki_hieu",thietBiModel.getKiHieu());
			csmt.setString("Ma_tinh_trang",thietBiModel.getMaTinhTrang());
			csmt.setNString("Ghi_chu",thietBiModel.getGhiChu());
			csmt.setString("Ma_nguoi_tao",thietBiModel.getMaNguoiTao());
			csmt.setString("Ma_nha_cung_cap",thietBiModel.getMaNhaCungCap());
			csmt.setString("Ngay_san_xuat",thietBiModel.getNgaySanXuat());
			csmt.setString("Ngay_mua",thietBiModel.getNgayMua());			
			csmt.setString("Han_bao_hanh",thietBiModel.getHanBaoHanh());
			csmt.setString("Ngay_bat_dau_su_dung",thietBiModel.getNgayBatDauSuDung());
			csmt.setString("Tan_suat_toi_da",thietBiModel.getTanSuatToiDa());
			csmt.setString("Gia_mua",thietBiModel.getGiaMua());
			csmt.setNString("Dac_tinh_ky_thuat",thietBiModel.getDacTinhKyThuat());
			csmt.setNString("Nguyen_tac_su_dung",thietBiModel.getNguyenTacSuDung());
			csmt.setString("So_lan_su_dung", thietBiModel.getSoLanSuDung());
			csmt.setString("So_lan_bao_tri", thietBiModel.getSoLanBaoTri());
			csmt.setString("Ma_tan_suat", thietBiModel.getMaTanSuat());
			csmt.setString("Tan_suat_su_dung", thietBiModel.getTanSuatSuDung());
			csmt.setString("Ngay_cap_nhat_cuoi", null);
			csmt.setString("User1",thietBiModel.getUser1());
			csmt.setString("User2",thietBiModel.getUser2());
			csmt.setString("User3",thietBiModel.getUser3());
			csmt.setString("User4",thietBiModel.getUser4());
			csmt.setString("User5",thietBiModel.getUser5());
			result = DataUtil.executeNonStore(csmt);								
			/*if (result) { // Update thiet bi thanh cong
				ArrayList<ChiTietThietBiModel> chiTietThietBiList=thietBiModel.getChiTietThietBiList();
				ArrayList<ChiTietThietBiModel> chiTietThietBiListAfterUpdated = new ArrayList<ChiTietThietBiModel>();
				int size=chiTietThietBiList.size();
				
				for(int j=0;j<size;j++){
					ChiTietThietBiModel chiTietThietBi = chiTietThietBiList.get(j);
					if(chiTietThietBi.getMaChiTietThietBi() != null) {
						if(!ChiTietThietBiDAO.updateChiTietThietBi(chiTietThietBi));
							result = false;
					} else {
						chiTietThietBi.setMaThietBi(thietBiModel.getMaThietBi());
						if(ChiTietThietBiDAO.insertChiTietThietBi(chiTietThietBiList.get(j))) {
							chiTietThietBiListAfterUpdated.add(chiTietThietBi);
						} else
							result = false;
					}
				}
				//if(result == true)
					thietBiModel.setChiTietThietBiList(chiTietThietBiListAfterUpdated);
			}*/
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}						
		return result;
	}
	
	public static Boolean deleteThietBi(String maThietBi) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_DeleteThietBi(?)}");
			
			csmt.setString("ID",maThietBi);
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return result;
	}
	
	public static ArrayList<KhoaModel> getComboBoxDanhSachThietBi(){
		ArrayList<KhoaModel> listBoPhan = new ArrayList<KhoaModel>();
		ArrayList<PhongBanModel> listPhongBan = new ArrayList<PhongBanModel>();
		ArrayList<LoaiThietBiModel> listLoaiThietBi = new ArrayList<LoaiThietBiModel>();
		String maBoPhan = "";
		String maPhongBan = "";
		String maLoaiThietBi = "";
		try {
			String sql = "SELECT C.ID AS MaBoPhan,C.TEN AS TenBoPhan,D.ID AS MaPhongBan,D.KI_HIEU_PHONG AS TenPhongBan, "
				+" E.ID AS MaLoaiThietBi,E.TEN_LOAI_THIET_BI AS TenLoaiThietBi "
				+" FROM THIETBI A INNER JOIN LYLICHTHIETBI B ON B.MA_THIET_BI=A.ID "
				+" INNER JOIN KHOA_TRUNGTAM C ON B.BO_PHAN_NHAN=C.ID "
				+" INNER JOIN PHONGBAN D ON A.VI_TRI_LAP_DAT=D.ID "
				+" INNER JOIN LOAITHIETBI E ON A.MA_LOAI_THIET_BI=E.ID "
				+" ORDER BY C.ID,D.ID,E.ID";
			
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int check = 0;
				if(!maBoPhan.equals(rs.getString("MaBoPhan"))){
					KhoaModel boPhan = new KhoaModel();
					boPhan.setMaKhoa(rs.getString("MaBoPhan"));
					boPhan.setTenKhoa(rs.getString("TenBoPhan"));
					listBoPhan.add(boPhan);
					listPhongBan = new ArrayList<PhongBanModel>();
					boPhan.setListPhongBan(listPhongBan);
					maBoPhan = rs.getString("MaBoPhan");
					maPhongBan = "";
				}
				
				if(!maPhongBan.equals(rs.getString("MaPhongBan"))){
					check = 0;
					PhongBanModel phongBan = new PhongBanModel();
					phongBan.setMaPhongBan(rs.getString("MaPhongBan"));
					phongBan.setKiHieu(rs.getString("TenPhongBan"));
					for (PhongBanModel model : listPhongBan) {
						if(phongBan.getMaPhongBan().equals(model.getMaPhongBan())){
							check = 1;
						}
					}
					if(check==0){
						listPhongBan.add(phongBan);
					}
					
					listLoaiThietBi = new ArrayList<LoaiThietBiModel>();
					phongBan.setListLoaiThietBi(listLoaiThietBi);
					maPhongBan = rs.getString("MaPhongBan");
					maLoaiThietBi = "";
				}
				
				if(!maLoaiThietBi.equals(rs.getString("MaLoaiThietBi"))){
					check = 0;
					LoaiThietBiModel thietBi = new LoaiThietBiModel();
					thietBi.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
					thietBi.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
					for (LoaiThietBiModel model : listLoaiThietBi) {
						if(thietBi.getMaLoaiThietBi().equals(model.getMaLoaiThietBi())){
							check = 1;
						}
					}
					if(check==0){
						listLoaiThietBi.add(thietBi);
					}
					maLoaiThietBi = rs.getString("MaLoaiThietBi");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(listBoPhan.size());
		return listBoPhan;
	}
	
	public static String countDanhSachThietBi(String phong,String khoa,String loaiThietBi,
	String tinhTrang, String hienTrang, String gioBD, String phutBD, String gioKT,
	String phutKT, String ngayBD, String ngayKT){
		String kq = "";
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ThietBi_countDanhSachThietBi(?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Phong", phong);
			csmt.setString("Khoa", khoa);
			csmt.setString("Loai_thiet_bi", loaiThietBi);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Hien_trang", hienTrang);
			csmt.setString("Gio_bd", gioBD);
			csmt.setString("Phut_bd", phutBD);
			csmt.setString("Gio_kt", gioKT);
			csmt.setString("Phut_kt", phutKT);
			csmt.setString("Ngay_bd", ngayBD);
			csmt.setString("Ngay_kt", ngayKT);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				kq = rs.getString("KQ");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public static DanhSachThietBiModel getDanhSachThietBi(String phong,String khoa,String loaiThietBi,
			String tinhTrang, String hienTrang, String gioBD, String phutBD, String gioKT,
			String phutKT, String ngayBD, String ngayKT, String numPage, String numRecord){
		if(phong==null) phong="";
		if(khoa==null) khoa="";
		if(loaiThietBi==null) loaiThietBi="";
		if(tinhTrang==null) tinhTrang="";
		if(hienTrang==null) hienTrang="";
		if(gioBD==null) gioBD="";
		if(phutBD==null) phutBD="";
		if(gioKT==null) gioKT="";
		if(phutKT==null) phutKT="";
		if(ngayBD==null) ngayBD="";
		if(ngayKT==null) ngayKT="";
		DanhSachThietBiModel model = new DanhSachThietBiModel();
		ArrayList<ThietBiModel> listThietBi = new ArrayList<ThietBiModel>();
		try {
			
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{call sp_ThietBi_DanhSachThietBi(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("Phong", phong);
			csmt.setString("Khoa", khoa);
			csmt.setString("Loai_thiet_bi", loaiThietBi);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Hien_trang", hienTrang);
			csmt.setString("Gio_bd", gioBD);
			csmt.setString("Phut_bd", phutBD);
			csmt.setString("Gio_kt", gioKT);
			csmt.setString("Phut_kt", phutKT);
			csmt.setString("Ngay_bd", ngayBD);
			csmt.setString("Ngay_kt", ngayKT);
			csmt.setString("NUM_PAGE", numPage);
			csmt.setString("NUM_RECORD", numRecord);
			ResultSet rs = csmt.executeQuery();
			while(rs.next()){
				ThietBiModel m = new ThietBiModel();
				m.setMaThietBi(rs.getString("MaThietBi"));
				m.setTenThietBi(rs.getString("TenThietBi"));
				m.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
				m.setTenLoaiThietBi(rs.getString("TenLoaiThietBi"));
				m.setMa(rs.getString("Ma"));
				m.setKiHieu(rs.getString("KiHieu"));
				m.setMaPhongBan(rs.getString("MaPhongBan"));
				m.setTenPhongBan(rs.getString("TenPhongBan"));
				m.setMaTinhTrang(rs.getString("MaTinhTrang"));
				m.setTenTinhTrang(rs.getString("TenTinhTrang"));
				m.setMaHienTrang(rs.getString("MaHienTrang"));
				m.setTenHienTrang(rs.getString("TenHienTrang"));
				listThietBi.add(m);
			}
			model.setDanhSachThietBi(listThietBi);
			model.setTongSoThietBi(countDanhSachThietBi(phong, khoa, loaiThietBi, tinhTrang, hienTrang, gioBD, phutBD, gioKT, phutKT, ngayBD, ngayKT));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public static Boolean baoHuThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_baoHuThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}	
	public static Boolean xoaThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_DeleteThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static Boolean thayDoiThietBi(String id) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_ThayDoiThietBi(?)}");		
			csmt.setString("ID", id);			
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
	public static ThietBiModel getThietBiSimpleByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiSimpleByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				thietBi.setMaThietBi(rs.getString("MaThietBi"));
				thietBi.setTenThietBi(rs.getString("TenThietBi"));
				thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
				thietBi.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
				thietBi.setNgaySanXuat(rs.getString("NgaySanXuat"));
				thietBi.setNgayMua(rs.getString("NgayMua"));
				thietBi.setHanBaoHanh(rs.getString("HanBaoHanh"));
				thietBi.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
				thietBi.setMaBoPhan(rs.getString("MaBoPhan"));
				thietBi.setMaPhongBan(rs.getString("MaPhong"));
				thietBi.setMaTanSuat(rs.getString("MaTanSuat"));
				thietBi.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static ThietBiModel getThietBiByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		ArrayList<ChiTietThietBiModel> chiTietThietBiList = new ArrayList<ChiTietThietBiModel>();
		String maThietBi = "na";
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if(!maThietBi.equals(rs.getString("MaThietBi"))) {
					thietBi.setMaThietBi(rs.getString("MaThietBi"));
					thietBi.setTenThietBi(rs.getString("TenThietBi"));
					thietBi.setMaBoPhan(rs.getString("MaBoPhan"));
					thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
					thietBi.setMaLoaiThietBi(rs.getString("MaLoaiThietBi"));
					thietBi.setMaPhongBan(rs.getString("MaPhong"));
					thietBi.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
					thietBi.setNgaySanXuat(rs.getString("NgaySanXuat"));
					thietBi.setNgayMua(rs.getString("NgayMua"));
					thietBi.setHanBaoHanh(rs.getString("HanBaoHanh"));
					thietBi.setNgayBatDauSuDung(rs.getString("NgayBatDauSuDung"));
					thietBi.setTanSuatToiDa(rs.getString("TanSuatToiDa"));
					thietBi.setGiaMua(rs.getString("GiaMua"));
					thietBi.setNguyenTacSuDung(rs.getString("NguyenTacSuDung"));
					thietBi.setDacTinhKyThuat(rs.getNString("DacTinhKyThuat"));
					thietBi.setSoLanSuDung(rs.getString("SoLanSuDung"));
					thietBi.setSoLanBaoTri(rs.getString("SoLanBaoTri"));
					thietBi.setGhiChu(rs.getString("GhiChu"));
					thietBi.setMaNguoiTao(rs.getString("MaNguoiTao"));
					thietBi.setMaTanSuat(rs.getString("MaTanSuat"));
					thietBi.setTanSuatSuDung(rs.getString("TanSuatSuDung"));
					maThietBi = thietBi.getMaThietBi();
//					thietBi.setChiTietThietBiList(chiTietThietBiList);
				}
				if(rs.getString("MaChiTietThietBi") != null) {
					ChiTietThietBiModel chiTietThietBi = new ChiTietThietBiModel();
					chiTietThietBi.setMaChiTietThietBi(rs.getString("MaChiTietThietBi"));
					chiTietThietBi.setTenChiTietThietBi(rs.getString("TenLinhKien"));
					chiTietThietBi.setKiHieu(rs.getString("KiHieuLinhKien"));
					chiTietThietBi.setSoLanBaoTri(rs.getString("SoLanBaoTriChiTiet"));
					chiTietThietBi.setSoLanSuDung(rs.getString("SoLanSuDungChiTiet"));
					chiTietThietBi.setTenNhaCungCap(rs.getNString("TenNhaCungCapLinhKien"));
					chiTietThietBiList.add(chiTietThietBi);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static ThietBiModel getThietBiBaoHuByID(String id) {
		ThietBiModel thietBi = new ThietBiModel();
		ArrayList<ChiTietThietBiModel> chiTietThietBiList = new ArrayList<ChiTietThietBiModel>();
		String maThietBi = "na";
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getThietBiBaoHuByID"));
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				if(!maThietBi.equals(rs.getString("MaThietBi"))) {
					thietBi.setMaThietBi(rs.getString("MaThietBi"));
					thietBi.setTenThietBi(rs.getString("TenThietBi"));
					thietBi.setKiHieu(rs.getString("KiHieuThietBi"));
					
					maThietBi = thietBi.getMaThietBi();
//					thietBi.setChiTietThietBiList(chiTietThietBiList);
				}
				if(rs.getString("MaChiTietThietBi") != null) {
					ChiTietThietBiModel chiTietThietBi = new ChiTietThietBiModel();
					chiTietThietBi.setMaChiTietThietBi(rs.getString("MaChiTietThietBi"));
					chiTietThietBi.setTenChiTietThietBi(rs.getString("TenLinhKien"));
					chiTietThietBi.setKiHieu(rs.getString("KiHieuLinhKien"));
					
					chiTietThietBiList.add(chiTietThietBi);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thietBi;
	}
	public static Boolean updatePhieuMuonByID(String maPhieuMuon, String ghiChu) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_updatePhieuMuonThietBiByID(?,?)}");		
			csmt.setString("ID", maPhieuMuon);
			csmt.setNString("Ghi_chu", ghiChu);
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}
						
		return result;
	}
}
