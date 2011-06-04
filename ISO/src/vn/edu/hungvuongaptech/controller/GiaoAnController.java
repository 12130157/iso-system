package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietKHGDDAO;
import vn.edu.hungvuongaptech.dao.GiaoAnDAO;
import vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.GiaoAnModel;
import vn.edu.hungvuongaptech.model.ThanhVienNhacNhoModel;
import vn.edu.hungvuongaptech.taglib.ChangeStringTaglib;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class GiaoAnController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GiaoAnController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionType = request.getParameter("actionType").toString();
		if(actionType.equalsIgnoreCase("insertlt")){
			insertGiaoAnLyThuyet(request, response);
		}
		else if(actionType.equalsIgnoreCase("updatelt")){
			updateGiaoAnLyThuyet(request, response);
		}
		else if(actionType.equalsIgnoreCase("insertth")){
			insertGiaoAnThucHanh(request, response);
		}
		else if(actionType.equalsIgnoreCase("updateth")){
			updateGiaoAnThucHanh(request, response);
		}
		else if(actionType.equalsIgnoreCase("rejectLT")){
				rejectGiaoAnLyThuyet(request, response);
		}
		else if(actionType.equalsIgnoreCase("rejectTH")){
			rejectGiaoAnThucHanh(request, response);
		}
		else if(actionType.equalsIgnoreCase("approveLT")){
			approveGiaoAnLyThuyet(request, response);
		}
		else if(actionType.equalsIgnoreCase("approveTH")){
			approveGiaoAnThucHanh(request, response);
		}
		else if(actionType.equalsIgnoreCase("SendLT")){
			sendGiaoAnLyThuyet(request, response);
		}
		else if(actionType.equalsIgnoreCase("SendTH")){
			sendGiaoAnThucHanh(request, response);
		}
		else if(actionType.equalsIgnoreCase("SendTHop")){
			sendGiaoAnTichHop(request, response);
		}
		else if(actionType.equalsIgnoreCase("insertthop")){
			insertGiaoAnTichHop(request, response);
		}
		else if(actionType.equalsIgnoreCase("updatethop")){
			updateGiaoAnTichHop(request, response);
		}
		else if(actionType.equalsIgnoreCase("rejectTHop")){
			rejectGiaoAnTichHop(request, response);
		}
		else if(actionType.equalsIgnoreCase("approveTHop")){
			approveGiaoAnTichHop(request, response);
		}
		else if(actionType.equalsIgnoreCase("capnhatRKNTichHop")){
			updateRutKinhNghiemGiaoAnTichHop(request,response);
		}
		else if(actionType.equalsIgnoreCase("capnhatRKNThucHanh")){
			updateRutKinhNghiemGiaoAnThucHanh(request,response);
		}
		else if(actionType.equalsIgnoreCase("GAChuaTH")){
			updateGiaoAnChuaThucHienXong(request,response);
		}
		else if(actionType.equalsIgnoreCase("approveTimGA")){
			approveForTimGiaoAnPage(request,response);
			
		}
		else if(actionType.equalsIgnoreCase("emailNhacNho")){
			sendMailsNhacNhoCacGiaoVien(request,response);
			
		}
		
	}
	
	
	private GiaoAnModel mapGiaoAnLyThuyet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		giaoAnModel.setMaGiaoAn(request.getParameter("maGiaoAn"));
		giaoAnModel.setMaKHGD(request.getParameter("maKHGD"));
		giaoAnModel.setSoGiaoAn(request.getParameter("txtSoGA").trim());
		if(request.getParameter("txtCalendar").trim()!=""){
			giaoAnModel.setNgayThucHien(request.getParameter("txtCalendar"));
		}
		else{
			giaoAnModel.setNgayThucHien("");			
		}
		giaoAnModel.setMucTieu(StringUtil.toUTF8(request.getParameter("txtMucTieu").trim()));
		giaoAnModel.setDoDungPTDH(StringUtil.toUTF8(request.getParameter("txtDoDungPTDH").trim()));
		giaoAnModel.setOnDinhLH(StringUtil.toUTF8(request.getParameter("txtODLH").trim()));
		giaoAnModel.setThoiGianOnDinh(request.getParameter("txtTGOD"));
		giaoAnModel.setThoiGianTHBH(request.getParameter("txtTGTHBH"));
		giaoAnModel.setDanNhap(StringUtil.toUTF8(request.getParameter("txtDanNhap").trim()));
		giaoAnModel.setHDDanNhapGV(StringUtil.toUTF8(request.getParameter("txtHDDNGV").trim()));
		giaoAnModel.setHDDanNhapHS(StringUtil.toUTF8(request.getParameter("txtHDDNHS").trim()));
		giaoAnModel.setThoiGianDanNhap(request.getParameter("txtTGDN"));
		giaoAnModel.setNoiDungBaiGiang(StringUtil.toUTF8(request.getParameter("txtGiangBaiMoi").trim()));
		giaoAnModel.setHDGiangBaiMoiGV(StringUtil.toUTF8(request.getParameter("txtGiangBaiMoiGV").trim()));
		giaoAnModel.setHDGiangBaiMoiHS(StringUtil.toUTF8(request.getParameter("txtGiangBaiMoiHS").trim()));
		giaoAnModel.setThoiGianBaiGiang(request.getParameter("txtTGGiangBaiMoi"));
		giaoAnModel.setCungCoKienThuc(StringUtil.toUTF8(request.getParameter("txtCungCoKienThuc").trim()));
		giaoAnModel.setHDCungCoGV(StringUtil.toUTF8(request.getParameter("txtCungCoGV").trim()));
		giaoAnModel.setHDCungCoHS(StringUtil.toUTF8(request.getParameter("txtCungCoHS").trim()));
		giaoAnModel.setThoiGianCungCo(request.getParameter("txtTGCungCo"));
		giaoAnModel.setHuongDanTuHoc(StringUtil.toUTF8(request.getParameter("txtHDTH").trim()));
		giaoAnModel.setHDHDTHGV(StringUtil.toUTF8(request.getParameter("txtHDTHGV").trim()));
		giaoAnModel.setHDHDTHHS(StringUtil.toUTF8(request.getParameter("txtHDTHHS").trim()));
		giaoAnModel.setThoiGianHDTH(request.getParameter("txtTGHDTH"));
		giaoAnModel.setTaiLieuThamKhao(StringUtil.toUTF8(request.getParameter("txtTaiLieuThamKhao").trim()));
		giaoAnModel.setNgayCapNhatCuoi(SysParamsDAO.getSysParams().getGioHeThong());
		
		return giaoAnModel;
		
		
	}

	private GiaoAnModel mapGiaoAnThucHanh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		giaoAnModel.setMaGiaoAn(request.getParameter("maGiaoAn"));
		giaoAnModel.setMaKHGD(request.getParameter("maKHGD"));
		giaoAnModel.setSoGiaoAn(request.getParameter("txtSoGA"));
		if(request.getParameter("txtCalendar").trim()!=""){
			giaoAnModel.setNgayThucHien(request.getParameter("txtCalendar"));
		}
		else{
			giaoAnModel.setNgayThucHien("");		
		}
		giaoAnModel.setMucTieu(StringUtil.toUTF8(request.getParameter("txtMucTieu").trim()));
		giaoAnModel.setDoDungPTDH(StringUtil.toUTF8(request.getParameter("txtDoDungPTDH").trim()));
		giaoAnModel.setHinhThucTCDH(StringUtil.toUTF8(request.getParameter("txtHinhThucTCDH").trim()));
		giaoAnModel.setOnDinhLH(StringUtil.toUTF8(request.getParameter("txtODLH").trim()));
		giaoAnModel.setThoiGianOnDinh(request.getParameter("txtTGOD"));
		giaoAnModel.setThoiGianTHBH(request.getParameter("txtTGTHBH"));
		giaoAnModel.setDanNhap(StringUtil.toUTF8(request.getParameter("txtDanNhap").trim()));
		giaoAnModel.setHDDanNhapGV(StringUtil.toUTF8(request.getParameter("txtHDDNGV").trim()));
		giaoAnModel.setHDDanNhapHS(StringUtil.toUTF8(request.getParameter("txtHDDNHS").trim()));
		giaoAnModel.setThoiGianDanNhap(request.getParameter("txtTGDN"));
		giaoAnModel.setHuongDanBanDau(StringUtil.toUTF8(request.getParameter("txtHDBD").trim()));
		giaoAnModel.setHDHDBDGV(StringUtil.toUTF8(request.getParameter("txtHDBDGV").trim()));
		giaoAnModel.setHDHDBDHS(StringUtil.toUTF8(request.getParameter("txtHDBDHS").trim()));
		giaoAnModel.setThoiGianHDBD(request.getParameter("txtTGHDBD"));
		giaoAnModel.setHuongDanThuongXuyen(StringUtil.toUTF8(request.getParameter("txtHDTX").trim()));
		giaoAnModel.setHDHDTXGV(StringUtil.toUTF8(request.getParameter("txtHDTXGV").trim()));
		giaoAnModel.setHDHDTXHS(StringUtil.toUTF8(request.getParameter("txtHDTXHS").trim()));
		giaoAnModel.setThoiGianHDTX(request.getParameter("txtTGHDTX"));
		giaoAnModel.setHuongDanKetThuc(StringUtil.toUTF8(request.getParameter("txtHDKT").trim()));
		giaoAnModel.setHDHDKTGV(StringUtil.toUTF8(request.getParameter("txtHDKTGV").trim()));
		giaoAnModel.setHDHDKTHS(StringUtil.toUTF8(request.getParameter("txtHDKTHS").trim()));
		giaoAnModel.setThoiGianHDKT(request.getParameter("txtTGHDKT"));
		giaoAnModel.setHuongDanRenLuyen(StringUtil.toUTF8(request.getParameter("txtHDRL").trim()));
		giaoAnModel.setHDHDRLGV(StringUtil.toUTF8(request.getParameter("txtHDRLGV").trim()));
		giaoAnModel.setThoiGianHDRL(request.getParameter("txtTGHDRL"));
		giaoAnModel.setRutKinhNghiem(StringUtil.toUTF8(request.getParameter("txtRutKinhNghiem").trim()));
		giaoAnModel.setNgayCapNhatCuoi(SysParamsDAO.getSysParams().getGioHeThong());
		return giaoAnModel;
	}

	private GiaoAnModel mapGiaoAnTichHop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		giaoAnModel.setMaGiaoAn(request.getParameter("maGiaoAn"));
		giaoAnModel.setMaKHGD(request.getParameter("maKHGD"));
		giaoAnModel.setSoGiaoAn(request.getParameter("txtSoGA"));
		if(request.getParameter("txtCalendar").trim()!=""){
			giaoAnModel.setNgayThucHien(request.getParameter("txtCalendar"));
		}
		else{
			giaoAnModel.setNgayThucHien("");		
		}
		giaoAnModel.setMucTieu(StringUtil.toUTF8(request.getParameter("txtMucTieu").trim()));
		giaoAnModel.setDoDungPTDH(StringUtil.toUTF8(request.getParameter("txtDoDungPTDH").trim()));
		giaoAnModel.setHinhThucTCDH(StringUtil.toUTF8(request.getParameter("txtHinhThucTCDH").trim()));
		giaoAnModel.setOnDinhLH(StringUtil.toUTF8(request.getParameter("txtODLH").trim()));
		giaoAnModel.setThoiGianOnDinh(request.getParameter("txtTGOD"));
		giaoAnModel.setThoiGianTHBH(request.getParameter("txtTGTHBH"));
		giaoAnModel.setDanNhap(StringUtil.toUTF8(request.getParameter("txtDanNhap").trim()));
		giaoAnModel.setHDDanNhapGV(StringUtil.toUTF8(request.getParameter("txtHDDNGV").trim()));
		giaoAnModel.setHDDanNhapHS(StringUtil.toUTF8(request.getParameter("txtHDDNHS").trim()));
		giaoAnModel.setThoiGianDanNhap(request.getParameter("txtTGDN"));
		
		giaoAnModel.setGioiThieuChuDe(StringUtil.toUTF8(request.getParameter("txtGTCD").trim()));
		giaoAnModel.setHDGTCDGV(StringUtil.toUTF8(request.getParameter("txtGTCDGV").trim()));
		giaoAnModel.setHDGTCDHS(StringUtil.toUTF8(request.getParameter("txtGTCDHS").trim()));
		giaoAnModel.setThoiGianGTCD(request.getParameter("txtTGGTCD"));
		
		giaoAnModel.setGiaiQuyetVanDe(StringUtil.toUTF8(request.getParameter("txtGQVD").trim()));
		giaoAnModel.setHDGQVDGV(StringUtil.toUTF8(request.getParameter("txtGQVDGV").trim()));
		giaoAnModel.setHDGQVDHS(StringUtil.toUTF8(request.getParameter("txtGQVDHS").trim()));
		giaoAnModel.setThoiGianGTVD(request.getParameter("txtTGGQVD"));
		
		giaoAnModel.setHuongDanKetThuc(StringUtil.toUTF8(request.getParameter("txtKTVD").trim()));
		giaoAnModel.setHDHDKTGV(StringUtil.toUTF8(request.getParameter("txtKTVDGV").trim()));
		giaoAnModel.setHDHDKTHS(StringUtil.toUTF8(request.getParameter("txtKTVDHS").trim()));
		giaoAnModel.setThoiGianHDKT(request.getParameter("txtTGKTVD"));
		
		giaoAnModel.setHuongDanTuHoc(StringUtil.toUTF8(request.getParameter("txtHDTH").trim()));
		giaoAnModel.setHDHDTHGV(StringUtil.toUTF8(request.getParameter("txtHDTHGV").trim()));
		giaoAnModel.setThoiGianHDTH(request.getParameter("txtTGHDTH"));
		
		
		giaoAnModel.setRutKinhNghiem(StringUtil.toUTF8(request.getParameter("txtRutKinhNghiem").trim()));
		giaoAnModel.setNgayCapNhatCuoi(SysParamsDAO.getSysParams().getGioHeThong());
		return giaoAnModel;
	}

	//********************************************KHU VUC GOI MAIL*********************************************************************
	

	//********************************************************KHU VUC GOI MAIL***********************************************************
	private void rejectGiaoAnTichHop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_REJECT)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
					+ "?err=rejectTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
		else{
			rejectMail(request, response);
//			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
//					+ "?err=rejectTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		
		}	
	}

	private void rejectGiaoAnLyThuyet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_REJECT)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnLyThuyet")
					+ "?err=rejectTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else{
		rejectMail(request, response);

//			
//			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnLyThuyet")
//					+ "?err=rejectTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		
		}
	}

	private void rejectGiaoAnThucHanh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_REJECT)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
					+ "?err=rejectTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else{
			
			rejectMail(request, response);
//			
//			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
//					+ "?err=rejectTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		
		}
	}

	private void approveGiaoAnTichHop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_APPROVE)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
					+ "?err=approveTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else
		{	
			approveMail(request, response);
//			
//			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
//					+ "?err=approveTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		
		}
	}
	
	private void approveGiaoAnLyThuyet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_APPROVE)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnLyThuyet")
					+ "?err=approveTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
		else
		{	
			approveMail(request, response);
			
//			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
//					+ "?err=approveTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
//		
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		}
	}
		
	private void approveGiaoAnThucHanh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_APPROVE)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
					+ "?err=approveTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else
		{	
			approveMail(request, response);
			
//			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
//					+ "?err=approveTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
//		
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		}
	}
	
	private void approveForTimGiaoAnPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_APPROVE)){
		
			approveMail(request, response);
	
		}
		response.sendRedirect(request.getParameter("pathPage"));
	}
	

	private void sendGiaoAnLyThuyet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnDAO.updateGiaoAnLyThuyet(mapGiaoAnLyThuyet(request, response));
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_SEND)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnLyThuyet")
					+ "?err=sendTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
		else
		{
			sendMail(request, response);
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		
		}

	}
	
	private void sendGiaoAnThucHanh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnDAO.updateGiaoAnThucHanh(mapGiaoAnThucHanh(request, response));
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_SEND)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
					+ "?err=sendTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
		else
		{	
			sendMail(request, response);			
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		}
	}

	private void sendGiaoAnTichHop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnDAO.updateGiaoAnTichHop(mapGiaoAnTichHop(request, response));
		if(!GiaoAnDAO.updateTinhTrangGiaoAnByMaGA(request.getParameter("maGiaoAn"),Constant.TINHTRANG_SEND)){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
					+ "?err=sendTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
		else
		{
			sendMail(request, response);	
			response.sendRedirect(Constant.PATH_RES.getString("iso.NewKeHoachGiangDayPath")
					+ "?maKHGD="+request.getParameter("maKHGD"));
		
		}
	}
	
	private void sendMailsNhacNhoCacGiaoVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(request.getParameter("totalEmail")!=null){
			int total=Integer.parseInt(request.getParameter("totalEmail"));
			//*****************GOM MAIL********************************
			if(total!=0){
				ThanhVienNhacNhoModel thanhVienModel;
				ArrayList<ThanhVienNhacNhoModel> thanhVienList=new ArrayList<ThanhVienNhacNhoModel>();
				for(int i=0;i<total;i++){
					thanhVienModel=new ThanhVienNhacNhoModel();
					String tenGiaoVien=request.getParameter("txtTenGiaoVien_"+i);
					String tenChuongTrinh="Giáo án số "+request.getParameter("txtSoGiaoAn_"+i)+" thuộc " + request.getParameter("txtTenMonHoc_"+i) + " - "+ request.getParameter("txtTenLopHoc_"+i);
					String ngayDay=request.getParameter("txtNgayDay_"+i);
					String maNguoiTao=request.getParameter("txtMaGiaoVien_"+i);
					thanhVienModel.setMaThanhVien(maNguoiTao);
					thanhVienModel.setTenThanhVien(StringUtil.toUTF8(tenGiaoVien));
					thanhVienModel.setTenChuongTrinh(tenChuongTrinh);
					thanhVienModel.setNgayDay(ngayDay);
					thanhVienList.add(thanhVienModel);
				}
				emailNhacNho(thanhVienList,request,response);
			}
		}
		response.sendRedirect(request.getParameter("pathPage"));
	}

	//*********************************************************************************************************************************
	
	
	
	
	//********************************************************KHU VUC THAO TAC DU LIEU***************************************************
	private void insertGiaoAnLyThuyet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		giaoAnModel.setMaKHGD(request.getParameter("maKHGD"));
		giaoAnModel.setSoGiaoAn(request.getParameter("txtSoGA"));
		if(request.getParameter("txtCalendar").length()==0){
			giaoAnModel.setNgayThucHien("");
		}
		else{
			
			giaoAnModel.setNgayThucHien(request.getParameter("txtCalendar"));
		}
		giaoAnModel.setMucTieu(StringUtil.toUTF8(request.getParameter("txtMucTieu").trim()));
		giaoAnModel.setDoDungPTDH(StringUtil.toUTF8(request.getParameter("txtDoDungPTDH").trim()));
		giaoAnModel.setOnDinhLH(StringUtil.toUTF8(request.getParameter("txtODLH").trim()));
		giaoAnModel.setThoiGianOnDinh(request.getParameter("txtTGOD").trim());
		giaoAnModel.setThoiGianTHBH(request.getParameter("txtTGTHBH"));
		giaoAnModel.setDanNhap(StringUtil.toUTF8(request.getParameter("txtDanNhap").trim()));
		giaoAnModel.setHDDanNhapGV(StringUtil.toUTF8(request.getParameter("txtHDDNGV").trim()));
		giaoAnModel.setHDDanNhapHS(StringUtil.toUTF8(request.getParameter("txtHDDNHS").trim()));
		giaoAnModel.setThoiGianDanNhap(request.getParameter("txtTGDN"));
		giaoAnModel.setNoiDungBaiGiang(StringUtil.toUTF8(request.getParameter("txtGiangBaiMoi").trim()));
		giaoAnModel.setHDGiangBaiMoiGV(StringUtil.toUTF8(request.getParameter("txtGiangBaiMoiGV").trim()));
		giaoAnModel.setHDGiangBaiMoiHS(StringUtil.toUTF8(request.getParameter("txtGiangBaiMoiHS").trim()));
		giaoAnModel.setThoiGianBaiGiang(request.getParameter("txtTGGiangBaiMoi"));
		giaoAnModel.setCungCoKienThuc(StringUtil.toUTF8(request.getParameter("txtCungCoKienThuc").trim()));
		giaoAnModel.setHDCungCoGV(StringUtil.toUTF8(request.getParameter("txtCungCoGV").trim()));
		giaoAnModel.setHDCungCoHS(StringUtil.toUTF8(request.getParameter("txtCungCoHS").trim()));
		giaoAnModel.setThoiGianCungCo(request.getParameter("txtTGCungCo"));
		giaoAnModel.setHuongDanTuHoc(StringUtil.toUTF8(request.getParameter("txtHDTH").trim()));
		giaoAnModel.setHDHDTHGV(StringUtil.toUTF8(request.getParameter("txtHDTHGV").trim()));
		giaoAnModel.setHDHDTHHS(StringUtil.toUTF8(request.getParameter("txtHDTHHS").trim()));
		giaoAnModel.setThoiGianHDTH(request.getParameter("txtTGHDTH"));
		giaoAnModel.setTaiLieuThamKhao(StringUtil.toUTF8(request.getParameter("txtTaiLieuThamKhao").trim()));
		
		giaoAnModel.setNgayTao(SysParamsDAO.getSysParams().getGioHeThong());
		
		giaoAnModel.setTenChuong(StringUtil.toUTF8(request.getParameter("txtTenChuong").trim()));
		giaoAnModel.setMaGiaoVien(request.getParameter("txtMaNguoiTao"));
		
		
		if(GiaoAnDAO.insertGiaoAnLyThuyet(giaoAnModel)==false){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnLyThuyet")
					+ "?err=insertTB&stt=insert&soGA="+request.getParameter("txtSoGA")+"&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
		else{
			ChiTietKHGDDAO.updateMaGiaoAnByMaCTKHGD(request.getParameter("txtMaCTKHGD"));
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnLyThuyet")
					+ "?err=insertTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
	}
	private void updateGiaoAnThucHanh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		if(GiaoAnDAO.updateGiaoAnThucHanh(mapGiaoAnThucHanh(request, response))==false){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
					+ "?err=updateTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else{
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
					+ "?err=updateTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
	}	
	private void insertGiaoAnThucHanh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		
		giaoAnModel.setMaKHGD(request.getParameter("maKHGD"));
		giaoAnModel.setSoGiaoAn(request.getParameter("txtSoGA"));
		if(request.getParameter("txtCalendar").length()==0){
			giaoAnModel.setNgayThucHien("");
		}
		else{
			giaoAnModel.setNgayThucHien(request.getParameter("txtCalendar"));
		}
		
		giaoAnModel.setMucTieu(StringUtil.toUTF8(request.getParameter("txtMucTieu").trim()));
		giaoAnModel.setDoDungPTDH(StringUtil.toUTF8(request.getParameter("txtDoDungPTDH").trim()));
		giaoAnModel.setHinhThucTCDH(StringUtil.toUTF8(request.getParameter("txtHinhThucTCDH").trim()));
		giaoAnModel.setOnDinhLH(StringUtil.toUTF8(request.getParameter("txtODLH").trim()));
		giaoAnModel.setThoiGianOnDinh(request.getParameter("txtTGOD"));
		giaoAnModel.setThoiGianTHBH(request.getParameter("txtTGTHBH"));
		giaoAnModel.setDanNhap(StringUtil.toUTF8(request.getParameter("txtDanNhap").trim()));
		giaoAnModel.setHDDanNhapGV(StringUtil.toUTF8(request.getParameter("txtHDDNGV").trim()));
		giaoAnModel.setHDDanNhapHS(StringUtil.toUTF8(request.getParameter("txtHDDNHS").trim()));
		giaoAnModel.setThoiGianDanNhap(request.getParameter("txtTGDN"));
		giaoAnModel.setHuongDanBanDau(StringUtil.toUTF8(request.getParameter("txtHDBD").trim()));
		giaoAnModel.setHDHDBDGV(StringUtil.toUTF8(request.getParameter("txtHDBDGV").trim()));
		giaoAnModel.setHDHDBDHS(StringUtil.toUTF8(request.getParameter("txtHDBDHS").trim()));
		giaoAnModel.setThoiGianHDBD(request.getParameter("txtTGHDBD"));
		giaoAnModel.setHuongDanThuongXuyen(StringUtil.toUTF8(request.getParameter("txtHDTX").trim()));
		giaoAnModel.setHDHDTXGV(StringUtil.toUTF8(request.getParameter("txtHDTXGV").trim()));
		giaoAnModel.setHDHDTXHS(StringUtil.toUTF8(request.getParameter("txtHDTXHS").trim()));
		giaoAnModel.setThoiGianHDTX(request.getParameter("txtTGHDTX"));
		giaoAnModel.setHuongDanKetThuc(StringUtil.toUTF8(request.getParameter("txtHDKT").trim()));
		giaoAnModel.setHDHDKTGV(StringUtil.toUTF8(request.getParameter("txtHDKTGV").trim()));
		giaoAnModel.setHDHDKTHS(StringUtil.toUTF8(request.getParameter("txtHDKTHS").trim()));
		giaoAnModel.setThoiGianHDKT(request.getParameter("txtTGHDKT"));
		giaoAnModel.setHuongDanRenLuyen(StringUtil.toUTF8(request.getParameter("txtHDRL").trim()));
		giaoAnModel.setHDHDRLGV(StringUtil.toUTF8(request.getParameter("txtHDRLGV").trim()));
		giaoAnModel.setThoiGianHDRL(request.getParameter("txtTGHDRL"));
		giaoAnModel.setRutKinhNghiem(StringUtil.toUTF8(request.getParameter("txtRutKinhNghiem").trim()));
		giaoAnModel.setNgayTao(SysParamsDAO.getSysParams().getGioHeThong());
		giaoAnModel.setTenChuong(StringUtil.toUTF8(request.getParameter("txtTenChuong").trim()));
		giaoAnModel.setMaGiaoVien(request.getParameter("txtMaNguoiTao"));
		
		
		if(GiaoAnDAO.insertGiaoAnThucHanh(giaoAnModel)==false){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
					+ "?err=insertTB&stt=insert&soGA="+request.getParameter("txtSoGA")+"&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else{
			ChiTietKHGDDAO.updateMaGiaoAnByMaCTKHGD(request.getParameter("txtMaCTKHGD"));
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
					+ "?err=insertTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));

		}
	}
	private void insertGiaoAnTichHop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnModel giaoAnModel=new GiaoAnModel();
		
		giaoAnModel.setMaKHGD(request.getParameter("maKHGD"));
		giaoAnModel.setSoGiaoAn(request.getParameter("txtSoGA"));
		if(request.getParameter("txtCalendar").length()==0){
			giaoAnModel.setNgayThucHien("");
		}
		else{
			giaoAnModel.setNgayThucHien(request.getParameter("txtCalendar"));
		}
		
		giaoAnModel.setMucTieu(StringUtil.toUTF8(request.getParameter("txtMucTieu").trim()));
		giaoAnModel.setDoDungPTDH(StringUtil.toUTF8(request.getParameter("txtDoDungPTDH").trim()));
		giaoAnModel.setHinhThucTCDH(StringUtil.toUTF8(request.getParameter("txtHinhThucTCDH").trim()));
		giaoAnModel.setOnDinhLH(StringUtil.toUTF8(request.getParameter("txtODLH").trim()));
		giaoAnModel.setThoiGianOnDinh(request.getParameter("txtTGOD"));
		giaoAnModel.setThoiGianTHBH(request.getParameter("txtTGTHBH"));
		giaoAnModel.setDanNhap(StringUtil.toUTF8(request.getParameter("txtDanNhap").trim()));
		giaoAnModel.setHDDanNhapGV(StringUtil.toUTF8(request.getParameter("txtHDDNGV").trim()));
		giaoAnModel.setHDDanNhapHS(StringUtil.toUTF8(request.getParameter("txtHDDNHS").trim()));
		giaoAnModel.setThoiGianDanNhap(request.getParameter("txtTGDN"));
		
		giaoAnModel.setGioiThieuChuDe(StringUtil.toUTF8(request.getParameter("txtGTCD").trim()));
		giaoAnModel.setHDGTCDGV(StringUtil.toUTF8(request.getParameter("txtGTCDGV").trim()));
		giaoAnModel.setHDGTCDHS(StringUtil.toUTF8(request.getParameter("txtGTCDHS").trim()));
		giaoAnModel.setThoiGianGTCD(request.getParameter("txtTGGTCD"));
		
		giaoAnModel.setGiaiQuyetVanDe(StringUtil.toUTF8(request.getParameter("txtGQVD").trim()));
		giaoAnModel.setHDGQVDGV(StringUtil.toUTF8(request.getParameter("txtGQVDGV").trim()));
		giaoAnModel.setHDGQVDHS(StringUtil.toUTF8(request.getParameter("txtGQVDHS").trim()));
		giaoAnModel.setThoiGianGTVD(request.getParameter("txtTGGQVD"));
		
		giaoAnModel.setHuongDanKetThuc(StringUtil.toUTF8(request.getParameter("txtKTVD").trim()));
		giaoAnModel.setHDHDKTGV(StringUtil.toUTF8(request.getParameter("txtKTVDGV").trim()));
		giaoAnModel.setHDHDKTHS(StringUtil.toUTF8(request.getParameter("txtKTVDHS").trim()));
		giaoAnModel.setThoiGianHDKT(request.getParameter("txtTGKTVD"));
		
		giaoAnModel.setHuongDanTuHoc(StringUtil.toUTF8(request.getParameter("txtHDTH").trim()));
		giaoAnModel.setHDHDTHGV(StringUtil.toUTF8(request.getParameter("txtHDTHGV").trim()));
		giaoAnModel.setThoiGianHDTH(request.getParameter("txtTGHDTH"));
		
		giaoAnModel.setRutKinhNghiem(StringUtil.toUTF8(request.getParameter("txtRutKinhNghiem").trim()));
		giaoAnModel.setNgayTao(SysParamsDAO.getSysParams().getGioHeThong());
		giaoAnModel.setTenChuong(StringUtil.toUTF8(request.getParameter("txtTenChuong").trim()));
		giaoAnModel.setMaGiaoVien(request.getParameter("txtMaNguoiTao"));
		
		
		if(GiaoAnDAO.insertGiaoAnTichHop(giaoAnModel)==false){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
					+ "?err=insertTB&stt=insert&soGA="+request.getParameter("txtSoGA")+"&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else{
			ChiTietKHGDDAO.updateMaGiaoAnByMaCTKHGD(request.getParameter("txtMaCTKHGD"));
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
					+ "?err=insertTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));

		}
	}		
	private void updateGiaoAnTichHop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(GiaoAnDAO.updateGiaoAnTichHop(mapGiaoAnTichHop(request, response))==false){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
					+ "?err=updateTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else{
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
					+ "?err=updateTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
	}
	
	private void updateRutKinhNghiemGiaoAnTichHop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(GiaoAnDAO.updateRutKinhNghiemByMaGiaoAn(request.getParameter("maGiaoAn"),StringUtil.toUTF8(request.getParameter("txtRutKinhNghiem").trim())))
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnTichHop")
					+ "?err=updateTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
	}
	
	private void updateRutKinhNghiemGiaoAnThucHanh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(GiaoAnDAO.updateRutKinhNghiemByMaGiaoAn(request.getParameter("maGiaoAn"),StringUtil.toUTF8(request.getParameter("txtRutKinhNghiem").trim())))
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnThucHanh")
					+ "?err=updateTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
	}
	
	private void updateGiaoAnChuaThucHienXong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		int lengthLT=Integer.parseInt(request.getParameter("lengthLT"));

		int lengthTH=Integer.parseInt(request.getParameter("lengthTH"));

		int lengthTHop=Integer.parseInt(request.getParameter("lengthTHop"));
		GiaoAnModel giaoan;
		for(int i=0;i<lengthLT;i++){
			giaoan=new GiaoAnModel();
			giaoan.setMaGiaoAn(request.getParameter("txtLT_MaGA_"+i));
			giaoan.setDanNhap(request.getParameter("txtLT_DanNhap_"+i));
			giaoan.setCungCoKienThuc(request.getParameter("txtLT_CCKT_"+i));
			giaoan.setHuongDanTuHoc(request.getParameter("txtLT_HDTH_"+i));
			giaoan.setTaiLieuThamKhao(request.getParameter("txtLT_TLTK_"+i));
			GiaoAnDAO.updateGiaoAnLTChuaThucHienXongByMaGA(giaoan);
		}
		
		for(int i=0;i<lengthTH;i++){
			giaoan=new GiaoAnModel();
			giaoan.setMaGiaoAn(request.getParameter("txtTH_MaGA_"+i));
			giaoan.setDanNhap(request.getParameter("txtTH_DanNhap_"+i));
			giaoan.setHuongDanBanDau(request.getParameter("txtTH_HDBD_"+i));
			giaoan.setHuongDanKetThuc(request.getParameter("txtTH_HDKT_"+i));
			giaoan.setHuongDanRenLuyen(request.getParameter("txtTH_HDRL_"+i));
			GiaoAnDAO.updateGiaoAnTHChuaThucHienXongByMaGA(giaoan);
		}

		for(int i=0;i<lengthTHop;i++){
			giaoan=new GiaoAnModel();
			giaoan.setMaGiaoAn(request.getParameter("txtTHop_MaGA_"+i));
			giaoan.setDanNhap(request.getParameter("txtTHop_DanNhap_"+i));
			giaoan.setHuongDanKetThuc(request.getParameter("txtTHop_HDKT_"+i));
			giaoan.setHuongDanTuHoc(request.getParameter("txtTHop_HDTH_"+i));
			GiaoAnDAO.updateGiaoAnTHopChuaThucHienXongByMaGA(giaoan);
		}
		
		
			
		
		response.sendRedirect(Constant.PATH_RES.getString("iso.GiaoAnChuaThucHienPath")
					+ "?err=updateTC&maKHGD="+request.getParameter("maKHGD"));
	}
		
	private void updateGiaoAnLyThuyet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		if(GiaoAnDAO.updateGiaoAnLyThuyet(mapGiaoAnLyThuyet(request, response))==false){
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnLyThuyet")
					+ "?err=updateTB&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
			
		}
		else{
			response.sendRedirect(Constant.PATH_RES.getString("iso.ShowGiaoAnLyThuyet")
					+ "?err=updateTC&stt=update&maCTKHGD="+request.getParameter("txtMaCTKHGD"));
		}
	}

	
	//*********************************************************HAM RUT GON***************************************************************
	//**********************************************HAM VIET GON LAI*****************************************************************************************
	private void sendMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String maNguoiTao=request.getParameter("txtMaNguoiTao");
		GiaoAnDAO.updateNgayGuiGiaoAnByMaGiaoAn(request.getParameter("maGiaoAn"));
		
		ArrayList<String> mailTo=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(maNguoiTao);
		
		ArrayList<String> mailCC=new ArrayList<String>();
		mailCC.add(MailDAO.getMailByMaThanhVien(maNguoiTao));
		
		
		// Gui email inform Hieu Truong
		MailUtil.sendEmailToBoPhan(	mailTo,
								mailCC,
									MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_GIAOAN),
										MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_GIAOAN, 
												"Giáo án số "+request.getParameter("txtSoGA")+" thuộc "+ChangeStringTaglib.upperString(KeHoachGiangDayDAO.getTenKHGDByMaKHGD(request.getParameter("maKHGD"))), 
												request.getSession().getAttribute("tenThanhVien").toString(), 
												DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong())));	
	}

	private void approveMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnDAO.updateMaNguoiDuyetGiaoAn(request.getParameter("maGiaoAn"),request.getSession().getAttribute("maThanhVien").toString());
		
		ArrayList<String> mailTo=new ArrayList<String>();
		mailTo.add(MailDAO.getMailByMaThanhVien(request.getParameter("txtMaNguoiTao")));
		ArrayList<String> mailCC=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(request.getParameter("txtMaNguoiTao"));
		
		MailUtil.sendEmailToBoPhan(mailTo,
				mailCC,
					MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_GIAOAN),
						MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_GIAOAN,
								"Giáo án số "+request.getParameter("txtSoGA")+" thuộc "+KeHoachGiangDayDAO.getTenKHGDByMaKHGD(request.getParameter("maKHGD")),
								ThanhVienDAO.getTenThanhVien(request.getParameter("txtMaNguoiTao")),
								request.getParameter("txtCalendar1"),
									ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString()), 
									SysParamsDAO.getSysParams().getGioHeThong()));
	}
	
	private void rejectMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GiaoAnDAO.updateMaNguoiDuyetGiaoAn(request.getParameter("maGiaoAn"),request.getSession().getAttribute("maThanhVien").toString());
		
		String lyDo=KeHoachGiangDayDAO.getLyDoRejectByMaKHGD(request.getParameter("maKHGD"))+request.getParameter("LyDoReject").trim();
		

		GiaoAnDAO.updateLyDoRejectGAByMaKHGD(request.getParameter("maKHGD"),StringUtil.toUTF8(lyDo));
		
		//Loi goi mail do qua nhiu mail goi trong cc, coi lai getMailListByMaVaiTro
		ArrayList<String> mailTo=new ArrayList<String>();
		mailTo.add(MailDAO.getMailByMaThanhVien(request.getParameter("txtMaNguoiTao")));
		ArrayList<String> mailCC=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(request.getParameter("txtMaNguoiTao"));
		MailUtil.sendEmailToBoPhan(mailTo,
				mailCC,
					MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_GIAOAN),
						MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_GIAOAN, 
								"Giáo án số "+request.getParameter("txtSoGA")+" thuộc "+KeHoachGiangDayDAO.getTenKHGDByMaKHGD(request.getParameter("maKHGD")),
								ThanhVienDAO.getTenThanhVien(request.getParameter("txtMaNguoiTao")),
								request.getParameter("txtCalendar1"),
									ThanhVienDAO.getTenThanhVien(request.getSession().getAttribute("maThanhVien").toString()), 
									SysParamsDAO.getSysParams().getGioHeThong()));
	}
	
	
	private void emailNhacNho(ArrayList<ThanhVienNhacNhoModel> thanhVienList,HttpServletRequest request,HttpServletResponse response){
		String mailTo=Constant.MAILTO_THANHVIENNHACNHO;
		String mailCC=MailDAO.getMailByMaThanhVien(request.getSession().getAttribute("maThanhVien").toString());
		String subject=MailDAO.getSubjectNhacNhoByChucNang(Constant.CHUCNANG_GIAOAN);
		String content=MailDAO.getContentEmailNhacNho2ByChucNang(thanhVienList);
		MailUtil.sendEmail(mailTo, mailCC, subject, content);
	}
}
