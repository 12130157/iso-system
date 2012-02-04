package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietDiemModel;
import vn.edu.hungvuongaptech.model.DangKyMonHocModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class DangKyMonHocDAO {

	public static ArrayList<DangKyMonHocModel> getAllDangKyMonHoc() {
		// TODO Auto-generated method stub
		ArrayList<DangKyMonHocModel> dangKyMonHocModelList = new ArrayList<DangKyMonHocModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getAllDangKyMonHoc"));
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				DangKyMonHocModel dangKyMonHocModel = new DangKyMonHocModel();
				dangKyMonHocModel.setMaDangKyMonHoc(rs.getString("maDangKyMonHoc"));
				dangKyMonHocModel.setMaMonHocTKB(rs.getString("maMonHocTKB"));
				dangKyMonHocModel.setMaHocVien(rs.getString("maHocVien"));
				dangKyMonHocModel.setDiemTrungBinh(rs.getString("diemTrungBinh"));
				dangKyMonHocModel.setHanhKiem(rs.getString("hanhKiem"));
				dangKyMonHocModel.setHocLuc(rs.getString("hocLuc"));
				dangKyMonHocModel.setDanhHieu(rs.getString("danhHieu"));
				dangKyMonHocModel.setGhiChu(rs.getString("ghiChu"));
				dangKyMonHocModel.setNgayCapNhatCuoi(rs.getString("ngayCapNhatCuoi"));
				dangKyMonHocModelList.add(dangKyMonHocModel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return dangKyMonHocModelList;
	}
	
	public static Boolean updateDangKyMonHoc(DangKyMonHocModel dangKyMonHocTraModel) {
		Boolean result = false;		
		try {
			
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateDangKyMonHoc(?,?,?,?,?,?,?,?,?)}");
			csmt.setNString("ID", dangKyMonHocTraModel.getMaDangKyMonHoc());
			csmt.setNString("Ma_mon_hoc_TKB", dangKyMonHocTraModel.getMaMonHocTKB());
			csmt.setNString("Ma_hoc_vien", dangKyMonHocTraModel.getMaHocVien());
			csmt.setNString("Diem_trung_binh", dangKyMonHocTraModel.getDiemTrungBinh());
			csmt.setNString("Hanh_kiem", dangKyMonHocTraModel.getHanhKiem());
			csmt.setNString("Hoc_luc", dangKyMonHocTraModel.getHocLuc());
			csmt.setNString("Danh_hieu", dangKyMonHocTraModel.getDanhHieu());
			csmt.setNString("Ghi_chu", dangKyMonHocTraModel.getGhiChu());
			csmt.setNString("Ngay_cap_nhat_cuoi", dangKyMonHocTraModel.getNgayCapNhatCuoi());

			Boolean ketQua = DataUtil.executeNonStore(csmt);								
			if (ketQua) { // update dang ky mon hoc thanh cong
				ArrayList<ChiTietDiemModel> chiTietDiemList = dangKyMonHocTraModel.getChiTietDiemList();
				ArrayList<ChiTietDiemModel> chiTietDiemListAfterUpdated = new ArrayList<ChiTietDiemModel>();
				for(ChiTietDiemModel obj : chiTietDiemList) {
					if(obj.getMaChiTietDiem() != null)
						ChiTietDiemDAO.updateChiTietDiem(obj);
					else
						ChiTietDiemDAO.insertChiTietDiem(obj);
					chiTietDiemListAfterUpdated.add(obj);
				}
				dangKyMonHocTraModel.setChiTietDiemList(chiTietDiemListAfterUpdated);
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	
	public static DangKyMonHocModel getDiemByMaLop_MaHocSinh_MaMonHoc(String maLop, String maMonHoc, String maThanhVien){
		DangKyMonHocModel model = null;
		try {
			String sql = "SELECT A.ID as MaDangKyMonHoc,A.Diem_trung_binh as DiemTrungBinh "
						+" FROM DANGKYMONHOC A INNER JOIN MONHOCTKB B ON A.MA_MON_HOC_TKB=B.ID "
						+" INNER JOIN THOIKHOABIEU C ON B.MA_TKB=C.ID "
						+" WHERE B.MA_MON_HOC=? AND C.MA_LOP=? AND A.MA_HOC_VIEN=?";
			PreparedStatement ps = DataUtil.getConnection().prepareStatement(sql);
			ps.setString(1, maMonHoc);
			ps.setString(2, maLop);
			ps.setString(3, maThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				model = new DangKyMonHocModel();
				model.setMaDangKyMonHoc(rs.getString("MaDangKyMonHoc"));
				model.setDiemTrungBinh(rs.getString("DiemTrungBinh"));
			}
			if(model!=null){
				model.setChiTietDiemList(ChiTietDiemDAO.getListDiemByMaDangKyMonHoc(model.getMaDangKyMonHoc()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
}
