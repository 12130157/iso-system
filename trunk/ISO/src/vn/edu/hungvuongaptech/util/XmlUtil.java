package vn.edu.hungvuongaptech.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.util.*;

import javax.mail.Folder;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;
import org.zefer.html.doc.t;

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
			tinhChatDeCuong.setAttribute("ViTriMonHoc", deCuongMonHoc.getViTriMonHoc());
			tinhChatDeCuong.setAttribute("MucTieu1", deCuongMonHoc.getMucTieu1());
			tinhChatDeCuong.setAttribute("MucTieu2", deCuongMonHoc.getMucTieu2());
			tinhChatDeCuong.setAttribute("MucTieu3", deCuongMonHoc.getMucTieu3());
			tinhChatDeCuong.setAttribute("MucTieu4", deCuongMonHoc.getMucTieu4());
			tinhChatDeCuong.setAttribute("DieuKien1", deCuongMonHoc.getDieuKien1());
			tinhChatDeCuong.setAttribute("DieuKien2", deCuongMonHoc.getDieuKien2());
			tinhChatDeCuong.setAttribute("DieuKien3", deCuongMonHoc.getDieuKien3());
			tinhChatDeCuong.setAttribute("DieuKien4", deCuongMonHoc.getDieuKien4());
			tinhChatDeCuong.setAttribute("PhuongPhap1", deCuongMonHoc.getPhuongPhap1());
			tinhChatDeCuong.setAttribute("PhuongPhap2", deCuongMonHoc.getPhuongPhap2());
			tinhChatDeCuong.setAttribute("PhuongPhap3", deCuongMonHoc.getPhuongPhap3());
			
			tinhChatDeCuong.setAttribute("LyThuyet", deCuongMonHoc.getLyThuyet());
			tinhChatDeCuong.setAttribute("ThucHanh", deCuongMonHoc.getThucHanh());
			tinhChatDeCuong.setAttribute("SoTiet", deCuongMonHoc.getSoTietHocMotBuoi());
			tinhChatDeCuong.setAttribute("KieuBienSoan", deCuongMonHoc.getKieuBienSoan());
			tinhChatDeCuong.setAttribute("KiemTra", deCuongMonHoc.getKiemTra());
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

		
			boolean checkPath = true;
			File file = new File("C:/DeCuongMonHoc/DCMH_" + deCuongMonHoc.getTenMonHoc() + "_" + sysParamsModel.getNgayHeThong() + '_' 
					+ sysParamsModel.getGioHeThong() + "[" + deCuongMonHoc.getMaMonHoc() + "-" + deCuongMonHoc.getLyThuyetCTMH() 
					+ "-" + deCuongMonHoc.getThucHanhCTMH() + "].xml");
			
			if(file.getParentFile().exists() == false)
				checkPath = (new File("C:/DeCuongMonHoc").mkdir());
			if(checkPath)
			{
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
						new FileOutputStream(file), "UTF-8"));
				bw.write(xmlString);
				bw.flush();
				bw.close();
			}
			else
				check = false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			check = false;
		}
		return check;
	}
	public static boolean getDataFromFileXMLDeCuongMonHoc(String fileName, DeCuongMonHocModel deCuongMonHoc) {
		boolean check = true;
		ArrayList<NoiDungDCMHModel> noiDungDCMHList = new ArrayList<NoiDungDCMHModel>();
		try {
			File file = new File("C:/DeCuongMonHoc/" + fileName);
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(file);
			doc.getDocumentElement().normalize(); 
			NodeList nodeLst = doc.getElementsByTagName("TinhChatDeCuong");
			Node node = nodeLst.item(0);
			Element tinhChatDeCuong = (Element) node;
		
				
				deCuongMonHoc.setViTriMonHoc(tinhChatDeCuong.getAttribute("ViTriMonHoc"));
				deCuongMonHoc.setDieuKien1(tinhChatDeCuong.getAttribute("DieuKien1"));
				deCuongMonHoc.setDieuKien2(tinhChatDeCuong.getAttribute("DieuKien2"));
				deCuongMonHoc.setDieuKien3(tinhChatDeCuong.getAttribute("DieuKien3"));
				deCuongMonHoc.setDieuKien4(tinhChatDeCuong.getAttribute("DieuKien4"));
				deCuongMonHoc.setMucTieu1(tinhChatDeCuong.getAttribute("MucTieu1"));
				deCuongMonHoc.setMucTieu2(tinhChatDeCuong.getAttribute("MucTieu2"));
				deCuongMonHoc.setMucTieu3(tinhChatDeCuong.getAttribute("MucTieu3"));
				deCuongMonHoc.setMucTieu4(tinhChatDeCuong.getAttribute("MucTieu4"));
				deCuongMonHoc.setPhuongPhap1(tinhChatDeCuong.getAttribute("PhuongPhap1"));
				deCuongMonHoc.setPhuongPhap2(tinhChatDeCuong.getAttribute("PhuongPhap2"));
				deCuongMonHoc.setPhuongPhap3(tinhChatDeCuong.getAttribute("PhuongPhap3"));
				
				deCuongMonHoc.setLyThuyet(tinhChatDeCuong.getAttribute("LyThuyet"));
				deCuongMonHoc.setThucHanh(tinhChatDeCuong.getAttribute("ThucHanh"));
				deCuongMonHoc.setSoTietHocMotBuoi(tinhChatDeCuong.getAttribute("SoTiet"));
				deCuongMonHoc.setKieuBienSoan(tinhChatDeCuong.getAttribute("KieuBienSoan"));
				deCuongMonHoc.setKiemTra(tinhChatDeCuong.getAttribute("KiemTra"));
				NodeList childNode = tinhChatDeCuong.getElementsByTagName("NoiDungDeCuongMonHoc");
				
				
				  for (int i=0;i<childNode.getLength();i++) {
					  NoiDungDCMHModel noiDungDCMH = new NoiDungDCMHModel();
					  
					  Element noiDungDeCuong = (Element) childNode.item(i);
					  noiDungDCMH.setCoHieu(noiDungDeCuong.getAttribute("CoHieu")); 
					  noiDungDCMH.setMucTieu(noiDungDeCuong.getAttribute("MucTieu"));
					  noiDungDCMH.setTenChuong(noiDungDeCuong.getAttribute("TenChuong"));
					  noiDungDCMH.setSoThuTu(noiDungDeCuong.getAttribute("SoThuTu"));
					  noiDungDCMH.setSoBuoi(noiDungDeCuong.getAttribute("SoBuoi"));
					  noiDungDCMH.setSoTiet(noiDungDeCuong.getAttribute("SoTiet"));
					  
					  noiDungDCMHList.add(noiDungDCMH);
				  }
				  deCuongMonHoc.setNoiDungDCMHModelsList(noiDungDCMHList);
			
		} catch(Exception ex) {
			ex.printStackTrace();
			check = false;
		}
		return check;
	}
}
