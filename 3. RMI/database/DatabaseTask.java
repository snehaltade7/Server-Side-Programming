import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.rmi.*;
import java.rmi.server.*;

public class DatabaseTask extends UnicastRemoteObject implements Database
{
   DatabaseTask() throws RemoteException
    {
        super();
    }
public String userLogin(String user, String password)
  {
      String s1 = " ";
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("driver loaded");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/userlogin","root","12345");
        
        String sql1 = "Select username,password from user_pass where username=? and password=?";
        
        PreparedStatement stmt = con.prepareStatement(sql1);
        stmt.setString(1,user);
        stmt.setString(2,password);

        ResultSet rs = stmt.executeQuery();

        if(rs.next()){
          s1 = "You are a valid user";
        }
        else{
          s1 = "Check your username and details";
        }
      }  
      catch(Exception e)
      {
        e.printStackTrace();
      } 
      return s1; 
    }            
}
  