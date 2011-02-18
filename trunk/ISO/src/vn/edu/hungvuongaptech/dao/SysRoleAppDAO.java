/**
 * 
 */
package vn.edu.hungvuongaptech.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.model.SysRoleAppModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

/**
 * @author ThienVD
 *
 */
public class SysRoleAppDAO {
	public static ArrayList<SysRoleAppModel> findSysRoleApp(String roleID) {
		ArrayList<SysRoleAppModel> sysRoleAppModelList = new ArrayList<SysRoleAppModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getSysRoleAppByRoleID"));
			preparedStatement.setString(1, roleID);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				SysRoleAppModel sysRoleAppModel = new SysRoleAppModel();
				
				sysRoleAppModel.setRoleID(rs.getString("RoleID"));
				sysRoleAppModel.setAppID(rs.getString("AppID"));
				sysRoleAppModel.setAppName(rs.getString("AppName"));
				sysRoleAppModel.setAppLink(rs.getString("AppLink"));
				sysRoleAppModel.setAppImage(rs.getString("AppImage"));
				sysRoleAppModel.setUser1(rs.getString("User1"));
				sysRoleAppModel.setUser2(rs.getString("User2"));							
				sysRoleAppModel.setUser3(rs.getString("User3"));
				sysRoleAppModel.setUser4(rs.getString("User4"));
				sysRoleAppModel.setUser5(rs.getString("User5"));
				
				sysRoleAppModelList.add(sysRoleAppModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sysRoleAppModelList;
	}
	
	public static SysRoleAppModel getFirstSysApp() {
		SysRoleAppModel sysRoleAppModel = new SysRoleAppModel();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getFirstSysApp"));						
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
		
				sysRoleAppModel.setAppID(rs.getString("ID"));
				sysRoleAppModel.setAppName(rs.getString("App_Name"));
				sysRoleAppModel.setAppLink(rs.getString("App_link"));
				sysRoleAppModel.setAppImage(rs.getString("images"));
				sysRoleAppModel.setUser1(rs.getString("User1"));
				sysRoleAppModel.setUser2(rs.getString("User2"));							
				sysRoleAppModel.setUser3(rs.getString("User3"));
				sysRoleAppModel.setUser4(rs.getString("User4"));
				sysRoleAppModel.setUser5(rs.getString("User5"));
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sysRoleAppModel;
	}
	
	
	public static ArrayList<SysRoleAppModel> getAllSysApp() {
		ArrayList<SysRoleAppModel> sysRoleAppModelList = new ArrayList<SysRoleAppModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllSysApp"));						
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				SysRoleAppModel sysRoleAppModel = new SysRoleAppModel();
								
				sysRoleAppModel.setAppID(rs.getString("ID"));
				sysRoleAppModel.setAppName(rs.getString("App_Name"));
				sysRoleAppModel.setAppLink(rs.getString("App_link"));
				sysRoleAppModel.setAppImage(rs.getString("images"));
				sysRoleAppModel.setUser1(rs.getString("User1"));
				sysRoleAppModel.setUser2(rs.getString("User2"));							
				sysRoleAppModel.setUser3(rs.getString("User3"));
				sysRoleAppModel.setUser4(rs.getString("User4"));
				sysRoleAppModel.setUser5(rs.getString("User5"));
				
				sysRoleAppModelList.add(sysRoleAppModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sysRoleAppModelList;
	}
	
	public static SysRoleAppModel getSysAppByAppID(String appID) {
		SysRoleAppModel sysRoleAppModel = new SysRoleAppModel();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getSysAppByAppID"));						
			preparedStatement.setString(1, appID);			
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				sysRoleAppModel.setAppID(rs.getString("ID"));
				sysRoleAppModel.setAppName(rs.getString("App_Name"));
				sysRoleAppModel.setAppLink(rs.getString("App_link"));
				sysRoleAppModel.setAppImage(rs.getString("images"));
				sysRoleAppModel.setUser1(rs.getString("User1"));
				sysRoleAppModel.setUser2(rs.getString("User2"));							
				sysRoleAppModel.setUser3(rs.getString("User3"));
				sysRoleAppModel.setUser4(rs.getString("User4"));
				sysRoleAppModel.setUser5(rs.getString("User5"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sysRoleAppModel;
	}

	
	public static boolean updateSysApp(SysRoleAppModel sysRoleApp)
	{
		try{
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.updateSysApp"));
			preparedStatement.setNString(1,StringUtil.toUTF8(StringUtil.toTrim(sysRoleApp.getAppName())));

			preparedStatement.setNString(2,sysRoleApp.getAppLink());

			preparedStatement.setNString(3,sysRoleApp.getAppImage());

			preparedStatement.setNString(4,sysRoleApp.getAppID());
			
			if(preparedStatement.executeUpdate()==1)
				return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return false;
	}

	public static boolean insertSysApp(SysRoleAppModel sysRoleApp)
	{
		
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_InsertSysApp(?,?,?,?,?,?,?,?)}");
			csmt.setString("app_name", StringUtil.toUTF8(StringUtil.toTrim(sysRoleApp.getAppName())));
			csmt.setString("app_link", sysRoleApp.getAppLink());
			csmt.setString("images", sysRoleApp.getAppImage());
			csmt.setString("user1", sysRoleApp.getUser1());
			csmt.setString("user2", sysRoleApp.getUser2());
			csmt.setString("user3", sysRoleApp.getUser3());
			csmt.setString("user4", sysRoleApp.getUser4());
			csmt.setString("user5", sysRoleApp.getUser5() );
			
			result = DataUtil.executeNonStore(csmt);								
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}				
		return result;
	}

	public static ArrayList<VaiTroModel> getVaiTroDaPhanQuyen(String appID) {
		ArrayList<VaiTroModel> vaiTroModelList = new ArrayList<VaiTroModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getVaiTroDaPhanQuyen"));
			preparedStatement.setString(1, appID);			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				VaiTroModel vaiTroModel=new VaiTroModel();
				vaiTroModel.setMaVaiTro(rs.getString("RoleID"));
				vaiTroModel.setTenVaiTro(rs.getString("Ten_vai_tro"));
				vaiTroModelList.add(vaiTroModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vaiTroModelList;
	}
	
	public static ArrayList<VaiTroModel> getVaiTroChuaPhanQuyen(String appID) {
		ArrayList<VaiTroModel> vaiTroModelList = new ArrayList<VaiTroModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getVaiTroChuaPhanQuyen"));
			preparedStatement.setString(1, appID);			
			ResultSet rs = preparedStatement.executeQuery();
			VaiTroModel vaiTroModel;
			while (rs.next()) {
				vaiTroModel=new VaiTroModel();
				vaiTroModel.setMaVaiTro(rs.getString("ID"));
				vaiTroModel.setTenVaiTro(rs.getString("Ten_vai_tro"));
				vaiTroModelList.add(vaiTroModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vaiTroModelList;
	}

	
	public static boolean insertSysRoleApp(SysRoleAppModel sysRoleApp)
	{
		
		Boolean result = false;		
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.insertSysRoleApp"));
			preparedStatement.setNString(1,sysRoleApp.getRoleID());

			preparedStatement.setNString(2,sysRoleApp.getAppID());

			preparedStatement.setNString(3,sysRoleApp.getUser1());
			preparedStatement.setNString(4,sysRoleApp.getUser2());
			preparedStatement.setNString(5,sysRoleApp.getUser3());
			preparedStatement.setNString(6,sysRoleApp.getUser4());
			preparedStatement.setNString(7,sysRoleApp.getUser5());
			
			if(preparedStatement.executeUpdate()==1)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}				
		return result;
	}
	
	public static boolean deleteSysRoleAppBy(String roleID,String appID)
	{
		
		Boolean result = false;		
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.deleteRoleSysApp"));
			preparedStatement.setNString(1,roleID);

			preparedStatement.setNString(2,appID);

			
			if(preparedStatement.executeUpdate()==1)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}				
		return result;
	}

}
