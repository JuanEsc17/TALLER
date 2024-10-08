{1.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.
b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.
f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados.}

program ej2;
type
	vector = array[1..10] of char;
	lista = ^nodo;
	nodo = record
		dato:char;
		sig:lista;
	end;

//PROCEDURES
procedure leerChar(var c:char);
begin
	writeln('Ingrese un char');
	readln(c);
end;

procedure cargarVector(var v:vector;var dL:integer);
var c:char;
begin
	leerChar(c);
	if (c<>'.') and (dL<=10) then begin
		dL:=dL+1;
		v[dL]:=c;
		cargarVector(v,dL)
	end;
end;

procedure imprimirVector(v:vector;i:integer;dL:integer);
begin
	if (i<=dL) then begin
		write(v[i]);
		imprimirVector(v,i+1,dL);
	end;
end;

procedure imprimirVector2(v:vector;i:integer;dL:integer);
begin
	if (i<=dL) then begin
		imprimirVector(v,i+1,dL);
		write(v[i]);
	end;
end;

function consD():integer;
var c:char;
begin
	leerChar(c);
	if(c<>'.') then begin
		consD:=consD()+1;
	end
	else
		consD:=1;
end;

procedure consE(var l:lista);
var c:char; aux:lista;
begin
	leerChar(c);
	if (c<>'.') and (l=nil) then begin
		new(l);
		l^.dato:=c;
		consE(l); 
	end
	else 
		if(c<>'.') then begin
			new(aux);
			aux^.dato:=c;
			aux^.sig:=l;
			consE(aux);
		end;
end;

procedure imprimirLista(l:lista);
begin
	if(l<>nil) then begin
		writeln(l^.dato);
		imprimirLista(l^.sig);
	end;
end;

//PROGRAMA PRINCIPAL
var
	v:vector;
	dL:integer;
	i:integer;
	l:lista;
begin
	dL:=0;
	i:=1;
	cargarVector(v,dL);
	writeln('------CONSIGNA B------');
	imprimirVector(v,i,dL);
	writeln();
	writeln('------CONSIGNA C------');
	imprimirVector2(v,i,dL);
	writeln('------CONSIGNA D------');
	writeln(consD(),' caracteres');
	writeln('------CONSIGNA E------');
	consE(l);
	imprimirLista(l);
end.
