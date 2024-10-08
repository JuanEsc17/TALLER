{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}

program ej3;
type
	generos = 1..8;
	pelicula = record
		cod:integer;
		genero:generos;
		puntaje:integer;
	end;
	lista = ^nodo;
	nodo = record
		dato:pelicula;
		sig:lista;
	end;
	catalogo = array[generos] of lista;
	consignaB = array[generos] of integer;

//PROCEDURES
procedure leerPelicula(var p:pelicula);
begin
	writeln('------------');
	writeln('Ingrese codigo');
	readln(p.cod);
	if (p.cod<>-1) then begin
		writeln('Ingrese cod de genero');
		readln(p.genero);
		writeln('Ingrese puntaje');
		readln(p.puntaje);
	end;
end;

procedure agregarPelicula(var l:lista;p:pelicula);
var aux:lista;
begin
	new(aux);
	aux^.dato:=p;
	aux^.sig:=l;
	l:=aux;
end;

procedure cargarVector(var v:catalogo);
var p:pelicula;
begin
	leerPelicula(p);
	while (p.cod<>-1) do begin
		agregarPelicula(v[p.genero],p);
		leerPelicula(p);
	end;
end;

function mayorPuntaje(l:lista):integer;
var max:integer; maxCod:integer;
begin
	max:=-1;
	maxCod:=0;
	while (l<>nil) do begin
		if(l^.dato.puntaje>max) then begin
			max:=l^.dato.puntaje;
			maxCod:=l^.dato.cod;
		end;
	end;
	mayorPuntaje:=maxCod;
end;

procedure consB (var b:consignaB; v:catalogo);
var
	i:integer;
begin
	for i:=1 to 8 do
		b[i]:=mayorPuntaje(v[i]);
end;

procedure informarConsignaB(b:consignaB);
var i:integer;
begin
	for i:=1 to 8 do
		writeln('Codigo de la pelicula de mayor puntaje del genero ', i,' es: ',b[i]);
end;

procedure insercion (var b:consignaB);
var i,j:integer; actual:integer;
begin
	for i:=2 to 8 do begin
		actual:=b[i];
		j:=i-1;
		while(j>0)and(b[j]>actual)do begin
			b[j+1]:=b[j];
			j:=j-1;
		end;
		b[j+1]:=actual;
	end;
end;
//PROGRAMA PRINCIPAL
var
	v:catalogo;
	b:consignaB;
begin
	cargarVector(v);
	consB(b,v);
	informarConsignaB(b);
	insercion(b);
	informarConsignaB(b);
	//no lo segui porque no se entiende xd
end.
