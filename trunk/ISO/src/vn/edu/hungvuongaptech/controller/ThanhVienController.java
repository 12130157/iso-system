package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.util.XmlUtil;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.ChiTietThanhVienDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.SysRoleAppDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.dao.VaiTroDAO;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.SysRoleAppModel;
import vn.edu.hungvuongaptech.model.SysRoleMenuModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.LogUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;
import vn.edu.hungvuongaptech.xml.ThanhVienNewBean;


/**
 * ThanhVienAction.
 * @author TuanHQ
 *
 */
public class ThanhVienController extends HttpServlet {

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
		
		String actionType = request.getParameter("actionType").toString();
		
		
		if(actionType.equalsIgnoreCase("login")){// trang login goi
			doPostLogin(request, response);
		}else if(actionType.equalsIgnoreCase("getPass")){// trang getPass goi
			doPostGetPass(request, response);	
		} else if(actionType.equalsIgnoreCase("changePass")){//trang changePass goi
			doPostChangePass(request, response);	
		} else if(actionType.equalsIgnoreCase("Admin_TimThanhVienByMaVaiTro")){//tim Thanh vien by MaVaiTro
			doPostTimThanhVien(request, response);
		}else if(actionType.equalsIgnoreCase("Admin_insertTV")){//insert thanh vien moi
			doPostInsertTV(request, response);
		}else if(actionType.equalsIgnoreCase("Admin_updateTV")){//update mot thanh vien
			doPostUpdateTV(request, response);
		}else if(actionType.equalsIgnoreCase("chuyenCa")){
			doPostUpdate2(request,response);
		}
		
	}
	
	private void doPostLogin (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tenDangNhap = request.getParameter("txtTenDangNhap");
		String matKhau = request.getParameter("txtMatKhau");
		
		if(tenDangNhap != "" && matKhau != ""){
			ChiTietThanhVienModel chiTietthanhVienModel = ChiTietThanhVienDAO.timChiTietThanhVien(tenDangNhap);
			
				ThanhVienModel thanhVienModel = ThanhVienDAO.timThanhVien(tenDangNhap, matKhau);
				if(thanhVienModel != null){
					if (thanhVienModel.getTenDangNhap().equals(tenDangNhap)) { // ten dang nhap dung
						if(thanhVienModel.getMatKhau().equals(matKhau)){//Dang nhap thanh cong
							if(chiTietthanhVienModel.getTinhTrang().equals("1")){
								//bao cao da dang nhap thanh cong
								LogUtil.logInfo(loggerInfo, "Thành viên với tên đăng nhập là : " 
															+ thanhVienModel.getTenDangNhap() 
															+ " đã đăng nhập vào hệ thống");
								
								VaiTroModel vaiTroModel = VaiTroDAO.timVaiTro(thanhVienModel.getMaVaiTro());
								ArrayList<SysRoleAppModel> sysRoleAppModelList = new ArrayList<SysRoleAppModel>();
								ArrayList<SysRoleMenuModel> sysRoleMenuModelList = new ArrayList<SysRoleMenuModel>();
								if (vaiTroModel != null) {
									sysRoleAppModelList = SysRoleAppDAO.findSysRoleApp(vaiTroModel.getMaVaiTro());
									//sysRoleMenuModelList = SysRoleMenuDAO.findSysRoleMenu(vaiTroModel.getMaVaiTro());
								}
								ChiTietThanhVienModel chiTietThanhVienModel = ChiTietThanhVienDAO.timChiTietThanhVien(thanhVienModel.getTenDangNhap());
											
								HttpSession session = request.getSession(true);
								
								// Luu tru cac thong tin dang nhap vao SESSION
								if (vaiTroModel != null 
										&& chiTietThanhVienModel != null) {
									session.setAttribute(Constant.USERID_ATT, thanhVienModel.getMaThanhVien());
									session.setAttribute(Constant.USERNAME_ATT, thanhVienModel.getTenDangNhap());
									session.setAttribute(Constant.PASSWORD_ATT, thanhVienModel.getMatKhau());
									session.setAttribute(Constant.EMAIL_ATT, thanhVienModel.getMatKhau());
									session.setAttribute(Constant.FULLNAME_ATT, chiTietThanhVienModel.getHoThanhVien() 
																				+ " " + chiTietThanhVienModel.getTenLot()
																					+ " " + chiTietThanhVienModel.getTenThanhVien());
									session.setAttribute(Constant.ROLE_ATT, vaiTroModel.getMaVaiTro());
									session.setAttribute(Constant.ROLE_NAME_ATT, vaiTroModel.getTenVaiTro());
									session.setAttribute(Constant.ROLE_APP_LIST_ATT, sysRoleAppModelList);
									session.setAttribute(Constant.MA_BO_PHAN_ATT, thanhVienModel.getMaBoPhan());
									session.setAttribute(Constant.TEN_BO_PHAN_ATT, thanhVienModel.getTenBoPhan());
									session.setAttribute(Constant.MA_LOP, chiTietthanhVienModel.getMaLopHoc());
									session.setAttribute(Constant.Ki_Hieu_Lop, chiTietthanhVienModel.getKiHieuLop());
									//session.setAttribute(Constant.ROLE_MENU_LIST_ATT, sysRoleMenuModelList);
								}
								String pageNext = Constant.PATH_RES.getString("iso.homePath");
								response.sendRedirect(pageNext);
							}else{//sai mat khau
								response.sendRedirect(Constant.PATH_RES
										.getString("iso.loginPath")
										+ "?err=" + "err");
						}
						
					} else { // sai ten dang nhap
						response.sendRedirect(Constant.PATH_RES
								.getString("iso.loginPath")
								+ "?err=" + "err");
					}
				}else{//Dang nhap that bai
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.loginPath")
							+ "?err=" + "err");
				}
			}else{//Dang nhap that bai
				response.sendRedirect(Constant.PATH_RES
						.getString("iso.loginPath")
						+ "?err=" + "khongHoatDong");
			}
		}else{
			response.sendRedirect(Constant.PATH_RES
					.getString("iso.loginPath")
					+ "?err=" + "err");
		}
	}
	private void doPostGetPass (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenDangNhap = request.getParameter("txtTenDangNhap");
		String email = request.getParameter("txtEmail"); 
		
		String a = tenDangNhap;
		String[] b = null;
		String tenDN = "";
		b = a.split(" ");
		for(int i =0; i < b.length; i++){
			b[i].replace(" ", "");
			if(!b[i].equals("")){
				tenDN+= b[i];
			}
		}
		
		String a1 = email;
		String[] b1 = null;
		String mail = "";
		b1 = a1.split(" ");
		for(int i =0; i < b1.length; i++){
			b1[i].replace(" ", "");
			if(!b1[i].equals("")){
				mail+= b1[i];
			}
		}
		
		ThanhVienModel thanhVienModel = ThanhVienDAO.timThanhVienGP(tenDN);
		if(thanhVienModel == null){
			response.sendRedirect(Constant.PATH_RES
					.getString("iso.getpassPath")
					+ "?err=NtxtTenDangNhap");
		}else{
			ThanhVienModel matKhauThanhVienModel = ThanhVienDAO.timMatKhauGP(tenDN);
			String pageNext = Constant.PATH_RES.getString("iso.getPassShortPath");
			RequestDispatcher rd = request.getRequestDispatcher(pageNext);
			//String user = thanhVienModel.getTenDangNhap();
			if(thanhVienModel.getTenDangNhap().equals(tenDN)){
				if(thanhVienModel.getEmail().equals(mail)){
						//gui mail 
						//ThanhVienModel matKhauModel = ThanhVienDAO.timMatKhauGP(tenDN);
					
					//bao cao lay lai mat khau thanh cong
					LogUtil.logInfo(loggerInfo,"Thành viên với tên đăng nhập là : " 
												+ thanhVienModel.getTenDangNhap() 
												+ " đã đăng ký lấy lại mật khẩu thành công");
					
					String tenThanhVien = thanhVienModel.getHoThanhVien()
					+ " " + thanhVienModel.getTenLot() 
					+ " " + thanhVienModel.getTenThanhVien();
						MailUtil.sendEmail(thanhVienModel.getEmail(), "tuanhq.hv@gmail.com", "[ISO] - Thong Bao - HungVuongSystem - Lay lai mat khau" , MailDAO.getContentGetPass(tenThanhVien, tenDN, matKhauThanhVienModel.getMatKhau()));
						response.sendRedirect(Constant.PATH_RES
								.getString("iso.getpassPath")
								+ "?msg=c");
				}else{
						pageNext += "?err=NtxtEmail";
						rd = request.getRequestDispatcher(pageNext);
						request.setAttribute(Constant.USERNAME_ATT, tenDN);
						rd.forward(request, response);
				}
			}else {
				response.sendRedirect(Constant.PATH_RES
						.getString("iso.getpassPath")
						+ "?err=NtxtTenDangNhap");
			}
		}
	}
	private void doPostChangePass (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenDangNhap = request.getSession().getAttribute("tenDangNhap").toString();
		String matKhauCu = request.getParameter("txtMatKhauCu");
		String NhapLaiMatKhauMoi = request.getParameter("txtNhapLaiMatKhauMoi");
		String matKhau = request.getSession().getAttribute("matKhau").toString();
		// kiem tra mat khau cu co dung khong 
		if(matKhauCu.equals(matKhau)){
		//update mat khau moi
		ThanhVienModel thanhVienModel = new ThanhVienModel();
						thanhVienModel.setTenDangNhap(tenDangNhap);
						thanhVienModel.setMatKhau(NhapLaiMatKhauMoi);
						if (ThanhVienDAO.updateMatKhauTV(thanhVienModel)) {
							
							//bao cao thay doi mat khau thanh cong
							LogUtil.logInfo(loggerInfo, "Thành viên với tên đăng nhập là : " 
														+ thanhVienModel.getTenDangNhap() 
														+ " đã đăng đăng ký đổi mật khẩu thành công");
							response.sendRedirect(Constant.PATH_RES
									.getString("iso.loginPath")
									+ "?msg=thanhcong");
						}else{
							response.sendRedirect(Constant.PATH_RES
									.getString("iso.changePasswordPath")
									+ "?msg=c");
						}
		}else{
			response.sendRedirect(Constant.PATH_RES
					.getString("iso.changePasswordPath")
					+ "?err=a");
		}
	}
	private void doPostTimThanhVien (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maBoPhan = request.getParameter("cboBoPhan").toString();
		String ten = StringUtil.toUTF8(request.getParameter("txtTim").toString());
		request.setAttribute("ten", ten);
		ArrayList<ThanhVienModel> listThanhVien = ThanhVienDAO.getThanhVienByMaBoPhan( maBoPhan, ten);
		request.setAttribute("listThanhVien", listThanhVien);
		String pageNext = Constant.PATH_RES.getString("Admin.XemThanhVienShortPath") 
							+ "?maKhoa=" + maBoPhan;
		if (maBoPhan.equals("-1") && ten.equals("")) {
			pageNext += "&page=1";
		}		
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);						
		rd.forward(request, response);
		//response.sendRedirect(pageNext);
	}
	private void doPostInsertTV (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenDangNhap = request.getParameter("txtTenDangNhap").trim();
		String soTaiKhoan = request.getParameter("txtSoTaiKhoan").trim();
		String matKhau = request.getParameter("txtMatKhau").trim();
		String nganHang = StringUtil.toUTF8(request.getParameter("txtNganhang")).trim();
		String maVaiTro = request.getParameter("cboVaiTro").trim();
		String maKhoa = request.getParameter("cboKhoa").trim();
		String ngayLapThe = request.getParameter("txtNgayLapThe").trim();
		String ho = StringUtil.toUTF8(request.getParameter("txtHo"));
		String soNha = StringUtil.toUTF8(request.getParameter("txtSoNha")).trim();
		String tenLot = StringUtil.toUTF8(request.getParameter("txtTenLot"));
		String duong = StringUtil.toUTF8(request.getParameter("txtDuong")).trim();
		String ten = StringUtil.toUTF8(request.getParameter("txtTen"));
		String phuong = StringUtil.toUTF8(request.getParameter("txtPhuong")).trim();
		String ngaySinh = request.getParameter("txtNgaySinh").trim();
		String quan = StringUtil.toUTF8(request.getParameter("txtQuan")).trim();
		String email = request.getParameter("txtEmail").trim();
		String thanhPho = StringUtil.toUTF8(request.getParameter("txtThanhPho")).trim();
		String tinhTrang = "1";
		String dienThoaiNha = StringUtil.toUTF8(request.getParameter("txtDienThoaiNha")).trim();
		String dienThoaiDD = request.getParameter("txtDienThoaiDD").trim();
		String loaiBang = StringUtil.toUTF8(request.getParameter("txtLoaiBang")).trim();
		String truongCap = StringUtil.toUTF8(request.getParameter("txtTruongCap")).trim();
		String loaiTotNghiep = StringUtil.toUTF8(request.getParameter("txtLoaiTotNghiep")).trim();
		String CMNN = request.getParameter("txtCMNN").trim();
		String maLop = null;
		
		ThanhVienModel thanhVienModel = ThanhVienDAO.timThanhVienGP(tenDangNhap);

		ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
		
		chiTietThanhVienModel.setTenDangNhap(tenDangNhap);
		chiTietThanhVienModel.setChungMinhNhanDan(CMNN);
		chiTietThanhVienModel.setDienThoaiDiDong(dienThoaiDD);
		chiTietThanhVienModel.setDienThoaiNha(dienThoaiNha);
		chiTietThanhVienModel.setDuong(duong);
		chiTietThanhVienModel.setPhuongXa(phuong);
		chiTietThanhVienModel.setQuanHuyen(quan);
		chiTietThanhVienModel.setThanhPho(thanhPho);
		chiTietThanhVienModel.setEmail(email);
		chiTietThanhVienModel.setHoThanhVien(ho);
		chiTietThanhVienModel.setTenLot(tenLot);
		chiTietThanhVienModel.setTenThanhVien(ten);
		chiTietThanhVienModel.setNgaySinh(ngaySinh);
		chiTietThanhVienModel.setLoaiBang(loaiBang);
		chiTietThanhVienModel.setLoaiTotNghiep(loaiTotNghiep);
		chiTietThanhVienModel.setMatKhau(matKhau);
		chiTietThanhVienModel.setSoTaiKhoan(soTaiKhoan);
		chiTietThanhVienModel.setNganHang(nganHang);
		chiTietThanhVienModel.setMaVaiTro(maVaiTro);
		chiTietThanhVienModel.setMaKhoa(maKhoa);
		chiTietThanhVienModel.setNgayLapThe(ngayLapThe);
		chiTietThanhVienModel.setSoNha(soNha);
		chiTietThanhVienModel.setTinhTrang(tinhTrang);
		chiTietThanhVienModel.setTruongCap(truongCap);
		chiTietThanhVienModel.setMaLopHoc(maLop);
		
		ArrayList<ThanhVienNewBean> listObject = new ArrayList<ThanhVienNewBean>();
		
		ThanhVienNewBean thanhVienNewBean = new ThanhVienNewBean
		(
				"",
				"manual",
				"1",
				"0",
				"0",
				"1",
				tenDangNhap,
				matKhau,
				CMNN,
				tenLot + ' ' + ten,
				ho,
				email,
				"0",
				"","","","","",
				dienThoaiDD,
				dienThoaiNha,
				"","",
				soNha + ' ' + duong + ' ' + phuong + ' ' + quan,
				thanhPho,
				"VN",
				"en_utf8",
				"","99","0","0","0","0","","","0","","Null","1","0","2","1","1","1","0","0","0","Null","0"
		);
		listObject.add(thanhVienNewBean);
		
		if(thanhVienModel != null){//ten thanh vien ton tai
			response.sendRedirect(Constant.PATH_RES
					.getString("Admin.themMoiThanhVienPath")
					+ "?err=" + "err");
		}else{// insert thanh vien moi
			
			if(ThanhVienDAO.insertChiTietThanhVien(chiTietThanhVienModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemThanhVienPath")
						+ "?msg=" + "msg");
				XmlUtil.exportThemMoiThanhVienXmlFile(listObject, "HungVuongISOOutput", "mdl_user");
			}
		}
	}
	private void doPostUpdateTV (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maThanhVien = request.getParameter("id");
		String tenDangNhap = request.getParameter("txtTenDangNhap").trim();
		String soTaiKhoan = request.getParameter("txtSoTaiKhoan");
		String matKhau = request.getParameter("txtMatKhau");
		String nganHang = StringUtil.toUTF8(request.getParameter("txtNganHang"));
		String maVaiTro = request.getParameter("cboVaiTro");
		String maKhoa = request.getParameter("cboKhoa");
		String ngayLapThe = request.getParameter("txtNgayLapThe");
		String ho = StringUtil.toUTF8(request.getParameter("txtHo"));
		String soNha = StringUtil.toUTF8(request.getParameter("txtSoNha"));
		String tenLot = StringUtil.toUTF8(request.getParameter("txtTenLot"));
		String duong = StringUtil.toUTF8(request.getParameter("txtDuong"));
		String ten = StringUtil.toUTF8(request.getParameter("txtTen"));
		String phuong = StringUtil.toUTF8(request.getParameter("txtPhuong"));
		String ngaySinh = request.getParameter("txtNgaySinh");
		String quan = StringUtil.toUTF8(request.getParameter("txtQuan"));
		String email = request.getParameter("txtEmail");
		String thanhPho = StringUtil.toUTF8(request.getParameter("txtThanhPho"));
		String tinhTrang = request.getParameter("radio");
		String dienThoaiNha = request.getParameter("txtDienThoaiNha");
		String dienThoaiDD = request.getParameter("txtDienThoaiDD");
		String loaiBang = StringUtil.toUTF8(request.getParameter("txtLoaiBang"));
		String truongCap = StringUtil.toUTF8(request.getParameter("txtTruongCap"));
		String loaiTotNghiep = StringUtil.toUTF8(request.getParameter("txtLoaiTotNghiep"));
		String CMNN = request.getParameter("txtCMNN").trim();
			
			ChiTietThanhVienModel chiTietThanhVienModel = new ChiTietThanhVienModel();
			
			chiTietThanhVienModel.setMaThanhVien(maThanhVien);
			chiTietThanhVienModel.setTenDangNhap(tenDangNhap);
			chiTietThanhVienModel.setChungMinhNhanDan(CMNN);
			chiTietThanhVienModel.setDienThoaiDiDong(dienThoaiDD);
			chiTietThanhVienModel.setDienThoaiNha(dienThoaiNha);
			chiTietThanhVienModel.setDuong(duong);
			chiTietThanhVienModel.setPhuongXa(phuong);
			chiTietThanhVienModel.setQuanHuyen(quan);
			chiTietThanhVienModel.setThanhPho(thanhPho);
			chiTietThanhVienModel.setEmail(email);
			chiTietThanhVienModel.setHoThanhVien(ho);
			chiTietThanhVienModel.setTenLot(tenLot);
			chiTietThanhVienModel.setTenThanhVien(ten);
			chiTietThanhVienModel.setNgaySinh(ngaySinh);
			chiTietThanhVienModel.setLoaiBang(loaiBang);
			chiTietThanhVienModel.setLoaiTotNghiep(loaiTotNghiep);
			chiTietThanhVienModel.setMatKhau(matKhau);
			chiTietThanhVienModel.setSoTaiKhoan(soTaiKhoan);
			chiTietThanhVienModel.setNganHang(nganHang);
			chiTietThanhVienModel.setMaVaiTro(maVaiTro);
			chiTietThanhVienModel.setMaKhoa(maKhoa);
			chiTietThanhVienModel.setNgayLapThe(ngayLapThe);
			chiTietThanhVienModel.setSoNha(soNha);
			chiTietThanhVienModel.setTinhTrang(tinhTrang);
			chiTietThanhVienModel.setTruongCap(truongCap);
			
			ArrayList<ThanhVienNewBean> listObject = new ArrayList<ThanhVienNewBean>();
			
			ThanhVienNewBean thanhVienNewBean = new ThanhVienNewBean
			(
					maThanhVien,
					"manual",
					"1",
					"0",
					"0",
					"1",
					tenDangNhap,
					matKhau,
					CMNN,
					tenLot + ' ' + ten,
					ho,
					email,
					"0",
					"","","","","",
					dienThoaiDD,
					dienThoaiNha,
					"","",
					soNha + ' ' + duong + ' ' + phuong + ' ' + quan,
					thanhPho,
					"VN",
					"en_utf8",
					"","99","0","0","0","0","","","0","","Null","1","0","2","1","1","1","0","0","0","Null","0"
			);
			listObject.add(thanhVienNewBean);

			
			if(ThanhVienDAO.updateChiTietThanhVien(chiTietThanhVienModel)){
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemThanhVienPath")
						+ "?msg=" + "msg_1");
				XmlUtil.exportUpdateThanhVienXmlFile(listObject, "HungVuongISOOutput", "mdl_user");
			}else{
				response.sendRedirect(Constant.PATH_RES
						.getString("Admin.XemThanhVienPath")
						+ "?err=" + "err1");
			}
			

	}

	private void doPostUpdate2 (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maLop = request.getParameter("cboLopHoc");
		String pageNext = "";
		if(request.getParameter("txtPhanLoai").equals("1"))
			pageNext = Constant.PATH_RES.getString("iso.PhanCaShortPathAdmin") + "?status=2&maLop=" + maLop;
		else
			pageNext = Constant.PATH_RES.getString("iso.PhanCaShortPath") + "?status=2&maLop=" + maLop;
		ArrayList<ThanhVienModel> thanhVienList = new ArrayList<ThanhVienModel>();
		ArrayList<ThanhVienModel> thanhVienList1 = new ArrayList<ThanhVienModel>();
		if(request.getSession().getAttribute("listSinhVien") != null)
			thanhVienList = (ArrayList<ThanhVienModel>) request.getSession().getAttribute("listSinhVien");
		for (ThanhVienModel obj : thanhVienList) {
			obj.setUser2(request.getParameter("txtMaSinhVien" + obj.getMaThanhVien() + "MaSinhVien"));
			ThanhVienDAO.phanCa(obj);
			thanhVienList1.add(obj);
		}
		request.setAttribute(Constant.THANH_VIEN_MODEL_LIST, thanhVienList1);
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		rd.forward(request, response);
	}

}