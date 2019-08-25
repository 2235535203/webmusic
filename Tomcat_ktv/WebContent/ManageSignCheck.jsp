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
    	String manage_id = request.getParameter("manage_id").toString();//从ManagerSign.jsp获取id
		String password = request.getParameter("password").toString();//从jsp获取password
		String sql = "select * from manager where manage_id="+manage_id+" and password='"+ password + "';";//查询语句
		try {
			//System.out.println(sql);
			DatabaseUtil.getConnect();
			ResultSet rs = DatabaseUtil.query(sql);
			//System.out.println(rs);
			if(rs.next()){
				session.setAttribute("manage_id",rs.getString("manage_id"));
				out.println("<script language='javascript'>alert('登录成功	！');sessionstorage.setItem('manage', 'ture');window.location.href='adm_revise.jsp';</script>");//跳转到管理页面
				
				//window.location.href='Home.jsp';
				}
				else{
				out.println("<script language='javascript'>alert('ID或密码错误，请重新登录！');window.location.href='ManagerSign.jsp';</script>");
				//密码不对返回到登陆
				}
			
			DatabaseUtil.closeConnection();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     %>
  </body>
</html>
