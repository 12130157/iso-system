/**
 * 
 */
package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

/**
 * @author ThienVD
 *
 */
public class SysRoleAppModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String roleID;
	private String appID;
	private String appName;
	private String appLink;
	private String appImage;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	public String getRoleID() {
		return roleID;
	}
	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	public String getAppID() {
		return appID;
	}
	public void setAppID(String appID) {
		this.appID = appID;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getUser1() {
		return user1;
	}
	public void setUser1(String user1) {
		this.user1 = user1;
	}
	public String getUser2() {
		return user2;
	}
	public void setUser2(String user2) {
		this.user2 = user2;
	}
	public String getUser3() {
		return user3;
	}
	public void setUser3(String user3) {
		this.user3 = user3;
	}
	public String getUser4() {
		return user4;
	}
	public void setUser4(String user4) {
		this.user4 = user4;
	}
	public String getUser5() {
		return user5;
	}
	public void setUser5(String user5) {
		this.user5 = user5;
	}
	public String getAppLink() {
		return appLink;
	}
	public void setAppLink(String appLink) {
		this.appLink = appLink;
	}
	public String getAppImage() {
		return appImage;
	}
	public void setAppImage(String appImage) {
		this.appImage = appImage;
	}		
	
}
