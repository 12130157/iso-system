function click_btnTimTen()
{
	location.href="DanhSachNhaCungCap.jsp?tenNCC="+document.getElementById("txtTimTenNhaCungCap").value;		
}


function click_btnCapNhat()
{
	if(validateForm())
	{
		document.getElementById("actionType").value="capnhat";
		document.forms['frmNhaCungCap'].submit();
	}
	
}


function click_btnThemMoi()
{
	if(validateForm())
	{
		document.getElementById("actionType").value="themmoi";
		document.forms['frmNhaCungCap'].submit();
	}
	
}

function click_btnThoat(indexPage)
{
	location.href="DanhSachNhaCungCap.jsp?tenNCC="+document.getElementById("txtTimTenNhaCungCap").value+"&index="+indexPage;		
}



function validateForm()
{
	var tenNhaCungCap=document.getElementById("txtTenNhaCungCap").value;
	var diaChi=document.getElementById("txtDiaChi").value;
	var dienThoai=document.getElementById("txtDienThoai").value;
	var email=document.getElementById("txtEmail").value;
	var stt=true;
	
	if(rightSpace(tenNhaCungCap)!="")
		document.getElementById("alertTenNhaCungCap").innerHTML="";
	else{
		document.getElementById("alertTenNhaCungCap").innerHTML="*";
		stt=false;
	}
	
	if(rightSpace(diaChi)!="")
		document.getElementById("alertDiaChi").innerHTML="";
	else{
		document.getElementById("alertDiaChi").innerHTML="*";
		stt=false;
	}
	
	if(rightSpace(dienThoai)!=""){
		document.getElementById("alertDienThoai").innerHTML="";
	
	}
	else{
		document.getElementById("alertDienThoai").innerHTML="*";
		stt=false;
	}
	
	
	if(rightSpace(email)!="")
		document.getElementById("alertEmail").innerHTML="";
	else{
		stt=false;
		document.getElementById("alertEmail").innerHTML="*";
	}
	if(stt==false)
		document.getElementById("alertValidate").innerHTML="Bạn phải nhập vào nơi có dấu *";
	else{
		document.getElementById("alertValidate").innerHTML="";
		if(!validateNumberPhone(dienThoai)){
			document.getElementById("alertDienThoai").innerHTML="Số điện thoại không đúng";
			stt=false;
		}
		else
			document.getElementById("alertDienThoai").innerHTML="";
	}
	
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
