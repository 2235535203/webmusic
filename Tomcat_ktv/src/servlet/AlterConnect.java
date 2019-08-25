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

@WebServlet(name="AlterConnect",urlPatterns = "/servlet/AlterConnect")
public class AlterConnect extends HttpServlet{

    public AlterConnect(){
        super();
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{

        request.setCharacterEncoding("utf-8");
        String page=request.getParameter("page");
        String table=request.getParameter("table");
        String type=request.getParameter("type");
        JSONObject obj=new JSONObject(request.getParameter("data"));

        //遍历准备
        String key;
        Iterator Keys=obj.keys();

        //sql
        String sql = null;
        String val;


        if(type.equals("add")){
            if(page.equals("album")){
                if(table.equals("music")){
                    sql="insert into musicinalbum (alb_id,m_id) ";
                }else{
                    sql="insert into creatormakealbum (alb_id,c_id)";
                }
            }else if(page.equals("creator")){
                sql="creatormakemusic";
            }


            //获取参数并插入sql
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
        else{//delete：删除

            if(page.equals("album")){
                if(table.equals("music")){
                    sql="delete from musicinalbum where m_id=";
                }else{
                    sql="delete from creatormakealbum where c_id=";
                }
            }else if(page.equals("creator")){
                sql="creatormakemusic";
            }


        }

        //获取参数并插入sql
        while(Keys.hasNext()){
            key=(String)Keys.next();

            try {
                System.out.println(sql+key+";");
                DatabaseUtil.update(sql+key+";");
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }
}
