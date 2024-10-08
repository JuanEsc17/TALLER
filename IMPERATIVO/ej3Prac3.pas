{.Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program aLosJovenesDeAyer;
type
	finales = ^nodoFinal;
	
	final = record
		nota:integer;
		cod:integer;
	end;
	
	alumno = record
		legajo:integer;
		dni:integer;
		anio:integer;
		notas:finales;
	end;
	
	nodoFinal = record
		dato:final;
		sig:finales;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;
	
	datosB = record
		dni:integer;
		anio:integer;
	end;
	
	listaB = ^nodoB;
	
	nodoB = record
		dato:datosB;
		sig:listaB;
	end;
	
//PROCEDURES & FUNCTIONS
procedure leerAlumno(var a:alumno);

	procedure leerFinal(var f:final);
	begin
		writeln('Ingrese el cod de la materia');
		readln(f.cod);
		if (f.cod<>-1) then begin
			writeln('Ingrese su nota');
			readln(f.nota);
		end;
	end;
	
	procedure agregarFinal(var n:finales; f:final);
	var aux:finales;
	begin
		new(aux);
		aux^.dato:=f;
		aux^.sig:=n;
		n:=aux;
	end;
var
	f:final;
begin
	writeln('-------------------');
	writeln('Ingrese su legajo');
	readln(a.legajo);
	if (a.legajo<>0) then begin
		writeln('Ingrese su DNI');
		readln(a.dni);
		writeln('Ingrese su año de ingreso');
		readln(a.anio);
		leerFinal(f);
		agregarFinal(a.notas,f);
	end;
end;

procedure cargarArbol(var a:arbol;alu:alumno);
begin
	if(a=nil) then begin
		new(a);
		a^.dato:=alu;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(alu.legajo<=a^.dato.legajo)then
			cargarArbol(a^.HI,alu)
		else
			cargarArbol(a^.HD,alu);
end;

procedure consginaA(var a:arbol);
var alu:alumno;
begin
	leerAlumno(alu);
	while(alu.legajo<>0)do begin
		cargarArbol(a,alu);
		leerAlumno(alu);
	end;
end;

procedure consignaB(a:arbol; var l:listaB);
	
	procedure agregarLista(a:alumno; var l:listaB);
	var n:listaB;
	begin
		new(n);
		n^.dato.dni:=a.dni;
		n^.dato.anio:=a.anio;
		n^.sig:=l;
		l:=n;
	end;
	
	procedure buscarLeg(a:arbol; var l:listaB; leg:integer);
	begin
		if(a<>nil)then begin
			if(leg<=a^.dato.legajo)then begin
				agregarLista(a^.dato,l);
				buscarLeg(a^.HI,l,leg);
				buscarLeg(a^.HD,l,leg);
			end
			else
				buscarLeg(a^.HI,l,leg);
		end;
	end;

var leg:integer;
begin
	writeln('Ingrese un legajo');
	readln(leg);
	buscarLeg(a,l,leg);
end;

procedure consignaC(a:arbol);
	
	function legajoGrande(a:arbol):integer;
	begin
		if (a^.HD<>nil) then
			legajoGrande:=legajoGrande(a^.HD)
		else legajoGrande:=a^.dato.legajo;
	end;

begin
	writeln('El legajo mas grande es: ',legajoGrande(a));
end;

procedure consignaD(a:arbol);

	procedure actualizarMaximo(dni:integer; var maxDni:integer);
	begin
		if (dni>maxDni) then
			maxDni:=dni;
	end;

	procedure dniGrande(a:arbol; var maxDni:integer);
	begin
		if(a<>nil)then begin
			actualizarMaximo(a^.dato.dni,maxDni);
			dniGrande(a^.HI,maxDni);
			dniGrande(a^.HD,maxDni);
		end;
	end;
	
var dniMax:integer;
begin
	dniMax:=-1;
	dniGrande(a,dniMax);
	if(dniMax<>-1)then
		writeln('El DNI mas grande es: ', dniMax)
	else
		writeln('No hay alumnos en el arbol');
end;

procedure consignaE(a:arbol);
	
	function calcularImpar(l:integer):integer;
	begin
		if (l mod 2=1) then
			calcularImpar:=1
		else calcularImpar:=0;
	end;
	
	function legImpar(a:arbol):integer;
	begin
		if(a<>nil)then
			legImpar:=calcularImpar(a^.dato.legajo)+legImpar(a^.HI)+legImpar(a^.HD)
		else legImpar:=0;
	end;
	
begin
	writeln('La cantidad de alumnos con legajo impar es :', legImpar(a));
end;
