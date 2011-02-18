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
import org.w3c.dom.Text;

import vn.edu.hungvuongaptech.dao.SysParamsDAO;
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
}
