import java.rmi.*;
import java.rmi.registry.*;
public class MatrixServer {
    public static void main(String args[]) {
        try {
            System.out.println("Server Started...");
           
            // Create an instance of MatrixMethods
            Matrix obj = new MatrixMethods();
           
            // Create and start a registry on port 1900
            LocateRegistry.createRegistry(1900);
           
            // Bind the remote object's stub in the registry
            Naming.rebind("rmi://localhost:1900/matrix", obj);
           
            System.out.println("Matrix server ready.");
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e);
        }
    }
}
