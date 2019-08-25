package servlet;

import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sql_connect.DatabaseUtil;

/**
 * Servlet implementation class Uploading
 */

/**
 *
 * @author Administrator
 * 鏂囦欢涓婁紶
 * 鍏蜂綋姝ラ锛�
 * 1锛夎幏寰楃鐩樻枃浠舵潯鐩伐鍘� DiskFileItemFactory 瑕佸鍖�
 * 2锛� 鍒╃敤 request 鑾峰彇 鐪熷疄璺緞 锛屼緵涓存椂鏂囦欢瀛樺偍锛屽拰 鏈�缁堟枃浠跺瓨鍌� 锛岃繖涓や釜瀛樺偍浣嶇疆鍙笉鍚岋紝涔熷彲鐩稿悓
 * 3锛夊 DiskFileItemFactory 瀵硅薄璁剧疆涓�浜� 灞炴��
 * 4锛夐珮姘村钩鐨凙PI鏂囦欢涓婁紶澶勭悊  ServletFileUpload upload = new ServletFileUpload(factory);
 * 鐩殑鏄皟鐢� parseRequest锛坮equest锛夋柟娉�  鑾峰緱 FileItem 闆嗗悎list 锛�
 *
 * 5锛夊湪 FileItem 瀵硅薄涓� 鑾峰彇淇℃伅锛�   閬嶅巻锛� 鍒ゆ柇 琛ㄥ崟鎻愪氦杩囨潵鐨勪俊鎭� 鏄惁鏄� 鏅�氭枃鏈俊鎭�  鍙﹀仛澶勭悊
 * 6锛�
 *    绗竴绉�. 鐢ㄧ涓夋柟 鎻愪緵鐨�  item.write( new File(path,filename) );  鐩存帴鍐欏埌纾佺洏涓�
 *    绗簩绉�. 鎵嬪姩澶勭悊
 *
 */
@WebServlet(name="UploadMusic",urlPatterns = "/servlet/UploadMusic")
public class UploadMusic extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadMusic() {
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

        request.setCharacterEncoding("utf-8");	//璁剧疆缂栫爜
        String m_name="";
        String c_id="";
        String singer_name="";
        String lyricist_id="";
        String lyricist_name="";
        String arrangement_id="";
        String composer_name="";
        String remark="";
        String contributor="";
        String firstchar = "";

        String video_location="";
        String picture="";
        String lrc_location="";
        String audio_location="";
        String acmp_location="";
        int resCode=0;

        //鑾峰緱纾佺洏鏂囦欢鏉＄洰宸ュ巶
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //鑾峰彇鏂囦欢闇�瑕佷笂浼犲埌鐨勮矾寰�
        //String path = request.getSession().getServletContext().getRealPath("/upload");
        String path="E:/sql/storage";
        //System.out.println(path);

        //濡傛灉娌′互涓嬩袱琛岃缃殑璇濓紝涓婁紶澶х殑 鏂囦欢 浼氬崰鐢� 寰堝鍐呭瓨锛�
        //璁剧疆鏆傛椂瀛樻斁鐨� 瀛樺偍瀹� , 杩欎釜瀛樺偍瀹わ紝鍙互鍜� 鏈�缁堝瓨鍌ㄦ枃浠� 鐨勭洰褰曚笉鍚�
        /**
         * 鍘熺悊 瀹冩槸鍏堝瓨鍒� 鏆傛椂瀛樺偍瀹わ紝鐒跺悗鍦ㄧ湡姝ｅ啓鍒� 瀵瑰簲鐩綍鐨勭‖鐩樹笂锛�
         * 鎸夌悊鏉ヨ 褰撲笂浼犱竴涓枃浠舵椂锛屽叾瀹炴槸涓婁紶浜嗕袱浠斤紝绗竴涓槸浠� .tem 鏍煎紡鐨�
         * 鐒跺悗鍐嶅皢鍏剁湡姝ｅ啓鍒� 瀵瑰簲鐩綍鐨勭‖鐩樹笂
         */
        factory.setRepository(new File(path));
        //璁剧疆 缂撳瓨鐨勫ぇ灏忥紝褰撲笂浼犳枃浠剁殑瀹归噺瓒呰繃璇ョ紦瀛樻椂锛岀洿鎺ユ斁鍒� 鏆傛椂瀛樺偍瀹�
        factory.setSizeThreshold(100*1024*1024) ;

        //楂樻按骞崇殑API鏂囦欢涓婁紶澶勭悊
        ServletFileUpload upload = new ServletFileUpload(factory);


        try {
            //鍙互涓婁紶澶氫釜鏂囦欢
            List<FileItem> list = (List<FileItem>)upload.parseRequest(request);

            for(FileItem item : list)
            {
                //鑾峰彇琛ㄥ崟鐨勫睘鎬у悕瀛�
                String name = item.getFieldName();
                //濡傛灉鑾峰彇鐨� 琛ㄥ崟淇℃伅鏄櫘閫氱殑 鏂囨湰 淇℃伅
                if(item.isFormField())
                {

                    String value = item.getString("utf-8") ;
                    if(name.equals("m_name")){
                        m_name=value;
                    };
                    if(name.equals("singer_name")){
                        singer_name=value;
                    };
                    if(name.equals("remark")){
                        remark=value;
                    };
                    if(name.equals("lyricist_id")) {
                        lyricist_id=value;
                    }
                    if(name.equals("arrangement_id")) {
                        arrangement_id=value;
                    }
                    if(name.equals("composer_name")) {
                        composer_name=value;
                    }
                    if(name.equals("contributor")) {
                        contributor=value;
                    }
                    if(name.equals("picture")) {
                        picture=value;
                    }
                    if(name.equals("c_id")) {
                        c_id=value;
                    }
                    if(name.equals("lyricist_name")) {
                        lyricist_name=value;
                    }
                    if(name.equals("firstchar")) {
                        firstchar=value;
                    }



					/*
					//鑾峰彇鐢ㄦ埛鍏蜂綋杈撳叆鐨勫瓧绗︿覆 锛屽悕瀛楄捣寰楁尯濂斤紝鍥犱负琛ㄥ崟鎻愪氦杩囨潵鐨勬槸 瀛楃涓茬被鍨嬬殑
					String value = item.getString() ;
					request.setAttribute(name, value);*/
                }
                //瀵逛紶鍏ョ殑闈� 绠�鍗曠殑瀛楃涓茶繘琛屽鐞� 锛屾瘮濡傝浜岃繘鍒剁殑 鍥剧墖锛岀數褰辫繖浜�
                else
                {
                    /**
                     * 浠ヤ笅涓夋锛屼富瑕佽幏鍙� 涓婁紶鏂囦欢鐨勫悕瀛�
                     */
                    //鑾峰彇璺緞鍚�
                    String value = item.getName() ;
                    //绱㈠紩鍒版渶鍚庝竴涓弽鏂滄潬
                    int start = value.lastIndexOf("\\");
                    String ext=value.substring(value.lastIndexOf("."));
                    //鎴彇 涓婁紶鏂囦欢鐨� 瀛楃涓插悕瀛楋紝鍔�1鏄� 鍘绘帀鍙嶆枩鏉狅紝
                    String filename = UUID.randomUUID()+ext;

                    if(name.equals("video_location")){
                        path="E:/Tomcat服务器/storage/video/";
                        video_location="/video/"+filename;
                    }
                    if(name.equals("audio_location")){
                        path="E:/Tomcat服务器/storage/audio/";
                        audio_location="/audio/"+filename;
                    }
                    if(name.equals("acmp_location")){
                        path="E:/Tomcat服务器/storage/acmp/";
                        acmp_location="/accmopany/"+filename;
                    }
                    if(name.equals("lrc_location")){
                        path="E:/Tomcat服务器/storage/lrc/";
                        lrc_location="/lrc/"+filename;
                    }
                    if(name.equals("picture")){
                        path="E:/Tomcat服务器/storage/cover/";
                        picture=path+filename;
                    }

                    item.write( new File(path,filename) );
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

        ResultSet rs;
        int m_id = 0;

        try{
            String music_sql="insert into musicmessage (m_name,remark,firstchar,picture) values(\'"+m_name+"\',\'"+remark+"\',\'"+firstchar+"\',\'"+picture+"\')";

            PreparedStatement ps= DatabaseUtil.getConnect1().prepareStatement(music_sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            rs=ps.getGeneratedKeys();
            rs.next();
            m_id=rs.getInt(1);

        }catch (SQLException e){
            System.out.println("doPost");
            System.out.println("SQLException: "+e.getMessage());
            System.out.println("SQLState: "+e.getSQLState());
            System.out.println("VendorError: "+e.getErrorCode());

            //e.printStackTrace();
        }

        String sql;

        if(video_location!=""){
            sql="insert into video (m_id,location) values("+m_id+",\'"+video_location+"\');";
            try {

                DatabaseUtil.update(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(audio_location!=""){
            sql="insert into audio (m_id,location) values("+m_id+",\'"+audio_location+"\');";
            try {

                DatabaseUtil.update(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(acmp_location!=""){
            sql="insert into accompany (m_id,location) values("+m_id+",\'"+acmp_location+"\');";
            try {
                DatabaseUtil.update(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(lrc_location!=""){
            sql="insert into accompany (m_id,location,contributor) values("+m_id+",\'"+lrc_location+"\',"+contributor+");";
            try {
                DatabaseUtil.update(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        response.sendRedirect(request.getContextPath()+"/adm_music.jsp");

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8"); // 璁剧疆鍝嶅簲鎶ユ枃鐨勭紪鐮佹牸寮�
        PrintWriter out = response.getWriter(); // 鑾峰彇 response 鐨勮緭鍑烘祦
        // 閫氳繃杈撳嚭娴佹妸涓氬姟閫昏緫鐨勭粨鏋滆緭鍑�
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
    }

}

