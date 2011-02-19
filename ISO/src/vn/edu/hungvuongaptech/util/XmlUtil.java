package vn.edu.hungvuongaptech.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;
import org.w3c.dom.Node;

import com.sun.org.apache.regexp.internal.recompile;

import vn.edu.hungvuongaptech.dao.SysParamsDAO;
import vn.edu.hungvuongaptech.model.DeCuongMonHocModel;
import vn.edu.hungvuongaptech.model.NoiDungDCMHModel;
import vn.edu.hungvuongaptech.model.SysParamsModel;

public class XmlUtil {
	public static void exportXmlFile(ArrayList<?> listObject,
			String rootElement, String interfaceName, String pathSaveFile) {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
			// creating a new instance of a DOM to build a DOM tree.
			Document doc = docBuilder.newDocument();

			Element root = doc.createElement(rootElement);
			// adding a node after the last child node of the specified node.
			doc.appendChild(root);

			Element interfaceElement = null;

			Element child = null;
			Text text;

			for (Object obj : listObject) {
				Class srcClass = obj.getClass();
				Field[] field = srcClass.getFields();
				interfaceElement = doc.createElement(interfaceName);
				for (int i = 0; i < field.length; i++) {
					// System.out.println(field[i].getName() + ":" +
					// field[i].get(obj));
					child = doc.createElement(field[i].getName());

					text = doc.createTextNode((field[i].get(obj)).toString());
					child.appendChild(text);

					interfaceElement.appendChild(child);
				}
				root.appendChild(interfaceElement);
			}

			// TransformerFactory instance is used to create Transformer
			// objects.
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");

			// create string from xml tree
			StringWriter sw = new StringWriter();
			StreamResult result = new StreamResult(sw);
			DOMSource source = new DOMSource(doc);
			transformer.transform(source, result);
			String xmlString = sw.toString();

			File file = new File(pathSaveFile);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(file)));
			bw.write(xmlString);
			bw.flush();
			bw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// Hàm thêm mới thành vien
	public static void exportThemMoiThanhVienXmlFile(ArrayList<?> listObject, String rootElement, String interfaceName) {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
			// creating a new instance of a DOM to build a DOM tree.
			Document doc = docBuilder.newDocument();
			
			Element root = doc.createElement(rootElement);
			// adding a node after the last child node of the specified node.
			doc.appendChild(root);
			
			Element interfaceElement = null;
			Element child = null;
			
			SysParamsModel sysParamsModel =  SysParamsDAO.getNgayGioHeThongXML();
				//sysParamModel.getNgayHeThong();
				//sysParamModel.getGioHeThong();
			Text text;
			
			for (Object obj: listObject) {
				Class srcClass = obj.getClass();
				Field[] field = srcClass.getFields();
				interfaceElement = doc.createElement(interfaceName);
				
				interfaceElement.setAttribute("Type", "New");
				interfaceElement.setAttribute("CreateName", "Vo Duc Thien");
				interfaceElement.setAttribute("CreateID", "0");
				interfaceElement.setAttribute("CreateDate", sysParamsModel.getNgayHeThong() + ' ' + sysParamsModel.getGioHeThong());
				
				Element data = doc.createElement("Data");
				for (int i = 0; i< field.length; i++) {
//					System.out.println(field[i].getName() + ":" + field[i].get(obj));
					child = doc.createElement(field[i].getName());					
					
					text = doc.createTextNode((field[i].get(obj)).toString());
					child.appendChild(text);
					
					data.appendChild(child);
				}
				interfaceElement.appendChild(data);
				root.appendChild(interfaceElement);
			}
			
			
			
			// TransformerFactory instance is used to create Transformer
			// objects.
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");

			// create string from xml tree
			StringWriter sw = new StringWriter();
			StreamResult result = new StreamResult(sw);
			DOMSource source = new DOMSource(doc);
			transformer.transform(source, result);
			String xmlString = sw.toString();

			File file = new File("D:/DataTemp/ThanhVien_ThemMoi_" + sysParamsModel.getNgayHeThong() + '_' + sysParamsModel.getGioHeThong() + ".xml");
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(file)));
			bw.write(xmlString);
			bw.flush();
			bw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// Hàm update thành viên
	public static void exportUpdateThanhVienXmlFile(ArrayList<?> listObject, String rootElement, String interfaceName) {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
			// creating a new instance of a DOM to build a DOM tree.
			Document doc = docBuilder.newDocument();
			
			Element root = doc.createElement(rootElement);
			// adding a node after the last child node of the specified node.
			doc.appendChild(root);
			
			Element interfaceElement = null;
			Element child = null;

			SysParamsModel sysParamsModel = SysParamsDAO.getNgayGioHeThongXML();
			Text text;
			
			for (Object obj: listObject) {
				Class srcClass = obj.getClass();
				Field[] field = srcClass.getFields();
				interfaceElement = doc.createElement(interfaceName);
				
				interfaceElement.setAttribute("Type", "Update");
				interfaceElement.setAttribute("CreateName", "Vo Duc Thien");
				interfaceElement.setAttribute("CreateID", "0");
				interfaceElement.setAttribute("CreateDate", sysParamsModel.getNgayHeThong() + ' ' + sysParamsModel.getGioHeThong());
				
				Element data = doc.createElement("Data");
				for (int i = 0; i< field.length; i++) {
//					System.out.println(field[i].getName() + ":" + field[i].get(obj));
					child = doc.createElement(field[i].getName());					
					
					text = doc.createTextNode((field[i].get(obj)).toString());
					child.appendChild(text);
					
					data.appendChild(child);
				}
				interfaceElement.appendChild(data);
				root.appendChild(interfaceElement);
			}
			
			
			
			// TransformerFactory instance is used to create Transformer
			// objects.
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");

			// create string from xml tree
			StringWriter sw = new StringWriter();
			StreamResult result = new StreamResult(sw);
			DOMSource source = new DOMSource(doc);
			transformer.transform(source, result);
			String xmlString = sw.toString();

			File file = new File("D:/DataTemp/ThanhVien_CapNhat_" + sysParamsModel.getNgayHeThong() + '_' + sysParamsModel.getGioHeThong() + ".xml");
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(file)));
			bw.write(xmlString);
			bw.flush();
			bw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//Hàm thêm mới khóa học
	public static void exportThemMoiKhoaHocXmlFile(ArrayList<?> listObject, String rootElement, String interfaceName) {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
			// creating a new instance of a DOM to build a DOM tree.
			Document doc = docBuilder.newDocument();
			
			Element root = doc.createElement(rootElement);
			// adding a node after the last child node of the specified node.
			doc.appendChild(root);
			
			Element interfaceElement = null;
			Element child = null;

			SysParamsModel sysParamsModel = SysParamsDAO.getNgayGioHeThongXML();
			Text text;
			
			for (Object obj: listObject) {
				Class srcClass = obj.getClass();
				Field[] field = srcClass.getFields();
				interfaceElement = doc.createElement(interfaceName);
				
				interfaceElement.setAttribute("Type", "New");
				interfaceElement.setAttribute("CreateName", "Vo Duc Thien");
				interfaceElement.setAttribute("CreateID", "0");
				interfaceElement.setAttribute("CreateDate", sysParamsModel.getNgayHeThong() + ' ' + sysParamsModel.getGioHeThong());
				
				Element data = doc.createElement("Data");
				for (int i = 0; i< field.length; i++) {
//					System.out.println(field[i].getName() + ":" + field[i].get(obj));
					child = doc.createElement(field[i].getName());					
					
					text = doc.createTextNode((field[i].get(obj)).toString());
					child.appendChild(text);
					
					data.appendChild(child);
				}
				interfaceElement.appendChild(data);
				root.appendChild(interfaceElement);
			}
			
			
			
			// TransformerFactory instance is used to create Transformer
			// objects.
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");

			// create string from xml tree
			StringWriter sw = new StringWriter();
			StreamResult result = new StreamResult(sw);
			DOMSource source = new DOMSource(doc);
			transformer.transform(source, result);
			String xmlString = sw.toString();

			File file = new File("D:/DataTemp/KhoaHoc_ThemMoi_" + sysParamsModel.getNgayHeThong() + '_' + sysParamsModel.getGioHeThong() + ".xml");
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(file)));
			bw.write(xmlString);
			bw.flush();
			bw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// Hàm update khóa học
	public static void exportUpdateKhoaHocXmlFile(ArrayList<?> listObject, String rootElement, String interfaceName) {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
			// creating a new instance of a DOM to build a DOM tree.
			Document doc = docBuilder.newDocument();
			
			Element root = doc.createElement(rootElement);
			// adding a node after the last child node of the specified node.
			doc.appendChild(root);
			
			Element interfaceElement = null;
			Element child = null;

			SysParamsModel sysParamsModel = SysParamsDAO.getNgayGioHeThongXML();
			Text text;
			
			for (Object obj: listObject) {
				Class srcClass = obj.getClass();
				Field[] field = srcClass.getFields();
				interfaceElement = doc.createElement(interfaceName);
				
				interfaceElement.setAttribute("Type", "Update");
				interfaceElement.setAttribute("CreateName", "Vo Duc Thien");
				interfaceElement.setAttribute("CreateID", "0");
				interfaceElement.setAttribute("CreateDate", sysParamsModel.getNgayHeThong() + ' ' + sysParamsModel.getGioHeThong());
				
				Element data = doc.createElement("Data");
				for (int i = 0; i< field.length; i++) {
//					System.out.println(field[i].getName() + ":" + field[i].get(obj));
					child = doc.createElement(field[i].getName());					
					
					text = doc.createTextNode((field[i].get(obj)).toString());
					child.appendChild(text);
					
					data.appendChild(child);
				}
				interfaceElement.appendChild(data);
				root.appendChild(interfaceElement);
			}
			
			
			
			// TransformerFactory instance is used to create Transformer
			// objects.
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");

			// create string from xml tree
			StringWriter sw = new StringWriter();
			StreamResult result = new StreamResult(sw);
			DOMSource source = new DOMSource(doc);
			transformer.transform(source, result);
			String xmlString = sw.toString();

			File file = new File("D:/DataTemp/KhoaHoc_CapNhat_" + sysParamsModel.getNgayHeThong() + '_' + sysParamsModel.getGioHeThong() + ".xml");
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(file)));
			bw.write(xmlString);
			bw.flush();
			bw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// Hàm delete khóa học
	public static void exportDeleteKhoaHocXmlFile(ArrayList<?> listObject, String rootElement, String interfaceName) {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
			// creating a new instance of a DOM to build a DOM tree.
			Document doc = docBuilder.newDocument();
			
			Element root = doc.createElement(rootElement);
			// adding a node after the last child node of the specified node.
			doc.appendChild(root);
			
			Element interfaceElement = null;
			Element child = null;

			SysParamsModel sysParamsModel = SysParamsDAO.getNgayGioHeThongXML();
			Text text;
			
			for (Object obj: listObject) {
				Class srcClass = obj.getClass();
				Field[] field = srcClass.getFields();
				interfaceElement = doc.createElement(interfaceName);
				
				interfaceElement.setAttribute("Type", "Update");
				interfaceElement.setAttribute("CreateName", "Vo Duc Thien");
				interfaceElement.setAttribute("CreateID", "0");
				interfaceElement.setAttribute("CreateDate", sysParamsModel.getNgayHeThong() + ' ' + sysParamsModel.getGioHeThong());
				
				Element data = doc.createElement("Data");
				for (int i = 0; i< field.length; i++) {
//					System.out.println(field[i].getName() + ":" + field[i].get(obj));
					child = doc.createElement(field[i].getName());					
					
					text = doc.createTextNode((field[i].get(obj)).toString());
					child.appendChild(text);
					
					data.appendChild(child);
				}
				interfaceElement.appendChild(data);
				root.appendChild(interfaceElement);
			}
			
			
			
			// TransformerFactory instance is used to create Transformer
			// objects.
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");

			// create string from xml tree
			StringWriter sw = new StringWriter();
			StreamResult result = new StreamResult(sw);
			DOMSource source = new DOMSource(doc);
			transformer.transform(source, result);
			String xmlString = sw.toString();

			File file = new File("D:/DataTemp/KhoaHoc_Delete_" + sysParamsModel.getNgayHeThong() + '_' + sysParamsModel.getGioHeThong() + ".xml");
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(file)));
			bw.write(xmlString);
			bw.flush();
			bw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// Ham xuat file xml De cuong mon hoc
	public static boolean xuatFileXMLDeCuongMonHoc(DeCuongMonHocModel deCuongMonHoc, String rootElement, String interfaceName) {
		boolean check = true;
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
			// creating a new instance of a DOM to build a DOM tree.
			Document doc = docBuilder.newDocument();
			
			Element root = doc.createElement(rootElement);
			// adding a node after the last child node of the specified node.
			doc.appendChild(root);
			SysParamsModel sysParamsModel = SysParamsDAO.getNgayGioHeThongXML();
			Element tinhChatDeCuong = doc.createElement("TinhChatDeCuong");
			//deCuongMonHoc.setViTriMonHoc(deCuongMonHoc.getViTriMonHoc().replace(, newChar))
			tinhChatDeCuong.setAttribute("ViTriMonHoc", StringUtil.toUTF8(deCuongMonHoc.getViTriMonHoc()).trim());
			tinhChatDeCuong.setAttribute("MucTieu1", StringUtil.toUTF8(deCuongMonHoc.getMucTieu1()).trim());
			tinhChatDeCuong.setAttribute("MucTieu2", StringUtil.toUTF8(deCuongMonHoc.getMucTieu2()).trim());
			tinhChatDeCuong.setAttribute("MucTieu3", StringUtil.toUTF8(deCuongMonHoc.getMucTieu3()).trim());
			tinhChatDeCuong.setAttribute("MucTieu4", StringUtil.toUTF8(deCuongMonHoc.getMucTieu4()).trim());
			tinhChatDeCuong.setAttribute("DieuKien1", StringUtil.toUTF8(deCuongMonHoc.getDieuKien1()).trim());
			tinhChatDeCuong.setAttribute("DieuKien2", StringUtil.toUTF8(deCuongMonHoc.getDieuKien2()).trim());
			tinhChatDeCuong.setAttribute("DieuKien3", StringUtil.toUTF8(deCuongMonHoc.getDieuKien3()).trim());
			tinhChatDeCuong.setAttribute("DieuKien4", StringUtil.toUTF8(deCuongMonHoc.getDieuKien4()).trim());
			tinhChatDeCuong.setAttribute("PhuongPhap1", StringUtil.toUTF8(deCuongMonHoc.getPhuongPhap1()).trim());
			tinhChatDeCuong.setAttribute("PhuongPhap2", StringUtil.toUTF8(deCuongMonHoc.getPhuongPhap2()).trim());
			tinhChatDeCuong.setAttribute("PhuongPhap3", StringUtil.toUTF8(deCuongMonHoc.getPhuongPhap3()).trim());
				
			//SysParamsModel sysParamsModel = SysParamsDAO.getNgayGioHeThongXML();
			Element noiDungDeCuong = null;
		//	interfaceElement.setAttribute("CreateDate", sysParamsModel.getNgayHeThong() + ' ' + sysParamsModel.getGioHeThong());
				
				for (int i = 0; i< deCuongMonHoc.getNoiDungDCMHModelsList().size(); i++) {
//					System.out.println(field[i].getName() + ":" + field[i].get(obj));
					noiDungDeCuong = doc.createElement("NoiDungDeCuongMonHoc");					
					NoiDungDCMHModel noiDungDCMH = deCuongMonHoc.getNoiDungDCMHModelsList().get(i);
					noiDungDeCuong.setAttribute("SoThuTu", noiDungDCMH.getSoThuTu());
					noiDungDeCuong.setAttribute("SoBuoi", noiDungDCMH.getSoBuoi());
					noiDungDeCuong.setAttribute("TenChuong", noiDungDCMH.getTenChuong());
					noiDungDeCuong.setAttribute("CoHieu", noiDungDCMH.getCoHieu());
					noiDungDeCuong.setAttribute("SoTiet", noiDungDCMH.getSoTiet());
					noiDungDeCuong.setAttribute("MucTieu", noiDungDCMH.getMucTieu());
					
					tinhChatDeCuong.appendChild(noiDungDeCuong);

				}
				root.appendChild(tinhChatDeCuong);
			
			
			
			
			// TransformerFactory instance is used to create Transformer
			// objects.
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");

			// create string from xml tree
			StringWriter sw = new StringWriter();
			StreamResult result = new StreamResult(sw);
			DOMSource source = new DOMSource(doc);
			transformer.transform(source, result);
			String xmlString = sw.toString();

			File file = new File("E:/DeCuongMonHoc" + deCuongMonHoc.getTenMonHoc() + "_" + sysParamsModel.getNgayHeThong() + '_' + sysParamsModel.getGioHeThong() + ".xml");
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(file)));
			bw.write(xmlString);
			bw.flush();
			bw.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			check = false;
		}
		return check;
	}
	
}
