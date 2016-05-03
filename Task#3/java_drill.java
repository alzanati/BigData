package connectJdbcDrill;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.drill.jdbc.Driver;


public class connectJDBCDrill {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		Class.forName("org.apache.drill.jdbc.Driver"); // to throw exception if Driver not found
		Connection connection =  new Driver().connect("jdbc:drill:drillbit=localhost", null);
		Statement st = connection.createStatement();
		String sql1 = "use hbase";
		String sql2 = "select convert_from(row_key, 'UTF8') as id, convert_from(emp.name.first_name, 'UTF8') as first_name, convert_from(emp.name.last_name, 'UTF8') as last_name from emp";
		ResultSet rss = st.executeQuery(sql1);
		ResultSet rs = st.executeQuery(sql2);
		
		while(rs.next()){
			System.out.print(rs.getString("id") + "\t");
			System.out.print(rs.getString("first_name") + "\t");
			System.out.println(rs.getString("last_name") + "\t");
		}
	}

}
