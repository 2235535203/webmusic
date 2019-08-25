package servlet;

import tool.Json;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import sql_connect.DatabaseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="LoadData",urlPatterns = "/servlet/LoadData")
public class LoadData extends HttpServlet {
    public LoadData(){
        super();
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String table="view_"+request.getParameter("page");
        String req=request.getParameter("req");
        String id=request.getParameter("id");


        String sql;
        if(req==""||req=="all"||req==null){//该情况下加载所有数据
            sql="select * from "+table+";";
        }
        else {//该情况下加载指定数据
            sql="select * from "+table+" where "+id+"="+req+";";
        }


        ResultSet rs=null;
        try{
            rs=DatabaseUtil.query(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }

        String jsonArr="";
        if(rs!=null){
            //json化
            try {
                jsonArr=Json.Result2JsonString(rs);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            response.setCharacterEncoding("utf-8");
            PrintWriter out=response.getWriter();
            out.write(jsonArr);
            out.close();
        }
    }
}

