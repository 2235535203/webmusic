package servlet;

import tool.Json;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Map;

import sql_connect.DatabaseUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContainerInitializer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 澶囨敞锛�
 Servlet鍔熻兘锛氫笂浼犱笓杈戜俊鎭細
 鎻忚堪锛氳幏鍙栧繀瑕佺殑鍙傛暟锛屽湪鏁版嵁搴撲腑鏂板缓涓�鏉℃暟鎹紱鑾峰緱鑷搴忓彿鍚庯紝璺宠浆鍒版柊椤甸潰锛屽～鍐欎笓杈戠殑鍏宠仈淇℃伅锛氬寘鍚殑姝屾洸锛屽弬涓庣殑鍒涗綔鑰�
 */

@WebServlet(name="UploadAlbum",urlPatterns = "/servlet/UploadAlbum")
public class UploadAlbum extends HttpServlet {
    private ResultSet rs=null;

    public UploadAlbum(){super(); }

    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        System.out.println("getHere");
        request.setCharacterEncoding("utf-8");

        System.out.println("album");

        String sql="insert into album (";
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

        int alb_id=0;

        //浣跨敤PrepareStatement鑾峰緱鑷涓婚敭鐨勮繑鍥炲��
        try{
            PreparedStatement ps=DatabaseUtil.getConnect1().prepareStatement(sql+val, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            rs=ps.getGeneratedKeys();
            rs.next();
            alb_id=rs.getInt(1);

        }catch (SQLException e){
            System.out.println("doPost");
            System.out.println("SQLException: "+e.getMessage());
            System.out.println("SQLState: "+e.getSQLState());
            System.out.println("VendorError: "+e.getErrorCode());

            response.sendRedirect(request.getContextPath()+"/adm_album.jsp");
            Writer out=response.getWriter();
            out.write("somthing wrong");
            //e.printStackTrace();
        }

        System.out.println(alb_id);
        System.out.println(request.getParameter("alb_name"));
        response.setCharacterEncoding("utf-8");

        //璺宠浆鍒版柊椤甸潰 缁х画濉啓涓撹緫淇℃伅
        request.setAttribute("main",alb_id);
        request.setAttribute("info",request.getParameter("alb_name"));

        ServletContext sc=getServletContext();
        RequestDispatcher rd=sc.getRequestDispatcher("/addConnect.jsp");
        rd.forward(request,response);
    }
}
