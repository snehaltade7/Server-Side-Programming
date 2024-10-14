import java.rmi.*;
import java.rmi.server.*;
public class MatrixMethods extends UnicastRemoteObject implements Matrix {  
    MatrixMethods() throws RemoteException {
        super();
    }  
    @Override
    public int[] matAdd(int[][] a, int[][] b) throws RemoteException {
        int r = a.length;
        int c = a[0].length; // Assuming all rows have the same length
        int[] res = new int[r * c];
        int index = 0;
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                res[index++] = a[i][j] + b[i][j];
            }
        }
        return res;
    }
}
