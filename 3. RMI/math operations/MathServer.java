import java.rmi.*;
import java.rmi.registry.*;
public class MathServer
{
  public static void main(String args[])
  {
    try{
         System.out.println("Server Started");
        //create an object of the interface implementation class
	Math obj= new MathsOper();
        //rmiregistry within the server JVM with port number 1900
         LocateRegistry.createRegistry(1900);
         //Binds the remote object by the name jnec
         Naming.rebind("rmi://localhost:1900"+"/jnec",obj);
}
catch (Exception ae)
{
  System.out.println(ae);
}
}
}