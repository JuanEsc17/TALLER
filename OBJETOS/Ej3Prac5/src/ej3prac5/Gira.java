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
public class Gira extends Recital {
    private String nombreRecital;
    private Fecha[] fechas;
    private int dF;
    private int dL;
    private int fechaActual;

    public Gira(String nombreRecital, String banda, int temas, int fecha) {
        super(banda, temas);
        this.nombreRecital = nombreRecital;
        this.dF=fecha;
        fechas = new Fecha[fecha];
        for(int i=0;i<fecha; i++)
            this.fechas[i]=null;
        dL=-1;
        fechaActual=-1;
    }
    
    public void agregarFecha(Fecha f){
        if(dL<dF){
            dL++;
            if(this.fechas[dL]==null)
                this.fechas[dL]=f;
            }
    }
    
    public String actuar(){
        String aux="";
        if(fechaActual<dL){
            this.fechaActual++;
            aux=("Buenas noches "+this.fechas[fechaActual].getCiudad()
                            +super.actuar());
        }
        return aux;
    }
    
    public int calcularCosto(){
        return 30000*dF;
    }
}
