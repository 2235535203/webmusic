package servlet;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import sql_connect.Insert;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class Uploading
 */

/**
 * 
 * @author Administrator
 * �ļ��ϴ�
 * ���岽�裺
 * 1����ô����ļ���Ŀ���� DiskFileItemFactory Ҫ����
 * 2�� ���� request ��ȡ ��ʵ·�� ������ʱ�ļ��洢���� �����ļ��洢 ���������洢λ�ÿɲ�ͬ��Ҳ����ͬ
 * 3���� DiskFileItemFactory ��������һЩ ����
 * 4����ˮƽ��API�ļ��ϴ�����  ServletFileUpload upload = new ServletFileUpload(factory);
 * Ŀ���ǵ��� parseRequest��request������  ��� FileItem ����list ��
 *     
 * 5���� FileItem ������ ��ȡ��Ϣ��   ������ �ж� ���ύ��������Ϣ �Ƿ��� ��ͨ�ı���Ϣ  ��������
 * 6��
 *    ��һ��. �õ����� �ṩ��  item.write( new File(path,filename) );  ֱ��д��������
 *    �ڶ���. �ֶ�����  
 *
 */
@WebServlet("/Addmusic")
public class Addmusic extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addmusic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");	//���ñ���
		String music_name="";
		String singer_name="";
		String lyricist="";
		String arrangenment="";
		String remark="";
		String video_location="";
		String audio_location="";
		String accmopany_location="";
		int resCode=0;
		
		//��ô����ļ���Ŀ����
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//��ȡ�ļ���Ҫ�ϴ�����·��
		//String path = request.getSession().getServletContext().getRealPath("/upload");
		String path="E:/Tomcat������/storage";
		//System.out.println(path);
		
		//���û�����������õĻ����ϴ���� �ļ� ��ռ�� �ܶ��ڴ棬
		//������ʱ��ŵ� �洢�� , ����洢�ң����Ժ� ���մ洢�ļ� ��Ŀ¼��ͬ
		/**
		 * ԭ�� �����ȴ浽 ��ʱ�洢�ң�Ȼ��������д�� ��ӦĿ¼��Ӳ���ϣ� 
		 * ������˵ ���ϴ�һ���ļ�ʱ����ʵ���ϴ������ݣ���һ������ .tem ��ʽ�� 
		 * Ȼ���ٽ�������д�� ��ӦĿ¼��Ӳ����
		 */
		factory.setRepository(new File(path));
		//���� ����Ĵ�С�����ϴ��ļ������������û���ʱ��ֱ�ӷŵ� ��ʱ�洢��
		factory.setSizeThreshold(100*1024*1024) ;
		
		//��ˮƽ��API�ļ��ϴ�����
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		
		try {
			//�����ϴ�����ļ�
			List<FileItem> list = (List<FileItem>)upload.parseRequest(request);
			
			for(FileItem item : list)
			{
				//��ȡ������������
				String name = item.getFieldName();
				//�����ȡ�� ����Ϣ����ͨ�� �ı� ��Ϣ
				if(item.isFormField())
				{	
					
				    System.out.println(name);
				    String value = item.getString("GBK") ;
					if(name.equals("music_name")){
						music_name=value;
					};
					if(name.equals("singer_name")){
						singer_name=value;
					};
					if(name.equals("remark")){
						remark=value;
					};
					if(name.equals("lyricist")) {
						lyricist=name;
					}
					if(name.equals("arrangenment")) {
						arrangenment=name;
					}
					
					
					/*				
					//��ȡ�û�����������ַ��� ���������ͦ�ã���Ϊ���ύ�������� �ַ������͵�
					String value = item.getString() ;
					request.setAttribute(name, value);*/
				}
				//�Դ���ķ� �򵥵��ַ������д��� ������˵�����Ƶ� ͼƬ����Ӱ��Щ
				else
				{
					/**
					 * ������������Ҫ��ȡ �ϴ��ļ�������
					 */
					//��ȡ·����
					String value = item.getName() ;
					//���������һ����б��
					int start = value.lastIndexOf("\\");
					//��ȡ �ϴ��ļ��� �ַ������֣���1�� ȥ����б�ܣ�
					String filename = value.substring(start+1);
					
					if(name.equals("video")){
						path="E:/Tomcat������/storage/video/";
						video_location="/vidio/"+filename;
					}
					if(name.equals("avdio")){
						path="E:/Tomcat������/storage/audio/";
						audio_location="/audio/"+filename;
					}
					if(name.equals("accmopany")){
						path="E:/Tomcat������/storage/accmopany/";
						accmopany_location="/accmopany/"+filename;
					}
					
					//request.setAttribute(name, filename);
					
					//����д��������
					//���׳����쳣 ��exception ��׽
					
					item.write( new File(path,filename) );//�������ṩ��
					/*
					 * System.out.println(path+filename);
					
					//�ֶ�д��
					OutputStream out = new FileOutputStream(new File(path,filename));
					
					InputStream in = item.getInputStream() ;
					
					int length = 0 ;
					byte [] buf = new byte[1024] ;
					
					System.out.println("��ȡ�ϴ��ļ����ܹ���������"+item.getSize());
 
					// in.read(buf) ÿ�ζ��������ݴ����   buf ������
					while( (length = in.read(buf) ) != -1)
					{
						//��   buf ������ ȡ������ д�� ���������������
						out.write(buf, 0, length);
					    
					}
					
					in.close();
					out.close();
					
					*/
				}
			}
			
			
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			
			//e.printStackTrace();
		}
		
		System.out.println(music_name);
		System.out.println(singer_name);
		System.out.println(remark);
		System.out.println(lyricist);
		System.out.println(arrangenment);
	    try {
			 resCode=Insert.addmusic(music_name, singer_name, lyricist, arrangenment, remark, video_location, audio_location, accmopany_location);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
	    
	    response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8"); // ������Ӧ���ĵı����ʽ
		PrintWriter out = response.getWriter(); // ��ȡ response �������
	 // ͨ���������ҵ���߼��Ľ�����	
		try {
		    out = response.getWriter();
		    out.write(resCode);
		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
		    if (out != null) {
		    	out.flush(); 
		        out.close();
		    }
		}
	    
		
		//request.getRequestDispatcher("filedemo.jsp").forward(request, response);
		
 
	}

	}


