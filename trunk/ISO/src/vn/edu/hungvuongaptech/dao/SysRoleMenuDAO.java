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
import vn.edu.hungvuongaptech.model.SysRoleMenuModel;
import vn.edu.hungvuongaptech.model.VaiTroModel;
import vn.edu.hungvuongaptech.util.DataUtil;
import vn.edu.hungvuongaptech.util.StringUtil;

/**
 * @author ThienVD
 *
 */
public class SysRoleMenuDAO {
	public static ArrayList<SysRoleMenuModel> findSysRoleAppMenu(String boPhanID, String appID) {
		ArrayList<SysRoleMenuModel> sysRoleMenuModelList = new ArrayList<SysRoleMenuModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("iso.sql.getSysRoleMenuByRoleID"));
			preparedStatement.setString(1, boPhanID);	
			preparedStatement.setString(2, appID);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				SysRoleMenuModel sysRoleMenuModel = new SysRoleMenuModel();
				
				sysRoleMenuModel.setRoleID(rs.getString("RoleID"));
				sysRoleMenuModel.setAppID(rs.getString("AppID"));
				sysRoleMenuModel.setMenuID(rs.getString("MenuID"));
				sysRoleMenuModel.setMenuName(rs.getString("MenuName"));
				sysRoleMenuModel.setMenuImage(rs.getString("MenuImage"));
				sysRoleMenuModel.setMenuLink(rs.getString("MenuLink"));
				sysRoleMenuModel.setUser1(rs.getString("User1"));
				sysRoleMenuModel.setUser2(rs.getString("User2"));							
				sysRoleMenuModel.setUser3(rs.getString("User3"));
				sysRoleMenuModel.setUser4(rs.getString("User4"));
				sysRoleMenuModel.setUser5(rs.getString("User5"));
				
				sysRoleMenuModelList.add(sysRoleMenuModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sysRoleMenuModelList;
	}	

	public static ArrayList<SysRoleMenuModel> getAllSysMenuByAppID(String appID) {
		ArrayList<SysRoleMenuModel> sysRoleMenuModelList = new ArrayList<SysRoleMenuModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getAllSysMenu"));						
			preparedStatement.setNString(1,appID);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				SysRoleMenuModel sysRoleAppModel = new SysRoleMenuModel();
								
				sysRoleAppModel.setRoleID(rs.getString("ID"));
				sysRoleAppModel.setAppID(rs.getString("AppID"));
				sysRoleAppModel.setMenuLink(rs.getString("Menu_link"));
				sysRoleAppModel.setMenuImage(rs.getString("images"));
				sysRoleAppModel.setMenuName(rs.getString("Menu_name"));
				sysRoleAppModel.setUser1(rs.getString("User1"));
				sysRoleAppModel.setUser2(rs.getString("User2"));							
				sysRoleAppModel.setUser3(rs.getString("User3"));
				sysRoleAppModel.setUser4(rs.getString("User4"));
				sysRoleAppModel.setUser5(rs.getString("User5"));
				
				sysRoleMenuModelList.add(sysRoleAppModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sysRoleMenuModelList;
	}
	
	public static boolean updateSysMenu(SysRoleMenuModel sysRoleMenu)
	{
		
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_UpdateSysMenu(?,?,?,?,?,?,?,?,?,?)}");
			csmt.setString("ID", sysRoleMenu.getRoleID());
			csmt.setNString("appID", sysRoleMenu.getAppID());
			csmt.setNString("Menu_name", StringUtil.toTrim(StringUtil.toUTF8(sysRoleMenu.getMenuName())));
			csmt.setNString("images", sysRoleMenu.getMenuImage());
			csmt.setNString("Menu_link", sysRoleMenu.getMenuLink());
			csmt.setNString("User1", sysRoleMenu.getUser1());
			csmt.setNString("User2", sysRoleMenu.getUser2());
			csmt.setNString("User3", sysRoleMenu.getUser3());
			csmt.setNString("User4", sysRoleMenu.getUser4());
			csmt.setNString("User5", sysRoleMenu.getUser5() );
			result = DataUtil.executeNonStore(csmt);								
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}				
		return result;
	}
	
	public static boolean insertSysMenu(SysRoleMenuModel sysRoleMenu)
	{
		
		Boolean result = false;		
		try {
			CallableStatement csmt = DataUtil
				.getConnection()
				.prepareCall("{call sp_Admin_InsertSysMenu(?,?,?,?,?,?,?,?,?)}");
			csmt.setNString("appID", sysRoleMenu.getAppID());
			csmt.setNString("Menu_name", StringUtil.toUTF8(StringUtil.toTrim(sysRoleMenu.getMenuName())));
			csmt.setNString("images", sysRoleMenu.getMenuImage());
			csmt.setNString("Menu_link", sysRoleMenu.getMenuLink());
			csmt.setNString("User1", sysRoleMenu.getUser1());
			csmt.setNString("User2", sysRoleMenu.getUser2());
			csmt.setNString("User3", sysRoleMenu.getUser3());
			csmt.setNString("User4", sysRoleMenu.getUser4());
			csmt.setNString("User5", sysRoleMenu.getUser5() );
			result = DataUtil.executeNonStore(csmt);								
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}				
		return result;
	}
	
	public static ArrayList<VaiTroModel> getVaiTroMenuDaPhanQuyen(String menuID) {
		ArrayList<VaiTroModel> vaiTroModelList = new ArrayList<VaiTroModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getVaiTroMenuDaPhanQuyen"));
			preparedStatement.setString(1, menuID);			
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
	
	public static ArrayList<VaiTroModel> getVaiTroMenuChuaPhanQuyen(String menuID) {
		ArrayList<VaiTroModel> vaiTroModelList = new ArrayList<VaiTroModel>();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getVaiTroMenuChuaPhanQuyen"));
			preparedStatement.setString(1, menuID);			
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
	
	public static SysRoleMenuModel getSysMenuByMenuID(String menuID) {
		SysRoleMenuModel sysRoleMenuModel = new SysRoleMenuModel();		
		try {
			PreparedStatement preparedStatement = DataUtil
					.getConnection()
					.prepareStatement(
							Constant.SQL_RES
									.getString("admin.sql.getSysMenuByMenuID"));						
			preparedStatement.setString(1, menuID);			
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				sysRoleMenuModel.setMenuID(rs.getString("ID"));
				sysRoleMenuModel.setAppID(rs.getString("AppID"));
				sysRoleMenuModel.setMenuLink(rs.getString("Menu_link"));
				sysRoleMenuModel.setMenuName(rs.getString("Menu_name"));
				sysRoleMenuModel.setMenuImage(rs.getString("images"));
				sysRoleMenuModel.setUser1(rs.getString("User1"));
				sysRoleMenuModel.setUser2(rs.getString("User2"));							
				sysRoleMenuModel.setUser3(rs.getString("User3"));
				sysRoleMenuModel.setUser4(rs.getString("User4"));
				sysRoleMenuModel.setUser5(rs.getString("User5"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sysRoleMenuModel;
	}
	
	public static boolean insertSysRoleMenu(SysRoleMenuModel sysRoleMenu)
	{
		
		Boolean result = false;		
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.insertSysRoleMenu"));
			
			preparedStatement.setNString(1,sysRoleMenu.getRoleID());
			preparedStatement.setNString(2,sysRoleMenu.getMenuID());
			preparedStatement.setNString(3,sysRoleMenu.getUser1());
			preparedStatement.setNString(4,sysRoleMenu.getUser2());
			preparedStatement.setNString(5,sysRoleMenu.getUser3());
			preparedStatement.setNString(6,sysRoleMenu.getUser4());
			preparedStatement.setNString(7,sysRoleMenu.getUser5());
			
			if(preparedStatement.executeUpdate()==1)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}				
		return result;
	}
	
	public static boolean deleteSysRoleMenuByRoleIDAndMenuID(String roleID,String menuID)
	{
		
		Boolean result = false;		
		try {
			PreparedStatement preparedStatement = DataUtil
			.getConnection()
			.prepareStatement(
					Constant.SQL_RES
							.getString("admin.sql.deleteSysRoleMenu"));
			preparedStatement.setNString(1,roleID);

			preparedStatement.setNString(2,menuID);

			
			if(preparedStatement.executeUpdate()==1)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}				
		return result;
	}

}
