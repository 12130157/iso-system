package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.impl.orbutil.closure.Constant;

import vn.edu.hungvuongaptech.dao.ChiTietTKBDAO;
import vn.edu.hungvuongaptech.model.MonHocTKBModel;
import vn.edu.hungvuongaptech.model.SoLenLopModel;
import vn.edu.hungvuongaptech.util.StringUtil;

public class SoLenLopController extends HttpServlet{
	/**
     * @see HttpServlet#HttpServlet()
     */
    public SoLenLopController() {
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
		String noiDung = StringUtil.toUTF8(request.getParameter("str").trim());
		String maCT = request.getParameter("maCT");
		//response.setContentType("text/html");
		if(ChiTietTKBDAO.capNhatTomTatNoiDung(maCT, noiDung) == 1) {
			//response.getWriter().write("1");
			MonHocTKBModel monHocTKB = new MonHocTKBModel();
			if(request.getSession().getAttribute("BangTomTatNoiDung") != null) {
				monHocTKB = (MonHocTKBModel)request.getSession().getAttribute("BangTomTatNoiDung");
				if(request.getSession().getAttribute("SoLenLop") != null) {
					SoLenLopModel soLenLop = (SoLenLopModel) request.getSession().getAttribute("SoLenLop");
					for(int i=0;i<soLenLop.getMonHocTKBList().size();i++) {
						if(soLenLop.getMonHocTKBList().get(i).getMaMonHocTKB().equals(monHocTKB.getMaMonHocTKB())) {
							for(int j=0;j<monHocTKB.getChiTietTKBModelList().size();j++) {
								if(soLenLop.getMonHocTKBList().get(i).getChiTietTKBModelList().get(j).getMaChiTietTKB().equals(maCT)) {
									soLenLop.getMonHocTKBList().get(i).getChiTietTKBModelList().get(j).setNoiDungBaiDay(noiDung);
									break;
								}
							}
							break;
						}
					}
					request.getSession().setAttribute("SoLenLop", soLenLop);
				}
			}
		} else
			response.getWriter().write("0");
	}
}
