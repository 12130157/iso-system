package vn.edu.hungvuongaptech.model;

import java.io.Serializable;

public class GiaoAnModel implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String maGiaoAn;
	private String maKHGD;
	private String thuTu;
	private String buoiHoc;
	private String ngayThucHien;
	private String mucTieu;
	private String thoiGianOnDinh;
	private String congTacChuanBi;
	private String ngayTao;
	private String ngayCapNhatCuoi;
	private String danNhap;
	private String noiDungBaiGiang;
	private String cungCoKienThuc;
	private String huongDanTuHoc;
	private String thoiGianDanNhap;
	private String thoiGianBaiGiang;
	private String thoiGianCungCo;
	private String thoiGianHDTH;
	private String taiLieuThamKhao;
	private String maNguoiDuyet;
	private String ngayDuyet;
	private String tinhTrang;
	private String hDDanNhapGV;
	private String hDDanNhapHS;
	private String hDGiangBaiMoiGV;
	private String hDGiangBaiMoiHS;
	private String hDCungCoGV;
	private String hDCungCoHS;
	private String hDHDTHGV;
	private String hDHDTHHS;
	private String loaiGiaoAn;
	private String huongDanBanDau;
	private String huongDanThuongXuyen;
	private String huongDanKetThuc;
	private String huongDanRenLuyen;
	private String thoiGianHDBD;
	private String thoiGianHDTX;
	private String thoiGianHDKT;
	private String thoiGianHDRL;
	private String hDHDBDGV;
	private String hDHDBDHS;
	private String hDHDTXGV;
	private String hDHDTXHS;
	private String hDHDKTGV;
	private String hDHDKTHS;
	private String hDHDRLGV;
	private String hDHDRLHS;
	private String gioiThieuChuDe;
	private String giaiQuyetVanDe;
	private String thoiGianGTCD;
	private String thoiGianGTVD;
	private String hDGTCDGV;
	private String hDGTCDHS;
	private String hDGQVDGV;
	private String hDGQVDHS;
	private String rutKinhNghiem;
	private String soGiaoAn;
	private String doDungPTDH;
	private String onDinhLH;
	private String thoiGianTHBH;
	private String hinhThucTCDH;
	private String tenChuong;
	private String maGiaoVien;
	private String user1;
	private String user2;
	private String user3;
	private String user4;
	private String user5;
	
	public GiaoAnModel(){
		this.maGiaoAn="";
		this.maKHGD="";
		this.thuTu="";
		this.buoiHoc="";
		this.ngayThucHien="";
		this.mucTieu="";
		this.thoiGianOnDinh="";
		this.congTacChuanBi="";
		this.ngayTao="";
		this.ngayCapNhatCuoi="";
		this.danNhap="";
		this.noiDungBaiGiang="";
		this.cungCoKienThuc="";
		this.huongDanTuHoc="";
		this.thoiGianDanNhap="";
		this.thoiGianBaiGiang="";
		this.thoiGianCungCo="";
		this.thoiGianHDTH="";
		this.taiLieuThamKhao="";
		this.maNguoiDuyet="";
		this.ngayDuyet="";
		this.tinhTrang="";
		this.hDDanNhapGV="";
		this.hDDanNhapHS="";
		this.hDGiangBaiMoiGV="";
		this.hDGiangBaiMoiHS="";
		this.hDCungCoGV="";
		this.hDCungCoHS="";
		this.hDHDTHGV="";
		this.hDHDTHHS="";
		this.loaiGiaoAn="";
		this.huongDanBanDau="";
		this.huongDanThuongXuyen="";
		this.huongDanKetThuc="";
		this.huongDanRenLuyen="";
		this.thoiGianHDBD="";
		this.thoiGianHDTX="";
		this.thoiGianHDKT="";
		this.thoiGianHDRL="";
		this.hDHDBDGV="";
		this.hDHDBDHS="";
		this.hDHDTXGV="";
		this.hDHDTXHS="";
		this.hDHDKTGV="";
		this.hDHDKTHS="";
		this.hDHDRLGV="";
		this.hDHDRLHS="";
		this.gioiThieuChuDe="";
		this.giaiQuyetVanDe="";
		this.thoiGianGTCD="";
		this.thoiGianGTVD="";
		this.hDGTCDGV="";
		this.hDGTCDHS="";
		this.hDGQVDGV="";
		this.hDGQVDHS="";
		this.rutKinhNghiem="";
		this.soGiaoAn="";
		this.doDungPTDH="";
		this.onDinhLH="";
		this.thoiGianTHBH="";
		this.hinhThucTCDH="";
		this.user1="";
		this.user2="";
		this.user3="";
		this.user4="";
		this.user5="";
	}
	
	public String getMaGiaoAn() {
		return maGiaoAn;
	}
	public void setMaGiaoAn(String maGiaoAn) {
		this.maGiaoAn = maGiaoAn;
	}
	
	public String getMaKHGD() {
		return maKHGD;
	}
	
	public void setMaKHGD(String maKHGD) {
		this.maKHGD = maKHGD;
	}
	
	public String getThuTu(){
		return thuTu;
	}
	
	public void setThuTu(String thuTu){
		this.thuTu=thuTu;
	}
	
	public String getBuoiHoc(){
		return this.buoiHoc;
	}
	
	public void setBuoiHoc(String buoiHoc){
		this.buoiHoc=buoiHoc;
	}
	
	public String getNgayThucHien(){
		return this.ngayThucHien;
	}
	
	public void setNgayThucHien(String ngayThucHien){
		this.ngayThucHien=ngayThucHien;
	}
	
	public String getMucTieu(){
		return this.mucTieu;
	}
	
	public void setMucTieu(String mucTieu){
		this.mucTieu=mucTieu;
	}
	
	public String getThoiGianOnDinh(){
		return this.thoiGianOnDinh;
	}
	
	public void setThoiGianOnDinh(String thoiGianOnDinh){
		this.thoiGianOnDinh=thoiGianOnDinh;
	}
	
	public String getCongTacChuanBi(){
		return this.congTacChuanBi;
	}
	public void setCongTacChuanBi(String congTacChuanBi){
		this.congTacChuanBi=congTacChuanBi;
	}
	
	public String getNgayTao(){
		return ngayTao;
	}
	
	public void setNgayTao(String ngayTao){
		this.ngayTao=ngayTao;
	}
	
	public String getNgayCapNhatCuoi(){
		return this.ngayCapNhatCuoi;
	}
	
	public void setNgayCapNhatCuoi(String ngayCapNhatCuoi){
		this.ngayCapNhatCuoi=ngayCapNhatCuoi;
	}
	
	public String getDanNhap(){
		return this.danNhap;
	}
	
	public void setDanNhap(String danNhap){
		this.danNhap=danNhap;
	}
	
	public String getNoiDungBaiGiang(){
		return this.noiDungBaiGiang;
	}
	
	public void setNoiDungBaiGiang(String noiDungBaiGiang){
		this.noiDungBaiGiang=noiDungBaiGiang;
	}
	
	public String getCungCoKienThuc(){
		return this.cungCoKienThuc;
	}
	
	public void  setCungCoKienThuc(String cungCoKienThuc){
		this.cungCoKienThuc=cungCoKienThuc;
	}
	
	public String getHuongDanTuHoc(){
		return this.huongDanTuHoc;
	}
	
	public void setHuongDanTuHoc(String huongDanTuHoc ){
		this.huongDanTuHoc=huongDanTuHoc;
	}
	
	public String getThoiGianDanNhap(){
		return this.thoiGianDanNhap;
	}
	
	public void setThoiGianDanNhap(String thoiGianDanNhap){
		this.thoiGianDanNhap=thoiGianDanNhap;
	}
	
	public String getThoiGianBaiGiang(){
		return this.thoiGianBaiGiang;
	}
	
	public void setThoiGianBaiGiang(String thoiGianBaiGiang){
		this.thoiGianBaiGiang=thoiGianBaiGiang;
	}
	
	public String getThoiGianCungCo(){
		return this.thoiGianCungCo;
	}
	
	public void setThoiGianCungCo(String thoiGianCungCo){
		this.thoiGianCungCo=thoiGianCungCo;
	}
	
	public String getThoiGianHDTH(){
		return this.thoiGianHDTH;
	}
	
	public void setThoiGianHDTH(String thoiGianHDTH){
		this.thoiGianHDTH=thoiGianHDTH;
	}
	
	public String getTaiLieuThamKhao(){
		return taiLieuThamKhao;
	}
	
	public void setTaiLieuThamKhao(String taiLieuThamKhao){
		this.taiLieuThamKhao=taiLieuThamKhao;
	}
	
	public String getMaNguoiDuyet(){
		return this.maNguoiDuyet;
	}
	
	public void setMaNguoiDuyet(String maNguoiDuyet){
		this.maNguoiDuyet=maNguoiDuyet;
	}
	
	public String getNgayDuyet(){
		return this.ngayDuyet;
	}
	
	public void setNgayDuyet(String ngayDuyet){
		this.ngayDuyet=ngayDuyet;
	}
	
	public String getTinhTrang(){
		return this.tinhTrang;
	}
	
	public void setTinhTrang(String tinhTrang){
		this.tinhTrang=tinhTrang;
	}
	
	
	public String getHDDanNhapGV(){
		return this.hDDanNhapGV;
	}
	
	public void setHDDanNhapGV(String hDDanNhapGV){
		this.hDDanNhapGV=hDDanNhapGV;
	}
	
	public String getHDDanNhapHS(){
		return this.hDDanNhapHS;
	}
	
	public void setHDDanNhapHS(String hDDanNhapHS){
		this.hDDanNhapHS=hDDanNhapHS;
	}
	
	public String getHDGiangBaiMoiHS(){
		return this.hDGiangBaiMoiHS;
	}
	
	public void setHDGiangBaiMoiHS(String hDGiangBaiMoiHS){
		this.hDGiangBaiMoiHS=hDGiangBaiMoiHS;
	}
	public String getHDGiangBaiMoiGV(){
		return this.hDGiangBaiMoiGV;
	}
	
	public void setHDGiangBaiMoiGV(String hDGiangBaiMoiGV){
		this.hDGiangBaiMoiGV=hDGiangBaiMoiGV;
	}
	
	public String getHDCungCoGV(){
		return this.hDCungCoGV;
	}
	
	public void setHDCungCoGV(String hDCungCoGV){
		this.hDCungCoGV=hDCungCoGV;
	}
	
	public String getHDCungCoHS(){
		return this.hDCungCoHS;
	}
	
	public void setHDCungCoHS(String hDCungCoHS){
		this.hDCungCoHS=hDCungCoHS;
	}
	
	public String getHDHDTHGV(){
		return this.hDHDTHGV;
	}
	
	public void setHDHDTHGV(String hDHDTHGV){
		this.hDHDTHGV=hDHDTHGV;
	}

	public String getHDHDTHHS(){
		return this.hDHDTHHS;
	}
	
	public void setHDHDTHHS(String hDHDTHHS){
		this.hDHDTHHS=hDHDTHHS;
	}
	
	public String getLoaiGiaoAn(){
		return loaiGiaoAn;
	}
	
	public void setLoaiGiaoAn(String loaiGiaoAn){
		this.loaiGiaoAn=loaiGiaoAn;
	}
	
	public String getHuongDanBanDau(){
		return this.huongDanBanDau;
	}
	
	public void setHuongDanBanDau(String huongDanBanDau){
		this.huongDanBanDau=huongDanBanDau;
	}
	
	public String getHuongDanThuongXuyen(){
		return this.huongDanThuongXuyen;
	}
	
	public void setHuongDanThuongXuyen(String huongDanThuongXuyen){
		this.huongDanThuongXuyen=huongDanThuongXuyen;
	}
	
	public String getHuongDanKetThuc(){
		return this.huongDanKetThuc;
	}
	
	public void setHuongDanKetThuc(String huongDanKetThuc){
		this.huongDanKetThuc=huongDanKetThuc;
	}
	
	public String getHuongDanRenLuyen(){
		return this.huongDanRenLuyen;
	}
	
	public void setHuongDanRenLuyen(String huongDanRenLuyen){
		this.huongDanRenLuyen=huongDanRenLuyen;
	}
	
	public String getThoiGianHDBD(){
		return this.thoiGianHDBD;
	}
	
	public void setThoiGianHDBD(String thoiGianHDBD){
		this.thoiGianHDBD=thoiGianHDBD;
	}
	
	public String getThoiGianHDTX(){
		return this.thoiGianHDTX;
	}
	
	public void setThoiGianHDTX(String thoiGianHDTX){
		this.thoiGianHDTX=thoiGianHDTX;
	}
	
	public String getThoiGianHDKT(){
		return this.thoiGianHDKT;
	}
	
	public void setThoiGianHDKT(String thoiGianHDKT){
		this.thoiGianHDKT=thoiGianHDKT;
	}
	
	public String getThoiGianHDRL(){
		return this.thoiGianHDRL;
	}
	
	public void setThoiGianHDRL(String thoiGianHDRL){
		this.thoiGianHDRL=thoiGianHDRL;
	}
	
	public String getHDHDBDGV(){
		return this.hDHDBDGV;
	}
	
	public void setHDHDBDGV(String hDHDBDGV){
		this.hDHDBDGV=hDHDBDGV;
	}
	
	public String getHDHDBDHS(){
		return this.hDHDBDHS;
	}
	
	public void setHDHDBDHS(String hDHDBDHS){
		this.hDHDBDHS=hDHDBDHS;
	}
	
	public String getHDHDTXGV(){
		return this.hDHDTXGV;
	}
	
	public void setHDHDTXGV(String hDHDTXGV){
		this.hDHDTXGV=hDHDTXGV;
	}
	
	public String getHDHDTXHS(){
		return this.hDHDTXHS;
	}
	
	public void setHDHDTXHS(String hDHDTXHS){
		this.hDHDTXHS=hDHDTXHS;
	}
	
	public String getHDHDKTGV(){
		return this.hDHDKTGV;
	}
	
	public void setHDHDKTGV(String hDHDKTGV){
		this.hDHDKTGV=hDHDKTGV;
	}
	
	public String getHDHDKTHS(){
		return this.hDHDKTHS;
	}
	
	public void setHDHDKTHS(String hDHDKTHS){
		this.hDHDKTHS=hDHDKTHS;
	}
	
	public String getHDHDRLGV(){
		return this.hDHDRLGV;
	}
	
	public void setHDHDRLGV(String hDHDRLGV){
		this.hDHDRLGV=hDHDRLGV;
	}
	
	public String getHDHDRLHS(){
		return this.hDHDRLHS;
	}
	
	public void setHDHDRLHS(String hDHDRLHS){
		this.hDHDRLHS=hDHDRLHS;
	}
	
	public String getGioiThieuChuDe(){
		return this.gioiThieuChuDe;
	}
	
	public void setGioiThieuChuDe(String gioiThieuChuDe){
		this.gioiThieuChuDe=gioiThieuChuDe;
	}
	
	public String getGiaiQuyetVanDe(){
		return this.giaiQuyetVanDe;
	}
	
	public void setGiaiQuyetVanDe(String giaiQuyetVanDe){
		this.giaiQuyetVanDe=giaiQuyetVanDe;
	}
	
	public String getThoiGianGTCD(){
		return thoiGianGTCD;
	}
	
	public void setThoiGianGTCD(String thoiGianGTCD){
		this.thoiGianGTCD=thoiGianGTCD;
	}
	
	public String getThoiGianGTVD(){
		return thoiGianGTVD;
	}
	
	public void setThoiGianGTVD(String thoiGianGTVD){
		this.thoiGianGTVD=thoiGianGTVD;
	}
	
	public String getHDGTCDGV(){
		return this.hDGTCDGV;
	}
	
	public void setHDGTCDGV(String hDGTCDGV){
		this.hDGTCDGV=hDGTCDGV;
	}
	
	public String getHDGTCDHS(){
		return this.hDGTCDHS;
	}
	
	public void setHDGTCDHS(String hDGTCDHS){
		this.hDGTCDHS=hDGTCDHS;
	}
	
	public String getHDGQVDGV(){
		return this.hDGQVDGV;
	}
	
	public void setHDGQVDGV(String hDGQVDGV){
		this.hDGQVDGV=hDGQVDGV;
	}
	

	public String getHDGQVDHS(){
		return this.hDGQVDHS;
	}
	
	public void setHDGQVDHS(String hDGQVDHS){
		this.hDGQVDHS=hDGQVDHS;
	}
	
	public String getRutKinhNghiem(){
		return this.rutKinhNghiem;
	}
	
	public void setRutKinhNghiem(String rutKinhNghiem){
		this.rutKinhNghiem=rutKinhNghiem;
	}
	
	public String getSoGiaoAn(){
		return this.soGiaoAn;
	}
	
	public void setSoGiaoAn(String soGiaoAn){
		this.soGiaoAn=soGiaoAn;
	}
	
	public String getDoDungPTDH(){
		return this.doDungPTDH;
	}
	
	public void setDoDungPTDH(String doDungPTDH){
		this.doDungPTDH=doDungPTDH;
	}
	
	public String getOnDinhLH(){
		return onDinhLH;
	}
	
	public void setOnDinhLH(String onDinhLH){
		this.onDinhLH=onDinhLH;
	}
	
	public String getThoiGianTHBH(){
		return this.thoiGianTHBH;
	}
	
	public void setThoiGianTHBH(String thoiGianTHBH){
		this.thoiGianTHBH=thoiGianTHBH;
	}

	public String getHinhThucTCDH(){
		return this.hinhThucTCDH;
	}
	
	public void setHinhThucTCDH(String hinhThucTCDH){
		this.hinhThucTCDH=hinhThucTCDH;
	}
	
	public void setTenChuong(String tenChuong){
		this.tenChuong=tenChuong;
	}
	
	public String getTenChuong()
	{
		return this.tenChuong;
	}
	
	public void setMaGiaoVien(String maGiaoVien)
	{
		this.maGiaoVien=maGiaoVien;
	}
	
	public String getMaGiaoVien()
	{
		return this.maGiaoVien;
	}
	
	public String getUser1(){
		return this.user1;
	}
	
	
	
	public void setUser1(String user1){
		this.user1=user1;
	}
	public String getUser2(){
		return this.user2;
	}
	
	public void setUser2(String user2){
		this.user2=user2;
	}
	
	public String getUser3(){
		return this.user3;
	}
	
	public void setUser3(String user3){
		this.user3=user3;
	}
	
	public String getUser4(){
		return this.user4;
	}
	
	public void setUser4(String user4){
		this.user4=user4;
	}
	
	public String getUser5(){
		return this.user5;
	}
	
	public void setUser5(String user5){
		this.user5=user5;
	}
}
