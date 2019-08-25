<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8" %>	
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>Sign In </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" > 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" media="screen" href="css/registerstyle.css">
     <link rel="stylesheet" type="text/css" href="css/reset.css"/>

  </head>
  
  <body>
   <div id="particles-js">
		<div class="login">
			<div class="login-top">
				登录
			</div>
			<form name="managesign"  method="post" action="ManagerSign.jsp">
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/account.png"/></div>
				<div class="login-center-input">
					<input id="manage_id" type="text" name="manage_id" value="" placeholder="请输入您的ID" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
					<div class="login-center-input-text">ID</div>
				</div>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/password.png"/></div>
				<div class="login-center-input">
					<input type="password" name="password" value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
					<div class="login-center-input-text">密码</div>
				</div>
			</div>
		<center>
           <button id ="signin" class = "login-button" type="submit">登录</button></center>
            </form>
            	
		</div>
		<div class="sk-rotating-plane"></div>
</div>
  </body>
</html>
