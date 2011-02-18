package vn.edu.hungvuongaptech.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.CongTacDAO;
import vn.edu.hungvuongaptech.model.CongTacModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class CongTacController  extends HttpServlet {
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
		
		if(actionType.equalsIgnoreCase("congTac")){
			String maCongTac = request.getParameter("maCongTac");
			String noiDung = StringUtil.toUTF8(request.getParameter("txtNoiDung")).replaceAll("\r\n", "");
			//String ghiChu = StringUtil.toUTF8(request.getParameter("txtGhiChu"));
			
			CongTacModel congTacModel = new CongTacModel();
			congTacModel.setMaCongTac(maCongTac);
			congTacModel.setNoiDung(noiDung);
			//congTacModel.setGhiChu(ghiChu);
			
			if(maCongTac == ""){// them moi
				if(CongTacDAO.insertCongTac(congTacModel)){
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemThemCongTacPath")+"?msg=msgInsertTC");
				}else{
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemThemCongTacPath")+"?msg=msgInsertTB");
				}
			}else{// cap nhat
				if(CongTacDAO.updateCongTac(congTacModel)){
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemThemCongTacPath")+"?msg=msgUpdateTC");
				}else{
					response.sendRedirect(Constant.PATH_RES
							.getString("iso.XemThemCongTacPath")+"?msg=msgInsertTB");
				}
			}
		}
	}
}
