package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.IntroDAO;
import vn.edu.hungvuongaptech.dao.MoChuyenNganhDAO;
import vn.edu.hungvuongaptech.model.IntroModel;
import vn.edu.hungvuongaptech.model.KeHoachGiangDayModel;
import vn.edu.hungvuongaptech.model.MoChuyenNganhModel;
import vn.edu.hungvuongaptech.model.QuyetDinhModel;
import vn.edu.hungvuongaptech.util.StringUtil;

public class IntroController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionType = request.getParameter("actionType");
		if(actionType.equals("duyet"))
		{
			duyetCongTac(request, response);
		}
		else if(actionType.equals("phanloai"))
		{
			phanLoaiCongTac(request, response);
		}
	}
	
	private void mapParameterToModel(HttpServletRequest req 
			,HttpServletResponse res
				,ArrayList<IntroModel> introModelList) {	
		for (Integer i = 0; i< Integer.parseInt(req.getSession().getAttribute("Row") + ""); i++) {
			IntroModel introModel = new IntroModel();
			if (req.getParameter("maNguoiThucHien" + i.toString()) != null) {
				introModel.setMaNguoiThucHien(req.getParameter("maNguoiThucHien" + i.toString()));
			}
			if (req.getParameter("maBoPhanThucHien" + i.toString()) != null) {
				introModel.setMaBoPhan(req.getParameter("maBoPhanThucHien" + i.toString()));
			}
			if (req.getParameter("maNoiDungChiTietKHDT" + i.toString()) != null) {
				introModel.setMaBoPhan(req.getParameter("maNoiDungChiTietKHDT" + i.toString()));
			}
			if (req.getParameter("chkRow" + i.toString()) != null) {
				introModel.setTinhTrang("1");
			}
			introModelList.add(introModel);
		}	
	}
	
	private void phanLoaiCongTac(HttpServletRequest request 
			,HttpServletResponse response)throws ServletException, IOException {
		String tinhTrang = "", tuan = "", maNam = ""; 
		tinhTrang = request.getParameter("cboTinhTrang");
		tuan = request.getParameter("cboTuan");
		
		if(request.getParameter("cboNam") != null){
			maNam = request.getParameter("cboNam");
		}
		response.sendRedirect(Constant.PATH_RES
				.getString("iso.introPath")
				+ "?tinhTrang=" + tinhTrang + "&tuan=" + tuan + "&maNam=" + maNam);	
	}
	
	private void duyetCongTac(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		String tuan = "", maNam = "", tinhTrang = ""; 
		tuan = request.getParameter("cboTuan");
		
		if(request.getParameter("cboNam") != null){
			maNam = request.getParameter("cboNam");
		}
		System.out.println(tuan + "-" + maNam);
		String pageNext = Constant.PATH_RES.getString("iso.intro") + "?tinhTrang=" + tinhTrang + "&tuan=" + tuan + "&maNam=" + maNam;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);
		ArrayList<IntroModel> introModelList = new ArrayList<IntroModel>();
		request.setCharacterEncoding("UTF-8");
		mapParameterToModel(request, response,introModelList);
		IntroDAO.checkListCongTac(introModelList);
		request.setAttribute(Constant.INTRO_ATT, introModelList);
		rd.forward(request, response);
	}
}
