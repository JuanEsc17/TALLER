program Ivy;
type
	compra = record
		monto:real;
		cliente:integer;
		mes:integer;
	end;
	
	vector = array[1..12] of real;
	
	cliente = record
		cod:integer;
		meses:vector;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:cliente;
		HI:arbol;
		HD:arbol;
	end; 
	
procedure inicializarVector(var v:vector;mes:integer;m:real);
var i:integer;
begin
	for i:=1 to 12 do begin
		v[i]:=0;
		v[mes]:=m;
	end;
end;

procedure leerCompra(var c:compra);
begin
	writeln('Ingrese cod de cliente');
	c.cliente:=Random(30);
	writeln(c.cliente);
	if(c.cliente<>0)then begin
		writeln('Ingrese monto');
		c.monto:=Random(500);
		writeln(c.monto:2:2);
		writeln('Ingrese mes');
		c.mes:=Random(11)+1;
		writeln(c.mes);
	end;
end;

procedure cargarArbol(var a:arbol; c:compra);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.cod:=c.cliente;
		inicializarVector(a^.dato.meses,c.mes,c.monto);
		a^.HI:=nil;
		a^.HD:=nil;
	end
		else if(c.cliente>a^.dato.cod)then
				cargarArbol(a^.HI,c)
			else
				if(c.cliente<a^.dato.cod)then
					cargarArbol(a^.HD,c)
				else
					a^.dato.meses[c.mes]:=a^.dato.meses[c.mes]+c.monto;
end;

function mayorMes(v:vector; i:integer):real;
var aux:real;
begin
	if(i<=12)then begin
		aux:=mayorMes(v,i+1);
		if(v[i]>aux)then
			mayorMes:=v[i]
		else
			mayorMes:=aux;
		end
	else
		mayorMes:=v[i];
end;

function incisoB(a:arbol;c:integer):real;
begin
	if(a=nil)then incisoB:=-1
	else
		if(c>a^.dato.cod)then
			incisoB:=incisoB(a^.HI,c)
		else
			if(c<a^.dato.cod)then
				incisoB:=incisoB(a^.HD,c)
			else
				incisoB:=mayorMes(a^.dato.meses,1);
end;

function gastoONo(v:vector;n:integer):integer;
begin
	if(v[n]>0)then gastoONo:=0
	else
		gastoONo:=1;
end;

function incisoC(a:arbol;n:integer):integer;
begin
	if(a=nil)then incisoC:=0
	else
		incisoC:=gastoONo(a^.dato.meses,n)+incisoC(a^.HI,n)+incisoC(a^.HD,n);
end;

var
	a:arbol;
	cl,n:integer;
	c:compra;
begin
	leerCompra(c);
	while(c.cliente<>0)do begin
		cargarArbol(a,c);
		leerCompra(c);
	end;
	writeln('Ingrese un cliente para buscar');
	cl:=Random(30);
	writeln(cl);
	writeln('El mes que mas gasto fue ',incisoB(a,cl));
	writeln('Ingrese un mes');
	n:=Random(12)+1;
	writeln(n);
	writeln('Hubo ',incisoC(a,n),' cliente/s que no gastaron en ese mes');
end.
