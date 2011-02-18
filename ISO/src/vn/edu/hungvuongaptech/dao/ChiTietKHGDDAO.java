package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.ChiTietKHGDModel;
import vn.edu.hungvuongaptech.model.TuanLeModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.DateUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

public class ChiTietKHGDDAO {
	
	public static Boolean insertChiTietKHGD(ChiTietKHGDModel chiTietKHGDModel){
		Boolean result = false;	
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_InsertChiTietKHGD(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");		
			csmt.registerOutParameter("ID",java.sql.Types.INTEGER);
			csmt.setString("maKHGD", chiTietKHGDModel.getMaKHGD());
			csmt.setNString("tenChuong", chiTietKHGDModel.getTenChuong());
			csmt.setNString("noiDungTH", chiTietKHGDModel.getNoiDungTH());
			csmt.setNString("congViecChuanBi", chiTietKHGDModel.getCongViecChuanBi());
			csmt.setString("coHieu", chiTietKHGDModel.getCoHieu());
			csmt.setString("tuan", chiTietKHGDModel.getTuan());
			csmt.setString("ngayBD",chiTietKHGDModel.getNgayBD());
			csmt.setString("ngayKT",chiTietKHGDModel.getNgayKT());
			csmt.setString("ngayCapNhatCuoi", DateUtil.setDate(chiTietKHGDModel.getNgayCapNhatCuoi()));
			csmt.setString("maGiaoAn", null);
			csmt.setString("nhom",chiTietKHGDModel.getNhom());
			csmt.setString("sTTNoiDung",chiTietKHGDModel.getsTTNoiDung());
			csmt.setString("Thu",chiTietKHGDModel.getThu());
			csmt.setString("Buoi", chiTietKHGDModel.getBuoi());
			csmt.setString("Ten_phong",chiTietKHGDModel.getPhong());
			csmt.setNString("Muc_Tieu_Bai_Hoc",chiTietKHGDModel.getMucTieuBaiHoc());
			csmt.setString("User1", chiTietKHGDModel.getUser1());
			csmt.setString("User2", chiTietKHGDModel.getUser2());
			csmt.setString("User3",chiTietKHGDModel.getUser3() );
			csmt.setString("User4",chiTietKHGDModel.getUser4());
			csmt.setString("User5",chiTietKHGDModel.getUser5());
			
			result = DataUtil.executeNonStore(csmt);
			if (result) {
				String id = csmt.getString("ID");
				chiTietKHGDModel.setMaChiTietKHGD(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return result;
	}
	
	public static Boolean updateChiTietKHGD(ChiTietKHGDModel chiTietKHGDModel){
		Boolean result = false;	
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
					.prepareCall("{call sp_ISO_UpdateChiTietKHGD(?,?,?,?,?,?)}");		
			csmt.setString("ID", chiTietKHGDModel.getMaChiTietKHGD());
			csmt.setNString("congViecChuanBi", chiTietKHGDModel.getCongViecChuanBi());
			csmt.setNString("noiDungTH", chiTietKHGDModel.getNoiDungTH());
			csmt.setString("ngayCapNhatCuoi", chiTietKHGDModel.getNgayCapNhatCuoi());
			csmt.setString("User1", chiTietKHGDModel.getUser1());
			csmt.setString("User2", chiTietKHGDModel.getUser2());
			result = DataUtil.executeNonStore(csmt);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return result;
	}
	
	public static ArrayList<ChiTietKHGDModel> getChiTietKHGDByMaKHGD(String maKHGD) {
		ArrayList<ChiTietKHGDModel> chiTietKHGDModelList = new ArrayList<ChiTietKHGDModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
						.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllChiTietKHGDByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ChiTietKHGDModel chiTietKHGDModel = new ChiTietKHGDModel();
				chiTietKHGDModel.setMaChiTietKHGD(rs.getString("MaChiTietKHGD"));
				chiTietKHGDModel.setMaKHGD(rs.getString("MaKHGD"));
				chiTietKHGDModel.setTenChuong(rs.getNString("TenChuong"));
				chiTietKHGDModel.setNoiDungTH(rs.getNString("NoiDungTH"));
				chiTietKHGDModel.setCongViecChuanBi(rs.getNString("CongViecChuanBi"));
				chiTietKHGDModel.setCoHieu(rs.getString("CoHieu"));
				chiTietKHGDModel.setTuan(rs.getString("Tuan"));
				chiTietKHGDModel.setNgayBD(DateUtil.setDate2(rs.getString("NgayBD")));
				chiTietKHGDModel.setNgayCapNhatCuoi(rs.getString("NgayCapNhatCuoi"));
				chiTietKHGDModel.setMaGiaoAn(rs.getString("MaGiaoAn"));
				chiTietKHGDModelList.add(chiTietKHGDModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietKHGDModelList;
	}
	
	public static ArrayList<ChiTietKHGDModel> getChiTietKHGDByMaKHGDGroupByTuan(String maKHGD) {
		ArrayList<ChiTietKHGDModel> chiTietKHGDModelList = new ArrayList<ChiTietKHGDModel>();
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllChiTietKHGDByMaKHGDGroupByTuan"));
			preparedStatement.setString(1, maKHGD);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				ChiTietKHGDModel chiTietKHGDModel = new ChiTietKHGDModel();
				chiTietKHGDModel.setMaKHGD(rs.getString("MaKHGD"));
				chiTietKHGDModel.setTuan(rs.getString("Tuan"));
				chiTietKHGDModel.setNgayBD(rs.getString("NgayBD"));
				chiTietKHGDModel.setNgayKT(rs.getString("NgayKT"));
				chiTietKHGDModelList.add(chiTietKHGDModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietKHGDModelList;
	}
	
	public static ArrayList<ChiTietKHGDModel> getAllChiTietKHGDByMaKHGD(String maKHGD) {
		ArrayList<ChiTietKHGDModel> chiTietKHGDModelList = new ArrayList<ChiTietKHGDModel>();
		int count = 0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetAllChiTietKHGDByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				ChiTietKHGDModel chiTietKHGDModel = new ChiTietKHGDModel();
				chiTietKHGDModel.setMaChiTietKHGD(rs.getString("MaChiTietKHGD"));
				chiTietKHGDModel.setMaKHGD(rs.getString("MaKHGD"));
				chiTietKHGDModel.setTenChuong(rs.getNString("TenChuong"));
				chiTietKHGDModel.setNoiDungTH(rs.getNString("NoiDungTH"));
				chiTietKHGDModel.setCongViecChuanBi(rs.getNString("CongViecChuanBi"));
				chiTietKHGDModel.setCoHieu(rs.getString("CoHieu"));
				chiTietKHGDModel.setTuan(rs.getString("Tuan"));
				chiTietKHGDModel.setNgayBD(DateUtil.setDate2(rs.getString("NgayBD")));
				
				chiTietKHGDModel.setMaGiaoAn(rs.getString("MaGiaoAn"));
				chiTietKHGDModel.setTinhTrangGiaoAn(null);
				chiTietKHGDModel.setsTTNoiDung(rs.getString("STTNoiDung"));
				chiTietKHGDModel.setNhom(rs.getString("Nhom"));
				chiTietKHGDModel.setThu(rs.getString("Thu"));
				chiTietKHGDModel.setBuoi(rs.getNString("Buoi"));
				chiTietKHGDModel.setPhong(rs.getString("TenPhong"));
			
				
				chiTietKHGDModelList.add(chiTietKHGDModel);
				count++;
			}
			for(int i=0;i<count;i++) {
				chiTietKHGDModelList.get(i).setTinhTrangGiaoAn(GiaoAnDAO.getTinhTrangGiaoAnByMaGA(chiTietKHGDModelList.get(i).getMaGiaoAn()) + "");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietKHGDModelList;
	}
	
	public static ChiTietKHGDModel getChiTietKHGDByByMaCTKHGD(String maCTKHGD) {
		ChiTietKHGDModel chiTietKHGDModel = new ChiTietKHGDModel();
		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetChiTietKHGDByMaCTKHGD"));
			preparedStatement.setString(1, maCTKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				chiTietKHGDModel.setMaChiTietKHGD(rs.getString("MaChiTietKHGD"));
				chiTietKHGDModel.setMaKHGD(rs.getString("MaKHGD"));
				chiTietKHGDModel.setTenChuong(rs.getNString("TenChuong"));
				chiTietKHGDModel.setNoiDungTH(rs.getNString("NoiDungTH"));
				chiTietKHGDModel.setCongViecChuanBi(rs.getNString("CongViecChuanBi"));
				chiTietKHGDModel.setCoHieu(rs.getString("CoHieu"));
				chiTietKHGDModel.setTuan(rs.getString("Tuan"));
				chiTietKHGDModel.setNgayBD(rs.getString("NgayBD"));
				chiTietKHGDModel.setNgayKT(rs.getString("NgayKT"));
				chiTietKHGDModel.setMaGiaoAn(rs.getString("MaGiaoAn"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chiTietKHGDModel;
	}
	
	public static ArrayList<String> getListTenChuongByMaCTKHGD(String maCTKHGD){
		
		ChiTietKHGDModel chiTietKHGDModel = ChiTietKHGDDAO.getChiTietKHGDByByMaCTKHGD(maCTKHGD);
		String[] listChuong=null;
		if(chiTietKHGDModel.getCoHieu().equals(Constant.COHIEULT))
			listChuong=chiTietKHGDModel.getTenChuong().split("\r\n");
		else if(chiTietKHGDModel.getCoHieu().equals(Constant.COHIEUTH))
			listChuong=chiTietKHGDModel.getNoiDungTH().split("\r\n");
		else if(!chiTietKHGDModel.getCoHieu().equals(Constant.COHIEUTH)&&!chiTietKHGDModel.getCoHieu().equals(Constant.COHIEULT))
			listChuong=chiTietKHGDModel.getTenChuong().split("\r\n");
				
					
		String tenChuong="";
		
		for(int i=0;i<listChuong.length;i++)
		{
			if(i==0)
				tenChuong=listChuong[i];
			else
				tenChuong+=" "+listChuong[i];
		}
		
		ArrayList<String> lstTenChuong=new ArrayList<String>();	
		int i=0;
		
		while(i<tenChuong.length())
        {
            if(StringUtil.isNumber(tenChuong.charAt(i)))
            {
                i++;
                while(i<tenChuong.length()&&StringUtil.isNumber(tenChuong.charAt(i)))
                {
                    i++;
                }

                if (i<tenChuong.length()&&tenChuong.charAt(i) == '/')
                {
                    i++;
                    String temp = "";
                    Boolean a = true;
                    while (i < tenChuong.length() && a == true)
                    {
                        if (StringUtil.isNumber(tenChuong.charAt(i)))
                        {
                            int k = i;
                            i++;
                            while (i <tenChuong.length() &&StringUtil.isNumber(tenChuong.charAt(i)))
                            {
                                i++;
                            }

                            if (i < tenChuong.length() && tenChuong.charAt(i) == '.')
                            {
                                a = false;
                            }
                            else if(i < tenChuong.length() && tenChuong.charAt(i) == '/')
                            {
                                a = false;
                                i = k-2;
                            }
                            else
                            {
                                while (k < i)
                                {
                                    temp += tenChuong.charAt(k);
                                    k++;
                                }
                            }
                        }
                        else
                        {
                            temp += tenChuong.charAt(i);
                        }
                        i++;
                    }
                    if (temp != "")
                        lstTenChuong.add(temp);
                }
                
            }

            i++;
        }
		
		return lstTenChuong;
	}		
	
	public static Boolean updateMaGiaoAnByMaCTKHGD(String maCTKHGD){
		Boolean result=false;
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_ISO_UpdateMaGiaoAnByMaCTKHGD(?,?)}");
			csmt.registerOutParameter("stt",java.sql.Types.INTEGER);	
			csmt.setNString("MaCTKHGD", maCTKHGD);
			result = DataUtil.executeNonStore(csmt);
			
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
				
		return result;
	}
	
	public static String getMaGiaoAnByMaCTKHGD(String maCTKHGD) {
		
		String maGiaoAn="";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetMaGiaoAnByMaCTKHGD"));
			preparedStatement.setString(1, maCTKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				maGiaoAn=rs.getString("Ma_giao_an");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return maGiaoAn;
	}
	
	public static String getMaKHGDByMaCTKHGD(String maCTKHGD) {
		
		String maKHGD="";
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.GetMaKHGDByMaCTKHGD"));
			preparedStatement.setString(1, maCTKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				maKHGD=rs.getString("MaKHGD");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return maKHGD;
	}
	
	public static Boolean isMaCTKHGD(String maCTKHGD){
		Boolean result=false;
		int count=0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.IsMaCTKHGD"));
			preparedStatement.setString(1, maCTKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				count=rs.getInt("COUNT");	
			}
			if(count>0)
				result=true;
		
		} catch (SQLException e) {
			e.printStackTrace();
			result=false;
		}
		
		return result;
	}

	public static int getTotalChiTietKHGDByMaKHGD(String maKHGD){
		int count=0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTotalChiTietKHGDByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				count=rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public static String getBlockTenChuong(ArrayList<String> tenChuongList)
	{
		String tenChuong="";
		for(int i=0;i<tenChuongList.size();i++)
		{
			tenChuong=tenChuong+(i+1)+"/"+tenChuongList.get(i)+"<br/>";
		}
		return tenChuong;
	}
		
	public static ArrayList<Integer> getSoLanLapSoTuanByMaKHGD(String maKHGD){
		ArrayList<Integer> tuan=new ArrayList<Integer>();
		String sttTuan="-1";
		int so=0;
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getTuanByMaKHGD"));
			preparedStatement.setString(1, maKHGD);
			ResultSet rs = preparedStatement.executeQuery();
			
			if(rs.next()){
				sttTuan=rs.getString("Tuan");
				so++;
			}
			while(rs.next()){
				if(!sttTuan.equals(rs.getString("Tuan"))){
					sttTuan=rs.getString("Tuan");
					tuan.add(so);
					so=0;
				}
				so++;
			}
			
			if(so!=0)
				tuan.add(so);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tuan;
	}

	public static ArrayList<TuanLeModel> getTuanByMaKHGD(String maKHGD)
	{
		ArrayList<TuanLeModel> tuanList=new ArrayList<TuanLeModel>();
		
		ArrayList<ChiTietKHGDModel> chiTietKHGDList=getAllChiTietKHGDByMaKHGD(maKHGD);
		
		int i=0;
		String tempTuan="-1";
		TuanLeModel tuanModel;
		do{

			tuanModel=new TuanLeModel();
			if(!tempTuan.equals(chiTietKHGDList.get(i).getTuan()))
			{
				tempTuan=chiTietKHGDList.get(i).getTuan();
				tuanModel.setMaTuanLe(tempTuan);
				tuanModel.setTuNgay(chiTietKHGDList.get(i).getNgayBD());
				
				while(i<chiTietKHGDList.size()&&tempTuan.equals(chiTietKHGDList.get(i).getTuan())){
					i++;
				}
				i--;
				tuanModel.setDenNgay(DateUtil.setDate2(DateUtil.addDate("0",DateUtil.setDate(chiTietKHGDList.get(i).getNgayBD()))));
				tuanList.add(tuanModel);
			}
			
			
			i++;
		}
		while(i<chiTietKHGDList.size());
				
		return tuanList;
	}

	public static ArrayList<ArrayList<ChiTietKHGDModel>> getGroupNoiDungChiTietKHGDByMaKHGD(String maKHGD)
	{
		ArrayList<ArrayList<ChiTietKHGDModel>> arrayList=new ArrayList<ArrayList<ChiTietKHGDModel>>();
		ArrayList<ChiTietKHGDModel> chiTietList1=getAllChiTietKHGDByMaKHGD(maKHGD);
		ArrayList<ChiTietKHGDModel> chiTietList2=new ArrayList<ChiTietKHGDModel>();
		
		int i=0;
		String tempTuan="-1";
		do{
			tempTuan=chiTietList1.get(i).getTuan();

			String tempSTTND="-1";
			String coHieu="-1";
			chiTietList2=new ArrayList<ChiTietKHGDModel>();
			while(i<chiTietList1.size()&&tempTuan.equals(chiTietList1.get(i).getTuan()))
			{
				if(!tempSTTND.equals(chiTietList1.get(i).getsTTNoiDung())){
					chiTietList2.add(chiTietList1.get(i));
					tempSTTND=chiTietList1.get(i).getsTTNoiDung();
					coHieu=chiTietList1.get(i).getCoHieu();
				}
				else if(tempSTTND.equals(chiTietList1.get(i).getsTTNoiDung())&&!coHieu.equals(chiTietList1.get(i).getCoHieu())){
					chiTietList2.add(chiTietList1.get(i));
					tempSTTND=chiTietList1.get(i).getsTTNoiDung();
					coHieu=chiTietList1.get(i).getCoHieu();
				}
				
				i++;
			}
			arrayList.add(chiTietList2);
			
		}
		while(i<chiTietList1.size());
		
		
		return arrayList;
	}
	
	public static ArrayList<ArrayList<ArrayList<ChiTietKHGDModel>>> getGroupNhomChiTietKHGDByMaKHGD(String maKHGD)
	{
		ArrayList<ArrayList<ArrayList<ChiTietKHGDModel>>> arrayArrayList=new ArrayList<ArrayList<ArrayList<ChiTietKHGDModel>>>();
		ArrayList<ChiTietKHGDModel> chiTietList1=getAllChiTietKHGDByMaKHGD(maKHGD);
		ArrayList<ChiTietKHGDModel> chiTietList2=new ArrayList<ChiTietKHGDModel>();
		ArrayList<ArrayList<ChiTietKHGDModel>> arrayList=new ArrayList<ArrayList<ChiTietKHGDModel>>();
		
		int i=0;
		String tempTuan="-1";
		do{
			tempTuan=chiTietList1.get(i).getTuan();

			String tempSTTND="-1";
			chiTietList2=new ArrayList<ChiTietKHGDModel>();

			arrayList=new ArrayList<ArrayList<ChiTietKHGDModel>>();
			while(i<chiTietList1.size()&&tempTuan.equals(chiTietList1.get(i).getTuan())){
				
				tempSTTND=chiTietList1.get(i).getsTTNoiDung();
				chiTietList2=new ArrayList<ChiTietKHGDModel>();
				String tempNhom="-1";
				String coHieu=chiTietList1.get(i).getCoHieu();
				while(i<chiTietList1.size()&&tempTuan.equals(chiTietList1.get(i).getTuan())&&tempSTTND.equals(chiTietList1.get(i).getsTTNoiDung())&&coHieu.equals(chiTietList1.get(i).getCoHieu())){
					
					if(!tempNhom.equals(chiTietList1.get(i).getNhom())){
						chiTietList2.add(chiTietList1.get(i));
						tempNhom=chiTietList1.get(i).getNhom();
						coHieu=chiTietList1.get(i).getCoHieu();
					}
					i++;
				}

				arrayList.add(chiTietList2);
			}
			arrayArrayList.add(arrayList);
			
		}
		while(i<chiTietList1.size());
		
		
		return arrayArrayList;
	}
	
}
