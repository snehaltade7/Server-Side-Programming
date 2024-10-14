import java.rmi.*;
public class MatrixClient {
    public static void main(String args[]) {
        int a[][] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
        int b[][] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
        int[] c;
        try {
            // Lookup the remote object
            Matrix m1 = (Matrix) Naming.lookup("rmi://localhost:1900/matrix");
            // Call the remote method to add matrices
            c = m1.matAdd(a, b);
            // Print the result
            System.out.println("Addition of matrices:");
            for (int i = 0; i < c.length; i++) {
                System.out.print(c[i] + " ");
            }
            System.out.println(); // Move to the next line
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e);
        }
    }
}
