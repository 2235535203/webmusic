package servlet;

import tool.Json;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
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
@WebServlet(name="LoadConnect",urlPatterns = "/servlet/LoadConnect")
public class LoadConnect extends HttpServlet {
    public LoadConnect() {
        super();
    }
    private static Map<String,String>map;
    static {
        map=new HashMap<>();
        map.put("music","m_id");
        map.put("creator","c_id");
        map.put("album","alb_id");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String table=request.getParameter("page");
        String type=request.getParameter("type");
        String id=request.getParameter("id");


        //准备sql语句
        String Table="";
        if(table.equals("album")){
            if(type.equals("music")){
                Table=type+"in"+table;
            }else Table=type+"make"+table;
        }
        else{
        }


        ResultSet rs = null;
        String sql="select view_"+type+".* from (select "+map.get(type)+" as a from "+Table+" where "+map.get(table)+"="+id+" )as t1 natural join view_"+type+";";

        try {
            rs=DatabaseUtil.query(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        


        //取得数据
        String jsonArr="";
        try {
            jsonArr=Json.Result2JsonString(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //传送到页面
        response.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        out.write(jsonArr);
        out.close();
    }
}
