package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.NhaCungCapModel;
import vn.edu.hungvuongaptech.util.DataUtil;


public class NhaCungCapDAO {
	public NhaCungCapDAO(){	}
	
	
	public static ArrayList<NhaCungCapModel> getAllNhaCungCapByTen(int indexStart,int total,String ten)
	{
		ArrayList<NhaCungCapModel> nhaCungCapListModel=new ArrayList<NhaCungCapModel>();
		int rsTotalPage=0;

		if (indexStart > 1)
         {			 
	         indexStart = (indexStart * total) - (total -1);
	         rsTotalPage=total+indexStart-1;	         
         }
		 else if (indexStart == 1)
             rsTotalPage=total;

		try {

			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetNhaCungCapByTen(?,?,?)}");
			csmt.setInt("IndexStart",indexStart);
			csmt.setInt("Total",rsTotalPage);
			csmt.setNString("Ten","%"+ten+"%");
			
			ResultSet rs = DataUtil.executeStore(csmt);

			NhaCungCapModel nhaCungCapModel;
			while(rs.next())
			{
				nhaCungCapModel=new NhaCungCapModel();
				nhaCungCapModel.setSTT(indexStart+"");
				nhaCungCapModel.setMaNhaCungCap(rs.getString("ID"));
				nhaCungCapModel.setDiaChi(rs.getNString("Dia_Chi"));
				nhaCungCapModel.setDienThoai(rs.getString("Dien_thoai"));
				nhaCungCapModel.setEmail(rs.getString("Email"));
				nhaCungCapModel.setGhiChu(rs.getNString("ghi_chu"));
				nhaCungCapModel.setTaiKhoan(TaiKhoanDAO.getTaiKhoanByMaTaiKhoan(rs.getString("Ma_tai_khoan")));
				nhaCungCapModel.setNgayCapNhatCuoi(rs.getString("Ngay_cap_nhat_cuoi"));
				nhaCungCapModel.setTen(rs.getNString("Ten"));
				nhaCungCapModel.setUser1(rs.getString("User1"));
				nhaCungCapModel.setUser2(rs.getString("User2"));
				nhaCungCapModel.setUser3(rs.getString("user3"));
				nhaCungCapModel.setUser4(rs.getString("User4"));
				nhaCungCapModel.setUser5(rs.getString("User5"));
				nhaCungCapListModel.add(nhaCungCapModel);
				indexStart++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return nhaCungCapListModel;
	}
	
	public static ArrayList<NhaCungCapModel> showAllNhaCungCap() {
		ArrayList<NhaCungCapModel> listKetQua = new ArrayList<NhaCungCapModel>();
		try {
			PreparedStatement preparedStatement = DataUtil.getConnection()
					.prepareStatement(
							Constant.SQL_RES.getString("QLTB.sql.getAllNhaCungCap"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				NhaCungCapModel nhaCungCapModel = new NhaCungCapModel();
				nhaCungCapModel.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
				nhaCungCapModel.setTen(rs.getString("TenNhaCungCap"));

				listKetQua.add(nhaCungCapModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listKetQua;
	}
	
	public static int getTotalNhaCungCapByTen(String ten)
	{
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_GetTotalNhaCungCapByTen(?)}");
			
			csmt.setNString("Ten","%"+ten+"%");
			
			ResultSet rs = DataUtil.executeStore(csmt);
			
			while(rs.next())
			{
				return rs.getInt("Total"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

		return 0;
	}
	
	public static ArrayList<String> showNumPage(int i,int total,String tenFile)
	{
		String str="";
		ArrayList<String> strList=new ArrayList<String>();
		int j=i;
         if (i > 1)
             i = i - 1;
         
         
             while (i <= (total) / Constant.NUM_RECORD_QLTB)
             {
            	 if(i==j)
            		 str="<a href='"+tenFile+"?index=" + i + "' style='color:blue;background-color:yellow;text-decoration:none'>"+i+"</a>";
            	 else
            		 str="<a href='"+tenFile+"?index=" + i + "' style='color:blue;text-decoration:none'>"+i+"</a>";
                 strList.add(str);                 
            	 i++;
             }
             if ( total % Constant.NUM_RECORD_QLTB != 0 && total > Constant.NUM_RECORD_QLTB)
             {
            	 if(i==j)
            		 str="<a href='"+tenFile+"?index=" + i + "' style='color:blue;background-color:yellow;text-decoration:none'>"+i+"</a>";
            	 else
            		 str="<a href='"+tenFile+"?index=" + i + "' style='color:blue;text-decoration:none'>"+i+"</a>";
                 strList.add(str);
             }

		return strList;
	}
	
	public static Boolean insertNhaCungCap(NhaCungCapModel nhaCungCapModel){
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_InsertNhaCungCap(?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setNString("Ten",nhaCungCapModel.getTen());
			csmt.setNString("Dia_chi",nhaCungCapModel.getDiaChi());
			csmt.setString("Dien_thoai",nhaCungCapModel.getDienThoai());
			csmt.setString("Email",nhaCungCapModel.getEmail());
			csmt.setString("Ma_tai_khoan",nhaCungCapModel.getTaiKhoan().getMaTaiKhoan());
			csmt.setNString("Ghi_chu",nhaCungCapModel.getGhiChu());
			csmt.setString("User1",nhaCungCapModel.getUser1());
			csmt.setString("User2",nhaCungCapModel.getUser2());
			csmt.setString("User3",nhaCungCapModel.getUser3());
			csmt.setString("User4",nhaCungCapModel.getUser4());
			csmt.setString("User5",nhaCungCapModel.getUser5());
	
			return DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	
	public static Boolean updateNhaCungCapByID(NhaCungCapModel nhaCungCapModel){
		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_UpdateNhaCungCapByID(?,?,?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID",nhaCungCapModel.getMaNhaCungCap());
			csmt.setNString("Ten",nhaCungCapModel.getTen());
			csmt.setNString("Dia_chi",nhaCungCapModel.getDiaChi());
			csmt.setString("Dien_thoai",nhaCungCapModel.getDienThoai());
			csmt.setString("Email",nhaCungCapModel.getEmail());
			csmt.setString("Ma_tai_khoan",nhaCungCapModel.getTaiKhoan().getMaTaiKhoan());
			csmt.setNString("Ghi_chu",nhaCungCapModel.getGhiChu());
			csmt.setString("User1",nhaCungCapModel.getUser1());
			csmt.setString("User2",nhaCungCapModel.getUser2());
			csmt.setString("User3",nhaCungCapModel.getUser3());
			csmt.setString("User4",nhaCungCapModel.getUser4());
			csmt.setString("User5",nhaCungCapModel.getUser5());
	
			return DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static Boolean deleteNhaCungCapByID(String maNhaCungCap){
		Boolean result = false;
		try {
			CallableStatement csmt = DataUtil.getConnection().prepareCall("{sp_QLTB_DeleteNhaCungCapByID(?)}");
			csmt.setString("ID", maNhaCungCap);
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
	return result;
	}
	public static Boolean deleteNhaCungCap(String maNhaCungCap) {
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_QLTB_DeleteNhaCungCap(?)}");
			
			csmt.setString("ID",maNhaCungCap);
			
			result = DataUtil.executeNonStore(csmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return result;
	}
}
