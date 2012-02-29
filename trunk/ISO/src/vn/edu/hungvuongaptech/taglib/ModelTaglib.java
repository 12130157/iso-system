package vn.edu.hungvuongaptech.taglib;

import java.util.ArrayList;

import vn.edu.hungvuongaptech.model.ChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.DangKyMonHocModel;
import vn.edu.hungvuongaptech.model.KeHoachDaoTaoModel;
import vn.edu.hungvuongaptech.model.NoiDungChiTietKHDTModel;
import vn.edu.hungvuongaptech.model.ThanhVienModel;

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
	
	// lấy tổng số môn học phải học trong 1 học kì - nằm trong moduld xem điểm
	public static int getTongSoMonHoc(ArrayList<String> monHocList)
	{
		int tongSo = 0;
		for(int i=0;i<monHocList.size();i++)
		{
			tongSo++;
		}
		return tongSo;
	}
	// lấy tất cả môn học phải học rong 1 học kì - nằm trong moduld xem điểm
	public static ArrayList<String> getAllMonHoc(ArrayList<ThanhVienModel> thanhVienList)
	{
		ArrayList<String> monHocList = new ArrayList<String>();
		for(int i=0;i<thanhVienList.get(0).getDangKyMonHocList().size();i++)
		{
			monHocList.add(thanhVienList.get(0).getDangKyMonHocList().get(i).getTenMonHoc());
		}
		return monHocList;
	}
}
