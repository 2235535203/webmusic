package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import tool_class.Search_kind;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String resCode = "";
		String resMsg = "";
		String search_kind=request.getParameter("search_kind");
		String search_value=request.getParameter("search_value");
		String searchsql="";
		String test_sql="select * from search_musicbyfirstchar";
		switch (search_kind) {
		case "music_firstchar":{
			//��������ĸ����
			searchsql="select * from search_musicbyfirstchar where music_firstchar = '"+search_value+"';";
			Search_kind.json_searchdata(searchsql,resMsg,response);
			//System.out.println(search_kind);
		//	System.out.println(search_value);
		}
		case "music_name":{
			//����ȫ������
			//System.out.println(search_kind);
			//System.out.println(search_value);
			searchsql="select * from search_musicbyname where music_name = '"+search_value+"';";
			Search_kind.json_searchdata(searchsql,resMsg,response);
		}
		case "singer_name":{
			//����ȫ������
			searchsql="select * from search_singername where creator_name = '"+search_value+"';";
			Search_kind.json_searchdata(searchsql,resMsg,response);
		}
		case "singer_firstchar":{
			//������������ĸ��д����
			searchsql="select * from search_singerfirstchar where firstchar = '"+search_value+"';";
			Search_kind.json_searchdata(searchsql,resMsg,response);
		}
		case "album_name":{
			//ר������ȫ������
			searchsql="select * from search_albumname where album_name = '"+search_value+"';";
			Search_kind.json_searchdata(searchsql,resMsg,response);
		}
		case "album_firstchar":{
			//ר����������ĸ����
			searchsql="select * from search_albumfirstchar where firstchar = '"+search_value+"';";
			Search_kind.json_searchdata(searchsql,resMsg,response);
		}
		case "information_singer":{
			//��ȡ������Ϣ
			searchsql="select * from infromation_singer where singer_id = '"+search_value+"';";
			Search_kind.json_searchdata(searchsql,resMsg,response);
		}
		case "play_music":{
			//��ȡ������������йص���Դ��ַ
			System.out.println(search_kind);
				System.out.println(search_value);
			searchsql="select * from play_music where music_id = '"+search_value+"';";
			Search_kind.json_searchdata(searchsql,resMsg,response);
		}
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
