import java.rmi.*;
public interface Matrix extends Remote {
    int[] matAdd(int[][] a, int[][] b) throws RemoteException;
}
