package servlet;

import org.json.JSONObject;
import org.json.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import sql_connect.DatabaseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="ChangeData",urlPatterns = "/servlet/ChangeData")
public class ChangeData extends HttpServlet {
    public ChangeData() {
        super();
    }

    private static Map<String,String> pageMap;
    static{
        pageMap=new HashMap<>();
        pageMap.put("admin","table_admin");
    }

    private static Map<String,String> adminMap;
    static{
        adminMap=new HashMap<>();
        adminMap.put("a","admid");
        adminMap.put("b","account");
        adminMap.put("c","phone");
        adminMap.put("d","password");
        adminMap.put("e","record");
    }

    private static Map<String,Map<String,String>> mapMap;
    static{
        mapMap=new HashMap<>();
        mapMap.put("admin",adminMap);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String jsonStr=request.getParameter("revise");
        JSONObject obj=new JSONObject(jsonStr);

        //遍历取得表格
        String pageKey;
        Iterator pageKeys=obj.keys();
        while(pageKeys.hasNext()){
            pageKey=(String) pageKeys.next();
            System.out.println("pageKey:"+pageKey);
            JSONObject page=obj.getJSONObject(pageKey);

            //遍历取得行
            String rowKey;
            Iterator rowKeys=page.keys();
            while(rowKeys.hasNext()){
                rowKey=(String)rowKeys.next();
                System.out.println("rowKey:"+rowKey);
                JSONObject row=page.getJSONObject(rowKey);

                //遍历取得列
                String tdKey;
                String val;
                Iterator tdKeys=row.keys();
                while(tdKeys.hasNext()){
                    tdKey=(String)tdKeys.next();
                    System.out.println("tdKey:"+tdKey);
                    val=row.getString(tdKey);
                    System.out.println("val:"+val);

                    //根据id修改对应行的参数
                    PreparedStatement ps= null;
                    try {
                        System.out.println(pageMap.get(pageKey));
                        System.out.println(mapMap.get(pageKey).get(tdKey));
                        System.out.println("val"+val);
                        System.out.println(mapMap.get(pageKey).get("a"));
                        System.out.println(rowKey);

                        String sql="update "+pageMap.get(pageKey)+" set "+mapMap.get(pageKey).get(tdKey)+"=\'"+val+"\'where "+mapMap.get(pageKey).get("a")+"=\'"+rowKey+"\'";

                        System.out.println(sql);

                        DatabaseUtil.update(sql);

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}