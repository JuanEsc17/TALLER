program ojosDeVideotape;
type
	sub_mes=0..12;
	sub_diagnostico=1..15;
	atencion = record
		dni:integer;
		mes:sub_mes;
		diag:sub_diagnostico;
	end;
	
	cliente = record
		dni:integer;
		cant:integer;
	end;
	
	vector = array[sub_diagnostico]of integer;
	
	arbol = ^nodo;
	
	nodo = record
		dato:cliente;
		HI:arbol;
		HD:arbol;
	end;

procedure incializarVector(var v:vector);
var i:integer;
begin
	for i:=1 to 15 do
		v[i]:=0;
end;

procedure leerAtencion(var a:atencion);
begin
	writeln('=======CLIENTE=======');
	writeln('ingrese dni');
	a.dni:=Random(100);
	writeln(a.dni);
	writeln('ingrese mes');
	a.mes:=Random(13);
	writeln(a.mes);
	if(a.mes<>0)then begin
		writeln('ingrese diagnostico');
		a.diag:=Random(16);
		writeln(a.diag);
	end else
		writeln('X X X X X X X X X X X');
	writeln;
end;

procedure cargarArbol(var a:arbol; at:atencion);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.dni:=at.dni;
		a^.dato.cant:=1;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(at.dni<a^.dato.dni)then
			cargarArbol(a^.HI,at)
		else
			if(at.dni>a^.dato.dni) then
				cargarArbol(a^.HD,at)
			else
				a^.dato.cant:=a^.dato.cant+1;
end;

procedure cargarVector(var v:vector; a:atencion);
begin
	v[a.diag]:=v[a.diag]+1;
end;

function cantPacientes(a:arbol;inf:integer;sup:integer;x:integer):integer;
begin
	if(a=nil) then cantPacientes:=0
	else
		if(a^.dato.dni>inf)then
			if(a^.dato.cant<sup)then
				if(a^.dato.cant=x)then
					cantPacientes:=1+cantPacientes(a^.HI,inf,sup,x)+cantPacientes(a^.HD,inf,sup,x)
				else
				cantPacientes:=cantPacientes(a^.HI,inf,sup,x)+cantPacientes(a^.HD,inf,sup,x)
			else
			cantPacientes:=cantPacientes(a^.HI,inf,sup,x)
		else
		cantPacientes:=cantPacientes(a^.HD,inf,sup,x);
end;

function diagCero(v:vector;i:integer):integer;
begin
	if(i<=15)then begin
		if(v[i]=0)then diagCero:=1+diagCero(v,i+1)
		else
			diagCero:=diagCero(v,i+1);
	end
	else
		diagCero:=0;
end;

procedure informarCliente(c:cliente);
begin
	writeln('========================');
	writeln('DNI: ',c.dni,' / CANT: ', c.cant);
end;

procedure informarArbol(a:arbol);
begin
	if(a<>nil)then begin
		informarArbol(a^.HI);
		informarCliente(a^.dato);
		informarArbol(a^.HD);
	end;
end;

var
	a:arbol;
	v:vector;
	inf,sup,x:integer;
	at:atencion;
begin
	Randomize;
	incializarVector(v);
	leerAtencion(at);
	while (at.mes<>0)do begin
		cargarArbol(a,at);
		cargarVector(v,at);
		leerAtencion(at);
	end;
	informarArbol(a);
	writeln('INGRESE DOS VALORES Y UNA CANT PARA BUSCAR');
	readln(inf);
	readln(sup);
	readln(x);
	writeln('Hay ',cantPacientes(a,inf,sup,x),' paciente/s con esos valores');
	writeln('Hay ',diagCero(v,1),' diagnostico/s con 0 atenciones');
end.
