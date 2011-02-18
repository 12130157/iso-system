function click_btnTimTen()
{
	location.href="ThongKe.jsp?ten="+document.getElementById("txtTimKiemTheoTenThietBi").value;		
}

//Boolean kt = true;

function validateNumber(str)
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

function click_btnCapNhat()
{	
	var rong = /\s/g;
	var flag = true;
	
	var tenThietBi = document.getElementById("txtTenThietBi").value.replace(rong,"");
	var tenLinhKien = document.getElementById("txtTenLinhKien").value.replace(rong,"");
	var dungLuong = document.getElementById("txtDungLuong").value.replace(rong,"");
	var kiHieu = document.getElementById("txtKiHieu").value.replace(rong,"");
	var soMay=document.getElementById("txtSoMay").value.replace(rong,"");
	var tanSuatToiDa=document.getElementById("txtTanSuatToiDa").value.replace(rong,"");
	var giaMua=document.getElementById("txtGiaMua").value.replace(rong,"");
	var tanSuatSuDung=document.getElementById("txtTanSuatSuDung").value.replace(rong,"");
	var soLanSuDung=document.getElementById("txtSoLanSuDung").value.replace(rong,"");
	var phuKien=document.getElementById("txtPhuKien").value.replace(rong,"");
	var soLanBaoTri=document.getElementById("txtSoLanBaoTri").value.replace(rong,"");
	var nguyenTac=document.getElementById("teaNguyenTacSuDung").value.replace(rong,"");
	var dacTinh=document.getElementById("teaDacTinhKyThuat").value.replace(rong,"");
	
	if(tenThietBi == "")
	{
		alert("Nhập tên của thiết bị");
		document.getElementById('txtTenThietBi').focus();
		flag = false;
	}
	else if(tenLinhKien == "")
	{
		alert("Nhập tên linh kiện của thiết bị");
		document.getElementById('txtTenLinhKien').focus();
		flag = false;
	}
	else if(dungLuong == "")
	{
		alert("Nhập dung luong thiết bị");
		document.getElementById('txtDungLuong').focus();
		flag = false;
	}
	else if(kiHieu == "")
	{
		alert("Nhập ký hiệu cho thiết bị");
		document.getElementById('txtKiHieu').focus();
		flag = false;
	}
	else if(soMay=="")
	{
		alert("Nhập ký số máy thiết bị");
		document.getElementById('txtSoMay').focus();
		flag = false;
	}
	else if(!validateNumber(soMay))
	{
		alert("Giá trị nhập vào không hợp lệ!");
		document.getElementById('txtSoMay').focus();
		flag = false;
	}
	else if(giaMua=="")
	{
		alert("Nhập ký giá mua thiết bị");
		document.getElementById('txtGiaMua').focus();
		flag = false;
	}
	else if(!validateNumber(giaMua))
	{
		alert("Giá mua không hợp lệ");
		document.getElementById('txtGiaMua').focus();
		flag = false;
	}
	else if(tanSuatToiDa=="")
	{
		alert("Nhập tần suất tối đa");
		document.getElementById('txtTanSuatToiDa').focus();
		flag = false;
	}
	else if(!validateNumber(tanSuatToiDa))
	{
		alert("Tần suất tối đa phải là số!");
		document.getElementById('txtTanSuatToiDa').focus();
		flag = false;
	}
	else if(tanSuatSuDung=="")
	{
		alert("Nhập tần suất sử dụng");
		document.getElementById('txtTanSuatSuDung').focus();
		flag = false;
	}
	else if(!validateNumber(tanSuatSuDung))
	{
		alert("Giá trị nhập vào không hợp lệ!");
		document.getElementById('txtTanSuatSuDung').focus();
		flag = false;
	}
	else if(soLanSuDung=="")
	{
		alert("Nhập số lần sử dụng");
		document.getElementById('txtSoLanSuDung').focus();
		flag = false;
	}
	else if(!validateNumber(soLanSuDung))
	{
		alert("Yêu cầu nhập số! Vui lòng nhập lại");
		document.getElementById('txtSoLanSuDung').focus();
		flag = false;
	}
	else if(phuKien=="")
	{
		alert("Nhập phụ kiện thiết bị");
		document.getElementById('txtPhuKien').focus();
		flag = false;
	}
	else if(soLanBaoTri=="")
	{
		alert("Nhập số lần bảo trì");
		document.getElementById('txtSoLanBaoTri').focus();
		flag = false;
	}
	else if(!validateNumber(soLanBaoTri))
	{
		alert("Yêu cầu nhập số! Vui lòng nhập lại");
		document.getElementById('txtSoLanBaoTri').focus();
		flag = false;
	}
	else if(nguyenTac=="")
	{
		alert("Nhập nguyên tắc sử dụng cho thiết bị");
		document.getElementById('teaNguyenTacSuDung').focus();
		flag = false;
	}
	else if(dacTinh=="")
	{
		alert("Nhập đặc tính của thiết bị");
		document.getElementById('teaDacTinhKyThuat').focus();
		flag = false;
	}
	else{
		flag = true;		
		if(confirm("Bạn có chắc chắn muốn cập nhật thiết bị này ko ?"))
		{
			document.getElementById("actionType").value="QLTB_updateTB";
			document.forms["formThietBi"].submit();	
		}		
	}
}