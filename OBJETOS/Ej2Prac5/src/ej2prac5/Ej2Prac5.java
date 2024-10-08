/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej2prac5;
import PaqueteLectura.Lector;
/**
 *
 * @author Juan Escudero
 */
public class Ej2Prac5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Estacionamiento e = new Estacionamiento("Juanchi's estacionamiento",
                                                "1 y 44","12:00","23:00",3,3);
        Auto a = new Auto(Lector.leerString(),Lector.leerString());
        Auto a2 = new Auto(Lector.leerString(),Lector.leerString());
        Auto a3 = new Auto(Lector.leerString(),Lector.leerString());
        Auto a4 = new Auto(Lector.leerString(),Lector.leerString());
        Auto a5 = new Auto(Lector.leerString(),Lector.leerString());
        Auto a6 = new Auto(Lector.leerString(),Lector.leerString());
        
        e.agregarAuto(a, 0,0);
        e.agregarAuto(a2, 0, 1);
        e.agregarAuto(a3, 2, 1);
        e.agregarAuto(a4, 1, 0);
        e.agregarAuto(a5, 2, 2);
        e.agregarAuto(a6, 0, 2);
        
        System.out.println(e.toString());
        
        System.out.println(e.cuantosAutos(1));
        
        System.out.println(e.buscarAuto(Lector.leerString()));
    }
    
}
