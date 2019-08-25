package tool;

import java.sql.*;

//import org.jetbrains.annotations.NotNull;
import org.json.*;

public class Json {
    public static String Result2JsonString(ResultSet rs) throws SQLException {
        JSONArray array=new JSONArray();

        ResultSetMetaData metaData=rs.getMetaData();
        System.out.println(metaData.toString());
        int columnCount=metaData.getColumnCount();

        while (rs.next()) {
            JSONObject jsonObj=new JSONObject();

            for(int i=1;i<=columnCount;i++){
                String columnName=metaData.getColumnLabel(i);
                String value=rs.getString(columnName);
                jsonObj.put(columnName,value);
                System.out.println(jsonObj.toString());
            }
            array.put(jsonObj);
        }

        return array.toString();
    }
}
