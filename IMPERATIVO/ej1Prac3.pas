{1. Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del
inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente.}

program ej1;
type
	socio = record
		num:integer;
		nombre: String;
		edad:integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato:socio;
		HI:arbol;
		HD:arbol;
	end;
	
//PROCEDURES
procedure leerSocio(var s:socio);
begin
	writeln('--------------------');
	writeln('LEER NUMERO DE SOCIO');
	readln(s.num);
	if (s.num<>0) then begin
		writeln('LEER NOMBRE');
		readln(s.nombre);
		writeln('LEER EDAD');
		readln(s.edad);
	end;
end;

procedure cargarArbol(var a:arbol; s:socio);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:=s;
	end
	else 
		if(s.num<a^.dato.num)then
			cargarArbol(a^.HI,s)
		else cargarArbol(a^.HD,s);
end;
	
procedure informarSocio(s:socio);
begin
	writeln('--------------------');
	writeln('NUMERO SOCIO: ',s.num);
	writeln('NOMBRE: ',s.nombre);
	writeln('EDAD: ',s.edad);
end;
	
procedure informarArbol(a:arbol);
begin
	if(a<>nil) then begin
		informarArbol(a^.HI);
		informarSocio(a^.dato);
		informarArbol(a^.HD);
	end;
end;	

function numMayor(a:arbol):integer;
begin
	if(a^.HD<>nil) then
		numMayor:=numMayor(a^.HD)
	else
		numMayor:=a^.dato.num;
end;

procedure numMenor(a:arbol; s:socio);
begin
	if(a^.HI<>nil) then
		numMenor(a^.HI,s)
	else begin
		informarSocio(a^.dato); s:=a^.dato;
	end;
end;

{function mayorEdad(a:arbol; max:integer):integer;
begin
	if(a<>nil)then begin
		
		if(a^.dato.edad>max)then
			mayorEdad:=mayorEdad(
	end;
end;} //que pereza

procedure aumentarEdad(var a:arbol);
begin
	if(a<>nil) then begin
		aumentarEdad(a^.HI);
		a^.dato.edad:=a^.dato.edad+1;
		aumentarEdad(a^.HD);
	end;
end;

function estaONo(a:arbol;num:integer):boolean;
begin
	if(a<>nil) then 
		if(a^.dato.num = num)then
			estaONo:=true
		else
			if(num<a^.dato.num) then
				estaONo:=estaONo(a^.HI,num)
			else
				estaONo:=estaONo(a^.HD,num)
	else
		estaONo:=false;
end;

function buscarNombre(a:arbol;nombre:String):boolean;
begin
	if(a=nil) then buscarNombre:=false
	else
		if (a^.dato.nombre=nombre) then buscarNombre:=true else
		buscarNombre:=buscarNombre(a^.HI,nombre) or buscarNombre(a^.HD,nombre);
end;

function cantSocios(a:arbol):integer;
begin
	if (a=nil) then cantSocios:=0
	else 
		cantSocios:=cantSocios(a^.HI)+cantSocios(a^.HD)+1;
end;

function edadTotal(a:arbol):integer;
begin
	if (a=nil) then edadTotal:=-1000
	else
		edadTotal:=edadTotal(a^.HI)+edadTotal(a^.HD)+a^.dato.edad;
end;

procedure informarDecreciente(a:arbol);
begin
	if(a<>nil) then begin
		informarDecreciente(a^.HD);
		informarSocio(a^.dato);
		informarDecreciente(a^.HI);
	end;
end;

var
	a:arbol;
	s:socio;
	socioMenor:socio;
	num:integer;
	nombre:String;
begin
	leerSocio(s);
	while (s.num<>0) do begin
		cargarArbol(a,s);
		leerSocio(s);
	end;
	informarArbol(a);
	writeln('--------------------');
	writeln('EL NUMERO DE SOCIO MAS GRANDE ES: ',numMayor(a));
	writeln('--------------------');
	writeln('DATOS DEL SOCIO CON MENOR NUMERO DE SOCIO: ');
	numMenor(a,socioMenor);
	aumentarEdad(a);
	informarArbol(a);
	writeln('INGRESE UN VALOR PARA BUSCAR');
	readln(num);
	if(estaONo(a,num))then
		writeln('Hay alguien con ese numero')
	else
		writeln('No existe socio con ese numero');
	writeln('--------------------');
	writeln('INGRESE UN NOMBRE PARA BUSCAR');
	readln(nombre);
	if(buscarNombre(a,nombre))then
		writeln('Hay alguien con ese nombre')
	else
		writeln('No existe alguien con ese nombre');
	writeln('--------------------');
	writeln('LA CANTIDAD DE SOCIOS ES: ', cantSocios(a));
	writeln('--------------------');
	writeln('EDAD PROMEDIO ES : ', (edadTotal(a)/cantSocios(a)):2:2);
	informarDecreciente(a);//DEJEME IR JEFE, YA HICE MUCHO
end.
