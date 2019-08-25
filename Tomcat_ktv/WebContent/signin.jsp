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
			<form name="signin" action="SignCheck.jsp" method="post">
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/account.png"/></div>
				<div class="login-center-input">
					<input type="text" name="name" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
					<div class="login-center-input-text">用户名</div>
				</div>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/password.png"/></div>
				<div class="login-center-input">
					<input type="password" name="password"value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
					<div class="login-center-input-text">密码</div>
				</div>
			</div>
			<center><button id ="signin" class = "login-button" type="submit" >登录</button></center>
            </form>
            <table width="352">
            <tr>
            <td align = "left" >
            <a class="btn btn-sm btn-white btn-block" th:href="@{manager}" href="ManagerSign.jsp"><h6>管理员登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6></a>
            </td>
            <td align = " right">
           <a class="btn btn-sm btn-white btn-block"  th:href="@{register}" href="register.jsp"><h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;还没有账户？前往注册</h6></a>
            </td>
            </tr>
            </table>
		</div>
		<div class="sk-rotating-plane"></div>
</div>
  </body>
</html>
