/**
 * 
 */
package vn.edu.hungvuongaptech.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



/**
 * @author ThienVD
 *
 */
public class SessionListener implements HttpSessionListener{

	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		//System.out.println("Created. Session id"+ session.getId());						
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();	
		//System.out.println("Destroyed. Session id"+ session.getId());			
	}

}
