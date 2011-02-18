/**
 * 
 */
package vn.edu.hungvuongaptech.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Insets;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.StringReader;
import java.net.URL;

import org.zefer.pd4ml.PD4ML;
import org.zefer.pd4ml.PD4PageMark;

import vn.edu.hungvuongaptech.common.Constant;

/**
 * @author ThienVD
 * 
 */
public class PdfUtil {
	
	/**
	 * <ul>
	 * <li> Ham nay se xuat ra file PDF tu trang JSP.
	 * </ul>
	 * 
	 * @author 	ThienVD
	 * @param 	inputURLJsp		Duong dan den trang JSP can xuat
	 * @param 	outputURLPdf	Duong dan den file pdf se xuat ra
	 * @return	
	 * @throws
	 */
	public static Boolean exportPDF(String inputURLJsp, String outputURLPdf) {
		try {
			File fOut = new File(outputURLPdf);
			java.io.FileOutputStream fos = new java.io.FileOutputStream(fOut);				
			
			File fIn = new File(inputURLJsp);
			byte[] buffer = new byte[(int) fIn.length()];
			BufferedInputStream bis = new BufferedInputStream(
					new FileInputStream(inputURLJsp));

			bis.read(buffer);
			StringReader sr = new StringReader(new String(buffer));

			PD4ML html = new PD4ML();
			html.setPageSize(new Dimension(450, 450));
			html.setPageInsets(new Insets(20, 50, 10, 10));
			html.setHtmlWidth(750);
			html.enableImgSplit(false);
			
			File theDir = new File(Constant.SETTING_RES.getString("URL_PDF_EXPORT"));
			if (!theDir.exists()) {
				// Khong ton tai thu muc output
				theDir.mkdir();
			}
			URL base = new URL(Constant.SETTING_RES.getString("URL_PDF_EXPORT"));

			PD4PageMark header = new PD4PageMark();
			header.setAreaHeight(20);
			header.setTitleTemplate("title: $[title]");
			header.setTitleAlignment(PD4PageMark.CENTER_ALIGN);
			header.setPageNumberAlignment(PD4PageMark.LEFT_ALIGN);
			header.setPageNumberTemplate("#$[page]");

			PD4PageMark footer = new PD4PageMark();
			footer.setAreaHeight(30);
			footer.setFontSize(20);
			footer.setColor(Color.red);
			footer.setPagesToSkip(1);
			footer.setTitleTemplate("[ $[title] ]");
			footer.setPageNumberTemplate("page: $[page]");
			footer.setTitleAlignment(PD4PageMark.RIGHT_ALIGN);
			footer.setPageNumberAlignment(PD4PageMark.LEFT_ALIGN);

			html.useTTF("java:fonts", true);
			html.setDefaultTTFs("Times New Roman", "Arial", "Courier New");

			//html.setPageHeader(header);
			html.setPageFooter(footer);
			
			html.render(sr, fos, base, "UTF-8");
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
