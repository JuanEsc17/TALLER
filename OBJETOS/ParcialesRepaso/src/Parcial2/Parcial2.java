/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parcial2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Juan Escudero
 */
public class Parcial2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        Sistema s = new Sistema();
        for(int i=0;i<5;i++)
            for(int j=0;j<6;j++){
                Paciente p = new Paciente(GeneradorAleatorio.generarString(5),
                                          GeneradorAleatorio.generarBoolean(),
                                          GeneradorAleatorio.generarDouble(5));
                System.out.println(p.getNombre());
                s.agregarPaciente(p, i,j);
            }
        System.out.println(s.buscarTurno(Lector.leerInt(), Lector.leerString()));
    }
    
}
