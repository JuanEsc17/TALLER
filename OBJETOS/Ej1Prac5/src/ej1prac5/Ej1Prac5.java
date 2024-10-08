/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej1prac5;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Juan Escudero
 */
public class Ej1Prac5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int cant=GeneradorAleatorio.generarInt(49);
        Proyecto p = new Proyecto("LOLO",12345,"Carlos");
        
        for(int i=0;i<cant;i++){
            Investigador inv = new Investigador(GeneradorAleatorio.generarString(3),3,GeneradorAleatorio.generarString(6));
            for(int j=0;j<4;j++){
                Subsidio sub = new Subsidio(100,"Esto es un motivo");
                inv.agregarSubsidio(sub);
            }
            p.agregarInvestigador(inv);
            
        }
        System.out.println(p.toString());
    }
    
}
