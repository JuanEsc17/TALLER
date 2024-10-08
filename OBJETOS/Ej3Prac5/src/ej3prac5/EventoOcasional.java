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
public class EventoOcasional extends Recital {
    
    private String motivo,contratante,dia;
    
    public EventoOcasional(String banda, int temas, String motivo,
                            String contratante, String dia){
        super(banda,temas);
        this.contratante=contratante;
        this.dia=dia;
        this.motivo=motivo;
    }
    
    public String actuar(){
        String aux="";
        if(this.motivo.equals("show de beneficiencia"))
            aux="Recuerden colaborar con "+this.contratante+super.actuar();
        else
            if(this.motivo.equals("show de TV"))
                aux="Saludos amigos televidentes"+super.actuar();
        else
                if(this.motivo.equals("show privado"))
                    aux="Un feliz cumpleanios para "+this.contratante+super.actuar();
        return aux;
    }
    
    public int calcularCosto(){
        int aux=0;
        if(this.motivo.equals("show de beneficiencia"))
            aux=0;
        else
            if(this.motivo.equals("show de TV"))
                aux=50000;
        else
                if(this.motivo.equals("show privado"))
                    aux=150000;
        return aux;
    }
}
