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
public class CoroHileras extends Director{
    
    private Corista[][] coristas;
    private int dF;
    private int dL,fila,columna,cont;
    
    public CoroHileras(String nombre, int dni, int edad, int antiguedad, int dF){
        super(nombre,dni,edad,antiguedad);
        this.dF=dF;
        coristas=new Corista[dF][dF];
        for(int i=0;i<dF;i++)
            for(int j=0;j<dF;j++)
                coristas[i][j]=null;
        dL=dF-1;
        fila=0;
        columna=dF-1;
        cont=0;
    }
    
    @Override
    public void agregarCorista(Corista c){
        if(fila<dF){
            if(columna>=0){
                if(this.coristas[fila][columna]==null){
                    this.coristas[fila][columna]=c;
                    columna--;
                    cont=0;
                }
        
            }
            else{
                columna=dF-1;
                fila++;
            }
        }
                
    }
    
    public boolean coroLleno(){
        return (cont==dF*dF);
    }
}
