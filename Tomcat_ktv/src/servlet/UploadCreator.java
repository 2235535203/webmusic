package servlet;

import tool.Json;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Map;

import sql_connect.DatabaseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name="UploadCreator",urlPatterns = "/servlet/UploadCreator")
public class UploadCreator extends HttpServlet {
    private ResultSet rs=null;

    public UploadCreator(){super(); }

    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        System.out.println("getHere");
        request.setCharacterEncoding("utf-8");

        System.out.println("creator");

        String pre="select top1 c_id from creator order by c_id desc;";


        String sql="insert into creator (";
        String val="values(";

        //鍙栧緱琛ㄥ崟鏁版嵁锛屾彃鍏ql
        Enumeration fNames=request.getParameterNames();
        while(fNames.hasMoreElements()){
            String name=(String)fNames.nextElement();
            System.out.println(request.getParameter(name));
            if(request.getParameter(name)==""){
                System.out.println("continue: "+name);
                continue;
            }
            sql=sql+name+",";
            val=val+"\'"+request.getParameter(name)+"\',";
        }
        sql=sql.substring(0,sql.length()-1)+")";
        val=val.substring(0,val.length()-1)+")";

        System.out.println("sql+val:"+sql+val);

        response.sendRedirect(request.getContextPath()+"/adm_creator.jsp");


        //浣跨敤PrepareStatement鑾峰緱鑷涓婚敭鐨勮繑鍥炲��
        try{
            PreparedStatement ps=DatabaseUtil.getConnect1().prepareStatement(sql+val, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            rs=ps.getGeneratedKeys();
            rs.next();
            System.out.println(rs.getInt(1));

        }catch (SQLException e){
            System.out.println("doPost");
            System.out.println("SQLException: "+e.getMessage());
            System.out.println("SQLState: "+e.getSQLState());
            System.out.println("VendorError: "+e.getErrorCode());

            //e.printStackTrace();
        }

    }
}
