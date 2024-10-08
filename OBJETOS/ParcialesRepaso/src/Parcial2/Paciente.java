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
public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private double costo;

    public Paciente(String nombre, boolean obraSocial, double costo) {
        this.nombre = nombre;
        this.obraSocial = obraSocial;
        this.costo = costo;
    }

    public String getNombre() {
        return nombre;
    }
    
    
}
