package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.KeHoachGiangDayDAO;
import vn.edu.hungvuongaptech.dao.MailDAO;
import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.ChiTietKHGDModel;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.KeHoachGiangDayModel;
import vn.edu.hungvuongaptech.taglib.ChangeStringTaglib;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.MailUtil;
import vn.edu.hungvuongaptech.util.StringUtil;
import vn.edu.hungvuongaptech.util.XmlUtil;
import vn.edu.hungvuongaptech.xml.KhoaHocNewBean;

public class KeHoachGiangDayController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public KeHoachGiangDayController() {
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		if(request.getParameter("phanloai") != null)
		{
			phanLoaiKHGD(request, response);
		}
		else if(request.getParameter("them") != null){
			themKHGD(request, response);
			
		}else if(request.getParameter("duyet") != null)
		{
			duyetKHGD(request, response);
		}
		else if(request.getParameter("duyet1kehoach") != null) {
			duyet1KeHoach(request, response, request.getParameter("maKHGD"));
		}
		
	}
	
	private void phanLoaiKHGD(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String select = request.getParameter("selectTinhTrang");
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemKeHoachGiangDayPath")
				+ "?msg=" + select);	
	}
	
	private void duyet1KeHoach(HttpServletRequest request,
		HttpServletResponse response, String maKHGD)throws ServletException, IOException {
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		ChiTietThanhVienModel chiTietThanhVienModel = ThanhVienDAO.XemChiTietThanhVienByMaThanhVien(userLoginID);
		Boolean status=false;
		
		if(chiTietThanhVienModel.getMaVaiTro().equals(Constant.TRUONG_KHOA)|| (chiTietThanhVienModel.getMaVaiTro().equals(Constant.ADMIN) && (request.getParameter("role").equals("tk")) )){
			if (request.getParameter("Duyet").equals("Approve")) {
			//	if(GiaoAnDAO.getTotalGiaoAnByMaKHGD(maKHGD)!=0&&GiaoAnDAO.getTotalGiaoAnByMaKHGD(maKHGD)==ChiTietKHGDDAO.getTotalChiTietKHGDByMaKHGD(maKHGD)){
					KeHoachGiangDayDAO.tkDuyetKHGD(userLoginID, maKHGD, Constant.TINHTRANG_APPROVE, null);
					KeHoachGiangDayDAO.updateTinhTrangHTKeHoachGiangDayByMaKHGD(maKHGD,Constant.TINHTRANG_HT_SEND);
					
					KeHoachGiangDayModel keHoachGiangDayModel = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);
					keHoachGiangDayModel.setNgayDuyet(DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()));
					ArrayList<String> mailCC=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(keHoachGiangDayModel.getMaNguoiTao());
					mailCC.add(MailDAO.getMailByMaThanhVien(request.getSession().getAttribute("maThanhVien").toString()));
					
					// Gui email inform APPROVE cho HieuTruong
					
					MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),
													mailCC,
												MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
													MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
															keHoachGiangDayModel.getTenKHGD(), 
																keHoachGiangDayModel.getTenNguoiTao(), 
																DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()), 
																		keHoachGiangDayModel.getTenTruongKhoa(), 
																			keHoachGiangDayModel.getNgayDuyet()  + " : " + keHoachGiangDayModel.getGioDuyet()));														
	
			}else{
				KeHoachGiangDayDAO.tkDuyetKHGD(userLoginID, maKHGD, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
				KeHoachGiangDayModel keHoachGiangDayModel = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);
				
				// Gui email inform REJECT cho GiaoVien
				ArrayList<String> mailTo=new ArrayList<String>();
				ArrayList<String> mailCC=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(request.getSession().getAttribute("maThanhVien").toString());
				
				mailTo.add(MailDAO.getMailByMaThanhVien(keHoachGiangDayModel.getMaNguoiTao()));
				
				MailUtil.sendEmailToBoPhan(mailTo,
										mailCC,
											MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
												MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
														keHoachGiangDayModel.getTenKHGD(), 
															keHoachGiangDayModel.getTenNguoiTao(), 
															DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()), 
																	keHoachGiangDayModel.getTenTruongKhoa(),
																		keHoachGiangDayModel.getNgayDuyet()  + " : " + keHoachGiangDayModel.getGioDuyet()));
			
				
			}
		}else{
			if (request.getParameter("Duyet").equals("Approve")) {
				KeHoachGiangDayDAO.htDuyetKHGD(userLoginID, maKHGD, Constant.TINHTRANG_APPROVE, null);
				KeHoachGiangDayModel keHoachGiangDayModel = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);
				KeHoachGiangDayDAO.updateTinhTrangHTKeHoachGiangDayByMaKHGD(maKHGD,Constant.TINHTRANG_HT_APPROVE);
				
				// Gui email inform APPROVE cho ban giam hieu
				String maGiaoVien=keHoachGiangDayModel.getMaGiaoVien();
				ArrayList<String> mailTo=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(maGiaoVien);
				mailTo.add(MailDAO.getMailByMaThanhVien(maGiaoVien));
				
				ArrayList<String> mailCC=MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
				
				
				MailUtil.sendEmailToBoPhan(mailTo,
						mailCC,
							MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
								MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
										keHoachGiangDayModel.getTenKHGD(), 
											keHoachGiangDayModel.getTenNguoiTao(), 
											DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()), 
													keHoachGiangDayModel.getTenNguoiDuyet(), 
														keHoachGiangDayModel.getNgayDuyet()  + " : " + keHoachGiangDayModel.getGioDuyet()));														
			}
			else{
				KeHoachGiangDayDAO.htDuyetKHGD(userLoginID, maKHGD, Constant.TINHTRANG_APPROVE, StringUtil.toUTF8(request.getParameter("LyDoReject").trim()));
				KeHoachGiangDayModel keHoachGiangDayModel = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);
				KeHoachGiangDayDAO.updateTinhTrangHTKeHoachGiangDayByMaKHGD(maKHGD,Constant.TINHTRANG_HT_REJECT);
				ArrayList<String> mailTo=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(keHoachGiangDayModel.getMaNguoiTao());
				ArrayList<String> mailCC=MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
				// Gui email inform REJECT cho TruongKhoa
				MailUtil.sendEmailToBoPhan(mailTo,
										mailCC,
											MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
												MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
														keHoachGiangDayModel.getTenKHGD(), 
															keHoachGiangDayModel.getTenNguoiTao(), 
															DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()), 
																	keHoachGiangDayModel.getTenNguoiDuyet(),
																		keHoachGiangDayModel.getNgayDuyet()  + " : " + keHoachGiangDayModel.getGioDuyet()));
			}
		}
		if(status==false)
			response.sendRedirect(Constant.PATH_RES
					.getString("iso.XemKeHoachGiangDayPath"));
	}
	
	private void mapParameterToModel(HttpServletRequest req ,HttpServletResponse res,KeHoachGiangDayModel keHoachGiangDayModel) {
		keHoachGiangDayModel.setMaNguoiTao(req.getSession().getAttribute("maThanhVien").toString());		
		
		if(req.getParameter("maKHGD")!=null)
			keHoachGiangDayModel.setMaKHGD(req.getParameter("maKHGD"));
		if (req.getParameter("cboLop") != null) {
			keHoachGiangDayModel.setMaLop(StringUtil.toUTF8(req.getParameter("cboLop").trim())); 
		}
		else if(req.getParameter("txtLopHoc") != null){
			keHoachGiangDayModel.setMaLop(StringUtil.toUTF8(req.getParameter("txtLopHoc").trim())); 
		}
		
		if (req.getParameter("cboMonHoc") != null) {
			keHoachGiangDayModel.setMaMonHoc(StringUtil.toUTF8(req.getParameter("cboMonHoc").trim()));
			keHoachGiangDayModel.setTenMonHoc(StringUtil.toUTF8(req.getParameter("cboTenMonHoc").trim()));
		}else if(req.getParameter("txtMonHoc")!=null){
			keHoachGiangDayModel.setMaMonHoc(StringUtil.toUTF8(req.getParameter("txtMonHoc").trim()));
			keHoachGiangDayModel.setTenMonHoc(StringUtil.toUTF8(req.getParameter("txtTenMonHoc").trim()));
		}
		
		if(req.getParameter("txtTinhTrangTK")!=null)
			keHoachGiangDayModel.setTinhTrang(req.getParameter("txtTinhTrangTK"));
		
		if (req.getParameter("cboTKB") != null) {
			keHoachGiangDayModel.setThoiKhoaBieu(StringUtil.toUTF8(req.getParameter("cboTKB").trim())); 
		}else {
			keHoachGiangDayModel.setThoiKhoaBieu("NULL");
		}
		if (req.getParameter("txtHocKi") != null) {
			keHoachGiangDayModel.setHocKi(req.getParameter("txtHocKi").trim()); }
		if (req.getParameter("txtNamHoc") != null) {
			keHoachGiangDayModel.setNamHoc(req.getParameter("txtNamHoc").trim()); }
		if (req.getParameter("txtSoGioMonHoc") != null) {
			keHoachGiangDayModel.setSoGioMonHoc(req.getParameter("txtSoGioMonHoc").trim()); }
		if (req.getParameter("txtSoGioLT") != null) {
			keHoachGiangDayModel.setSoGioLT(req.getParameter("txtSoGioLT").trim()); }
		if (req.getParameter("txtSoGioTH") != null) {
			keHoachGiangDayModel.setSoGioTH(req.getParameter("txtSoGioTH").trim()); }
		if (req.getParameter("txtGiaoVien") != null) {
			keHoachGiangDayModel.setTenGiaoVien(StringUtil.toUTF8(req.getParameter("txtGiaoVien").trim())); }
		if (req.getParameter("txtSoCaTH") != null) {
			keHoachGiangDayModel.setSoCaThucHanh(req.getParameter("txtSoCaTH").trim()); }
		if (req.getParameter("SoTietMoiBuoi") != null) {
			keHoachGiangDayModel.setSoTietMoiBuoi(req.getParameter("SoTietMoiBuoi").trim()); }
		
		if(req.getParameter("txtTenKHGD")!=null){
			keHoachGiangDayModel.setTenKHGD(req.getParameter("txtTenKHGD"));
		}
		int row=Integer.parseInt(req.getParameter("countTemp").toString());
		if(row>0){
			ArrayList<ChiTietKHGDModel> chiTietKHGDList=new ArrayList<ChiTietKHGDModel>();
			ChiTietKHGDModel chiTietKHGDModel=new ChiTietKHGDModel();
			int jIndex=0;
			for(int i=0;i<row;i++){
				chiTietKHGDModel=new ChiTietKHGDModel();
				String coHieu="0";
				
				if(req.getParameter("hdnMaCTKHGD_"+i)!=null){
					chiTietKHGDModel.setMaChiTietKHGD(req.getParameter("hdnMaCTKHGD_"+i));
				}
				
				if(req.getParameter("hdnCoHieu_"+i)!=null){
					coHieu=req.getParameter("hdnCoHieu_"+i);
					chiTietKHGDModel.setCoHieu(coHieu);
				}
			
				if(req.getParameter("hdnNgayBD_"+i)!=null)
					chiTietKHGDModel.setNgayBD(DateUtil.setDate(req.getParameter("hdnNgayBD_"+i)));
				
				Boolean stt=true;
				while(stt){
					if(req.getParameter("hdnTuanTemp_"+jIndex).equals(req.getParameter("hdnTuan_"+i)) && req.getParameter("hdnSTTNoiDung_"+i).equals(req.getParameter("hdnSTTNoiDungTemp_"+jIndex))&& req.getParameter("hdnCoHieu_"+i).equals(req.getParameter("hdnCoHieuTemp_"+jIndex))){
						if(coHieu.equals(Constant.COHIEUTH)){
							chiTietKHGDModel.setNoiDungTH(StringUtil.toUTF8(req.getParameter("areaTH_"+jIndex).trim()));
						}
						else if (coHieu.equals(Constant.COHIEULT)){
							chiTietKHGDModel.setTenChuong(StringUtil.toUTF8(req.getParameter("areaLT_"+jIndex).trim()));
		
						}
						else if (!coHieu.equals(Constant.COHIEULT)&&!coHieu.equals(Constant.COHIEUTH)){
							chiTietKHGDModel.setTenChuong(StringUtil.toUTF8(req.getParameter("areaLT_"+jIndex).trim()));
							chiTietKHGDModel.setNoiDungTH(StringUtil.toUTF8(req.getParameter("areaTH_"+jIndex).trim()));
							
						}
						
						if(req.getParameter("actionType").equalsIgnoreCase("ThemMoi")){
							chiTietKHGDModel.setMucTieuBaiHoc(StringUtil.toUTF8(req.getParameter("txtMucTieuBaiHoc_"+jIndex).trim()));
						}
						
						chiTietKHGDModel.setCongViecChuanBi(StringUtil.toUTF8(req.getParameter("areaCVCB_"+jIndex).trim()));
						
						
						stt=false;
					}
					else{	
						jIndex++;
					}
				}
				
				if(req.getParameter("hdnTuan_"+i)!=null)
					chiTietKHGDModel.setTuan(req.getParameter("hdnTuan_"+i));
				
				if(req.getParameter("hdnNhom_"+i)!=null)
					chiTietKHGDModel.setNhom(req.getParameter("hdnNhom_"+i).trim());
				
				if(req.getParameter("hdnSTTNoiDung_"+i)!=null)
					chiTietKHGDModel.setsTTNoiDung(req.getParameter("hdnSTTNoiDung_"+i));
				
				if(req.getParameter("hdnThu_"+i)!=null)
					chiTietKHGDModel.setThu(req.getParameter("hdnThu_"+i));
				
				if(req.getParameter("hdnBuoi_"+i)!=null)
					chiTietKHGDModel.setBuoi(StringUtil.toUTF8(req.getParameter("hdnBuoi_"+i)));
				
				if(req.getParameter("hdnTenPhong_"+i)!=null)
					chiTietKHGDModel.setPhong(StringUtil.toUTF8(req.getParameter("hdnTenPhong_"+i)));
				
				chiTietKHGDList.add(chiTietKHGDModel);
			}
			keHoachGiangDayModel.setChiTietKHGDModelList(chiTietKHGDList);
		}
		
	}
	
	private void themKHGD(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		KeHoachGiangDayModel keHoachGiangDayModel=new KeHoachGiangDayModel();
		mapParameterToModel(request, response, keHoachGiangDayModel);
		String pageNext = Constant.PATH_RES.getString("iso.NewKeHoachGiangDayShortPath");
		String actionType = request.getParameter("actionType");

		if (keHoachGiangDayModel.validateModel()) { 	// Validate thanh cong
			
			if(request.getParameter("Gui") != null&& request.getParameter("Gui").equals("Gui")){
				keHoachGiangDayModel.setTinhTrang(Constant.TINHTRANG_SEND);
				
				if (KeHoachGiangDayDAO.updateKHGD(keHoachGiangDayModel)) {
					
					String maNguoiTao=keHoachGiangDayModel.getMaNguoiTao();
					ArrayList<String> mailCC=new ArrayList<String>();
					mailCC.add(MailDAO.getMailByMaThanhVien(maNguoiTao));
					
					// Gui email inform Truong Khoa
					MailUtil.sendEmailToBoPhan(MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(maNguoiTao),
											mailCC,
												MailDAO.getSubjectReviewByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
													MailDAO.getContentReviewByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
														StringUtil.toUTF8(keHoachGiangDayModel.getTenKHGD()), 
															request.getSession().getAttribute("tenThanhVien").toString(), 
																DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong())));		
					
					pageNext+="?msg=send&maKHGD="+keHoachGiangDayModel.getMaKHGD();
					
				}
				
			}
			else{
				if(actionType.equalsIgnoreCase("ThemMoi")){
					if(KeHoachGiangDayDAO.checkLopAndMonHocOfKHGD(keHoachGiangDayModel.getMaLop(), keHoachGiangDayModel.getMaMonHoc())) {
						if (KeHoachGiangDayDAO.insertKHGD(keHoachGiangDayModel)) {
							pageNext += "?msg=ThemMoi&maKHGD="+keHoachGiangDayModel.getMaKHGD();
							
							ArrayList<KhoaHocNewBean> listObject = new ArrayList<KhoaHocNewBean>();
							
						
							KhoaHocNewBean khoaHocNewBean = new KhoaHocNewBean
							(
								"","1","100","",
								StringUtil.toUTF8(request.getParameter("cboTenMonHoc").trim()),
								"",
								StringUtil.toUTF8(request.getParameter("cboMonHoc").trim()),
								"Null","Weeks","1","Null","1",
								StringUtil.toUTF8(request.getParameter("txtGiaoVien").trim()),
								"Teachers","Student","Students","0","0","0","10","0","0","0","1","0","0","0","0","","","","USD","0","0","0","0","0","0","0","1","0","0","","0",""
							);
							listObject.add(khoaHocNewBean);
							
							XmlUtil.exportThemMoiKhoaHocXmlFile(listObject, "HungVuongOutput", "mdl_course");
						}
						else { // Validate that bai
							pageNext += "?err='Validate Error'";					
						}
						
					} 
					else {
						pageNext += "?errTrung='TrungKHGD'";						
					}
				}
				else if(actionType.equalsIgnoreCase("CapNhat")){
					if (KeHoachGiangDayDAO.updateKHGD(keHoachGiangDayModel)) {
						
						pageNext += "?msg=CapNhat&maKHGD="+keHoachGiangDayModel.getMaKHGD();
						
						ArrayList<KhoaHocNewBean> listObject = new ArrayList<KhoaHocNewBean>();
						
						KhoaHocNewBean khoaHocNewBean = new KhoaHocNewBean
						(
							request.getParameter("maKHGD"),
							"1","100","",
							StringUtil.toUTF8(request.getParameter("txtTenMonHoc").trim()),
							"",
							StringUtil.toUTF8(request.getParameter("txtMonHoc").trim()),
							"Null","Weeks","1","Null","1",
							StringUtil.toUTF8(request.getParameter("txtGiaoVien").trim()),
							"Teachers","Student","Students","0","0","0","10","0","0","0","1","0","0","0","0","","","","USD","0","0","0","0","0","0","0","1","0","0","","0",""
						);
						listObject.add(khoaHocNewBean);
						
						XmlUtil.exportUpdateKhoaHocXmlFile(listObject, "HungVuongOutput", "mdl_course");
					}
					else { // Validate that bai
						pageNext += "?err='Validate Error'";					
					}
				}	
			}
		}
		else { // Validate that bai
				pageNext += "?err='Validate Error'";					
		}
	
		response.sendRedirect(pageNext);
	}
	
	private void duyetKHGD(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		String userLoginID = request.getSession().getAttribute("maThanhVien").toString();
		ChiTietThanhVienModel chiTietThanhVienModel = ThanhVienDAO.XemChiTietThanhVienByMaThanhVien(userLoginID);
		Boolean status=false;
		for (Integer i = 0; i< Constant.RECORDS_PER_PAGE; i++) {
			if(request.getParameter("tinhtrang" + i.toString()) != null) {
				
				if(chiTietThanhVienModel.getMaVaiTro().equals(Constant.TRUONG_KHOA) || (chiTietThanhVienModel.getMaVaiTro().equals(Constant.ADMIN) && request.getParameter("role"+i.toString()).equalsIgnoreCase("tk"))){
					String choiseValue = request.getParameter("tinhtrang" + i.toString());
					String[] value = choiseValue.split("-");
					if (value[0].equals("Approve")) {
						String maKHGD = value[1];
						
							KeHoachGiangDayDAO.tkDuyetKHGD(userLoginID, maKHGD, Constant.TINHTRANG_APPROVE, null);
							KeHoachGiangDayDAO.updateTinhTrangHTKeHoachGiangDayByMaKHGD(maKHGD,Constant.TINHTRANG_HT_SEND);
							
							KeHoachGiangDayModel keHoachGiangDayModel = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);
							
							KeHoachGiangDayDAO.updateMaNguoiDuyetKHGDByMaKHGD(maKHGD,request.getSession().getAttribute("maThanhVien").toString());
							
							
							///////////////////////////////////////////////////////////////////////////////////
							
							ArrayList<String> mailCC=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(keHoachGiangDayModel.getMaNguoiTao());
							mailCC.add(MailDAO.getMailByMaThanhVien(keHoachGiangDayModel.getMaNguoiTao()));
							
							// Gui email inform APPROVE cho HieuTruong
							MailUtil.sendEmailToBoPhan(MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH),
													mailCC,
														MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
															MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
																	keHoachGiangDayModel.getTenKHGD(), 
																		keHoachGiangDayModel.getTenNguoiTao(), 
																		DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()), 
																				keHoachGiangDayModel.getTenTruongKhoa(), 
																				SysParamsDAO.getSysParams().getGioHeThong()));														
							
							
						
					}
					else if(value[0].equals("Reject")) {
						String maKHGD = value[1];
						KeHoachGiangDayDAO.tkDuyetKHGD(userLoginID, maKHGD, Constant.TINHTRANG_REJECT, StringUtil.toUTF8(request.getParameter("Ly_do_reject" + i.toString()).trim()));
						KeHoachGiangDayModel keHoachGiangDayModel = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);
						KeHoachGiangDayDAO.updateMaNguoiDuyetKHGDByMaKHGD(maKHGD,request.getSession().getAttribute("maThanhVien").toString());
						
						ArrayList<String> mailTo=new ArrayList<String>();
						mailTo.add(MailDAO.getMailByMaThanhVien(keHoachGiangDayModel.getMaNguoiTao()));
						
						ArrayList<String> mailCC=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(keHoachGiangDayModel.getMaNguoiTao());
						
						// Gui email inform REJECT cho GiaoVien
						////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						MailUtil.sendEmailToBoPhan(	mailTo,
												mailCC,
													MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
														MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
																keHoachGiangDayModel.getTenKHGD(), 
																	keHoachGiangDayModel.getTenNguoiTao(), 
																	DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()), 
																			keHoachGiangDayModel.getTenTruongKhoa(),
																			SysParamsDAO.getSysParams().getGioHeThong()));
						
					}
				}
				else{
					String choiseValue = request.getParameter("tinhtrang" + i.toString());
					String[] value = choiseValue.split("-");
					if (value[0].equals("Approve")) {
						String maKHGD = value[1];
						KeHoachGiangDayDAO.htDuyetKHGD(userLoginID, maKHGD, Constant.TINHTRANG_APPROVE, null);
						KeHoachGiangDayDAO.updateTinhTrangHTKeHoachGiangDayByMaKHGD(maKHGD,Constant.TINHTRANG_HT_APPROVE);
						KeHoachGiangDayModel keHoachGiangDayModel = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);
						/////////////////////////////////////////////////////////////////////////////////////////////////
						
						// Gui email inform APPROVE cho GiaoVien
						
						String maGiaoVien=keHoachGiangDayModel.getMaNguoiTao();
						ArrayList<String> mailTo=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(maGiaoVien);
						mailTo.add(MailDAO.getMailByMaThanhVien(maGiaoVien));
						
						ArrayList<String> mailCC=MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
						
						
						MailUtil.sendEmailToBoPhan(mailTo,
												mailCC,
													MailDAO.getSubjectApproveByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
														MailDAO.getContentApproveByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
																keHoachGiangDayModel.getTenKHGD(), 
																	keHoachGiangDayModel.getTenNguoiTao(), 
																	DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()), 
																			keHoachGiangDayModel.getTenNguoiDuyet(), 
																				keHoachGiangDayModel.getNgayDuyet()  + " : " + keHoachGiangDayModel.getGioDuyet()));														
					}
					else if(value[0].equals("Reject")) {
						String maKHGD = value[1];
						KeHoachGiangDayDAO.htDuyetKHGD(userLoginID, maKHGD, Constant.TINHTRANG_TK_SEND, StringUtil.toUTF8(request.getParameter("Ly_do_reject" + i.toString()).trim()));
						KeHoachGiangDayDAO.updateTinhTrangHTKeHoachGiangDayByMaKHGD(maKHGD,Constant.TINHTRANG_HT_REJECT);
						KeHoachGiangDayModel keHoachGiangDayModel = KeHoachGiangDayDAO.getKeHoachGiangDayByMaKHGD(maKHGD);
						
						ArrayList<String> mailTo=MailDAO.getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap(keHoachGiangDayModel.getMaNguoiTao());
						ArrayList<String> mailCC=MailDAO.getMailListByMaBoPhan(Constant.BO_PHAN_BGH);
						
						
 						// Gui email inform REJECT cho TruongKhoa
						////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						MailUtil.sendEmailToBoPhan(	mailTo,
												mailCC,
													MailDAO.getSubjectRejectByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY),
														MailDAO.getContentRejectByChucNang(Constant.CHUCNANG_KEHOACHGIANGDAY, 
																keHoachGiangDayModel.getTenKHGD(), 
																	keHoachGiangDayModel.getTenNguoiTao(), 
																	DateUtil.setDate(SysParamsDAO.getSysParams().getGioHeThong()), 
																			keHoachGiangDayModel.getTenNguoiDuyet(),
																				keHoachGiangDayModel.getNgayDuyet()  + " : " + keHoachGiangDayModel.getGioDuyet()));
					}
				}
			}
		}
		if(status==false)
			response.sendRedirect(Constant.PATH_RES
				.getString("iso.XemKeHoachGiangDayPath"));
	}

}
