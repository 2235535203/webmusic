package sql_connect;
import java.sql.*;

import sql_connect.DatabaseUtil;

public class Test {

	public void main(String args[]) throws SQLException {
	String sql="select max(m_id) from musicmessage;";
	ResultSet res=DatabaseUtil.query(sql);
	String output;
	output=res.toString();
	System.out.println(output);
	}
}
