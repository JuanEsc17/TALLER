/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej3prac5;

/**
 *
 * @author Juan Escudero
 */
public class Ej3Prac5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        EventoOcasional e = new EventoOcasional("Seru Giran",2,"show de TV","Charly Garcia","15/04");
        Gira g = new Gira("Live Aid","Spinetta Jade",3,1);
        Fecha f = new Fecha("La Plata");
        
        
        e.agregarTema("La grasa de las capitales");
        e.agregarTema("Separata");
        g.agregarFecha(f);
        g.agregarTema("Alma de diamante");
        g.agregarTema("Help!");
        g.agregarTema("El anillo del capitan beto");
        
        System.out.println("Ocasional: "+e.calcularCosto());
        System.out.println("Gira: "+g.calcularCosto());
        
        System.out.println(e.actuar());
        System.out.println(g.actuar());
    }
    
}
