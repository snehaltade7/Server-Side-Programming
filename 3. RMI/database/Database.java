import java.rmi.*;
public interface Database extends Remote
{
  public String userLogin(String user, String password) throws RemoteException;
} 