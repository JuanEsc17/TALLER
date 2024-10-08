{Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}

program instantTaneas;
type
	venta = record
		cod:integer;
		fecha:String;
		cant:integer;
	end;
	
	contNodo=record
		cod:integer;
		cant:integer;
	end;
	
	arbol2 = ^nodo2;
	
	nodo2 = record
		dato:contNodo;
		HI:arbol2;
		HD:arbol2;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:venta;
		HI:arbol;
		HD:arbol;
	end;
	
//PROCEDURES
procedure leerVenta(var v:venta);
begin
	writeln('-----------------');
	writeln('INGRESE CODIGO DE PRODUCTO');
	readln(v.cod);
	if (v.cod<>0) then begin
		writeln('INGRESE FECHA');
		readln(v.fecha);
		writeln('INGRESE CANTIDAD DE PRODUCTOS');
		readln(v.cant);
	end;
end;

procedure cargarArbol(var a:arbol;v:venta);
begin
	if(a=nil)then begin 
		new(a); 
		a^.dato:=v;
		a^.HI:=nil;
		a^.HD:=nil; end
	else
		if(v.cod<=a^.dato.cod)then cargarArbol(a^.HI,v)
		else cargarArbol(a^.HD,v);
end;

procedure consignaI(var a:arbol);
var v:venta;
begin
	leerVenta(v);
	while (v.cod<>0) do begin
		cargarArbol(a,v);
		leerVenta(v);
	end;
end;

procedure cargarArbol2(var a2:arbol2; v:venta);
begin
	if (a2=nil) then begin
		new(a2);
		a2^.dato.cod:=v.cod;
		a2^.dato.cant:=v.cant;
	end
	else
		if(a2^.dato.cod=v.cod)then
			a2^.dato.cant:=a2^.dato.cant+v.cant
		else
			if(v.cod<a2^.dato.cod)then
				cargarArbol2(a2^.HI,v)
			else
				cargarArbol2(a2^.HD,v);
end;

procedure recorrerArbol2(var a2:arbol2; a:arbol);
begin
	if (a<>nil) then begin
		recorrerArbol2(a2,a^.HI);
		cargarArbol2(a2,a^.dato);
		recorrerArbol2(a2,a^.HD);
	end;
end;


procedure consignaII(var a2:arbol2; a:arbol);
begin
	recorrerArbol2(a2,a);
end;

function buscarCod1(a:arbol; c:integer):integer;
begin
	if(a<>nil) then begin
		if(a^.dato.cod=c)then
			buscarCod1:=a^.dato.cant
		else
			if(c<a^.dato.cod)then
				buscarCod1:=buscarCod1(a^.HI,c)
			else
				buscarCod1:=buscarCod1(a^.HD,c);
	end
	else
		buscarCod1:=-1;
end;

function buscarCod2(a:arbol2; c:integer):integer;
begin
	if(a<>nil) then begin
		if(a^.dato.cod=c)then
			buscarCod2:=a^.dato.cant
		else
			if(c<a^.dato.cod)then
				buscarCod2:=buscarCod2(a^.HI,c)
			else
				buscarCod2:=buscarCod2(a^.HD,c);
	end
	else
		buscarCod2:=-1;
end;

procedure consignaB(a:arbol);
var c:integer;
begin
	writeln('Ingrese el codigo que desea buscar');
	readln(c);
	if(buscarCod1(a,c)<>-1)then
		writeln('El producto ',c,' tiene ',buscarCod1(a,c),' productos vendidos')
	else writeln('No hay ventas de ese producto'); 
end;

procedure consginaC(a:arbol2);
var c:integer;
begin
	writeln('Ingrese el codigo que desea buscar');
	readln(c);
	if(buscarCod2(a,c)<>-1)then
		writeln('El producto ',c,' tiene ',buscarCod2(a,c),' productos vendidos')
	else writeln('No hay ventas de ese producto'); 
end;

procedure informarVenta1(v:venta);
begin
	writeln('-----------------');
	writeln('Cod de prod: ',v.cod);
	writeln('Fecha de venta: ',v.fecha);
	writeln('Cantidad vendido: ',v.cant);
end;

procedure informarVenta2(v:contNodo);
begin
	writeln('-----------------');
	writeln('Cod de prod: ',v.cod);
	writeln('Cantidad vendido: ',v.cant);
end;

procedure informarArbol2(a:arbol2);
begin
	if(a<>nil)then begin
		informarArbol2(a^.HI);
		informarVenta2(a^.dato);
		informarArbol2(a^.HD);
	end;
end;

procedure informarArbol1(a:arbol);
begin
	if(a<>nil)then begin
		informarArbol1(a^.HI);
		informarVenta1(a^.dato);
		informarArbol1(a^.HD);
	end;
end;

var 
	a:arbol;
	a2:arbol2;
begin
	consignaI(a);
	consignaII(a2,a);
	consignaB(a);
	consginaC(a2);
	informarArbol1(a);
	informarArbol2(a2);
end.
