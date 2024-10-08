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
public abstract class Director {
    private String nombre;
    private int dni;
    private int edad,antiguedad;

    public Director(String nombre, int dni, int edad, int antiguedad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }
    
    public abstract void agregarCorista(Corista c);
    public abstract boolean coroLleno();
}
