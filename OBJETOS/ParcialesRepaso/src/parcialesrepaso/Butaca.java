/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesrepaso;

/**
 *
 * @author Juan Escudero
 */
public class Butaca {
    private String descriptor;
    private double precio;
    private boolean cupo;

    public Butaca() {
        this.cupo = false;
    }

    public String getDescriptor() {
        return descriptor;
    }

    public void setDescriptor(String descriptor) {
        this.descriptor = descriptor;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isCupo() {
        return cupo;
    }

    public void setCupo(boolean cupo) {
        this.cupo = cupo;
    }

    @Override
    public String toString() {
        return  " " + descriptor + ", precio=" + precio + ", cupo=" + cupo +"\n";
    }
    
    
    
    
}
