<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8" %>	
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign Up</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" > 
  <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
  <meta name="author" content="Vincent Garreau" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" media="screen" href="css/registerstyle.css">
  <link rel="stylesheet" type="text/css" href="css/reset.css"/>
</head>
<body>

<div id="particles-js">
		<div class="login">
			<div class="login-top">
				注册
			</div>
			<form name = "Register_form" action="RegisterCheck.jsp" method="post">
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/account.png"/></div>
				<div class="login-center-input">
					<input type="text" name="name"  placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
					<div class="login-center-input-text">用户名</div>
				</div>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/password.png"/></div>
				<div class="login-center-input">
					<input type="password" name="pw" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
					<div class="login-center-input-text">密码</div>
                </div>
            </div><div class="login-center clearfix">
				<div class="login-center-img"><img src="images/mail.png"/></div>
				<div class="login-center-input">
					<input type="text" name="email" placeholder="请输入您的邮箱" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的邮箱'"/>
					<div class="login-center-input-text">邮箱</div>
				</div>
			</div>
			<!--  <div class="login-button">注册</div>-->
			<center><button id ="register" class = "login-button" type="submit" >注册</button></center>
			</form>
			<br>
			<br>
			<a class="btn btn-sm btn-white btn-block" style="text-align: right;" th:href="@{register}" href="signin.jsp"><h6>已经注册？前往登录</h6></a>
		</div>
		<div class="sk-rotating-plane"></div>
</div>


</body>
</html>