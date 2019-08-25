package tool_class;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import sql_connect.DatabaseUtil;
import org.json.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tool_class.Json;

public class Search_kind {
	public static void json_searchdata(String searchsql,String resMsg,HttpServletResponse response) throws IOException {
		ResultSet res=null;
		JSONArray array = new JSONArray();
	try {
		 res = DatabaseUtil.query (searchsql);
		} catch (SQLException e) {
		// TODO �Զ����ɵ� catch ��
		e.printStackTrace();
		}
		finally{
			if(res==null) {
				resMsg="Can not search anything about it";
				System.out.print(resMsg);
			}
			else {
				try {
					array=Json.ResultsetToJsonArray(res);
				} catch (Exception e) {
					// TODO �Զ����ɵ� catch ��
					e.printStackTrace();
				}
			}
		}
    response.setCharacterEncoding("UTF-8");
	response.setContentType("text/json;charset=utf-8"); // ������Ӧ���ĵı����ʽ
	PrintWriter out = response.getWriter(); // ��ȡ response �������
 // ͨ���������ҵ���߼��Ľ�����	
	try {
	    out = response.getWriter();
	    String teststring=array.toString();
	    System.out.println(array.toString());
	    out.write(teststring);
	    //out.print(array.toString());
	} catch (IOException e) {
	    e.printStackTrace();
	} finally {
	    if (out != null) {
	    	out.flush(); 
	        out.close();
	    }
	}
	}
	
	public static void login(String searchsql,String resCode,HttpServletResponse response) throws SQLException, IOException {
		ResultSet res=null; 
		String querysql="";
		String manage_level="";
		JSONObject job=new JSONObject();
		JSONArray array = new JSONArray();
	try {
		 res = DatabaseUtil.query (searchsql);
		} catch (SQLException e) {
		// TODO �Զ����ɵ� catch ��
		e.printStackTrace();
		}
		finally{
			if(res==null) {
				resCode="201";
			}
			else {
				resCode="200";
				try {
					array=Json.ResultsetToJsonArray(res);
				} catch (Exception e) {
					// TODO �Զ����ɵ� catch ��
					e.printStackTrace();
				}
			}
		}
    response.setCharacterEncoding("UTF-8");
	response.setContentType("text/json;charset=utf-8"); // ������Ӧ���ĵı����ʽ
	PrintWriter out = response.getWriter(); // ��ȡ response �������
 // ͨ���������ҵ���߼��Ľ�����	
	try {
	    out = response.getWriter();
	    out.write(resCode);
	    out.write(array.toString());
	} catch (IOException e) {
	    e.printStackTrace();
	} finally {
	    if (out != null) {
	    	out.flush(); 
	        out.close();
	    }
	}
	}
	
}
