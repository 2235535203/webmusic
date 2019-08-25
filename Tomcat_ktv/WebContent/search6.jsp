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

			<ul id = "exit">
				<li><%=name%> welcome!</li>
				<li><a href = "logout.jsp" >退出</a></li>
				
			</ul>
			<div>
				 <img src="images/logo.png " alt="">
				<ul id="navigation">
					<li><a href="search1.jsp">请输入歌曲名</a></li>
					<li><a href="search2.jsp">请输入歌曲首字母</a></li>
					<li><a href="search3.jsp">请输入专辑名</a></li>
					<li><a href="search4.jsp">请输入专辑首字母</a></li>
					<li><a href="search5.jsp">请输入歌手名</a></li>
					<li class="selected"><a href="search6.jsp">请输入歌手首字母</a></li>
				</ul>
				<ul class="navigation">
					<div class="col-lg-6 col-lg-offset-4" style="margin-top:20px;">
	                <div class="input-group">
			         <form action = "searchresult.jsp" method="post" name = "form1" >
				       <input type="text" class="form-control" id="search_value" name="search_value"  placeholder="welcome to our music player !">
				       <input type="hidden" id="search_kind" name = "search_kind" value = "singer_firstchar">
					   <button class="btn btn-default" id="search"  type="submit">Search</button>
	      			  </form>
	   			   </div><!-- /input-group -->
	            </div><!-- /.col-lg-6 -->
	            </ul>
              </div><!-- /.row -->

<br><br>
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