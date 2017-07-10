/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tcp;

import java.io.EOFException;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 *
 * @author Leandro Ensina
 */
public class ClienteTCP {

    public static void main(String args[]){
    
        Socket s = null;
        
        try{
            int serverPort = 7896;
            s = new Socket(args[1], serverPort);
        }catch(UnknownHostException e){System.out.println("Socket: " + e.getMessage());
        }catch(EOFException e){System.out.println("EOF: " + e.getMessage());
        }catch(IOException e){System.out.println("IO: " + e.getMessage());
        }finally{
            if(s != null)
                try{
                    s.close();
                }catch(IOException e){
                    System.out.println("close: " + e.getMessage());
                }
        }
    
    }
    
}
