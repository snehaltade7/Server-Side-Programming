package jdbccon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JdbcExample {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/student","root","12345");
		System.out.println("Connection Established");
		
		PreparedStatement ps=con.prepareStatement("insert into student_info values(1004,'Aashika','aashika@gmail.com','CSE')");
	       System.out.println("Statement created");
	       int i=ps.executeUpdate();
	       if (i>0)
	       	System.out.println("Record created");
	       else
	       	System.out.println("Insertion failed");
	}
}
