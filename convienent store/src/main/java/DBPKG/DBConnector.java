package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnector {
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jaehyuk", "1234");
		return con;
	}
	
	public static void disConnection(ResultSet rs, PreparedStatement stmt, Connection conn) throws Exception{
		if(rs!=null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	public static void disConnection(PreparedStatement stmt, Connection conn) throws Exception{
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
}
