/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej2prac5;

/**
 *
 * @author Juan Escudero
 */
public class Estacionamiento {
    
    private String nombre,direccion,apertura,cierre;
    private Auto[][] autos;
    private int pisos,plazas;
    
    public Estacionamiento(String n, String d){
        this.nombre=n;
        this.direccion=d;
        this.apertura="8:00";
        this.cierre="21:00";
        this.autos = new Auto[5][10];
        for(int i=0;i<5;i++)
            for(int j=0;j<10;j++)
                autos[i][j]=null;
        this.pisos=5;
        this.plazas=10;
    }
    
    public Estacionamiento(String n, String d, String ap, 
                            String ci, int p, int pl){
        this.apertura=ap;
        this.cierre=ci;
        this.direccion=d;
        this.nombre=n;
        autos = new Auto[p][pl];
        for(int i=0;i<p;i++)
            for(int j=0;j<pl;j++)
                autos[i][j]=null;
        this.pisos=p;
        this.plazas=pl;
    }
    
    public void agregarAuto(Auto a, int x, int y){
        if(autos[x][y]==null)
            autos[x][y]=a;
        else
            System.out.println("No se pudo agregar el auto"); 
    }
    
    public String buscarAuto(String patente){
        boolean esta = false;
        int i = 0;
        int j = 0;
        String aux="";
        while((esta==false)&&(i<pisos)){
            while((esta==false)&&(j<plazas)){
                if(autos[i][j].getPatente().equals(patente)){
                    aux="el auto esta en piso "+(i+1)+" y plaza "+(j+1);
                    esta=true;
                }
                else
                    j++;
            }
            i++;
            j=0;
        }
        if(esta)
            return aux;
        else
            return "Auto inexistente";    
    }
    
    public int cuantosAutos(int y){
        int aux=0;
        for(int i=0;i<pisos;i++)
            if(this.autos[i][y]!=null)
                aux++;
        return aux;
    }
    
    public String toString(){
        String aux="";
        for(int i=0;i<pisos;i++)
            for(int j=0;j<plazas;j++)
                if(this.autos[i][j]!=null)
                    aux = aux +"Piso "+(i)+" Plaza "+(j)+ "\n"+autos[i][j].toString();
        return aux;
    }
}
