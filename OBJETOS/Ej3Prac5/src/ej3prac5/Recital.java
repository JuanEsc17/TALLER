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
public class Recital {
    private String banda;
    private String[] temas;
    private int dF;
    private int dL;
    
    public Recital(String banda, int dF){
        this.banda=banda;
        this.temas=new String[dF];
        this.dF=dF;
        for(int i=0;i<dF;i++)
            temas[i]=null;
        dL=-1;
    }
    
    public void agregarTema(String tema){
        if((dL<dF)){
            dL++;
            if(temas[dL]==null)
                this.temas[dL]=tema;
        }
    }
    
    public String actuar(){
        String aux="";
        for(int i=0;i<dL;i++)
            if(this.temas[i]!=null)
                aux = aux +" y ahora tocaremos "+this.temas[i];
        return aux;
    }
    
}
