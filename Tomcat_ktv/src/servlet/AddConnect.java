package servlet;

import org.json.JSONObject;
import tool.Json;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import sql_connect.DatabaseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="AddConnect",urlPatterns = "/servlet/AddConnect")
public class AddConnect extends HttpServlet{

    public AddConnect(){
        super();
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        System.out.println("getHere");
        request.setCharacterEncoding("utf-8");

        System.out.println("add");


        String page=request.getParameter("page");//album :creatormake musicinalbum
                                        //creator
        String table=request.getParameter("table");//music creator

        String sql;
        String val;

        System.out.println(page);
        System.out.println(table);
        if(page=="album"){
            if(table=="music"){

            }else{
                sql="insert into creatormakealbum (alb_id,c_id)";
            }
        }else{
            sql="creatormakemusic";
        }

        sql="insert into musicinalbum (alb_id,m_id) ";


        JSONObject obj=new JSONObject(request.getParameter("data"));

        String key;
        Iterator Keys=obj.keys();
        while(Keys.hasNext()){
            key=(String)Keys.next();

            val="values("+obj.getInt(key)+","+key+");";

            try {
                System.out.println(sql+val);
                DatabaseUtil.update(sql+val);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}
