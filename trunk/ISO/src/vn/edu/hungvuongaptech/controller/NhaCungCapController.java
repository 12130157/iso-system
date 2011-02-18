package vn.edu.hungvuongaptech.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.NhaCungCapDAO;
import vn.edu.hungvuongaptech.dao.ThietBiDAO;
import vn.edu.hungvuongaptech.model.NhaCungCapModel;
import vn.edu.hungvuongaptech.model.TaiKhoanModel;
import vn.edu.hungvuongaptech.model.ThietBiModel;
import vn.edu.hungvuongaptech.util.StringUtil;

public class NhaCungCapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NhaCungCapController() {
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
		String actionType = request.getParameter("actionType");
		
		if(actionType.equalsIgnoreCase("capnhat")){
			updateNhaCungCapByID(request, response);
		}
		else if(actionType.equalsIgnoreCase("themmoi")){
			insertNhaCungCap(request, response);
		}
		else if(actionType.equalsIgnoreCase("nhaCungCap"))
		{
			NhaCungCap(request,response);
		}
	}	
	
	
	private void updateNhaCungCapByID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		TaiKhoanModel taiKhoanModel=new TaiKhoanModel();
		taiKhoanModel.setMaTaiKhoan(request.getParameter("selSoTaiKhoan"));
		NhaCungCapModel nhaCungCapModel=new NhaCungCapModel();
		nhaCungCapModel.setTen(StringUtil.toUTF8(request.getParameter("txtTenNhaCungCap").trim()));
		nhaCungCapModel.setDiaChi(StringUtil.toUTF8(request.getParameter("txtDiaChi").trim()));
		nhaCungCapModel.setDienThoai(request.getParameter("txtDienThoai").trim());
		nhaCungCapModel.setEmail(request.getParameter("txtEmail").trim());
		nhaCungCapModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu").trim()));
		nhaCungCapModel.setMaNhaCungCap(request.getParameter("txtMaNhaCungCap"));
		nhaCungCapModel.setTaiKhoan(taiKhoanModel);
		
		if(NhaCungCapDAO.updateNhaCungCapByID(nhaCungCapModel))
			response.sendRedirect(Constant.PATH_RES.getString("qltb.DanhSachNCC")+"?errUpdate=false"+request.getParameter("txtProLink"));
		else
			response.sendRedirect(Constant.PATH_RES.getString("qltb.DanhSachNCC")+"?errUpdate=true"+request.getParameter("txtProLink"));
			
	}
	
	private void insertNhaCungCap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		TaiKhoanModel taiKhoanModel=new TaiKhoanModel();
		taiKhoanModel.setMaTaiKhoan(request.getParameter("selSoTaiKhoan"));
		NhaCungCapModel nhaCungCapModel=new NhaCungCapModel();
		nhaCungCapModel.setTen(StringUtil.toUTF8(request.getParameter("txtTenNhaCungCap").trim()));
		nhaCungCapModel.setDiaChi(StringUtil.toUTF8(request.getParameter("txtDiaChi").trim()));
		nhaCungCapModel.setDienThoai(request.getParameter("txtDienThoai").trim());
		nhaCungCapModel.setEmail(request.getParameter("txtEmail").trim());
		nhaCungCapModel.setGhiChu(StringUtil.toUTF8(request.getParameter("txtGhiChu").trim()));
		nhaCungCapModel.setTaiKhoan(taiKhoanModel);
		
		if(NhaCungCapDAO.insertNhaCungCap(nhaCungCapModel))
			response.sendRedirect(Constant.PATH_RES.getString("qltb.DanhSachNCC")+"?errInsert=false"+request.getParameter("txtProLink"));
		else
			response.sendRedirect(Constant.PATH_RES.getString("qltb.DanhSachNCC")+"?errInsert=true"+request.getParameter("txtProLink"));
			
	}
	
	protected void NhaCungCap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String maNhaCungCap = "";
		String pageNext = Constant.PATH_RES.getString("qltb.XemNhaCungCapPath") + "?MaNhaCungCap=" + maNhaCungCap ;
		RequestDispatcher rd = request.getRequestDispatcher(pageNext);	
		
		ArrayList<NhaCungCapModel> nhaCungCapModelList1  = new ArrayList<NhaCungCapModel>();
		ArrayList<NhaCungCapModel> nhaCungCapModelList2  = new ArrayList<NhaCungCapModel>();
		if(request.getSession().getAttribute("nhaCungCapList") != null)
			nhaCungCapModelList1 = (ArrayList<NhaCungCapModel>)request.getSession().getAttribute("nhaCungCapList");
		
		for(Integer i = 1; i <= nhaCungCapModelList1.size(); i++){
			
			NhaCungCapModel nhaCungCapModel = nhaCungCapModelList1.get(i-1);
			
			if(request.getParameter("xoaNCC") != null && request.getParameter("xoaNCC").equals("xoa") && request.getParameter("chk" + i.toString()) != null)
			{
				if(nhaCungCapModel.getMaNhaCungCap() != null){
					NhaCungCapDAO.deleteNhaCungCap(nhaCungCapModel.getMaNhaCungCap());
				}
			}
			else{
				nhaCungCapModelList2.add(nhaCungCapModel);
			}
		}
		
		if(request.getParameter("xoaNCC").equals("xoa"))
		{
			
			rd = request.getRequestDispatcher(pageNext);	
			pageNext += "?xoa=DeleteTC";
		}
		request.setAttribute(Constant.NHA_CUNG_CAP_MODEL_LIST, nhaCungCapModelList2);
		rd.forward(request, response);
	}
}
