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
public class Funcion {
    private String titulo,fecha,hora;
    private Butaca[][] butacas;
    private int columnas,filas;
    
    public Funcion(String titulo, String fecha, String hora, int f, int c){
        this.titulo=titulo;
        this.fecha=fecha;
        this.hora=hora;
        butacas =new Butaca[f][c];
        for(int i=0;i<f;i++)
            for(int j=0;j<c;j++){
                butacas[i][j]=new Butaca();
                this.butacas[i][j].setPrecio(800+100*i);
                this.butacas[i][j].setDescriptor("Butaca "+i+","+j);
            }
        columnas=c;
        filas=f;
    }
    
    public double ocuparButaca(int c, int f){
        double aux=0;
        if(!(this.butacas[f][c].isCupo())){
            this.butacas[f][c].setCupo(true);
            aux=this.butacas[f][c].getPrecio();
        }
        return aux;
    }
    
    public void desocuparButacas(int f){
        for(int i=0;i<columnas;i++)
            if(this.butacas[f][i].isCupo())
                this.butacas[f][i].setCupo(false);
    }
    
    public String stringButacas(int b){
        String aux="";
        for(int i=0;i<filas;i++)
            aux=aux+butacas[i][b].toString();
        return aux;
    }
    
    public String toString(){
        String aux=titulo+" "+fecha+" "+hora+"\n";
        for(int i=0;i<filas;i++)
            for(int j=0;j<columnas;j++)
                aux=aux+""+stringButacas(j);
        return aux;
    }
}
