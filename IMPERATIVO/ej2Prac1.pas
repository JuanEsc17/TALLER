{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program ej2;
type
	oficina = record
		codId:integer;
		dni:integer;
		valor:real;
	end;
	edificio = array[1..300] of oficina;
	
//PROCEDURES
procedure leerOficina(var o:oficina);
begin
	writeln('-----------');
	writeln('Ingrese el codigo de identificacion');
	readln(o.codId);
	if (o.codId<>-1) then begin
		writeln('Ingrese el DNI');
		readln(o.dni);
		writeln('Ingrese el valor');
		readln(o.valor);
	end;
	writeln('-----------');
end;

procedure agregarOficina(var v:edificio; o:oficina; var dL:integer);
begin
	dL:=dL+1;
	v[dL]:=o;
end;

procedure cargarVector(var v:edificio; var dL:integer);
var o:oficina;
begin
	leerOficina(o);
	while(o.codId<>-1)do begin
		agregarOficina(v,o,dL);
		leerOficina(o);
	end;
end;

procedure informarEdificio(v:edificio;dL:integer);
var i:integer;
begin
	for i:=1 to dL do begin
		writeln('-----------');
		writeln('OFICINA ',i);
		writeln('Codigo identificacion: ',v[i].codId);
		writeln('DNI: ',v[i].dni);
		writeln('Valor: ',v[i].valor);
	end;
end;

procedure seleccion(var v:edificio; dL:integer);
var i,j,pos:integer; aux:oficina;
begin
	for i:=1 to dL-1 do begin
		pos:=i;
		for j:=i+1 to dL do
			if (v[j].codId<v[pos].codId) then pos:=j;
		aux:=v[pos];
		v[pos]:=v[i];
		v[i]:=aux;
	end;
end;

procedure insercion(var v:edificio; dL:integer);
var i,j:integer; aux:oficina;
begin
	for i:= 2 to dL do begin
		aux:= v[i];
		j:=i-1;
		while (j>0) and (v[j].codId>aux.codId) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=aux;
	end;
end;

//PROGRAMA PRINCIPAL
var
	v:edificio;
	dL:integer;
begin
	dL:=0;
	cargarVector(v,dL);
	writeln('-----------');
	writeln('OFICINA DEFAULT');
	informarEdificio(v,dL);
	{writeln('-----------');
	writeln('ORDENADO POR SELECCION:');
	seleccion(v,dL);
	informarEdificio(v,dL);}
	writeln('-----------');
	writeln('ORDENADO POR INSERCION');
	insercion(v,dL);
	informarEdificio(v,dL);
end.
