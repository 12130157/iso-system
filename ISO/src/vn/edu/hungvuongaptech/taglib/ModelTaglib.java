package vn.edu.hungvuongaptech.taglib;

import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;

public class ModelTaglib {
	public static ArrayList<ArrayList<NoiDungChiTietKHDTModel>> getListNoiDungByKhoa(ChiTietKHDTModel model) {	
		ArrayList<ArrayList<NoiDungChiTietKHDTModel>> arr = new ArrayList<ArrayList<NoiDungChiTietKHDTModel>>();
		ArrayList<NoiDungChiTietKHDTModel> noiDungList1 = new ArrayList<NoiDungChiTietKHDTModel>();
		ArrayList<NoiDungChiTietKHDTModel> noiDungList2 = new ArrayList<NoiDungChiTietKHDTModel>();
		if(model.getNoiDungChiTietKHDTModelList() != null)
		{
			for(int i=0;i<model.getNoiDungChiTietKHDTModelList().size();i++) {
				NoiDungChiTietKHDTModel noiDung = new NoiDungChiTietKHDTModel();
				if(model.getNoiDungChiTietKHDTModelList().get(i).getKhoa().equals("1")) {				
					noiDung = model.getNoiDungChiTietKHDTModelList().get(i);
					if(noiDung.getBoSung() == null)
						noiDung.setBoSung("0");
					if(Integer.parseInt(noiDung.getBoSung()) == 0)
						noiDungList1.add(noiDung);
				} else {
					noiDung = model.getNoiDungChiTietKHDTModelList().get(i);
					if(noiDung.getBoSung() == null)
						noiDung.setBoSung("0");
					if(Integer.parseInt(noiDung.getBoSung()) == 0)
						noiDungList2.add(noiDung);
				}
			}
		}
		arr.add(noiDungList1);
		arr.add(noiDungList2);
		return arr;
	}
	public static int getSizeOfList(ArrayList<NoiDungChiTietKHDTModel> list) {		
		int size;
		size = list.size();
		return size;
	}
	public static int getSizeOfListChiTietKHDT(ArrayList<ChiTietKHDTModel> list) {
		int size;
		size = list.size();
		return size;
	}
}
