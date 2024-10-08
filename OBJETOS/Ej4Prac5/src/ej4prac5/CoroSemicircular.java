/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej4prac5;

/**
 *
 * @author Juan Escudero
 */
public class CoroSemicircular extends Director{

    private Corista[] coristas;
    private int dF;
    private int dL;
    
    public CoroSemicircular(String nombre, int dni,int edad, int antiguedad,int dF){
        super(nombre,dni,edad,antiguedad);
        this.dF=dF;
        coristas=new Corista[dF];
        for(int i=0;i<dF;i++)
            coristas[i]=null;
        dL=dF-1;
    }
    
    /**
     *
     * @param c
     */
    public void agregarCorista(Corista c){
        if(dL>=0)
            if(coristas[dL]==null){
                 coristas[dL]=c;
                 dL--;
            }
               
    }
    
    public boolean coroLleno(){
        if(dL==-1)
            return true;
        else
            return false;
    }
}
