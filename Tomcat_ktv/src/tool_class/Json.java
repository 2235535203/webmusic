package tool_class;
import java.sql.*;
import org.json.*;;
public class Json {
	public static String ResultsetToJson1(ResultSet rs) throws SQLException,JSONException  
	{  
	   // json����  
	   JSONArray array = new JSONArray();  
	    
	   // ��ȡ����  
	   ResultSetMetaData metaData = rs.getMetaData();  
	   int columnCount = metaData.getColumnCount();  
	    
	   // ����ResultSet�е�ÿ������  
	    while (rs.next()) {  
	        JSONObject jsonObj = new JSONObject();  
	         
	        // ����ÿһ��  
	        for (int i = 1; i <= columnCount; i++) {  
	            String columnName =metaData.getColumnLabel(i);  
	            String value = rs.getString(columnName);  
	            jsonObj.put(columnName, value);  
	        }   
	        array.put(jsonObj);   
	    }  
	    
	   return array.toString();  
	}  
public static JSONObject ResultsetToJson(ResultSet rs) throws SQLException {
	 ResultSetMetaData metaData = rs.getMetaData(); 
	 JSONObject jsonObj=new JSONObject();
	 if(rs.next()) {
		
		 String columnName =metaData.getColumnLabel(1);  
         String value = rs.getString(columnName);  
         jsonObj.put(columnName, value);  
         return jsonObj;
	 }
	 else return jsonObj;
}
    /**
     * ��ResultSet����ת����JsonArray����
     * 
     * @param rs
     * @return
     * @throws Exception
     */
    public static JSONArray ResultsetToJsonArray(ResultSet rs) throws Exception {
        ResultSetMetaData md = rs.getMetaData();// ��ȡ��ṹ
        int num = md.getColumnCount();// �õ��е�����
        JSONArray array = new JSONArray();// json���飬�����±���ֵ��[{name1:wp},{name2:{name3:'ww'}}]nameΪkeyֵ��wpΪvalueֵ
        // JSONArray array=JSONArray.fromObject(String);��Stringת��ΪJSONArray��ʽ
        while (rs.next()) {// ������������ֵ
            JSONObject mapOfColValues = new JSONObject();// ����json�������һ��{name:wp}
            for (int i = 1; i <= num; i++) {
                mapOfColValues.put(md.getColumnName(i), rs.getObject(i));// ��Ӽ�ֵ�ԣ�����˵{nam e:Wp}ͨ��name�ҵ�wp
                //System.out.println(mapOfColValues.toString());
            }
            array.put(mapOfColValues);
        }
        return array;
    }
}
