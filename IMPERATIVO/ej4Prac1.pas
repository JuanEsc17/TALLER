{Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}

program ej4;
type
	r=1..8;
	libro = record
		codProd:integer;
		rubro:r;
		precio:real;
	end;
	lista = ^nodo;
	nodo = record
		dato:libro;
		sig:lista;
	end;
	
//PROCEDURES
procedure leerLibro(var l:libro);
begin
	writeln('---------------');
	writeln('Ingrese precio del producto ');
	readln(l.precio);
	if (l.precio<>0) then begin		
		writeln('Ingrese codigo de producto ');
		readln(l.codProd);
		writeln('Ingrese cod de rubro ');
		readln(l.rubro);
	end;
	writeln('---------------');
end;

procedure agregarLibro(var a:lista;l:libro);
var nuevo,actual,ant:lista;
begin
	new(nuevo);
	nuevo^.dato:=l;
	actual:=a;
	ant:=a;
	while(actual<>nil)and(l.codProd<a^.dato.codProd) do begin
		ant:=actual;
		actual:=actual^.sig;
	end;
	if(actual=ant) then 
		a:=nuevo
	else begin
		writeln('tuki2');
		ant^.sig:=nuevo;
		writeln('tuki3');
		nuevo^.sig:=actual;
	end;
end;

procedure cargarLista(var a:lista);
var l:libro;
begin
	leerLibro(l);
	while (l.precio<>0) do begin
		agregarLibro(a,l);
		writeln('bbbb');
		leerLibro(l);
	end;
end;

procedure informarLista (a:lista);
begin
	while(a<>nil) do begin
		writeln('---------------');
		writeln('Codigo de libro: ',a^.dato.codProd);
		writeln('Codigo de rubro: ',a^.dato.rubro);
		writeln('Valor: ', a^.dato.precio);
		writeln('---------------');
		a:=a^.sig;
	end;
end;
//PROGRAMA PRINCIPAL
var 
	a:lista;
begin
	cargarLista(a);
	informarLista(a);
end.
