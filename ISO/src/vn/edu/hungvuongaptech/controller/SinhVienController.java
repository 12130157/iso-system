package vn.edu.hungvuongaptech.controller;

/*	Date: 21/07/2011
 *  Author: QChuong
 * 	Purpose: Find student in Quan Ly Sinh Vien 
 * */

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.junit.runner.Request;

import vn.edu.hungvuongaptech.dao.ThanhVienDAO;
import vn.edu.hungvuongaptech.model.ChiTietThanhVienModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;

public class SinhVienController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String hidden = req.getParameter("hidden").toString();
		
		if(hidden.equals("cap nhat thong tin ca nhan"))
		{
			String maThanhVien = req.getParameter("id");
			ThanhVienDAO d = new ThanhVienDAO();			
			ChiTietThanhVienModel model = d.XemChiTietThanhVienByMaThanhVien(maThanhVien);			
			String ho = new String(req.getParameter("txtHo").trim().getBytes("8859_1"),"utf-8");
			String sonha = new String(req.getParameter("txtSoNha").trim().getBytes("8859_1"),"utf-8");
			String tenlot = new String(req.getParameter("txtTenLot").trim().getBytes("8859_1"),"utf-8");
			String duong = new String(req.getParameter("txtDuong").trim().getBytes("8859_1"),"utf-8");						
			String ten = new String(req.getParameter("txtTen").trim().getBytes("8859_1"),"utf-8");
			String phuong = new String(req.getParameter("txtPhuong").trim().getBytes("8859_1"),"utf-8");
			String ngaysinh = new String(req.getParameter("txtNgaySinh").trim().getBytes("8859_1"),"utf-8");
			String quan = new String(req.getParameter("txtQuan").trim().getBytes("8859_1"),"utf-8");
			String email = new String(req.getParameter("txtEmail").trim().getBytes("8859_1"),"utf-8");
			String thanhpho = new String(req.getParameter("txtThanhPho").trim().getBytes("8859_1"),"utf-8");
			String cmnd = new String(req.getParameter("txtCMNN").trim().getBytes("8859_1"),"utf-8");
			String dtnha = new String(req.getParameter("txtDienThoaiNha").trim().getBytes("8859_1"),"utf-8");
			String dtdd = new String(req.getParameter("txtDienThoaiDD").trim().getBytes("8859_1"),"utf-8");
			String sotk = new String(req.getParameter("txtSoTaiKhoan").trim().getBytes("8859_1"),"utf-8");
			String loaibang = new String(req.getParameter("txtLoaiBang").trim().getBytes("8859_1"),"utf-8");
			String nganhang = new String(req.getParameter("txtNganHang").trim().getBytes("8859_1"),"utf-8");
			String truongcap = new String(req.getParameter("txtTruongCap").trim().getBytes("8859_1"),"utf-8");
			String ngaylapthe = new String(req.getParameter("txtNgayLapThe").trim().getBytes("8859_1"),"utf-8");
			String loaitotnghiep = new String(req.getParameter("txtLoaiTotNghiep").trim().getBytes("8859_1"),"utf-8");
			
			model.setMaThanhVien(maThanhVien);			
			model.setHoTen(ho);
			model.setSoNha(sonha);
			model.setTenLot(tenlot);
			model.setDuong(duong);
			model.setTenThanhVien(ten);
			model.setPhuongXa(phuong);
			model.setNgaySinh(ngaysinh);
			model.setQuanHuyen(quan);
			model.setEmail(email);
			model.setThanhPho(thanhpho);
			model.setChungMinhNhanDan(cmnd);
			model.setDienThoaiNha(dtnha);
			model.setDienThoaiDiDong(dtdd);
			model.setSoTaiKhoan(sotk);
			model.setNganHang(nganhang);
			model.setLoaiBang(loaibang);
			model.setTruongCap(truongcap);
			model.setNgayLapThe(ngaylapthe);
			model.setLoaiTotNghiep(loaitotnghiep);
			
			if(d.updateChiTietSinhVien(model) == true)
				req.setAttribute("thongbao", "Cập nhật thành công.");
			else
				req.setAttribute("thongbao", "Cập nhật thất bại.");
			RequestDispatcher r = req.getRequestDispatcher("/QuanLySinhVien/ThongTinCaNhan.jsp?maThanhVien="+maThanhVien);
			r.forward(req, resp);
		}
		if(hidden.equals("cap nhat thong tin sinh vien"))
		{
			String maThanhVien = req.getParameter("id");
			ThanhVienDAO d = new ThanhVienDAO();
			ChiTietThanhVienModel model = d.XemChiTietThanhVienByMaThanhVien(maThanhVien);
			String sotk = new String(req.getParameter("txtSoTaiKhoan").trim().getBytes("8859_1"),"utf-8");
			String nganhang = new String(req.getParameter("txtNganHang").trim().getBytes("8859_1"),"utf-8");
			String vaitro = model.getMaVaiTro();
			String ngaylapthe = new String(req.getParameter("txtNgayLapThe").trim().getBytes("8859_1"),"utf-8");
			String khoa = new String(req.getParameter("cboKhoa").trim().getBytes("8859_1"),"utf-8");
			if(khoa==null){
				khoa = model.getMaKhoa();
			}
			String ho = new String(req.getParameter("txtHo").trim().getBytes("8859_1"),"utf-8");
			String sonha = new String(req.getParameter("txtSoNha").trim().getBytes("8859_1"),"utf-8");
			String tenlot = new String(req.getParameter("txtTenLot").trim().getBytes("8859_1"),"utf-8");
			String duong = new String(req.getParameter("txtDuong").trim().getBytes("8859_1"),"utf-8");
						
			String ten = new String(req.getParameter("txtTen").trim().getBytes("8859_1"),"utf-8");
			String phuong = new String(req.getParameter("txtPhuong").trim().getBytes("8859_1"),"utf-8");
			String ngaysinh = new String(req.getParameter("txtNgaySinh").trim().getBytes("8859_1"),"utf-8");
			String quan = new String(req.getParameter("txtQuan").trim().getBytes("8859_1"),"utf-8");
			String email = new String(req.getParameter("txtEmail").trim().getBytes("8859_1"),"utf-8");
					
			String thanhpho = new String(req.getParameter("txtThanhPho").trim().getBytes("8859_1"),"utf-8");
			String cmnd = new String(req.getParameter("txtCMNN").trim().getBytes("8859_1"),"utf-8");
			String dtnha = new String(req.getParameter("txtDienThoaiNha").trim().getBytes("8859_1"),"utf-8");
			String dtdd = new String(req.getParameter("txtDienThoaiDD").trim().getBytes("8859_1"),"utf-8");
			
			String loaibang = new String(req.getParameter("txtLoaiBang").trim().getBytes("8859_1"),"utf-8");
			String truongcap = new String(req.getParameter("txtTruongCap").trim().getBytes("8859_1"),"utf-8");
			String loaitotnghiep = new String(req.getParameter("txtLoaiTotNghiep").trim().getBytes("8859_1"),"utf-8");
			
			model.setSoTaiKhoan(sotk);
			model.setNganHang(nganhang);
			model.setMaVaiTro(vaitro);
			model.setNgayLapThe(ngaylapthe);
			model.setMaKhoa(khoa);
			model.setHoTen(ho);
			model.setSoNha(sonha);
			model.setTenLot(tenlot);
			model.setDuong(duong);
			model.setTenThanhVien(ten);
			model.setPhuongXa(phuong);
			model.setNgaySinh(ngaysinh);
			model.setQuanHuyen(quan);
			model.setEmail(email);
			model.setThanhPho(thanhpho);
			model.setChungMinhNhanDan(cmnd);
			model.setDienThoaiNha(dtnha);
			model.setDienThoaiDiDong(dtdd);
			model.setLoaiBang(loaibang);
			model.setTruongCap(truongcap);
			model.setLoaiTotNghiep(loaitotnghiep);
			
			if(d.updateChiTietThanhVien(model) == true)
				req.setAttribute("thongbao", "Cập nhật thành công.");
			else
				req.setAttribute("thongbao", "Cập nhật thất bại.");
			RequestDispatcher r = req.getRequestDispatcher("/QuanLySinhVien/ThongTinCaNhan.jsp?maThanhVien="+maThanhVien);
			r.forward(req, resp);
		}
		if(hidden.equals("capnhat"))
		{
			String ho = new String(req.getParameter("ho").trim().getBytes("8859_1"),"utf-8");
			String tenlot = new String(req.getParameter("tenlot").trim().getBytes("8859_1"),"utf-8");
			String ten = new String(req.getParameter("ten").trim().getBytes("8859_1"),"utf-8");
			String sonha = new String(req.getParameter("sonha").trim().getBytes("8859_1"),"utf-8");
			String duong = new String(req.getParameter("duong").trim().getBytes("8859_1"),"utf-8");
			String phuongxa = new String(req.getParameter("phuongxa").trim().getBytes("8859_1"),"utf-8");
			String quanhuyen = new String(req.getParameter("quanhuyen").trim().getBytes("8859_1"),"utf-8");
			String thanhpho = new String(req.getParameter("thanhpho").trim().getBytes("8859_1"),"utf-8");
			String ngaysinh = new String(req.getParameter("ngaysinh").trim().getBytes("8859_1"),"utf-8");
			String email = new String(req.getParameter("email").trim().getBytes("8859_1"),"utf-8");
			String cmnd = new String(req.getParameter("cmnd").trim().getBytes("8859_1"),"utf-8");
			ThanhVienDAO d = new ThanhVienDAO();
			ChiTietThanhVienModel model = d.XemChiTietThanhVienByMaThanhVien(req.getParameter("maThanhVien").toString());
			ChiTietThanhVienModel model2 = new ChiTietThanhVienModel();			
			model2.setTenDangNhap(model.getTenDangNhap().toString());
			model2.setMatKhau(model.getMatKhau().toString());
			model2.setMaVaiTro(model.getMaVaiTro().toString());
			model2.setNgayTao(model.getNgayTao().toString());
			model2.setNgayTruyCapCuoi(model.getNgayTruyCapCuoi().toString());
			model2.setNgayCapNhatCuoi(model.getNgayCapNhatCuoi().toString());
			model2.setMaKhoa(model.getMaKhoa().toString());
			model2.setMaThanhVien(model.getMaThanhVien().toString());
			model2.setHoThanhVien(ho);
			model2.setTenLot(tenlot);
			model2.setTenThanhVien(ten);
			model2.setNgaySinh(ngaysinh);
			model2.setEmail(email);
			model2.setDienThoaiDiDong(model.getDienThoaiDiDong());
			model2.setNgayBatDau(model.getNgayBatDau());
			model2.setNgayKetThuc(model.getNgayKetThuc());
			model2.setTinhTrang(model.getTinhTrang());
			model2.setChungMinhNhanDan(cmnd);
			model2.setSoNha(sonha);
			model2.setDuong(duong);
			model2.setPhuongXa(phuongxa);
			model2.setQuanHuyen(quanhuyen);
			model2.setThanhPho(thanhpho);
			model2.setDienThoaiNha(model.getDienThoaiNha());
			model2.setNgayCapNhatCuoi(model.getNgayCapNhatCuoi());
			model2.setLoaiBang(model.getLoaiBang());
			model2.setTruongCap(model.getTruongCap());
			model2.setNamTotNghiep(model.getNamTotNghiep());
			model2.setLoaiBang(model.getLoaiTotNghiep());
			model2.setSoTaiKhoan(model.getSoTaiKhoan());
			model2.setNganHang(model.getNganHang());
			model2.setNgayLapThe(model.getNgayLapThe());
			if(d.updateChiTietThanhVien(model2) == true)
			{
				req.setAttribute("thongbao", "Cập nhật thành công.");
			}
			else 
			{
				req.setAttribute("thongbao", "Cập nhật thất bại.");
			}
			RequestDispatcher r = req.getRequestDispatcher("/QuanLySinhVien/ThongTinSinhVien.jsp");
			r.forward(req, resp);
		}
		if(hidden.equals("search"))
		{
			
			String ho = new String(req.getParameter("SHo").trim().getBytes("8859_1"),"utf-8");
			String soNha = new String(req.getParameter("SSoNha").trim().getBytes("8859_1"),"utf-8");
			String tenLot = new String(req.getParameter("STenLot").trim().getBytes("8859_1"),"utf-8");
			String tenDuong = new String(req.getParameter("STenDuong").trim().getBytes("8859_1"),"utf-8");
			String ten = new String(req.getParameter("STen").trim().getBytes("8859_1"),"utf-8");
			String phuongXa = new String(req.getParameter("SPhuongXa").trim().getBytes("8859_1"),"utf-8");
			String ngaySinh  = new String(req.getParameter("SNgaySinh").trim().getBytes("8859_1"),"utf-8");
			String quanHuyen = new String(req.getParameter("SQuanHuyen").trim().getBytes("8859_1"),"utf-8");
			String tinh = new String(req.getParameter("STinhTP").trim().getBytes("8859_1"),"utf-8");
			String email = new String(req.getParameter("SEmail").trim().getBytes("8859_1"),"utf-8");
			String boPhan = new String(req.getParameter("SBoPhan").trim().getBytes("8859_1"),"utf-8");
			String maLopHoc = req.getParameter("SMaLopHoc");
			//JOptionPane.showMessageDialog(null, ho);
			ThanhVienDAO d = new ThanhVienDAO();
			ArrayList<ChiTietThanhVienModel> arr = d.timSinhVien(ho, tenLot, ten, soNha, tenDuong, phuongXa, quanHuyen, tinh, ngaySinh, email, boPhan,maLopHoc);
			//JOptionPane.showMessageDialog(null, arr.size());
			if(arr.size() == 0)
			{
				req.setAttribute("nothing", 0);	
			}else
			{
				req.setAttribute("dssv", arr);
			}
			
			req.setAttribute("ho", ho);
			req.setAttribute("sonha", soNha);
			req.setAttribute("tenlot", tenLot);
			req.setAttribute("tenduong", tenDuong);
			req.setAttribute("ten", ten);
			req.setAttribute("phuongxa", phuongXa);
			req.setAttribute("ngaysinh", ngaySinh);
			req.setAttribute("quanhuyen", quanHuyen);
			req.setAttribute("tinh", tinh);
			req.setAttribute("email", email);
			req.setAttribute("bophan", boPhan);
			RequestDispatcher r = req.getRequestDispatcher("/QuanLySinhVien/TimKiemSinhVien.jsp");
			r.forward(req, resp);
		}
		if(hidden.equals("ThemMoiSinhVienSoLuocLyLich")){
			String tenDangNhap = new String(req.getParameter("txtTenDangNhap").trim().getBytes("8859_1"),"utf-8");
			String soTaiKhoan = new String(req.getParameter("txtSoTaiKhoan").trim().getBytes("8859_1"),"utf-8");
			String matKhau = new String(req.getParameter("txtMatKhau").trim().getBytes("8859_1"),"utf-8");
			String nganHang = new String(req.getParameter("txtNganhang").trim().getBytes("8859_1"),"utf-8");
			int maVaiTro = 9;
			String ngayLapThe = new String(req.getParameter("txtNgayLapThe").trim().getBytes("8859_1"),"utf-8");
			int maBoPhan = new Integer(req.getParameter("cboKhoa").trim());				
			String ho = new String(req.getParameter("txtHo").trim().getBytes("8859_1"),"utf-8");
			String soNha = new String(req.getParameter("txtSoNha").trim().getBytes("8859_1"),"utf-8");
			String tenLot = new String(req.getParameter("txtTenLot").trim().getBytes("8859_1"),"utf-8");
			String duong = new String(req.getParameter("txtDuong").trim().getBytes("8859_1"),"utf-8");
			String ten = new String(req.getParameter("txtTen").trim().getBytes("8859_1"),"utf-8");
			String phuong = new String(req.getParameter("txtPhuong").trim().getBytes("8859_1"),"utf-8");
			String ngaySinh = new String(req.getParameter("txtNgaySinh").trim().getBytes("8859_1"),"utf-8");
			String quan = new String(req.getParameter("txtQuan").trim().getBytes("8859_1"),"utf-8");
			String email = new String(req.getParameter("txtEmail").trim().getBytes("8859_1"),"utf-8");
			String thanhPho = new String(req.getParameter("txtThanhPho").trim().getBytes("8859_1"),"utf-8");
			String cmnd = new String(req.getParameter("txtCMND").trim().getBytes("8859_1"),"utf-8");
			String dtNha = new String(req.getParameter("txtDienThoaiNha").trim().getBytes("8859_1"),"utf-8");
			String dtdd = new String(req.getParameter("txtDienThoaiDD").trim().getBytes("8859_1"),"utf-8");
			String hoTenKhaiSinh = new String(req.getParameter("HoTenKhaiSinh").trim().getBytes("8859_1"),"utf-8");
			int gioiTinh = new Integer(req.getParameter("Sex"));
			String tenThuongGoi = new String(req.getParameter("TenThuongGoi").trim().getBytes("8859_1"),"utf-8");
			String noiSinh = new String(req.getParameter("NoiSinh").trim().getBytes("8859_1"),"utf-8");
			String queQuan = new String(req.getParameter("QueQuan").trim().getBytes("8859_1"),"utf-8");
			String noiDangKyThuongTru = new String(req.getParameter("NoiDangKyThuongTru").trim().getBytes("8859_1"),"utf-8");
			String danToc = new String(req.getParameter("DanToc").trim().getBytes("8859_1"),"utf-8");
			String tonGiao = new String(req.getParameter("TonGiao").trim().getBytes("8859_1"),"utf-8");
			String trinhDoHocVanTruocKhiVaoHoc = new String(req.getParameter("TrinhDoHocVanTruocKhiVaoHoc").trim().getBytes("8859_1"),"utf-8");
			String ngayThamGiaDang = new String(req.getParameter("NgayThamGiaDang").trim().getBytes("8859_1"),"utf-8");
			String ngayChinhThuc = new String(req.getParameter("NgayChinhThuc").trim().getBytes("8859_1"),"utf-8");
			String ngayKetNapDoan = new String(req.getParameter("NgayKetNapDoan").trim().getBytes("8859_1"),"utf-8");
			
			String hoTenBo = new String(req.getParameter("HoTenBo").trim().getBytes("8859_1"),"utf-8");			
			String ngheNghiepBo = new String(req.getParameter("NgheNghiepBo").trim().getBytes("8859_1"),"utf-8");
			String hoTenMe = new String(req.getParameter("HoTenMe").trim().getBytes("8859_1"),"utf-8");
			String ngheNghiepMe = new String(req.getParameter("NgheNghiepMe").trim().getBytes("8859_1"),"utf-8");
			String hoTenVoChong = new String(req.getParameter("HoTenVoChong").trim().getBytes("8859_1"),"utf-8");
			String ngheNghiepVoChong = new String(req.getParameter("NgheNghiepVoChong").trim().getBytes("8859_1"),"utf-8");
			String doiTuongThuocDienChinhSach = new String(req.getParameter("DoiTuongThuocDienChinhSach").trim().getBytes("8859_1"),"utf-8");
			String ngheNghiepLamTruocKhiVaoHoc = new String(req.getParameter("NgheNghiepLamTruocKhiVaoHoc").trim().getBytes("8859_1"),"utf-8");			
			String nguyenVong = new String(req.getParameter("NguyenVong").trim().getBytes("8859_1"),"utf-8");
			String loaiBang = new String(req.getParameter("txtLoaiBang").trim().getBytes("8859_1"),"utf-8");
			String truongCap = new String(req.getParameter("txtTruongCap").trim().getBytes("8859_1"),"utf-8");
			String loaiTotNghiep = new String(req.getParameter("txtLoaiTotNghiep").trim().getBytes("8859_1"),"utf-8");
			
			System.out.println("-----------------------------------------------------");
			System.out.println(tenDangNhap+","+ matKhau+","+ maVaiTro+","+ maBoPhan+","+ soTaiKhoan+","+ nganHang+","+ ngayLapThe+","+ soNha+","+ duong+","+ phuong+","+ quan+","+ thanhPho+","+ dtNha+","+ loaiBang+","+ truongCap+","+ loaiTotNghiep+","+ ho+","+ tenLot+","+ ten+","+ ngaySinh+","+ email+","+ dtdd+","+ cmnd+","+ hoTenKhaiSinh+","+ tenThuongGoi+","+ queQuan+","+ danToc+","+ trinhDoHocVanTruocKhiVaoHoc+","+ ngayChinhThuc+","+ hoTenBo+","+ ngheNghiepBo+","+ hoTenMe+","+ ngheNghiepMe+","+ hoTenVoChong+","+ ngheNghiepVoChong+","+ doiTuongThuocDienChinhSach+","+ ngheNghiepLamTruocKhiVaoHoc+","+ nguyenVong+","+ gioiTinh+","+ noiSinh+","+ noiDangKyThuongTru+","+ tonGiao+","+ ngayThamGiaDang+","+ ngayKetNapDoan);
			ThanhVienDAO d = new ThanhVienDAO();
			boolean bo = d.themSoLuocLyLich(tenDangNhap, matKhau, maVaiTro, maBoPhan, soTaiKhoan, nganHang, ngayLapThe, soNha, duong, phuong, quan, thanhPho, dtNha, loaiBang, truongCap, loaiTotNghiep, ho, tenLot, ten, ngaySinh, email, dtdd, cmnd, hoTenKhaiSinh, tenThuongGoi, queQuan, danToc, trinhDoHocVanTruocKhiVaoHoc, ngayChinhThuc, hoTenBo, ngheNghiepBo, hoTenMe, ngheNghiepMe, hoTenVoChong, ngheNghiepVoChong, doiTuongThuocDienChinhSach, ngheNghiepLamTruocKhiVaoHoc, nguyenVong, gioiTinh, noiSinh, noiDangKyThuongTru, tonGiao, ngayThamGiaDang, ngayKetNapDoan);
			if(bo == false)
			{
				req.setAttribute("err", "err");				
			}
			else if(bo == true)
			{
				req.setAttribute("err", "good");
			}
			RequestDispatcher r = req.getRequestDispatcher("/QuanLySinhVien/SoLuocLyLich.jsp");
			r.forward(req, resp);
		}
	}
	
	
	
}
