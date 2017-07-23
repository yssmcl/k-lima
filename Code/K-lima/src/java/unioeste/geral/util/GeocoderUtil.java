/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unioeste.geral.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import unioeste.googlemaps.Address;
import unioeste.googlemaps.Result;

/**
 *
 * @author nardi
 */
public class GeocoderUtil {
    public List<Result> fromAddress(String addr) throws IOException {
        try {
            URL url = new URL("https://maps.googleapis.com/maps/api/geocode/json?address=" + addr + "key=AIzaSyC9pNbJrgjHF7S7IXPXXZVGXPFVLDUr4S8");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/xml");

            Reader reader = new InputStreamReader(connection.getInputStream(), "UTF-8");

            Gson gson = new GsonBuilder().create();
            return gson.fromJson(reader, Address.class).getResults();
        } catch (MalformedURLException ex) {
            Logger.getLogger(GeocoderUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
