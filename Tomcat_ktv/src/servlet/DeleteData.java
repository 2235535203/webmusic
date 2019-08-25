package servlet;

import org.json.JSONObject;
import org.json.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import sql_connect.DatabaseUtil;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="DeleteData",urlPatterns = "/servlet/DeleteData")
public class DeleteData extends HttpServlet {

    public DeleteData(){super();}

    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
        System.out.println("getHere");
        request.setCharacterEncoding("utf-8");
        String table=request.getParameter("page");
        System.out.println(table);
        switch(table){
            case "admin":
                String str=request.getParameter("data");
                System.out.println("str:"+str);
                JSONObject obj=new JSONObject(str);
                System.out.println("val:obj.getInt(\"a\")");
                String sql="delete from table_admin where admid="+obj.getInt("a")+";";
                try {
                    DatabaseUtil.update(sql);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }

    }

}
