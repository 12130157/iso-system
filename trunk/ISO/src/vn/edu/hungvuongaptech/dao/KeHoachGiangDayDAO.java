package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietKHGDModel;
import vn.edu.hungvuongaptech.model.KeHoachGiangDayModel;
import vn.edu.hungvuongaptech.model.KetQuaTimGiaoAnModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;

public class KeHoachGiangDayDAO {
	public static int getCountKeHoachGiangDay(String tinhtrang, String maNguoiTao) {
		int count = 0;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetCountKeHoachGiangDay(?,?)}");
			csmt.setString("Tinh_trang", tinhtrang);
			csmt.setString("Ma_nguoi_tao", maNguoiTao);
			ResultSet rs = DataUtil.executeStore(csmt);
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("Count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public static ArrayList<KeHoachGiangDayModel> getKeHoachGiangDay(int totalRows, String currenPage, String tinhTrang, String maNguoiTao,String maBoPhan,String tenMonHoc,String maKhoa,String maHocKi,String maNamHoc) {
		ArrayList<KeHoachGiangDayModel> keHoachGiangDayModelsList = new ArrayList<KeHoachGiangDayModel>();
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetKeHoachGiangDay(?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("NumRows", Constant.RECORDS_PER_PAGE + "");
			csmt.setString("TotalRows", totalRows + "");
			csmt.setString("CurrentPage", currenPage);
			csmt.setString("Tinh_trang", tinhTrang);
			csmt.setString("Ma_nguoi_tao", maNguoiTao);
			csmt.setString("Ma_bo_phan", maBoPhan);
			csmt.setNString("TenMonHoc", tenMonHoc);
			csmt.setString("MaKhoa", maKhoa);
			csmt.setString("MaHocKi",maHocKi);
			csmt.setString("MaNamHoc",maNamHoc);
			
			ResultSet rs = DataUtil.executeStore(csmt);
			while(rs.next())
			{
				KeHoachGiangDayModel keHoachGiangDayModel = new KeHoachGiangDayModel();
				keHoachGiangDayModel.setMaKHGD(rs.getString("MaKeHoachGiangDay"));
				keHoachGiangDayModel.setTenKHGD(rs.getNString("TenKeHoachGiangDay"));
				keHoachGiangDayModel.setMaNguoiTao(rs.getString("MaNguoitao"));
				keHoachGiangDayModel.setTenNguoiTao(rs.getNString("TenNguoitao"));
				keHoachGiangDayModel.setNgayTao(rs.getString("Ngaytao"));
				keHoachGiangDayModel.setTinhTrang(rs.getString("TinhTrang"));
				keHoachGiangDayModel.setLyDoReject(rs.getNString("LyDoReject"));
				keHoachGiangDayModel.setTinhTrangHT(rs.getString("Tinh_Trang_HT"));
			
				keHoachGiangDayModelsList.add(keHoachGiangDayModel);
			}
			Constant.CHECK_ROWS = keHoachGiangDayModelsList.size()-1; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return keHoachGiangDayModelsList;
	}
	
	public static ArrayList<KeHoachGiangDayModel> getAllKHGDApproved() {
		ArrayList<KeHoachGiangDayModel> keHoachGiangDayModelList = new ArrayList<KeHoachGiangDayModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllKeHoachGiangDayApproved"));
			preparedStatement.setString(1, Constant.TINHTRANG_APPROVE);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				KeHoachGiangDayModel keHoachGiangDayModel = new KeHoachGiangDayModel();
				keHoachGiangDayModel.setMaKHGD(rs.getString("MaKeHoachGiangDay"));
				keHoachGiangDayModel.setTenKHGD(rs.getNString("TenKeHoachGiangDay"));
				keHoachGiangDayModel.setMaNguoiTao(rs.getString("MaNguoiLap"));
				keHoachGiangDayModelList.add(keHoachGiangDayModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return keHoachGiangDayModelList;
	}
	
	public static KeHoachGiangDayModel getKeHoachGiangDayByMaKHGD(String maKHGD) {
		KeHoachGiangDayModel keHoachGiangDayModel = new KeHoachGiangDayModel();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllKeHoachGiangDayByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				keHoachGiangDayModel.setMaKHGD(rs.getString("MaKeHoachGiangDay"));
				keHoachGiangDayModel.setMaMonHoc(rs.getString("MaMonHoc"));
				keHoachGiangDayModel.setTenMonHoc(rs.getNString("TenMonHoc"));
				keHoachGiangDayModel.setMaGiaoVien(rs.getString("MaGiaoVien"));
				keHoachGiangDayModel.setTenGiaoVien(rs.getNString("TenGiaoVien"));
				keHoachGiangDayModel.setMaLop(rs.getString("MaLop"));
				keHoachGiangDayModel.setKiHieuLop(rs.getString("KiHieuLop"));
				keHoachGiangDayModel.setHocKi(rs.getString("HocKi"));
				keHoachGiangDayModel.setMaNamHoc(rs.getString("MaNamHoc"));
				keHoachGiangDayModel.setNamHoc(rs.getString("NamHoc"));
				keHoachGiangDayModel.setSoCaThucHanh(rs.getString("SoCaThucHanh"));
				keHoachGiangDayModel.setMaNguoiTao(rs.getString("MaNguoiTao"));
				keHoachGiangDayModel.setTenNguoiTao(rs.getNString("TenNguoiTao"));
				keHoachGiangDayModel.setNgayTao(rs.getString("NgayTao"));
				keHoachGiangDayModel.setGioTao(rs.getString("GioTao"));
				keHoachGiangDayModel.setMaNguoiDuyet(rs.getString("MaNguoiDuyet"));
				keHoachGiangDayModel.setTenNguoiDuyet(rs.getNString("TenNguoiDuyet"));
				keHoachGiangDayModel.setNgayDuyet(rs.getString("NgayDuyet"));
				keHoachGiangDayModel.setGioDuyet(rs.getString("GioDuyet"));
				keHoachGiangDayModel.setTinhTrang(rs.getString("TinhTrang"));
				keHoachGiangDayModel.setTenKHGD(rs.getNString("TenKeHoachGiangDay"));
				keHoachGiangDayModel.setLyDoReject(rs.getNString("LyDoReject"));
				keHoachGiangDayModel.setSoGioLT(rs.getString("SoGioLT"));
				keHoachGiangDayModel.setSoGioTH(rs.getString("SoGioTH"));
				keHoachGiangDayModel.setMaTruongKhoa(rs.getString("MaTruongKhoa"));
				keHoachGiangDayModel.setTenTruongKhoa(rs.getNString("TenTK"));
				keHoachGiangDayModel.setNgayTKDuyet(rs.getString("NgayTKDuyet"));
				keHoachGiangDayModel.setGioTKDuyet(rs.getString("GioTKDuyet"));
				keHoachGiangDayModel.setSoTietMoiBuoi(rs.getString("SoTietMoiBuoi"));
				keHoachGiangDayModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				keHoachGiangDayModel.setGioCapNhatCuoi(rs.getString("GioCapNhatCuoi"));
				keHoachGiangDayModel.setTinhTrangHT(rs.getString("TinhTrangHT"));
				ArrayList<ChiTietKHGDModel> chiTietKHGDModelList = ChiTietKHGDDAO.getChiTietKHGDByMaKHGD(maKHGD);
				keHoachGiangDayModel.setChiTietKHGDModelList(chiTietKHGDModelList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return keHoachGiangDayModel;
	}
	
	public static Boolean checkLopAndMonHocOfKHGD(String maLop, String maMonHoc) {
		Boolean result = true;
		try {
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_FindKHGDByLopAndMonHoc(?,?,?)}");
			csmt.setString("maLop", maLop);
			csmt.setString("maMonHoc", maMonHoc);
			csmt.registerOutParameter("result", java.sql.Types.VARCHAR);
			if (DataUtil.executeNonStore(csmt)) {
				String kq = csmt.getString("result");
				if (kq.equals("1")) {
					result = false;
				}
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static Boolean insertKHGD(KeHoachGiangDayModel keHoachGiangDayModel){
		Boolean result = false;
		String maKHGDNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_InsertKeHoachGiangDay(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("maMonHoc", keHoachGiangDayModel.getMaMonHoc());
			csmt.setNString("tenGiaoVien", keHoachGiangDayModel.getTenGiaoVien());
			csmt.setString("maLop", keHoachGiangDayModel.getMaLop());
			csmt.setString("hocKi", keHoachGiangDayModel.getHocKi());
			csmt.setString("namHoc", keHoachGiangDayModel.getNamHoc());			
			csmt.setString("soCaThucHanh", keHoachGiangDayModel.getSoCaThucHanh());
			csmt.setString("maNguoiTao", keHoachGiangDayModel.getMaNguoiTao());
			csmt.setString("ngayTao", keHoachGiangDayModel.getNgayTao());
			csmt.setString("maNguoiDuyet", null);
			csmt.setString("ngayDuyet", null);
			csmt.setString("tinhTrang", Constant.TINHTRANG_NEW);
			csmt.setString("soTietMoiBuoi", keHoachGiangDayModel.getSoTietMoiBuoi());
			csmt.setNString("lyDoReject", keHoachGiangDayModel.getLyDoReject());
			csmt.setString("soGioLT", keHoachGiangDayModel.getSoGioLT());
			csmt.setString("soGioTH", keHoachGiangDayModel.getSoGioTH());
			csmt.setString("maTruongKhoa", null);
			csmt.setString("ngayTKDuyet", null);
			csmt.setString("User1", keHoachGiangDayModel.getUser1());
			csmt.setString("User2", keHoachGiangDayModel.getUser2());
			csmt.setString("User3", keHoachGiangDayModel.getUser3());
			csmt.setString("User4", keHoachGiangDayModel.getUser4());
			csmt.setString("User5", keHoachGiangDayModel.getUser5());
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.registerOutParameter("tenKHGD",java.sql.Types.NVARCHAR);
			csmt.registerOutParameter("ngayCapNhatCuoi",java.sql.Types.DATE);
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				maKHGDNew = csmt.getString("ID");
				keHoachGiangDayModel.setMaKHGD(maKHGDNew);
				keHoachGiangDayModel.setNgayCapNhatCuoi(csmt.getString("ngayCapNhatCuoi"));
				keHoachGiangDayModel.setTenKHGD(csmt.getNString("tenKHGD"));
				
				ArrayList<ChiTietKHGDModel> chiTietKHGDList = keHoachGiangDayModel.getChiTietKHGDModelList();
				
				for (ChiTietKHGDModel obj : chiTietKHGDList) {
					obj.setMaKHGD(maKHGDNew);
					if (ChiTietKHGDDAO.insertChiTietKHGD(obj)) {
					}
				}
				
				result = true;
				if(result){
					try {
						csmt = DataUtil
							.getConnection()
								.prepareCall("{call sp_ISO_GenerateGiaoAn(?)}");
						csmt.setString("MaKHGD", keHoachGiangDayModel.getMaKHGD());
						result=DataUtil.executeNonStore(csmt);
					}
					catch(Exception e){
						result=false;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	public static Boolean insertKHGDCopy(KeHoachGiangDayModel keHoachGiangDayModel){
		Boolean result = false;
		String maKHGDNew = "";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_InsertKeHoachGiangDay(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("maMonHoc", keHoachGiangDayModel.getMaMonHoc());
			csmt.setNString("tenGiaoVien", keHoachGiangDayModel.getTenGiaoVien());
			csmt.setString("maLop", keHoachGiangDayModel.getMaLop());
			csmt.setString("hocKi", keHoachGiangDayModel.getHocKi());
			csmt.setString("namHoc", keHoachGiangDayModel.getNamHoc());			
			csmt.setString("soCaThucHanh", keHoachGiangDayModel.getSoCaThucHanh());
			csmt.setString("maNguoiTao", keHoachGiangDayModel.getMaNguoiTao());
			csmt.setString("ngayTao", keHoachGiangDayModel.getNgayTao());
			csmt.setString("maNguoiDuyet", null);
			csmt.setString("ngayDuyet", null);
			csmt.setString("tinhTrang", Constant.TINHTRANG_NEW);
			csmt.setString("soTietMoiBuoi", keHoachGiangDayModel.getSoTietMoiBuoi());
			csmt.setNString("lyDoReject", keHoachGiangDayModel.getLyDoReject());
			csmt.setString("soGioLT", keHoachGiangDayModel.getSoGioLT());
			csmt.setString("soGioTH", keHoachGiangDayModel.getSoGioTH());
			csmt.setString("maTruongKhoa", null);
			csmt.setString("ngayTKDuyet", null);
			csmt.setString("User1", keHoachGiangDayModel.getUser1());
			csmt.setString("User2", keHoachGiangDayModel.getUser2());
			csmt.setString("User3", keHoachGiangDayModel.getUser3());
			csmt.setString("User4", keHoachGiangDayModel.getUser4());
			csmt.setString("User5", keHoachGiangDayModel.getUser5());
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.registerOutParameter("tenKHGD",java.sql.Types.NVARCHAR);
			csmt.registerOutParameter("ngayCapNhatCuoi",java.sql.Types.DATE);
			Boolean ketQua = DataUtil.executeNonStore(csmt);
			if (ketQua) { // Insert thanh cong
				maKHGDNew = csmt.getString("ID");
				GiaoAnDAO.copyGiaoAnByMaKHGD(maKHGDNew, keHoachGiangDayModel.getMaKHGD());
				keHoachGiangDayModel.setMaKHGD(maKHGDNew);
				result=ketQua;
			}
		} catch (Exception e) {
		}
		return result;
	}
	
	public static Boolean updateKHGD(KeHoachGiangDayModel keHoachGiangDayModel){
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateKHGD(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", keHoachGiangDayModel.getMaKHGD());
			csmt.setString("maMonHoc", keHoachGiangDayModel.getMaMonHoc());
			csmt.setString("maGiaoVien", keHoachGiangDayModel.getMaNguoiTao());
			csmt.setString("maLop", keHoachGiangDayModel.getMaLop());
			csmt.setString("hocKi", keHoachGiangDayModel.getHocKi());
			csmt.setString("namHoc", keHoachGiangDayModel.getNamHoc());
			csmt.setString("soCaThucHanh", keHoachGiangDayModel.getSoCaThucHanh());
			csmt.setString("maNguoiTao", keHoachGiangDayModel.getMaNguoiTao());
			csmt.setString("maNguoiDuyet", null);
			csmt.setString("maTruongKhoa", null);
			csmt.setString("tinhTrang", keHoachGiangDayModel.getTinhTrang());

			csmt.setNString("tenKHGD", keHoachGiangDayModel.getTenKHGD());
			csmt.setString("soGioLT", keHoachGiangDayModel.getSoGioLT());
			csmt.setString("soGioTH", keHoachGiangDayModel.getSoGioTH());
			csmt.setNString("lyDoReject", null);	
			csmt.registerOutParameter("ngayCapNhatCuoi",java.sql.Types.DATE);
			csmt.setString("User1", keHoachGiangDayModel.getUser1());
			csmt.setString("User2", keHoachGiangDayModel.getUser2());
			csmt.setString("User3", keHoachGiangDayModel.getUser3());
			csmt.setString("User4", keHoachGiangDayModel.getUser4());
			csmt.setString("User5", keHoachGiangDayModel.getUser5());
			
			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // Update "Ke hoach giang day" thanh cong
				keHoachGiangDayModel.setNgayCapNhatCuoi(csmt.getString("ngayCapNhatCuoi").toString());
				
				ArrayList<ChiTietKHGDModel> chiTietKHGDModel = keHoachGiangDayModel.getChiTietKHGDModelList();
				
				for (ChiTietKHGDModel obj : chiTietKHGDModel) {
					obj.setMaKHGD(keHoachGiangDayModel.getMaKHGD());
					ChiTietKHGDDAO.updateChiTietKHGD(obj);
					//**********
					if(obj.getMaGiaoAn()!=null&&!obj.getMaGiaoAn().equals("")){
						GiaoAnDAO.updateHDTXByMaGA(obj.getMaGiaoAn(),obj.getNoiDungTH());
					}
				}
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}			
		return result;
	}
	
	public static int tkDuyetKHGD(String maNguoiDuyet, String maKHGD, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.TKDuyetKeHoachGiangDay"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maKHGD);
			result = preparedStatement.executeUpdate();
		}catch(Exception e){e.printStackTrace();}
		return result;
	}
	
	public static int htDuyetKHGD(String maNguoiDuyet, String maKHGD, String tinhTrang, String lyDoReject) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.HTDuyetKeHoachGiangDay"));
			preparedStatement.setString(1, maNguoiDuyet);
			preparedStatement.setString(2, tinhTrang);
			preparedStatement.setNString(3, lyDoReject);
			preparedStatement.setString(4, maKHGD);
			result = preparedStatement.executeUpdate();
		}catch(Exception e){e.printStackTrace();}
		return result;
	}

	
	public static String calSoPhutDCMHByMaKHGD(String maKHGD,String soPhut){
		
		String soTiet=KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD).getSoTietMoiBuoi();
		int i=0;
		
		if(soTiet!=null)
			i=Integer.parseInt(soTiet)*Integer.parseInt(soPhut);
	
		return i+"";
	}

	public static String getTenKHGDByMaKHGD(String maKHGD){
		String tenKHGD="";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTenKeHoachGiangDayByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next())
				tenKHGD=rs.getString("ten");
		}
		catch(Exception e){
			tenKHGD=null;
		}
		return tenKHGD;
	}

	public static Boolean updateTinhTrangKeHoachGiangDayByMaKHGD(String maKHGD,String tinhTrang){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.UpdateTinhTrangKeHoachGiangDayByMaKHGD"));
			preparedStatement.setString(1,tinhTrang);
			preparedStatement.setString(2,maKHGD);
			
			if(preparedStatement.executeUpdate()==1)
				result=true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return result;
	}
	
	public static Boolean updateTinhTrangHTKeHoachGiangDayByMaKHGD(String maKHGD,String tinhTrang){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.UpdateTinhTrangHTKeHoachGiangDayByMaKHGD"));
			preparedStatement.setString(1,tinhTrang);
			preparedStatement.setString(2,maKHGD);
			
			if(preparedStatement.executeUpdate()==1)
				result=true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return result;
	}

	public static String getTinhTrangHTByMaKHGD(String maKHGD){
		String tinhTrang="";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetTinhTrangHTKeHoachGiangDayByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next())
				tinhTrang=rs.getString("TINH_TRANG_HT");
		}
		catch(Exception e){
			tinhTrang=null;
		}
		return tinhTrang;
	}
	
	public static Boolean updateMaNguoiDuyetKHGDByMaKHGD(String maKHGD,String maNguoiDuyet){
		Boolean result=false;
		try{
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_UpdateMaNguoiDuyetKHGDByMaKHGD(?,?)}");
			csmt.setNString("MaKHGD",maKHGD);
			csmt.setNString("Ma_nguoi_duyet",maNguoiDuyet);
			
			result = DataUtil.executeNonStore(csmt);

		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return result;

	}
	
	public static String getMaKHGDEnd(){
		String maKHGD="";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetMaKHGDEnd"));
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next())
				maKHGD=rs.getString("MaKHGD");
		}
		catch(Exception e){
			maKHGD=null;
		}
		return maKHGD;
	}
	
	public static String getLyDoRejectByMaKHGD(String maKHGD){
		String lyDo="";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetLyDoRejectByMaKHGD"));
			preparedStatement.setNString(1,maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next())
				lyDo=rs.getNString("Ly_do_reject");
			if(lyDo==null)
				return "";
		}
		catch(Exception e){
			lyDo=null;
		}
		return lyDo;
	}
	
	public static ArrayList<KeHoachGiangDayModel> getAllLopAndMonHocOfKHGD()
	{
		ArrayList<KeHoachGiangDayModel> keHoachList=new ArrayList<KeHoachGiangDayModel>();
		KeHoachGiangDayModel keHoachModel;
	
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllKHGD"));
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()){
				keHoachModel=new KeHoachGiangDayModel();
				keHoachModel.setMaKHGD(rs.getString("MaKeHoachGiangDay"));
				keHoachModel.setMaMonHoc(rs.getString("MaMonHoc"));
				keHoachModel.setMaLop(rs.getString("MaLop"));
				keHoachList.add(keHoachModel);
			}
		
		}
		catch(Exception e){
			return null;
		}
		
		
		return keHoachList;
		
	}
	
	public static String GetCongViecChuanBi(){
		String cvcb="";
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_iso_SetCVCBKHGD(?)}");
			csmt.setNString("CVCB",cvcb);
			csmt.registerOutParameter("CVCB",java.sql.Types.NVARCHAR);
			DataUtil.executeNonStore(csmt);
			cvcb=csmt.getNString("CVCB");
			
		} catch (Exception e) {
			e.printStackTrace();
		}			
		return cvcb;
	
	}
	
	
	public static ArrayList<KetQuaTimGiaoAnModel> findKHGD(String maNguoiTao,String maNamHoc,String maLop,String maMonHoc,String hocKi,String tinhTrang,String ngayDayBD,String ngayDayKT,String maBoPhan,String maKhoa)
	{
		KetQuaTimGiaoAnModel ketQuaGiaoAn=new KetQuaTimGiaoAnModel();
		
		ArrayList<KetQuaTimGiaoAnModel> ketQuaList=new ArrayList<KetQuaTimGiaoAnModel>();
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_iso_findKeHoachGiangDay(?,?,?,?,?,?,?,?,?,?)}");
			
			csmt.setString("MaNguoiTao",maNguoiTao);		
			csmt.setString("MaNamHoc",maNamHoc);
			csmt.setString("MaLop",maLop);
			csmt.setString("MaMonHoc",maMonHoc);
			csmt.setString("HocKi",hocKi);
			csmt.setString("TinhTrang",tinhTrang);
			csmt.setString("HocKi",hocKi);
			csmt.setString("TinhTrang",tinhTrang);
			csmt.setString("NgayTimBD",DateUtil.setDate(ngayDayBD));
			csmt.setString("NgayTimKT",DateUtil.setDate(ngayDayKT));
			csmt.setString("MaBoPhan",maBoPhan);
			csmt.setString("MaKhoa",maKhoa);
			ResultSet rs = DataUtil.executeStore(csmt);
			
			int i=1;
			while(rs.next()){
				ketQuaGiaoAn=new KetQuaTimGiaoAnModel();
				ketQuaGiaoAn.setTenMonHoc(rs.getNString("TenMonHoc"));
				ketQuaGiaoAn.setTenLopHoc(rs.getNString("KiHieu"));
				ketQuaGiaoAn.setSoGiaoAn(i+"");
				ketQuaGiaoAn.setMaGiaoVien(rs.getString("MaNguoiTao"));
				
				ketQuaGiaoAn.setNgayDay(DateUtil.setDate2(rs.getString("NgayThucHien")));
				
				ketQuaGiaoAn.setNgayGui(DateUtil.setDate2(rs.getString("NgayGui")));
				
				ketQuaGiaoAn.setMaNguoiDuyet(rs.getString("NguoiDuyet"));
				
				ketQuaGiaoAn.setNgayDuyet(DateUtil.setDate2(rs.getString("NgayDuyet")));
				
				ketQuaGiaoAn.setTinhTrang(rs.getString("TinhTrang"));
				ketQuaGiaoAn.setTenGiaoVien(rs.getString("NguoiTao"));
				ketQuaGiaoAn.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				ketQuaGiaoAn.setMaKHGD(rs.getString("maKHGD"));
				ketQuaGiaoAn.setTinhTrangHT(rs.getString("TinhTrangHT"));
				ketQuaGiaoAn.setMaPhieuKPPN(rs.getString("MaPhieu"));
				
				
				ketQuaList.add(ketQuaGiaoAn);
				i++;
			}
			
		
		}
		catch(Exception e){
			e.printStackTrace();	
		}
		
		return ketQuaList;
	}
	
	public static Boolean updateNgayGuiByMaKHGD(String maKHGD){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.UpdateNgayGuiByMaKHGD"));
			
			preparedStatement.setString(1,maKHGD);

			if(preparedStatement.executeUpdate()==1)
				result=true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return result;
	}
	
	public static Boolean updateNgayDayKeHoachGiangDay(int maKHGD){
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_iso_UpdateNgaydayKHGD(?)}");
			csmt.setInt("MaKHGD", maKHGD);		
			return DataUtil.executeNonStore(csmt);								
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}			
		return result;
	}
	
}
