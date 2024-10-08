program ej1;
const
	max=50;
type 
	codProd=1..15;
	maxVent=1..99;
	producto = record
		dia:integer;
		cod:codProd;
		cant:maxVent;
	end;
	ventas = array [1..max] of producto;

procedure leerProd(var p:producto);
begin
	writeln('---------------');
	writeln('Ingrese el dia de venta');
	readln(p.dia);
	writeln('Ingrese el codigo');
	p.cod:=random(16);
	writeln(p.cod);
	writeln('Ingrese la cantidad');
	readln(p.cant);
	writeln('---------------');
end;


procedure cargarVector (var v:ventas; var dL:integer);
var p:producto;
begin
	leerProd(p);
	while(p.dia<>-1)do begin
		dL:=dL+1;
		v[dL].cod:=p.cod;
		v[dL].dia:=p.dia;
		v[dL].cant:=p.cant;
		leerProd(p);
	end;
end;


procedure informarVector(v:ventas;dL:integer);
var i:integer;
begin
	writeln('---------------');
	for i:=1 to dL do begin
		writeln('Producto: ',i,':');
		writeln('Dia de venta es ',v[i].dia);
		writeln('El codigo del producto es ',v[i].cod);
		writeln('La cantidad vendida es ',v[i].cant);
		writeln('---------------');
	end;
end;

procedure ordenarCod(var v:ventas;dL:integer);
var i,j,pos:integer; item:producto;
begin
	for i:=1 to dL-1 do begin
		pos:=i;
		for j:= i+1 to dL do
			if v[j].cod < v[pos].cod then pos:=j;
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;
end;	

procedure menorMayor (v:ventas; dL:integer; var l:lista);
var i:integer;
begin
	
end;

var
	v:ventas;
	dL:integer;
begin
	Randomize;
	dL:=0;
	cargarVector(v,dL);
	informarVector(v,dL);
	ordenarCod(v,dL);
	informarVector(v,dL);
end.
