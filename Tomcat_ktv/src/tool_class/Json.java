package tool_class;
import java.sql.*;
import org.json.*;;
public class Json {
	public static String ResultsetToJson1(ResultSet rs) throws SQLException,JSONException  
	{  
	   // json数组  
	   JSONArray array = new JSONArray();  
	    
	   // 获取列数  
	   ResultSetMetaData metaData = rs.getMetaData();  
	   int columnCount = metaData.getColumnCount();  
	    
	   // 遍历ResultSet中的每条数据  
	    while (rs.next()) {  
	        JSONObject jsonObj = new JSONObject();  
	         
	        // 遍历每一列  
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
     * 把ResultSet集合转换成JsonArray数组
     * 
     * @param rs
     * @return
     * @throws Exception
     */
    public static JSONArray ResultsetToJsonArray(ResultSet rs) throws Exception {
        ResultSetMetaData md = rs.getMetaData();// 获取表结构
        int num = md.getColumnCount();// 得到行的总数
        JSONArray array = new JSONArray();// json数组，根据下标找值；[{name1:wp},{name2:{name3:'ww'}}]name为key值，wp为value值
        // JSONArray array=JSONArray.fromObject(String);将String转换为JSONArray格式
        while (rs.next()) {// 如果结果集中有值
            JSONObject mapOfColValues = new JSONObject();// 创建json对象就是一个{name:wp}
            for (int i = 1; i <= num; i++) {
                mapOfColValues.put(md.getColumnName(i), rs.getObject(i));// 添加键值对，比如说{nam e:Wp}通过name找到wp
                //System.out.println(mapOfColValues.toString());
            }
            array.put(mapOfColValues);
        }
        return array;
    }
}
