package vn.edu.hungvuongaptech.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

import vn.edu.hungvuongaptech.common.Constant;

/**
 * Containing methods to manipulate database.
 * @author ThienVD
 *
 */
public class DataUtil {

	static Connection conn = null;
	private static final Logger logger = Logger.getLogger(DataUtil.class.getName());
	private static final Logger loggerInfo = Logger.getLogger("LogINFO");
	
	public static String URL = Constant.SETTING_RES.getString("URL");
	public static String USER_NAME = Constant.SETTING_RES.getString("USER_NAME");
	public static String PASSWORD = Constant.SETTING_RES.getString("PASSWORD");;

	/**
	 * Create connection to database.
	 */
	public static void connect() {
		try {
			Class.forName(Constant.SETTING_RES.getString("DB_DRIVER"));
			conn = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);			
		}
	}

	/**
	 * Disconnect sql connection.
	 */
	public static void disconnected() {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}

		} catch (Exception e) {
			//e.printStackTrace();
			LogUtil.logError(e, logger);
		}
	}

	/**
	 * Get connection.
	 * @return Connection
	 */
	public static Connection getConnection() {
		try {
			if (conn != null)
				conn.close();
			connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * Check connection.
	 * @return int
	 */
	public static int checkConnection() {
		try {
			if (conn != null) {
				return 0;
			}
		} catch (Exception e) {
			//e.printStackTrace();
			LogUtil.logError(e, logger);
		}
		return 1;
	}

	/**
	 *
	 * @param sql
	 * @return ResultSet
	 */
	public static ResultSet executeQuery(String sql) {
		try {
			connect();
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
			return null;
		}
	}

	/**
	 *
	 * @param sql
	 * @return int
	 */
	public static int executeUpdate(String sql) {
		try {
			connect();
			Statement statement = conn.createStatement();
			int rsUpdate = statement.executeUpdate(sql);
			return rsUpdate;
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
			return 0;
		}
	}

	/**
	 *
	 * @param csmt
	 * @return ResultSet
	 */
	public static ResultSet executeStore(CallableStatement csmt) {
		try {
			connect();
			return csmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
		}
		return null;
	}

	/**
	 *
	 * @param csmt
	 * @return int
	 */
	public static Boolean executeNonStore(CallableStatement csmt) {
		try {
			connect();
			csmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			LogUtil.logError(e, logger);
			return false;
		}				
	}

}