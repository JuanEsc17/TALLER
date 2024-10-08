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
public class Subsidio{
    
    private double monto;
    private String motivo;
    private boolean otorgado;
    
    public Subsidio(){
        this.otorgado=false;
    }
    
    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.otorgado = true;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }

    public double getMonto() {
        return monto;
    }

    public boolean isOtorgado() {
        return otorgado;
    }
    
    
}
