import java.rmi.*;
import java.rmi.registry.*;
public class DatabaseServer
{
	public static void main(String args[])
	{
		try
		{
		System.out.println("Server started...");
		Database obj = new DatabaseTask();
		LocateRegistry.createRegistry(1900);
		Naming.rebind("rmi://localhost:1900"+"/userlogin",obj);
		}
		catch(Exception ae)
		{
		System.out.println(ae);	
		}
	}
}