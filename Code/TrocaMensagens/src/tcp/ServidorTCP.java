/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tcp;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 *
 * @author Leandro Ensina
 */
public class ServidorTCP {
    
    public static void main(String args[]){
        
        try{
        
            int serverPort = 7896;
            ServerSocket listenSocket = new ServerSocket(serverPort);

            while(true){
                Socket clientSocket = listenSocket.accept();
                Connection c = new Connection(clientSocket);
            }
            
        }catch(IOException e){System.out.println("Listen: " + e.getMessage());}
    
    }
    
}
