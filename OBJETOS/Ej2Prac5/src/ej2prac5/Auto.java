/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej2prac5;

/**
 *
 * @author Juan Escudero
 */
public class Auto {
    
    private String duenio,patente;
    
    public Auto(String d, String p){
        this.duenio=d;
        this.patente=p;
    }

    public String getPatente() {
        return patente;
    }

    @Override
    public String toString() {
        return "Auto " + "duenio=" + duenio + ", patente=" + patente + " ";
    }
    
    
}
