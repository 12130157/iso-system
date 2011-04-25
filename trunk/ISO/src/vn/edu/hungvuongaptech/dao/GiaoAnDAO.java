package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.GiaoAnModel;
import vn.edu.hungvuongaptech.model.KetQuaTimGiaoAnModel;

import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class GiaoAnDAO {

	public static Boolean insertGiaoAnLyThuyet(GiaoAnModel giaoAnModel){
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertGiaoAnLyThuyet(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);	
			csmt.setInt("MA_KHGD",Integer.parseInt(giaoAnModel.getMaKHGD()));
			csmt.setInt("So_giao_an",Integer.parseInt(giaoAnModel.getSoGiaoAn()));
		
			if(giaoAnModel.getNgayThucHien()!=""){
				String[] ngayThucHienSplit=giaoAnModel.getNgayThucHien().split("-");
				csmt.setNString("Ngay_thuc_hien",ngayThucHienSplit[2]+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
			}
			else
			{
				csmt.setNString("Ngay_thuc_hien",giaoAnModel.getNgayTao());
			}
			csmt.setNString("Muc_tieu", giaoAnModel.getMucTieu());
			csmt.setNString("Do_dung_PT_DH",giaoAnModel.getDoDungPTDH());
			csmt.setNString("On_dinh_LH",giaoAnModel.getOnDinhLH());			
			csmt.setInt("Thoi_gian_on_dinh",Integer.parseInt(giaoAnModel.getThoiGianOnDinh()));
			csmt.setInt("Thoi_gian_TH_BH",Integer.parseInt(giaoAnModel.getThoiGianTHBH()));
			csmt.setNString("Dan_nhap", giaoAnModel.getDanNhap());
			csmt.setNString("HD_dan_nhap_GV", giaoAnModel.getHDDanNhapGV());
			csmt.setNString("HD_dan_nhap_HS", giaoAnModel.getHDDanNhapHS());
			csmt.setInt("Thoi_gian_dan_nhap",Integer.parseInt(giaoAnModel.getThoiGianDanNhap()));
			csmt.setNString("Noi_dung_bai_giang",giaoAnModel.getNoiDungBaiGiang() );
			csmt.setNString("HD_giang_bai_moi_GV",giaoAnModel.getHDGiangBaiMoiGV());
			csmt.setNString("HD_giang_bai_moi_HS",giaoAnModel.getHDGiangBaiMoiHS());
			csmt.setInt("Thoi_gian_bai_giang",Integer.parseInt(giaoAnModel.getThoiGianBaiGiang()));
			csmt.setNString("Cung_co_kien_thuc",giaoAnModel.getCungCoKienThuc());
			csmt.setNString("HD_cung_co_GV",giaoAnModel.getHDCungCoGV());
			csmt.setNString("HD_cung_co_HS",giaoAnModel.getHDCungCoHS());
			csmt.setInt("Thoi_gian_cung_co",Integer.parseInt(giaoAnModel.getThoiGianCungCo()));
			csmt.setNString("Huong_dan_tu_hoc",giaoAnModel.getHuongDanTuHoc());
			csmt.setNString("HD_HDTH_GV",giaoAnModel.getHDHDTHGV());
			csmt.setNString("HD_HDTH_HS",giaoAnModel.getHDHDTHHS());
			csmt.setInt("Thoi_gian_HDTH",Integer.parseInt(giaoAnModel.getThoiGianHDTH()));
			csmt.setNString("Tai_lieu_tham_khao",giaoAnModel.getTaiLieuThamKhao());
			csmt.setNString("Ngay_tao",giaoAnModel.getNgayTao());
			csmt.setNString("Ten_Chuong",giaoAnModel.getTenChuong());
			csmt.setNString("Ma_Giao_Vien",giaoAnModel.getMaGiaoVien());
			
			result = DataUtil.executeNonStore(csmt);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return result;	

	}
	
	public static GiaoAnModel getGiaoAnLyThuyetByMaGA(String maGiaoAn)
	{
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetGiaoAnLyThuyet(?)}");
			csmt.setNString("maGiaoAn",maGiaoAn);
			ResultSet rs=DataUtil.executeStore(csmt);
			while(rs.next()){
				giaoAnModel.setMaGiaoAn(maGiaoAn);
				giaoAnModel.setMaKHGD(rs.getString("MA_KHGD"));
				giaoAnModel.setSoGiaoAn(rs.getString("So_giao_an"));	
				
		
				String[] ngayThucHienSplit=rs.getString("Ngay_thuc_hien").split("-");
				giaoAnModel.setNgayThucHien(ngayThucHienSplit[2].substring(0,2)+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
				
				
				giaoAnModel.setMucTieu(rs.getString("Muc_tieu"));
				giaoAnModel.setDoDungPTDH(rs.getString("Do_dung_PT_DH"));
				giaoAnModel.setOnDinhLH(rs.getString("On_dinh_LH"));
				giaoAnModel.setThoiGianOnDinh(rs.getString("Thoi_gian_on_dinh"));
				giaoAnModel.setThoiGianTHBH(rs.getString("Thoi_gian_TH_BH"));
				giaoAnModel.setDanNhap(rs.getString("Dan_nhap"));
				giaoAnModel.setHDDanNhapGV(rs.getString("HD_dan_nhap_GV"));
				giaoAnModel.setHDDanNhapHS(rs.getString("HD_dan_nhap_HS"));
				giaoAnModel.setThoiGianDanNhap(rs.getString("Thoi_gian_dan_nhap"));
				giaoAnModel.setNoiDungBaiGiang(rs.getString("Noi_dung_bai_giang"));
				giaoAnModel.setHDGiangBaiMoiGV(rs.getString("HD_giang_bai_moi_GV"));
				giaoAnModel.setHDGiangBaiMoiHS(rs.getString("HD_giang_bai_moi_HS"));
				giaoAnModel.setThoiGianBaiGiang(rs.getString("Thoi_gian_bai_giang"));
				giaoAnModel.setCungCoKienThuc(rs.getString("Cung_co_kien_thuc"));
				giaoAnModel.setHDCungCoGV(rs.getString("HD_cung_co_GV"));
				giaoAnModel.setHDCungCoHS(rs.getString("HD_cung_co_HS"));
				giaoAnModel.setThoiGianCungCo(rs.getString("Thoi_gian_cung_co"));
				giaoAnModel.setHuongDanTuHoc(rs.getString("Huong_dan_tu_hoc"));
				giaoAnModel.setHDHDTHGV(rs.getString("HD_HDTH_GV"));
				giaoAnModel.setHDHDTHHS(rs.getString("HD_HDTH_HS"));
				giaoAnModel.setThoiGianHDTH(rs.getString("Thoi_gian_HDTH"));
				giaoAnModel.setTaiLieuThamKhao(rs.getString("Tai_lieu_tham_khao"));
				giaoAnModel.setMaNguoiDuyet(rs.getString("Ma_nguoi_duyet"));
				

				if(rs.getString("Ngay_duyet")!=null){
					String[] ngayDuyetSplit=rs.getString("Ngay_duyet").split("-");
					giaoAnModel.setNgayDuyet(ngayDuyetSplit[2].substring(0,2)+"-"+ngayDuyetSplit[1]+"-"+ngayDuyetSplit[0]);
				}
				String[] ngayTaoSplit=rs.getString("Ngay_tao").split("-");
				giaoAnModel.setNgayTao(ngayTaoSplit[2].substring(0,2)+"-"+ngayTaoSplit[1]+"-"+ngayTaoSplit[0]);
				
			}
		
		
		}
		catch(Exception e){
			e.printStackTrace();	
		}
		return giaoAnModel;
	}
	
	public static Boolean updateGiaoAnLyThuyet(GiaoAnModel giaoAnModel){
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateGiaoAnLyThuyet(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.registerOutParameter("stt",java.sql.Types.INTEGER);	
			csmt.setNString("MaGiaoAn", giaoAnModel.getMaGiaoAn());
			csmt.setNString("MA_KHGD", giaoAnModel.getMaKHGD());
			csmt.setNString("So_giao_an", giaoAnModel.getSoGiaoAn());
			
			if(giaoAnModel.getNgayThucHien()!=""){
				String[] ngayThucHienSplit=giaoAnModel.getNgayThucHien().split("-");
				csmt.setNString("Ngay_thuc_hien",ngayThucHienSplit[2]+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
			}
			else{
				csmt.setNString("Ngay_thuc_hien",giaoAnModel.getNgayCapNhatCuoi());
						
			}
				
			csmt.setNString("Muc_tieu", giaoAnModel.getMucTieu());
			csmt.setNString("Do_dung_PT_DH",giaoAnModel.getDoDungPTDH());
			csmt.setNString("On_dinh_LH",giaoAnModel.getOnDinhLH());			
			csmt.setNString("Thoi_gian_on_dinh",giaoAnModel.getThoiGianOnDinh());
			csmt.setNString("Thoi_gian_TH_BH",giaoAnModel.getThoiGianTHBH());
			csmt.setNString("Dan_nhap", giaoAnModel.getDanNhap());
			csmt.setNString("HD_dan_nhap_GV", giaoAnModel.getHDDanNhapGV());
			csmt.setNString("HD_dan_nhap_HS", giaoAnModel.getHDDanNhapHS());
			csmt.setNString("Thoi_gian_dan_nhap",giaoAnModel.getThoiGianDanNhap());
			csmt.setNString("Noi_dung_bai_giang",giaoAnModel.getNoiDungBaiGiang() );
			csmt.setNString("HD_giang_bai_moi_GV",giaoAnModel.getHDGiangBaiMoiGV());
			csmt.setNString("HD_giang_bai_moi_HS",giaoAnModel.getHDGiangBaiMoiHS());
			csmt.setNString("Thoi_gian_bai_giang",giaoAnModel.getThoiGianBaiGiang());
			csmt.setNString("Cung_co_kien_thuc",giaoAnModel.getCungCoKienThuc());
			csmt.setNString("HD_cung_co_GV",giaoAnModel.getHDCungCoGV());
			csmt.setNString("HD_cung_co_HS",giaoAnModel.getHDCungCoHS());
			csmt.setNString("Thoi_gian_cung_co",giaoAnModel.getThoiGianCungCo());
			csmt.setNString("Huong_dan_tu_hoc",giaoAnModel.getHuongDanTuHoc());
			csmt.setNString("HD_HDTH_GV",giaoAnModel.getHDHDTHGV());
			csmt.setNString("HD_HDTH_HS",giaoAnModel.getHDHDTHHS());
			csmt.setNString("Thoi_gian_HDTH",giaoAnModel.getThoiGianHDTH());
			csmt.setNString("Tai_lieu_tham_khao",giaoAnModel.getTaiLieuThamKhao());
			
			csmt.setNString("Ngay_cap_nhat_cuoi",giaoAnModel.getNgayCapNhatCuoi());
			
			result = DataUtil.executeNonStore(csmt);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;
	}
	
	public static Boolean insertGiaoAnThucHanh(GiaoAnModel giaoAnModel){
		Boolean result=false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertGiaoAnThucHanh(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);	
			csmt.setNString("MA_KHGD", giaoAnModel.getMaKHGD());
			csmt.setNString("So_giao_an", giaoAnModel.getSoGiaoAn());
			
			if(giaoAnModel.getNgayThucHien()!=""){
				String[] ngayThucHienSplit=giaoAnModel.getNgayThucHien().split("-");
				csmt.setNString("Ngay_thuc_hien",ngayThucHienSplit[2]+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
			}
			else{
				csmt.setNString("Ngay_thuc_hien",giaoAnModel.getNgayTao());		
			}
			
			csmt.setNString("Muc_tieu", giaoAnModel.getMucTieu());
			csmt.setNString("Do_dung_PT_DH",giaoAnModel.getDoDungPTDH());
			csmt.setNString("Hinh_thuc_TC_DH",giaoAnModel.getHinhThucTCDH());
			csmt.setNString("On_dinh_LH",giaoAnModel.getOnDinhLH());			
			csmt.setNString("Thoi_gian_on_dinh",giaoAnModel.getThoiGianOnDinh());
			csmt.setNString("Thoi_gian_TH_BH",giaoAnModel.getThoiGianTHBH());
			csmt.setNString("Dan_nhap", giaoAnModel.getDanNhap());
			csmt.setNString("HD_dan_nhap_GV", giaoAnModel.getHDDanNhapGV());
			csmt.setNString("HD_dan_nhap_HS", giaoAnModel.getHDDanNhapHS());
			csmt.setNString("Thoi_gian_dan_nhap",giaoAnModel.getThoiGianDanNhap());
			csmt.setNString("Huong_dan_ban_dau",giaoAnModel.getHuongDanBanDau());
			csmt.setNString("HD_HDBD_GV",giaoAnModel.getHDHDBDGV());
			csmt.setNString("HD_HDBD_HS",giaoAnModel.getHDHDBDHS());
			csmt.setNString("Thoi_gian_HDBD",giaoAnModel.getThoiGianHDBD());
			csmt.setNString("Huong_dan_thuong_xuyen",giaoAnModel.getHuongDanThuongXuyen());
			csmt.setNString("HD_HDTX_GV",giaoAnModel.getHDHDTXGV());
			csmt.setNString("HD_HDTX_HS",giaoAnModel.getHDHDTXHS());
			csmt.setNString("Thoi_gian_HDTX",giaoAnModel.getThoiGianHDTX());
			csmt.setNString("Huong_dan_ket_thuc",giaoAnModel.getHuongDanKetThuc());
			csmt.setNString("HD_HDKT_GV",giaoAnModel.getHDHDKTGV());
			csmt.setNString("HD_HDKT_HS",giaoAnModel.getHDHDKTHS());
			csmt.setNString("Thoi_gian_HDKT",giaoAnModel.getThoiGianHDKT());
			csmt.setNString("Huong_dan_ren_luyen",giaoAnModel.getHuongDanKetThuc());
			csmt.setNString("HD_HDRL_GV",giaoAnModel.getHDHDRLGV());
			csmt.setNString("Thoi_gian_HDRL",giaoAnModel.getThoiGianHDRL());
			csmt.setNString("Rut_kinh_nghiem",giaoAnModel.getRutKinhNghiem());
			csmt.setNString("Ngay_tao",giaoAnModel.getNgayTao());
			csmt.setNString("Ten_Chuong",giaoAnModel.getTenChuong());
			csmt.setNString("Ma_Giao_Vien",giaoAnModel.getMaGiaoVien());
			
			result = DataUtil.executeNonStore(csmt);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;

	}
	
	public static Boolean updateGiaoAnThucHanh(GiaoAnModel giaoAnModel){
		Boolean result=false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateGiaoAnThucHanh(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setNString("MaGiaoAn", giaoAnModel.getMaGiaoAn());
			csmt.setNString("MA_KHGD", giaoAnModel.getMaKHGD());
			csmt.setNString("So_giao_an", giaoAnModel.getSoGiaoAn());

			if(giaoAnModel.getNgayThucHien()!=""){
				String[] ngayThucHienSplit=giaoAnModel.getNgayThucHien().split("-");
				csmt.setNString("Ngay_thuc_hien",ngayThucHienSplit[2]+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
			}
			else{
				csmt.setNString("Ngay_thuc_hien",giaoAnModel.getNgayCapNhatCuoi());
						
			}
			
			csmt.setNString("Muc_tieu", giaoAnModel.getMucTieu());
			csmt.setNString("Do_dung_PT_DH",giaoAnModel.getDoDungPTDH());
			csmt.setNString("Hinh_thuc_TC_DH",giaoAnModel.getHinhThucTCDH());
			csmt.setNString("On_dinh_LH",giaoAnModel.getOnDinhLH());			
			csmt.setNString("Thoi_gian_on_dinh",giaoAnModel.getThoiGianOnDinh());
			csmt.setNString("Thoi_gian_TH_BH",giaoAnModel.getThoiGianTHBH());
			csmt.setNString("Dan_nhap", giaoAnModel.getDanNhap());
			csmt.setNString("HD_dan_nhap_GV", giaoAnModel.getHDDanNhapGV());
			csmt.setNString("HD_dan_nhap_HS", giaoAnModel.getHDDanNhapHS());
			csmt.setNString("Thoi_gian_dan_nhap",giaoAnModel.getThoiGianDanNhap());
			csmt.setNString("Huong_dan_ban_dau",giaoAnModel.getHuongDanBanDau());
			csmt.setNString("HD_HDBD_GV",giaoAnModel.getHDHDBDGV());
			csmt.setNString("HD_HDBD_HS",giaoAnModel.getHDHDBDHS());
			csmt.setNString("Thoi_gian_HDBD",giaoAnModel.getThoiGianHDBD());
			csmt.setNString("Huong_dan_thuong_xuyen",giaoAnModel.getHuongDanThuongXuyen());
			csmt.setNString("HD_HDTX_GV",giaoAnModel.getHDHDTXGV());
			csmt.setNString("HD_HDTX_HS",giaoAnModel.getHDHDTXHS());
			csmt.setNString("Thoi_gian_HDTX",giaoAnModel.getThoiGianHDTX());
			csmt.setNString("Huong_dan_ket_thuc",giaoAnModel.getHuongDanKetThuc());
			csmt.setNString("HD_HDKT_GV",giaoAnModel.getHDHDKTGV());
			csmt.setNString("HD_HDKT_HS",giaoAnModel.getHDHDKTHS());
			csmt.setNString("Thoi_gian_HDKT",giaoAnModel.getThoiGianHDKT());
			csmt.setNString("Huong_dan_ren_luyen",giaoAnModel.getHuongDanRenLuyen());
			csmt.setNString("HD_HDRL_GV",giaoAnModel.getHDHDRLGV());
			csmt.setNString("Thoi_gian_HDRL",giaoAnModel.getThoiGianHDRL());
			csmt.setNString("Rut_kinh_nghiem",giaoAnModel.getRutKinhNghiem());
			csmt.setNString("Ngay_cap_nhat_cuoi",giaoAnModel.getNgayCapNhatCuoi());
			result = DataUtil.executeNonStore(csmt);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;

	}

	public static GiaoAnModel getGiaoAnThucHanhByMaGA(String maGiaoAn)
	{
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetGiaoAnThucHanh(?)}");
			csmt.setNString("maGiaoAn",maGiaoAn);
			ResultSet rs=DataUtil.executeStore(csmt);
			while(rs.next()){
				giaoAnModel.setMaGiaoAn(maGiaoAn);
				giaoAnModel.setMaKHGD(rs.getString("MA_KHGD"));
				giaoAnModel.setSoGiaoAn(rs.getString("So_giao_an"));	
				
				
				String[] ngayThucHienSplit=rs.getString("Ngay_thuc_hien").split("-");
				giaoAnModel.setNgayThucHien(ngayThucHienSplit[2].substring(0,2)+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
				
				giaoAnModel.setMucTieu(rs.getString("Muc_tieu"));
				giaoAnModel.setDoDungPTDH(rs.getString("Do_dung_PT_DH"));
				giaoAnModel.setHinhThucTCDH(rs.getString("Hinh_thuc_TC_DH"));
				giaoAnModel.setOnDinhLH(rs.getString("On_dinh_LH"));
				giaoAnModel.setThoiGianOnDinh(rs.getString("Thoi_gian_on_dinh"));
				giaoAnModel.setThoiGianTHBH(rs.getString("Thoi_gian_TH_BH"));
				giaoAnModel.setDanNhap(rs.getString("Dan_nhap"));
				giaoAnModel.setHDDanNhapGV(rs.getString("HD_dan_nhap_GV"));
				giaoAnModel.setHDDanNhapHS(rs.getString("HD_dan_nhap_HS"));
				giaoAnModel.setThoiGianDanNhap(rs.getString("Thoi_gian_dan_nhap"));
				giaoAnModel.setHuongDanBanDau(rs.getString("Huong_dan_ban_dau"));
				giaoAnModel.setHDHDBDGV(rs.getString("HD_HDBD_GV"));
				giaoAnModel.setHDHDBDHS(rs.getString("HD_HDBD_HS"));
				giaoAnModel.setThoiGianHDBD(rs.getString("Thoi_gian_HDBD"));
				giaoAnModel.setHuongDanThuongXuyen(rs.getString("Huong_dan_thuong_xuyen"));
				giaoAnModel.setHDHDTXGV(rs.getString("HD_HDTX_GV"));
				giaoAnModel.setHDHDTXHS(rs.getString("HD_HDTX_HS"));
				giaoAnModel.setThoiGianHDTX(rs.getString("Thoi_gian_HDTX"));
				giaoAnModel.setHuongDanKetThuc(rs.getString("Huong_dan_ket_thuc"));
				giaoAnModel.setHDHDKTGV(rs.getString("HD_HDKT_GV"));
				giaoAnModel.setHDHDKTHS(rs.getString("HD_HDKT_HS"));
				giaoAnModel.setThoiGianHDKT(rs.getString("Thoi_gian_HDKT"));
				giaoAnModel.setHuongDanRenLuyen(rs.getString("Huong_dan_ren_luyen"));
				giaoAnModel.setHDHDRLGV(rs.getString("HD_HDRL_GV"));
				giaoAnModel.setThoiGianHDRL(rs.getString("Thoi_gian_HDRL"));
				giaoAnModel.setRutKinhNghiem(rs.getString("Rut_kinh_nghiem"));
				giaoAnModel.setMaNguoiDuyet(rs.getString("Ma_nguoi_duyet"));
				
				if(rs.getString("Ngay_duyet")!=null){
					String[] ngayDuyetSplit=rs.getString("Ngay_duyet").split("-");
					giaoAnModel.setNgayDuyet(ngayDuyetSplit[2].substring(0,2)+"-"+ngayDuyetSplit[1]+"-"+ngayDuyetSplit[0]);
				}
				String[] ngayTaoSplit=rs.getString("Ngay_tao").split("-");
				giaoAnModel.setNgayTao(ngayTaoSplit[2].substring(0,2)+"-"+ngayTaoSplit[1]+"-"+ngayTaoSplit[0]);
			}
		
		
		}
		catch(Exception e){
			e.printStackTrace();	
		}
		return giaoAnModel;
	}

	public static GiaoAnModel getGiaoAnTichHopByMaGA(String maGiaoAn)
	{
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_GetGiaoAnTichHop(?)}");
			csmt.setNString("maGiaoAn",maGiaoAn);
			ResultSet rs=DataUtil.executeStore(csmt);
			while(rs.next()){
				giaoAnModel.setMaGiaoAn(maGiaoAn);
				giaoAnModel.setMaKHGD(rs.getString("MA_KHGD"));
				giaoAnModel.setSoGiaoAn(rs.getString("So_giao_an"));	
				
				
				String[] ngayThucHienSplit=rs.getString("Ngay_thuc_hien").split("-");
				giaoAnModel.setNgayThucHien(ngayThucHienSplit[2].substring(0,2)+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
				
				giaoAnModel.setMucTieu(rs.getString("Muc_tieu"));
				giaoAnModel.setDoDungPTDH(rs.getString("Do_dung_PT_DH"));
				giaoAnModel.setHinhThucTCDH(rs.getString("Hinh_thuc_TC_DH"));
				giaoAnModel.setOnDinhLH(rs.getString("On_dinh_LH"));
				giaoAnModel.setThoiGianOnDinh(rs.getString("Thoi_gian_on_dinh"));
				giaoAnModel.setThoiGianTHBH(rs.getString("Thoi_gian_TH_BH"));
				giaoAnModel.setDanNhap(rs.getString("Dan_nhap"));
				giaoAnModel.setHDDanNhapGV(rs.getString("HD_dan_nhap_GV"));
				giaoAnModel.setHDDanNhapHS(rs.getString("HD_dan_nhap_HS"));
				giaoAnModel.setThoiGianDanNhap(rs.getString("Thoi_gian_dan_nhap"));
				
				giaoAnModel.setGioiThieuChuDe(rs.getString("Gioi_thieu_chu_de"));
				giaoAnModel.setHDGTCDGV(rs.getString("HD_GTCD_GV"));
				giaoAnModel.setHDGTCDHS(rs.getString("HD_GTCD_HS"));
				giaoAnModel.setThoiGianGTCD(rs.getString("Thoi_gian_GTCD"));
				
				giaoAnModel.setGiaiQuyetVanDe(rs.getString("Giai_quyet_van_de"));
				giaoAnModel.setHDGQVDGV(rs.getString("HD_GQVD_GV"));
				giaoAnModel.setHDGQVDHS(rs.getString("HD_GQVD_HS"));
				giaoAnModel.setThoiGianGTVD(rs.getString("Thoi_gian_GTVD"));
				giaoAnModel.setHuongDanKetThuc(rs.getString("Huong_dan_ket_thuc"));
				giaoAnModel.setHDHDKTGV(rs.getString("HD_HDKT_GV"));
				giaoAnModel.setHDHDKTHS(rs.getString("HD_HDKT_HS"));
				giaoAnModel.setThoiGianHDKT(rs.getString("Thoi_gian_HDKT"));
				giaoAnModel.setHuongDanTuHoc(rs.getString("Huong_dan_tu_hoc"));
				giaoAnModel.setHDHDTHGV(rs.getString("HD_HDTH_GV"));
				giaoAnModel.setThoiGianHDTH(rs.getString("Thoi_gian_HDTH"));
				giaoAnModel.setRutKinhNghiem(rs.getString("Rut_kinh_nghiem"));
				giaoAnModel.setMaNguoiDuyet(rs.getString("Ma_nguoi_duyet"));
				
				if(rs.getString("Ngay_duyet")!=null){
					String[] ngayDuyetSplit=rs.getString("Ngay_duyet").split("-");
					giaoAnModel.setNgayDuyet(ngayDuyetSplit[2].substring(0,2)+"-"+ngayDuyetSplit[1]+"-"+ngayDuyetSplit[0]);
				}
				String[] ngayTaoSplit=rs.getString("Ngay_tao").split("-");
				giaoAnModel.setNgayTao(ngayTaoSplit[2].substring(0,2)+"-"+ngayTaoSplit[1]+"-"+ngayTaoSplit[0]);
			}
		
		
		}
		catch(Exception e){
			e.printStackTrace();	
		}
		return giaoAnModel;
	}
	
	public static Boolean updateTinhTrangGiaoAnByMaGA(String maGiaoAn,String tinhTrang){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.updateTinhTrangGiaoAnByMaGiaoAn"));
			preparedStatement.setNString(1,tinhTrang);
			preparedStatement.setNString(2,maGiaoAn);


			
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
	
	public static int getTotalGiaoAnByMaKHGD(String maKHGD){
		int count=0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTotalGiaoAnByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				count=rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public static int getTotalGiaoAnNewByMaKHGD(String maKHGD){
		int count=0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTotalGiaoAnNewByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				count=rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public static Boolean updateTinhTrangGiaoAnByMaKHGD(String maKHGD,String tinhTrang){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.updateTinhTrangGiaoAnByMaKHGD"));
			preparedStatement.setNString(1,tinhTrang);
			preparedStatement.setNString(2,maKHGD);


			
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
	
	public static int getTinhTrangGiaoAnByMaGA(String maGA){
		int count=0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTinhTrangGiaoAnByMaGA"));
			preparedStatement.setString(1, maGA);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				count=rs.getInt("TINH_TRANG");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public static Boolean updateMaNguoiDuyetGiaoAn(String maGiaoAn,String maNguoiDuyet){
		Boolean result=false;
		try{
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_UpdateMaNguoiDuyetGiaoAn(?,?)}");
			csmt.setNString("maGiaoAN",maGiaoAn);
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
	
	public static Boolean updateMaNguoiDuyetGiaoAnByMaKHGD(String maKHGD,String maNguoiDuyet){
		Boolean result=false;
		try{
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_UpdateMaNguoiDuyetGiaoAnByMaKHGD(?,?)}");
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
	
	public static ArrayList<String> getListMaGARejectAndNewByMaKHGD(String maKHGD){
		ArrayList<String> maGAList=new ArrayList<String>();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getMaGARejectAndNewByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				
				maGAList.add(rs.getString("MAGA"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return maGAList;
	}

	public static Boolean updateDanNhapByMaGA(String maGA,String danNhap){
		Boolean result=false;
		try{
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_UpdateDanNhapByMaGiaoAn(?,?)}");
			csmt.setNString("MaGiaoAn",maGA);
			csmt.setNString("DanNhap",danNhap);
			
			result = DataUtil.executeNonStore(csmt);

		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return result;

	}
	
	public static Boolean updateHDTXByMaGA(String maGA,String huongDanTX){
		Boolean result=false;
		try{
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_UpdateHDTXByMaGiaoAn(?,?)}");
			csmt.setNString("MaGiaoAn",maGA);
			csmt.setNString("HuongDanThuongXuyen",huongDanTX);
			
			result = DataUtil.executeNonStore(csmt);

		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return result;

	}
	
	public static Boolean updateLyDoRejectGAByMaKHGD(String maKHGD,String lyDo){
		Boolean result=false;
		try{
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_ISO_UpdateLyDoRejectGAByMaKHGD(?,?)}");
			csmt.setNString("MaKHGD",maKHGD);
			csmt.setNString("LyDoReject",lyDo);
			result = DataUtil.executeNonStore(csmt);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return result;
	}
	
	public static Boolean dropTableKetQuaTimGiaoAn()
	{
		Boolean result=false;
		try{
			CallableStatement csmt = DataUtil
			.getConnection()
			.prepareCall("{call sp_iso_DropTableKetQuaTimGiaoAn}");
			result = DataUtil.executeNonStore(csmt);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return result;
	}
	
	public static int getLengthOfFindGiaoAn(String maNguoiTao,String maNamHoc,String maLop,String maMonHoc,String hocKi,String tinhTrang,String ngayTimBD,String ngayTimKT,String maBoPhan,String maKhoa)
	{
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_iso_GetLengthOfFindGiaoAn(?,?,?,?,?,?,?,?,?,?)}");
				
			csmt.setString("MaNguoiTao",maNguoiTao);		
			csmt.setString("MaNamHoc",maNamHoc);
			csmt.setString("MaLop",maLop);
			csmt.setString("MaMonHoc",maMonHoc);
			csmt.setString("HocKi",hocKi);
			csmt.setString("TinhTrang",tinhTrang);
			csmt.setString("NgayTimBD",DateUtil.setDate(ngayTimBD));
			csmt.setString("NgayTimKT",DateUtil.setDate(ngayTimKT));
			csmt.setString("MaBoPhan",maBoPhan);
			csmt.setString("MaKhoa",maKhoa);
			
			ResultSet rs = DataUtil.executeStore(csmt);
			
			
			while(rs.next()){
				return Integer.parseInt(rs.getString("TOTAL"));
			}
			
		
		}
		catch(Exception e){
			e.printStackTrace();	
			return 0;
		}
		
		return 0;
	}
	
	public static ArrayList<KetQuaTimGiaoAnModel> findGiaoAn(String indexPage,int lengthPage,String maNguoiTao,String maNamHoc,String maLop,String maMonHoc,String hocKi,String tinhTrang,String ngayTimBD,String ngayTimKT,String maBoPhan,String maKhoa)
	{
		if(indexPage == null)
			indexPage="1";
		else if(indexPage.equals(""))
			indexPage="1";
		
		if(!indexPage.equals("1"))
			indexPage=((Integer.parseInt(indexPage)-1)*Constant.NUM_RECORD_TIMGIAOAN)+"";
		
		KetQuaTimGiaoAnModel ketQuaGiaoAn=new KetQuaTimGiaoAnModel();
		
		ArrayList<KetQuaTimGiaoAnModel> ketQuaList=new ArrayList<KetQuaTimGiaoAnModel>();
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_iso_findgiaoan(?,?,?,?,?,?,?,?,?,?,?,?)}");
			

			csmt.setString("IndexPage",indexPage);	
			csmt.setString("LengthPage",lengthPage+"");	
			csmt.setString("MaNguoiTao",maNguoiTao);		
			csmt.setString("MaNamHoc",maNamHoc);
			csmt.setString("MaLop",maLop);
			csmt.setString("MaMonHoc",maMonHoc);
			csmt.setString("HocKi",hocKi);
			csmt.setString("TinhTrang",tinhTrang);
			csmt.setString("NgayTimBD",DateUtil.setDate(ngayTimBD));
			csmt.setString("NgayTimKT",DateUtil.setDate(ngayTimKT));
			csmt.setString("MaBoPhan",maBoPhan);
			csmt.setString("MaKhoa",maKhoa);
			
			ResultSet rs = DataUtil.executeStore(csmt);
			
			
			while(rs.next()){
				ketQuaGiaoAn=new KetQuaTimGiaoAnModel();
				ketQuaGiaoAn.setTenMonHoc(rs.getNString("TenMonHoc"));
				ketQuaGiaoAn.setTenLopHoc(rs.getNString("KiHieu"));
				ketQuaGiaoAn.setSoGiaoAn(rs.getString("SoGiaoAn"));
				ketQuaGiaoAn.setMaGiaoVien(rs.getString("MaNguoiTao"));
				
				ketQuaGiaoAn.setNgayDay(DateUtil.setDate2(rs.getString("NgayThucHien")));
				
				ketQuaGiaoAn.setNgayGui(DateUtil.setDate2(rs.getString("NgayGui")));
				
				ketQuaGiaoAn.setMaNguoiDuyet(rs.getString("NguoiDuyet"));
				
				ketQuaGiaoAn.setNgayDuyet(DateUtil.setDate2(rs.getString("NgayDuyet")));
				
				ketQuaGiaoAn.setTinhTrang(rs.getString("TinhTrang"));
				ketQuaGiaoAn.setTenGiaoVien(rs.getString("NguoiTao"));
				ketQuaGiaoAn.setTenNguoiDuyet(rs.getString("NguoiDuyet"));
				ketQuaGiaoAn.setMaLop(rs.getString("MaLop"));
				ketQuaGiaoAn.setMaMonHoc(rs.getString("MaMonHoc"));
				ketQuaGiaoAn.setMaCTKHGD(rs.getString("MaCTKHGD"));
				ketQuaGiaoAn.setCoHieu(rs.getString("CoHieu"));
				ketQuaGiaoAn.setMaKHGD(rs.getString("MaKHGD"));
				ketQuaGiaoAn.setMaGA(rs.getString("MaGiaoAn"));
				ketQuaGiaoAn.setMaPhieuKPPN(rs.getString("MaPhieu"));
				ketQuaList.add(ketQuaGiaoAn);
			}
			
		
		}
		catch(Exception e){
			e.printStackTrace();	
		}
		
		return ketQuaList;
	}
	
	public static Boolean updateNgayGuiGiaoAnByMaGiaoAn(String maGiaoAn){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.updateNgayGuiGiaoAnByMaGiaoAn"));
			
			preparedStatement.setString(1,maGiaoAn);

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
	
	public static ArrayList<String> showNumPageReportGiaoAn(int i,int total,String tenFile)
	{
		String str="";
		ArrayList<String> strList=new ArrayList<String>();
		int j=i;
         if (i > 1)
             i = i - 1;
         
             while (i <= (total) / Constant.NUM_RECORD_TIMGIAOAN)
             {
            	 if(i==j)
            		 str="<a href='"+tenFile+"&index=" + i + "' style='color:blue;background-color:yellow;text-decoration:none'>"+i+"</a>";
            	 else
            		 str="<a href='"+tenFile+"&index=" + i + "' style='color:blue;text-decoration:none'>"+i+"</a>";
                 strList.add(str);                 
            	 i++;
             }
             if ( total % Constant.NUM_RECORD_TIMGIAOAN != 0 && total > Constant.NUM_RECORD_TIMGIAOAN)
             {
            	 if(i==j)
            		 str="<a href='"+tenFile+"&index=" + i + "' style='color:blue;background-color:yellow;text-decoration:none'>"+i+"</a>";
            	 else
            		 str="<a href='"+tenFile+"&index=" + i + "' style='color:blue;text-decoration:none'>"+i+"</a>";
                 strList.add(str);
             }

		return strList;
	}
	
	public static int getTotalKetQuaTimGiaoAn()
	{
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_iso_GetTotalKetQuaTimGiaoAn}");
		
			ResultSet rs = DataUtil.executeStore(csmt);
			
			while(rs.next()){
				return rs.getInt("Total");
			}
			
		
		}
		catch(Exception e){
			e.printStackTrace();	
		}
		
		return 0;
	}

	public static Boolean insertGiaoAnTichHop(GiaoAnModel giaoAnModel){
		Boolean result=false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_InsertGiaoAnTichHop(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);	
			csmt.setNString("MA_KHGD", giaoAnModel.getMaKHGD());
			csmt.setNString("So_giao_an", giaoAnModel.getSoGiaoAn());
			
			if(giaoAnModel.getNgayThucHien()!=""){
				String[] ngayThucHienSplit=giaoAnModel.getNgayThucHien().split("-");
				csmt.setNString("Ngay_thuc_hien",ngayThucHienSplit[2]+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
			}
			else{
				csmt.setNString("Ngay_thuc_hien",giaoAnModel.getNgayTao());		
			}
			
			csmt.setNString("Muc_tieu", giaoAnModel.getMucTieu());
			csmt.setNString("Do_dung_PT_DH",giaoAnModel.getDoDungPTDH());
			csmt.setNString("Hinh_thuc_TC_DH",giaoAnModel.getHinhThucTCDH());
			csmt.setNString("On_dinh_LH",giaoAnModel.getOnDinhLH());			
			csmt.setNString("Thoi_gian_on_dinh",giaoAnModel.getThoiGianOnDinh());
			csmt.setNString("Thoi_gian_TH_BH",giaoAnModel.getThoiGianTHBH());
			csmt.setNString("Dan_nhap", giaoAnModel.getDanNhap());
			csmt.setNString("HD_dan_nhap_GV", giaoAnModel.getHDDanNhapGV());
			csmt.setNString("HD_dan_nhap_HS", giaoAnModel.getHDDanNhapHS());
			csmt.setNString("Thoi_gian_dan_nhap",giaoAnModel.getThoiGianDanNhap());
			
			csmt.setNString("Gioi_thieu_chu_de",giaoAnModel.getGioiThieuChuDe());
			csmt.setNString("HD_GTCD_GV",giaoAnModel.getHDGTCDGV());
			csmt.setNString("HD_GTCD_HS",giaoAnModel.getHDGTCDHS());
			csmt.setNString("Thoi_gian_GTCD",giaoAnModel.getThoiGianGTCD());
			
			csmt.setNString("Giai_quyet_van_de",giaoAnModel.getGiaiQuyetVanDe());
			csmt.setNString("HD_GQVD_GV",giaoAnModel.getHDGQVDGV());
			csmt.setNString("HD_GQVD_HS",giaoAnModel.getHDGQVDHS());
			csmt.setNString("Thoi_gian_GTVD",giaoAnModel.getThoiGianGTVD());
			
			csmt.setNString("Ket_thuc_van_de",giaoAnModel.getHuongDanKetThuc());
			csmt.setNString("HD_HDKT_GV",giaoAnModel.getHDHDKTGV());
			csmt.setNString("HD_HDKT_HS",giaoAnModel.getHDHDKTHS());
			csmt.setNString("Thoi_gian_HDKT",giaoAnModel.getThoiGianHDKT());
			
			csmt.setNString("Huong_dan_tu_hoc",giaoAnModel.getHuongDanTuHoc());
			csmt.setNString("HD_HDTH_GV",giaoAnModel.getHDHDTHGV());
			csmt.setNString("Thoi_gian_HDTH",giaoAnModel.getThoiGianHDTH());
			
			csmt.setNString("Rut_kinh_nghiem",giaoAnModel.getRutKinhNghiem());
			csmt.setNString("Ngay_tao",giaoAnModel.getNgayTao());
			csmt.setNString("Ten_Chuong",giaoAnModel.getTenChuong());
			csmt.setNString("Ma_Giao_Vien",giaoAnModel.getMaGiaoVien());
			
			result = DataUtil.executeNonStore(csmt);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;

	}
	
	public static Boolean updateGiaoAnTichHop(GiaoAnModel giaoAnModel){
		Boolean result=false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateGiaoAnTichHop(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setNString("MaGiaoAn", giaoAnModel.getMaGiaoAn());
			csmt.setNString("MA_KHGD", giaoAnModel.getMaKHGD());
			csmt.setNString("So_giao_an", giaoAnModel.getSoGiaoAn());

			if(giaoAnModel.getNgayThucHien()!=""){
				String[] ngayThucHienSplit=giaoAnModel.getNgayThucHien().split("-");
				csmt.setNString("Ngay_thuc_hien",ngayThucHienSplit[2]+"-"+ngayThucHienSplit[1]+"-"+ngayThucHienSplit[0]);
			}
			else{
				csmt.setNString("Ngay_thuc_hien",giaoAnModel.getNgayCapNhatCuoi());
						
			}
			
			csmt.setNString("Muc_tieu", giaoAnModel.getMucTieu());
			csmt.setNString("Do_dung_PT_DH",giaoAnModel.getDoDungPTDH());
			csmt.setNString("Hinh_thuc_TC_DH",giaoAnModel.getHinhThucTCDH());
			csmt.setNString("On_dinh_LH",giaoAnModel.getOnDinhLH());			
			csmt.setNString("Thoi_gian_on_dinh",giaoAnModel.getThoiGianOnDinh());
			csmt.setNString("Thoi_gian_TH_BH",giaoAnModel.getThoiGianTHBH());
			csmt.setNString("Dan_nhap", giaoAnModel.getDanNhap());
			csmt.setNString("HD_dan_nhap_GV", giaoAnModel.getHDDanNhapGV());
			csmt.setNString("HD_dan_nhap_HS", giaoAnModel.getHDDanNhapHS());
			csmt.setNString("Thoi_gian_dan_nhap",giaoAnModel.getThoiGianDanNhap());
			
			csmt.setNString("Gioi_thieu_chu_de",giaoAnModel.getGioiThieuChuDe());
			csmt.setNString("HD_GTCD_GV",giaoAnModel.getHDGTCDGV());
			csmt.setNString("HD_GTCD_HS",giaoAnModel.getHDGTCDHS());
			csmt.setNString("Thoi_gian_GTCD",giaoAnModel.getThoiGianGTCD());
			
			csmt.setNString("Giai_quyet_van_de",giaoAnModel.getGiaiQuyetVanDe());
			csmt.setNString("HD_GQVD_GV",giaoAnModel.getHDGQVDGV());
			csmt.setNString("HD_GQVD_HS",giaoAnModel.getHDGQVDHS());
			csmt.setNString("Thoi_gian_GTVD",giaoAnModel.getThoiGianGTVD());
			
			csmt.setNString("Ket_thuc_van_de",giaoAnModel.getHuongDanKetThuc());
			csmt.setNString("HD_HDKT_GV",giaoAnModel.getHDHDKTGV());
			csmt.setNString("HD_HDKT_HS",giaoAnModel.getHDHDKTHS());
			csmt.setNString("Thoi_gian_HDKT",giaoAnModel.getThoiGianHDKT());
			
			csmt.setNString("Huong_dan_tu_hoc",giaoAnModel.getHuongDanTuHoc());
			csmt.setNString("HD_HDTH_GV",giaoAnModel.getHDHDTHGV());
			csmt.setNString("Thoi_gian_HDTH",giaoAnModel.getThoiGianHDTH());
			
			csmt.setNString("Rut_kinh_nghiem",giaoAnModel.getRutKinhNghiem());
			csmt.setNString("Ngay_cap_nhat_cuoi",giaoAnModel.getNgayCapNhatCuoi());
			result = DataUtil.executeNonStore(csmt);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
						
		return result;

	}

	public static Boolean updateRutKinhNghiemByMaGiaoAn(String maGiaoAn,String rutKinhNghiem){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.updateRutKinhNghiemByMaGiaoAn"));
			
			preparedStatement.setNString(1, rutKinhNghiem);
			preparedStatement.setString(2,maGiaoAn);

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
	
	public static ArrayList<GiaoAnModel> getGiaoAnLTByMaKHGDChuaXong(String maKHGD){
		ArrayList<GiaoAnModel> maGAList=new ArrayList<GiaoAnModel>();
		GiaoAnModel giaoanModel;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getGiaoAnByMaKHGDAndCoHieuLT"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				giaoanModel=new  GiaoAnModel();
				giaoanModel.setMaGiaoAn(rs.getInt("ID")+"");
				giaoanModel.setSoGiaoAn(rs.getString("So_giao_an"));
				giaoanModel.setCungCoKienThuc(rs.getNString("Cung_co_kien_thuc"));
				giaoanModel.setHuongDanTuHoc(rs.getNString("Huong_dan_tu_hoc"));
				giaoanModel.setTaiLieuThamKhao(rs.getNString("Tai_lieu_tham_khao"));
				giaoanModel.setDanNhap(rs.getNString("Dan_nhap"));
				ArrayList<String> tenChuongList=StringUtil.cutTenChuong(rs.getNString("Ten_chuong"));
				if(tenChuongList.size()!=0)
					giaoanModel.setTenChuong(tenChuongList.get(0).toString());
				maGAList.add(giaoanModel);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return maGAList;
		
	}
	
	public static ArrayList<GiaoAnModel> getGiaoAnTichHopByMaKHGDChuaXong(String maKHGD){
		ArrayList<GiaoAnModel> maGAList=new ArrayList<GiaoAnModel>();
		GiaoAnModel giaoanModel;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getGiaoAnByMaKHGDAndCoHieuTHop"));
			preparedStatement.setString(1,maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				giaoanModel=new  GiaoAnModel();
				giaoanModel.setMaGiaoAn(rs.getInt("ID")+"");
				giaoanModel.setSoGiaoAn(rs.getString("So_giao_an"));;
				giaoanModel.setHuongDanKetThuc(rs.getNString("Huong_dan_ket_thuc"));
				giaoanModel.setHuongDanTuHoc(rs.getNString("Huong_dan_tu_hoc"));
				giaoanModel.setDanNhap(rs.getNString("Dan_nhap"));
				ArrayList<String> tenChuongList=StringUtil.cutTenChuong(rs.getNString("Ten_chuong"));
				if(tenChuongList.size()!=0)
					giaoanModel.setTenChuong(tenChuongList.get(0).toString());
				maGAList.add(giaoanModel);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return maGAList;
		
	}
	
	public static ArrayList<GiaoAnModel> getGiaoAnThucHanhByMaKHGDChuaXong(String maKHGD){
		ArrayList<GiaoAnModel> maGAList=new ArrayList<GiaoAnModel>();
		GiaoAnModel giaoanModel;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getGiaoAnByMaKHGDAndCoHieuTH"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				giaoanModel=new  GiaoAnModel();
				giaoanModel.setMaGiaoAn(rs.getInt("ID")+"");
				giaoanModel.setSoGiaoAn(rs.getString("So_giao_an"));
				giaoanModel.setDanNhap(rs.getNString("Dan_nhap"));
				giaoanModel.setHuongDanBanDau(rs.getNString("Huong_dan_ban_dau"));
				giaoanModel.setHuongDanRenLuyen(rs.getNString("Huong_dan_ren_luyen"));
				giaoanModel.setHuongDanKetThuc(rs.getNString("Huong_dan_ket_thuc"));
				ArrayList<String> tenChuongList=StringUtil.cutTenChuong(rs.getNString("Ten_chuong"));
				if(tenChuongList.size()!=0)
					giaoanModel.setTenChuong(tenChuongList.get(0).toString());
				maGAList.add(giaoanModel);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return maGAList;
		
	}
	
	public static Boolean updateGiaoAnLTChuaThucHienXongByMaGA(GiaoAnModel giaoan){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.updateGiaoAnLTChuaThucHienXongByMaGA"));
			preparedStatement.setNString(1,StringUtil.toUTF8(giaoan.getCungCoKienThuc().trim()));
			preparedStatement.setNString(2,StringUtil.toUTF8(giaoan.getHuongDanTuHoc().trim()));
			preparedStatement.setNString(3,StringUtil.toUTF8(giaoan.getTaiLieuThamKhao().trim()));
			preparedStatement.setNString(4,StringUtil.toUTF8(giaoan.getDanNhap().trim()));
			preparedStatement.setString(5,giaoan.getMaGiaoAn());


			
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
	
	public static Boolean updateGiaoAnTHChuaThucHienXongByMaGA(GiaoAnModel giaoan){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.updateGiaoAnTHChuaThucHienXongByMaGA"));
			preparedStatement.setNString(1,StringUtil.toUTF8(giaoan.getHuongDanBanDau().trim()));
			preparedStatement.setNString(2,StringUtil.toUTF8(giaoan.getHuongDanKetThuc().trim()));
			preparedStatement.setNString(3,StringUtil.toUTF8(giaoan.getHuongDanRenLuyen().trim()));
			preparedStatement.setNString(4,StringUtil.toUTF8(giaoan.getDanNhap().trim()));
			preparedStatement.setString(5,giaoan.getMaGiaoAn());

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
	
	public static Boolean updateGiaoAnTHopChuaThucHienXongByMaGA(GiaoAnModel giaoan){
		Boolean result=false;
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("iso.sql.updateGiaoAnTHopChuaThucHienXongByMaGA"));
			preparedStatement.setNString(1,StringUtil.toUTF8(giaoan.getHuongDanKetThuc().trim()));
			preparedStatement.setNString(2,StringUtil.toUTF8(giaoan.getHuongDanTuHoc().trim()));
			preparedStatement.setNString(3,StringUtil.toUTF8(giaoan.getDanNhap().trim()));
			preparedStatement.setString(4,giaoan.getMaGiaoAn());
			
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
	
	
	public static void copyGiaoAnByMaKHGD(String maKHGDNew,String maKHGDCopy){
	
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_CopyGiaoAn(?,?)}");
			csmt.setString("MaKHGDNew", maKHGDNew);
			csmt.setString("MaKHGDCopy", maKHGDCopy);
			csmt.execute();
		}
		catch(SQLException e)
		{
			e.printStackTrace();

		}
		
	}
}
