/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesrepaso;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Juan Escudero
 */
public class ParcialesRepaso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        Funcion f = new Funcion("Mickey Mouse","17 de Julio","9:00",
                                 3,4);
        for(int i=0; i<5;i++)
            System.out.println(f.ocuparButaca(GeneradorAleatorio.generarInt(2), GeneradorAleatorio.generarInt(3)));
        System.out.println(f.toString());
    }
    
}
