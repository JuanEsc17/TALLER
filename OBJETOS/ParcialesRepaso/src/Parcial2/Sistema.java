/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parcial2;

/**
 *
 * @author Juan Escudero
 */
public class Sistema {
    
    private Paciente[][] pacientes;
    
    public Sistema(){
        pacientes = new Paciente[5][6];
        for(int i=0;i<5;i++)
            for(int j=0;j<6;j++)
                this.pacientes[i][j]=null; 
    }
    
    public void agregarPaciente(Paciente p, int d, int t){
        if(this.pacientes[d][t]==null)
            this.pacientes[d][t]=p;
    }
    
    public void liberarTurnos(String nombre){
        int i=0;
        int j=0;
        while((i<5)){
            while((j<6)){
                if(this.pacientes[i][j].getNombre().equals(nombre)){
                    pacientes[i][j]=null;
                }
                j++;
            }
          i++;
          j=0;
        }
    }
    
    public boolean buscarTurno(int d, String n){
        boolean aux=false;
        int i=0;
        while(!(aux)&&(i<6)){
            if(pacientes[d-1][i]!=null)
                if(pacientes[d-1][i].getNombre().equals(n))
                    aux=true;
            i++;
        }
        return aux;
    }
}
