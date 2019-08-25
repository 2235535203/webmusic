package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import tool_class.Search_kind;
import tool_class.Json;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String manage_id=request.getParameter("manage_id");
		String password=request.getParameter("password");
	    String resCode = "";
		String manage_level = "";
		String  querysql="select manage_level from manager where manage_id = '"+manage_id+"' and password = '"+password+"';";
		Search_kind.json_searchdata(querysql,resCode,response);
		/*response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8"); // 设置响应报文的编码格式
		PrintWriter out = response.getWriter(); // 获取 response 的输出流
	
		 // 通过输出流把业务逻辑的结果输出	
	
		try {
			JSONObject map = new JSONObject();
		manage_level=Search_kind.login(manage_id,password,resCode);
				
				map.put("resCode", resCode);
				map.put("manage_level", manage_level);
				try {
					out = response.getWriter();
			        out.println(manage_level);
				    
				} catch (IOException e) {
				    e.printStackTrace();
				} finally {
				    if (out != null) {
				    	out.flush(); 
				        out.close();
				    }
				}
		
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}*/
	
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
