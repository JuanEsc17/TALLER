{Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

program Runaway;
type
	anioFab=2010..2018;
	auto = record
		patente:String;
		anio:anioFab;
		marca:String;
		modelo:String;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:auto;
		sig:lista;
	end;
	
	arbol2 = ^nodo2;
	
	nodo2 = record
		dato:lista;
		HI:arbol2;
		HD:arbol2;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:auto;
		HI:arbol;
		HD:arbol;
	end;
	
//procedures
procedure leerAuto(var a:auto);
begin
	writeln('-------------------');
	writeln('Ingrese patente del auto');
	readln(a.patente);
	if (a.patente<>'no') then begin
		writeln('Ingrese anio de fabricacion');
		readln(a.anio);
		writeln('Ingrese marca del auto');
		readln(a.marca);
		writeln('Ingrese modelo del auto');
		readln(a.modelo);
	end;
end;

procedure agregarLista(var l:lista; a:auto);
var n:lista;
begin
	new(n);
	n^.dato:=a;
	n^.sig:=l;
	l:=n;
end;

procedure agregarArbol2(var a:arbol2; au:auto);
begin
	if(a=nil)then begin
		new(a); agregarLista(a^.dato,au); a^.HI:=nil; a^.HD:=nil; end
	else
		if(au.marca<a^.dato^.dato.marca)then
			agregarArbol2(a^.HI,au)
		else if(au.marca>a^.dato^.dato.marca)then
			agregarArbol2(a^.HD,au)
		else
			agregarLista(a^.dato,au);
	end;

procedure agregarArbol(var a:arbol; au:auto);
begin
	if (a=nil) then begin
		new(a); a^.dato:=au; a^.HI:=nil; a^.HD:=nil; end
	else
		if (au.patente<a^.dato.patente) then
			agregarArbol(a^.HI,au)
		else
			agregarArbol(a^.HD,au);
	end;

procedure consignaA(var a:arbol; var a2:arbol2);
var au:auto;
begin
	leerAuto(au);
	while(au.patente<>'no')do begin
		agregarArbol(a,au);
		agregarArbol2(a2,au);
		leerAuto(au);
	end;
end;

function buscarM(a:arbol; m:String):integer;
begin
	if(a<>nil)then begin
		if(a^.dato.marca=m) then
			buscarM:=1+buscarM(a^.HI,m)+buscarM(a^.HD,m)
		else
			buscarM:=0+buscarM(a^.HI,m)+buscarM(a^.HD,m);
	end
	else
		buscarM:=0;
end;

procedure consignaB(a:arbol);
var m:String;
begin
	writeln('-------------------');	
	writeln('Consigna B');
	writeln('Ingrese una marca para buscar');
	readln(m);
	writeln('Hay ',buscarM(a,m),' auto/s con esa marca');
end;

function contarAutos(l:lista):integer;
begin
	if(l=nil)then contarAutos:=0
	else
		contarAutos:=1+contarAutos(l^.sig);
end;

function buscarM2(a:arbol2;m:String):integer;
begin
	if(a=nil) then buscarM2:=0
	else
		if(m=a^.dato^.dato.marca)then
			buscarM2:=contarAutos(a^.dato)
		else if(m<a^.dato^.dato.marca)then
			buscarM2:=buscarM2(a^.HI,m)
		else
			buscarM2:=buscarM2(a^.HD,m);
	end;

procedure consignaC(a:arbol2);
var m:String;
begin
	writeln('-------------------');	
	writeln('Consigna C');
	writeln('Ingrese una marca para buscar');
	readln(m);
	writeln('Hay ',buscarM2(a,m),' auto/s con esa marca');
end;

procedure consignaD(a:arbol; var a3:arbol2);
begin
	if(a<>nil)then
		if(a3=nil)then begin
			new(a3); agregarLista(a3^.dato,a^.dato);
			a3^.HI:=nil; a3^.HD:=nil; end
		else
			if(a^.dato.anio<a3^.dato^.dato.anio)then
				consignaD(a,a3^.HI)
			else if (a^.dato.anio>a3^.dato^.dato.anio) then
				consignaD(a,a3^.HD)
			else
				agregarLista(a3^.dato,a^.dato);
			consignaD(a^.HI,a3);
			consignaD(a^.HD,a3);
end;

procedure informarAuto(a:auto);
begin
	writeln('========AUTO========');
	writeln('patente ',a.patente);
	writeln('anio de fab ',a.anio);
	writeln('marca ',a.marca);
	writeln('modelo ',a.modelo);
end;

procedure informarArbol1(a:arbol);
begin
	if(a<>nil)then begin
		informarArbol1(a^.HI);
		informarAuto(a^.dato);
		informarArbol1(a^.HD);
	end;
end;

procedure informarLista(l:lista);
begin
	if(l<>nil)then begin
		informarAuto(l^.dato);
		informarLista(l^.sig);
	end;
end;

procedure informarArbol2(a:arbol2);
begin
	if(a<>nil)then begin
		informarArbol2(a^.HI);
		informarLista(a^.dato);
		informarArbol2(a^.HD);
	end;
end;

procedure informarArboles(a:arbol;a2:arbol2;a3:arbol2);
begin
	informarArbol1(a);
	informarArbol2(a2);
	informarArbol2(a3);
end;

function buscarP(a:arbol;p:String):String;
begin
	if(a=nil) then buscarP:=''
	else 
		if(p<a^.dato.patente)then
			buscarP:=buscarP(a^.HI,p)
		else
			if(p>a^.dato.patente)then
				buscarP:=buscarP(a^.HD,p)
			else
				buscarP:=a^.dato.modelo;
end;

procedure consignaE(a:arbol);
var p:String;
begin
	writeln('========================');
	writeln('Ingrese una patente para buscar');
	readln(p);
	writeln(buscarP(a,p));
end;

{function buscarPa(a:arbol2; p:String):String;
begin
	if(a=nil)then
		buscarPa:=''
	else
		
end;

procedure consignaF(a:arbol2);
var p:String;
begin
	writeln('========================');
	writeln('Ingrese una patente para buscar');
	readln(p);
	writeln(buscarPa(a,p));
end;}

var 
	a:arbol;
	a2,a3:arbol2;

begin
	consignaA(a,a2);
	//consignaB(a);
	//consignaC(a2);
	consignaD(a,a3);
	informarArboles(a,a2,a3);
	consignaE(a);
end.
