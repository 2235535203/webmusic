function gettd(){
	console.log("success use gettd");
    var currentRow=$(this).closest("tr"); 
    var col1=currentRow.find("td:eq(0)").text(); //获得当前行第一个TD值
    var col2=currentRow.find("td:eq(1)").text(); //获得当前行第二个TD值
    var col3=currentRow.find("td:eq(2)").text();//获得当前行第三个TD值
    var col4=currentRow.find("td:eq(3)").text();
    var data=col1+"\n"+col2+"\n"+col3+"\n"+col4;
    alert(data);
}

function testgettd(Obj){
	console.log("success use gettd");
	 var table=document.getElementById("table_result");
	 alert($(this).parents("tr").text());
		
}
/* for(var i=0;i<data.length;i++){
var row=table.insertRow(table.rows.length);
var c1=row.insertCell(0);
c1.innerHTML=jsonobj[i].music_name;
var c2=row.insertCell(1);
c2.innerHTML=jsonobj[i].creator_name;
var c3=row.insertCell(2);
c3.innerHTML=jsonobj[i].album_name;
var c5=row.insertCell(3);
c5.innerHTML=jsonobj[i].music_remark;
}*/
