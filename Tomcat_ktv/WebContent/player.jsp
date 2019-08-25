<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>MP3播放器</title>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/smusic.css">
	</head>
    <body>


	<div class="grid-music-container f-usn">
   	 <div class="m-music-play-wrap">
        <div class="u-cover"></div>
        <div class="m-now-info">
            <h1 class="u-music-title"><small>...</small><small>...</small></h1>
            <div class="m-now-controls">
                <div class="u-control u-process">
                    <span class="buffer-process"></span>
                    <span class="current-process"></span>
                </div>
                <div class="u-control u-time">00:00/00:00</div>
                <div class="u-control u-volume">
                    <div class="volume-process" data-volume="0.50">
                        <span class="volume-current"></span>
                        <span class="volume-bar"></span>
                        <span class="volume-event"></span>
                    </div>
                    <a class="volume-control"></a>
                </div>
            </div>
            <div class="m-play-controls">
                <a class="u-play-btn prev" title="上一曲"></a>
                <a class="u-play-btn ctrl-play play" title="暂停"></a>
                <a class="u-play-btn next" title="下一曲"></a>
				
				<br>
            </div>
        </div>
    </div>
    <div class="f-cb">&nbsp;</div>
    <div class="m-music-list-wrap"></div>
 <!--  <table align="center"  border="1" width="800"  style="background-color:#fff">
<tr>
<td>音乐名</td>
<td></td>
</tr>

</table>-->     
    <br>
    <br>
    <br>
  
    <a href="search1.jsp"><img src="images/return.png" class="f-fr" width="10%" border="0" title="Return"></a>
	</div>
	<script src="js/smusic.min.js"></script>
	<script>
	var sessiondata= sessionStorage.getItem("playmusic_json");
	alert(sessiondata);
	var json_playmusic=JSON.parse(sessiondata);
     //alert(json_playmusic);
	alert(json_playmusic.audio_location);
	
var musicList = [
	{
		title : json_playmusic.creator_name,
		singer : json_playmusic.music_name,
		cover  : '',
		src    : json_playmusic.audio_location
		},

	
	];
	new SMusic({
		musicList:musicList
	});
	</script>

	
	



	<div style="text-align:center;">
	</div>
	</body>
</html>
