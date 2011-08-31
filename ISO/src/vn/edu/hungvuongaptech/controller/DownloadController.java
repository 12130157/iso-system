package vn.edu.hungvuongaptech.controller;

import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadController extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		final int BYTES= 1024;
		String filename = request.getParameter("txtFileName").toString();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		ServletContext ctx = getServletContext();
		InputStream is = ctx.getResourceAsStream("/images/NhanSu/"+filename);
		
		int read=0;
		byte[] bytes = new byte[BYTES];
		try {
			OutputStream os = response.getOutputStream();
			while((read = is.read(bytes))!=-1){
				os.write(bytes,0,read);
			}
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
