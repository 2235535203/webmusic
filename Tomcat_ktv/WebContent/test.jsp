<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fileupload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 
  </head>
  
  <body>
     <!-- enctype 默认是 application/x-www-form-urlencoded -->
     <form action="http://localhost:8081/Tomcat_ktv/Uploading" enctype="multipart/form-data" method="post" >
        
             歌曲名称：<input type="text" name="music_name"> <br/>
             歌手：<input type="text" name="singer_name"> <br/> 
             备注：<input type="text" name="remark"> <br/>
       MV文件：<input type="file" name="video"><br/>
             伴奏文件：<input type="file" name="accmopany"><br/>
          音频文件： <input type="file" name="avdio"><br/>
          
            <input type="submit" value="提交"/>
     
     </form>
     
     
     
  </body>
</html>