<%@ page language="java" import="java.util.*,sql_connect.DatabaseUtil,java.sql.*,java.io.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8" %>	
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>SignCheck.jsp</title>
    <meta charset="UTF-8">
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
    <%
    	response.setContentType("text/html;charset=utf-8");
    	response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("name").toString();
		String password = request.getParameter("pw").toString();
		String address = request.getParameter("email").toString();
		String sql = "INSERT INTO `users`(username,`password`,VIP,email_address) VALUES ('"+username+"','"+password+"',"+0+",'"+address+"')";
		String sql1 = "select * from users where username='"+username+"'";//查询语句
		try {
			DatabaseUtil.getConnect();
			ResultSet rs = DatabaseUtil.query(sql1);
			if(rs.next()){
				out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='register.jsp';</script>");  
				//response.sendRedirect("search1.jsp");
				//window.location.href='Home.jsp';
				}
			else{
				 int rs1 = DatabaseUtil.update(sql);//向table users 插入数据
				 if(rs1 != 0) {
					 out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='signin.jsp';</script>"); 
					}
				 else
				 {
				 	out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='register.jsp';</script>");
				 }
				}
			
			DatabaseUtil.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     %>
  </body>
</html>
