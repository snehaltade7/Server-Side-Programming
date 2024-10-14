import java.rmi.*;
public class MathClient
{
 public static void main(String args[])
{
  int a=10,b=20,ans1,ans2,ans3,ans4;
  try
  {
    //lookup method to finish reference of remote object
     Math m1 =(Math)Naming.lookup("rmi://localhost:1900"+"/jnec");
    ans1 = m1.add(a,b);
    System.out.println("Addition is "+ans1);
    ans2 = m1.sub(a,b);
    System.out.println("Subtraction is "+ans2);
    ans3 = m1.div(a,b);
    System.out.println("Division is "+ans3);
    ans4 =m1.mul(a,b);
    System.out.println("Multiplication is "+ans4);
}
catch(Exception ae)
{
  System.out.println(ae);
}
}
}