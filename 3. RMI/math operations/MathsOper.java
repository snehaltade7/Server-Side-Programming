import java.rmi.*;
import java.rmi.server.*;
public class MathsOper extends UnicastRemoteObject implements Math
{
  //Default constructor to throws RemoteException
  // from its parent constructor
  MathsOper() throws RemoteException
{
  super();
}
  public int add(int a , int b)
{
  return (a+b);
}
 public int sub(int a , int b)
{
  return (a-b);
}
 public int div(int a , int b)
{
  return (a/b);
}
 public int mul(int a , int b)
{
  return (a*b);
}

}
