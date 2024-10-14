package jdbcconnection4;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class JDBCExample2 {
	public static void main(String[] args) throws ClassNotFoundException, SQLException   {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver loaded");
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/student","root","12345");
		System.out.println("Connection created");
		Statement statement = con.createStatement();
		PreparedStatement ps=con.prepareStatement("insert into student_info values(3076,'Snehal Patil','snehal@gmail.com','CSE')");
	       System.out.println("Statement created");
	       int i=ps.executeUpdate();
	       if (i>0)
	       	System.out.println("Record created");
	       else
	       	System.out.println("Insertion failed");
       ResultSet rs = statement.executeQuery("select * from student_info");
       while(rs.next())
       System.out.println(" | " + rs.getInt(1) + " | "+ rs.getString(2)+" | " + rs.getString(3)+" | " + rs.getString(4)+" | ");
       rs.close();
       statement.close();
  } 
}

