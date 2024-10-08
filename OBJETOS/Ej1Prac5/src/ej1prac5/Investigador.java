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
public class Investigador{
    
    private String nombre;
    private int categ;
    private String especialidad;
    private Subsidio[] subsidio = new Subsidio[5];
    private int dL;

    public Investigador(String nombre, int categ, String especialidad) {
        this.nombre = nombre;
        this.categ = categ;
        this.especialidad = especialidad;
        for(int i=0;i<5;i++){
            Subsidio s = new Subsidio();
            subsidio[i]=s;
        }
        dL=-1;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if(dL<subsidio.length-1){
            dL=dL+1;
            this.subsidio[dL]=unSubsidio;
            System.out.println("Se pudo agregar");
        }
        else
            System.out.println("No se pudo agregar");
    }
    
    public double dineroTotalOtorgado(){
        double aux=0;
        int i=0;
        while((i<dL)){
            aux=aux+this.subsidio[i].getMonto();
            i++;
        }            
        return aux;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void otorgarTodos(){
        for(int i=0;i<dL;i++){
            if(!(this.subsidio[i].isOtorgado()))
                this.subsidio[i].setOtorgado(true);
        i++;
        }
    }

    @Override
    public String toString() {
        return  "/ nombre=" + nombre + ", categ=" + categ + ", especialidad=" + especialidad + " ";
    }
    
    
}
