/**
 * 
 */
package vn.edu.hungvuongaptech.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import vn.edu.hungvuongaptech.common.Constant;
import vn.edu.hungvuongaptech.dao.MailDAO;

/**
 * @author ThienVD
 *
 */
public class MailUtil {
	public static void sendEmail(String mailTo, String mailCC, 
									String subject, String content){
						
		Properties props = System.getProperties();
		
		props.setProperty("mail.transport.protocol", 
							Constant.SETTING_RES.getString("MAIL_TRANSPORT_PROTOCOL"));				
		props.setProperty("mail.host",
							Constant.SETTING_RES.getString("MAIL_HOST"));				
		props.put("mail.smtp.socketFactory.port",
					Constant.SETTING_RES.getString("MAIL_SMTP_SOCKET_FACTORY_PORT"));								
		
		props.put("mail.smtp.auth", "true");	
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");
		
		try{
			Session session = Session.getInstance(props, new Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication() { 
					return new PasswordAuthentication(
							Constant.SETTING_RES.getString("MAIL_FROM"),
							Constant.SETTING_RES.getString("MAIL_PASS"));	
				}
			});
			Message message = new MimeMessage(session);			
			Address fromAdd = new InternetAddress(
								Constant.SETTING_RES.getString("MAIL_FROM"));
			message.setFrom(fromAdd);
			if(!mailTo.equals("")) {
				Address toAdd = new InternetAddress(mailTo);	
				message.setRecipient(Message.RecipientType.TO,toAdd);	
			}
			if(!mailCC.equals("")) {
				Address ccAdd = new InternetAddress(mailCC);	
				message.setRecipient(Message.RecipientType.CC,ccAdd);
			}
			message.setSubject(subject);
			
			MimeBodyPart messagePart = new MimeBodyPart();			 
			MimeMultipart multipart = new MimeMultipart();
			
			multipart.addBodyPart(messagePart);  // adding message part	
			//Setting the Email Encoding	
			messagePart.setText(content,"utf-8");			
			messagePart.setHeader("Content-Type","text/html; charset=\"utf-8\"");
			messagePart.setHeader("Content-Transfer-Encoding", "quoted-printable");
			 
			message.setContent(multipart);
			message.setSentDate(new Date());
			if(!mailTo.equals(""))				
				Transport.send(message);
		}
		catch(Exception e){
			e.printStackTrace();			
		}		
	}	
	public static void sendEmailToBoPhan(ArrayList<String> mailToList, ArrayList<String> mailCCList, 
			String subject, String content){

		Properties props = System.getProperties();
		
		props.setProperty("mail.transport.protocol", 
			Constant.SETTING_RES.getString("MAIL_TRANSPORT_PROTOCOL"));				
		props.setProperty("mail.host",
			Constant.SETTING_RES.getString("MAIL_HOST"));				
		props.put("mail.smtp.socketFactory.port",
		Constant.SETTING_RES.getString("MAIL_SMTP_SOCKET_FACTORY_PORT"));								
		
		props.put("mail.smtp.auth", "true");	
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");
		
		try{
			Session session = Session.getInstance(props, new Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() { 
			return new PasswordAuthentication(
				Constant.SETTING_RES.getString("MAIL_FROM"),
				Constant.SETTING_RES.getString("MAIL_PASS"));	
			}
			});
				Message message = new MimeMessage(session);			
				Address fromAdd = new InternetAddress(
						Constant.SETTING_RES.getString("MAIL_FROM"));			
				
				message.setFrom(fromAdd);
				if(mailToList.size() > 0) {
					Address[] toAdd = new InternetAddress[mailToList.size()];
					for(int i=0;i<mailToList.size();i++) {
						if(mailToList.get(i).equals(""))
							toAdd[i] = new InternetAddress("noMail@gmail.com");
						else 
							toAdd[i] = new InternetAddress(mailToList.get(i));
					}
					message.setRecipients(Message.RecipientType.TO,toAdd);
				}
				
				int count = 0, size = 0;
				if(mailCCList != null)
					size = mailCCList.size();
				ArrayList<String> mailAdminList = MailDAO.getMailListOfAdmin();
				Address[] ccAdd = new InternetAddress[size + mailAdminList.size()];
				for(int i=0;i<size;i++) {
					if(mailCCList.get(i).equals(""))
						ccAdd[i] = new InternetAddress("noMail@gmail.com");
					else {	
						ccAdd[i] = new InternetAddress(mailCCList.get(i));
						count++;
					}
				}
				for(int i=0;i<mailAdminList.size();i++) {
					if(mailAdminList.get(i).equals(""))
						ccAdd[i] = new InternetAddress("noMail@gmail.com");
					else {
						ccAdd[count] = new InternetAddress(mailAdminList.get(i));
						count++;
					}
				}
				message.setRecipients(Message.RecipientType.CC,ccAdd);
				
				message.setSubject(subject);
				
				MimeBodyPart messagePart = new MimeBodyPart();			 
				MimeMultipart multipart = new MimeMultipart();
				
				multipart.addBodyPart(messagePart);  // adding message part	
				//Setting the Email Encoding	
				messagePart.setText(content,"utf-8");			
				messagePart.setHeader("Content-Type","text/html; charset=\"utf-8\"");
				messagePart.setHeader("Content-Transfer-Encoding", "quoted-printable");
				
				message.setContent(multipart);
				message.setSentDate(new Date());
				if(mailToList.size() > 0)
					Transport.send(message);
			}
			catch(Exception e){
				e.printStackTrace();			
		}		
	}
	
}
