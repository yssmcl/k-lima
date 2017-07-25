/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unioeste.geral.util;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import unioeste.geral.bo.Aluno;
import unioeste.geral.manager.AlunoManager;
import unioeste.googlemaps.Location;
import unioeste.googlemaps.Result;

/**
 *
 * @author nardi
 */
public class PopularLocalizacaoThread extends Thread {
    public PopularLocalizacaoThread(AlunoManager am) {
        try {
            GeocoderUtil geocoder =  new GeocoderUtil();

            List<Aluno> alunoList = am.recuperarTodosAlunos();
            for (int i=0; i<alunoList.size(); ) {
                long beginTime = System.currentTimeMillis();
                
                for (int j=45; j>0 && i<alunoList.size(); ++i) {
                    Aluno a = alunoList.get(i);
                    try {
                        if (a.getLatitude() == null && a.getCep() != null) {
                            List<Result> list = geocoder.fromAddress(a.getCep());
                            if (list.size() > 0) {
                                Location l = list.get(0).getGeometry().getLocation();

                                a.setLatitude(l.getLat());
                                a.setLongitude(l.getLng());

                                am.modificarAluno(a);
                                
                                System.out.println("Dados do aluno [" + a.getNome() + "]");
                            }
                            --j;
                        }
                    } catch (IOException ex) {
                        Logger.getLogger(PopularLocalizacaoThread.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
                long deltaTime = System.currentTimeMillis() - beginTime;
                
                if (1000 > deltaTime) {
                    Thread.sleep(1000 - deltaTime);
                }
            }
        } catch (InterruptedException ex) {
        }
    }
    
    @Override
    public void run() {
        
    }
}
