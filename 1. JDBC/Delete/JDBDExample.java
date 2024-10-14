package jdbcconnection3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBDExample {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver loaded");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/student","root","12345");
		System.out.println("Connection created");
		PreparedStatement ps=con.prepareStatement("DELETE FROM student_info WHERE roll_no=1004;");
       System.out.println("Statement created");
       int i=ps.executeUpdate();
       if (i>0)
       	System.out.println("Record deleted");
       else
       	System.out.println("Deletion failed");
	}

}
