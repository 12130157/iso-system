	var montharray=new Array("1","2","3","4","5","6","7","8","9","10","11","12");

function getthedate(){ 
	var mydate=new Date(); 
	var year=mydate.getFullYear();
	var day=mydate.getDay(); 
	var month=mydate.getMonth() ;
	var daym=mydate.getDate() ;
	
	if (daym < 10) 
	daym = "0" + daym ;
	
	var hours=mydate.getHours() ;
	var minutes=mydate.getMinutes() ;
	var seconds=mydate.getSeconds() ;
	
	if (hours>11){ 
		hours=hours-12;
	} 
	if (hours==0) 
		hours=12 ;
	if (minutes<=9) 
		minutes="0"+minutes ;
	if (seconds<=9) 
		seconds="0"+seconds ;
	//change font size here 
	
	var cdate="<font color=#000>"+daym+"-"+montharray[month]+"-"+year; 

	if (document.all) 
		document.all.clock.innerHTML=cdate ;
	else 
		document.write(cdate) ;
} 
	if (!document.all) 
		getthedate() ;
	function goforit(){ 
		if (document.all) 
			setInterval("getthedate()",1000) ;
	}
onLoad=goforit();