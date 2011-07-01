
indexRow=1;

var u=false;
function checkAll()
{
	
	if(u){
		u=false;			
	}
	else{
		u=true;
	}
	for(i=1;i<indexRow;i++)
	{
			document.getElementById("checkBox"+i).checked=u;
	}
	
	
}




function validateFormThietBi()
{
	var stt=true;
	var tenThietBi=document.getElementById("txtTenThietBi").value;
	var objLoaiThietBi=document.getElementById("selLoaiThietBi");
	var objKhoa=document.getElementById("selKhoa");
	var objNhaCC=document.getElementById("selNhaCC");
	var objPhong=document.getElementById("selPhong");
	var objDonViTanSuat=document.getElementById("selDonViTanSuat");
	var loaiThietBi=objLoaiThietBi.options[objLoaiThietBi.selectedIndex].text;
	
	var khoa=objKhoa.options[objKhoa.selectedIndex].text;
	
	var nhaCC=objNhaCC.options[objNhaCC.selectedIndex].text;
	
	var soLuong=document.getElementById("txtSoLuong").value;
	var donViTinh=document.getElementById("selDonViTinh").value;
	
	var phong=objPhong.options[objPhong.selectedIndex].text;
	
	var tanSuatToiDa=document.getElementById("txtTanSuatToiDa").value;
	
	var giaMua=document.getElementById("txtGiaMua").value;
	var kiHieu=document.getElementById("txtKiHieu").value;

	
	var donViTanSuat=objDonViTanSuat.options[objDonViTanSuat.selectedIndex].text;
	
	var phuKien=document.getElementById("txtPhuKien").value;
	var nguyenTacSD=document.getElementById("txtNguyenTacSD").value;
	var dacTinhKT=document.getElementById("txtDacTinhKT").value;
	
	if(rightSpace(kiHieu)==""){
		document.getElementById("alertKiHieu").innerHTML="*";
		stt=false;
	}
	else{
		document.getElementById("alertKiHieu").innerHTML="";
	}
	
	if(rightSpace(tenThietBi)==""){
		document.getElementById("alertTenThietBi").innerHTML="*";
		stt=false;
	}
	else{
		document.getElementById("alertTenThietBi").innerHTML="";
	}
	
	if(loaiThietBi=="--Chọn--"){
		document.getElementById("alertLoaiTB").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertLoaiTB").innerHTML="";
		
	if(khoa=="--Chọn--"){
		document.getElementById("alertKhoa").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertKhoa").innerHTML="";
	
	if(nhaCC=="--Chọn--"){
		document.getElementById("alertNhaCC").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertNhaCC").innerHTML="";
		
	if(rightSpace(soLuong)==""){
		document.getElementById("alertSoLuong").innerHTML="*";
		stt=false;
	}
	else{
		document.getElementById("alertSoLuong").innerHTML="";
		if(!validateNumberPhone(soLuong)){
			document.getElementById("alertSoLuong").innerHTML="Số lượng không đúng";
			stt=false;
		}
		else
			document.getElementById("alertSoLuong").innerHTML="";
	}
	
	
	if(donViTinh=="--Chọn--"){
		document.getElementById("alertDonViTinh").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertDonViTinh").innerHTML="";
	
	if(phong=="--Chọn--"){
		document.getElementById("alertPhong").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertPhong").innerHTML="";
	
	if(rightSpace(tanSuatToiDa)==""){
		document.getElementById("alertTanSuatToiDa").innerHTML="*";
		stt=false;
	}
	else{
		document.getElementById("alertTanSuatToiDa").innerHTML="";
		if(!validateNumberPhone(tanSuatToiDa)){
			document.getElementById("alertTanSuatToiDa").innerHTML="Tần suất phải nhập số";
			stt=false;
		}
		else
			document.getElementById("alertTanSuatToiDa").innerHTML="";
	}
	
	if(rightSpace(giaMua)==""){
		document.getElementById("alertGiaMua").innerHTML="*";
		stt=false;
	}
	else{
		document.getElementById("alertGiaMua").innerHTML="";
		if(!validateNumberPhone(giaMua)){
			document.getElementById("alertGiaMua").innerHTML="Giá mua phải nhập số";
			stt=false;
		}
		else
			document.getElementById("alertGiaMua").innerHTML="";
	}
	if(donViTanSuat==""){
		document.getElementById("alertDonViTanSuat").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertDonViTanSuat").innerHTML="";
	
	if(rightSpace(phuKien)==""){
		document.getElementById("alertPhuKien").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertPhuKien").innerHTML="";
	
	if(rightSpace(nguyenTacSD)==""){
		document.getElementById("alertNguyenTacSD").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertNguyenTacSD").innerHTML="";
	
	if(rightSpace(dacTinhKT)==""){
		document.getElementById("alertDacTinhKT").innerHTML="*";
		stt=false;
	}
	else
		document.getElementById("alertDacTinhKT").innerHTML="";
	
	
	var resultValidate=document.getElementById("alertValidate");
	if(!stt)
		resultValidate.innerHTML="Bạn phải nhập vào nơi có dấu *";
	else 
		resultValidate.innerHTML=""; 
	
	return stt;
}


function rightSpace(str)
{
	var length=str.length-1;
	while(length>=0&&str.charAt(length)==' ')
	{
		length--;
	}
	return str.substr(0,length+1);
}


function validateNumberPhone(str)
{
	validate="0123456789";
	for(i=0;i<str.length;i++)
	{
		for(j=0;j<validate.length;j++)
			if(str.charAt(i)==validate.charAt(j))
				j=validate.length;
		if(j!=validate.length+1)
			return false;
	}
	return true;
}



function validateFormChiTietThietBi()
{
	var tenLinhKien;
	var nhaCungCap;
	var dungLuong;
	stt=true;
	sttToanCuc=true;
	for(i=1;i<indexRow;i++){
		tenLinhKien=document.getElementById("txtTenLinhKien"+i);
		nhaCungCap=document.getElementById("selNhaCungCap"+i);
		dungLuong=document.getElementById("txtDungLuong"+i);
		
		if(rightSpace(tenLinhKien.value)==""){
			tenLinhKien.style.background="red";
			stt=false;
		}
		else{

			tenLinhKien.style.background="";
		}
		
		if(rightSpace(dungLuong.value)==""){
			dungLuong.style.background="red";
			stt=false;
		}
		else{

			dungLuong.style.background="";
		}
		
		if(nhaCungCap.selectedIndex==0){
			nhaCungCap.style.background="red";
			stt=false;
		}
		else{
			nhaCungCap.style.background="";
		}
		if(stt==false)
			sttToanCuc=false;
		
	}
	
	var resultValidate=document.getElementById("alertValidate");
	if(!sttToanCuc)
		resultValidate.innerHTML="Bạn phải nhập vào nơi bắt buộc";
	else 
		resultValidate.innerHTML=""; 
	
	
	return sttToanCuc;
}
