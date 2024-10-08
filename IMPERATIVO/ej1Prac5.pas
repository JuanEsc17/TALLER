{1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo,
debe retornar la posición del vector donde se encuentra y en caso contrario debe
retornar 0. Luego el programa debe informar el DNI del propietario o un cartel
indicando que no se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}


program queSeHagaTarde;
type
	oficina = record
		codId:integer;
		dni:integer;
		expensa:integer;
	end;
	edificio = array[1..300] of oficina;
	
//Procedures
procedure leerOficina(var o:oficina);
begin
	writeln('Ingrese un codigo de identificacion');
	readln(o.codId);
	if ( o.codId<>-1) then begin
		writeln('Ingrese dni del propietario');
		readln(o.dni);
		writeln('Ingrese monto de expensas');
		readln(o.expensa);
	end;
end;

procedure agregarVector(var v:edificio; o:oficina; var dL:integer);
begin
	if(dL<300)then begin
		dL:=dL+1;
		v[dL]:=o;
	end;
end;

procedure consignaA(var v:edificio; var dL:integer);
var o:oficina;
begin
	leerOficina(o);
	while (o.codId<>-1) do begin
		agregarVector(v,o,dL);
		leerOficina(o);
	end;
end;

procedure insercion(var v:edificio; dL:integer);
var i,j:integer; actual:oficina;
begin
	for i:=2 to dL do begin
		actual:=v[i];
		j:=i-1;
		while(j>0)and(v[j].codId>actual.codId)do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

procedure informarOficina(o:oficina);
begin
	writeln('---------------');
	writeln('Cod identificacion: ',o.codId);
	writeln('Dni: ',o.dni);
	writeln('Expensas: ',o.expensa);
end;

procedure informarVector(v:edificio; dL:integer; i:integer);
begin
	if(i<=dL) then begin
		informarOficina(v[i]);
		informarVector(v,dL,i+1);
	end;
end;

procedure consignaB(var v:edificio;dL:integer);
begin
	writeln;
	writeln('Vector ordenado por codigo de indentificacion');
	insercion(v,dL);
	informarVector(v,dL,1);
end;


{procedure consignaC(v:edificio; dL:integer);
var c:integer;
begin
	writeln('Ingrese un codigo de identificacion para buscar');
	readln(c);
	if (Buscar(v,c,1,dL)<>0) then 
		writeln('DNI DEL PROPIETARIO: ',v[Buscar(v,c,1,dL)].dni);
	else
		writeln('No se encontro la oficina');
end;}

function totalExpensas(v:edificio;dL,i:integer):integer;
begin
	if(i<=dL)then begin
		totalExpensas:=totalExpensas(v,dL,i+1)+v[i].expensa;
	end
	else
		totalExpensas:=0;
end;

procedure consignaD(v:edificio;dL:integer);
begin
	writeln('El total de expensas del edificio es de: ',totalExpensas(v,dL,1));
end;

//programa principal
var 
	v:edificio;
	dL:integer;
begin
	dL:=0;
	consignaA(v,dL);
	consignaB(v,dL);
	consignaD(v,dL);
end.
