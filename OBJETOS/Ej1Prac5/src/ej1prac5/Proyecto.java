/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej1prac5;

/**
 *
 * @author Juan Escudero
 */
public class Proyecto {
    
    private String nombre;
    private int codigo;
    private String nombreDirec;
    private Investigador[] inv = new Investigador[50];
    private int dL;

    public Proyecto(String nombre, int codigo, String nombreDirec) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirec = nombreDirec;
        for(int i=0;i<50;i++)
            this.inv[i]=null;
        dL=-1;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        dL++;
        this.inv[dL]=unInvestigador;
    }
    
    public void otorgarTodos(String unNombre){
        boolean c=false;
        int i=0;
        while((c=false)&&(i<dL))
            if(this.inv[i].getNombre().equals(unNombre))
                this.inv[i].otorgarTodos();
    }

    @Override
    public String toString() {
        String aux = "nombre=" + nombre + ", codigo=" + codigo + ", nombreDirec=" + nombreDirec + " ";
        double monto=0;
        String aux2="";
        for(int i=0;i<dL;i++){
            monto=+this.inv[i].dineroTotalOtorgado();
            aux2= aux2+this.inv[i].toString();
        }
        aux=aux+monto;
        aux= aux+aux2;
        return aux;
    }
    
    
}
