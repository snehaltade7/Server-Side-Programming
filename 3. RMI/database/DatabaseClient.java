import java.rmi.*;

public class DatabaseClient extends Database
{
	public static void main(String [] args)
	{
       		String u1 = "SnehalTade",password="Snehal123";
		String response;
		try
		{
			Database db = (Database)Naming.lookup("rmi://localhost:1900"+"/userlogin");
			response = db.userLogin(u1,password);
			System.out.println("Server Response : "+response);
		}
		catch(Exception ae)
		{
		System.out.println(ae);
		}
		
	}
}