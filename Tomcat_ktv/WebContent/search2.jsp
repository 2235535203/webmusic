<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %> 
<! DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
		<title>player Website</title>
		<link rel="stylesheet" href="css/searchstyle.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script src="js/jquery.min.js"></script>
	</head>
	<body>
	    <div id="header">
		 <%
  		String name = session.getAttribute("username").toString();
 	 	%>
<script type="text/javascript">
//action="Search" method="post"
		function search() {
	alert( $('#search_form').serialize());
            $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型，或者用GET
                dataType: "text",//预期服务器返回的数据类型，可以改成json
                url: "Search" ,//ip:端口/项目名称/Servlet名称
                data: $('#search_form').serialize(),//获取表单里的数据到这里
                success: function (data) {
                	if(data==null||data==""){
                		alert("未找到该歌曲，请重新输入");
                	}
                	else{
                   alert(data);
                    sessionStorage.setItem("searchmusicname", data);
                   var search_result=data;
                   var jsonobj = JSON.parse(data);
                   var jsonlength = 0;
                   for (var item in jsonobj) {
                       jsonlength++;
                   }
                    var table=document.getElementById("table_result");
                    alert(jsonlength);
                    var str1 = "";
                    //清空table中的html
                    //$("#tbody-result").html("");
                    for(var i = 0;i<jsonlength;i++){
                        str1 += "<tr class='myclass'>" +                         
                            "<td>"+jsonobj[i].music_name+"</td>" +
                            "<td>"+jsonobj[i].creator_name+"</td>" +
                            "<td>"+jsonobj[i].album_name+"</td>" +
                            "<td>"+jsonobj[i].arrangenment_name+"</td>" +
                            "<td>"+jsonobj[i].lyricist_name+"</td>" +
                            "<td>"+jsonobj[i].music_remark+"</td>" +
                            "<td hidden='hidden'>"+jsonobj[i].music_id+"</td>" +
                            "<td>"+"<button class='playmusic'>播放</button>"+"</td>" +
                            "</tr>";
                        $("#tbody-result").html(str1);
                    }     
                
                	}
                	},
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>
    
 	 	<script type="text/javascript">
//用来获取该行的数据
$(document).ready(function(){
  //用于读取所选表行单元格数据（值）的代码。
  $("#table_result").on('click','.playmusic',function(){
    //获得当前行
  
  
    var currentRow=$(this).closest("tr"); 
    var music_name=currentRow.find("td:eq(0)").html(); //获得当前和第一个表格单元格TD值
    var creator_name=currentRow.find("td:eq(1)").html(); //获得当前和第一个表格单元格TD值
    var album_name=currentRow.find("td:eq(2)").html(); //获得当前和第一个表格单元格TD值
    var arrangement_name=currentRow.find("td:eq(3)").html();
    var lyricist_name=currentRow.find("td:eq(4)").html();
    var music_remark=currentRow.find("td:eq(5)").html();
    var music_id=currentRow.find("td:eq(6)").html();
    
    //alert(arrangement_name);
    var audio_location="";
    var video_location="";
    var accompany_location="";
    $.ajax({
        //几个参数需要注意一下
            type: "POST",//方法类型，或者用GET
            dataType: "text",//预期服务器返回的数据类型，可以改成json
            url: "Search" ,//ip:端口/项目名称/Servlet名称
            data:{search_kind:"play_music",search_value:music_id},//获取表单里的数据到这里{search_kind:"play_music",search_value:music_id}
            success: function (data) {
            	if(data==null||data==""){
            		alert("好像出现了一些错误，请联系管理员进行修正");
            	}
            	else{
            		//alert(data);
            		var jsonlocation=JSON.parse(data);
            		 for(var i = 0;i<1;i++){
               
              audio_location=jsonlocation[i].audio_location;
               video_location=jsonlocation[i].video_location;
               accompany_location=jsonlocation[i].accompany_location;
               
              // alert(audio_location);
               var musicjson= {
            	    "music_name":music_name,
            	    "creator_name":creator_name, 
            	    "album_name":album_name,
            	    "arrangement_name":arrangement_name,
            	    "lyricist_name":lyricist_name,        	    
            	     "music_remark":music_remark, 
            	    "music_id":music_id,
            	  "audio_location":audio_location,
               "video_location":video_location,
               "accompany_location":accompany_location
            	};
               var mymusicJSON = JSON.stringify(musicjson);
               sessionStorage.setItem("playmusic_json",mymusicJSON);
               alert(mymusicJSON);
               window.location.href="player.jsp";
              
               //alert(audio_location);
            		 }
            	}
            	},
            error : function() {
                alert("异常！");
            }
        });

  });
});

</script>


			<ul id = "exit">
				<li><%=name%> welcome!</li>
				<li><a href = "logout.jsp" >退出</a></li>
				
			</ul>
			<div>
				 <img src="images/logo.png " alt="">
				<ul id="navigation">
					<li><a href="search1.jsp">请输入歌曲名</a></li>
					<li class="selected"><a href="search2.jsp">请输入歌曲首字母</a></li>
					<li><a href="search3.jsp">请输入专辑名</a></li>
					<li><a href="search4.jsp">请输入专辑首字母</a></li>
					<li><a href="search5.jsp">请输入歌手名</a></li>
					<li><a href="search6.jsp">请输入歌手首字母</a></li>
				</ul>
				<ul class="navigation">
				  <div class="col-lg-6 col-lg-offset-4" style="margin-top:20px;">
	                <div class="input-group">
			         <form method="post" name = "form1" id= "search_form">
				       <input type="text" class="form-control" id="search_value" name="search_value"  placeholder="welcome to our music player !">
				       <input type="hidden" id="search_kind" name = "search_kind" value = "music_firstchar">
						  </form>
	      			  <button class="btn btn-default" id="search"  type="button" onclick="search()">Search</button>
	   			   </div><!-- /input-group -->
	            </div><!-- /.col-lg-6 -->
	            </ul>
              </div><!-- /.row -->

<br><br>

	<table id = "table_result" align="center"  border="1" width="800" style="background-color:#fff">
		 <tr>
	
        <th>music_name&nbsp;&nbsp;</th>
        <th>singer&nbsp;&nbsp;</th>
        <th>album&nbsp;&nbsp;</th>
        <th>作词&nbsp;&nbsp;</th>
        <th>作曲&nbsp;&nbsp;</th>
        <th>remark&nbsp;&nbsp;</th>    
        <th hidden="hidden">music_id&nbsp;&nbsp;</th>
        <th>操作&nbsp;&nbsp;</th>
        </tr>
         <tbody id="tbody-result">
    </tbody>
    </table>
		<div id="body">
<div id="gallery">
    <h2><a href="gallery.html">Photo Gallery</a></h2>
				<ul>
					<li><img src="images/5.jpg" alt=""></li>
					<li><img src="images/7.jpg" alt=""></li>
					<li><img src="images/10.jpg" alt=""></li>
					<li><img src="images/3.jpg" alt=""></li>
				</ul>
			</div>
		</div>
		<div id="footer">
			<div>
				<div id="first">
					
					<p>email@email.com    Tel: +89 2980 3600</p>
					<p>7000 Ut placerat accumsan sem enean dapibu</p>
					<p>Cras molestie metus Co. Ltd, Pellentes ABC 100</p>
				</div>
				<div>
					<h3><span>Connect</span> with us</h3>
					<a href="#" id="facebook">Facebook</a>
					<a href="#" id="twitter">Twitter</a>
				</div>
				<div>
					<h4>Subscribe to our <span>NEWSLETTER</span></h4>
					<p>Placerat accumsan sem enean dapibus Cra</p>
					<p>molestie metus  vitae urna eget tellus ultricie</p>
					<form action="">
						<input type="text" id="input" value="Enter Email Address" onblur="this.value=!this.value?'Enter Email Address':this.value;" onfocus="this.select()" onclick="this.value='';">
						<input type="submit" id="submit" value="">
					</form>
				</div>
				<p>&#169; Copyright 2019. All rights reserved. 马登科 谢颖媛 朱咏涛 &nbsp;</p>
			</div>
		</div>
	</body>
</html>  