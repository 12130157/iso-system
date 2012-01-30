package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.log4j.Logger;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.NhaCungCapDAO;

import vn.edu.hungvuongaptech.dao.PhongBanDAO;
import vn.edu.hungvuongaptech.dao.SysRoleAppDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.dao.ThayDoiThietBiDAO;
import vn.edu.hungvuongaptech.dao.ThietBiDAO;
import vn.edu.hungvuongaptech.dao.ThongKeDAO;
import vn.edu.hungvuongaptech.dao.KhoaDAO;
import vn.edu.hungvuongaptech.dao.PhieuMuonThietBiDAO;
import vn.edu.hungvuongaptech.dao.DiChuyenThietBiDAO;
import vn.edu.hungvuongaptech.dao.ChiTietThietBiDAO;
import vn.edu.hungvuongaptech.model.ChiTietPhieuMuonModel;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.ChiTietThietBiModel;
import vn.edu.hungvuongaptech.model.LoaiThietBiModel;
import vn.edu.hungvuongaptech.model.MonHocModel;
import vn.edu.hungvuongaptech.model.NhaCungCapModel;
import vn.edu.hungvuongaptech.model.PhieuMuonThietBiModel;
import vn.edu.hungvuongaptech.model.SysRoleAppModel;
import vn.edu.hungvuongaptech.model.TaiKhoanModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.model.KhoaModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ThietBiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	/*
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, 
	 * javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/* 
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, 
	 * javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionType=request.getParameter("actionType");	
		//nguoi viet: Quoc Chuong (MuonThietBi)
		//muc dich:lay danh sach thiet bi khi nguoi chon check vao thietbi sau do load sang PhieuMuonThietBi.jsp in QuanLyThietBi/ThietBi/
		if(actionType.equalsIgnoreCase("DanhSachMuonThietBi"))
		{
			if(request.getParameterValues("ckbox") != null)
			{
				System.out.println("\nCac thiet bi duoc chon nhu sau:");
				String[] str = request.getParameterValues("ckbox");
				
				//in test lấy danh sách các thiết bị dc check từ trang DanhSachThietBi.jsp
				for(int i = 0; i < str.length; i++)
					System.out.println(str[i].toString());
				
				//request.setAttribute("abc",str);
				request.setAttribute("arrThietBiDuocChon", str);
				RequestDispatcher r = request.getRequestDispatcher("QuanLyThietBi/ThietBi/PhieuMuonThietBi.jsp");
				r.forward(request, response);
			}
			else if(request.getParameterValues("ckbox") == null)
			{
				request.setAttribute("error", "1");
				RequestDispatcher r = request.getRequestDispatcher("QuanLyThietBi/ThietBi/DanhSachThietBi.jsp");
				r.forward(request, response);
			}
			
			
		}
		//nguoi viet : Quoc Chuong
		//muc dich: thuc hien viec muon thiet bi insert thang vao db
		else if(actionType.equalsIgnoreCase("MuonThietBi"))
		{
			//System.out.println("ok muon thiet bi");
			String arrIdThietBi = request.getParameter("txtArrIdThietBi").trim();
			String soPhieu = request.getParameter("txtSoPhieu");
			//nguoi muon o day la ten dang nhap
			String nguoiMuon = request.getParameter("txtNguoiMuon");
			//lop la ma lop
			String lop = request.getParameter("txtLop");
			
			//parse ngày mượn từ kiểu String sang Date. Sau đó, format thành chuẩn MM-dd-yyyy HH:mm:ss
			String ngayMuon = request.getParameter("txtNgayMuon");
			SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");
			Date d1;
			String thoiGianNgayMuon = "";
			try {
				d1 = formatter1.parse(ngayMuon);
				SimpleDateFormat pattern1 = new SimpleDateFormat("MM-dd-yyyy");
				thoiGianNgayMuon = pattern1.format(d1); 
				//System.out.println("Thoi gian ngay muon theo chuan (MM-dd-yyyy): "+thoiGianNgayMuon);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}			
			
			//parse ngày trả từ kiểu String sang Date. Sau đó, format thành chuẩn MM-dd-yyyy HH:mm:ss
			String ngayTra = request.getParameter("txtNgayTra");
			//thoi gian tra
			String gio = request.getParameter("txtGio");
			String phut = request.getParameter("txtPhut");
			String giay = "00";
			String thoiGianNgayTra = ngayTra+" "+gio+":"+phut+":"+giay;
			/*System.out.println("arrIdThietBi: " +arrIdThietBi+
								"\nSo phieu: "+soPhieu+
								"\nNguoi muon: "+nguoiMuon+
								"\nLop: "+lop+
								"\nNgay muon: "+ngayMuon+
								"\nNgay tra: "+ngayTra+" "+gio+":"+phut+":"+giay);
		    */
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			try {
				Date d = formatter.parse(thoiGianNgayTra);
				//System.out.println(d);
				SimpleDateFormat pattern = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
				//System.out.println("Thoi gian ngay tra theo chuan (MM-dd-yyyy HH:mm:ss): "+pattern.format(d));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//lấy về mã phòng ban
			String phongBan = request.getParameter("txtPhongBan");
			System.out.println("Danh sach duoc chon theo chuoi: "+arrIdThietBi);
			String[] arrThietBiDcChon = arrIdThietBi.split(",");
			for(int i = 0; i < arrThietBiDcChon.length; i++)
			{
				System.out.println("Thiet bi "+(i+1)+": "+arrThietBiDcChon[i]);
				
			}
			
			//lay id cua thanhvien truoc de insert vao bang sogiaonhanthietbi voi nguoi lap la id thanh vien
			ResultSet rs = DataUtil.executeQuery("select top 1 id from thanhvien where ten_dn = '"+nguoiMuon+"'");
			int idThanhVien = 0;
			try {
				while(rs.next())
				{
					idThanhVien = rs.getInt("id");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//insert tam thoi du lieu mẫu vao bảng soGiaoNhanThietBi
			ThietBiDAO.insertSoGiaoNhanThietBi(phongBan,1,2001,"ghi chu 1",idThanhVien, thoiGianNgayMuon,
											2,"02-15-2012",0,"02-18-2012","","","","","");//nguoi muon la ten dang nhap
			
			//lấy masogiaonhanthietbi sau khi insert sogiaonhanthietbi
			int maSoGiaoNhanThietBi = 0;
			ResultSet rs2 = DataUtil.executeQuery("select top 1 id from sogiaonhanthietbi order by id desc");
			try {
				while(rs2.next())
				{
					maSoGiaoNhanThietBi = rs2.getInt("id");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//insert tam thoi du lieu mau vao bang chitietphieugiaonhanthietbi
			ThietBiDAO.insertChiTietPhieuGiaoNhanThietBi(maSoGiaoNhanThietBi, "tên sổ giao nhận 1", idThanhVien, Integer.parseInt(lop), "02-18-2012 10:45:20", 0, 0, 0, 0, "Ghi chú nhe", 0, "02-20-2012 11:30:00", "", "", "", "", "");
			
			//lấy id ma chitietphieugiaonhanthietbi sau khi insert chitietphieugiaonhanthietbi
			int maChiTietPhieuGiaoNhanThietBi = 0;
			ResultSet rs3 = DataUtil.executeQuery("select top 1 id from chitietphieugiaonhanthietbi order by id desc");
			try {
				while(rs3.next())
				{
					maChiTietPhieuGiaoNhanThietBi = rs3.getInt("id");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//insert tam thoi du lieu mau vao bang chitietmuonthietbi
			for(int i = 0; i < arrThietBiDcChon.length; i++)
				ThietBiDAO.insertChiTietMuonThietBi(maChiTietPhieuGiaoNhanThietBi, Integer.parseInt(arrThietBiDcChon[i]), "02-21-2012 11:30:00" , "02-21-2012 11:30:00", 0 , "02-21-2012 11:30:00", "", "", "", "", "");
				
			request.setAttribute("FlagMuonThietBi", "1");//1 là thành công,0 thất bại or null
			RequestDispatcher r = request.getRequestDispatcher("QuanLyThietBi/ThietBi/DanhSachThietBi.jsp");
			r.forward(request, response);	
				
		}
		else if(actionType.equalsIgnoreCase("ThemThietBi") || actionType.equalsIgnoreCase("CapNhatThietBi")){
			themThietBi(request, response);
		}
		else if(actionType.equalsIgnoreCase("BaoHuThietBi")) {
			baoHuThietBi(request, response);
		}
		else if(actionType.equalsIgnoreCase("XoaThietBi")) {
			xoaThietBi(request, response);
		}
		else if(actionType.equalsIgnoreCase("searchThietBi"))
		{
			searchThietBi(request,response);
		}
		else if(actionType.equalsIgnoreCase("searchNhaCungCap"))
		{
			//timNhaCungCap(request,response);
		}
		else if(actionType.equalsIgnoreCase("ThemLinhKien") || actionType.equalsIgnoreCase("UpdateLinhKien")) {
			themLinhKien(request,response);
		}
		else if(actionType.equalsIgnoreCase("XoaLinhKien")) {
			xoaLinhKien(request, response);
		}
		else if(actionType.equalsIgnoreCase("searchLinhKien"))
		{
			searchLinhKien(request,response);
		}
	}
	
	private void xoaLinhKien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.XemLinhKienShortPath");
		String[] listLinhKienCanXoa = request.getParameter("txtListLinhKien").split("-");
		for(int i=1;i<listLinhKienCanXoa.length;i++) {
			if(!ChiTietThietBiDAO.deleteChiTietThietBiByID(listLinhKienCanXoa[i]))
				check = false;
		}
		if(check)
			pageNext += "?XoaLinhKien=ok";
		else
			pageNext += "?XoaLinhKien=fail";
		response.sendRedirect(pageNext);
	}
	private void themThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageNext = Constant.PATH_RES.getString("qltb.XemThietBiShortPath");
		
		String actionType = request.getParameter("actionType");
		ThietBiModel thietBiModel;
		thietBiModel=new ThietBiModel();
			
		if(request.getSession().getAttribute("ThietBi") != null)
			thietBiModel = (ThietBiModel) request.getSession().getAttribute("ThietBi");
		//thietBiModel.setMaThietBi(request.getParameter("MaThietBi"));
		mapParameterToThietBiModel(request, response, thietBiModel);
				
		if(actionType.equals("ThemThietBi")){
			if(ThietBiDAO.insertThietBi(thietBiModel))
				pageNext += "?ThemThietBi=ok";
			else
				pageNext += "?ThemThietBi=fail";
		}
		else{
			if(ThietBiDAO.updateThietBi(thietBiModel))
				pageNext += "?UpdateThietBi=ok";
			else
				pageNext += "?UpdateThietBi=fail";
		}		
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		request.setAttribute(Constant.THIET_BI, thietBiModel);
		rd.forward(request, response);
	}
	protected void themLinhKien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageNext = Constant.PATH_RES.getString("qltb.XemChiTietThietBiShortPath");
		
		String actionType = request.getParameter("actionType");
		ChiTietThietBiModel linhKien = new ChiTietThietBiModel();
			
		if(request.getSession().getAttribute("ChiTietThietBi") != null)
			linhKien = (ChiTietThietBiModel) request.getSession().getAttribute("ChiTietThietBi");
		//thietBiModel.setMaThietBi(request.getParameter("MaThietBi"));
		mapParameterToLinhKienModel(request, response, linhKien);
				
		if(actionType.equals("ThemLinhKien")){
			if(ChiTietThietBiDAO.insertChiTietThietBi(linhKien))
				pageNext += "?ThemLinhKien=ok";
			else
				pageNext += "?ThemLinhKien=fail";
		}
		else{
			if(ChiTietThietBiDAO.updateChiTietThietBi(linhKien))
				pageNext += "?UpdateLinhKien=ok";
			else
				pageNext += "?UpdateLinhKien=fail";
		}		
		
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		request.setAttribute(Constant.CHI_TIET_THIET_BI, linhKien);
		rd.forward(request, response);
	}
	private void mapParameterToLinhKienModel(HttpServletRequest request, HttpServletResponse response, 
			ChiTietThietBiModel chiTietThietBiModel) {
	if(chiTietThietBiModel.getMaNguoiTao() == null)
		chiTietThietBiModel.setMaNguoiTao((String)request.getSession().getAttribute("maThanhVien"));
	chiTietThietBiModel.setTenChiTietThietBi(StringUtil.toUTF8(request.getParameter("txtTenLinhKien")).trim());
	chiTietThietBiModel.setMaLoaiChiTietThietBi(request.getParameter("cboLoaiThietBiLinhKien"));
	chiTietThietBiModel.setMaBoPhan(request.getParameter("cboKhoa"));
	chiTietThietBiModel.setMaNhaCungCap(request.getParameter("cboNhaCungCap"));
	chiTietThietBiModel.setMaPhongBan(request.getParameter("cboPhongBan"));
	chiTietThietBiModel.setTanSuatToiDa(request.getParameter("txtTanSuatToiDa").trim());
	chiTietThietBiModel.setNgaySanXuat(request.getParameter("txtCalendar1").trim());
	chiTietThietBiModel.setNgayMua(request.getParameter("txtCalendar2"));
	chiTietThietBiModel.setGiaMua(request.getParameter("txtGiaMua").trim());
	chiTietThietBiModel.setHanBaoHanh(request.getParameter("txtCalendar3").trim());
	chiTietThietBiModel.setNgayBatDauSuDung(request.getParameter("txtCalendar4"));
	chiTietThietBiModel.setNguyenTacSuDung(StringUtil.toUTF8(request.getParameter("txtNguyenTacSD")).trim());
	chiTietThietBiModel.setDacTinhKyThuat(StringUtil.toUTF8(request.getParameter("txtDacTinhKT")).trim());
	chiTietThietBiModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu")).trim());
	chiTietThietBiModel.setKiHieu(StringUtil.toUTF8(request.getParameter("txtKiHieu")).trim());
	chiTietThietBiModel.setMaTanSuat(request.getParameter("cboTanSuat"));
}	
	private void baoHuThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBiPath");
		String[] listThietBiBaoHu = request.getParameter("txtListThietBi").split("</>");
		for(int i=1;i<listThietBiBaoHu.length;i++) {
			String[] listLinhKienKhongHu = listThietBiBaoHu[i].split("<->");
			for(int j=1;j<listLinhKienKhongHu.length;j++) {
				if(!ChiTietThietBiDAO.thayDoiChiTietThietBiByID(listLinhKienKhongHu[i]))
					check = false;
			}
			if(!ThietBiDAO.baoHuThietBi(listThietBiBaoHu[i]))
				check = false;
		}
		if(check)
			pageNext += "?BaoHuThietBi=ok";
		else
			pageNext += "?BaoHuThietBi=fail";
		response.sendRedirect(pageNext);
	}
	private void xoaThietBi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		boolean check = true;
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBi");
		String[] listThietBiCanXoa = request.getParameter("txtListThietBi").split("-");
		for(int i=1;i<listThietBiCanXoa.length;i++) {
			if(!ThietBiDAO.xoaThietBi(listThietBiCanXoa[i]))
				check = false;
		}
		if(check)
			pageNext += "?XoaThietBi=ok";
		else
			pageNext += "?XoaThietBi=fail";
		response.sendRedirect(pageNext);
	}
	private void mapParameterToThietBiModel(HttpServletRequest request, HttpServletResponse response, 
				ThietBiModel thietBiModel) {
		if(thietBiModel.getMaNguoiTao() == null)
			thietBiModel.setMaNguoiTao((String)request.getSession().getAttribute("maThanhVien"));
		thietBiModel.setTenThietBi(StringUtil.toUTF8(request.getParameter("txtTenThietBi")).trim());
		thietBiModel.setMaLoaiThietBi(request.getParameter("cboLoaiThietBiLinhKien"));
		thietBiModel.setMaBoPhan(request.getParameter("cboKhoa"));
		thietBiModel.setMaNhaCungCap(request.getParameter("cboNhaCungCap"));
		thietBiModel.setMaPhongBan(request.getParameter("cboPhongBan"));
		thietBiModel.setTanSuatToiDa(request.getParameter("txtTanSuatToiDa").trim());
		thietBiModel.setNgaySanXuat(request.getParameter("txtCalendar1").trim());
		thietBiModel.setNgayMua(request.getParameter("txtCalendar2"));
		thietBiModel.setGiaMua(request.getParameter("txtGiaMua").trim());
		thietBiModel.setHanBaoHanh(request.getParameter("txtCalendar3").trim());
		thietBiModel.setNgayBatDauSuDung(request.getParameter("txtCalendar4"));
		thietBiModel.setNguyenTacSuDung(StringUtil.toUTF8(request.getParameter("txtNguyenTacSD")).trim());
		thietBiModel.setDacTinhKyThuat(StringUtil.toUTF8(request.getParameter("txtDacTinhKT")).trim());
		thietBiModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu")).trim());
		thietBiModel.setMaNguoiTao(request.getSession().getAttribute("maThanhVien").toString());
		thietBiModel.setKiHieu(StringUtil.toUTF8(request.getParameter("txtKiHieu")).trim());
		thietBiModel.setMaTanSuat(request.getParameter("cboTanSuat"));
//		if(request.getParameter("cboSoLuong") != null)
//			thietBiModel.setSoLuong(request.getParameter("cboSoLuong"));
		/*ChiTietThietBiModel chiTietThietBiModel;
		ArrayList<ChiTietThietBiModel> chiTietList=new ArrayList<ChiTietThietBiModel>();
		
		int index=1;
		int lengthChiTiet=Integer.parseInt(request.getParameter("txtIndexRow"));
		for(int i=1;i<=lengthChiTiet;i++){
			chiTietThietBiModel=new ChiTietThietBiModel();
			if(thietBiModel.getChiTietThietBiList() != null && i<=thietBiModel.getChiTietThietBiList().size())
				chiTietThietBiModel = thietBiModel.getChiTietThietBiList().get(i-1);
			chiTietThietBiModel.setMaNhaCungCap(request.getParameter("selMaNhaCungCap"+index));
			chiTietThietBiModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu"+index)).trim());
			chiTietList.add(chiTietThietBiModel);
		}
		for(int i=lengthChiTiet;i<thietBiModel.getChiTietThietBiList().size();i++) {
			chiTietThietBiModel = thietBiModel.getChiTietThietBiList().get(i);
			if(chiTietThietBiModel.getMaCTTB() != null)
				ChiTietThietBiDAO.deleteChiTietThietBiByID(chiTietThietBiModel.getMaCTTB());
		}
		thietBiModel.setListChiTietThietBi(chiTietList);*/
	}	
	private void searchThietBi (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maPhongBan = request.getParameter("cboPhong").toString();
		String maLoaiThietBi = request.getParameter("cboLoaiThietBi");
		String maTinhTrang = request.getParameter("cboTinhTrang");
		String tenThietBi = StringUtil.toUTF8(request.getParameter("txtTenThietBi")).trim();
		request.setAttribute("tenThietBi", tenThietBi);
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachThietBiShortPath") + "?phongBan=" + maPhongBan
			+ "&loaiThietBi=" + maLoaiThietBi + "&tinhTrang=" + maTinhTrang;
			
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		rd.forward(request, response);
	}
	private void searchLinhKien (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maPhongBan = request.getParameter("cboPhong").toString();
		String maLoaiLinhKien = request.getParameter("cboLoaiLinhKien");
		String maTinhTrang = request.getParameter("cboTinhTrang");
		
		String pageNext = Constant.PATH_RES.getString("qltb.DanhSachLinhKien") + "?phongBan=" + maPhongBan
			+ "&loaiLinhKien=" + maLoaiLinhKien + "&tinhTrang=" + maTinhTrang;
			
		response.sendRedirect(pageNext);
	}
	//thong ke
	/*protected void timNhaCungCap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maNhaCungCap = request.getParameter("cboNhaCungCap");
			
			ArrayList<ThietBiModel> listThietBi = ThongKeDAO.getAllThongKeByMaNhaCungCap(maNhaCungCap);
			request.setAttribute("listThietBi", listThietBi);
			String pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath") + "?maNhaCungCap=" + maNhaCungCap ;
			
			if(maNhaCungCap.equals("-1"))
			{
				listThietBi = ThongKeDAO.showAllTanSuatThietBi();
				request.setAttribute("listThietBi", listThietBi);
				pageNext = Constant.PATH_RES.getString("qltb.TimThongKePath");
			}
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
			rd.forward(request, response);
	}*/
}
